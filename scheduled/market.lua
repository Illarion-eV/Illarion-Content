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

local M = {}

function M.market()

    --Read date and time
    month=world:getTime("month");
    day=world:getTime("day");
    hour=world:getTime("hour");
    monthString=common.Month_To_String(world:getTime("month"));

    --Market takes place the first day of each month except for Mas
    if (month == 16) or (day ~= 1) then
        return;
    end

    --Announce the market day one ingame hour before it takes place
    if (hour == 11) and not announced then
 
        --world:broadcast("XXX","Announce!");
        announced=true;
        started=false;
        over=false;
        return;
        
    --Invites the players        
    elseif (hour == 12) and not started then
    
        --world:broadcast("XXX","Invite!");
        announced=false;
        started=true;
        over=false;
        M.placeMarketStands();
        return;
        
    --Event is over. The market stands and depots will rot away   
    elseif (hour == 14) and not over then
    
        --world:broadcast("XXX","Over!");
        announced=false;
        started=false;
        over=true;
        return;
        
    end
        
end

function placeMarketStands()

   
end

return M
