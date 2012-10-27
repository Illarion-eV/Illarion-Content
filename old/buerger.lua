module("npc.buerger", package.seeall)

function InitWalkNPC()
    thisNPC:increaseSkill(1,"common language",100);
    WalkList={};
    WalkList[1] = {4,4,4,4,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0,0};
    WalkList[2] = {6,6,6,6,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0};
    WalkList[3] = {4,4,4,4,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,4,4,4,4};
    WalkList[4] = {4,4,4,4,4,4,4,6,6,4,4,6,6,6,6,4,4,4,4,6,6,6,6,6,6,6,6,0,0,0,0};
    WalkList[5] = {4,4,4,4,4,2,2,2,2,2,2,2,2,0,0,0,0,0,0,2,2,2,2,2,2,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,0,0};
    WalkList[6] = {2,2,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,6,6,0,0,0,0,0};
    WalkList[7] = {4,4,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0};
    WalkList[8] = {6,4,4,4,4,4,4,4,4,4,4,4,4,4,2,2,2,2,2,2,2,2,2,2,2,2,2,4,2,2,2,2,2,2,2,0,0,0,0};
    WalkList[9] = {4,4,4,4,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,6,6,0,0,0};
    WalkList[10]= {6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,6,6,6,0,0,0,0,0,0};
    -- evtl weitere Listen einbauen und alternative Startmarken setzen
    StartPosition = { };
    StartPosition[ 1]=position(-86,-95,0);
    StartPosition[ 2]=position(-98,-131,0);
    StartPosition[ 3]=position(-55,-113,0);
    StartPosition[ 4]=position(-111,-113,0);
    StartPosition[ 5]=position(-126,-103,0);
    StartPosition[ 6]=position(-104,-101,0);
    StartPosition[ 7]=position(-63,-113,0);
    StartPosition[ 8]=position(-115,-123,0);
    StartPosition[ 9]=position(-96,-113,0);
    StartPosition[10]=position(-51,-110,0);

    WaitPosition = { };
    WaitPosition[ 1]=position(-89,-121,0);
    WaitPosition[ 2]=position(-86,-121,0);
    WaitPosition[ 3]=position(-84,-120,0);
    WaitPosition[ 4]=position(-84,-123,0);
    WaitPosition[ 5]=position(-88,-116,0);
    WaitPosition[ 6]=position(-88,-117,0);
    WaitPosition[ 7]=position(-87,-116,0);
    WaitPosition[ 8]=position(-87,-117,0);
    WaitPosition[ 9]=position(-86,-117,0);
    WaitPosition[10]=position(-86,-116,0);

    InitLists();
    RunSettings();

end

function RunSettings()
    warten[thisNPC.id] = true;
    waitTime[thisNPC.id] = math.random(0,400);
    laufen[thisNPC.id] = false;
    firstrun[thisNPC.id]=1;
    InitNewRoute[thisNPC.id]=false;
    zaehler[thisNPC.id] = 0;
end

function InitLists()
    warten={};
    waitTime={};
    laufen={};
    firstrun={};
    InitNewRoute={};
    zaehler={};
    WalkPath={};
    FirstPos={};
    laufen={};
    step={};
    zaehler={};
    step={};
    OldPos={};
    StayTogether={};
    CurrentRoute={}; --for debugging
end

function ChoseWaitPos()
    local foundPos=false;
    local i=0;
    local retVal=nil;
    repeat
        i=i+1;
        if not world:isCharacterOnField(WaitPosition[i]) then
            found=true;
            retVal=WaitPosition[i];
        end
    until (i==table.getn(WaitPosition) or found)
    if (retVal==nil) then
        retVal=WaitPosition[math.random(1,table.getn(WaitPosition))];
    end
    return retVal
end

