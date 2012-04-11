-- 795

-- UPDATE common SET com_script='item.id_795_teleportgate' WHERE com_itemid = 795;

require("base.common")
require("base.factions")
require("quest.enduranceCave")

module("item.id_795_teleportgate", package.seeall)

--function UseItem( User, SourceItem, TargetItem, Counter, Param )
function CharacterOnField( User )

	if (User:getType() ~= 0) then
        return
    end
	
	local SourceItem = world:getItemOnField( User.pos );
	
	if( SourceItem.id == 795 ) then
	
	local PlayerInCave, t_dest = quest.enduranceCave.InCave(User);
	local gate = t_dest;
	if (PlayerInCave) then
			gate = t_dest;
	end
	
	if gate ~= nil then
            --User:inform( "gate found" )

            --User:inform( "warp" )

            local dest = position( gate[ 1 ], gate[ 2 ], gate[ 3 ] );
            end;
	
	world:makeSound( 4, dest )
    --world:gfx( 41, dest )
    world:gfx( 41, User.pos )
    User:warp( dest );
    world:gfx( 41, User.pos )

    base.common.InformNLS( User,
    "Du machst eine magische Reise.",
    "You travel by the realm of magic." );
	else
        base.common.InformNLS( User,
        "Ein Gegenstand stört die Magie des Portals.",
        "Some item disturbs the magic of the portal." );
    end
end

function LookAtItem( User, Item )

if (Item:getData("destination") >9) or (Item:getData("destination") ==0) then

world:itemInform( User,Item,base.common.GetNLS( User, "Magisches Portal", "Magical gate") );
end;	
	
end