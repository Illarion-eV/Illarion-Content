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

local base = require("monster.base.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local ettin = require("monster.race_117_ettin.base")

local M = ettin.generateCallbacks()

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addIcestrike{probability = 0.07, damage = {from = 1000, to = 1500}}
magic.addIcestrike{probability = 0.001, damage = {from =  750, to = 1000}, targetCount = 4}
magic.addLighting{probability = 0.005, damage = {from =  1200, to = 1800}}
magic.addLighting{probability = 0.001, damage = {from =  500, to = 1100}, targetCount = 3}

M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)