require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.testmonster.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 3

local MONSTER_ID = 13
local MONSTER_AMNT = 2

function onDeath(MONSTER)
    debug ("*** IN ONDEATH")
    if MONSTER.ID==MONSTER_ID then
        debug ("*** MONSTER ID OK")
        if lastAttack[MONSTER.id]~=nil then
            PLAYER=lastAttack[MONSTER.id]  -- get killer
            if questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
                if killList == nil then
                    killList = {};
                end
                debug ("*** CHECKPOINT 1")
                if killList[PLAYER.id] == nil then
                    killList[PLAYER.id] = {};
                    killList[PLAYER.id][MONSTER.id]=0;
                end
                killList[PLAYER.id][MONSTER.id]=killList[PLAYER.id][MONSTER.id]+1;
                debug ("*** KILLED: "..killList[PLAYER.id][MONSTER.id])
                if killList[PLAYER.id][MONSTER.id] >= MONSTER_AMNT then
handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "test", "test"):execute()
                    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
                end
            end
        end
    end
    return false
end

function onAttacked(Monster,Attacker)
    lastAttack[Monster.id]=Attacker; -- Keeps track who attacked the monster last
    return false
end

function onCasted(Monster,Attacker)
    lastAttack[Monster.id]=Attacker; -- Keeps track who attacked the monster last
    return false
end
