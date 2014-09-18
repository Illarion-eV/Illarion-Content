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

-- Merung 2011: fill stock or potion into bottle
-- UPDATE items SET itm_script='item.id_164_emptybottle' WHERE itm_id IN (164);

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local licence = require("base.licence")

module("item.id_164_emptybottle", package.seeall)

function UseItem(User, SourceItem, ltstate)

	-- alchemy
	-- infront of a cauldron?
	local cauldron = alchemy.GetCauldronInfront(User)
    if cauldron then
	
		if licence.licence(User) then --checks if user is citizen or has a licence 
			return -- avoids crafting if user is neither citizen nor has a licence
		end
		
		if not CheckWaterEmpty(User, SourceItem, cauldron) then
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
		   User:startAction(20,21,5,15,25);
		   return
		end
		
		FillIntoBottle(User, SourceItem, cauldron)
		alchemy.lowerFood(User)
	end

	-- The Glutinous Tree
	local frontItem = common.GetFrontItem(User)
	if frontItem and frontItem.id == 589 and frontItem.pos == position(376,288,0) then
	    GetSlimeFromTree(User, SourceItem, ltstate)
	end
	
end


function CheckWaterEmpty(User, SourceItem, cauldron)

	if (cauldron:getData("filledWith") == "water") then -- water belongs into a bucket, not a potion bottle!
		common.InformNLS( User,
				"Es ist zu viel Wasser im Kessel, als dass es in die Flaschen passen würde. Ein Eimer wäre hilfreicher.",
				"There is too much water in the cauldron to bottle it. Better use a bucket.")
		return nil ;
	-- no stock, no potion, not essence brew -> nothing we could fil into the bottle
	elseif cauldron:getData("filledWith") == "" then
		common.InformNLS( User,
				"Es befindet sich nichts zum Abfüllen im Kessel.",
				"There is nothing to be bottled in the cauldron.")
		return nil;
	end
    return true
end

function FillIntoBottle(User, SourceItem, cauldron)
    
	-- stock, essence brew or potion; fill it up
   if (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "essenceBrew") or (cauldron:getData("filledWith") == "potion") then  
		local reGem, reGemdust, reCauldron, reBottle = alchemy.GemDustBottleCauldron(nil, nil, cauldron.id, nil, User)
		if SourceItem.number > 1 then -- stack! 
			if cauldron:getData("filledWith") == "stock" then
				local data = {}
				data.AdrazinConcentration=cauldron:getData("AdrazinConcentration")
				data.IllidriumConcentration=cauldron:getData("IllidriumConcentration")
				data.CaprazinConcentration=cauldron:getData("CaprazinConcentration")
				data.HyperboreliumConcentration=cauldron:getData("HyperboreliumConcentration")
				data.EcholonConcentration=cauldron:getData("EcholonConcentration")
				data.DracolinConcentration=cauldron:getData("DracolinConcentration")
				data.OrcanolConcentration=cauldron:getData("OrcanolConcentration")
				data.FenolinConcentration=cauldron:getData("FenolinConcentration")
				data.filledWith="stock"
				User:createItem(reBottle, 1, 0, data)
																					
			elseif cauldron:getData("filledWith") == "essenceBrew" then
				local data = {}
				data.essenceHerb1=cauldron:getData("essenceHerb1")
				data.essenceHerb2=cauldron:getData("essenceHerb2")
				data.essenceHerb3=cauldron:getData("essenceHerb3")
				data.essenceHerb4=cauldron:getData("essenceHerb4")
				data.essenceHerb5=cauldron:getData("essenceHerb5")
				data.essenceHerb6=cauldron:getData("essenceHerb6")
				data.essenceHerb7=cauldron:getData("essenceHerb7")
				data.essenceHerb8=cauldron:getData("essenceHerb8")
				data.filledWith="essenceBrew"
				User:createItem(reBottle, 1, 0, data)
									
			elseif cauldron:getData("filledWith") == "potion" then
					local data = {}
					data.potionEffectId=cauldron:getData("potionEffectId")
					data.filledWith="potion"
					User:createItem(reBottle, 1, tonumber(cauldron:getData("potionQuality")), data)
			end		              
			world:erase(SourceItem,1)
		else
			SourceItem.id = reBottle
			alchemy.FillFromTo(cauldron,SourceItem)
			world:changeItem(SourceItem)
		end   
		alchemy.RemoveAll(cauldron)    			
	end
	world:changeItem(cauldron)
	world:makeSound(10,cauldron.pos)
	
end

function GetSlimeFromTree(User, SourceItem, ltstate)
	
    if ( ltstate == Action.abort ) then
		return
	end
	
	if (ltstate == Action.none) then
	   User:startAction(50,21,5,0,0);
	   return
	end
	
	if SourceItem.number > 1 then
		local data = {}
		data.filledWith="meraldilised slime"
		User:createItem(327, 1, 0, data)
	else
	    SourceItem.id = 327
		SourceItem:setData("filledWith","meraldilised slime")
		world:changeItem(SourceItem)
	end
	
end