require("base.class")
--require("quest.leverquest")

-- For Fal-Fal's lever Riddle

module("quest.leverRiddleA", package.seeall)

LeverRiddleAClass = base.class.class(function(levRdl, char)
    levRdl.toAdd = char;         -- the character to add
end);

function LeverRiddleAClass:execute()
  --  if string.find( quest.leverquest.getString, self.toAdd ) == nil then    -- if the lever was not pulled already
  --      quest.leverquest.addToString(self.toAdd);          -- append new character
--
--		if string.len( quest.leverquest.theString ) == 5 then               -- 5 levers were pulled already
                                                        -- check whether the sequence was right in here!
  --      end   
  --  end
    
    ------------------DEBUG INFORMATION---------------------
    plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
    for i, player in pairs(plyList) do
        player:inform("self.toAdd : "..self.toAdd);
    end
   --------------------------------------------------------------
    
end