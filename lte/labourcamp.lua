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
module("lte.labourcamp", package.seeall)

-- INSERT INTO longtimeeffects VALUES (55, 'labourcamp', 'lte.labourcamp');


function addEffect(Effect, User)
end

function callEffect(Effect,User)

    if User.pos.z ~= -40 then -- security check: char not in labour camp, remove lte
	    return false
	end	
	
	local findCounter,spamProtection_1 = Effect:findValue("spamProtection_1")
    if findCounter then
	   spamProtection_1 = common.Limit((spamProtection_1 - 1), 0, 5)
	   Effect:addValue("spamProtection_1",spamProtection_1)
    end
   
    return true
end

function removeEffect(Effect,User)
end

function loadEffect(Effect,User)
end