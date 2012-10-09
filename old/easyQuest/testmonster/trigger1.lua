require("handler.sendmessagetoplayer")
require("questsystem.base")
require("monster.base.kills")
module("questsystem.testmonster.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 3

local MONSTER_AMNT = 2

function onDeath(MONSTER)
    debug ("*** IN ONDEATH")
    if monster.base.kills.lastAttacker[MONSTER.id]~=nil then
        debug("*** FOUND PLAYER!!")
        PLAYER = monster.base.kills.lastAttacker[MONSTER.id]  -- get killer
        if questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then     -- this one is really doing our quest
            if killList == nil then
                killList = {};
            end
            debug ("*** CHECKPOINT 1")
            if killList[PLAYER.id] == nil then
                debug ("*** CHECKPOINT 2")
                killList[PLAYER.id] = {};
                killList[PLAYER.id][MONSTER:getMonsterType()]=0;
                debug ("*** CHECKPOINT 3")
            end
            killList[PLAYER.id][MONSTER:getMonsterType()]=killList[PLAYER.id][MONSTER:getMonsterType()]+1;
            debug ("*** KILLED: "..killList[PLAYER.id][MONSTER:getMonsterType()])
            if killList[PLAYER.id][MONSTER:getMonsterType()] >= MONSTER_AMNT then
handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "test", "test"):execute()
                questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
            end
        end
    end
    return false
end
