module("monster.base.kills",package.seeall)

function setLastAttacker(monster,enemy)
    if lastAttacker==nil then
        lastAttacker={};
    end
    debug("setting last attacker now:")
    lastAttacker[monster.id]=enemy;
    debug("DONE")
end