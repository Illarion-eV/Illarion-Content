-- UPDATE common SET com_script='item.id_1272_markerstone' WHERE com_itemid IN (1272);

require("base.common")

module("item.id_66_markerstone", package.seeall)

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
    Char:talk(CCharacter.say,"DONE");
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    User:talk(CCharacter.say,"Using");
    if (CheckStone(User, SourceItem.data)) then
        User:talk(CCharacter.say,"have it");
    else
        User:talk(CCharacter.say,"don't have it");
    end
    User:talk(CCharacter.say,"YOU Have ****** : "..CountStones(User));
end

function LookAtItem(User,Item)
User:talk(CCharacter.say,"HAHAAAA");
    if (Item.data~=0) then
        DisplayText = base.common.GetNLS( User, "Ein Markierungsstein der Abenteurer Gilde; er trägt die Nummer "..Item.data,"A marker stone of the Explorers Guild; it has the number "..Item.data);
        WriteStone(User,Item.data);
    else
        DisplayText = base.common.GetNLS( User, "Stein", "stone");
    end
    world:itemInform(User,Item, DisplayText );
    
end
