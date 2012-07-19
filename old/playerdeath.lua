require("base.common")
module("base.playerdeath", package.seeall)

-- This script is redundant to server.playerdeath. Please remove all calls of it!

-- Player got killed by direct a magic spell (summoned flames are no direct magic spells)
function playerKilledByMagic(Player, Killer)

end

-- player got killed by another player / monster
function playerKilledByFighting(Player, Killer)
end

-- death reason unknown
function playerKilled(Player)
end

-- monster got killed by another player
function monsterKilledByFighting(MonsterID, Killer)

end

-- monster got killed by direct magic spell (summoned flames are no direct magic spells)
function monsterKilledByMagic(MonsterID, Killer)

end
