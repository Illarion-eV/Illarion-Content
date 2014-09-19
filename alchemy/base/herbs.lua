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

local M = {}


function M.UseItem(User, SourceItem, ltstate)

    -- infront of a cauldron?
	local cauldron = alchemy.GetCauldronInfront(User)
    if cauldron then

        if licence.licence(User) then --checks if user is citizen or has a licence
			return -- avoids crafting if user is neither citizen nor has a licence
		end

		-- is the char an alchemist?
	    local anAlchemist = alchemy.CheckIfAlchemist(User)
		if not anAlchemist then
		    User:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
			return
	    end

		if ( User:increaseAttrib("perception",0) + User:increaseAttrib("essence",0) + User:increaseAttrib("intelligence",0) ) < 30 then
		User:inform("Verstand, ein gutes Auge und ein Gespür für die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten könntest.",
		            "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
	                )
		    return
        end

		if not alchemy.checkFood(User) then
			return
		end

        if ( ltstate == Action.abort ) then
		    common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	        return
	    end

	    if (ltstate == Action.none) then
		   local duration,gfxId,gfxIntervall,sfxId,sfxIntervall = alchemy.GetStartAction(User, "plant", cauldron)
		   User:startAction(duration,gfxId,gfxIntervall,sfxId,sfxIntervall)
		   return
	    end

		BeginnBrewing(User,SourceItem.id,cauldron)
		world:erase(SourceItem,1)
		alchemy.lowerFood(User)
	else
	    -- not infront of cauldron, maybe do something else with herbs
        return
	end
end

function BeginnBrewing(User,plantId,cauldron)

	local isPlant, ignoreIt = alchemy.getPlantSubstance(plantId, User)
	if isPlant then
		BrewingPlant(User,plantId,cauldron)
	elseif plantId == 157 then
		BrewingFilter(User,cauldron)
	end

end

function PlantInEssenceBrew(User,plantId,cauldron)
    local success = nil
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
	    alchemy.CauldronDestruction(User,cauldron,2)
	end
end

function PlantInStock(User,plantId,cauldron)
    local substance = alchemy.wirkstoff
		for i=1,8 do
		    if cauldron:getData(substance[i].."Concentration") == "" then
			    cauldron:setData(substance[i].."Concentration","5")
			end
        end
	local plusSubstance, minusSubstance = alchemy.getPlantSubstance(plantId, User)
	if plusSubstance == "" and minusSubstance == "" then
	    alchemy.CauldronDestruction(User,cauldron,1)
	else
	    if plusSubstance ~= "" then
		    local oldConcentration = tonumber(cauldron:getData(plusSubstance.."Concentration"))
			if oldConcentration == nil then
			    oldConcentration = 5
			end
            local newConcentration = oldConcentration + 1
            if newConcentration > 9 then
                alchemy.CauldronDestruction(User,cauldron,2)
			    return
			else
                cauldron:setData(plusSubstance.."Concentration",newConcentration)
                cauldron.id = 1012
				cauldron:setData("filledWith","stock")
			end
	    end
		if minusSubstance ~= "" then
		    local oldConcentration = tonumber(cauldron:getData(minusSubstance.."Concentration"))
			if oldConcentration == nil then
			    oldConcentration = 5
			end

            local newConcentration = oldConcentration - 1
            if newConcentration < 1 then
                alchemy.CauldronDestruction(User,cauldron,2)
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

function BrewingPlant(User,plantId,cauldron)
    world:makeSound(10,cauldron.pos)
	if cauldron:getData("filledWith") == "potion" then -- potion in cauldron, failure
        alchemy.CauldronDestruction(User,cauldron,1)

	elseif cauldron:getData("filledWith")== "essenceBrew" then -- essence brew
		PlantInEssenceBrew(User,plantId,cauldron)
		User:learn(Character.alchemy, 50/2, 100)

	elseif (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "water") then -- water or a stock we put the herb in
	    PlantInStock(User,plantId,cauldron)
		User:learn(Character.alchemy, 50/2, 100)

	else -- there is nothing in the cauldron to put the herb in, failure
	    common.InformNLS(User, "Die Pflanze vertrocknet auf dem Boden des heißen Kessels und zerfällt zu Asche.",
		                            "The plant dries up on the hot bottom of the cauldron and falls to ashes.")
        world:makeSound(7,cauldron.pos)
	end
end

function FilterStock(User,cauldron)
    local success = false
	local mySubstance = alchemy.wirkstoff
	for i=1,8 do
	    local oldConcentration = tonumber(cauldron:getData(mySubstance[i].."Concentration"))
		if oldConcentration ~= nil then
		    if oldConcentration > 5 then
			    cauldron:setData(mySubstance[i].."Concentration",oldConcentration-1)
				success = true
			elseif oldConcentration < 5 then
			    cauldron:setData(mySubstance[i].."Concentration",oldConcentration+1)
				success = true
            end
        end
	end
	world:changeItem(cauldron)
    if success == false then
        alchemy.CauldronDestruction(User,cauldron,2)
	end
end

function BrewingFilter(User,cauldron)
    world:makeSound(10,cauldron.pos)
	if cauldron:getData("filledWith") == "potion" then -- potion in cauldron, failure
        alchemy.CauldronDestruction(User,cauldron,1)

	elseif cauldron:getData("filledWith")=="essenceBrew" then -- essence brew in cauldron, failure
        alchemy.CauldronDestruction(User,cauldron,1)

	elseif cauldron:getData("filledWith")=="water" then
        alchemy.CauldronDestruction(User,cauldron,1)

	elseif cauldron:getData("filledWith")=="stock" then -- stock, let's filter
	    FilterStock(User,cauldron)
		User:learn(Character.alchemy, 50/2, 100)

    else -- empty cauldron
        common.InformNLS(User, "Die Pflanze vertrocknet auf dem Boden des heißen Kessels und zerfällt zu Asche",
		                            "The plant dries up on the hot bottom of the cauldron and falls to ashes.")
	end
end

return M

