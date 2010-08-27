
-- UPDATE common SET com_script='gm.items.id_93_medal' WHERE com_itemid=93;

module("gm.items.id_93_medal", package.seeall)

function UseItemWithField(User,SourceItem, TargetPos, Counter, Param)
    Counter=1 * string.format("%u",User.lastSpokenText);
    
    if (SourceItem.data==0) then
        world:createMonster(Counter,TargetPos,20);
    elseif (SourceItem.data==1) then
        world:createMonster(Counter+250,TargetPos,20);
    elseif (SourceItem.data==2) then
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
    if ((SourceItem.data==8) and ( (User.id==833275147) or User.id==666) ) then
        UndeadEvent(User.pos);
    else
        if (gm.items.id_99_lockpicks.firsttime == nil) then
            User:inform("firsttime of lockpicks is set to NIL");
        else
            User:inform("firsttime of lockpicks is set to " .. gm.items.id_99_lockpicks.firsttime);
        end
        UseItemWithField(User,SourceItem,position(User.pos.x,User.pos.y+1,User.pos.z),Counter,Param);
    end
end