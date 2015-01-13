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
--ID 903, Shadow Dancer, Level: 6, Armourtype: medium, Weapontype: slashing

local monstermagic = require("monster.base.monstermagic")
local blackImps = require("monster.race_90_black_imp.base")

local magic = monstermagic()
magic.addSummon{probability = 0.0249, monsters = {622, 611, 881}} -- Angry chicken, Stinky Slime, Bloodhunter
magic.addSummon{probability = 0.0050, monsters = {614, 883}}      -- Cauterizing Slime, Bloodsniffler
magic.addSummon{probability = 0.0001, monsters = {852}}           -- Shadowfright

local M = blackImps.generateCallbacks()
return magic.addCallbacks(M)