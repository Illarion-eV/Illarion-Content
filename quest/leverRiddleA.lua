require("base.class")
require("quest.leverquest")
--require("item.lever") -- this is needed so that we can access the quest-class object we created there.

-- For Fal-Fal's lever Riddle

module("quest.leverRiddleA", package.seeall)

LeverRiddleAClass = base.class.class(function(levRdl, char)
    levRdl.toAdd = char;         -- the character to add
end);

function LeverRiddleAClass:execute()        -- this function gets called when a lever is pulled...
    if questA==nil then     -- only create ONE object of the quest to make sure that every lever uses the same quest-string.
        plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
        for i, player in pairs(plyList) do
            player:inform("questA is nil here!!!");
        end
        questA=quest.leverquest.LeverQuest();   -- at the first execution, create an object of that class.
    end
    questA:addToString(self.toAdd);  -- add the char to the quest-string that is member of the quest-class (LeverQuest) 
end