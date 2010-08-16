require("base.class")
require("quest.leverquest")
--require("item.lever")

-- For Fal-Fal's lever Riddle. This class handles the behaviour of the levers, but no real content of the quest. This is done in the LeverQuest class.

module("quest.leverRiddleA", package.seeall)

LeverRiddleAClass = base.class.class(function(levRdl, char, quest)
    levRdl.toAdd = char;         -- the character to add
    levRdl.theQuest=quest;
end);

function LeverRiddleAClass:execute()        -- this function gets called when a lever is pulled...
    if questA==nil then     -- only create ONE object of the quest to make sure that every lever uses the same quest-string.
        questA=quest.leverquest.LeverQuest();   -- at the first execution, create an object of that class.
    end
    
    if self.quest==nil then     -- only create ONE object of the quest to make sure that every lever uses the same quest-string.
        plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
        for i, player in pairs(plyList) do
            player:inform("self.quest unbekannt!");      -- replace this with the true consequence
        end
    end
    
    questA:addToString(self.toAdd);  -- add the char to the quest-string that is member of the quest-class (LeverQuest) 
end