-- This is the script handeling the special attacks for the mega Beholder boss.
-- Done by Grim
require("monster.base.drop")
require("base.common");
module("monster.specialattacks.beholder_spells", package.seeall)

--[[function Death_Gaze (Monster, Enemy)
--  Death Gaze - When in range, all chars that are not wearing full helmet, get damage over time. Permanent spell. 
	CharList={};
	local posit = Monster.pos;
	local CharList = world:getCharactersInRangeOf (posit, 10);
	local HelmList = {7,16,94,184,185,2286,2287,2291,2302,2303,2444,}
	
	for i,v in pairs(CharList) do
		local helmet = v:getItemAt (1);	
		
		for j,k in pairs(HelmList) do
			if not k == helmet.id then
				v:increaseAttrib ("hitpoints",-300);
				v:increaseAttrib ("mana",-300);
				if (math.random(100)<= 5) then
					v:inform ("#w The terrifying gaze of the monster is piercing your skull, making you feel like your head is about to explode.");
				end
			else
				return false;
			end
		end
	end
end
	]]--

function Mana_Burn (Monster, Enemy)
CharList={};
local posit = Monster.pos;
local CharList = world:getCharactersInRangeOf (posit, 10);

	for i,v in pairs(CharList) do
		if v:increaseAttrib ("mana",0) > 0 then
			if (math.random(100)<= 10) then
				Monster:talk(CCharacter.say, "#me makes a terrifying sound, a stream of blue energy suddenly leaving the mage and dissipating into the air.");
				v:increaseAttrib ("mana",-3000);
				v:inform ("#w You suddenly feel drained of mana, your energies weakening.");
				return true;
			else
				return false;
			end
		end
	end
end
		
function Energy_Beam (monster, char, distance)
-- Energy Beam - straight line spell that does damage to everything in it's way.
	if monster:getSkill("common language") < 100 then
		monster:increaseSkill(1,"common language",100);
	end
	
	if (math.random(100)<= 70) then
		if (monster.pos.z == char.pos.z) and ((math.abs(monster.pos.x - char.pos.x) <= 1) and (math.abs(monster.pos.y - char.pos.y) <= 1)) then
			monster:talk(CCharacter.say, "#me charges a ball of pure energy which is immediately shot as a ray, in a forward direction.");
			
			local DamagePosX;		
			if char.pos.x-monster.pos.x == 0 then
				DamagePosX = char.pos.x;
			elseif char.pos.x-monster.pos.x > 0 then
				DamagePosX = char.pos.x + math.floor((distance*math.sqrt(2))/2);
			else
				DamagePosX = char.pos.x - math.floor((distance*math.sqrt(2))/2);
			end
		
			local DamagePosY;
			if char.pos.y-monster.pos.y == 0 then
				DamagePosY = char.pos.y;
			elseif char.pos.y-monster.pos.y > 0 then
				DamagePosY = char.pos.y + math.floor((distance*math.sqrt(2))/2);
			else
				DamagePosY = char.pos.y - math.floor((distance*math.sqrt(2))/2);
			end
			
			local DamagePosition = position (DamagePosX,DamagePosY,char.pos.z);
		--	local tilePos;
		--	local dude;
			
			base.common.CreateLine(char.pos, DamagePosition, function(currPos)
				if world:isCharacterOnField(currPos) then
					local tilePos = currPos;
					local dude = world:getCharacterOnField (tilePos);
					world:gfx( 11, tilePos )
					dude:increaseAttrib("hitpoints", -3000);
					dude:inform("#w You get blasted by a powerful energy ray shot by the monster.");
				end
			end );
			
		else
			return false;
		end
	else
		return false;
	end
		
end








 	