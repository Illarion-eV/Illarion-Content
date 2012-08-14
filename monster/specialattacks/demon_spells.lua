-- This is the script handeling the special attacks for the "Ancient Evil" demon.
-- Done by Grim
require("monster.base.drop")
require("base.common");
module("monster.specialattacks.demon_spells", package.seeall)


function Demon_Pull (monster, char)
 --Pull - The demon pulls the weakest char to himself.
	if monster:getSkill("common language") < 100 then
		monster:increaseSkill(1,"common language",100);
	end

	if (math.random(100)<= 10) then
		CharList={};
		local posit = monster.pos;
		local CharList = world:getCharactersInRangeOf (posit, 10);
		local SearchArea;
		
		for i,v in pairs(CharList) do
			if v:increaseAttrib ("hitpoints",0) > 5000 then
				if v:increaseAttrib ("constitution",0) > 5 then
					return false;
				else
					for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
						for y = (monster.pos.y - 1) ,(monster.pos.y + 1) do
						SearchArea = position (SearchArea);
							if not world:isCharacterOnField (x,y,monster.pos.z) then 
								monster:talk(Character.yell, "I'll tear your soul apart!");							
								v:inform ("You feel an unbeatable force pulling you towards the demon.",Player.mediumPriority);
								v:warp (SearchArea);
								v.movepoints = 0;
								v:increaseAttrib ("hitpoints",-2000);
								return true;
							end
						end
					end
				end
			else
				for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
					for y = (monster.pos.y - 1),(monster.pos.y + 1) do
					SearchArea = position (x,y,monster.pos.z);
						if not world:isCharacterOnField (SearchArea) then 
							monster:talk(Character.yell, "I'll tear your soul apart!");
							v:inform ("You feel an unbeatable force pulling you towards the demon.",Player.mediumPriority);
							v:warp (SearchArea);
							v.movepoints = 0;
							v:increaseAttrib ("hitpoints",-2000);
							return true;
						end
					end
				end
			
			end
		end	
	end
end
							
			
