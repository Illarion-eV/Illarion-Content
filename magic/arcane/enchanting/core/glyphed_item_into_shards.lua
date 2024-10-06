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
local shared = require("magic.arcane.enchanting.core.shared")
local globalvar = require("base.globalvar")
local magic = require("base.magic")
local glyphTutorial = require("magic.arcane.enchanting.core.tutorial")

local M = {}

local selectedJewellery = {}

local function glyphedItemIntoShardsAndItem(user, jewellery)

    user:performAnimation(globalvar.charAnimationSPELL)
    world:makeSound(globalvar.sfxSNARING, user.pos)

    local glyphName = shared.getJewelleryGlyphName(jewellery)

    local listOfShards = shared.getListOfShardsForGlyph(glyphName)

    local remainingCharges = tonumber(jewellery:getData("glyphCharges"))

    local maxCharges = shared.getAmountOfCharges(jewellery, jewellery, true)

    -- Remove glyph from jewellery
    jewellery:setData("glyphQuality", "")
    jewellery:setData("glyphCharges", "")
    world:changeItem(jewellery)

    -- Determine the average amount of shards returned based on remaining charges

    local chance = 3.5 -- base amount of returned shards

    local percentageRemaining = remainingCharges/(maxCharges/100)

    chance = (chance/100)*percentageRemaining

    local count = 0
    -- Hand out shards
    for i = 1, 4 do

        if chance < 0 then
            break
        end

        local shard = math.random(1, #listOfShards)

        if chance > math.random() then
            common.CreateItem(user, listOfShards[shard], 1, 333, nil)
            table.remove(listOfShards, shard)
            chance = chance - 1
            count = count + 1
        end
    end

    local commonItem = world:getItemStatsFromId(jewellery.id)

    local german = "Du entfernst die Glyphe aus dem folgenden Gegenstand: "..commonItem.German.."." --Because of articles "dem/der", there is no good way to phrase it
    local english = "You remove the glyph from the "..commonItem.English.."."

    if count >= 1 then
        local pluralOrNotEnglish = count == 1 and "shard." or "shards."
        local pluralOrNotGerman = count == 1 and "Scherbe konnte" or "Scherben konnten"
        german = german.." "..count.." "..pluralOrNotGerman.." erfolgreich entfernt werden."
        english = english.." You managed to salvage "..count.." "..pluralOrNotEnglish
    else
        german = german.." Die entfernten Scherben scheinen nicht mehr zu gebrauchen zu sein."
        english = english.." You did not manage to salvage any shards."
    end

    user:inform(german, english)

    glyphTutorial.update(user, 11)

end



function M.start(user, actionstate)

    local wand = common.getItemInHand(user, magic.wandIds)

    if not wand then
        return
    end

    local jewelleryList = shared.listGlyphedJewelleryAtBeltAndJewellerySlots(user)

    if #jewelleryList == 0 then
        user:inform("Du musst mit einer Glyphe versehenen Schmuck in deinem Gürtel oder Inventarslot haben, wenn du eine Glyphe aus dem Schmuckstück entfernen willst. Deine Fertigkeit im Glyphenschmieden muss ausreichen, um die Glyphe herstellen zu können.",
        "You need to have a glyphed piece of jewellery that you are skilled enough to craft the glyph of in a belt slot or equipped if you want to remove a glyph from one.")
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        user:performAnimation(globalvar.charAnimationSPELL)
        world:makeSound(globalvar.sfxSNARING, user.pos)

        selectedJewellery[user.id] = jewelleryList[selected]

        local commonItem = world:getItemStatsFromId(jewelleryList[selected].id)

        user:inform("Du beginnst die Glyphe aus dem folgenden Gegenstand zu entfernen: "..commonItem.German..".", "You begin to remove the glyph from the "..commonItem.English..".")

        user:startAction(60, globalvar.gfxCLAW, 20, 0, 0)

    end

    local title = common.GetNLS(user,"Verzauberung", "Enchanting")

    local dialog = SelectionDialog(title, "", callback)

    for _, jewellery in pairs(jewelleryList) do
        local commonItem = world:getItemStatsFromId(jewellery.id)
        dialog:addOption(jewellery.id, common.GetNLS(user, commonItem.German, commonItem.English))
    end

    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end

function M.continue(user, actionstate)

    if actionstate == Action.success then
        local jewellery = selectedJewellery[user.id]
        glyphedItemIntoShardsAndItem(user, jewellery)
        local dur = common.getItemDurability(jewellery)
        common.setItemDurability(jewellery, math.max(0, dur - 99))
    elseif actionstate == Action.abort then
        common.InformNLS(user,"Du unterbrichst den Prozess, die Glyphe aus dem Schmuck zu entfernen.","You interrupt the process of removing the glyph from the jewellery.")
    end
end

return M
