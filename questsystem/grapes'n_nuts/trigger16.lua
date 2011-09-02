require("handler.sendmessagetoplayer")
require("handler.eraseplayeritem")
require("questsystem.base")
module("questsystem.grapes'n_nuts.trigger16", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 20
local POSTCONDITION_QUESTSTATE = 39

local ITEM_ID = 388
local ITEM_AMNT = 9
local NPC_TRIGGER_DE = ".*"
local NPC_TRIGGER_EN = ".*"
local NPC_REPLY_DE = "Wunderbar! Du hast mir meine Mischung zurükgebracht. Als Belohnung darfst Du ein bißchen davon behalten!"
local NPC_REPLY_EN = "Great! You brough me my mix back. And you reward is that you are allowed to keep some of it!"
local NPC_NOITEM_DE = "Hey, die ist aber nicht vollständig! Wenn Du was davon gegessen oder fallen gelassen hast, musst Du mir da auch wieder was hinzu mischen."
local NPC_NOITEM_EN = "Hey, it is not completed! If you have eaten something from it or lost something, you will have to make my mix complete! "

function receiveText(type, text, player)
  if questsystem.base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE)
      and player:getType() == Character.player
      and string.find(text, getNLS(player, NPC_TRIGGER_DE, NPC_TRIGGER_EN)) then
    if player:countItem(ITEM_ID)>=ITEM_AMNT then
      thisNPC:talk(Character.say, getNLS(player, NPC_REPLY_DE, NPC_REPLY_EN))
        
handler.eraseplayeritem.erasePlayerItem(PLAYER, 388, 6):execute()
handler.eraseplayeritem.erasePlayerItem(PLAYER, 759, 6):execute()
handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Ein Teil der Traube-Nuss-Mischung hat Iradona Dir überlassen. Guten Appetit!", "Irandora let you keep some of the grapes and nuts mix. Enjoy it!"):execute()
        
      questsystem.base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    
      return true
    else if (NPC_NOITEM_DE~="") then
      thisNPC:talk(Character.say, getNLS(player, NPC_NOITEM_DE, NPC_NOITEM_EN))
      
      return true
    else
      return false
    end
  end

  return false
end

function getNLS(player, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    return textDe
  else
    return textEn
  end
end
end
