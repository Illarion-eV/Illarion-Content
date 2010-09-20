module("base.playerdeath", package.seeall)

-- player got killed by direct a magic spell (summoned flames are no direct magic spells)
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

-- player got killed by direct a magic spell (summoned flames are no direct magic spells)
function monsterKilledByMagic(MonsterID, Killer)

end