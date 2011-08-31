module("monster.base.kills",package.seeall)

function setLastAttacker(monster,enemy)
    if lastAttacker==nil then
        lastAttacker={};
    end
    lastAttacker[monster.id]=enemy;
end