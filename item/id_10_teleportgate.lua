-- teleporter gate
-- Nop

-- UPDATE common SET com_script='item.id_10_teleportgate' WHERE com_itemid = 10;

require("base.common")
require("base.factions")
require("quest.enduranceCave")

module("item.id_10_teleportgate", package.seeall, package.seeall(base.factions))

function InitializeGate(  )

    if TargetCoor == nil then
        TargetCoor={  };
        --TargetName[ 1 ]="Troll's Bane";
        TargetCoor[ 1 ]={ -37, -108, 0 };

        --TargetName[ 2 ]="Lighthouse";
        TargetCoor[ 2 ]={ -395, -210, 0 };

        --TargetName[ 3 ]="Eldan Monastery";
        TargetCoor[ 3 ]={ -413, -132, 0 };

        --TargetName[ 4 ]="Harbor";
        TargetCoor[ 4 ]={ -283, 31, 0 };

        --TargetName[ 5 ]="Greenbriar";
        TargetCoor[ 5 ]={ -433, 41, 0 };

        --TargetName[ 6 ]="Tol Vanima";
        TargetCoor[ 6 ]={ 308, 228, 0 };

        --TargetName[ 7 ]="Varshikar";
        TargetCoor[ 7 ]={ 262, -264, 0 };

        --TargetName[ 8 ]="Silverbrand";
        TargetCoor[ 8 ]={ 79, -185, 0 };

        --TargetName[ 9 ]="Grey Rose Castle Top";
        TargetCoor[ 9 ]={ -58, -222, 1 };

        --TargetName[ 10 ]="Temple Ruins";
        TargetCoor[ 10 ]={ -45, -283, 0 };

        --TargetName[ 11 ]="Graveyard";
        TargetCoor[ 11 ]={ 93, 36, 0 };

        --TargetName[ 12 ]="Oasis";
        TargetCoor[ 12 ]={ 210, -258, 0 };

        --TargetName[ 13 ]="Sirani Islands";
        TargetCoor[ 13 ]={ 184, 162, 0 };

        --TargetName[ 14 ]="Hug of Sirani";
        TargetCoor[ 14 ]={ 354, -77, 0 };

        --TargetName[ 15 ]="Holy Place of Zelphia";
        TargetCoor[ 15 ]={ -364, -475, 0 };

        --TargetName[ 16 ]="Swamps";
        TargetCoor[ 16 ]={ -303, -208, 0 };

        --TargetName[ 17 ]="Lake Adron";
        TargetCoor[ 17 ]={ -160, -127, 0 };

        --TargetName[ 18 ]="Copper Mountains";
        TargetCoor[ 18 ]={ 0, -176, 0 };

        --TargetName[ 19 ]="Kumdah Desert";
        TargetCoor[ 19 ]={ 210, -282, 0 };

        --TargetName[ 20 ]="Orcen Mountains South";
        TargetCoor[ 20 ]={ 150, -400, 0 };

        --TargetName[ 21 ]="Bloodskull Cave";
        TargetCoor[ 21 ]={ 195, -415, 0 };

        --TargetName[ 22 ]="Ogre Mountains West";
        TargetCoor[ 22 ]={ 301, -350, 0 };

        --TargetName[ 23 ]="Trollsbane Library";
        TargetCoor[ 23 ]={ -95, -116, 0 };

        --TargetName[ 24 ]="Trollsbane Library Top";
        TargetCoor[ 24 ]={ -92, -119, 1 };

        --TargetName[ 25 ]="Trollsbane Eliza";
        TargetCoor[ 25 ]={ -59, -119, 0 };

        --TargetName[ 26 ]="Trollsbane Marketplace";
        TargetCoor[ 26 ]={ -66, -107, 0 };

        --TargetName[ 27 ]="Trollsbane Tavern";
        TargetCoor[ 27 ]={ -89, -96, 0 };

        --TargetName[ 28 ]="Trollsbane Tavern Top";
        TargetCoor[ 28 ]={ -89, -96, 1 };

        --TargetName[ 29 ]="Trollsbane Workshop";
        TargetCoor[ 29 ]={ -109, -119, 0 };

        --TargetName[ 30 ]="Trollsbane Inn";
        TargetCoor[ 30 ]={ -125, -109, 0 };

        --TargetName[ 31 ]="Trollsbane Inn Top";
        TargetCoor[ 31 ]={ -125, -109, 1 };

        --TargetName[ 32 ]="Troll Woods North";
        TargetCoor[ 32 ]={ 200, -54, 0 };

        --TargetName[ 33 ]="Troll Woods East";
        TargetCoor[ 33 ]={ 329, 0, 0 };

        --TargetName[ 34 ]="Troll Woods South";
        TargetCoor[ 34 ]={ 200, 63, 0 };

        --TargetName[ 35 ]="Troll Woods West";
        TargetCoor[ 35 ]={ 94, -1, 0 };

        --TargetName[ 36 ]="Skeleton Woods North";
        TargetCoor[ 36 ]={ -100, 130, 0 };

        --TargetName[ 37 ]="Skeleton Woods East";
        TargetCoor[ 37 ]={ 28, 208, 0 };

        --TargetName[ 38 ]="Skeleton Woods South";
        TargetCoor[ 38 ]={ -100, 259, 0 };

        --TargetName[ 39 ]="Skeleton Woods West";
        TargetCoor[ 39 ]={ -175, 207, 0 };

        --TargetName[ 40 ]="Southern Woods North";
        TargetCoor[ 40 ]={ -21, -9, 0 };

        --TargetName[ 41 ]="Southern Woods East";
        TargetCoor[ 41 ]={ 57, 40, 0 };

        --TargetName[ 42 ]="Southern Woods South";
        TargetCoor[ 42 ]={ 0, 100, 0 };

        --TargetName[ 43 ]="Southern Woods West";
        TargetCoor[ 43 ]={ -126, 92, 0 };

        --TargetName[ 44 ]="Northern Woods North";
        TargetCoor[ 44 ]={ -200, -400, 0 };

        --TargetName[ 45 ]="Northern Woods East";
        TargetCoor[ 45 ]={ -95, -328, 0 };

        --TargetName[ 46 ]="Northern Woods South";
        TargetCoor[ 46 ]={ -225, -225, 0 };

        --TargetName[ 47 ]="Northern Woods West";
        TargetCoor[ 47 ]={ -335, -325, 0 };

        --TargetName[ 48 ]="Briarian Woods North";
        TargetCoor[ 48 ]={ -472, -23, 0 };

        --TargetName[ 49 ]="Briarian Woods East";
        TargetCoor[ 49 ]={ -428, 103, 0 };

        --TargetName[ 50 ]="Briarian Woods South";
        TargetCoor[ 50 ]={ -482, 154, 0 };

        --TargetName[ 51 ]="Briarian Woods West";
        TargetCoor[ 51 ]={ -485, 103, 0 };

        --TargetName[ 52 ]="Eastern Woods North";
        TargetCoor[ 52 ]={ 227, -209, 0 };

        --TargetName[ 53 ]="Eastern Woods East";
        TargetCoor[ 53 ]={ 339, -169, 0 };

        --TargetName[ 54 ]="Eastern Woods South";
        TargetCoor[ 54 ]={ 250, -133, 0 };

        --TargetName[ 55 ]="Eastern Woods West";
        TargetCoor[ 55 ]={ 145, -165, 0 };

        --TargetName[ 56 ]="Grey Rose Castle";
        TargetCoor[ 56 ]={ -64, -229, 0 };

        --TargetName[ 57 ]="Meeting Place";
        TargetCoor[ 57 ]={ -248, 74, 0 };

        --TargetName[ 58 ]="Farmers Union";
        TargetCoor[ 58 ]={ -171, 75, 0 };

        --TargetName[ 59 ]="Magic Academy";
        TargetCoor[ 59 ]={ 40, 71, 50 };

	--TargetName[ 60 ]="Tol Vanima Garden";
	TargetCoor[ 60 ]={ 428, 213, 0 };

	--TargetName[ 61 ]="Hellbriar";
	TargetCoor[ 61 ]={ -480, 250, 0 };

	--TargetName[ 62 ]="Zzyathis";
	TargetCoor[ 62 ]={ 402, -148, 0 };

	--TargetName[ 63 ]="Western Woods North";
	TargetCoor[ 63 ]={ -326, -50, 0 };

	--TargetName[ 64 ]="Western Woods East";
        TargetCoor[ 64 ]={ -156, 9, 0 };

	--TargetName[ 65 ]="Western Woods South";
        TargetCoor[ 65 ]={ -310, 8, 0 };

	--TargetName[ 66 ]="Western Woods West";
        TargetCoor[ 66 ]={ -408, -62, 0 };

	--TargetName[ 67 ]="Caelum";
	TargetCoor[ 67 ]={ -476, -72, 0 };

        --TargetName[ 68 ]="Orc mountains north";
        TargetCoor[ 68 ]={ 157, -492, 0 };

	--TargetName[ 69 ]="Orc mountains west";
	TargetCoor[ 69 ]={ 121, -426, 0 };

        --TargetName[ 70 ]="Ogre mountains north";
        TargetCoor[ 70 ]={ 334, -398, 0 };

	--TargetName[ 71 ]="Ogre mountains east";
	TargetCoor[ 71 ]={ 414, -293, 0 };

	--TargetName[ 72 ]="Ogre mountains south";
	TargetCoor[ 72 ]={ 340, -325, 0 };

	--TargetName[ 73 ]="Arena";
	TargetCoor[ 73 ]={ -31, -94, 0 };

	--TargetName[ 74 ]="Goblin Isle";
	TargetCoor[ 74 ]={ 35, -353, 0 };

	--TargetName[ 75 ]="Secret Place";
	TargetCoor[ 75 ]={ -28, -201, 1 };

	--TargetName[ 76 ]="Noobia - Cooking and Baking";
	TargetCoor[ 76 ]={ 165,	21,	100 };

	--TargetName[ 77 ]="Noobia - Carpentry";
	TargetCoor[ 77 ]={ 164,	60,	100 };

	--TargetName[ 78 ]="Noobia - Glassblowing";
	TargetCoor[ 78 ]={ 164,	104,100 };

	--TargetName[  79]="Noobia - Farming";
	TargetCoor[ 79 ]={ 170,	156,100 };

	--TargetName[ 80 ]="Noobia - Gold- and Smithing";
	TargetCoor[ 80 ]={ 110,	163,100 };

	--TargetName[ 81 ]="Noobia - Tailoring";
	TargetCoor[ 81 ]={ 116,	109,100 };

	--TargetName[ 82 ]="Noobia - Mining";
	TargetCoor[ 82 ]={ 107,	30,	100 };

	--TargetName[ 83 ]="Noobia - Gem Cutting";
	TargetCoor[ 83 ]={ 108,	66,	100 };

	--TargetName[ 84 ]="Noobia - Fishing";
	TargetCoor[ 84 ]={ 66,	154,100 };

	--TargetName[ 85 ]="Noobia - Castle";
	TargetCoor[ 85 ]={ 71,	38,	101 };

	--TargetName[ 90 ]="Irundar Outside";
	TargetCoor[ 90 ]={ -49, 214,  0 };

    --TargetName[ 91 ]="Irundar Marketplace";
    TargetCoor[ 91 ]={ -36, 175, -9 };

    --TargetName[ 92 ]="Irundar Castle";
    TargetCoor[ 92 ]={ -40, 144, -9 };

    --TargetName[ 93 ]="Irundar Labyrinth";
    TargetCoor[ 93 ]={ -28, 184, -7 };

    --TargetName[ 94 ]="Irundar Well";
    TargetCoor[ 94 ]={ 25, 190, -12 };

    end

