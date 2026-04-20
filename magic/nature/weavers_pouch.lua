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
local sigil = require("magic.nature.sigil") -- M.limit and M.charges
local shared = require("magic.nature.shared")
local spells = require("magic.nature.spells")

local M = {}

--The weaver's pouch has a similar function as what the grimoire does in arcane magic

local weaves = {
    {english = "Witherweave", german = "Welkweb"},
    {english = "Bloomweave", german = "Blütenweb"},
    {english = "Wildweave", german = "Wildeweb"},
    {english = "Stoneweave", german = "Steinweb"},
    {english = "Deepweave", german = "Tiefenweb"}
}

local tiers = {
    {english = "Basic", german = "Einfache"}
}

local function viewSigilCharges(user, weaversPouch)
    local baseMessage = common.GetNLS(user, "Siegel-Typ - Aufladungen (maximale Aufladungen)","Sigil Type - Charges(Max Charges)\n")
    local message = baseMessage

    for _, weave in pairs(weaves) do
        for _, tier in pairs(tiers) do
            local dataKey = tier.english..weave.english.."Sigil"
            local data = weaversPouch:getData(dataKey)

            if not common.IsNilOrEmpty(data) and tonumber(data) > 0 then --It exists and has charges
                message = message.."\n"..common.GetNLS(user, tier.german, tier.english)
                message = message.." "..common.GetNLS(user, weave.german, weave.english).." - "..data.."("..sigil.Limit..")"
            end
        end
    end

    if message == baseMessage then -- No sigil charges were found
        message = message..common.GetNLS(user, "Der Beutel des Webers enthält keine Gewebe, die du nutzen kannst. Wenn du nicht weißt, wie du ihn mit Sigillen verstärkst, kannst du Fianna in Troll's Haven für ein Tutorial finden.", "The weaver's pouch contains no weaves for you to harness. If you do not know how to empower it with sigils, you can find Fianna in Troll's Haven for a tutorial.")
    end

    local callback = function(dialog) end

    local dialog = MessageDialog(common.GetNLS(Character,"Gewebetasche", "Weaver's Pouch"), message, callback)

    user:requestMessageDialog(dialog)

end

local corStaffs = {Item.noviceCorStaff, Item.corStaff, Item.bloomCorStaff, Item.deepCorStaff, Item.wildCorStaff, Item.witherCorStaff, Item.stoneCorStaff}

local function hasCorStaffInHand(user)
    local corStaff = common.getItemInHand(user, corStaffs)

    if not corStaff then
        user:inform("Du musst zuerst einen Cor-Stab in der Hand halten.", "You need to have a Cor Staff in your hand first.")
        return false
    end

    return corStaff
end

local function selectSpell(user, category)
    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
         end

        local index = dialog:getSelectedIndex()+1

        for i = 1, #category.spellsKnown do
            if index == i then
                local corStaff = hasCorStaffInHand(user)
                if not corStaff then
                    return
                end
                corStaff:setdata("attunedSpell", category.spellsKnown[i])
                world:changeItem(corStaff)
                user:inform("Du stimmst den Cor-Stab auf den Zauber "..category.spellsKnown[i].." ein.", "You attune the Cor Staff to the spell "..category.spellsKnown[i]..".")
            end
        end
    end

    local dialogText = common.GetNLS(user,"Wähle die Webung aus, auf die du dich einstimmen möchtest.","Select the weave you want to attune.")
    local dialogTitle = common.GetNLS(user,"Gewebauswahl","Weave selection")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    for i = 1, #category.spellsKnown do
        dialog:addOption(0, category.spellsKnown[i])
    end

    user:requestSelectionDialog(dialog)
end

local function attuneSpell(user, sourceItem)

    local knownSpells = spells.getKnownSpells(user)

    if not knownSpells or #knownSpells < 1 then
        user:inform("Du kennst keine druidischen Webungen, auf die du deinen Cor-Stab einstimmen könntest.", "You do not know any druidic weaves to attune your Cor Staff to.")
        return
    end

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
        selectSpell(user, knownCategories[1])
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex()+1

        for i = 1, #knownCategories do
            if index == i then
                selectSpell(user, knownCategories[i])
            end
        end
    end

    local dialogText = common.GetNLS(user,"Wähle die Kategorie der Webung aus, auf die du dich einstimmen möchtest.","Select the category of weave you want to attune.")
    local dialogTitle = common.GetNLS(user,"Gewebauswahl","Weave selection")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    for i = 1, #knownCategories do
        local category = knownCategories[i]
        dialog:addOption(0, common.GetNLS(user, category.name.german, category.name.english))
    end

    user:requestSelectionDialog(dialog)
