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


local lowTreasurePos = {
    position(161,666,-4), --Sir Reginald's tomb
    position(769,705,0), --A cave in the woods
    position(336,326,-6), --Galmair sewers
    position(907,574,0), --Wonderland
    position(841,524,-12), --Bandit Hideout
}

local highTreasurePos = {
    position(703,421,-3), --Salavesh dungeon
    position(531,804,-6), --Akaltuts level 2
    position(202,415,-3), --Fortress Hammerfall
    position(847,503,-6), --Spider Nest
    position(785,273,-9), --Lake of life
    position(701,626,-3), --Volcano
    position(230,794,-6), --Letma
    position(393,440,2), --Dragorog Cult
    position(571,191,-3), --Viridian Needles
    position(310,355,1), --Fort Schnellbeil
    position(554,536,-6), --Necro Hideout
    position(895,577,-9) --Ronagan Dungeon
}

function M.spawnTreasure()

    for i = 1, #lowTreasurePos do
        if #world:getPlayersInRangeOf(lowTreasurePos[i],20) == 0 and world:isItemOnField(lowTreasurePos[i]) == false then --only spawn a treasure if nobody is around
        
            world:createItemFromId(2830,1,lowTreasurePos[i],false,333,{trsCat=math.random(0,1)}); --spawn the chest
            
        end
    end
    
    for i = 1, #highTreasurePos do
        if #world:getPlayersInRangeOf(highTreasurePos[i],20) == 0 and world:isItemOnField(highTreasurePos[i]) == false then --only spawn a treasure if nobody is around
        
            world:createItemFromId(2830,1,highTreasurePos[i],false,333,{trsCat=math.random(1,4)}); --spawn the chest
            
        end
    end

end
return M
