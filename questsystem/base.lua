module("questsystem.base", package.seeall)

function fulfilsPrecondition(player, questNumber, questState)
  return player:getQuestProgress(questNumber) == questState
end

function setPostcondition(player, questNumber, questState)
  player:setQuestProgress(questNumber, questState)
end