end

--function UseItem( User, SourceItem, TargetItem, Counter, Param )
function CharacterOnField( User )

    --User:inform( "using teleport gate" )

	if (User:getType() ~= 0) then
        return
    end

    InitializeGate(  );

    local SourceItem = world:getItemOnField( User.pos );

    if( SourceItem.id == 10 ) then

		--User:inform( "target id "..SourceItem.quality )
        local gate = TargetCoor[ SourceItem.data ]

        --Vanima Magic Trap
        vanTrap = false;
        if (SourceItem.quality == 6) and (User:getQuestProgress(6) == 1) then
            vanTrap = true;
        end;

        --check if we are in the endurance cave and change the destination if needed
		local PlayerInCave, t_dest = quest.enduranceCave.InCave(User);
		if (PlayerInCave) then
			gate = t_dest;
		end

        if gate ~= nil then
            --User:inform( "gate found" )

            --User:inform( "warp" )

            local dest = position( gate[ 1 ], gate[ 2 ], gate[ 3 ] );
            if vanTrap then
                dest = position(405,207,0);
            end;

			--check if we are at the teleporter in the forced labour camp
			if User.pos == (position(-495, -484, -40)) then
			    if User:getQuestProgress(25)<1 then --user has finished quest
					local ItemListe = {49,234,2536,22,21,2763};    --delete ores,coal, pickaxe,gold and bread
					for i, Item in pairs(ItemListe) do
						amount = User:countItem(ItemListe[i]);
	            		User:eraseItem( ItemListe[i], amount);
					end --items deleted;

					local Faction = base.factions.BF_get(User); -- lookup to which faction the Character belongs to
					
					if     Faction.tid == 1 then dest = position(140,630,0); --cadomyr
					elseif Faction.tid == 2 then dest = position(788,826,0); --runewick
					elseif Faction.tid == 3 then dest = position(424,245,0); --galmair
					else dest = position(730, 226, 0); end --no town member teleport him to the Wilderland
					SourceItem.wear = 255;
					world:changeItem(SourceItem);
				else
	                base.common.InformNLS( User,
	                "Du hast deine Strafe noch nicht abgearbeitet. Bring Percy was er verlangt, um freizukommen..",
	                "You still haven't completed your punishment. Bring Percy what he requests, to get released." );
	                return;
				end
			end
			-- Quest Special
            allOK = true;
            if (allOK) then

                if not (User:isAdmin()) then
                    -- check for newbie state
                    local newbieState = User:getQuestProgress(2);

                    if 0 < newbieState then
                        if  ( (newbieState == 100) and (User.effects:find(13)) )then
                                User.effects:removeEffect(13);
                        elseif not (76 <= SourceItem.data and SourceItem.data <= 85) then
                            base.common.InformNLS(User,
                            "Nichts passiert, du scheinst noch nicht bereit zu sein. Frage Findecano Melwasul, den Elfen bei dem Thron, wie du nach Gobaith gelangen kannst.",
                            "Nothing happens, it seems that you are not ready yet. Ask Findecano Melwasul, the Elf next to the throne, how you can enter Gobaith.");
                            return;
                        end
                    end
                end

				world:makeSound( 4, dest )
                --world:gfx( 41, dest )
                world:gfx( 41, User.pos )
                User:warp( dest );
                world:gfx( 41, User.pos )

                base.common.InformNLS( User,
                "Du machst eine magische Reise.",
                "You travel by the realm of magic." );
                if (vanTrap) then
                    base.common.InformNLS( User,
                    "Eine Stimme schallt: IHR WURDET GEWARNT NICHT UNGEBETEN IN UNSER LAND EINZUDRINGEN...WILLKOMMEN IN VANIMA",
                    "A voice booms: YOU HAVE BEEN WARNED NOT TO ENTER OUR LANDS UNINVITED...WELCOME TO VANIMA" );
                end;

                if ( SourceItem.wear ~= 255 ) then
                    if ( SourceItem.quality < 900 ) then
                        if ( SourceItem.quality > 200 ) then
                            SourceItem.quality = SourceItem.quality - 100;
                            world:changeItem( SourceItem );
                        else
                            world:erase( SourceItem, SourceItem.number );
                        end
                    end
                end
            end
        end
    else
        base.common.InformNLS( User,
        "Ein Gegenstand stört die Magie des Portals.",
        "Some item disturbs the magic of the portal." );
    end
