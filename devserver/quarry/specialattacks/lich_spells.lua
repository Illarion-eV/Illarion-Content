-- This is the script handeling the special attacks for the "Lich Overlord".
-- Lich will also use SuddenWarp, CastParalyze,CastMonster(needs to be modified) and CastMonMagic
-- Done by Grim

module("monster.specialattacks.lich_spells", package.seeall)
function Lich_MagicShield (monster, char)
-- Magic shield: If the boss is being cast on, he casts back a massive spell of doom on a) the caster b) a random char around (to be used with onCasted function)
	if (math.random(100)<= 10) then
		if (math.random(100)<= 70) then
			monster:talk(Character.say, "Your efforts are worthless, mortal.. Come, embrace death.");
			char:increaseAttrib ("hitpoints",-4000);
			char.movepoints = 0;
			return true;
		else
			monster:talk(Character.say, "You shouldn't toy with powers you cannot understand, mortal.");
			CharList={};
			local posit = monster.pos;
			CharList = world:getCharactersInRangeOf (posit, 5);
			x=0;
		if (table.getn(CharList)>=3) then
			for i,v in pairs(CharList) do
				while x <= 3 do
					CharList[math.random(table.getn(CharList))]:increaseAttrib ("hitpoints",-2500);
					x = x +1;
				end
			end
		else
			return false;
		end
		end
	else
		return false;
	end
end

function Lich_Forcefield (monster, char)
--  Forcefield: If the boss is attacked with weapons, the attacker gets a ray of energy in his face (to be used with onAttacked function)
	if (math.random(100)<= 70) then
		monster:talk(Character.say, "You want to destroy me..? You can not kill enthernity!");
		char:increaseAttrib ("hitpoints",-3000);
		return true;
	else
		return false;
	end
end

	
					
