-- I_52.lua voller Wassereimer

-- UPDATE common SET com_script='items.52_filledbucket' WHERE com_itemid IN (52);

require("base.common")
require("base.keys")

module("items.52_filledbucket", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param )

    -- Loo Bucket for hands
    if equapos( SourceItem.pos, position( -72, -69, 0 ) ) then
        local bucket = world:getItemOnField( position( -72, -69, 0 ) );
        bucket.wear = 255;
        world:changeItem( bucket );
        door = world:getItemOnField( position( -74, -68, 0 ) );
        base.keys.UnlockDoor( door );
        door = world:getItemOnField( position( -74, -68, 0 ) );
        OpenDoor( door );
    end;

    -- Wasserflasche auff�llen
    if( TargetItem.id == 2498 ) then
		if(TargetItem.number > 1) then
			base.common.InformNLS(User, "Du kannst nur eine Flasche bef�llen!", "You can only fill one bottle.");
			return;
		end
        world:makeSound( 10, User.pos )
        world:swap(TargetItem,2496,933);
    else
        if TargetItem.id ~= 0 then
			if ((TargetItem.id==12 or TargetItem.id == 359) and (User.pos.z==100 or User.pos.z==101)) then --Prevents extinguishing campfires on n00bia(needed for the cook-npc)
				base.common.InformNLS(User,"Du solltest das Feuer besser nicht ausmachen, du k�nntest es noch gebrauchen.","You shouldn't extinguish the fire, you maybe could need it.");
				return;
			else	
				base.common.InformNLS(User,"platsch!","splash!");
				world:makeSound( 9, User.pos );
	            -- Lagerfeuer ausmachen
	            if (TargetItem.id == 12 or TargetItem.id == 359) then
	                world:erase(TargetItem,1);
	                -- Esse ausmachen
	            elseif ( TargetItem.id == 2835 ) then
	                world:swap(TargetItem,2836,333);
	                -- test for seedlings
	            else
	                --User:inform( "calling sprouts" );
	                MakeSprout( User, SourceItem, TargetItem )
				end
			end
		else
			UseItemWithCharacter(User, SourceItem, User, Counter, Param);
		end
    end
      SourceItem.id = 51;
      SourceItem.data = 0;
      world:changeItem(SourceItem);
end  -- function

function UseItemWithCharacter (Character, SourceItem, TargetCharacter, Counter, Param )
    find, stinkEffekt =  TargetCharacter.effects:find(18);
    if find then 
	    found, stinkIndex = stinkEffekt:findValue("stinkIndex");
	    if found then
	         stinkEffekt:addValue("stinkIndex",1);
               world:makeSound( 9, Character.pos );
               SourceItem.id = 51;
               SourceItem.data = 0;
               world:changeItem(SourceItem);
	     
    	     -- Loo Bucket for hands
             if equapos( SourceItem.pos, position( -72, -69, 0 ) ) then
                 local bucket = world:getItemOnField( position( -72, -69, 0 ) );
                 bucket.wear = 255;
                 world:changeItem( bucket );
                 door = world:getItemOnField( position( -74, -68, 0 ) );
                 base.keys.UnlockDoor( door );
                 door = world:getItemOnField( position( -74, -68, 0 ) );
                 OpenDoor( door );
             end;
	     
	         base.common.InformNLS(TargetCharacter, "Du f�hlt dich gleich viel sauberer.", "You feel much cleaner.");
	    end
    end
end

function MakeSprout( User, SourceItem, TargetItem )
    if seedList == nil then
        seedList = {  };
        seedList[ 15 ] = {139,4};              -- Apfelsetzling
        seedList[ 302 ] = {132,4};             -- Kirschsetzling
        seedList[ 149 ] = {150,2};             -- Tannensetzling
    end
    local seed = seedList[ TargetItem.id ];
    if( seed == nil ) then
        return
    end
    --User:inform( "found sprouts" );
    local Field = world:getField( TargetItem.pos )
    --User:inform( "cecking ground "..Field:tile() );
    local boden = base.common.GetGroundType( Field:tile() );

    --User:inform( "standing on "..boden );
    -- only on fields
    if( boden == seed[2] ) then
        --User:inform( "on field" );

        --User:inform( "skill "..skillwert.." chance "..chance );
        if BlockCheck(TargetItem.pos) then
	    -- Auf dem Trainingsfeld der Akademie w�chst nichts
	    if ((( TargetItem.pos.x > 54 ) and ( TargetItem.pos.x < 64 ) and ( TargetItem.pos.y > 35 ) and ( TargetItem.pos.y < 49 )) and ( TargetItem.pos.z == 50)) then
	        base.common.InformNLS( User,
                    "Die Erde hier ist v�llig ausgebrannt...hier kann nichts wachsen.",
                    "The ground here is totaly burned...here can't grow anything." );
        else
            if CheckSucceed(User) then
                --User:inform( "deleting fruit "..TargetItem.id );
                world:swap(TargetItem,seed[1],333)
            end
	    end	
        else
        base.common.InformNLS( User, 
            "An dieser Stelle war nicht genug Sonnenlicht. Der Setzling geht ein.", 
            "There was not enough sunlight in this place. The seedling whithers." ); 
        end    
        User:learn( 2, "peasantry", 1, 100 )
    end
end

function CheckSucceed(User)
    Dex=User:increaseAttrib("dexterity",0);
    Pea=User:getSkill("peasantry");
    TryValue=100*(Pea/100)*(Dex/20);
    if (math.random(0,90)<TryValue) then
        return true
    else
        return false
    end
end

function BlockCheck(Posi)
    local testLoc;
    local TestItem;
    local block = 0;
    if Directions == nil then
        Directions = {
        { 1, 0, 3 }, { 1, 1, 2 }, { 0, 1, 3 }, { -1, 1, 2 },
        { -1, 0, 3 }, { -1, -1, 2 }, { 0, -1, 3 }, { 1, -1, 2 }
        };
    end
    for i, dir in pairs(Directions) do
        --User:inform( "checking field "..i );
        testLoc = position( Posi.x + dir[ 1 ], Posi.y + dir[ 2 ], Posi.z );
        if world:isItemOnField( testLoc ) then
            --User:inform( "block found at "..i );
            block = block + dir[ 3 ];
        end
    end
	local Field = world:getField(Posi);
	if(Field:countItems() > 1) then
		return false
	end
    if (block<5) then
        return true
    else
        return false
    end
end