end


function LookAtItem( User, Item )

	if (Item.data==1) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Troll's Bane", "Magical gate to Troll's Bane" ) );
end;

if (Item.data==2) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Leuchtturm", "Magical gate to the Lighthouse" ) );
end;

if (Item.data==3) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Eldenkloster", "Magical gate to the Eldan Monastery" ) );
end;


if (Item.data==4) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Hafen", "Magical gate to the Harbor" ) );
end;


if (Item.data==5) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Greenbriar", "Magical gate to Greenbriar" ) );
end;

if (Item.data==6) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Tol Vanima", "Magical gate to Tol Vanima" ) );
end;

if (Item.data==7) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Varshikar", "Magical gate to Varshikar" ) );
end;

if (Item.data==8) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Silberbrand", "Magical gate to Silverbrand" ) );
end;

if (Item.data==9) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur grauen Rose", "Magical gate to the Grey Rose Castle Rooftop" ) );
end;

if (Item.data==10) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Tempelruinen", "Magical gate to the Temple Ruins" ) );
end;

if (Item.data==11) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Friedhof", "Magical gate to the Graveyard" ) );
end;

if (Item.data==12) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Oase der Hoffnung", "Magical gate to the Oasis of Hope" ) );
end;

if (Item.data==13) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Sirani Inseln", "Magical gate to the Sirani Islands" ) );
end;

