--[[
Effect to keep track of the arena monster.

lte ID = 18

author: Lillian
]]

require("base.common")
require("development.arena.base.arena")


module("development.arena.lte.arena", package.seeall)

function addEffect(arenaEffect, User)
    found, level=arenaEffect:findValue("level");
	found, arena=arenaEffect:findValue("arenaID");
    if not found then
        return false;
    end
    development.arena.base.arena.spawnMonster(User, level, arena);
    return true;
end

function callEffect(arenaEffect, User)
    if (User:increaseAttrib("hitpoints",0) == 0) then
        base.common.InformNLS( User,
        "Ihr habt den Kampf verloren. Ihr bekommt keine Punkte.",
        "You lost the fight. You gained no points.)");
        return false;
    end

    arenaEffect.nextCalled = 30;

    local found;
    local arena;
	local level;
	
	found, arena = arenaEffect:findValue("arenaID");
	found, level = arenaEffect:findValue("level");
	
    if not found then
        return false;      -- no monster
    end

    if development.arena.base.arena.checkMonster( User ) then
        base.common.InformNLS( User,
        "Ihr habt euren Gegner geschlagen und Punkte verdient.",
        "You defeated your enemy and gained points for it.");
		development.arena.base.arena.setArenastats(User, arena, development.arena.base.arena.monsterIDsByLevel[level].points);
		local quest = development.arena.base.arena.arenaInformations[arena].quest;
		local points = User:getQuestProgress(quest);
		development.arena.base.arena.setRanklist(User, arena, points);
		User:warp(development.arena.base.arena.arenaInformations[arena].newPlayerPos);
        return false;
    end
	
    return true;
end

function removeEffect(arenaEffect, User)
    development.arena.base.arena.killMonster( User );
    return false;
end

function loadEffect(arenaEffect, User)
    return false;
end
