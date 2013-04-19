require("base.class")
require("quest.leverquest")
--require("item.lever")

-- For Fal-Fal's lever Riddle. This class handles the behaviour of the levers, but no real content of the quest. This is done in the LeverQuest class.

module("quest.leverRiddleA", package.seeall)

LeverRiddleAClass = base.class.class(function(levRdl, char, quest)
    levRdl.toAdd = char;        -- the character to add
    levRdl.theQuest=quest;      -- the LeverQuest-instance is member of the lever-class
end);

function LeverRiddleAClass:execute()        -- this function gets called when a lever is pulled...
    self.theQuest:addToString(self.toAdd);  -- add the char to the quest-string that is member of the quest-class (LeverQuest). 
                                            --The LeverQuest-object is member of this class.
end
