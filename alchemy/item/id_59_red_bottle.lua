--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- UPDATE common SET com_script='alchemy.item.id_59_red_bottle' WHERE com_itemid = 59;

-- Red Potions
-- Attribute changers ("Strength Potion", etc)

local lookat = require("base.lookat")
local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local granorsHut = require("content.granorsHut")
local customPotion = require("alchemy.base.customPotion")

local M = {}

M.attribList   ={"strength","intelligence","dexterity"       ,"perception"  ,"constitution","essence","agility"      ,"willpower"}
M.attribListDe ={"St�rke"  ,"Intelligenz" ,"Geschicklichkeit","Wahrnehmung" ,"Ausdauer"    ,"Essenz" ,"Schnelligkeit","Willenskraft"}

M.intensityListDe = {"stark"   ,"merkbar"  ,"leicht"  ,"kaum merklich"   ,"","kaum merklich"   ,"leicht"  ,"merkbar"  ,"stark"}
M.intensityListEn = {"strongly","noticably","slightly","barely noticably","","barely noticable","slightly","noticably","strongly"}

local function GenerateEffectMessage(user,dataZList)
    local effectMessagesDe = ""
    local effectMessagesEn = ""
    local anyEffect = false

    local attribEn, attribDe, nPTagEn, nPTagDe, attribIntensityEn, attribIntensityDe
    for i=1,8 do
        if dataZList[i] ~= 5 then

            attribEn = M.attribList[i] -- attribute
            attribDe = M.attribListDe[i]
            if dataZList[i] > 5 then
                nPTagEn = "in" -- increasing
                nPTagDe = "zu"
            else
                nPTagEn = "de" -- decreasing
                nPTagDe = "ab"
            end
            attribIntensityEn = M.intensityListEn[dataZList[i]] -- how strong it is in/decreased
            attribIntensityDe = M.intensityListDe[dataZList[i]]
            anyEffect = true
            -- we put everything together
            effectMessagesDe = effectMessagesDe.."Deine "..attribDe.." nimmt".." "..attribIntensityDe.." "..nPTagDe..". "
            effectMessagesEn = effectMessagesEn.."Your "..attribEn.." "..nPTagEn.."creases "..attribIntensityEn..". "
        end
    end
    if anyEffect == false then -- no effect
        common.InformNLS(user,"Du sp�rst keine Wirkung.","You don't feel any effect.")
    else
        common.InformNLS(user,effectMessagesDe,effectMessagesEn)
    end
end

local function DrinkPotion(user,SourceItem)
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gef�hl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
        return

    elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer
          -- there is already an effect, we remove it
        local foundEffect, myEffect = user.effects:find(59)
        if foundEffect then
            local findsight = myEffect:findValue("sightpotion")
            if findsight then
                common.InformNLS(user, "Deine Augen f�hlen sich wieder normal an und der St�rkungstrank beginnt zu wirken.",
                "Your eyes feel normal again and the strengthening potions starts to take effect.")
            else
                common.InformNLS(user, "Du sp�rst, dass der alte St�rkungstrank seine Wirkung verliert und wie der neue zu wirken einsetzt.",
                "You feel that the old strengthening potion loses its effect and how the new one takes effect.")
            end
            user.effects:removeEffect(59)
        end
        local myEffectDuration = math.floor(SourceItem.quality/100)*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration
        myEffect = LongTimeEffect(59,myEffectDuration) -- new effect

        local dataZList = alchemy.SplitData(user,potionEffectId)
        alchemy.generateTasteMessage(user,dataZList) -- potion taste
        GenerateEffectMessage(user,dataZList) -- inform about the effects

        foundEffect = user.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
        if not foundEffect then
            user.effects:addEffect(myEffect)
        end
    elseif potionEffectId >= 5911111111 and potionEffectId <= 5999999999 then
        local foundEffect = user.effects:find(59)
        if foundEffect then
            user.effects:removeEffect(59)
            common.InformNLS(user, "Du sp�rst, dass der Trank seine Wirkung verliert. Deine Augen beginnen sich seltsam anzuf�hlen.",
            "You feel that the old potion loses its effect. You eyes start to feel strange.")
        end
        local myEffectDuration = math.floor(SourceItem.quality/100)*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration
        local myEffect = LongTimeEffect(59,myEffectDuration) -- new effect

        myEffect:addValue("sightpotion",potionEffectId-5900000000)

        foundEffect = user.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
        if not foundEffect then
            user.effects:addEffect(myEffect)
        end
    end

    if SourceItem:getData("granorsHut") ~= "" then
        granorsHut.potionReplacer()
    end
end

function M.UseItem(user, SourceItem, ltstate)
    if SourceItem:getData("customPotion") ~= "" then
        customPotion.drinkInform(user, SourceItem)
    end
    -- repair potion in case it's broken
    alchemy.repairPotion(SourceItem)
    -- repair end

    if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
        return -- no potion, no essencebrew, something else
    end

    local cauldron = alchemy.GetCauldronInfront(user)
    if cauldron then -- infront of a cauldron?
        alchemy.FillIntoCauldron(user,SourceItem,cauldron,ltstate)

    else -- not infront of a cauldron, therefore drink!
        user:talk(Character.say, "#me trinkt eine rote Fl�ssigkeit.", "#me drinks a red liquid.")
        user.movepoints=user.movepoints - 20
        DrinkPotion(user,SourceItem) -- call effect
        alchemy.EmptyBottle(user,SourceItem)
    end
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end

return M