end

local function toggleAutocast(user) --"autoCast" to true/false
    local corStaff = hasCorStaffInHand(user)
    if not corStaff then
        return
    end
    local autoCast = corStaff:getData("autoCast")
    if autoCast == "true" then
        corStaff:setData("autoCast", "false")
        user:inform("Automatisches Wirken aktiviert.", "Autocast enabled.")
    else
        corStaff:setData("autoCast", "true")
        user:inform("Automatisches Wirken deaktiviert.", "Autocast disabled.")
    end

    world:changeItem(corStaff)
end

local function setRange(user)

    local callback = function (dialog)

        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        local _, _, theNumber = string.find(input,"(%d+)")

        local corStaff = hasCorStaffInHand(user)

        if not corStaff then
            return
        end

        if not theNumber or tonumber(theNumber) > 8 or tonumber(theNumber) < 1  then
            user:inform("Die eingegebene Zahl muss zwischen 1 und 8 liegen.", "The input number must be a number between 1 and 8.")
            return
        elseif corStaff then
            corStaff:setData("range", tostring(theNumber))
            world:changeItem(corStaff)
        else
            user:inform("Der Cor-Stab, für den du eine benutzerdefinierte Reichweite festlegen möchtest, muss in deinen Händen gehalten werden.", "The Cor Staff you wish to set a custom range for must be held in your hands.")
        end
    end

    local dialogTitle = common.GetNLS(user, "Cor-Stab Wirkreichweite", "Cor Staff Cast Range")
    local dialogText = common.GetNLS(user,"Hier kannst du festlegen, wie viele Felder entfernt von der Blickrichtung deines Charakters eine Webung gewirkt werden soll, wenn kein Ziel ausgewählt ist. Der Standardwert ist 1 und kann bis zu 8 betragen. Die Reichweite ist spezifisch für den Cor-Stab, für den du sie festlegst, und dieser muss dafür in der Hand gehalten werden. Dieses System ist eine Platzhalterlösung, bis wir jemanden haben, der die notwendige server- und clientseitige Unterstützung für Point-and-Click-Zielerfassung implementieren kann.", "This allows you to set how many tiles away from where your character is facing that you want to cast a weave at when you do not have a target selected. The default is 1, and it can go up to 8. The range is specific to the Cor Staff you set the range for, which must be held in your hand. This is a placeholder system until we have someone that can code the proper server and client side support necessary for point-and-click targeting.")

    user:requestInputDialog(InputDialog(dialogTitle, dialogText ,false, 255, callback))

end

function M.UseItem(user, sourceItem, ltstate)

    if not shared.isDruid(user) then
        return
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if index == 1 then
            viewSigilCharges(user, sourceItem)
        elseif index > 1 then
            if not hasCorStaffInHand(user) then
                return
            end
            if index == 2 then
                attuneSpell(user)
            elseif index == 3 then
                setRange(user)
            elseif index == 4 then
                toggleAutocast(user)
            end
        end
    end

    local dialogText = common.GetNLS(user,"Hier kannst du auswählen, ob du sehen möchtest, wie viele Aufladungen dein Beutel hat, deinen Cor-Stab auf einen Zauber einstimmen, eine Reichweite für deinen Cor-Stab festlegen oder einstellen, ob er Zauber automatisch wirken soll.", "Here you can select whether to view how many charges your pouch has, attune your Cor Staff to a spell, set a range for your Cor Staff or toggle whether it should autocast spells.")
    local dialogTitle = common.GetNLS(user,"Gewebetasche", "Weaver's Pouch")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)
    dialog:addOption(Item.blankSigil,common.GetNLS(user,"Sichtbare Siegelgebühren","View sigil charges"))
    dialog:addOption(Item.corStaff,common.GetNLS(user,"Zauber einstimmen","Attune spell"))
    dialog:addOption(Item.corStaff,common.GetNLS(user,"Reichweite einstellen","Set range"))
    dialog:addOption(Item.corStaff,common.GetNLS(user,"Automatisches Wirken umschalten","Toggle autocast"))
    user:requestSelectionDialog(dialog)
end

return M
