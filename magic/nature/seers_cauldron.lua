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

local shared = require("magic.nature.shared")
local spells = require("magic.nature.spells")
local common = require("base.common")
local sigil = require("magic.nature.sigil")

local M = {}

local cooldown =  604800*2 --604800 is one week in seconds

local function setLearningCooldown(target)
    local time = tonumber(world:getTime("unix"))
    local timeWithCooldown = time+cooldown
    local learnedTime1 = target:getQuestProgress(941)
    local learnedTime2 = target:getQuestProgress(942)
    if learnedTime1 == 0 then
        target:setQuestProgress(941, timeWithCooldown)
    elseif learnedTime2 == 0 then
        target:setQuestProgress(942, timeWithCooldown)
    else
        debug("This shouldn't happen.")
    end
end

local function checkForExpiredCooldowns(target)
    local time = tonumber(world:getTime("unix"))
    local quests = {941, 942}
    for _, quest in pairs(quests) do
        local setTime = target:getQuestProgress(quest)
        if time >= setTime then
            target:setQuestProgress(quest, 0)
        end
    end
end

local function noSpellSlotAvailable(target)
    local quests = {941, 942}
    local time
    for _, quest in pairs(quests) do
        local questTime = target:getQuestProgress(quest)

        if not time or questTime < time then
            time = questTime -- We get the one that will expire sooner
        end

        if questTime == 0 then
            return false
        end
    end
    return true, time
end

local function convertUnixTime(unixTime)

    local currentTime = tonumber(world:getTime("unix"))

    local timeRemaining = unixTime - currentTime

    local weeks = math.floor(timeRemaining / 604800)
    timeRemaining = timeRemaining % 604800
    local days = math.floor(timeRemaining / 86400)
    timeRemaining = timeRemaining % 86400
    local hours = math.floor(timeRemaining / 3600)
    timeRemaining = timeRemaining % 3600
    local minutes = math.floor(timeRemaining / 60)
    local seconds = timeRemaining % 60
    return weeks, days, hours, minutes, seconds
end

local function informUserOfRemainingCooldown(user)

    local notEnoughTime, time = noSpellSlotAvailable(user)

    if not notEnoughTime then
        return
    end

    local weeks, days, hours, minutes, seconds = convertUnixTime(time)

    local remainingTime = {}

    local english = "There's"
    local german = "Es verbleiben"

    if weeks > 0 then
        english = english.." "..weeks.." week"
        german = german.." "..weeks.." Woche"
    end

    if days > 0 then
        if weeks > 0 then
            english = english..","
            german = german..","
        end
        english = english.." "..days.." days"
        german = german.." "..days.." Tage"
    end

    if hours > 0 then
        if weeks > 0 then
            english = english..","
            german = german..","
        end
        english = english.." "..hours.." hours"
        german = german.." "..hours.." Stunden"
    end

    if minutes > 0 then
        if weeks > 0 or days > 0 or hours > 0 then
            english = english..","
            german = german..","
        end
        english = english.." "..minutes.." minutes"
        german = german.." "..minutes.." Minuten"
    end

    if weeks > 0 or days > 0 or hours > 0 or minutes > 0 then
        english = english.." and"
        german = german.." und"
    end

    remainingTime.english = english.." "..seconds.." seconds remaining until you can learn another weave spell."
    remainingTime.german = german.." "..seconds.." Sekunden, bis du einen weiteren Webzauber erlernen kannst."

    user:inform(remainingTime.german, remainingTime.english)

end

local function criteriaMet(user, chosenSpell)

    if noSpellSlotAvailable(user)
        or not spells.statReqMet(user, chosenSpell.name)
        or not spells.skillCriteriaMet(user, chosenSpell.name)
        or not sigil.checkIfCraftedSigil(user, chosenSpell.sigil) then
        return false
    end

    return true
end

local function learnConfirmation(user, chosenSpell)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if index == 1 then
            setLearningCooldown(user)
            spells.learnSpell(user, chosenSpell.name)
        else
            return
        end
    end

    local dialogText = common.GetNLS(user,"Möchtest du diesen Webzauber erlernen? Du kannst nur 2 alle 2 Wochen lernen, also wähle mit Bedacht.","Do you wish to learn this weave spell? You can only learn 2 every 2 weeks, so choose wisely.")
    local dialog = SelectionDialog(chosenSpell.name, dialogText, callback)

    dialog:addOption(0, common.GetNLS(user, "Ja", "Yes"))
    dialog:addOption(0, common.GetNLS(user, "Nein", "No"))

    user:requestSelectionDialog(dialog)

end

