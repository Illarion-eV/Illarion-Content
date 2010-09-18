-- This is the script handeling the special attacks for the "Merinium Golem".
-- Done by Grim
require("monster.base.drop")
require("base.common");
module("monster.specialattacks.mgolem_spells", package.seeall);

function MGolem_PowerFist (monster, char)
-- Power Fist - big damage hit, sends char flying (to be used with EnemyNear function
	if (math.random(100)<= 75) then
			if (monster.pos.z == char.pos.z) and ((math.abs(monster.pos.x - char.pos.x) <= 1) and (math.abs(monster.pos.y - char.pos.y) <= 1)) then
		char:inform("Test");
				base.common.TurnTo(monster, char.pos);
				
				if char.pos.x-golem.pos.x>=0 then
					local NewCharPosX = char.pos.x + math.round(10*math.cos(math.atan((char.pos.y-monster.pos.y)/(0.000000001+char.pos.x-monster.pos.x))));
				else
					local NewCharPosX = char.pos.x - math.round(10*math.cos(math.atan((char.pos.y-monster.pos.y)/(0.000000001+char.pos.x-monster.pos.x))));
				end
				
				if char.pos.x-golem.pos.x>=0 then
					local NewCharPosY = char.pos.y + math.round(10*math.cos(math.atan((char.pos.y-monster.pos.y)/(0.000000001+char.pos.x-monster.pos.x))));
				else
					local NewCharPosY = char.pos.y - math.round(10*math.cos(math.atan((char.pos.y-monster.pos.y)/(0.000000001+char.pos.x-monster.pos.x))));
				end
				
				local ThrowPosition = position (NewCharPosX,NewCharPosY,char.pos.z);
				
				base.common.CreateLine(ThrowPosition, char.pos, function(currPos)
					if not tileFound then
						if not world:isItemOnField(currPos) then
							local tilePos = currPos;
							tileFound = true;
						end
					end
				end );
	
				if tileFound then
					monster:talk(CCharacter.say, "#me spins just slightly, sending a powerful solid fist on a forward trajectory.");					
					char:warp(tilePos);
					
					-- here we check if the char is wearing metal armor or not. If not, though luck, the golem's hard hit will hurt like hell.
					Metallist = {4,696,2357,2359,2360,2363,2364,2365,2367,2369,2389,2390,2393,2395,2400,2402,2403,2407,};				
					local armor = getItemAt (3);
					for i = 1,table.getn(Metallist) do			
						if Metallist[i] == armor.id then
							char:increaseAttrib("hitpoints", -2000);
							char:inform("You receive a powerful hit in your chest, which sends you flying. Your metal armor seems to have absorbed most of the impact.");
						else
							char:increaseAttrib("hitpoints", -6000);
							char:inform("You receive a very powerful strike in your chest, which sends you flying.");
						end
					end
				end
		else 
			return false;
		end
	else 
		return false;
	end
end

function MGolem_Slam (monster,char)
-- Ground Slam - sends all chars around him flying in all directions, doing damage 
CharList={};
local position = monster.pos;
CharList = world:getCharactersInRangeOf (position, 1);
	if (table.getn(CharList) > 3) and (math.random(100)<= 30) then			--only gets activated when at least 3 chars are around the golem
		
		for i=0,table.getn(CharList) do 
			MGolem_PowerFist (monster, CharList[i]);
		end
	else
		return false;
	end
end

function MGolem_Shield (monster,char)
--  Permanent Spell Shield - each time when casted upon, there is a chance of either shooting a spell back at the attacker (as reflection) or healing itself slightly. (onCasted)	
	if (math.random(100)<= 25) then	
		if (math.random(100)<= 70) then
			monster:talk(CCharacter.say, "#me's merinium body absorbs the spell, soon to repell it back at the caster.");
			char:increaseAttrib ("hitpoints",-3000);
		else
			monster:talk(CCharacter.say, "#me's merinium body absorbs the spell, seemingly energising the it with new strenght.");
			monster:increaseAttrib ("hitpoints",1500);
		end
	else
		return false;
	end
end
			
