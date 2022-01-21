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

-- UPDATE items SET itm_script='item.fountain' WHERE itm_id IN (631,2079);

local common = require("base.common")
local lookat = require("base.lookat")
local texts = require("magic.arcane.base.texts")
local myTexts = texts.fountainDialogue

local M = {}

local function takeOffering(user, offerings)

    for _, offering in pairs(offerings) do
        user:eraseItem(offering, 1)
    end
user:setQuestProgress(238, 6) --offering has been given
user:inform(myTexts.offered.german, myTexts.offered.english)
end

local function checkForOffering(user)

    local offerings = {Item.pureAir, Item.pureEarth, Item.pureFire, Item.pureSpirit, Item.pureWater}
    local proceed = common.userHasItems(user,offerings)

    if proceed then
        takeOffering(user, offerings)
    else
        user:inform(myTexts.lacking.german, myTexts.lacking.english)
    end
end

local function offeringRequired(user)

    local status = user:getQuestProgress(238)

    if status == 5 or status == 7 then
        checkForOffering(user)
        return true
    end

    if status == 6 then
        return false
    end

    if status == 3 then
        user:setQuestProgress(238, 4)
    end
    if status < 3 then
        user:inform(myTexts.whatToDo.german, myTexts.whatToDo.english)
    end
    if status < 5 then
        user:inform(myTexts.found.german, myTexts.found.english)
    end
    return true
end

local lakeOfLifeFountainPos = {
    position(660, 238, -9),
    position(744, 203, -9),
    position(777, 186, -9),
    position(705, 262, -9),
    position(725, 286, -9),
    position(759, 303, -9),
    position(777, 283, -9),
    position(763, 262, -9)
    }

local fountainOfForgetfulness = position(348, 567, 0)

local magicSkills = {"alchemy","wandMagic","earthMagic","windMagic","fireMagic","spiritMagic","waterMagic","blessing","praying","vowing","confessing","ceremony","consecrateWeapons","consecrateArmours","potionLore","summoning","natureLore","cauldronLore","animalTaming","enchantingOfAmulets","enchantingOfJewels","spatialMagic"}

local function resetAllMagicSkills(user)

    for _, skill in pairs(magicSkills) do
        user:setSkill(Character[skill], 0, 0)
    end

end

local function resetMagicRelatedQuests(user)

    user:setQuestProgress(51, 0) --unlearn all arcane runes
    user:setQuestProgress(216, 0) --unattune all portal locations
    user:setQuestProgress(225, 0) --reset red portal permits
    user:setQuestProgress(235, 0) --reset stored portal colour
    user:setQuestProgress(237, 0) --reset arcane runes learning questline
    user:setQuestProgress(239, 0) --reset wand magic learning questline
    user:setQuestProgress(240, 0) --reset spatial magic learning questline
    user:setQuestProgress(241, 0) --reset glyph magic learning questline
    user:setQuestProgress(350, 0) --alchemy teacher
    user:setQuestProgress(351, 0) --same as above
    user:setQuestProgress(352, 0) --same as above
    user:setQuestProgress(37, 0) --remove mage status
    user:setQuestProgress(38, 0) --reset magic books read
    user:setQuestProgress(238, 7) --Offering will be required again next time

end

local function resetMagicType(user)

    user:setMagicType(0)

end

local function offeringExists(user)
    return true
end

local function removeOffering(user)
    if offeringExists(user) then
        return true
    end

    return false

end

local function applyKnowledgeRemoval(user)

    if removeOffering(user) then
        resetAllMagicSkills(user)
        resetMagicRelatedQuests(user)
        resetMagicType(user)
        user:inform(myTexts.removed.german, myTexts.removed.english)
    end

end

