
-- General Testscript

-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);

module("item.id_2_flour", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    User:inform("Checking the Queen NPC");
    
    if (npc == nil) then
        User:inform("[npc] table not load.");
        return;
    end;
    User:inform("[npc] table is okay.");
    
    if (npc.atest1 == nil) then
        User:inform("[npc.atest1] table not load.");
        return;
    end;
    User:inform("[npc.atest1] table is okay.");
    
    User:inform("Fetching status flags:");
    
    if (npc.atest1.scriptfound == nil) then
        User:inform("[scriptfound] variable not load. Script not initializied");
        return;
    end;
    if (not npc.atest1.scriptfound) then
        User:inform("[scriptfound] variable set to impossible value! WTF?!");
        return;
    end;
    User:inform("[scriptfound] variable OK");
    
    statusText(User, "initstarted", npc.atest1.initstarted);
    statusText(User, "initdone", npc.atest1.initdone);
    
    statusText(User, "calledNextCycle", npc.atest1.calledNextCycle);
    statusText(User, "thisNPCNextCycle", npc.atest1.thisNPCNextCycle);
    statusText(User, "finishedNextCycle", npc.atest1.finishedNextCycle);
    
    statusText(User, "calledUseNPC", npc.atest1.calledUseNPC);
    statusText(User, "thisNPCUseNPC", npc.atest1.thisNPCUseNPC);
    statusText(User, "finishedUseNPC", npc.atest1.finishedUseNPC);
    
    statusText(User, "calledReceiveText", npc.atest1.calledReceiveText);
    statusText(User, "thisNPCReceiveText", npc.atest1.thisNPCReceiveText);
    statusText(User, "finishedReceivedText", npc.atest1.finishedReceivedText);
    
    statusText(User, "calledLookAt", npc.atest1.calledLookAt);
    statusText(User, "thisNPCLookAt", npc.atest1.thisNPCLookAt);
    statusText(User, "finishedLookAt", npc.atest1.finishedLookAt);
end

function statusText(User, varname, var)
    if (var) then
        User:inform("[" .. varname .. "] is true");
    else
        User:inform("[" .. varname .. "] is false");
    end;
end;