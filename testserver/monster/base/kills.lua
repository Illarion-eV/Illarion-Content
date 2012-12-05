module("monster.base.kills",package.seeall)

lastAttacker={};

function setLastAttacker(monster, enemy)
    lastAttacker[monster.id] = enemy;
end;

function getLastAttacker(monster)
	return lastAttacker[monster.id];
end;

function hasLastAttacker(monster)
	return lastAttacker[monster.id] ~= nil;
end;

function isLastAttacker(monster, enemy)
	return lastAttacker[monster.id] == enemy;
end;