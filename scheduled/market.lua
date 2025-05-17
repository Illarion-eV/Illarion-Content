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

local function placeMarketStands()

    local tablePositions = {position(678, 319, 0), position(679, 319, 0), position(680, 319, 0), position(678, 325, 0), position(679, 325, 0), position(680, 325, 0), position(682, 321, 0), position(682, 322, 0), position(682, 323, 0), position(676, 321, 0), position(676, 322, 0), position(676, 323, 0)}

    for i, _ in pairs(tablePositions) do
        local theTable = world:createItemFromId(320, 1, tablePositions[i], false, 333, nil)
        theTable.wear = 21
        world:changeItem(theTable)
    end

    local depotPositions={position(679, 319, 0), position(679, 325, 0), position(682, 322, 0), position(676, 322, 0)}

    for i, _ in pairs(depotPositions) do
        local theDepot = world:createItemFromId(321, 1, depotPositions[i], false, 333, {depot=tostring(100+i)})
        theDepot.wear = 21
        world:changeItem(theDepot)
    end
end

local announced = false
local started = false
local over = true

function M.market()

    --Read date and time
    local month = world:getTime("month")
    local day = world:getTime("day")
    local hour = world:getTime("hour")
    local monthString = common.Month_To_String(world:getTime("month"))

    --Market takes place the first three days of each month except for Mas
    if (month == 16) or (day > 3) then
        return
    end

    --Announce the market day one ingame hour before it takes place
    if (hour == 11) and not announced then

        world:broadcast("In etwa zwanzig Minuten wird auf dem Gelände des Gasthofs zur Hanfschlinge der Markt des Monats "..monthString.." veranstaltet. Macht eure Waren bereit!","In around twenty minutes, the market of the month "..monthString.." will be held on the premises of the Hemp Necktie Inn. Get your goods ready!");
        announced=true;
        started=false;
        over=false;
        return;

    --Invites the players
    elseif (hour == 12) and not started then

        world:broadcast("Der Markt des Monats "..monthString.." hat soeben auf dem Gelände des Gasthofs zur Hanfschlinge begonnen!","The market of the month "..monthString.." has started on the premises of the Hemp Necktie Inn!");
        announced=false;
        started=true;
        over=false;
        placeMarketStands();
        return;

    --Event is over. The market stands and depots will rot away
    elseif (hour == 15) and not over then

        world:broadcast("Der Markt des Monats "..monthString.." ist beendet. Die Marktstände werden in Kürze abgebaut.","The market of the month "..monthString.." is over. The market stands will be dismantled soon.");
        announced=false;
        started=false;
        over=true;
        return;

    end
end

return M
