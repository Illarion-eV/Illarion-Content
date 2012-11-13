
-- This module holds the core functions for the explorers guild.
-- The questIDs start at 130 and go to 150.
-- Written by Martin


module("quest.explorersguild", package.seeall)

function CheckStone(Char,StoneNumber)
    retVal=false;
    StoneBase=130+math.floor((StoneNumber-1)/32);  -- Stone 0 to 31 -> 0, 32-.. ->2 etc.
    StoneBaseOffset=math.mod(StoneNumber-1,32);  -- StoneNr inside range
    HasStones=Char:getQuestProgress(StoneBase);
    GotStone=LuaAnd(2^(StoneNumber),HasStones);
    if GotStone>0 then
        retVal=true;
    end
    return retVal;
end

function CountStones(Char)
    nrStones=0;
    StoneBase=130;
    StoneEnd=149;
    for i=StoneBase,StoneEnd do
        stones=Char:getQuestProgress(i);
        while stones~=0 do
            nrStones=nrStones+math.mod(stones,2);
            stones=math.floor(stones/2);
        end
    end
    return nrStones
end

function WriteStone(Char,StoneNumber)
    StoneBase=130+math.floor(StoneNumber/32);  -- Stone 0 to 31 -> 0, 32-.. ->2 etc.
    StoneBaseOffset=math.mod(StoneNumber,32);  -- StoneNr inside range
    --Char:inform("Base offset: " .. StoneBase .. " Stone Nr "..StoneBaseOffset .. " for stone "..StoneNumber);
    currentStones=Char:getQuestProgress(StoneBase);
    Char:setQuestProgress(StoneBase,LuaOr(2^StoneBaseOffset,currentStones));
end