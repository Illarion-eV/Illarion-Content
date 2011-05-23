
-- UPDATE common SET com_script='gm.items.id_93_medal' WHERE com_itemid=93;

require("base.common")
module("gm.items.id_93_medal", package.seeall)

function UseItemWithField(User,SourceItem, TargetPos, Counter, Param)
    local a, _, number = string.find(User.lastSpokenText, "(%d+)");
    Counter = 1 * number;
    
    if (SourceItem.data==0) then
	    User:inform("#w Creating monster with ID "..Counter);
        world:createMonster(Counter,TargetPos,20);
    elseif (SourceItem.data==1) then
	    User:inform("#w Creating monster with ID "..Counter+250);
	    world:createMonster(Counter+250,TargetPos,20);
    elseif (SourceItem.data==2) then
		User:inform("#w Creating monster with ID "..Counter+500);
        world:createMonster(Counter+500,TargetPos,20);
    elseif (SourceItem.data==3) then
		world:gfx(Counter,TargetPos);
    elseif (SourceItem.data==4) then
        world:makeSound(Counter,TargetPos);
    elseif (SourceItem.data==5) then
		User:setAttrib("racetyp",Counter);
	else
        User:inform("Data 0;1;2 : Monsters - Data 3 : GFX - Data 4: SFX - Data 5: Race change");
    end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    UseItemWithField(User,SourceItem,base.common.GetFrontPosition(User),Counter,Param);
end
