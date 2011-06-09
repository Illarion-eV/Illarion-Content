-- UPDATE common SET com_script = 'test.vilarion' WHERE com_itemid = 9;

module("test.vilarion", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    if User.id ~= 64 then
        User:inform("e-Vil says: You are not allowed to use this!");
        return;
    end;

    -- User:inform("ID: "..SourceItem.id.."; Quality: "..SourceItem.quality.."; Data: "..SourceItem.data);

    User:eraseItem(2640,1);

    -- User:inform("- before -");
    -- world:erase( it, 1 );
    -- debug( "Testing debug(...)" );
    -- User:inform("- after -");

    -- world:createDynamicNPC("Test1",1,position(User.pos.x-1,User.pos.y,User.pos.z),0,"test.vilarion");
    -- e = CLongTimeEffect( 777, 30 );
    -- User.effects:addEffect( e );
    
    -- User:increaseMentalCapacity( 100 );

end

function useNPC(User,counter,param)
    User:inform("Name: " .. thisNPC.name .. ", Id: " .. thisNPC.id);
end

function nextCycle()  -- ~10 times per second
    if isValidChar(test.vilarion.user) and test.vilarion.user then
        test.vilarion.counter = test.vilarion.counter + 1;
        if test.vilarion.counter > 100 then
            test.vilarion.user:inform("CRASH");
            test.vilarion.user = nil;
        end;
    end;
end

function receiveText(texttype, message, originator)
    test.vilarion.counter = 0;
    test.vilarion.user = originator;
end

function addEffect( e, c )
    c:inform("--- effect added ---");
    e:addValue("n",9);
end

function callEffect( e, c )
    local found, n = e:findValue("n");
    c:inform("--- effect called, n == "..n.." ---");
    c:inform("idleTime: "..c:idleTime());
    if n>0 then
        e:addValue("n",n-1);
        e.nextCalled = 30;
        return true;
    else
        e:removeValue("n");
        return false;
    end;
end

function doubleEffect( e, c )
    local found, n = e:findValue("n");
    c:inform("--- tried to add effect, but it is still active (n == "..n..") ---");
end;
