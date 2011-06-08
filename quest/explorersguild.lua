module("quest.explorersguild", package.seeall)

function CheckStone(Char,StoneNumber)
    retVal=false;
    StoneBase=math.floor((StoneNumber-1)/32);  -- Stone 0 to 31 -> 0, 32-.. ->2 etc.
    StoneBaseOffset=math.mod(StoneNumber-1,32);  -- StoneNr inside range
    HasStones=Char:getQuestProgress(130+StoneBase);
    GotStone=LuaAnd(2^(StoneNumber-1),HasStones);
    if GotStone>0 then
        retVal=true;
    end
    return retVal;
end

function CountStones(Char)

end