-- UPDATE common SET com_script='item.id_1061_teleport' WHERE com_itemid=1061;

require("base.common")

module("item.id_1061_teleport", package.seeall)

function UseItem(User, SourceItem, ltstate)
    local destCoordX; local destCoordY; local destCoordZ
	local loc
	local success
	local radius
	local myPortal
	
	destCoordX = SourceItem:getData("destinationCoordsX")
	destCoordY = SourceItem:getData("destinationCoordsY")
	destCoordZ = SourceItem:getData("destinationCoordsZ")
	if (destCoordX ~= "") and (destCoordY ~= "") and (destCoordZ ~= "") then
	    success = false;
		radius = 4;

		for i = 1, 10 do
			loc = position( User.pos.x - radius + math.random( 2*radius ), User.pos.y - radius + math.random( 2*radius ), User.pos.z )

			-- never create it on people
			-- never create it on items
			if not world:isCharacterOnField( loc ) and not world:isItemOnField( loc ) and (world:getField( loc ):tile()~=6) then

				-- create a gate 
				myPortal = world:createItemFromId( 10, 1, loc, true, 933 ,nil);
				myPortal:setData("destinationCoordsX",destCoordX)
				myPortal:setData("destinationCoordsY",destCoordY)
				myPortal:setData("destinationCoordsZ",destCoordZ)
				world:changeItem(myPortal)
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
    else
	   -- no portal book
	end	
end