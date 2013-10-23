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
