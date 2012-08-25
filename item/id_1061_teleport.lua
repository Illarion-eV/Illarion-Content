-- UPDATE common SET com_script='item.id_1061_teleport' WHERE com_itemid=1061;
require("item.id_10_teleportgate")
require("base.common")

module("item.id_1061_teleport", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    
	destString = sourceItem:getData("destinationCords")
	if destString == "" then
	    -- no portal book
	
	else -- it is a portal
	    a,b,destCord1,destCord2,destCord3=string.find(destString,"(%d+) (%d+) (%d+)")
        destCord1 = tonumber(destCord1)		
	    destCord2 = tonumber(destCord2)
 	    destCord3 = tonumber(destCord3)
	
        local loc;
		local success = false;
		local radius = 4;

		for i = 1, 10 do
			loc = position( User.pos.x - radius + math.random( 2*radius ), User.pos.y - radius + math.random( 2*radius ), User.pos.z )

			-- never create it on people
			-- never create it on items
			if not world:isCharacterOnField( loc ) and not world:isItemOnField( loc ) and (world:getField( loc ):tile()~=6) then

				-- create a gate 
				myPortal = world:createItemFromId( 10, 1, loc, true, 933 ,0);
				myPortal:setData("destinationCords",destString)
				world:makeSound( 4, loc )

				success = true;
				break
			end

		end

		if not success then -- no free space found
			base.common.InformNLS( User,
			"Rings um Dich erzittern Boden und Gegenstände!",
			"All around you ground and items are trembling!" );
		end	
			
        world:erase( SourceItem, 1 );
    end
end

function LookAtItem( User, Item )
    destString = Item:getData("destinationCords")
	
	if destString == "" then -- empty, therefore nor portal book
	   world:itemInform( User, Item, base.common.GetNLS( User, "Buch", "Book" ) )
    
	elseif destString == "cord1 cord2 cord3" then
	     world:itemInform( User, Item, base.common.GetNLS( User, "Portal nach ZIEL", "Portal to DESTINATION" ))
	
	elseif destString == "cord1 cord2 cord3" then
	    world:itemInform( User, Item, base.common.GetNLS( User, "Portal nach ZIEL", "Portal to DESTINATION" ))
		
	else -- portal book, but not defined look at for those coordinations
	    world:itemInform( User, Item, base.common.GetNLS( User, "Portal mit unbekanntem Ziel", "Portal with unknown destination" ))
	end	
end
