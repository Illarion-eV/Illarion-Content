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
-- Player death
-- deadPlayer - The player (character) whose hitpoints have just been set to zero

local common = require("base.common")
local resurrected = require("lte.resurrected")

local M = {}

local function showDeathDialog(deadPlayer)

    local dialogTitle = common.GetNLS(deadPlayer, "Tod", "Death")
    local dialogText = common.GetNLS(deadPlayer,
        "Du bist gestorben. Deine Ausrüstung nimmt schweren Schaden und du hast eventuell einige Gegenstände aus deiner Tasche verloren. Die Welt um dich herum verblasst und du bereitest dich darauf vor, den Göttern in Chergas Reich der Toten gegenüberzutreten. Du wirst demnächst wiederbelebt - so die Götter es wollen.",
        "You have died. Your equipment got damaged seriously and you might have lost some items from your bag. The world around you fades and you prepare yourself to face the Gods in the afterlife of Cherga's Realm. You will respawn in a moment - so the gods will.")
    local callback = function() end --empty callback
    local dialog = MessageDialog(dialogTitle, dialogText, callback)

    deadPlayer:requestMessageDialog(dialog)

end

function M.playerDeath(deadPlayer)

    -- Admins do not die.
    if deadPlayer:isAdmin() then
        deadPlayer:increaseAttrib("hitpoints", 10000) -- Respawn
        common.HighInformNLS(deadPlayer, "[Wiederbelebung] Admins sterben nicht.", "[Respawn] Admins don't die.")
        return --bailing out!
    end

    -- Death in the prison mine; no kill taxi!
    if common.isInPrison(deadPlayer.pos) then
        deadPlayer:increaseAttrib("hitpoints", 10000) -- Respawn
        world:gfx(53, deadPlayer.pos)
        common.HighInformNLS(deadPlayer, "[Wiederbelebung] In der Gefängnismine bist du 'unsterblich'. Weiterarbeiten!", "[Respawn] In the prison mine, you are 'immortal'. Work on!")
        return --bailing out!
    end

    local deaths = deadPlayer:getQuestProgress(resurrected.deathsTracker) + 1

    deadPlayer:setQuestProgress(resurrected.deathsTracker, deaths)

    if deaths == 100 then --Just some for fun logging down the line ^^
        log("Wow! "..deadPlayer.name.." has died a 100 times! They must really suck at this game.")
    elseif deaths == 1000 then
        log("How is it even possible? "..deadPlayer.name.." has died a 1000 times! What a masochist!")
    end

    -- Valid death.
    world:makeSound(25, deadPlayer.pos)
    showDeathDialog(deadPlayer)

    deaths = resurrected.getRPvsDeaths(deadPlayer)

    -- Death consequence #1: Durability loss of equipped items.
    local DURABILITY_LOSS = 10

    DURABILITY_LOSS = math.min(99, math.floor(DURABILITY_LOSS * (1 + 0.2*deaths)))

    if deadPlayer:isNewPlayer() then
        DURABILITY_LOSS = 5
    end
    local BLOCKED_ITEM = 228
    for i = Character.head, Character.coat do
        local item = deadPlayer:getItemAt(i)
        local commonItem = world:getItemStats(item)
        local durability = item.quality % 100
        if item.id > 0 and item.id ~= BLOCKED_ITEM and item.quality > 100 and commonItem.MaxStack == 1 and durability > 0 then
            if durability <= DURABILITY_LOSS then
                DURABILITY_LOSS = durability
                local nameText = world:getItemName(item.id, deadPlayer:getPlayerLanguage())
                common.HighInformNLS(deadPlayer, "[Tod] Dein Gegenstand '"..nameText.."' wurde zerstört.", "[Death] Your item '"..nameText.."' was destroyed.")
            end
            item.quality = item.quality - DURABILITY_LOSS
            world:changeItem(item)
        end
    end

    -- Death consequence #2: Drop few items from bag.
    if deadPlayer:isNewPlayer() then
        -- No item drop for new players
        return
    end

    local bag = deadPlayer:getBackPack()
    if not bag then
        -- Leave characters without bag alone.
        return
    end

    local candidates = {}
    local lowerValCandidates = {}

    for i = 0, 99 do
        local worked, theItem = bag:viewItemNr(i)
        local theItemStats = world:getItemStats(theItem)
        if theItem and worked and common.IsNilOrEmpty(theItem:getData("descriptionEn")) and common.IsNilOrEmpty(theItem:getData("descriptionDe")) and (common.IsNilOrEmpty(theItem:getData("rareness")) or not common.IsNilOrEmpty(theItem:getData("craftedRare"))) then
            if (theItem.number * theItemStats.Worth) > 200 then
                table.insert(candidates, i)
            else
                table.insert(lowerValCandidates, i)
            end
        end
    end

    if #candidates + #lowerValCandidates == 0 then
        -- No item found that we can responsibly take away.
        return
    end

    local counter = 0

    local max_drops = 3

    local inform = common.GetNLS(deadPlayer, "Du stellst fest, dass du nach deinem Tod die folgenden Dinge verloren hast:", "You find you've lost the following items upon your death:")

    max_drops = math.random(math.floor(max_drops * ( 1 + deaths*0.1)), math.ceil(max_drops * ( 1 + deaths*0.1)))

    local itemsToDrop = math.min(#candidates + #lowerValCandidates, max_drops)

    if #candidates > 0 then
        repeat
            local index = math.random(1, #candidates)
            local workedView, theItemView = bag:viewItemNr(candidates[index])
            if workedView then
                local worked = bag:takeItemNr(candidates[index], theItemView.number)
                if worked then
                    local itemCommon = world:getItemStatsFromId(theItemView.id)

                    inform = inform.."\n "..tostring(theItemView.number).." "..common.GetNLS(deadPlayer, itemCommon.German, itemCommon.English)

                    world:createItemFromItem(theItemView, deadPlayer.pos, true)
                    counter = counter + 1
                end
            end
        until counter == math.min(#candidates, max_drops)
    end

    if counter == itemsToDrop then
        deadPlayer:inform(inform)
        return
    end

    repeat
        local index = math.random(1, #lowerValCandidates)
        local workedView, theItemView = bag:viewItemNr(lowerValCandidates[index])
        if workedView then
            local worked = bag:takeItemNr(lowerValCandidates[index], theItemView.number)
            if worked then
                local itemCommon = world:getItemStatsFromId(theItemView.id)

                inform = inform.."\n "..tostring(theItemView.number).." "..common.GetNLS(deadPlayer, itemCommon.German, itemCommon.English)

                world:createItemFromItem(theItemView, deadPlayer.pos, true)
                counter = counter + 1
            end
        end
    until counter == itemsToDrop

    deadPlayer:inform(inform)
end

return M
