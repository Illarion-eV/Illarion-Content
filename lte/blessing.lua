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
module("lte.blessing", package.seeall)
-- Long time Script "Blessing" (25) effectid
-- Triggered by donating money to an altar, and increases attributes temporarily
-- Written by Hadrian (The weird llama person)

    
function addEffect(Blessing, Character)       

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)+1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)+2);
		
    end

function callEffect(Blessing, Character)


	return false;
end

function loadEffect(Blessing, Character)

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)+1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)+2);

end

function removeEffect (Blessing, Character)

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)-1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)-2);

end
