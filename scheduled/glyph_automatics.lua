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
-- This script drops shards at 40 dedicated locations
-- Current setting is one per spot each 16h
-- One shard last about 15 min, cycle time of the script is 5 - 10 min
-- So once each 1/ 128 call or 0.0078 probability
-- Once a da in one spot is a shard shower of 4-9 shards
-- Probability: Every 7680 call or 0.00013
-- Banduk

-- INSERT INTO scheduledscripts (sc_scriptname,sc_mincycletime,sc_maxcycletime,sc_functionname) VALUES ('scheduled.glyph_automatics',300,600,'dropShard')
--[[Some more SQL helper for test
UPDATE scheduledscripts SET sc_mincycletime=300,sc_maxcycletime=600;
SELECT * FROM scheduledscripts
]]--

local common = require("base.common")
local globalvar = require("base.globalvar")
local shard = require("item.shard")

local M = {}

local dropPositions = {
    position(263,425,0), --Kantabi River source
    position(382,668,0), --Kantabi Desert - Oasis of Stars
    position(651,681,0), --Sentry Forest - Oldra's Corner
    position(482,571,0), --Glowing Forest
    position(510,431,0), --Elven ruins
    position(596,495,0), --Snakehead Bay - Shrine of Zelphia
    position(723,578,0), --Three Fingertips - Middle
    position(890,568,0), --Wonderland
    position(914,710,0), --Shadow Gate
    position(923,936,0), --Twin Eyes Islands
    position(730,767,0), --Adron's Covert
    position(865,463,0), --Eastland
    position(788,368,0), --Dead Marsh
    position(387,567,0), --Kantabi Desert - Cursed Place
    position(784,462,0), --Elstree Lake
    position(619,415,0), --Mount Snakehead
    position(600,283,0), --Bounding Stream - Southern islet
    position(479,119,0), --Syrita Bay
    position(643,109,0), --Plains of Silence - North
    position(828,32,0), --Insurmountable Limes
    position(783,117,0), --Raban's Grove
    position(706,30,0), --Insurmountable Limes - West Gate
    position(909,123,0), --Insurmountable Limes - East Gate
    position(779,293,0), --Bounding Stream - Northern marshland
    position(878,370,0), --Pauldron Isle - Entrance
    position(914,443,0), --Pauldron Isle - Skewer Drift
    position(953,327,0), --Pauldron Isle - Tanora's Ruins
    position(732,181,0), --Northern Woods
    position(636,219,0), --Plains of Silence - South
    position(510,266,0), --Nargun's Plain
    position(169,475,0), --Creek settlement
    position(54,570,0), --Pirate Cove
    position(174,713,0), --Kantabi Delta
    position(292,828,0), --Letma
    position(613,766,1), --Sentry Forest - Ushara's Spire
    position(508,745,0), --Harrowed Mount
    position(794,703,1), --Bear Cave 
    position(804,663,2), --Dragon Lair
    position(706,474,0), --Elstree Plain
    position(131,808,0), --Lost Harbour
    position(436,640,1) --Shadowland
}
local function doDrop(centerPos, radius)
    local pos = common.getFreePos(centerPos, radius)
    shard.createShardOnPosition(pos)
    world:gfx(globalvar.gfxSUN,pos)
end

function M.dropShard()
    for i = 1, #dropPositions do
        doDrop(dropPositions[i], 5)
    end
end

return M
