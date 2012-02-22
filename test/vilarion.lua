require("handler.sendmessage")
require("base.common")

-- UPDATE common SET com_script = 'test.vilarion' WHERE com_itemid = 9;

module("test.vilarion", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    
    -- setting quest status
    local a, b, quest, status
    a,b,quest,status = string.find(User.lastSpokenText,"reset (%d+) (%d+)")
    if a ~= nil then
        quest = tonumber(quest)
        status = tonumber(status)
        User:setQuestProgress(quest, status)
        User:inform("#w Quest " .. quest .. " has been set to " .. status .. "!")
        return
    end
    a,b,quest = string.find(User.lastSpokenText,"reset (%d+)")
    if a ~= nil then
        quest = tonumber(quest)
        User:setQuestProgress(quest, 0)
        User:inform("#w Quest " .. quest .. " has been reset!")
        return
    end

    if User.id ~= 64 then
        User:inform("e-Vil says: You are not allowed to use this!");
        return;
    end;


    local item = base.common.getFrontItem(User)
    User:inform("Front Item Wear: " .. item.wear);

    --User.effects:addEffect(LongTimeEffect(777, 30))

    --pos = User.pos
    --pos.x = pos.x + 1
    --world:createDynamicNPC("Lasttier",50,pos,0,"npc.lasttier")
    --User:setQuestProgress(8, 1)

    --local callback = function(dialog)
    --    User:inform("Input: "..dialog:getInput())
    --    a()
    --end
    --local inputDialog = InputDialog("Enter something cool!", true, 0, callback)
    --User:requestInputDialog(inputDialog)
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
    e:addValue("n",100);
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
