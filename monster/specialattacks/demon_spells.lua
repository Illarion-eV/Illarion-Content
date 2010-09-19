-- This is the script handeling the special attacks for the "Ancient Evil" demon.
-- Done by Grim
require("monster.base.drop")
require("base.common");
module("monster.specialattacks.demon_spells", package.seeall)


function Demon_Pull (monster, char)
 --Pull - The demon pulls the weakest char to himself.
	if monster:getSkill("Common language") < 100 then
		monster:increaseSkill(1,"Common language",100);
	end

	if (math.random(100)<= 90) then
		monster:talk(CCharacter.yell, "I'll tear your soul apart!");
		CharList={};
		position = monster.pos;
		local CharList = world:getCharactersInRangeOf (position, 10);
		
		for i,v in pairs(CharList) do
			if v:increaseAttrib ("hitpoints",0) > 3000 then
				if v:increaseAttrib ("constitution",0) > 5 then
					return false;
				else
					for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
						for y = (monster.pos.y - 1) ,(monster.pos.y + 1) do
							if not world:isCharacterOnField (x,y,monster.pos.z) then 
								v:inform ("You feel an unbeatable force pulling you towards the demon.");
								v:warp (x,y,monster.pos.z);
								v.movepoints = 0;
								v:increaseAttrib ("hitpoints",-1000);
								return true;
							end
						end
					end
				end
			else
				for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
					for y = (monster.pos.y - 1),(monster.pos.y + 1) do
					local SearchArea = position (x,y,monster.pos.z);
						if not world:isCharacterOnField (SearchArea) then 
							v:inform ("You feel an unbeatable force pulling you towards the demon.");
							v:warp (x,y,monster.pos.z);
							v.movepoints = 0;
							v:increaseAttrib ("hitpoints",-1000);
							return true;
						end
					end
				end
			
			end
		end	
	end
end
							
			
