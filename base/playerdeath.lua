require("base.common")
module("base.playerdeath", package.seeall)

-- player got killed by direct a magic spell (summoned flames are no direct magic spells)
function playerKilledByMagic(Player, Killer)
base.common.TempInformNLS( Player,"[Tod] Du bist gestorben. Die Welt um dich herum verblasst und du bereitest dich darauf vor, den Göttern in Chergas Reich der Toten gegenüberzutreten.","[Death] You have died. The world around you fades and you prepare yourself to face the Gods in the afterlife of Cherga's Realm.");
end

-- player got killed by another player / monster
function playerKilledByFighting(Player, Killer)
base.common.TempInformNLS( Player,"[Tod] Du bist gestorben. Die Welt um dich herum verblasst und du bereitest dich darauf vor, den Göttern in Chergas Reich der Toten gegenüberzutreten.","[Death] You have died. The world around you fades and you prepare yourself to face the Gods in the afterlife of Cherga's Realm.");
end

-- death reason unknown
function playerKilled(Player)
base.common.TempInformNLS( Player,"[Tod] Du bist gestorben. Die Welt um dich herum verblasst und du bereitest dich darauf vor, den Göttern in Chergas Reich der Toten gegenüberzutreten.","[Death] You have died. The world around you fades and you prepare yourself to face the Gods in the afterlife of Cherga's Realm.");
end

-- monster got killed by another player
function monsterKilledByFighting(MonsterID, Killer)

end

-- player got killed by direct a magic spell (summoned flames are no direct magic spells)
function monsterKilledByMagic(MonsterID, Killer)

end