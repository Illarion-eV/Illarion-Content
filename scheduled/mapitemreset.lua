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

-- INSERT INTO scheduledscripts VALUES('scheduled.mapitemreset', 30, 30, 'resetMapitem');

local M = {}

function M.resetMapitem()

  -- close rockwall entrance again (item 623)
  local pos = position(894, 627, 0);

  -- move character who blocks the entrance
  if (world:isCharacterOnField(pos)) then
    local blocker = world:getCharacterOnField(pos);
    world:gfx(7, pos);
    world:makeSound(4, pos);
    local targetPos = position(892, 627, 0);
    blocker:warp(targetPos);
    world:gfx(7, targetPos);
    common.HighInformNLS(blocker,
      "Ein Windstoss wirft dich zurück bevor die Felswand dich trifft!",
      "A wind gust throws you back before the rock hits you!");
  end

  -- close rockwall
  if (world:getItemOnField(pos).id ~= 623) then
    world:createItemFromId(623, 1, pos, true, 333, nil); --rock

    local Characters = world:getPlayersInRangeOf(pos, 5);
    for i, Char in pairs(Characters) do
      common.InformNLS(Char,
      "Eine Steinwand erscheint wie aus dem nichts.",
      "A rock wall appears out of nowhere.");
    end
  end

  -- reset akultut burning room
  if (world:getItemOnField(position(480, 834, -9)).id ~= 2039) then
    for xx = 474, 482 do
        for yy = 834, 844 do
            local pos = position(xx, yy, -9)
            local flame = world:getItemOnField(pos)
            if flame.id == 359 then
                world:erase(flame, flame.number)
            end
        end
    end
    local skull = world:createItemFromId(2039, 1, position(480, 834, -9), true, 333, nil)
    skull.wear = 255
    world:changeItem(skull)
  end

  -- reset akultut exploded skull
  if (world:getItemOnField(position(482, 838, -9)).id ~= 2038) then
    local skull = world:createItemFromId(2038, 1, position(482, 838, -9), true, 333, nil)
    skull.wear = 255
    world:changeItem(skull)
  end
end

return M
