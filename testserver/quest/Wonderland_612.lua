-- INSERT INTO quests SET qst_script = 'quest.Wonderland_612' WHERE qst_id = 612;

require("base.common")
require("handler.sendmessagetoplayer")
require("handler.warpplayer")
require("questsystem.base")
module("quest.Wonderland_612", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Wunderland"
Title[ENGLISH] = "Wonderland"

local QUEST_NUMBER = 612
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 0

function MoveToField( Character )
    if Character.pos == position(890,596,0)
    	then
    destination = position(900,580,0)
    end
end


function MoveToField( PLAYER )
    if PLAYER.pos == position(890,596,0)
    and ADDITIONALCONDITIONS(PLAYER) 
    and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE)
	then
    
        HANDLER(PLAYER)
    
        questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        return true
    end
    
    return false
end


function HANDLER(PLAYER)
    handler.warpplayer.warpPlayer(PLAYER, position(900, 580, 0)):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du gehörst nun mir!\" Nach einer Weile hörst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"", "You hear a laughter and a scratchy voice is saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Go away from me!\""):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end
