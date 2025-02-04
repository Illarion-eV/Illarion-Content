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

local lookat = require("base.lookat")
local common = require("base.common")
local checks = require("item.general.checks")
local learnMagic = require("magic.arcane.learn")
local enchantingRituals = require("magic.arcane.enchanting.core.rituals")
local combineShards = require("magic.arcane.enchanting.core.combine_shards_into_glyph")
local breakShards = require("magic.arcane.enchanting.core.glyphed_item_into_shards")
local inspectGlyph = require("magic.arcane.enchanting.core.inspection_of_glyph")
local inspectGlyphedItem = require("magic.arcane.enchanting.core.inspection_of_glyphed_item")
local glyphTutorial = require("magic.arcane.enchanting.core.tutorial")
local spatial = require("magic.arcane.spatial")
local magic = require("base.magic")
local castSpell = require("magic.arcane.castSpell")

local currentWandUse = {}

local M = {}


local magicWands = {}
    magicWands[323] = true
    magicWands[2782] = true
    magicWands[2783] = true
    magicWands[2784] = true
    magicWands[2785] = true
    magicWands[3608] = true

function M.enchantingSelection(user, wand, actionstate)

    if not magic.hasMageAttributes(user) then
        user:inform("Mit deinem Mangel an magischen Attributen wüsstest du nicht einmal, wo du anfangen sollst, einen Schrein wie diesen zu benutzen.", "With your lack of magical attributes, you wouldn't know where to begin using a shrine like this.") --chatGPT german
        return
    end

    local forgeItem = common.GetItemInArea(user.pos, 3498, 1, true) -- Check if a glyph ritual shrine is in range

    if forgeItem and forgeItem.wear <= 3 then -- 10-15 min left on it
        user:inform("Dieser Ritualplatz sieht nicht so aus, als würde sie noch lange halten.", "This forge does not look like it will last much longer.")
    end

    if forgeItem then
        glyphTutorial.update(user, 1)
    end

    local callback = function(dialog)
        if not dialog:getSuccess() or not common.IsItemInHands(wand) then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        local last = 1

        if not forgeItem and selected == 1 then
            local suitableLocation, theLocation = enchantingRituals.findSuitableLocation(user)
            if suitableLocation then
                enchantingRituals.start(user, actionstate, theLocation, "shrine")
                currentWandUse[user.id] = "erect"
            end
        elseif forgeItem and not enchantingRituals.candleRitualExists(forgeItem) and selected == 1 then
            enchantingRituals.start(user, actionstate, forgeItem.pos, "candle")
            currentWandUse[user.id] = "candle"
        elseif forgeItem and enchantingRituals.candleRitualExists(forgeItem) then
            last = 2
            if selected == 1 then
                combineShards.start(user, wand)
            elseif selected == 2 then
                breakShards.start(user, actionstate)
                currentWandUse[user.id] = "break"
            end
        end

        if selected == last + 1 then
            inspectGlyph.start(user)
        elseif selected == last + 2 then
            inspectGlyphedItem.start(user)
        end
    end

    local title = common.GetNLS(user,"Verzauberung", "Enchanting")

    local text = common.GetNLS(user, "Wähle aus, was du tun möchtest", "Select what you want to do.")

    local dialog = SelectionDialog(title, text, callback)

    if not forgeItem then
        dialog:addOption(3498, common.GetNLS(user,"Errichte einen Glyphen-Ritualplatz","Build a glyph ritual place"))
    elseif forgeItem and not enchantingRituals.candleRitualExists(forgeItem)then
        dialog:addOption(400, common.GetNLS(user,"Bereite ein Glyphenritual vor","Prepare a glyph ritual"))
    elseif forgeItem and enchantingRituals.candleRitualExists(forgeItem) then
        dialog:addOption(Item.anemo, common.GetNLS(user,"Kombiniere Scherben zu Glyphen", "Combine shards into glyphs"))
        dialog:addOption(Item.goldenAmethystAmulet, common.GetNLS(user, "Entferne Glyphen aus Schmuck", "Remove glyph from jewellery"))
    end

    dialog:addOption(Item.anemo, common.GetNLS(user, "Überprüfung von Glyphen", "Inspection of glyphs"))
    dialog:addOption(Item.goldenAmethystAmulet, common.GetNLS(user, "Überprüfung von verzaubertem Schmuck", "Inspection of enchanted jewellery"))

    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)

