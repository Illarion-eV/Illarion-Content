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
local common = require("base.common")
local quests = require("monster.base.quests")
local arena = require("base.arena")

local M = {}

local noDropList = {}
local killers = {}

local function performRandomTalk(monster, msgs)
    local langSkill = monster:getSkill(Character.commonLanguage)
    if langSkill < 100 then
        monster:increaseSkill(Character.commonLanguage, 100 - langSkill)
    end

    local germanMessage, englishMessage = msgs:getRandomMessage() --choses a random message
    common.TalkNLS(monster, Character.say, germanMessage, englishMessage ) --does the talking in both languages
end

local function performRegeneration(monster)
    if (math.random() < 0.3) and (monster:increaseAttrib("hitpoints", 0) < 10000) then
        local con = monster:increaseAttrib("constitution", 0)
        local healAmount = 2 * con
        monster:increaseAttrib("hitpoints", healAmount)
    end
end

local function reportAttack(monster, enemy)
    killers[monster.id] = enemy
end

local function reportMonsterDeath(monster)
    local killer = killers[monster.id]
    if killer ~= nil then
        if isCharValid(killer) then
            quests.checkQuest(killer, monster)
        end
        killers[monster.id] = nil
    end
    noDropList[monster.id] = nil
end

local function performDrop(monster)
    if not noDropList[monster.id] then
        -- TODO: Implement drop function
    end
end

function M.generateCallbacks(msgs)
    local t = {}

    function t.enemyNear(monster, _)
        if math.random() < 3e-4 then --once each 5 minutes (3e-4) in average a message is spoken (is called very often)
            performRandomTalk(monster, msgs)
        end
        return false
    end

    function t.enemyOnSight(monster, _)
        performRegeneration(monster)
        if math.random() < 3e-3 then --once each 5 minutes (3e-3) in average a message is spoken
            performRandomTalk(monster, msgs)
        end
        return false
    end

    t.onAttacked = reportAttack
    t.onCasted = reportAttack

    function t.onDeath(monster)
        if arena.isArenaMonster(monster) then return end

        performDrop(monster)
        reportMonsterDeath(monster)
    end

    return t
end

-- Saves a monster as one that should not drop
function M.setNoDrop(monster)
    noDropList[monster.id] = true
end

return M