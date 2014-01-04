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
module("content.guards", package.seeall)

function InitGuards()
  if (Init == nil) then
    Init = 1;
    Guards = {};
    AddGuard("Horatio Milenus", 1, position(114, 643, 0), 6, "cadomyr guard 1");
    AddGuard("Bre Southstar", 3, position(423, 250, 0), 6, "galmair guard 1");
    AddGuard("Gavin Northstar", 3, position(386, 335, 0), 8, "galmair guard 2");
    AddGuard("Brassius Meres", 2, position(834, 821, 0), 8, "runewick guard 1");
  end
end

-- for details on faction IDs, see base.faction.
-- cadomyr: 1; runewick: 2; galmair: 3
function AddGuard(GuardName, FactionId, WarpPos, Radius, AreaName)
  Guards[GuardName] = {
    faction = FactionId,
    warpPos = WarpPos,
    radius = Radius,
    areaName = AreaName
  };
end