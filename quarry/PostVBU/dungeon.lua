-- NPC for Dungeon Monster Control
module("npc.dungeon", package.seeall)

function Settings()
    Location={};
    Location[1]=position(0,0,88);
    Location[2]=position(80,80,94);

    PosOfSaveItem=position(46,63,97);

    MonsterID={102,105,111,115,141,172,211,215,285};

    MaxMonsters=60;
end

function LiveSettings(Type,Setting,Count)
    if (Type=="set") then
        if (Setting=="spawn_off") then Spawn=0 end
        if (Setting=="spawn_only") then Spawn=Count end
        if (Setting=="spawn_on") then Spawn=-1 end
        if (Setting=="debug_on") then Debug=true end
        if (Setting=="debug_off") then Debug=false end
        if (Setting=="spawn_nr") then Spw=Count end
    elseif (Type=="get") then
        if (Setting=="spawn") then return Spawn end
        if (Setting=="debug") then return Debug end
        if (Setting=="spawn_nr") then return Spw end
    end
end

function SetSpawnLoc()
    PosX=math.random(Location[1].x,Location[2].x);
    PosY=math.random(Location[1].y,Location[2].y);
    PosZ=math.random(Location[1].z,Location[2].z);
    return position(PosX,PosY,PosZ)
end

function GoodGround(TileID)
    if (TileID==6) or (TileID==105) or (TileID==42) or
    (TileID==0) or (TileID==3) or (TileID==56) then
        return false
    else
        return true
    end
end

function GoodItem(Loc)
    if not world:isItemOnField(Loc) then
        return true
    else
        Item=world:getItemOnField(Loc);
        if (Item.id==8) or (Item.id==11) or (Item.id==14) or
        (Item.id>=30 and Item.id<=38) or (Item.id==93) or (Item.id==99) or
        (Item.id==100) or (Item.id==125) or (Item.id==203) or (Item.id==232) or
        (Item.id==233) or (Item.id==238) or (Item.id==239) or
        (Item.id>=240 and Item.id<=245) or (Item.id==250) or
        (Item.id>=260 and Item.id<=263) or (Item.id==266) or (Item.id==267) or
        (Item.id==286) or (Item.id<=287) or (Item.id==299) or (Item.id==300) or
        (Item.id==301) or (Item.id<=304) or (Item.id==305) or (Item.id==308) or
        (Item.id==309) or (Item.id<=313) or (Item.id==318) or (Item.id==320) or
        (Item.id==321) or (Item.id==337) or (Item.id>=339 and Item.id<=352) or
        (Item.id==361) or (Item.id<=382) or (Item.id==384) or (Item.id==386) or
        (Item.id==387) or (Item.id>=470 and Item.id<=474) or
        (Item.id>=480 and Item.id<=483) or (Item.id==386) or (Item.id==387) or
        (Item.id==493) or (Item.id==494) or (Item.id==496) or (Item.id==497) or
        (Item.id>=903 and Item.id<=906) or (Item.id==914) or (Item.id==915) or
        (Item.id>=918 and Item.id<=922) or (Item.id==925) or (Item.id==1245) or
        (Item.id==1246) or (Item.id==1250) or (Item.id==1251) or (Item.id==1254) or
        (Item.id==1257) or (Item.id==1273) or (Item.id==1276) or (Item.id==1278) or
        (Item.id>=1792 and Item.id<=1797) or (Item.id==1804) or (Item.id==1807) or
        (Item.id==1808) or (Item.id==1809) or (Item.id==1812) or (Item.id==1813) or
        (Item.id==1817) or (Item.id==2805) or (Item.id==2830) or (Item.id==2879) or
        (Item.id==2880) or (Item.id==2885) or (Item.id>=3081 and Item.id<=3084) then
            return false
        else return true
        end
    end
end

function GoodSpawnField(TargetLoc)
    local retval=false;
    Field=world:getField(TargetLoc)
    if GoodGround(Field.id) then
        if world:isItemOnField(TargetLoc) then
            if GoodItem(world:getItemOnField(TargetLoc)) then
                retval=true;
            end
        end
    end
    return retval
end

function SelectMonster()
    MonNr=math.random(1,table.getn(MonsterID));
    return MonsterID[MonNr]
end

