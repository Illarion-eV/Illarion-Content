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
-- herbs
-- alchemy system: using a herb infront of a cauldron - brewing

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
            user:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
            return
        end

        if ( user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30 then
        user:inform("Verstand, ein gutes Auge und ein Gespür für die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten könntest.",
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

        local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = alchemy.GetStartAction(user, {key = "ingredient", value = SourceItem.id}, cauldron)

        if (ltstate == Action.none) then
            if alchemy.canUseHerb(user, SourceItem.id) then
                user:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall)
            end
            return
        end

        M.BeginnBrewing(user,false, SourceItem,cauldron)
        alchemy.lowerFood(user)
        shared.toolBreaks(user, tool, duration)
    else
        -- not infront of cauldron, maybe do something else with herbs
        return
    end
end

local function PlantInEssenceBrew(user,plantId,cauldron)
    local success
    for i=1,8 do
        if cauldron:getData("essenceHerb"..i) == "" then
            cauldron:setData("essenceHerb"..i,plantId)
            success = true
            break
        end
    end

    if success then
        world:changeItem(cauldron)
    else
        alchemy.CauldronDestruction(user,cauldron,2)
    end
end

local function PlantInStock(user,plantId,cauldron)

        for i=1,8 do
            if cauldron:getData(alchemy.substances[i].."Concentration") == "" then
                cauldron:setData(alchemy.substances[i].."Concentration","5")
            end
        end
    local plusSubstance, minusSubstance = alchemy.getPlantSubstance(plantId)
    if plusSubstance == "" and minusSubstance == "" then
        alchemy.CauldronDestruction(user,cauldron,1)
    else
        if not common.IsNilOrEmpty(plusSubstance) then
            local oldConcentration = tonumber(cauldron:getData(plusSubstance.."Concentration"))
            if oldConcentration == nil then
                oldConcentration = 5
            end
            local newConcentration = oldConcentration + 1
            if newConcentration > 9 then
                alchemy.CauldronDestruction(user,cauldron,2)
                return
            else
                cauldron:setData(plusSubstance.."Concentration",newConcentration)
                cauldron.id = 1012
                cauldron:setData("filledWith","stock")
            end
        end
        if not common.IsNilOrEmpty(minusSubstance) then
            local oldConcentration = tonumber(cauldron:getData(minusSubstance.."Concentration"))
            if oldConcentration == nil then
                oldConcentration = 5
            end

            local newConcentration = oldConcentration - 1
            if newConcentration < 1 then
                alchemy.CauldronDestruction(user,cauldron,2)
                return
            else
                cauldron:setData(minusSubstance.."Concentration",newConcentration)
                cauldron.id = 1012
                cauldron:setData("filledWith","stock")
            end
        end
        world:changeItem(cauldron)
    end
end

local function BrewingPlant(user,plantId,cauldron, saved)
    world:makeSound(10,cauldron.pos)
    if cauldron:getData("filledWith") == "potion" then -- potion in cauldron, failure
        alchemy.CauldronDestruction(user,cauldron,1)

    elseif cauldron:getData("filledWith")== "essenceBrew" then -- essence brew
        PlantInEssenceBrew(user,plantId,cauldron)
        user:learn(Character.alchemy, 50/2, 100)

    elseif (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "water") then -- water or a stock we put the herb in
        PlantInStock(user,plantId,cauldron)
        user:learn(Character.alchemy, 50/2, 100)

    elseif not saved then -- empty cauldron
        common.InformNLS(user, "Die Pflanze vertrocknet auf dem Boden des heißen Kessels und zerfällt zu Asche",
                                    "The plant dries up on the hot bottom of the cauldron and falls to ashes.")
    else
        common.InformNLS(user, "Als du die Pflanze auf den heißen Boden des Kessels fallen lässt, aktiviert sich deine Glyphe glücklicherweise und bewahrt sie davor, zu Asche zu zerfallen.",
                                    "As you drop the plant on to the hot bottom of the cauldron, your glyph luckily activates to save it from turning into ashes.")
    end
end

local function FilterStock(user,cauldron)
    local success = false

    for i=1,8 do
        local oldConcentration = tonumber(cauldron:getData(alchemy.substances[i].."Concentration"))
        if oldConcentration ~= nil then
            if oldConcentration > 5 then
                cauldron:setData(alchemy.substances[i].."Concentration",oldConcentration-1)
                success = true
            elseif oldConcentration < 5 then
                cauldron:setData(alchemy.substances[i].."Concentration",oldConcentration+1)
                success = true
            end
        end
    end
    world:changeItem(cauldron)
    if success == false then
        alchemy.CauldronDestruction(user,cauldron,2)
    end
end

local function BrewingFilter(user,cauldron, saved)
    world:makeSound(10,cauldron.pos)
    if cauldron:getData("filledWith") == "potion" then -- potion in cauldron, failure
        alchemy.CauldronDestruction(user,cauldron,1)

    elseif cauldron:getData("filledWith")=="essenceBrew" then -- essence brew in cauldron, failure
        alchemy.CauldronDestruction(user,cauldron,1)

    elseif cauldron:getData("filledWith")=="water" then
        alchemy.CauldronDestruction(user,cauldron,1)

    elseif cauldron:getData("filledWith")=="stock" then -- stock, let's filter
        FilterStock(user,cauldron)
        user:learn(Character.alchemy, 50/2, 100)

    elseif not saved then -- empty cauldron
        common.InformNLS(user, "Die Pflanze vertrocknet auf dem Boden des heißen Kessels und zerfällt zu Asche",
                                    "The plant dries up on the hot bottom of the cauldron and falls to ashes.")
    else
        common.InformNLS(user, "Als du die Pflanze auf den heißen Boden des Kessels fallen lässt, aktiviert sich deine Glyphe glücklicherweise und bewahrt sie davor, zu Asche zu zerfallen.",
                                    "As you drop the plant on to the hot bottom of the cauldron, your glyph luckily activates to save it from turning into ashes.")
    end
end

function M.BeginnBrewing(user,plantId, plantItem, cauldron)

    if plantItem then
        plantId = plantItem.id
    end

    local plus, minus = alchemy.getPlantSubstance(plantId)

    local isPlant = plus or minus

    local saved = daear.saveResource(user, world:getItemStatsFromId(plantId).Level, 1)

    local rareness = 1

    if not saved then

        if plantItem then
            rareness = 1
            local rarity = plantItem:getData("rareness")
            if not common.IsNilOrEmpty(rarity) and plantItem:getData("craftedRare") == "true" then
                rareness = tonumber(rarity)
            end
            world:erase(plantItem, 1)
        else
            local erased = user:eraseItem(plantId,1,{craftedRare = "true", rareness = 4})

            if erased > 0 then
                erased = user:eraseItem(plantId,1,{craftedRare = "true", rareness = 3})
                if erased > 0 then
                    erased = user:eraseItem(plantId,1,{craftedRare = "true", rareness = 2})
                    if erased > 0 then
                        user:eraseItem(plantId,1,{})
                    else
                        rareness = 2
                    end
                else
                    rareness = 3
                end
            else
                rareness = 4
            end

        end
    end

    local herbsUsed = cauldron:getData("herbsUsed")
    local totalRareCount = cauldron:getData("totalRareCount")

    if common.IsNilOrEmpty(herbsUsed) then
        herbsUsed = 0
    else
        herbsUsed = tonumber(herbsUsed)
    end

    if common.IsNilOrEmpty(totalRareCount) then
        totalRareCount = 0
    else
        totalRareCount = tonumber(totalRareCount)
    end

    cauldron:setData("herbsUsed", herbsUsed+1)
    cauldron:setData("totalRareCount", totalRareCount + rareness)
    world:changeItem(cauldron)

    if isPlant then
        BrewingPlant(user,plantId,cauldron, saved)
    elseif plantId == 157 then
        BrewingFilter(user,cauldron, saved)
    end
end

return M
