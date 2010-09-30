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
		
function Energy_Beam (Monster, Enemy)
-- Energy Beam - straight line spell that does huge damage to everything in it's way. Boss gets rooted for 1 second before this.
end








 	