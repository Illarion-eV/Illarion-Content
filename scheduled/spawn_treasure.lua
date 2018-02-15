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

local LOW_LOW = 0
local LOW_HIGH = 1
local MEDIUM_LOW = 1
local MEDIUM_HIGH = 4

local treasureParameter = {
    --{position, lowest (0-9), highest (1-9), people needed}
    {position(161,666,-4),LOW_LOW,LOW_HIGH,1}, --Sir Reginald's tomb
    {position(769,705,0),LOW_LOW,LOW_HIGH,1}, --A cave in the woods
    {position(336,326,-6),LOW_LOW,LOW_HIGH,1}, --Galmair sewers
    {position(907,574,0),LOW_LOW,LOW_HIGH,1}, --Wonderland
    {position(841,524,-12),LOW_LOW,LOW_HIGH,1}, --Bandit Hideout
    {position(703,421,-3),MEDIUM_LOW,MEDIUM_HIGH,1}, --Salavesh dungeon
    {position(531,804,-6),MEDIUM_LOW,MEDIUM_HIGH,1}, --Akaltuts level 2
    {position(202,415,-3),MEDIUM_LOW,MEDIUM_HIGH,1}, --Fortress Hammerfall
    {position(847,503,-6),MEDIUM_LOW,MEDIUM_HIGH,1}, --Spider Nest
    {position(785,273,-9),MEDIUM_LOW,MEDIUM_HIGH,1}, --Lake of life
    {position(701,626,-3),MEDIUM_LOW,MEDIUM_HIGH,1}, --Volcano
    {position(230,794,-6),MEDIUM_LOW,MEDIUM_HIGH,1}, --Letma
    {position(393,440,2),MEDIUM_LOW,MEDIUM_HIGH,1}, --Dragorog Cult
    {position(571,191,-3),MEDIUM_LOW,MEDIUM_HIGH,1}, --Viridian Needles
    {position(310,355,1),MEDIUM_LOW,MEDIUM_HIGH,1}, --Fort Schnellbeil
    {position(554,536,-6),MEDIUM_LOW,MEDIUM_HIGH,1}, --Necro Hideout
    {position(895,577,-9),MEDIUM_LOW,MEDIUM_HIGH,1}, --Ronagan Dungeon
    {position(693,390,-3),5,8,3}, --Salavesh dungeon - Dragon lair
    {position(471,776,-9),6,9,4}, --Akaltut dungeon - end of dungeon
    {position(703,616,-6),6,9,4} --Volcano dungeon - end of dungeon
}

function M.spawnTreasure()

    for i = 1, #treasureParameter do
        if #world:getPlayersInRangeOf(treasureParameter[i][1],20) == 0 and world:isItemOnField(treasureParameter[i][1]) == false then --only spawn a treasure if nobody is around
            M.spawnTreasureChest(treasureParameter[i][1], math.random(treasureParameter[i][2],treasureParameter[i][3]), treasureParameter[i][4])
        end
    end

end

function M.spawnTreasureChest(position, level, persons)
    world:createItemFromId(2830,1,position,false,333,{trsCat=level,playerNeeded=persons})
end
return M
