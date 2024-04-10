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
-- gemdust
-- alchemy system: using gemdust infront of a cauldron - creating essence brew or enchant a stock

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local licence = require("base.licence")
local shared = require("craft.base.shared")
local daear = require("magic.arcane.enchanting.effects.daear")

local M = {}

function M.UseItem(user, SourceItem, ltstate)

    -- infront of a cauldron?
    local cauldron = alchemy.GetCauldronInfront(user)
    local tool = alchemy.getAlchemyTool(user)

    if cauldron then

        if licence.licence(user) then --checks if user is citizen or has a licence
            return -- avoids crafting if user is neither citizen nor has a licence
        end

        -- is the char an alchemist?
        local anAlchemist = alchemy.CheckIfAlchemist(user)
        if not anAlchemist then
            user:inform("Nur jene, die in die Kunst der Alchemie eingef�hrt worden sind, k�nnen hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
            return
        end

        if ( user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30 then
        user:inform("Verstand, ein gutes Auge und ein Gesp�r f�r die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten k�nntest.",
                    "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
                    )
            return
        end

        if not alchemy.checkFood(user) then
            return
        end

        if ( ltstate == Action.abort ) then
            common.InformNLS(user, "Du brichst deine Arbeit ab.", "You abort your work.")
            return
        end

        local worktime = 50

        if (ltstate == Action.none) then
           user:startAction(worktime,21,5,15,25);
           return
        end

        M.BrewingGemDust(user,false, SourceItem,cauldron)
        alchemy.lowerFood(user)
        shared.toolBreaks(user, tool, worktime)
    else
        -- not infront of cauldron, maybe do something else with herbs
        return
    end
end

local function GemDustInStock(user,cauldron,gemDustId)
    -- stock + gemdust = potion

    local potionEffectId = ""
    local addCon
    if (gemDustId == 447) or (gemDustId == 450) then  -- secondary and primary attribute potions
        local mySubstances = alchemy.wirkstoff
        for i=1,8 do
            addCon = (cauldron:getData(mySubstances[i].."Concentration")) -- stock conncentration determines the effect
            if addCon == "" then
                addCon = 5
            end
            potionEffectId = potionEffectId..addCon
        end
    else
        potionEffectId = 0 -- every other potion kind has NO effect
    end
    local _, _, reCauldron = alchemy.GemDustBottleCauldron(nil, gemDustId, nil, nil)
    cauldron.id = reCauldron
    alchemy.SetQuality(user, cauldron)
    cauldron:setData("creator",user.name)
    cauldron:setData("potionEffectId",""..potionEffectId)
    cauldron:setData("filledWith","potion")
    world:changeItem(cauldron)
    world:makeSound(13,cauldron.pos)
    world:gfx(52,cauldron.pos)
end

local function GemDustInWater(user,cauldron,gemDustId)
    -- water + gemdust = essence brew

    cauldron:setData("filledWith","essenceBrew")
    local _, _, reCauldron = alchemy.GemDustBottleCauldron(nil, gemDustId, nil, nil)
    cauldron.id = reCauldron
    world:changeItem(cauldron)
    world:makeSound(13,cauldron.pos)
    world:gfx(52,cauldron.pos)

end

function M.BrewingGemDust(user,gemDustId, gemDust, cauldron)

    if gemDust then
        gemDustId = gemDust.id
    end

    local saved = daear.saveResource(user, world:getItemStatsFromId(gemDustId).Level, 1)

    if not saved then

        if gemDust then
            world:erase(gemDust, 1)
        else
            user:eraseItem(gemDustId,1,{})
        end
    end

    if cauldron:getData("filledWith")=="potion" then -- potion in cauldron, failure
        alchemy.CauldronDestruction(user,cauldron,2)

    elseif cauldron:getData("filledWith")=="essenceBrew" then -- essence brew in cauldron, failure
        alchemy.CauldronDestruction(user,cauldron,2)

    elseif cauldron:getData("filledWith") == "stock" then -- create a potion
        GemDustInStock(user,cauldron,gemDustId)
        user:learn(Character.alchemy, 50/2, 100)

    elseif cauldron:getData("filledWith")=="water" then -- create an essence brew
        GemDustInWater(user,cauldron,gemDustId)
        user:learn(Character.alchemy, 50/2, 100)

    elseif not saved then -- nothing in the cauldron and not saved
        common.InformNLS(user, "Der Edelsteinstaub verdampft sich, als du ihn in den leeren Kessel sch�ttest.",
                                    "The gem dust dissipates, as you fill it into the empty cauldron.")
    else    --nothing in the cauldron but was saved by glyph effect
        common.InformNLS(user, "W�hrend du den Edelsteinstaub in den leeren Kessel f�llst, aktiviert sich deine Glyphe und bewahrt ihn vor dem Verdampfen.",
                                    "As you fill the gem dust into the empty cauldron, your glyph luckily activates to save it from dissipating.")
    end


end

return M
