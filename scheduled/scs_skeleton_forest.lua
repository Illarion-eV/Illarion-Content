--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- Skeleton Forest
-- Skeleton Spawn Script

local common = require("base.common")

module("scheduled.scs_skeleton_forest", package.seeall)

function ForestSkells()
    local Charakters = world:getPlayersInRangeOf(position(780,50,0),30);
	for _,Char in pairs(Charakters) do
        RndTry = math.random(1,2)
        if (RndTry == 1) then
            if SpawnSkeleton(Char) then
                return
            end
        elseif (RndTry == 2) then
		    common.InformNLS(Char,"Du hörst ein leises Knacken im Unterholz und vielleicht ein leises Murmeln.","You hear a quiet cracking in the forest and maybe a muttering.");
        end
    end
end

function SpawnSkeleton(Charakter)
    local Monsters = world:getMonstersInRangeOf(Charakter.pos,7);

    if (#Monsters > 0) then
        for _, Monster in pairs(Monsters) do
            MonType = Monster:getMonsterType();
            if ((MonType>110) and (MonType<121)) then -- Skeletons
                return false;
            end
        end
    end

	common.InformNLS(Charakter,"Um dich herum raschelt der Wald und du hört das Klappern von Knochen.","Around you the forest rustles and you hear the clacking of bones.");

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
                if (math.fmod(count,divid) == 0) then
                    tPos = position( CenterPos.x + x, CenterPos.y + y, CenterPos.z )
                    world:createMonster(math.random(111,115),tPos,-15);
                    world:makeSound(5,tPos);
                end
            end;
        end;
    end;
end
