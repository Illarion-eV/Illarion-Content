-- teleporter gate
-- Nop

-- UPDATE common SET com_script='item.teleportgate' WHERE com_itemid IN (10,792,794,795)

require("base.common")
require("base.factions")
require("quest.enduranceCave")

module("item.teleportgate", package.seeall)

--[[
        --TargetName[ 1 ]="Galmair";
        TargetCoor[ 1 ]={ 424, 245, 0 };

        --TargetName[ 2 ]="Cadomyr";
        TargetCoor[ 2 ]={ 127, 647, 0 };

        --TargetName[ 3 ]="Runewick";
        TargetCoor[ 3 ]={ 788, 826, 0 };

        --TargetName[ 4 ]="Wilderland";
        TargetCoor[ 4 ]={ 683, 307, 0 };

        --TargetName[ 5 ]="Safepoint 1";
        TargetCoor[ 5 ]={ 0, 7, 0 };

        --TargetName[ 6 ]="Safepoint 2";
        TargetCoor[ 6 ]={ 1, 7, 0 };

        --TargetName[ 7 ]="Safepoint 3";
        TargetCoor[ 7 ]={ 2, 7, 0 };

        --TargetName[ 8 ]="Safepoint 4";
        TargetCoor[ 8 ]={ 3, 7, 0 };

        --TargetName[ 9 ]="Safepoint 5";
        TargetCoor[ 9 ]={ 4, 7, 0 };

]]

function CharacterOnField( User )
    
	if (User:getType() ~= 0) then -- only players, else end of script
        return
    end

    local SourceItem = world:getItemOnField( User.pos );
	local destCoordX, destCoordY, destCoordZ
	local dest
	local destFround = false

    destCoordX = SourceItem:getData("destinationCoordsX")
	destCoordY = SourceItem:getData("destinationCoordsY")
	destCoordZ = SourceItem:getData("destinationCoordsZ")
	if (destCoordX ~= "") and (destCoordY ~= "") and (destCoordZ ~= "") then
	    destCoordX = tonumber(destCoordX)	
	    destCoordY = tonumber(destCoordY)		
 	    destCoordZ = tonumber(destCoordZ)
		dest = position(destCoordX,destCoordY,destCoordZ)
        debug("Portal: " .. destCoordX .. ", " .. destCoordY .. ", " .. destCoordZ)
	    destFound = true
	end	
	
    --check if we are in the endurance cave and change the destination if needed
	local PlayerInCave, t_dest = quest.enduranceCave.InCave(User);
	if (PlayerInCave) then
		dest = t_dest;
        debug("QuestPortal: " .. dest.x .. ", " .. dest.y .. ", " .. dest.z)
	    destFound = true
	end

	if destFound then -- destination was defined
		world:makeSound( 4, dest )
		world:gfx( 41, User.pos )
		User:warp( dest );
		world:gfx( 41, User.pos )

		base.common.InformNLS( User,
		"Du machst eine magische Reise.",
		"You travel by the realm of magic." );

		if ( SourceItem.wear ~= 255 ) then
			if ( SourceItem.quality > 200 ) then
					SourceItem.quality = SourceItem.quality - 100;
					world:changeItem( SourceItem );
			else
				world:erase( SourceItem, SourceItem.number );
			end
		end	
	end
end