function nextCycle()
    if (firstrun==nil) then
        InitWalkNPC();
    end
    if (warten[thisNPC.id]==nil) then
        RunSettings()
    end
    if InitNewRoute[thisNPC.id] then
        ChoosePath=math.random(1,table.getn(WalkList));
        WalkPath[thisNPC.id]=WalkList[ChoosePath];
        FirstPos[thisNPC.id]=StartPosition[ChoosePath];
        laufen[thisNPC.id] = true;
        step[thisNPC.id] = 0;
        thisNPC:setAttrib("agility",math.random(2,5))
        InitNewRoute[thisNPC.id]=false;
        CurrentRoute[thisNPC.id]=ChoosePath;
    end
    zaehler[thisNPC.id] = zaehler[thisNPC.id] +1
    if (zaehler[thisNPC.id] == 6) then
        zaehler[thisNPC.id] = 0
        if warten[thisNPC.id] then
            waitTime[thisNPC.id]=waitTime[thisNPC.id]-1
            if ( waitTime[thisNPC.id] == 0 ) then
                warten[thisNPC.id] = false;
            end
        elseif not laufen[thisNPC.id] then
            InitNewRoute[thisNPC.id] = true;
        else
            if (step[thisNPC.id] == 0) then
                if not world:isCharacterOnField(FirstPos[thisNPC.id]) then
                    thisNPC:warp(FirstPos[thisNPC.id]);
                else
                    warten[thisNPC.id]=true;
                    waitTime[thisNPC.id]=math.random(20,100);
                end
            elseif (step[thisNPC.id] > table.getn(WalkPath[thisNPC.id])) then
                thisNPC:warp(ChoseWaitPos());
                warten[thisNPC.id] = true;
                waitTime[thisNPC.id] = math.random(200,800);
                laufen[thisNPC.id] = false;
            else
                thisNPC:move(WalkPath[thisNPC.id][step[thisNPC.id]],true);
                CheckWalk();
            end
            step[thisNPC.id] = step[thisNPC.id] + 1;
        end
    end -- zaehler
end -- function nextCycle()

function CheckWalk()
    if (OldPos[thisNPC.id]==nil) then
        OldPos[thisNPC.id]=thisNPC.pos;
        return
    else
        if OldPos[thisNPC.id] == thisNPC.pos then
            step[thisNPC.id] = step[thisNPC.id] - 1;
            outloop = false;
            nextpos=GetNextPos(thisNPC.pos,step[thisNPC.id])
            if (nextpos == nil) then
                thisNPC:warp(ChoseWaitPos());
                warten[thisNPC.id] = true;
                waitTime[thisNPC.id] = math.random(200,800);
                laufen[thisNPC.id] = false;
            elseif world:isCharacterOnField(nextpos) then
                BlockingChar=world:getCharacterOnField(nextpos);
                if (BlockingChar:getType()==2) then
                    if (StayTogether[thisNPC.id]==nil) then
                        StayTogether[thisNPC.id]=0;
                    end
                    StayTogether[thisNPC.id] = StayTogether[thisNPC.id] + 1;
                    if (StayTogether[thisNPC.id]>math.random(5,50)) then
                        i=1
                        repeat
                            nextpos=GetNextPos(nextpos,step[thisNPC.id]+i)
                            if (nextpos==nil) then
                                thisNPC:warp(ChoseWaitPos());
                                warten[thisNPC.id] = true;
                                waitTime[thisNPC.id] = math.random(200,800);
                                laufen[thisNPC.id] = false;
                                outloop=true;
                            elseif not world:isCharacterOnField(nextpos) then
                                thisNPC:warp(nextpos);
                                step[thisNPC.id] = step[thisNPC.id]+i+1;
                                outloop=true;
                            end
                            i=i+1;
                        until outloop;
                    end
                end
            end
        else
            OldPos[thisNPC.id]=thisNPC.pos;
        end
    end
end

function GetNextPos(TargetPos,stepping)
    if (WalkPath[thisNPC.id][stepping]==0) then
        return position(TargetPos.x,TargetPos.y-1,TargetPos.z)
    elseif (WalkPath[thisNPC.id][stepping]==2) then
        return position(TargetPos.x+1,TargetPos.y,TargetPos.z)
    elseif (WalkPath[thisNPC.id][stepping]==4) then
        return position(TargetPos.x,TargetPos.y+1,TargetPos.z)
    elseif (WalkPath[thisNPC.id][stepping]==6) then
        return position(TargetPos.x-1,TargetPos.y,TargetPos.z)
    else
        return nil
    end
end

function receiveText(texttype, message, originator)
    if (message=="route") then
        thisNPC:talk(Character.say,"Current Route: "..CurrentRoute[thisNPC.id]);
    end
end
