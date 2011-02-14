-- UPDATE common SET com_script = 'test.vilarion' WHERE com_itemid = 9;

module("test.vilarion", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    if User.id ~= 64 then
        User:inform("e-Vil says: You are not allowed to use this!");
        return;
    end;

    local ItemList = User:getItemList(1);
    for i, item in pairs(ItemList) do
        if (item == nil) then
            User:inform("ItemList["..i.."] == nil" );
        else
            User:inform("ItemList["..i.."] == "..item.id );
        end;
    end;

--    world:createDynamicNPC("Test1",1,position(User.pos.x-1,User.pos.y,User.pos.z),0,"test.vilarion");

end

function useNPC(User,counter,param)
    User:inform("Name: " .. thisNPC.name .. ", Id: " .. thisNPC.id);
end

function nextCycle()  -- ~10 times per second
    if test.vilarion.user then
        test.vilarion.counter = test.vilarion.counter + 1;
        if test.vilarion.counter > 100 then
            test.vilarion.user:inform("CRASH");
            test.vilarion.user = 0;
        end;
    end;
end

function receiveText(texttype, message, originator)
    test.vilarion.counter = 0;
    test.vilarion.user = originator;
end
