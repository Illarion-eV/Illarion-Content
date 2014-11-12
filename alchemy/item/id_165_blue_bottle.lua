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
--I_165_blaue_flasche
-- new effects for reworked alchemy system
-- support potions: the effect other potions (stocks or essencebrews) or the effect of potion
-- e.g. change a potion's quality, remove cooldown of  potion

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local lookat = require("base.lookat")
local M = {}

-- UPDATE common SET com_script='alchemy.item.id_165_blue_bottle' WHERE com_itemid = 165;

function DrinkPotion(User,SourceItem)
    -- no effecs yet
	 common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
end

function M.UseItem(User, SourceItem, ltstate)
    -- repair potion in case it's broken
	alchemy.repairPotion(SourceItem)
	-- repair end	
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	
	   -- is the char an alchemist?
	    local anAlchemist = alchemy.CheckIfAlchemist(User)
		if not anAlchemist then
			User:inform("Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
			return
		end
	   
	   if ( ltstate == Action.abort ) then
	        common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
		
		if ( ltstate == Action.none ) then
            if (SourceItem:getData("filledWith") =="essenceBrew") and (cauldron:getData("filledWith") == "stock") then
		        actionDuration = 80 -- when we combine a stock and an essence brew, it takes longer
            else
                actionDuration = 20
            end				
			User:startAction( actionDuration, 21, 5, 10, 45)
			return
		end	
	    
		FillIn(User, SourceItem, cauldron)
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			User:talk(Character.say, "#me trinkt eine hellblaue Flüssigkeit.", "#me drinks a light blue liquid.")
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem)
			alchemy.EmptyBottle(User,SourceItem)
	    end
	end  
end

function FillIn(User, SourceItem, cauldron)

	if (SourceItem:getData("filledWith")=="potion") then -- potion should be filled into the cauldron
		-- water leads to a failure
		if cauldron:getData("cauldronFilledWith") == "water" then
			world:gfx(1,cauldron.pos)
		
		elseif cauldron:getData("filledWith") == "essenceBrew" then 
			SupportEssenceBrew(User,SourceItem,cauldron)
		
		elseif cauldron:getData("filledWith") == "potion" then
			SupportPotion(User,SourceItem,cauldron)
			
		elseif cauldron:getData("filledWith") == "stock" then
			SupportStock(User,SourceItem,cauldron)
		
		else
			alchemy.FillFromTo(SourceItem,cauldron)
			world:changeItem(cauldron)
		end    
		alchemy.EmptyBottle(User,SourceItem)
		
	elseif (SourceItem:getData("filledWith") =="essenceBrew") then -- essence brew should be filled into the cauldron
		-- unlike the support potion itself, the essence brew of it has no specail effects when filled in
		-- therefore we call the ordinary fill-function; note that we call it after checking for potion in this script
		-- and we do not set ltstate as a parameter, since we did the abort stuff already here
		alchemy.FillIntoCauldron(User,SourceItem,cauldron)
	end

end

function SupportStock(User,support,stock)
    
	-- no effects yet, support has no effect, stock is unchanged
    
	local cauldron = common.GetFrontItem( User )
	-- remove support potion in case it was in the cauldron
	alchemy.RemoveAll(cauldron)
	-- fill in the stock
	alchemy.FillFromTo(stock,cauldron)
	world:changeItem(cauldron)
	world:gfx(1,cauldron.pos)
end

function SupportEssenceBrew(User,support,essenceBrew)
    
	-- no effects yet, support has no effect, essenceBrew is unchanged
	
	local cauldron = common.GetFrontItem( User )
	-- remove the support 
	alchemy.RemoveAll(cauldron)
	-- fill in the brew
	alchemy.FillFromTo(essenceBrew,cauldron)
	world:changeItem(cauldron)
	world:gfx(1,cauldron.pos)
end

function SupportPotion(User,support,potion)
    local cauldron = common.GetFrontItem( User )
	local supportEffectId = tonumber(support:getData("potionEffectId"))
	
	local supportQuality, potionQuality, bottle
	if support.id >= 1008 and support.id <= 1018 then
		supportQuality = tonumber(support:getData("potionQuality"))
		potionQuality = potion.quality
		bottle = potion
	else
		supportQuality = support.quality
		potionQuality = tonumber(potion:getData("potionQuality"))
		bottle = support
	end	
	if (supportEffectId >= 400) and (supportEffectId <= 406) then -- quality raiser
	    -- list with potions in cauldron and bottle
		local cauldronPotion = {1011,1016,1013,1009,1015,1018,1017} 
        local bottlePotion   = {327 ,59  ,165 ,329 ,166 ,167 ,330}
	
	    if (potion.id == cauldronPotion[supportEffectId-399]) or (potion.id == bottlePotion[supportEffectId-399]) then -- support and potion belong together
		    
			supportQuality = common.Limit(math.floor(supportQuality/100), 1, 9)
		    local chance = supportQuality*9  -- support quality * 9 = chance that potion's quality is increased
		    if common.Chance(chance, 100)==true then 
			    potionQuality = common.Limit(potionQuality+100, 100, 999) -- new quality
			    world:gfx(53,cauldron.pos)
			else -- no success, quality stays the same
		        world:gfx(1,cauldron.pos)
			end
		
		else 
	        world:gfx(1,cauldron.pos)
	    end

	else
	    world:gfx(1,cauldron.pos)
	end	
    alchemy.RemoveAll(cauldron)
	alchemy.FillFromTo(potion,cauldron)
	cauldron:setData("potionQuality",potionQuality) -- here we set the new quality, in case the quality raiser was successfull
	world:changeItem(cauldron)
end

function M.LookAtItem(User,Item)
	return lookat.GenerateLookAt(User, Item, 0)   
end
return M

