require("base.class")
require("item.lever") -- this is needed so that we can access the quest-class object we created there.

module("quest.leverquest", package.seeall)

-- This should be the base class for the leverquest; it should hopefully serve as an example how to do quests.
LeverQuest = base.class.class(function(lvQst)  -- this is the constructor
    lvQst.theString="";                         -- this initializes the string that is produced by the levers and the sequence they were pulled.
    lvQst.levPos1=position(220,735,0);
    lvQst.levPos2=position(220,737,0);
    lvQst.levPos3=position(220,739,0);
    lvQst.levPos4=position(220,741,0);
    lvQst.levPos5=position(220,743,0);
end);

function LeverQuest:addToString(char)
    if (string.find(self.theString,char)==nil) then
        self.theString=self.theString..char;
    end
    
    if (string.len(self.theString)==5)then
        self:checkSuccess();
    end
    
    plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
    for i, player in pairs(plyList) do
        player:inform("theString now is:"..self.theString);
    end
end

function LeverQuest:checkSuccess()
    if (self.theString=="12345") then       -- replace this by the true condition
        plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
        for i, player in pairs(plyList) do
            player:inform("GEWONNEN");      -- replace this with the true consequence
        end
    end
    self.theString="";                      -- add the reset of levers here.
end