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
-- UPDATE common SET com_script='alchemy.item.id_166_pink_bottle' WHERE com_itemid = 166;

-- Pink potions
-- hitpoint / mana / food / poison effects instantly and over time ("Healing potions" etc)

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local lookat = require("base.lookat")
local granorsHut = require("content.granorsHut")
local customPotion = require("alchemy.base.customPotion")

local M = {}

local topBorder = {7000       ,7000  ,50000      ,10000        ,7000         ,7000    ,50000        ,10000}
local attribList ={"hitpoints","mana","foodlevel","poisonvalue","hitpointsOT","manaOT","foodlevelOT","poisonvalueOT"}

local function GenerateEffectMessage(user,dataZList)
    local effectMessageDE = ""
    local effectMessageEN = ""
    local anyEffect = false

    local ListPositiveEffectDE = {"Deine Lebenskraft nimmt sofort zu."   ,"Dein Mana nimmt sofort zu."   ,"Du f�hlst dich sofort satter."      ,"Das Gift in dir wird geschw�cht."       ,"Deine Lebenskraft nimmt mit der Zeit zu.","Dein Mana nimmt mit der Zeit zu.","Mit der Zeit nimmt dein Hunger ab.","Das Gift in dir wird mit der Zeit schw�cher."}
    local ListNegativeEffectDE = {"Deine Lebenskraft nimmt sofort ab."   ,"Dein Mana nimmt sofort ab."   ,"Du f�hlst dich pl�tlzich hungriger.","Gift breitet sich in dir aus."          ,"Deine Lebenskraft nimmt mit der Zeit ab.","Dein Mana nimmt mit der Zeit ab.","Mit der Zeit nimmt dein Hunger zu.","Mit der Zeit breitet sich ein st�rker werdendes Gift aus."}
    local ListPositiveEffectEN = {"Your life energy increases instantly.","Your mana increases instantly.","You feel instantly more sated."     ,"The poison in you is instantly weakened.","Your life energy increases with time."   ,"Your mana increases with time."  ,"Your hunger decreases with time."  ,"The poison is weakened with time."}
    local ListNegativeEffectEN = {"Your life energy decreases instantly.","Your mana decreases instantly.","You feel instantly more hungry."    ,"You are poisoned."                      ,"Your life energy decreases with time."   ,"Your mana decreases with time."  ,"Your hunger increases with time."  ,"Over time, a stronger poison spreads in your body."}

    for i=1,8 do
        if (dataZList[i] > 5) then
           effectMessageDE = effectMessageDE.." "..ListPositiveEffectDE[i]
           effectMessageEN = effectMessageEN.." "..ListPositiveEffectEN[i]
           anyEffect = true
       elseif (dataZList[i] < 5) then
            effectMessageDE = effectMessageDE.." "..ListNegativeEffectDE[i]
            effectMessageEN = effectMessageEN.." "..ListNegativeEffectEN[i]
            anyEffect = true
       end
    end
    if anyEffect == false then
        effectMessageDE = "Du sp�rst keine Wirkung."
        effectMessageEN = "You don't feel any effect."
    end
    common.InformNLS(user,effectMessageDE,effectMessageEN);
end

local function DrinkPotion(user,SourceItem)
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gef�hl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
        return

    elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer

        -- there is already an effect; sadly,therefore, the current potion will have no effect
        local foundEffect = user.effects:find(166)
        if foundEffect then
            common.InformNLS(user, "Du hast nicht das Gef�hl, dass etwas passiert. Scheinbar verhindert der bereits wirkende Heiltrank weitere Effekte.",
            "You don't have the feeling that something happens. It seems that the already affecting healing potion prevents other effects.")
            return
        end

        local dataZList = alchemy.SplitData(user,potionEffectId)
        -- taste and effect message
        alchemy.generateTasteMessage(user,dataZList)
        GenerateEffectMessage(user,dataZList)

        local hitpointsOT, poisonvalueOT, manaOT, foodlevelOT
        for i=1,8 do

            local Val = (dataZList[i]-5) * (topBorder[i]/5) * common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );

            if ( attribList[i] == "hitpointsOT" ) then
                hitpointsOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "poisonvalueOT" ) then
                   poisonvalueOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "manaOT" ) then
                   manaOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "foodlevelOT" ) then
                   foodlevelOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "poisonvalue" ) then
                Val = common.Limit( (user:getPoisonValue() - Val) , 0, 10000 );
                user:setPoisonValue( Val );
            else
                user:increaseAttrib(attribList[i],Val);
            end
        end
        -- LTE
        local myEffect=LongTimeEffect(166,70);
        -- now we add the values
        if hitpointsOT < 0 then
            myEffect:addValue("hitpointsDecrease",hitpointsOT*-1)
        else
            myEffect:addValue("hitpointsIncrease",hitpointsOT)
        end
        if manaOT < 0 then
            myEffect:addValue("manaDecrease",manaOT*-1)
        else
            myEffect:addValue("manaIncrease",manaOT)
        end
        if foodlevelOT < 0 then
            myEffect:addValue("foodlevelDecrease",foodlevelOT*-1)
        else
            myEffect:addValue("foodlevelIncrease",foodlevelOT)
        end
        if poisonvalueOT < 0 then
            myEffect:addValue("poisonvalueDecrease",poisonvalueOT*-1)
        else
            myEffect:addValue("poisonvalueIncrease",poisonvalueOT)
        end
       myEffect:addValue("counterPink",5)
       user.effects:addEffect(myEffect)

    elseif potionEffectId == 10 then
        -- potion to spit fire

        -- there is already a fire spitting potion effect going on
        -- char pukes out a flame on the map, no further effect added
        local foundEffect = user.effects:find(60)
        if foundEffect then
            common.InformNLS(user, "Sofort steigt Hitze und Erbrochenes in dir auf.",
            "Immediately, your body heats up and and some stomach contents comes up.")
            user:talk(Character.say, "#me �bergibt sich und spuckt dabei einen gro�en Feuerball aus.", "#me throws up and pukes out a big fireball.")
            local frontPos = common.GetFrontPosition(user)
            world:makeSound(5,frontPos)
            world:gfx(9,frontPos)
            world:createItemFromId(359,1,frontPos,true,333,nil)
            local effectRemoved = user.effects:removeEffect(60)
            if not effectRemoved then
                common.InformNLS( user,"Fehler: Informiere einen Dev.", "Error: Inform a dev.")
                return
            end
            return
        end
        -- inform and add effect
        user:inform("Die Fl�ssigkeit l�uft deine Kehle hinunter und sofort merkst du ein starkes Brennen.",
                    "The potion runs down your throat and immediately, you get the feeling that throat was on fire.")

        -- quality determines length until char spits fire (better quality, shorter time)
        local firstCall = (20-(math.floor(SourceItem.quality/100)*1.5))*10

        local myEffect=LongTimeEffect(60,firstCall)
        myEffect:addValue("quality",math.floor(SourceItem.quality/100))
        user.effects:addEffect(myEffect)
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
        user:talk(Character.say, "#me trinkt eine violette Fl�ssigkeit.", "#me drinks a violet liquid.")
        user.movepoints=user.movepoints - 20
        DrinkPotion(user,SourceItem) -- call effect
        alchemy.EmptyBottle(user,SourceItem)
    end
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end
return M

