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
-- Location: -50 201 -3
-- Purpose: simulate illusion wall

module("triggerfield.aq001_wall", package.seeall)
local common = require("base.common")

function MoveFromField(User)
    if (User:getFaceTo() == 0) then
	    common.InformNLS(user,"Die solide aussehende Höhlenwand war anscheinend nur eine Illusion und du stolperst in einen stockfinsteren Schacht...","Apparently the solid seeming cave wall was just an illusion and you stumble into a pitch-dark shaft...");
        User:warp( position( -50, 200, -9 ) );
    end;
end
