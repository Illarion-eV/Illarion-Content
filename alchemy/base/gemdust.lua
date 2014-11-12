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
		   User:startAction(50,21,5,15,25);
		   return
		end
		
		BrewingGemDust(User,SourceItem.id,cauldron)
		world:erase(SourceItem,1)
		alchemy.lowerFood(User)
	else
	    -- not infront of cauldron, maybe do something else with herbs
        return
	end
end

function GemDustInStock(User,cauldron,gemDustId)
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
    local reGem, reGemdust, reCauldron, reBottle = alchemy.GemDustBottleCauldron(nil, gemDustId, nil, nil)
	cauldron.id = reCauldron
	alchemy.SetQuality(User, cauldron)
	cauldron:setData("potionEffectId",""..potionEffectId)
	cauldron:setData("filledWith","potion")
	world:changeItem(cauldron)
	world:makeSound(13,cauldron.pos)
	world:gfx(52,cauldron.pos)
end

function GemDustInWater(User,cauldron,gemDustId)
    -- water + gemdust = essence brew
	
	cauldron:setData("filledWith","essenceBrew")
	local reGem, reGemdust, reCauldron, reBottle = alchemy.GemDustBottleCauldron(nil, gemDustId, nil, nil)
	cauldron.id = reCauldron
	world:changeItem(cauldron)
	world:makeSound(13,cauldron.pos)
	world:gfx(52,cauldron.pos)

end

function BrewingGemDust(User,gemDustId,cauldron)
    
	if cauldron:getData("filledWith")=="potion" then -- potion in cauldron, failure
	    alchemy.CauldronDestruction(User,cauldron,2)
	
    elseif cauldron:getData("filledWith")=="essenceBrew" then -- essence brew in cauldron, failure
	    alchemy.CauldronDestruction(User,cauldron,2)
		
	elseif cauldron:getData("filledWith") == "stock" then -- create a potion
	    GemDustInStock(User,cauldron,gemDustId)
		User:learn(Character.alchemy, 50/2, 100)

    elseif cauldron:getData("filledWith")=="water" then -- create an essence brew
		GemDustInWater(User,cauldron,gemDustId)
		User:learn(Character.alchemy, 50/2, 100)
	
	else -- nothing in the cauldron
	    common.InformNLS(User, "Der Edelsteinstaub verflüchtigt sich, als du ihn in den leeren Kessel schüttest.", 
		                            "The gem dust dissipates, as you fill it into the empty cauldron.")
	end	
end
return M