if (Item.data==14) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Sirani Hug", "Magical gate to the Hug of Sirani" ) );
end;

if (Item.data==15) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum heiligen Platz von Zelphia", "Magical gate to the Holy Place of Zelphia" ) );
end;

if (Item.data==16) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Sümpfen", "Magical gate to the Swamps" ) );
end;

if (Item.data==17) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Lake Adron", "Magical gate to Lake Adron" ) );
end;

if (Item.data==18) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Kupferbergen", "Magical gate to the Copper Mountains" ) );
end;

if (Item.data==19) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Kumdah Wüste", "Magical gate to the Kumdah Desert" ) );
end;

if (Item.data==20) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Orkbergen", "Magical gate to the South Orc Mountains" ) );
end;

if (Item.data==21) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Bloodskull Höhle", "Magical gate to the Bloodskull Cave" ) );
end;

if (Item.data==22) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Ogerbergen", "Magical gate to the West Ogre Mountains" ) );
end;

if (Item.data==23) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Troll's Bane Bibliothek", "Magical gate to Troll's Bane Library" ) );
end;

if (Item.data==24) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Troll's Bane Bibliothek", "Magical gate to Troll's Bane Library top floor" ) );
end;

if (Item.data==25) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Troll's Bane Laden", "Magical gate to Troll's Bane Shop" ) );
end;

