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