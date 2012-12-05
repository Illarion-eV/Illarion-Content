require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger19", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 97
local POSTCONDITION_QUESTSTATE = 100

local POSITION = position(408, 308, 0)
local RADIUS = 15
local LOOKAT_TEXT_DE = "Folgende Zeilen sind mit roter Farbe geschrieben: '10 Peitschenschl�ge f�r den Don bel�gen; 100 Peitschenschl�ge f�r den Don betr�gen; 1000 Peitschenschl�ge f�r den Don bestehlen!'"
local LOOKAT_TEXT_EN = "With red colour following words are written: '10 wipe lashes for lying to the Don; 100 wipe lashes for betraying the Don; 1000 wipe lashes for stealing from the Don!'"

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then

    itemInformNLS(PLAYER, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function itemInformNLS(player, item, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    world:itemInform(player, item, textDe)
  else
    world:itemInform(player, item, textEn)
  end
end


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zur�ck zu Iradona und teile ihr mit die Anzahl der Peitschenhiebe.", "Go back to Iradona and tell her the number of wipe lashes."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end