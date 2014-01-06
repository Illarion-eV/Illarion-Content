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
require("base.common")

-- INSERT INTO scheduledscripts VALUES('scheduled.mapitemreset', 30, 30, 'resetMapitem');
--
-- Purpose: Close rockwall entrance again (item 623)

module("scheduled.mapitemreset", package.seeall)

function resetMapitem()
  local pos = position(894, 627, 0);

  -- move character who blocks the entrance
  if (world:isCharacterOnField(pos)) then
    local blocker = world:getCharacterOnField(pos);
	world:gfx(7, pos);
	world:makeSound(4, pos);
	local targetPos = position(892, 627, 0);
    blocker:warp(targetPos);
    world:gfx(7, targetPos);
	base.common.HighInformNLS(blocker,
	  "Ein Windstoss wirft dich zurück bevor die Felswand dich trifft!",
	  "A wind gust throws you back before the rock hits you!");
  end

  -- close rockwall
  if (world:getItemOnField(pos).id ~= 623) then
    world:createItemFromId(623, 1, pos, true, 333, nil); --rock

    local Characters = world:getPlayersInRangeOf(pos, 5);
    for i, Char in pairs(Characters) do
      base.common.InformNLS(Char,
	  "Eine Steinwand erscheint wie aus dem nichts.",
	  "A rock wall appears out of nowhere.");
    end
  end
end
