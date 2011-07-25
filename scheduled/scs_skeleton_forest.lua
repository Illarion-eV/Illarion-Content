-- Skeleton Forest
-- Skeleton Spawn Script

function ForestSkells()
    local Charakters = world:getPlayersInRangeOf(position(-54,72,0),35);
    for i, Char in Charakters do
        RndTry = math.random(0,15)
        if (RndTry == 1) then
            if SpawnSkeleton(Char) then
                return
            end
        elseif (RndTry == 2) then
            if (Char:getPlayerLanguage() == 0) then
                Char:inform("Du hörst ein leises Knacken im Unterholz und vielleicht ein leises Murmeln.");
            else
                Char:inform("You hear a quiet cracking in the forest and maybe a muttering.");
            end
        end
    end
end

function SpawnSkeleton(Charakter)
    local Monsters = world:getMonstersInRangeOf(Charakter.pos,7);
    
    if (table.getn(Monsters) > 0) then
        for i, Monster in Monsters do
            MonType = Monster:getMonsterType();
            if ((MonType>110) and (MonType<121)) then -- Skeletons
                return false;
            end
        end
    end  
    
    if (Charakter:getPlayerLanguage() == 0) then
        Charakter:inform("Um dich herum raschelt der Wald und du hört das Klappern von Knochen.");
    else
        Charakter:inform("Around you the forest rustles and you hear the clacking of bones.");
    end
    SpawnSkeletonCycle(Charakter.pos,6,math.random(3,8));
    return true;
end

function SpawnSkeletonCycle(CenterPos,Radius,Anzahl)
    local irad = math.ceil(Radius);
    local dim = 2*(irad+1);
    local x;
    local y;
    local map = {} ;
    local divid = math.ceil((2 * math.pi * irad) / Anzahl);
    
    for x = -irad-1, irad do
        map[x] = {};
        for y = -irad-1, irad do
            map[x][y] = (x+0.5)*(x+0.5)+(y+0.5)*(y+0.5)-irad*irad > 0
        end;
    end;
    
    local count = 0;
    for x = -irad, irad do
        for y = -irad, irad do
            if not( map[x][y] and  map[x-1][y] and map[x][y-1] and map[x-1][y-1] )
               and( map[x][y] or   map[x-1][y] or  map[x][y-1] or  map[x-1][y-1] ) then
                count = count + 1;
                if (math.mod(count,divid) == 0) then
                    tPos = position( CenterPos.x + x, CenterPos.y + y, CenterPos.z )
                    world:createMonster(math.random(111,115),tPos,-15);
                    world:makeSound(5,tPos);
                end
            end;
        end;
    end;
end
