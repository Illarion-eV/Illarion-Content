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
local stump = require("magic.nature.weavers_stump")
local shared = require("magic.nature.shared")
local cast = require("magic.nature.cast")
local spells = require("magic.nature.spells")

local M = {}

local function getAttunedSpell(sourceItem)

    local attunedSpell = sourceItem:getData("attunedSpell")

    if not common.IsNilOrEmpty(attunedSpell) then
        return attunedSpell
    end

    return false
end

local function selectSpell(user, ltstate, category)
    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
         end

        local index = dialog:getSelectedIndex()+1

        for i = 1, #category.spellsKnown do
            if index == i then
                cast.castSpell(user, category.spellsKnown[i], ltstate)
            end
        end
    end

    local dialogText = common.GetNLS(user,"Wählen Sie das Gewebe aus, das Sie wirken möchten.","Select the weave you want to cast.")
    local dialogTitle = common.GetNLS(user,"Gewebauswahl","Weave selection")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    for i = 1, #category.spellsKnown do
        dialog:addOption(0, category.spellsKnown[i])
    end

    user:requestSelectionDialog(dialog)
end

function M.UseItem(user, sourceItem, ltstate)

    local frontItem = common.GetFrontItem(user)

    for _, weave in pairs(stump.stumps) do --If you are in front of a stump, then we use the cor staff as the crafting tool there
        if weave.stump == frontItem.id then
            stump.UseItem(user, sourceItem, ltstate)
            return
        end
    end

    if not shared.isDruid(user) then
        return
    end

    local knownSpells = spells.getKnownSpells(user)

    if not knownSpells or #knownSpells < 1 then
        user:inform("Du kennst keine druidischen Flechtzauber, die du mit dem Cor-Stab wirken kannst, und vor dir befindet sich auch kein Weberstumpf, mit dem du arbeiten könntest.", "You do not know any druidic weaves to cast using the Cor Staff, nor is there a weavers stump in front of you to work with.")
        return
    end

    local attunedSpell = getAttunedSpell(sourceItem)

    local categories = {
        {name = {english = "Bloomweaves", german = "Blütengewebe"}, skill = Character.bloomweave, spellsKnown = {}},
        {name = {english = "Stoneweaves", german = "Steingewebe"}, skill = Character.stoneweave, spellsKnown = {}},
        {name = {english = "Wildweaves", german = "Wildgewebe"}, skill = Character.wildweave, spellsKnown = {}},
        {name = {english = "Witherweaves", german = "Verfallgewebe"}, skill = Character.witherweave, spellsKnown = {}},
        {name = {english = "Deepweaves", german = "Tiefengewebe"}, skill = Character.deepweave, spellsKnown = {}}
    }

    for _, knownSpell in pairs(knownSpells) do
        for _, category in pairs(categories) do
            if category.skill == knownSpell.skill then
                table.insert(category.spellsKnown, knownSpell.name)
            end
        end
    end

    local knownCategories = {}

    for _, category in pairs(categories) do
        if #category.spellsKnown > 0 then
            table.insert(category)
        end
    end

    if #knownCategories == 0 then
        return
    end

    if #knownCategories == 1 then
        selectSpell(user, ltstate, knownCategories[1])
        return
    end

    if attunedSpell then
        cast.castSpell(user, attunedSpell, ltstate)
    else -- Select one from list of known spells

        local callback = function(dialog)

            if not dialog:getSuccess() then
                return
            end

            local index = dialog:getSelectedIndex()+1

            for i = 1, #knownCategories do
                if index == i then
                    selectSpell(user, ltstate, knownCategories[i])
                end
            end
        end

        local dialogText = common.GetNLS(user,"Wählen Sie die Kategorie des Gewebes aus, das Sie wirken möchten.","Select the category of weave you want to cast.")
        local dialogTitle = common.GetNLS(user,"Gewebauswahl","Weave selection")
        local dialog = SelectionDialog(dialogTitle, dialogText, callback)

        for i = 1, #knownCategories do
            local category = knownCategories[i]
            dialog:addOption(0, common.GetNLS(user, category.name.german, category.name.english))
        end

        user:requestSelectionDialog(dialog)
    end
end

return M
