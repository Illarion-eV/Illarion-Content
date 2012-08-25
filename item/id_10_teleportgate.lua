-- teleporter gate
-- Nop

-- UPDATE common SET com_script='item.id_10_teleportgate' WHERE com_itemid = 10;

require("base.common")
require("base.factions")
require("quest.enduranceCave")

module("item.id_10_teleportgate", package.seeall)

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

    destString = SourceItem:getData("destinationCords")
	if destString ~= "" then
	    a,b,destCord1,destCord2,destCord3=string.find(destString,"(%d+) (%d+) (%d+)")
        destCord1 = tonumber(destCord1)		
	    destCord2 = tonumber(destCord2)
 	    destCord3 = tonumber(destCord3)
		dest = position(destCord1,destCord2,destCord3)
	end	
	
    --check if we are in the endurance cave and change the destination if needed
	local PlayerInCave, t_dest = quest.enduranceCave.InCave(User);
	if (PlayerInCave) then
		dest = t_dest;
	end

	if dest == true then

        --check if we are at the teleporter in the forced labour camp
		if User.pos == (position(-495, -484, -40)) then
			if User:getQuestProgress(25)<1 then --user has finished quest
				local ItemListe = {49,234,2536,22,21,2763};    --delete ores,coal, pickaxe,gold and bread
				for i, Item in pairs(ItemListe) do
					amount = User:countItem(ItemListe[i]);
					User:eraseItem( ItemListe[i], amount);
				end --items deleted;

				local Faction = base.factions.get(User); -- lookup to which faction the Character belongs to
				
				if     Faction.tid == 1 then dest = position(140,630,0); --cadomyr
				elseif Faction.tid == 2 then dest = position(788,826,0); --runewick
				elseif Faction.tid == 3 then dest = position(424,245,0); --galmair
				else dest = position(730, 226, 0); end --no town member teleport him to the Wilderland
				SourceItem.wear = 255;
				world:changeItem(SourceItem);
			else
				base.common.InformNLS( User,
				"Du hast deine Strafe noch nicht abgearbeitet. Bring Percy was er verlangt, um freizukommen.",
				"You still haven't completed your punishment. Bring Percy what he requests, to get released." );
				return;
			end
		end
		
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

function LookAtItem( User, Item )
destString = Item:getData("destinationCords")
	
	if destString == "" -- empty, therefore no portal
	   world:itemInform( User, Item, base.common.GetNLS( User, "Portal", "Portal" ) )
    
	elseif destString = "cord1 cord2 cord3" then
	     world:itemInform( User, Item, base.common.GetNLS( User, "Portal nach ZIEL", "Portal to DESTINATION" ))
	
	elseif destString = "cord1 cord2 cord3" then
	    world:itemInform( User, Item, base.common.GetNLS( User, "Portal nach ZIEL", "Portal to DESTINATION" ))
		
	else -- portal, but not defined look at for those coordinations
	    world:itemInform( User, Item, base.common.GetNLS( User, "Portal mit unbekanntem Ziel", "Portal with unknown destination" ))
	end	
end