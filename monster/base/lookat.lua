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
-- monster lookat
local M = {}

-- mode is always 0
function lookAtMonster( player, monster, mode )
	
	player:inform("name: ".. monster.name .. "; ID: ".. monster:getMonsterType());
	local output = "";
	
	local lang = player:getPlayerLanguage();
	if lang==0 then
		output = output .. "Dieses Wesen scheint " .. getHPText(monster:increaseAttrib("hitpoints",0),lang) .. " zu sein."
	elseif lang==1 then
		output = output .. "This creature appears to be " .. getHPText(monster:increaseAttrib("hitpoints",0),lang) .. ".";
	end
	
	if output~="" then
		player:sendCharDescription(monster.id,output);
	end
end

function getHPText(HP,language)
    if HPText==nil then
        HPText={};
        HPText[0]={};
        HPText[1]={};
        HPText[0][6]="gesund";
        HPText[1][6]="healthy";
        HPText[0][5]="leicht verwundet";
        HPText[1][5]="slightly wounded";
        HPText[0][4]="verwundet";
        HPText[1][4]="wounded";
        HPText[0][3]="schwer verwundet";
        HPText[1][3]="seriously wounded";
        HPText[0][2]="kritisch verwundet";
        HPText[1][2]="critically wounded";
        HPText[0][1]="dem Tod nahe";
        HPText[1][1]="almost dead";
    end
    local interval=math.ceil(HP/1700);
    return HPText[language][interval];
end

return M