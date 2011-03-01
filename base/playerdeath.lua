module("base.playerdeath", package.seeall)

-- player got killed by direct a magic spell (summoned flames are no direct magic spells)
function playerKilledByMagic(Player, Killer)
	base.common.InformNLS(User,"Killed by Nalcaryos");
end

-- player got killed by another player / monster
function playerKilledByFighting(Player, Killer)
	base.common.InformNLS(User,"Killed by Nalcaryos");
end

-- death reason unknown
function playerKilled(Player)
	base.common.InformNLS(User,"Killed by Nalcaryos");
end

-- monster got killed by another player
function monsterKilledByFighting(MonsterID, Killer)
	base.common.InformNLS(User,"Killed by Nalcaryos");
end

-- player got killed by direct a magic spell (summoned flames are no direct magic spells)
function monsterKilledByMagic(MonsterID, Killer)
	base.common.InformNLS(User,"Killed by Nalcaryos");
end