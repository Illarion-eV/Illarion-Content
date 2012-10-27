-- Testskript 1 für Weiterentwicklung Druidenmagie
-- 2007 by Falk
-- 2009 by Nitram
-- 2011 by Merung
-- Trinken aus grüner Flasche (331)
-- ------------------------------------------------

-- include base.common for additional functions
require("base.common")
require("base.character")
require("alchemy.item.id_165_blue_bottle")

module("alchemy.item.id_331_green_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_331_green_bottle' WHERE com_itemid = 331;


function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    
	if SourceItem:getData("bottleFilledWith") ~= "stock" then -- no stock, something else
	    return
	
	else
        -- infront of a cauldron?
		local cauldron = GetCauldronInfront(User)
        if cauldron then
	        
			-- is the char an alchemist?
	        local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
		    if not anAlchemist then
		        return
	        end
		
			if ( ltstate == Action.abort ) then
				base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
			   return
			end
		
			if ( ltstate == Action.none ) then
				User:startAction( 40, 21, 5, 10, 45)
				return
			end	  

			FillStockIn(User,cauldron,SourceItem)
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
		else
		    DrinkIt(User, SourceItem)
		end
	end
end

function DrinkIt(User, SourceItem)
    if User.attackmode then
		base.common.InformNLS(User, "Du kannst nichts trinken, während Du kämpfst.", "You cannot drink while fighting.", Player.lowPriority)
	else
		User:talkLanguage(Character.say, Player.german, "#me trinkt eine grüne Flüssigkeit.")
		User:talkLanguage(Character.say, Player.english, "#me drinks a green liquid.")
		base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", "You don't have the feeling that something happens.")
		User.movepoints=User.movepoints - 20
		alchemy.base.alchemy.EmptyBottle(User,SourceItem)
    end
end

function FillStockIn(User,cauldron,SourceItem)
    -- water, stock or potion is in the cauldron; leads to a failure
	if cauldron:getData("cauldronFilledWith") == "water" then
		alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)

	elseif cauldron:getData("cauldronFilledWith") ~= "stock" then
		alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
	
	elseif cauldron:getData("cauldronFilledWith") == "potion" then
		if cauldron.id == 1011 then -- support potion
			 alchemy.item.id_165_blue_bottle.SupportStock(User,cauldron,SourceItem)
		else
			alchemy.base.alchemy.CauldronExplosion(User,cauldron,2)
		end
	
	elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
		alchemy.base.alchemy.CombineStockEssence( User, SourceItem, cauldron)

	elseif cauldron.id == 1008 -- nothing in the cauldron, we just fill in the stock
		alchemy.base.alchemy.StockFromTo(SourceItem,cauldron)
		cauldron:setData("cauldronFilledWith","stock")
		cauldron.id = 1012
		world:changeItem(cauldron)
	end
end

function LookAtItem(User,Item)
    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
end 