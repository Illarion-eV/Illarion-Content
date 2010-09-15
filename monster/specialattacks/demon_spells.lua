-- This is the script handeling the special attacks for the "Ancient Evil" demon.
-- Done by Grim

module("monster.specialattacks.demon_spells", package.seeall)
function Demon_Pull (monster, char)
 --Pull - The demon pulls the weakest char to himself and gets a free hit on him
	if (math.random(100)<= 10) then
		monster:talk(CCharacter.yell, "I'll tear your soul apart!");
		local CharList={};
		position = monster.pos;
		CharList = world:getCharactersInRangeOf (position, 10);
		
		for i=0,table.getn(CharList) do
			if char[i]:increaseAttrib ("hitpoints",0) > 3000 then
				if char[i]:increaseAttrib ("constitution",0) > 5 then
					return false;
				else
					for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
						for y = (monster.pos.y - 1) ,(monster.pos.y + 1) do
							if not world:isCharacterOnField (x,y,monster.pos.z) then 
								char[i]:inform ("You feel an unbeatable force pulling you towards the demon.");
								char[i]:warp (x,y,monster.pos.z);
								char[i].movepoints = 0;
								char[i]:increaseAttrib ("hitpoints",-1000);
								return true;
							end
						end
					end
				end
			else
				for x = (monster.pos.x - 1),(monster.pos.x + 1) do					--verify if free space next to demon
					for y = (monster.pos.y - 1),(monster.pos.y + 1) do
						if not world:isCharacterOnField (x,y,monster.pos.z) then 
							char[i]:inform ("You feel an unbeatable force pulling you towards the demon.");
							char[i]:warp (x,y,monster.pos.z);
							char[i].movepoints = 0;
							char[i]:increaseAttrib ("hitpoints",-1000);
							return true;
						end
					end
				end
			
			end
		end	
	end
end
							
			
