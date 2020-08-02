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

local DROP_PROBABILITY = 0.0078
local SHOWER_PROBABILITY = 0.00013

local dropPositions = {
    position(287,549,0), --Oasis in the desert
    position(421,756,0), --next to Alkatut's entrance
    position(644,681,0), --Sentry forest, Usharas altar
    position(505,464,0), --Dead swamp
    position(547,370,0), --Sparkling mine
    position(596,495,0), --isle in sheakhead bay
    position(723,578,0), --2nd of 3 sisters
    position(895,584,0), --Wonderland
    position(909,699,0), --Test field Runewick
    position(916,935,0), --South end Runewick
    position(730,767,0), --Isle near Runewick harbour
    position(858,453,0), --Spider spot Elstree
    position(794,362,0), --Witch house
    position(731,347,0), --Swamp between Hemp Necktie Inn and Syrta bridge
    position(766,444,0), --Nargun shrine
    position(584,425,0), --Raptor forest
    position(587,261,0), --Singing well
    position(603,127,0), --Swamp west of temple of 5
    position(631,131,0), --Narguns plain
    position(692,253,0), --northern forest opposit of Hemp Necktie Inn
    position(814,110,0), --Rabans Cove
    position(706,30,0), --Wall west end
    position(896,118,0), --Wall east end
    position(759,238,0), --Nord end Syrtia bridge
    position(896,349,0), --Pauldron entrance
    position(934,403,0), --Pauldron center
    position(953,327,0), --Pauldron North
    position(732,181,0), --Ritual tree SW Rabans Cove
    position(614,216,0), --SE channel
    position(524,241,0), --former bandit area now cows of Galmair
    position(210,531,0), --West shore Kantabi (Troll hole)
    position(42,610,0), --Pirate bay entrance
    position(174,713,0), --Kantabi delta begin
    position(261,855,0), --S of Letma
    position(536,774,0), --Sentry forest West
    position(526,589,0), --Firewall
    position(751,643,0), --former dragon cave entrance
    position(822,729,0), --Feigling letztes Gefecht
    position(730,474,0), --Plains West of Elstree
    position(118,808,0) --Kantabi delta
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