end

local function selectMagicType(user, wand, actionstate)

    local callback = function (dialog)

        if not dialog:getSuccess() or not common.IsItemInHands(wand) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index == 1 then
            M.enchantingSelection(user, wand, actionstate)
        elseif index == 2 then
            spatial.castSpatialMagic(user, actionstate)
            currentWandUse[user.id] = "spatial"
        end
    end

    local title = common.GetNLS(user,"Zauberstab", "Wand")
    local dialog = SelectionDialog(title, "", callback)

    dialog:addOption(Item.anemo, common.GetNLS(user, "Verzauberung", "Enchanting"))
    dialog:addOption(10, common.GetNLS(user, "Teleportationmagie", "Spatial Magic"))

    user:requestSelectionDialog(dialog)
end

function M.LookAtItem(user, item)
    return lookat.GenerateLookAt(user, item, lookat.WOOD)
end

function M.MoveItemAfterMove(user, sourceItem, targetItem)

    if targetItem:getType() == 4 then --inventory, not belt
        if magicWands[sourceItem.id] then
            learnMagic.useMagicWand(user, sourceItem, true) -- removes the need for duplicate inform texts by using this function for the move too
        else
            return checks.checkLevel(user, sourceItem, targetItem)
        end
    end

    return true
end

function M.UseItem(user, sourceItem, actionstate)

    if (user:getQuestProgress(37) == 1 or user:getMagicFlags(0) > 0) and user:getQuestProgress(568) == 1 then
        user:setQuestProgress(568, 2) -- This is just to catch up with a skipped step if someone already did the magic tutorial before Terry was introduced
        user:setQuestProgress(37, 1) -- Another case was discovered where old mages could not progress as they had magic flags but not the old tutorial completed, so this fixes that
    end

    if common.IsItemInHands(sourceItem) then

        if actionstate == Action.none then
            if magicWands[sourceItem.id] then
                if user:getMagicType() == 0 and (user:getQuestProgress(37) ~= 0 or user:getMagicFlags(0) > 0) then

                    local spell = sourceItem:getData("spell")

                    if not magic.hasMageAttributes(user) then
                        user:inform("Mit deiner magischen Fähigkeit weißt du kaum, wie man einen Zauberstab hält, geschweige denn benutzt.", "With your magical ability, you barely know how to hold a wand, much less use one.") --chatgpt german
                    elseif not common.IsNilOrEmpty(spell) and tonumber(spell) > 0 then
                        castSpell.castSpell(user, spell, actionstate, false)
                    else
                        selectMagicType(user, sourceItem, actionstate)
                    end
                else
                    learnMagic.useMagicWand(user, sourceItem)
                end
            end
        else
            if currentWandUse[user.id] == "erect" then
                enchantingRituals.continue(user, actionstate, false, "shrine")
            elseif currentWandUse[user.id] == "candle" then
                local forgeItem = common.GetItemInArea(user.pos, 3498, 1, true) -- Check if a glyph ritual shrine is in range
                enchantingRituals.continue(user, actionstate, forgeItem, "candle")
            elseif currentWandUse[user.id] == "break" then
                breakShards.continue(user, actionstate)
            elseif currentWandUse[user.id] == "spatial" then
                spatial.castSpatialMagic(user, actionstate)
            end
        end
    else
        user:inform("Du solltest lieber den Zauberstab in die Hand nehmen, wenn du ihn benutzen willst.","To use the wand you should hold it in your hands.")
    end
end

function M.actionDisturbed(player, attacker)

    return false

end

return M
