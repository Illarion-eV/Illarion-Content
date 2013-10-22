require("base.common")

-- foxhole, id 3000
-- Purpose: Close rockwall entrance again (item 623)

module("lte.foxhole", package.seeall)

function addEffect(Effect, User)

end

function callEffect(Effect, User)
  local pos = position(894, 627, 0);

  -- move character who blocks the entrance
  if world:isCharacterOnField(pos) then
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
  world:createItemFromId(623, 1, pos, true, 333, nil); --rock
  base.common.HighInformNLS(User,
    "Die Steinwand erscheint wieder.",
	"The rock wall appears again.");

  return false
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)

end
