-- I_52.lua voller Wassereimer

-- UPDATE common SET com_script='item.id_52_filledbucket' WHERE com_itemid IN (52);

require("base.common")
require("druid.base.brewing_plants_gemdust")

module("item.id_52_filledbucket", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

	local TargetItem = base.common.GetTargetItem(User, SourceItem); -- item in hands
	
	if TargetItem == nil then
		TargetItem = base.common.GetFrontItem(User); -- item infront
	end
	
	if TargetItem == nil or TargetItem.id == 0 then
		local targetChar = base.common.GetFrontCharacter(User); -- char infront
		if targetChar == nil then
			PourOnCharacter(User,SourceItem,User);
		else
			PourOnCharacter(User,SourceItem,targetChar); -- self
		end
		return;
	end
	
    -- infront of a cauldron
	if (TargetItem.id == 1008) then
	    WaterIntoCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate)
		return
	end
	
	-- Wasserflasche auffüllen
	if( TargetItem.id == 2498 ) then
		if(TargetItem.number > 1) then
			base.common.InformNLS(User, "Du kannst nur eine Flasche befüllen.", "You can only fill one bottle.");
			return;
		end
        world:makeSound( 10, User.pos )
        world:swap(TargetItem,2496,933);
    else
        if TargetItem.id ~= 0 then
			if ((TargetItem.id==12 or TargetItem.id == 359) and (User.pos.z==100 or User.pos.z==101)) then --Prevents extinguishing campfires on n00bia(needed for the cook-npc)
				base.common.InformNLS(User,"Du solltest das Feuer besser nicht ausmachen, du könntest es noch gebrauchen.","You shouldn't extinguish the fire, you maybe could need it.");
				return;
			else	
			world:makeSound( 9, User.pos );
	            -- Lagerfeuer ausmachen
	            if (TargetItem.id == 12 or TargetItem.id == 359) then
	                world:erase(TargetItem,1);
	                -- Esse ausmachen
	            elseif ( TargetItem.id == 2835 ) then
	                world:swap(TargetItem,2836,333);
	                -- test for seedlings
	            else
					--Planting trees deactivated. Players should not change the map.
	                --MakeSprout( User, SourceItem, TargetItem )
				end
			end
		else
			PourOnCharacter(User, SourceItem, User);
		end
    end
	SourceItem.id = 51;
	SourceItem.data = 0;
	world:changeItem(SourceItem);
end  -- function

function PourOnCharacter (Character, SourceItem, TargetCharacter )

    world:makeSound( 9, Character.pos );
    SourceItem.id = 51;
    SourceItem.data = 0;
    world:changeItem(SourceItem);
	base.common.InformNLS(TargetCharacter, "Du fühlst dich gleich viel sauberer.", "You feel much cleaner.");

end

function MakeSprout( User, SourceItem, TargetItem )
    if seedList == nil then
        seedList = {  };
        seedList[ 15 ] = {139,4};              -- Apple tree seedling
        seedList[ 302 ] = {132,4};             -- Cherry tree seedling
        seedList[ 149 ] = {150,2};             -- Fir tree seedling
		--seedList[ ??? ] = {588,???};           -- cachdern seedling
		--seedList[ ??? ] = {589,???};           -- eldan oak seedling
		--seedList[ ??? ] = {590,???};           -- scandrel seedling
		--seedList[ ??? ] = {591,???};           -- naldor tree seedling

    end
    local seed = seedList[ TargetItem.id ];
    if( seed == nil ) then
        return
    end
    local Field = world:getField( TargetItem.pos )
    local boden = base.common.GetGroundType( Field:tile() );

    -- only on fields
    if( boden == seed[2] ) then
        --User:inform( "on field" );

        if BlockCheck(TargetItem.pos) then

            if CheckSucceed(User) then
                world:swap(TargetItem,seed[1],333)
			else
				base.common.InformNLS(User, "Der Setzling braucht noch mehr Wasser um anzuwachsen.", "The seedling needs more water to grow.");
            end

        else
        base.common.InformNLS( User,"Der Boden ist an dieser Stelle zu ausgelaugt, als das Bäume wachsen könnten. Der Setzling geht ein.","The soil at this location is not fertile enough to let a tree grow. The seedling whithers." ); 
        end    
        --User:learn( 2, "peasantry", 1, 100 )
		--Replace with new learn function, see learn.lua 
    end
end

function CheckSucceed(User)
    Con=User:increaseAttrib("constitution",0);
    Pea=User:getSkill("peasantry");
    TryValue=20+60*(Pea/100)+20*(Con/20);
    if (math.random(0,100)<TryValue) then
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
    if allowed == nil then
	    allowed={};
		allowed[273]=true;
		allowed[274]=true;
		allowed[338]=true;
		allowed[1782]=true;
		allowed[1783]=true;
		allowed[1790]=true;
    end
    for i, dir in pairs(Directions) do
        testLoc = position( Posi.x + dir[ 1 ], Posi.y + dir[ 2 ], Posi.z );
        if world:isItemOnField( testLoc ) then
		    theItem=world:getItemOnField(testLoc);
		    if allowed[theItem.id] == nil then
              block = block + dir[ 3 ];
			end
        end
    end
	local Field = world:getField(Posi);
	if(Field:countItems() > 1) then
		return false
	end
    if (block<2) then
        return true
    else
        return false
    end
end

function WaterIntoCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate)
    cauldron = TargetItem
	
	if ( ltstate == Action.abort ) then
		   base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
		
		-- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  base.common.InformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here.")
		  return;
	    end
		
		if ( ltstate == Action.none ) then
            User:startAction( 20, 21, 5, 10, 25)
			return
		end	

	-- water, essence brew, potion or stock is in the cauldron; leads to a failure
	if cauldron:getData("cauldronFilledWith") == "water" then
		base.common.InformNLS( User,
				"Der Kessel läuft über. Offensichtlich war schon Wasser in ihm.",
				"The water runs over. Obviously, ther was already water in it.")
		world:makeSound(9,cauldron.pos)
		world:gfx(11,cauldron.pos)
		
	elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
		world:gfx(1)
		base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Wasser hinzu tust.", 
		                            "The substance in the cauldron blows out, as you fill the water in.")
		for i=1,8 do
			cauldron:setData("essenceHerb"..i,"")
			world:changeItem(cauldron)
	    end	
		cauldron:setData("cauldronFilledWith","")
        cauldron:setData("potionId","")		
									
	elseif cauldron:getData("potionEffectId") ~= "" then
		world:gfx(1)
		base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Wasser hinzu tust.", 
		                            "The substance in the cauldron blows out, as you fill the water in.")
		cauldron:setData("potionEffectId","")
        cauldron:setData("potionId","")
        cauldron:setData("potionQuality","")
		
	elseif cauldron:getData("stockData") ~= "" then
		world:gfx(1)
		base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Wasser hinzu tust.", 
		                            "The substance in the cauldron blows out, as you fill the water in.")
	    cauldron:setData("stockData","")
	    
	else -- nothing in the cauldron, we just fill in the water
	    cauldron:setData("cauldronFilledWith","water")
    end

	world:changeItem(cauldron)
	SourceItem.id = 51
	SourceItem.quality = 333
	world:changeItem(SourceItem)
end