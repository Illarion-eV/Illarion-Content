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

-- INSERT INTO scheduledscripts VALUES('scheduled.akaltutSpawner', 6000, 18000, 'spawnAkaltut');

local common = require("base.common")

local spawnPoint = position(480, 871, -9)

local centerPos = position(488, 893, -9)

local chamberRadius = 100

local M = {}

local function foundEgg1()
    return common.GetItemInArea(centerPos, 1174, chamberRadius, false, {key = "akaltutEgg", value = "true"})
end

local function foundEgg2()
    return common.GetItemInArea(centerPos, 1175, chamberRadius, false, {key = "akaltutEgg", value = "true"})
end

local function foundEgg()
    if foundEgg1() or foundEgg2() then
        return true
    end

    return false
end

local function doesAnyAkaltutFormExist()
    local monstersInChamber = world:getMonstersInRangeOf(centerPos, chamberRadius)

    for _, monster in pairs(monstersInChamber) do
        local monsterID = monster:getMonsterType()
        if monsterID == 1142 or monsterID == 1141 or monsterID == 195 or monsterID == 3 then --Akaltut exists!
            return true
        end
    end

    return false
end

function M.spawnAkaltut()
    if doesAnyAkaltutFormExist() or foundEgg() then
        return
    end

    world:createMonster(1142, spawnPoint, -5)

end

return M
