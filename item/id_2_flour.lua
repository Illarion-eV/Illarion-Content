
-- General Testscript

-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);

--require("npc.queen_rosaline_edwards");

module("item.id_2_flour", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    User:inform("Checking the Queen NPC (ä)");
    
    if (npc == nil) then
        User:inform("[npc] table not load.");
        return;
    end;
    User:inform("[npc] table is okay.");
    
    if (npc.queen_rosaline_edwards == nil) then
        User:inform("[npc.queen_rosaline_edwards] table not load.");
        return;
    end;
    User:inform("[npc.queen_rosaline_edwards] table is okay.");
    
    User:inform("Fetching status flags:");
    
    if (npc.queen_rosaline_edwards.scriptfound == nil) then
        User:inform("[scriptfound] variable not load. Script not initializied");
        return;
    end;
    if (not npc.queen_rosaline_edwards.scriptfound) then
        User:inform("[scriptfound] variable set to impossible value! WTF?!");
        return;
    end;
    User:inform("[scriptfound] variable OK");
    
    statusText(User, "initstarted", npc.queen_rosaline_edwards.initstarted);
    statusText(User, "initdone", npc.queen_rosaline_edwards.initdone);
    
    statusText(User, "calledNextCycle", npc.queen_rosaline_edwards.calledNextCycle);
    statusText(User, "thisNPCNextCycle", npc.queen_rosaline_edwards.thisNPCNextCycle);
    statusText(User, "finishedNextCycle", npc.queen_rosaline_edwards.finishedNextCycle);
    
    statusText(User, "calledUseNPC", npc.queen_rosaline_edwards.calledUseNPC);
    statusText(User, "thisNPCUseNPC", npc.queen_rosaline_edwards.thisNPCUseNPC);
    statusText(User, "finishedUseNPC", npc.queen_rosaline_edwards.finishedUseNPC);
    
    statusText(User, "calledReceiveText", npc.queen_rosaline_edwards.calledReceiveText);
    statusText(User, "thisNPCReceiveText", npc.queen_rosaline_edwards.thisNPCReceiveText);
    statusText(User, "finishedReceivedText", npc.queen_rosaline_edwards.finishedReceivedText);
    
    statusText(User, "calledLookAt", npc.queen_rosaline_edwards.calledLookAt);
    statusText(User, "thisNPCLookAt", npc.queen_rosaline_edwards.thisNPCLookAt);
    statusText(User, "finishedLookAt", npc.queen_rosaline_edwards.finishedLookAt);
end

function statusText(User, varname, var)
    if (var) then
        User:inform("[" .. varname .. "] is true");
    else
        User:inform("[" .. varname .. "] is false");
    end;
end;