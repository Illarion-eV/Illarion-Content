-- UPDATE common SET com_script = 'test.vilarion' WHERE com_itemid = 9;

module("test.vilarion", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    if User.id ~= 64 then
        User:inform("e-Vil says: You are not allowed to use this!");
        return;
    end;
    SourceItem.quality = 90;
    world:changeItem(SourceItem);

--    world:createDynamicNPC("Test1",50,position(User.pos.x-1,User.pos.y,User.pos.z),0,"test.vilarion");
--    world:createDynamicNPC("Test2",1,position(User.pos.x+1,User.pos.y,User.pos.z),0,"test.vilarion");
end

function useNPC(User,counter,param)
    User:inform("Name: " .. thisNPC.name .. ", Id: " .. thisNPC.id);
end