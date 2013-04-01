-- Basisfunktion für Passagierschiffe aller Art

module("npc.base.ships", package.seeall)

function InitShips()
    if (ShipMask == nil) then
        ShipMask = { };
        PassangerMask = { };
        Passangers = { };
        return true
    end
    return false
end

-- Baut eine Maske des Schiffs auf - Bug in Nordrichtung
-- Drehpunkt auf x=0,  y=0
-- Vor Drehpunkt: y<0
-- Hinter Drehpunkt: y>0
-- Linke Seite: x<0
-- Rechte Seite: x>0

-- Syntax: AddShipPosition({x,y})
function AddShipPosition(RelativPosition,Char)
    Char:setAttrib("agility",5);
    table.insert(ShipMask,{RelativPosition,Char});
end

-- Baut eine Maske der Personenpositionen auf dem Schiff auf - Bug in Nordrichtung
-- Drehpunkt auf x=0,  y=0
-- Vor Drehpunkt: y<0
-- Hinter Drehpunkt: y>0
-- Linke Seite: x<0
-- Rechte Seite: x>0

-- Syntax: AddPassangerPosition({x,y})
function AddPassangerPosition(RelativPosition)
    table.insert(PassangerMask,RelativPosition);
end

function TryAddPassanger(Char)
    if (table.getn(PassangerMask) >= table.getn(Passangers)) then
        table.insert(Passangers,Char);
        return true
    else
        return false
    end
end

function GetPassanger(nr)
    return Passangers[nr];
end

function CheckForPassanger(CharID)
    local retVal = false;
    for i, Passanger in pairs(Passangers) do
        if (Passanger.id == CharID) then
            retVal = true;
        end
    end
    return retVal;
end

function WarpPassangersToo(Posi)
    for i, Passanger in pairs(Passangers) do
        Passanger:warp(Posi);
        Passanger:setQuestProgress(7,0);
    end
end

function ClearPassengers()
    Passangers = nil;
    Passangers = {};
end

-- Bewegt das Schiff und alle Passagiere darauf
-- Richtungen:
-- -- 0 = Norden
-- -- 2 = Osten
-- -- 4 = Süden
-- -- 6 = Westen

-- Syntax: MoveShip(Richtung)
function MoveShip(Direction)
    for i, ShipPart in pairs(ShipMask) do
        if (Direction == 0) then
            NeedPos = position(oldcenterpos.x+ShipPart[1][1],oldcenterpos.y+ShipPart[1][2],oldcenterpos.z);
            NewPos  = position(NeedPos.x,NeedPos.y-1,NeedPos.z);
        elseif (Direction == 2) then
            NeedPos = position(oldcenterpos.x-ShipPart[1][2],oldcenterpos.y+ShipPart[1][1],oldcenterpos.z);
            NewPos  = position(NeedPos.x+1,NeedPos.y,NeedPos.z);
        elseif (Direction == 4) then
            NeedPos = position(oldcenterpos.x-ShipPart[1][1],oldcenterpos.y-ShipPart[1][2],oldcenterpos.z);
            NewPos  = position(NeedPos.x,NeedPos.y+1,NeedPos.z);
        elseif (Direction == 6) then
            NeedPos = position(oldcenterpos.x+ShipPart[1][2],oldcenterpos.y-ShipPart[1][1],oldcenterpos.z);
            NewPos  = position(NeedPos.x-1,NeedPos.y,NeedPos.z);
        else
            return false;
        end
        if not (ShipPart[2].pos == NeedPos) then
            ShipPart[2]:forceWarp(NeedPos);
        end
        JesusItem = PlaceJesusItem(NewPos);
        ShipPart[2]:move(Direction,true);
        world:erase(JesusItem,1);
    end
    for i, PassPart in pairs(PassangerMask) do
        if (Passangers[i]~=nil) then
            if (Direction == 0) then
                NeedPos = position(oldcenterpos.x+PassPart[1],oldcenterpos.y+PassPart[2],oldcenterpos.z);
                NewPos  = position(NeedPos.x,NeedPos.y-1,NeedPos.z);
            elseif (Direction == 2) then
                NeedPos = position(oldcenterpos.x-PassPart[2],oldcenterpos.y+PassPart[1],oldcenterpos.z);
                NewPos  = position(NeedPos.x+1,NeedPos.y,NeedPos.z);
            elseif (Direction == 4) then
                NeedPos = position(oldcenterpos.x-PassPart[1],oldcenterpos.y-PassPart[2],oldcenterpos.z);
                NewPos  = position(NeedPos.x,NeedPos.y+1,NeedPos.z);
            elseif (Direction == 6) then
                NeedPos = position(oldcenterpos.x+PassPart[2],oldcenterpos.y-PassPart[1],oldcenterpos.z);
                NewPos  = position(NeedPos.x-1,NeedPos.y,NeedPos.z);
            else
                return false;
            end
            if not (Passangers[i].pos == NeedPos) then
                if Passangers[i]:isInRangeToPosition(NeedPos,15) then
                    Passangers[i]:forceWarp(NeedPos);
                else
                    Passangers[i] = nil;
                end
            end
            JesusItem = PlaceJesusItem(NewPos);
            Passangers[i]:move(Direction,true);
            world:erase(JesusItem,1);
        end
    end
    if (Direction == 0) then
        oldcenterpos = position(oldcenterpos.x, oldcenterpos.y - 1, oldcenterpos.z);
    elseif (Direction == 2) then
        oldcenterpos = position(oldcenterpos.x + 1, oldcenterpos.y, oldcenterpos.z);
    elseif (Direction == 4) then
        oldcenterpos = position(oldcenterpos.x, oldcenterpos.y + 1, oldcenterpos.z);
    elseif (Direction == 6) then
        oldcenterpos = position(oldcenterpos.x - 1, oldcenterpos.y, oldcenterpos.z);
    end
