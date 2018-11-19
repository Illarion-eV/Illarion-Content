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
local magic = require("base.magic")
local checks = require("item.general.checks")
local learnMagic = require("magic.learnMagic")
local glyphs = require("base.glyphs")
local glyphmagic = require("magic.glyphmagic")

local currentWandUse = {}
local WAND_USE_GLYPH_FORGE_ERECT = 1
local WAND_USE_GLYPH_RITUAL_PREPARE = 2

local M = {}


local magicWands = {}
    magicWands[323] = true
    magicWands[2782] = true
    magicWands[2783] = true
    magicWands[2784] = true
    magicWands[2785] = true
    magicWands[3608] = true


local function useWandSelection(user, item, ltstate)
    local actionIndex = {}
    local ACTION_ERECT_GLYPH_FORGE = 1
    local ACTION_FIND_GLYPH_FORGE = 2
    local ACTION_PREPARE_GLYPH_RITUAL = 3
    local ACTION_COUNT_SHARDS = 4
    local ACTION_GLYPH_JEWELRY = 5
    local ACTION_GLYPH_BREAK = 6
    local ACTION_EXAMINE_FORGE = 7

    local forgeItem = common.GetItemInArea(user.pos, glyphs.GLYPH_SHRINE_ID, 1, true)

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if actionIndex[index] == ACTION_ERECT_GLYPH_FORGE then
            currentWandUse[user.id] = WAND_USE_GLYPH_FORGE_ERECT
            glyphmagic.placeGlyphForge(user, ltstate)
        elseif actionIndex[index] == ACTION_PREPARE_GLYPH_RITUAL then
            currentWandUse[user.id] = WAND_USE_GLYPH_RITUAL_PREPARE
            glyphmagic.prepareGlyphRitual(user, ltstate)
        elseif actionIndex[index] == ACTION_FIND_GLYPH_FORGE then
            currentWandUse[user.id] = nil
            if not glyphmagic.findGlyphForge(user) then
                common.InformNLS(user,"Du kannst in der weiteren Umgebung keinen Glyphen-Ritualplatz ausmachen.",
                                      "You cannot detect an existing glyph ritual place in the area.")
            end
        elseif actionIndex[index] == ACTION_COUNT_SHARDS then
            glyphmagic.showShardState(user)
        elseif actionIndex[index] == ACTION_GLYPH_JEWELRY then
            glyphmagic.forgeGlyphs(user,forgeItem,ltstate)
        elseif actionIndex[index] == ACTION_GLYPH_BREAK then
            glyphmagic.breakGlyphs(user,forgeItem,ltstate)
        elseif actionIndex[index] == ACTION_EXAMINE_FORGE then
            glyphmagic.examineGlyphForge(user,forgeItem)
        end
    end
    local windowText = common.GetNLS(user,"Rituale", "Rituals")
    local commentText = ""
    local sd = SelectionDialog(windowText, commentText, cbSetMode)
    if forgeItem == nil then
        sd:addOption(505, common.GetNLS(user,"Suche einen Glyphen-Ritualplatz","Find a glyph ritual place"))
        table.insert(actionIndex,ACTION_FIND_GLYPH_FORGE)
        if  user:getSkill(glyphs.SKILL_GLYPHING) >= glyphs.glyphForgeErectionMinSkill then
            sd:addOption(glyphs.GLYPH_SHRINE_ID, common.GetNLS(user,"Errichte einen Glyphen-Ritualplatz","Build a glyph ritual place"))
            table.insert(actionIndex,ACTION_ERECT_GLYPH_FORGE)
        end
    else
        sd:addOption(3493, common.GetNLS(user,"Überprüfe deine Glyphensplitter","Check your glyph shards"))
        table.insert(actionIndex,ACTION_COUNT_SHARDS)
        if  user:getSkill(glyphs.SKILL_GLYPHING) >= glyphs.glyphRitualPrepareMinSkill then
            sd:addOption(400, common.GetNLS(user,"Bereite ein Glyphenritual vor","Prepare a glyph ritual"))
            table.insert(actionIndex,ACTION_PREPARE_GLYPH_RITUAL)
        end
        sd:addOption(235, common.GetNLS(user,"Arbeite eine Glyphe in ein Schmuckstück ein","Glyph some jewellery"))
        table.insert(actionIndex,ACTION_GLYPH_JEWELRY)
        sd:addOption(2140, common.GetNLS(user,"Breche eine Glyphe aus einem Schmuckstück heraus","Break a glyph out of some jewellery"))
        table.insert(actionIndex,ACTION_GLYPH_BREAK)
        sd:addOption(100, common.GetNLS(user,"Untersuche den Glyphen-Ritualplatz","Examine the glyph ritual place"))
        table.insert(actionIndex,ACTION_EXAMINE_FORGE)
    end

    sd:setCloseOnMove()
    user:requestSelectionDialog(sd)
end

function M.LookAtItem(user, item)
    return lookat.GenerateLookAt(user, item, lookat.WOOD)
end

function M.MoveItemAfterMove(User, SourceItem, TargetItem)
    local questProgress = User:getQuestProgress(38)
    if TargetItem:getType() == 4 then --inventory, not belt
        if magicWands[SourceItem.id]then
            if User:getMagicType() == 3 then
                User:inform("Alchemisten können die Stabmagie nicht erlernen.",
                "Alchemists are unable to use wand magic.")
            elseif not magic.hasMageAttributes(User) then
                User:inform("Um Stabmagie zu verwenden, muss die Summe der Attribute Intelligenz, Essenz und Willensstärke wenigstens 30 ergeben. Attribute können bei den Trainer-NPCs geändert werden.",
                "To use wand magic, your combined attributes of intelligence, essence, and willpower must total at least 30. Attributes can be changed at the Trainer NPC.")
            elseif User:getMagicType() == 0 and (User:getQuestProgress(37) ~= 0 or User:getMagicFlags(0) > 0) then
            elseif bit32.extract(questProgress, 30) == 0 then
                User:inform("Um das Handwerk der Stabmagie zu erlernen, musst du drei Bücher über magische Theorie lesen. Sieh dir die Liste der Bücher in den Bibliotheken der Städte an.",
                "To learn the craft of wand magic you must read three books on magical theory. Look for the list of books in your town's library.")
            end
        else
            return checks.checkLevel(User, SourceItem, TargetItem)
        end
    end

    return true
end

function M.UseItem(user, sourceItem, ltstate)
    if common.IsItemInHands(sourceItem) then
        if ltstate == Action.none then
            if magicWands[sourceItem.id] then
                if user:getMagicType() == 0 and (user:getQuestProgress(37) ~= 0 or user:getMagicFlags(0) > 0) then
                    useWandSelection(user, sourceItem, ltstate)
                else
                    learnMagic.useMagicWand(user, sourceItem)
                end
            end
        else
            if currentWandUse[user.id] == WAND_USE_GLYPH_FORGE_ERECT then
                glyphmagic.placeGlyphForge(user, ltstate)
            elseif currentWandUse[user.id] == WAND_USE_GLYPH_RITUAL_PREPARE then
                glyphmagic.prepareGlyphRitual(user, ltstate)
            end
        end
    else
        user:inform("Du solltest lieber den Zauberstab in die Hand nehmen, wenn du ihn benutzen willst.","To use the wand you should hold it in your hands.")
    end
end

return M