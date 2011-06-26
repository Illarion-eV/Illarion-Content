module("questsystem.base", package.seeall)

local powersOfTwo = {1}
local i
for i = 2,32 do
  powersOfTwo[i] = 2*powersOfTwo[i-1]
end

function fulfilsPrecondition(player, questNumber, questState)
  local questFlags = player:getQuestProgress(questNumber)
  if questState == 0 then
    return questFlags == 0
  end;
  local stateFlag = powersOfTwo[questState]
  return LuaAnd(questFlags, stateFlag) > 0
end

function setPostcondition(player, questNumber, questState)
  local questFlags = player:getQuestProgress(questNumber)
  local stateFlag = powersOfTwo[questState]
  questFlags = LuaOr(questFlags, stateFlag)
  player:setQuestProgress(questNumber, questFlags)
end