end

function PlaceJesusItem(Posi)
    return world:createItemFromId(42, 1, Posi, true, 333, 0);
end

function RotateTo(newDir)
    for i, ShipPart in pairs(ShipMask) do
        if (newDir == 0) then
            NeedPos = position(oldcenterpos.x+ShipPart[1][1],oldcenterpos.y+ShipPart[1][2],oldcenterpos.z);
        elseif (newDir == 2) then
            NeedPos = position(oldcenterpos.x-ShipPart[1][2],oldcenterpos.y+ShipPart[1][1],oldcenterpos.z);
        elseif (newDir == 4) then
            NeedPos = position(oldcenterpos.x-ShipPart[1][1],oldcenterpos.y-ShipPart[1][2],oldcenterpos.z);
        elseif (newDir == 6) then
            NeedPos = position(oldcenterpos.x+ShipPart[1][2],oldcenterpos.y-ShipPart[1][1],oldcenterpos.z);
        else
            return false;
        end
        if not (ShipPart[2].pos == NeedPos) then
            ShipPart[2]:forceWarp(NeedPos);
            ShipPart[2]:setAttrib("faceto",newDir);
        end
    end
    for i, PassPart in pairs(PassangerMask) do
        if (Passangers[i]~=nil) then
            if (newDir == 0) then
                NeedPos = position(oldcenterpos.x+PassPart[1],oldcenterpos.y+PassPart[2],oldcenterpos.z);
            elseif (newDir == 2) then
                NeedPos = position(oldcenterpos.x-PassPart[2],oldcenterpos.y+PassPart[1],oldcenterpos.z);
            elseif (newDir == 4) then
                NeedPos = position(oldcenterpos.x-PassPart[1],oldcenterpos.y-PassPart[2],oldcenterpos.z);
            elseif (newDir == 6) then
                NeedPos = position(oldcenterpos.x+PassPart[2],oldcenterpos.y-PassPart[1],oldcenterpos.z);
            end
            if not (Passangers[i].pos == NeedPos) then
                if Passangers[i]:isInRangeToPosition(NeedPos,15) then
                    Passangers[i]:forceWarp(NeedPos);
                    Passangers[i]:setAttrib("faceto",newDir);
                else
                    Passangers[i] = nil;
                end
            end
        end
    end
end

function InitShipPos(Dir)
    for i, ShipPart in pairs(ShipMask) do
        if (Dir == 0) then
            NeedPos = position(oldcenterpos.x+ShipPart[1][1],oldcenterpos.y+ShipPart[1][2],oldcenterpos.z);
        elseif (Dir == 2) then
            NeedPos = position(oldcenterpos.x-ShipPart[1][2],oldcenterpos.y+ShipPart[1][1],oldcenterpos.z);
        elseif (Dir == 4) then
            NeedPos = position(oldcenterpos.x-ShipPart[1][1],oldcenterpos.y-ShipPart[1][2],oldcenterpos.z);
        elseif (Dir == 6) then
            NeedPos = position(oldcenterpos.x+ShipPart[1][2],oldcenterpos.y-ShipPart[1][1],oldcenterpos.z);
        else
            return false;
        end
        if not (ShipPart[2].pos == NeedPos) then
            ShipPart[2]:forceWarp(NeedPos);
            ShipPart[2]:setAttrib("faceto",Dir);
        end
    end
end

function DoNextMove()
    step = step + ListDir;
    currStep = StepDir(route[step],ListDir);
    prevStep = StepDir(route[step-ListDir],ListDir);
    if (currStep==prevStep)  then
        currentDir = currStep;
    end
    if ((currStep ~= currentDir) or (prevStep==nil)) then
        RotateTo(currStep);
    end
    MoveShip(currStep);
end

function StepDir(Dir,ListDir)
    if (Dir == 0) then
        return (ListDir==1 and 0 or 4);
    elseif (Dir == 2) then
        return (ListDir==1 and 2 or 6);
    elseif (Dir == 4) then
        return (ListDir==1 and 4 or 0);
    elseif (Dir == 6) then
        return (ListDir==1 and 6 or 2);
    else
        return nil;
    end
end
