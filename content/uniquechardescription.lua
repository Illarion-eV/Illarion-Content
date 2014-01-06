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
-- This could be maybe used for scars or stigmas - would be a good punishment for thieves imo

module("content.uniquechardescription", package.seeall)

function AddPlayerDescription(id, textde, texten)
	table.insert(PlayerDescriptionsDE[id], textde);
	table.insert(PlayerDescriptionsEN[id], texten);
end

function InitPlayerDesc()

	if(Init == nil) then
		
		PlayerDescriptionsDE = {{}};
		PlayerDescriptionsEN = {{}};
		
		--AddPlayerDescription(PlayerID, TextDE, TextEN);
	
		Init = 1;
	end
end
