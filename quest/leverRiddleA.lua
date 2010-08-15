require("base.class")
require("quest.leverquest")

-- For Fal-Fal's lever Riddle

module("quest.leverRiddleA", package.seeall)

LeverRiddleAClass = base.class.class(function(levRdl, char)
    levRdl.toAdd = char;         -- the character to add
end);

function LeverRiddleAClass:execute()
    if questA==nil then     -- only create ONE object of the quest to make sure that every lever uses the same quest-string.
        plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
            for i, player in pairs(plyList) do
            player:inform("now calling constructor...");--..questA:getString());
        end
        questA=quest.leverquest.LeverQuest();
    end
    
    questA:addToString(self.toAdd);
    
    ------------------DEBUG INFORMATION---------------------
    plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
    for i, player in pairs(plyList) do
        player:inform("self.toAdd : "..self.toAdd.." and "..questA:getString());
    end
   --------------------------------------------------------------
    
end