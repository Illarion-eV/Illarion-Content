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
-- This script spawns treasure chests (2830) whereever needed
-- Current setting is once in 6-18 hours
-- Estralis

local common = require("base.common")

local M = {}

function M.spawnTreasure()

    local treasurePos=position(703,421,-3); --Salavesh dungeon
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(1,4)}); --spawn the chest
        
    end
    
    local treasurePos=position(161,666,-4); --Sir Reginald's tomb
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
        
    end
    
    local treasurePos=position(769,705,0); --A cave in the woods
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
        
    end
    
    local treasurePos=position(336,326,-6); --Galmair sewers
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
        
    end
    
    local treasurePos=position(907,574,0); --Wonderland
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
        
    end

    local treasurePos=position(531,804,-6); --Akaltuts level 2
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
    end

    local treasurePos=position(222,479,-3); --Buccaneer Lurk
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
    end

    local treasurePos=position(841,524,-12); --Bandit Hideout
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
    end
    
    local treasurePos=position(202,415,-3); --Fortress Hammerfall
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
    end
    
    local treasurePos=position(847,503,-6); --Spider Nest
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
    end
    
    local treasurePos=position(785,273,-9); --Lake of life
    
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
    end
    
    local treasurePos=position(701,626,-3); --Volcano
        
    if #world:getPlayersInRangeOf(treasurePos,20) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around
    
        world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,1)}); --spawn the chest
    end
    
    end
return M
