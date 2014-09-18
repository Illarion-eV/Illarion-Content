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
-- Testskript 1 für Weiterentwicklung Druidenmagie
-- 2007 by Falk
-- 2009 by Nitram
-- 2011 by Merung
-- Trinken aus grüner Flasche (331)
-- ------------------------------------------------

-- include base.common for additional functions
local common = require("base.common")
local character = require("base.character")
local id_165_blue_bottle = require("alchemy.item.id_165_blue_bottle")
local alchemy = require("alchemy.base.alchemy")

module("alchemy.item.id_331_green_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_331_green_bottle' WHERE com_itemid = 331;


function UseItem(User, SourceItem, ltstate)
    
	if SourceItem:getData("filledWith") ~= "stock" then -- no stock, something else
	    return
	
	else
        -- infront of a cauldron?
		local cauldron = alchemy.GetCauldronInfront(User)
        if cauldron then
	        
			-- is the char an alchemist?
	        local anAlchemist = alchemy.CheckIfAlchemist(User)
			if not anAlchemist then
				User:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
				return
			end
			
			if not alchemy.checkFood(User) then
				return
			end
		
			if ( ltstate == Action.abort ) then
				common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
			   return
			end
		
			if ( ltstate == Action.none ) then
				if (SourceItem:getData("filledWith") =="stock") and (cauldron:getData("filledWith") == "essenceBrew") then
					actionDuration = 80 -- when we combine a stock and an essence brew, it takes longer
				else
					actionDuration = 20
				end				
				User:startAction( actionDuration, 21, 5, 10, 45)
				return
			end	  

			FillStockIn(User,SourceItem,cauldron)
			alchemy.EmptyBottle(User,SourceItem)
			alchemy.lowerFood(User)
		else
		    DrinkIt(User, SourceItem)
			alchemy.EmptyBottle(User,SourceItem)
		end
	end
end

function DrinkIt(User, SourceItem)
    if User.attackmode then
		common.InformNLS(User, "Du kannst nichts trinken, während du kämpfst.", "You cannot drink while fighting.", Player.lowPriority)
	else
		User:talk(Character.say, "#me trinkt eine grüne Flüssigkeit.", "#me drinks a green liquid.")
		common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", "You don't have the feeling that something happens.")
		User.movepoints=User.movepoints - 20
	end
end

function FillStockIn(User,SourceItem, cauldron)
    -- water, stock or potion is in the cauldron; leads to a failure
	if cauldron:getData("filledWith") == "water" then
		alchemy.CauldronDestruction(User,cauldron,1)

	elseif cauldron:getData("filledWith") == "stock" then
		alchemy.CauldronDestruction(User,cauldron,2)
	
	elseif cauldron:getData("filledWith") == "potion" then
		if cauldron.id == 1013 then -- support potion
			 id_165_blue_bottle.SupportStock(User,cauldron,SourceItem)
		else
			alchemy.CauldronExplosion(User,cauldron,2)
		end
	
	elseif cauldron:getData("filledWith") == "essenceBrew" then 
		local check = alchemy.CombineStockEssence( User, SourceItem, cauldron)
        if check == false then
		    return
		end	
	elseif cauldron.id == 1008 then -- nothing in the cauldron, we just fill in the stock
		alchemy.FillFromTo(SourceItem,cauldron)
		world:changeItem(cauldron)
	end
end

function LookAtItem(User,Item)
    return base.lookat.GenerateLookAt(User, Item, 0)
end 