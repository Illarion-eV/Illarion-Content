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
local x={};
local y={};
	if (math.random(100)<= 5) then
		monster:talk(CCharacter.yell, "I'll tear your soul apart!");
		local CharList={};
		position = monster.pos;
		CharList = world:getCharactersInRangeOf (position, 10);
		
		for i=1,table.getn(CharList) do
			if CharList[i]:increaseAttrib ("hitpoints",0) > 3000 then
				if CharList[i]:increaseAttrib ("constitution",0) > 5 then
					return false;
				else
					for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
						for y = (monster.pos.y - 1) ,(monster.pos.y + 1) do
							if not world:isCharacterOnField (x,y,monster.pos.z) then 
								CharList[i]:inform ("You feel an unbeatable force pulling you towards the demon.");
								CharList[i]:warp (x,y,monster.pos.z);
								CharList[i].movepoints = 0;
								CharList[i]:increaseAttrib ("hitpoints",-1000);
								return true;
							end
						end
					end
				end
			else
				for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
					for y = (monster.pos.y - 1),(monster.pos.y + 1) do
						if not world:isCharacterOnField (x,y,monster.pos.z) then 
							CharList[i]:inform ("You feel an unbeatable force pulling you towards the demon.");
							CharList[i]:warp (x,y,monster.pos.z);
							CharList[i].movepoints = 0;
							CharList[i]:increaseAttrib ("hitpoints",-1000);
							return true;
						end
					end
				end
			
			end
		end	
	end
end
							
			
