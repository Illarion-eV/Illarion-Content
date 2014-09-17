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
-- INSERT INTO triggerfields VALUES (495,728,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (488,726,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (486,711,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (493,702,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (495,710,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (483,727,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (475,728,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (464,719,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (470,720,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (458,732,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (465,737,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (451,736,0,'triggerfield.raptor_hole');

local common = require("base.common")
module("triggerfield.raptor_hole", package.seeall)


function MoveToField(char)
	if char:getType() ~= Character.player then --Player will be ingored
		world:makeSound(26,char.pos); --Rrroaaaarrrr!
	end	
end