if (Item.data==26) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Troll's Bane Marktplatz", "Magical gate to Troll's Bane Marketplace" ) );
end;

if (Item.data==27) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Troll's Bane Taverne", "Magical gate to Troll's Bane Tavern" ) );
end;

if (Item.data==28) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Troll's Bane Taverne", "Magical gate to Troll's Bane Tavern Top" ) );
end;

if (Item.data==29) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Troll's Bane Werkstatt", "Magical gate to Troll's Bane Workshop" ) );
end;

if (Item.data==30) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Troll's Bane Seahorse", "Magical gate to Troll's Bane Inn" ) );
end;

if (Item.data==31) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Troll's Bane Seahorse", "Magical gate to Trollsbane Inn Top" ) );
end;

if (Item.data==32) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Trollwald", "Magical gate to North Troll Woods" ) );
end;

if (Item.data==33) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Trollwald", "Magical gate to East Troll Woods" ) );
end;

if (Item.data==34) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Trollwald", "Magical gate to South Troll Woods" ) );
end;

if (Item.data==35) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Trollwald", "Magical gate to West Troll Woods" ) );
end;

if (Item.data==36) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Skelettwald", "Magical gate to North Skeleton Woods" ) );
end;

if (Item.data==37) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Skelettwald", "Magical gate to East Skeleton Woods" ) );
end;