local function finalCheck(user)

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index == 1 then
            applyKnowledgeRemoval(user)
        elseif index == 2 then
            user:inform(myTexts.kept.german, myTexts.kept.english)
        end
    end
    local dialog = SelectionDialog(
        common.GetNLS(user, texts.forgetfulFountain.name.german, texts.forgetfulFountain.name.english),
        common.GetNLS(user, myTexts.finalVerification.german, myTexts.finalVerification.english),
        callback)

    dialog:addOption(0, common.GetNLS(user, myTexts.yes.german, myTexts.yes.english))
    dialog:addOption(0, common.GetNLS(user, myTexts.no.german, myTexts.no.english))

    user:requestSelectionDialog(dialog)

end

local function secondCheck(user)

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index == 1 then
            finalCheck(user)
        elseif index == 2 then
            user:inform(myTexts.kept.german, myTexts.kept.english)
        end
    end
    local dialog = SelectionDialog(
        common.GetNLS(user, texts.forgetfulFountain.name.german, texts.forgetfulFountain.name.english),
        common.GetNLS(user, myTexts.reallyCertain.german, myTexts.reallyCertain.english),
        callback)

    dialog:addOption(0, common.GetNLS(user, myTexts.yes.german, myTexts.yes.english))
    dialog:addOption(0, common.GetNLS(user, myTexts.no.german, myTexts.no.english))

    user:requestSelectionDialog(dialog)

end

local function firstCheck(user)

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index == 1 then
            secondCheck(user)
        elseif index == 2 then
            user:inform(myTexts.kept.german, myTexts.kept.english)
        end
    end
    local dialog = SelectionDialog(
        common.GetNLS(user, texts.forgetfulFountain.name.german, texts.forgetfulFountain.name.english),
        common.GetNLS(user, myTexts.certain.german, myTexts.certain.english),
        callback)

    dialog:addOption(0, common.GetNLS(user, myTexts.yes.german, myTexts.yes.english))
    dialog:addOption(0, common.GetNLS(user, myTexts.no.german, myTexts.no.english))

    user:requestSelectionDialog(dialog)

end

local function useFountainOfForgetfulness(user)

    if offeringRequired(user) then
        return
    end

    firstCheck(user)

end

function M.UseItem(user, SourceItem, ltstate)

    for i = 1, #lakeOfLifeFountainPos do
        if (SourceItem.pos == lakeOfLifeFountainPos[i]) then
            world:gfx(16, user.pos) -- nice GFX
            world:makeSound(10, user.pos) -- nice SFX
            common.InformNLS(user, "Du wäschst dich.", "You start to cleanse.")
            user:setQuestProgress(508,1)
            user:setQuestProgress(509,2) -- timer
        end
    end

    if SourceItem.pos == fountainOfForgetfulness then
        useFountainOfForgetfulness(user)
        return
    end

    local ITEM_ID_BUCKET = 51
    local emptybucket = require("item.id_51_emptybucket")
    if common.hasItemIdInHand(user, ITEM_ID_BUCKET) then
        emptybucket.UseItem(user, common.getItemInHand(user, ITEM_ID_BUCKET), ltstate)
        return
    end

    local ITEM_ID_BOTTLE = 2498
    local emptybottle = require("item.id_2498_empty_bottle")
    if common.hasItemIdInHand(user, ITEM_ID_BOTTLE) then
        emptybottle.UseItem(user, common.getItemInHand(user, ITEM_ID_BOTTLE), ltstate)
        return
    end

    common.HighInformNLS(user,
        "Du kannst hier einen Eimer oder eine große leere Flasche in deine Hand nehmen und mit Wasser füllen.",
        "Take an empty bucket or a large empty bottle into hand to fill it with water.")

end

function M.LookAtItem(user, item)

    local lookAt = lookat.GenerateLookAt(user, item)
    if item.pos == fountainOfForgetfulness then
        lookAt.name = common.GetNLS(user, texts.forgetfulFountain.name.german, texts.forgetfulFountain.name.english)
        lookAt.description = common.GetNLS(user, texts.forgetfulFountain.description.german, texts.forgetfulFountain.description.english)
    end

    return lookAt
end

return M
