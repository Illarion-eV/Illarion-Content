--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- I_61.lua Goldm&uuml;nzen einschmelzen

-- UPDATE items SET itm_script='item.id_61_goldcoins' WHERE itm_id IN (61);

local common = require("base.common")

module("item.id_61_goldcoins", package.seeall)

if not InitTime then
	InitTime=true;
	TimeList = {};
end

function UseItem(User, SourceItem)

   	if TimeList[User.id]~=nil then
		if  ( (math.abs(world:getTime("second") - TimeList[User.id]) ) <=3) then  --1 Rl. second delay
			return;
		end
	end
   	TimeList[User.id] = world:getTime("second");
		
	if math.random(2) == 1 then	gValue = "Kopf"; eValue = "head";
	else gValue = "Zahl"; eValue = "tail"; end    
	
	User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt "..gValue..".", "#me throws a coin in the air and catches it again. It shows "..eValue..".")

end