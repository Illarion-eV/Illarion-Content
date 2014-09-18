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
-- Location: 28 190 -12
-- Purpose: invisible wall for secret passage to well, testing for

module("triggerfield.aq001_wcgate", package.seeall)
local common = require("base.common")

function MoveToField( user )
    if world:isItemOnField( position( 28, 190, -12) ) then
        if (world:getItemOnField( position( 28, 190, -12) )).id ~= 287 then

            local left = user:getItemAt(5);
            local right = user:getItemAt(6);

            if( (right.id == 2496) and (left.id == 2496) and ( ((tonumber(right:getData("wallData")) == 1) and (tonumber(left:getData("wallData")) == 2)) or (((tonumber(right:getData("wallData")) == 2) and (tonumber(left:getData("wallData")) == 1)) ) )) then
                right:setData("wallData", 0);
                left:setData("wallData", 0);
                right.id = 2498;
                left.id = 2498;
                world:changeItem(right);
                world:changeItem(left);
            else
			    common.InformNLS(user,"Eine unsichtbare Wand hält dich zurück.","An invisible wall holds you back.");
                user:warp(position(27,190,-12));
            end;

        end;

    end

end
