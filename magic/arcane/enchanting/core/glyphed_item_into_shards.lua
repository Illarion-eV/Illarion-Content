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

    local german = "GERMAN TRANSLATION"..commonItem.German.."."
    local english = "You remove the glyph from the "..commonItem.English.."."

    if count >= 1 then
        local pluralOrNotEnglish = count == 1 and "shard." or "shards."
        local pluralOrNotGerman = count == 1 and "GERMAN TRANSLATION" or "GERMAN TRANSLATION"
        german = german.."GERMAN TRANSLATION"..count.." "..pluralOrNotGerman
        english = english.." You managed to salvage "..count.." "..pluralOrNotEnglish
    else
        german = german.."GERMAN TRANSLATION"
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

    local jewelleryList = shared.listGlyphedJewelleryAtBelt(user)

    if #jewelleryList == 0 then
        user:inform("GERMAN TRANSLATION", "You need to have a glyphed piece of jewellery in your belt if you want to remove a glyph from one.")
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        user:performAnimation(globalvar.charAnimationSPELL)

        selectedJewellery[user.id] = jewelleryList[selected]

        local commonItem = world:getItemStatsFromId(jewelleryList[selected].id)

        user:inform("GERMAN TRANSLATION"..commonItem.German..".", "You begin to remove the glyph from the "..commonItem.English..".")

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
    elseif actionstate == Action.abort then
        common.InformNLS(user,"GERMAN TRANSLATION","You interrupt the process of removing the glyph from the jewellery.")
    end
end

return M