function nextCycle()
    if (firstRun==nil) then
        firstRun=true;
        thisNPC:increaseSkill(1,"common language",100);
        Settings();
        LiveSettings("set","spawn_on",nil);
        LiveSettings("set","debug_off",nil);
        LiveSettings("set","spawn_nr",MaxMonsters);
        if world:isItemOnField(PosOfSaveItem) then
            SaveItem=world:getItemOnField(PosOfSaveItem);
        else
            world:createItemFromId(3103,1,PosOfSaveItem,true,333,0);
            SaveItem=world:getItemOnField(PosOfSaveItem);
            SaveItem.wear=255;
            world:changeItem(SaveItem);
        end
    end
    SaveItem=world:getItemOnField(PosOfSaveItem);
    local CurrentMon=SaveItem.data;
    local MaxMon=LiveSettings("get","spawn_nr",nil);
    local Debugging=LiveSettings("get","debug",nil);
    local Spawning=LiveSettings("get","spawn",nil);
    if (Spawning~=0) then
        if (CurrentMon<MaxMon) then
            SpawnLocation=SetSpawnLoc();
            SpawnField=world:getField(SpawnLocation);
            if GoodGround(SpawnField.id) then
                if GoodItem(SpawnLocation) then
                    if (Spawning>0) then
                        MonID=Spawning;
                    else
                        MonID=SelectMonster();
                    end
                    world:createMonster(MonID,SpawnLocation,10)
                    SaveItem.data=CurrentMon+1;
                    world:changeItem(SaveItem);
                    if Debugging then thisNPC:talk(Character.say,"spawn monster with ID "..MonID.." at position "..SpawnLocation.x..","..SpawnLocation.y..","..SpawnLocation.z.." successfully") end
                else
                    if Debugging then thisNPC:talk(Character.say,"spawn monster failed, because of bad item at position "..SpawnLocation.x..","..SpawnLocation.y..","..SpawnLocation.z) end
                end
            else
                if Debugging then thisNPC:talk(Character.say,"spawn monster failed, because of bad ground tile at position "..SpawnLocation.x..","..SpawnLocation.y..","..SpawnLocation.z) end
            end
        end
    end
end

function receiveText(TextTyp, Message, Originator)
    if (Originator.id~=thisNPC.id) then
        if (string.find(Message,"[Cc]ommands")~=nil) then
            thisNPC:talk(Character.say,"List of commands: 'current settings', 'spawn on', 'spawn off', 'spawn only <monster id>', 'debug on', 'debug off', 'max monsters <number>', 'reset'");
        end
        if (string.find(Message,"[Cc]urrent.+[Ss]ettings")~=nil) then
            local spawntext="";
            local spawnstat=LiveSettings("get","spawn",nil);
            if (spawnstat==0) then
                spawntext="spawn off";
            elseif (spawnstat>0) then
                spawntext="spawn only: "..spawnstat;
            else
                spawntext="spawn on"
            end
            local debugs=LiveSettings("get","debug",nil);
            local debugtext="";
            if debugs then
                debugtext="debugging on";
            else
                debugtext="debugging off";
            end
            local spwnum=LiveSettings("get","spawn_nr",nil);
            local spawnnumtext="Maximal Monsters: "..spwnum;
            thisNPC:talk(Character.say,spawntext.." - "..debugtext.." - "..spawnnumtext);
        end
        if (string.find(Message,"[Ss]pawn.+[Oo][Nn]")~=nil) then
            if (string.find(Message,"[Ss]pawn.+[Oo]nly")==nil) then
                LiveSettings("set","spawn_on",nil);
                thisNPC:talk(Character.say,"Spawning: ON");
            end
        end
        if (string.find(Message,"[Ss]pawn.+[Oo][Ff][Ff]")~=nil) then
            LiveSettings("set","spawn_off",nil);
            thisNPC:talk(Character.say,"Spawning: OFF");
        end
        if (string.find(Message,"[Ss]pawn.+[Oo]nly.+%d+")~=nil) then
            a,b,countStr=string.find(Message,"[Ss]pawn [Oo]nly (%d+)");
            count=countStr+1-1;
            LiveSettings("set","spawn_only",count);
            thisNPC:talk(Character.say,"Spawning: ID "..count);
        end
        if (string.find(Message,"[Dd]ebug.+[Oo][Nn]")~=nil) then
            LiveSettings("set","debug_on",nil);
            thisNPC:talk(Character.say,"Debugging: ON");
        end
        if (string.find(Message,"[Dd]ebug.+[Oo][Ff][Ff]")~=nil) then
            LiveSettings("set","debug_off",nil);
            thisNPC:talk(Character.say,"Debugging: OFF");
        end
        if (string.find(Message,"[Mm]ax.+[Mm]onsters.+%d+")~=nil) then
            a,b,countStr=string.find(Message,"[Mm]ax.+[Mm]onster.+(%d+)");
            count=countStr+1-1;
            LiveSettings("set","spawn_nr",count);
            thisNPC:talk(Character.say,"Maximal Monsters: "..count);
        end
        if (string.find(Message,"[Rr]eset")~=nil) then
            LiveSettings("set","spawn_on",nil);
            LiveSettings("set","debug_off",nil);
            LiveSettings("set","spawn_nr",MaxMonsters);
            thisNPC:talk(Character.say,"Settings reseted");
        end
    end
end
