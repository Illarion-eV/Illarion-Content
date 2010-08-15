require("base.class")

module("quest.leverquest", package.seeall)

-- This should be the base class for the leverquest; it should hopefully serve as an example how to do quests.

LeverQuest = base.class.class(function(lvQst)  -- this is the constructor
    plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
    for i, player in pairs(plyList) do
        player:inform("construktor.1 ");
    end
    lvQst.theString="abc";     -- this initializes the string that is produced by the levers and the sequence they were pulled.
    plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
    for i, player in pairs(plyList) do
        player:inform("construktor. "..lvQst.theString);
    end
end);

function LeverQuest:getString()
   return self.theString;
end

function LeverQuest:addToString(char)
    self.theString=self.theString..char;
    
    plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
    for i, player in pairs(plyList) do
        player:inform("theString: "..self.theString.." and char : "..char);
    end
end
