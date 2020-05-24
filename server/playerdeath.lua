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
local gems = require("base.gems")

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

    -- Noobies do not die on Noobia.
    if common.isOnNoobia(deadPlayer.pos) then
        deadPlayer:increaseAttrib("hitpoints", 10000) -- Respawn
        world:gfx(53, deadPlayer.pos)
        common.HighInformNLS(deadPlayer, "[Wiederbelebung] Während des Tutorials bist du 'unsterblich'. Im Hauptspiel ist die Wiederbelebung mit merklichen Konsequenzen für deinen Charakter verbunden.", "[Respawn] During the tutorial, you are 'immortal'. In the main game, serious consequences for your character are triggered upon respawn.")
        return --bailing out!
    end

    -- Death in the prison mine; no kill taxi!
    if common.isInPrison(deadPlayer.pos) then
        deadPlayer:increaseAttrib("hitpoints", 10000) -- Respawn
        world:gfx(53, deadPlayer.pos)
        common.HighInformNLS(deadPlayer, "[Wiederbelebung] In der Gefängnismine bist du 'unsterblich'. Weiterarbeiten!", "[Respawn] In the prison mine, you are 'immortal'. Work on!")
        return --bailing out!
    end

    -- Valid death.
    world:makeSound(25, deadPlayer.pos)
    showDeathDialog(deadPlayer)

    -- Death consequence #1: Durability loss of equipped items.
    local DURABILITY_LOSS = 10
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
        -- No negative consequence for Noobies.
        return
    end

    local bag = deadPlayer:getBackPack()
    if not bag then
        -- Leave characters without bag alone.
        return
    end

    local candidates = {}
    for i = 0, 99 do
        local worked, theItem = bag:viewItemNr(i)
        local theItemStats = world:getItemStats(theItem)
        if theItem and worked and common.IsNilOrEmpty(theItem:getData("descriptionEn")) and common.IsNilOrEmpty(theItem:getData("descriptionDe")) and common.IsNilOrEmpty(theItem:getData("rareness")) and (theItem.number * theItemStats.Worth) > 200 then
            table.insert(candidates, i)
        end
    end

    if #candidates == 0 then
        -- No item found that we can responsibly take away.
        return
    end

    local counter = 0
    repeat
        local index = math.random(1, #candidates)
        local workedView, theItemView = bag:viewItemNr(candidates[index])
        if workedView then
            local worked = bag:takeItemNr(candidates[index], theItemView.number)
            if worked then
                world:createItemFromItem(theItemView, deadPlayer.pos, true)
                counter = counter + 1
            end
        end
    until counter == math.min(#candidates, 3)
end

return M