if (Item.data==38) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Skelettwald", "Magical gate to South Skeleton Woods" ) );
end;

if (Item.data==39) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Skelettwald", "Magical gate to West Skeleton Woods" ) );
end;

if (Item.data==40) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Südwald", "Magical gate to North Southern Woods" ) );
end;

if (Item.data==41) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Südwald", "Magical gate to East Southern Woods" ) );
end;
if (Item.data==42) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Südwald", "Magical gate to South Southern Woods" ) );
end;

if (Item.data==43) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Südwald", "Magical gate to West Southern Woods" ) );
end;

if (Item.data==44) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Nordwald", "Magical gate to North Northern Woods" ) );
end;

if (Item.data==45) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Nordwald", "Magical gate to East Northern Woods" ) );
end;
if (Item.data==46) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Nordwald", "Magical gate to South Northern Woods" ) );
end;

if (Item.data==47) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Nordwald", "Magical gate to West Northern Woods" ) );
end;

if (Item.data==48) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Briarwald", "Magical gate to North Briar Woods" ) );
end;

if (Item.data==49) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Briarwald", "Magical gate to East Briar Woods" ) );
end;
if (Item.data==50) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Briarwald", "Magical gate to South Briar Woods" ) );
end;

if (Item.data==51) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Briarwald", "Magical gate to West Briar Woods" ) );
end;

if (Item.data==52) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Ostwald", "Magical gate to North Eastern Woods" ) );
end;

if (Item.data==53) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Ostwald", "Magical gate to East Eastern Woods" ) );
end;
if (Item.data==54) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Ostwald", "Magical gate to South Eastern Woods" ) );
end;

if (Item.data==55) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Ostwald", "Magical gate to West Eastern Woods" ) );
end;

if (Item.data==56) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur grauen Rose", "Magical gate to Grey Rose Castle" ) );
end;

if (Item.data==57) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Treffpunkt", "Magical gate to Meeting Place" ) );
end;

if (Item.data==58) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Farmers' Union", "Magical gate to the Farmers' Union" ) );
end;

if (Item.data==59) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur magischen Akademie", "Magical gate to the Magic Academy" ) );
end;

if (Item.data==60) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Tol Vanima", "Magical gate to the Tol Vanima Gardens" ) );
end;

if (Item.data==61) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Hellbriar", "Magical gate to Hellbriar" ) );
end;

if (Item.data==62) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Zzyathis", "Magical gate to Zzyathis" ) );
end;

if (Item.data==63) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Westwald", "Magical gate to North Western Woods" ) );
end;

if (Item.data==64) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Westwald", "Magical gate to East Western Woods" ) );
end;

if (Item.data==65) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Westwald", "Magical gate to South Western Woods" ) );
end;

if (Item.data==66) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zum Westwald", "Magical gate to West Western Woods" ) );
end;

if (Item.data==67) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal nach Caelum", "Magical gate to Caelum" ) );
end;

if (Item.data==68) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Orkbergen", "Magical gate to North Orc Mountains" ) );
end;

if (Item.data==69) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Orkbergen", "Magical gate to West Orc Mountains" ) );
end;

if (Item.data==70) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Ogerbergen", "Magical gate to North Ogre Mountains" ) );
end;

if (Item.data==71) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Ogerbergen", "Magical gate to East Ogre Mountains" ) );
end;

if (Item.data==72) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zu den Ogerbergen", "Magical gate to South Ogre Mountains" ) );
end;

if (Item.data==73) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Arena", "Magical gate to the Arena" ) );
end;

if (Item.data==74) then
	 world:itemInform( User, Item, base.common.GetNLS( User, "Magisches Portal zur Goblin Insel", "Magical gate to the Goblin Isle" ) );
end;

if (Item.data>74) or (Item.data==0) then

world:itemInform( User,Item,base.common.GetNLS( User, "Magisches Portal", "Magical gate") );
end;	
	
end
