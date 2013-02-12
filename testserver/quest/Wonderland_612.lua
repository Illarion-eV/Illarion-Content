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


function MoveToField( Character )
    if Character.pos == position(890,596,0)
    	then
    destination = position(900,580,0)
    end
end