local function showCriteriaAndHint(user, chosenSpell, weaveName)

    local baseText = {german = "Um diesen Webzauber zu erlernen, benötigst du", english = "To learn this weave spell, you need"}

    local criteria = {}

    if noSpellSlotAvailable(user) then
        table.insert(criteria, {german = " einen freien Zauberplatz", english = " an available spell slot"})
    end

    if not spells.statReqMet(user, chosenSpell.name) then
        table.insert(criteria, {german = " eine stärkere Affinität zur Natur ((Wahrnehmung, Intelligenz, Essenz))", english = " to have a higher affinity with nature ((Perception, Intelligence, Essence))"})
    end

    if not spells.skillCriteriaMet(user, chosenSpell.name) then
        table.insert(criteria, {german = " ein höheres Maß an Erfahrung im "..weaveName.german, english = " to have a higher level of expertise in "..weaveName.english})
    end

    if not sigil.checkIfCraftedSigil(user, chosenSpell.sigil) then
        table.insert(criteria, {german = " dass du "..sigil.getGermanSigilTranslation(chosenSpell.sigil).." zum ersten Mal hergestellt hast", english = " to have crafted a "..chosenSpell.sigil.." for the first time."})
    end

    for i, text in pairs(criteria) do

        if i > 1 and i < #criteria then
            baseText = baseText..","
        end

        if i == #criteria and i ~= 1 then
            baseText = baseText..common.GetNLS(user, "und ", "and ")
        end

        baseText = baseText..common.GetNLS(user, text.german, text.english)

        if i == #criteria then
            baseText = baseText.."."
        end
    end

    local hint = sigil.getSigilHint(chosenSpell.sigil)

    if not sigil.checkIfCraftedSigil(user, chosenSpell.sigil) then
        baseText = baseText.."\n\n"..common.GetNLS(user, hint.german, hint.english)
    end

    local callback = function(dialog) end
    local dialog = MessageDialog(chosenSpell.name, baseText, callback)
    user:requestMessageDialog(dialog)
end

local function selectSpellOfWeave(user, chosenWeave)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex()+1

        for i, spell in ipairs(chosenWeave.spellsToLearn) do
            if i == index then
                if criteriaMet(user, spell) then
                    learnConfirmation(user, spell)
                else
                    showCriteriaAndHint(user, spell, chosenWeave.name)
                end
            end
        end
    end

    local dialogText = common.GetNLS(user,"Wähle das Webmuster, das du erlernen möchtest.","Choose the weave you wish to learn.")
    local dialogTitle = common.GetNLS(user, chosenWeave.name.german, chosenWeave.name.english)
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    for _, spell in ipairs(chosenWeave.spellsToLearn) do
        dialog:addOption(0, spell.name)
    end

    user:requestSelectionDialog(dialog)
end

local function selectCoreWeave(user, unlearnedSpells)

    local categories = {
        {name = {english = "Bloomweaves", german = "Blütengewebe"}, skill = Character.bloomweave, spellsToLearn = {}},
        {name = {english = "Stoneweaves", german = "Steingewebe"}, skill = Character.stoneweave, spellsToLearn = {}},
        {name = {english = "Wildweaves", german = "Wildgewebe"}, skill = Character.wildweave, spellsToLearn = {}},
        {name = {english = "Witherweaves", german = "Verfallgewebe"}, skill = Character.witherweave, spellsToLearn = {}},
        {name = {english = "Deepweaves", german = "Tiefengewebe"}, skill = Character.deepweave, spellsToLearn = {}}
    }

    for _, unlearnedSpell in pairs(unlearnedSpells) do
        for _, category in pairs(categories) do
            if category.skill == unlearnedSpell.skill then
                table.insert(category.spellsToLearn, unlearnedSpell)
            end
        end
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex()+1

        local skipped = 0

        for i, category in ipairs(categories) do

            if #category.spellsToLearn > 0 then

                if i-skipped == index then
                    selectSpellOfWeave(user, category)
                end
            else
                skipped = skipped+1
            end
        end
    end

    local dialogText = common.GetNLS(user,"Wähle die Kategorie des Webens, aus der du einen Zauber erlernen möchtest.","Select the category of weave you want to learn a weave from.")
    local dialogTitle = common.GetNLS(user,"Gewebauswahl","Weave selection")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    for i, category in ipairs(categories) do
        if #category.spellsToLearn > 0 then
            dialog:addOption(0, common.GetNLS(user, category.name.german, category.name.english))
        end
    end

    user:requestSelectionDialog(dialog)

end

function M.UseItem(user, sourceItem, ltstate)

    if not shared.isDruid(user) then
        return
    end

    local unlearnedSpells = spells.getUnlearnedSpells(user) -- Gets a list of all active spells a player has not learned

    if #unlearnedSpells < 1 then -- There are no unlearned spells
        user:inform("Die Wasser im Kessel bleiben still, egal wie lange du hineinblickst. Es scheint, als hätte er im Moment keine Visionen neuer Webmuster mit dir zu teilen.", "The waters in the cauldron remain still no matter how long you stare into it. It does not appear to have any visions of new weaves to share with you right now.")
        return
    end

    checkForExpiredCooldowns(user)

    if noSpellSlotAvailable(user) then -- The user's learning slots are still on cooldown.
        -- You can learn 2 spells per 2 weeks, same as the arcane magic rune learning cooldown.
        informUserOfRemainingCooldown(user)
    end -- We still allow the user to carry on so they can see what weaves are available and prepare

    selectCoreWeave(user, unlearnedSpells)

end

return M
