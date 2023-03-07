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
-- UPDATE items SET itm_script='item.id_2830_chest' WHERE itm_id=2830

local common = require("base.common")
local treasureBase = require("item.base.treasure")
local lookat = require("base.lookat")
local globalvar = require("base.globalvar")
local salaveshDungeon = require("content.salaveshDungeon")
local akaltutDungeon = require("content.akaltutDungeon")
local volcano_chest = require("triggerfield.volcano_chest")
local scheduledSpawn = require("scheduled.spawn_treasure")
local arena = require("base.arena")

local MAX_CHARS = 8

local M = {}

local function resetLock(sourceItem)
    for i=1, MAX_CHARS do
        sourceItem:setData("unlockerId"..tostring(i),0)
    end
    world:changeItem(sourceItem)
end

local function getPlayerTriesAlready(user, sourceItem)
    local posi=sourceItem.pos
    local playerInRange=world:getPlayersInRangeOf(posi ,1 )
    local currentPlayerId
    local foundPlayer

    for i=1, MAX_CHARS do
        currentPlayerId = tonumber(sourceItem:getData("unlockerId"..tostring(i)))
        if common.IsNilOrEmpty(currentPlayerId) or (currentPlayerId == 0) then
            return (i-1)
        end
        foundPlayer = false
        for _, player in pairs(playerInRange) do
            if (player.id == currentPlayerId) and (currentPlayerId == user.id) then
                common.TalkNLS(user, Character.say,
                    "#me fummelt am Schloss herum und der Mechanismus rasselt in seinen Ausgangszustand.",
                    "#me fumbles around with the lock causing the mechanism to rattle back into its starting position.")
                resetLock(sourceItem)
                return 99
            elseif currentPlayerId == player.id then
                foundPlayer = true
            end
        end
        if not foundPlayer then
            common.TalkNLS(user, Character.say,
                "#me zuckt zur�ck als das Schloss mit einem lauten Ger�usch in seinen Ausgangszustand springt.",
                "#me flinches as the mechanism returns to its starting position with a loud click.")
            resetLock(sourceItem)
            return 99
        end
    end
    --Safety belt, should never happen!
    resetLock(sourceItem)
    return 0
end

function M.LookAtItem(user, item)
    --local nameDe, nameEn = treasureContent.getTreasureName(tonumber(Item:getData("trsCat")))
    local nameDe, nameEn = "Eine kunstvoll verzierte Schatzkiste. Welche Reicht�mer mag sie wohl enthalten?", "An ornated treasure chest. What riches will it contain?"
    lookat.SetSpecialDescription(item, nameDe, nameEn)
    return lookat.GenerateLookAt(user, item, lookat.NONE)
end

local function getRandomMonsterBasedOnLevel(level)

    local randomNumber = math.random(1, #arena.monsterIDsByLevel[level].monsters)

    return arena.monsterIDsByLevel[level].monsters[randomNumber]

end

local function spawnMobHiddenInChest(user, posi, level)

    local monsterID = getRandomMonsterBasedOnLevel(level)

    local theMonster = world:createMonster(monsterID, posi, 0)

    user:inform("Anstelle des erwarteten Schatzes springt dich ein Monster an: "..theMonster.name, "Instead of the expected treasure, a "..theMonster.name.." jumps out at you!")

end

function M.UseItem(user,sourceItem)
    local posi=sourceItem.pos
    local level=tonumber(sourceItem:getData("trsCat"))
    local playerNeeded=tonumber(sourceItem:getData("playerNeeded"))

    common.TurnTo(user, posi)
    if posi == salaveshDungeon.positionChest then
        salaveshDungeon.openChest(user, sourceItem, level)
        return
    end
    if posi == akaltutDungeon.positionChest then
        akaltutDungeon.openChest(user, sourceItem, level)
        return
    end
    if posi == volcano_chest.positionChest then
        volcano_chest.openChest(user, sourceItem, level)
        return
    end

    local treasureLockStatus = sourceItem:getData("treasureLockStatus")
    if treasureLockStatus == "locked" then
        common.InformNLS(user, "The chest is locked.", "Die Kiste ist verschlossen.")
        return
    end

    if (playerNeeded == nil) then
        playerNeeded = 1
    end

    local playerTried = getPlayerTriesAlready(user, sourceItem) + 1
    if playerTried > 99 then
        return
    end
    if playerNeeded > playerTried then
        common.TalkNLS(user, Character.say,
            "#me gelingt es dem Schloss ein Klicken zu entlocken und h�lt den Mechanismus mit beiden H�nden.",
            "#me manages to get a click from the lock and hold the mechanism open using both hands.")
        common.InformNLS(user,
            "Um den Mechanismus dieser Kiste zu �berwinden ben�tigst du mindestens "..tostring(playerNeeded).." Personen.",
            "[Inform] "..tostring(playerNeeded).." people are necessary to unlock and open this chest.")
        world:makeSound(globalvar.sfxCLICK,posi)
        sourceItem:setData("unlockerId"..tostring(playerTried),user.id)
        world:changeItem(sourceItem)
    else
        scheduledSpawn.setTimer(sourceItem)
        common.TalkNLS(user, Character.say,
            "#me �ffnet die Kiste.",
            "#me opens the chest.")
        world:erase(sourceItem, sourceItem.number)
        if (level ~= nil) and (level~=0) and (level < 10) then
            --the chest is not empty
            local mimicChance = math.random()
            world:gfx(globalvar.gfxRAIN,posi)
            world:makeSound(globalvar.sfxSNARING,posi)
            if mimicChance > 0.02 then
                -- 98 % chance to find treasure
                treasureBase.dropTreasureItems(posi, level)
            else
                -- 2 % chance the chest contains a mob (Replace with mimic if we ever get a graphic dev willing to animate one)
                spawnMobHiddenInChest(user, posi, level)
            end
        else
            world:gfx(globalvar.gfxFIZZLE,posi)
            world:makeSound(globalvar.sfxWIND,posi)
            common.InformNLS(user, "...sie ist leer!", "...it is empty!")
        end
    end
end


return M

