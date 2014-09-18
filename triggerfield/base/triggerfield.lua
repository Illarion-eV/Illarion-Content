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
local common = require("base.common")

module("triggerfield.base.triggerfield", package.seeall)

-- Messages in an array of things that can happen. Each thing is an array: {function, odds}.
function getEvent(messages)
	-- Sum up all odds values in the messages array to figure out the maximum value of the random range
	maxv = common.fold(events, function(val, el) return val + el[2]; end, 0);
	ran = math.random(maxv);

	-- Choose which of the messages from the array to output.
	for i,v in ipairs(messages) do
		ran = ran - v[2];
		if ran <= 0 then
			return v[1];
		end
	end
	-- Should never happen though, as the max value of ran is the sum of all odds
	return {function() end, 0}
end

