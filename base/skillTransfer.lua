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

-- This is ugly but functional code to handle the skill transfer to new skills. This code should be deleted after the 1th January 2017
-- Clean up the various tool scripts as well then

local common = require("base.common")
local M = {}

local function transferSkillCookingHerbloreFarming(user)
    local cookingBakingTable = user:getSkillValue(Character.cookingAndBaking)
    local herbloreTable = user:getSkillValue(Character.herblore)
    local farmingTable = user:getSkillValue(Character.farming)
    
    cookingBakingTable = cookingBakingTable or {major = 0, minor = 0}
    herbloreTable = herbloreTable or {major = 0, minor = 0}
    farmingTable = farmingTable or {major = 0, minor = 0}
    
    if (cookingBakingTable.major < 1 and herbloreTable.major < 1 and farmingTable.major < 1) or user:getQuestProgress(40) ~= 0 then
        return false
    end
    
    local changes = {}
    changes[0] = {textDe = "Ändere nichts.", textEn = "Change nothing.", 
    exec = function(user, skillValues) user:inform(common.GetNLS(user,"Du hast dich dafür entschieden, keine Veränderungen vorzunehmen.", "You decided to change nothing."), Character.highPriority); end}
    
    changes[1] = {textDe = "Übertrage deine Punkte von Kochen und Backen auf Landwirtschaft.", textEn = "Transfer your points from Cooking and Baking to Husbandry.", 
    exec = function(user, skillValues) user:inform(common.GetNLS(user,"Du hast dich dafür entschieden, deine Punkte von Kochen und Backen auf Landwirtschaft zu übertragen.", "You decided to transfer your points from Cooking and Baking to Husbandry"), Character.highPriority); user:setSkill(Character.husbandry, skillValues.cookingBakingTable.major, cookingBakingTable.minor); user:setSkill(Character.cookingAndBaking, 0, 0); end}
    
    changes[2] = {textDe = "Übertrage deine Punkte von Kochen und Backen auf Brauerei.", textEn = "Transfer your points from Cooking and Baking to Brewing.", 
    exec = function(user, skillValues) user:inform(common.GetNLS(user,"Du hast dich dafür entschieden, deine Punkte von Kochen und Backen auf Brauerei zu übertragen.", "You decided to transfer your points from Cooking and Baking to Brewing"), Character.highPriority); user:setSkill(Character.brewing, skillValues.cookingBakingTable.major, skillValues.cookingBakingTable.minor); user:setSkill(Character.cookingAndBaking, 0, 0); end}
    
    changes[3] = {textDe = "Übertrage deine Punkte von Kräuterkunde auf Landwirtschaft.", textEn = "Transfer your points from Herblore to Husbandry.", 
    exec = function(user, skillValues) user:inform(common.GetNLS(user,"Du hast dich dafür entschieden, deine Punkte von Kräuterkunde auf Landwirtschaft zu übertragen.", "You decided to transfer your points from Herblore to Husbandry"), Character.highPriority); user:setSkill(Character.husbandry, skillValues.herbloreTable.major, skillValues.herbloreTable.minor); user:setSkill(Character.herblore, 0, 0); end}
    
    changes[4] = {textDe = "Übertrage deine Punkte von Kochen und Backen auf Brauerei.\nUnd übertrage deine punkte von Kräuterkunde auf Landwirtschaft.", 
    textEn = "Transfer your points from Cooking and Baking to Brewing.\nAnd transfer your points from Herblore to Husbandry.", 
    exec = function(user, skillValues) user:inform(common.GetNLS(user,"Du hast dich dafür entschieden, deine Punkte von Kräuterkunde auf Landwirtschaft zu übertragen und deine Punkte von Kochen und Backen auf Brauerei zu verschieben.", "You decided to transfer your points from Herblore to Husbandry and to transfer your points from Cooking and Baking to Brewing.")); user:setSkill(Character.husbandry, skillValues.herbloreTable.major, skillValues.herbloreTable.minor); user:setSkill(Character.herblore, 0, 0); user:setSkill(Character.brewing, skillValues.cookingBakingTable.major, skillValues.cookingBakingTable.minor); user:setSkill(Character.cookingAndBaking, 0, 0); end}
    
    changes[5] = {textDe = "Übertrage deine Punkte von Ackerbau auf Landwirtschaft.", textEn = "Transfer your points from Farming to Husbandry.", 
    exec = function(user, skillValues) user:inform(common.GetNLS(user,"Du hast dich dafür entschieden, deine Punkte von Ackerbau auf Landwirtschaft zu übertragen.", "You decided to transfer your points from Farming to Husbandry", Character.highPriority)); user:setSkill(Character.husbandry, skillValues.farmingTable.major, skillValues.farmingTable.minor); user:setSkill(Character.farming, 0, 0); end}
    
    changes[6] = {textDe = "Übertrage deine Punkte von Kochen und Backen auf Brauerei.\nUnd übertrage deine punkte von Ackerbau auf Landwirtschaft.", textEn = "Transfer your points from Cooking and Baking to Brewing.\nAnd transfer your points from Farming to Husbandry.", 
    exec = function(user, skillValues) user:inform(common.GetNLS(user,"Du hast dich dafür entschieden, deine Punkte von Ackerbau auf Landwirtschaft zu übertragen und deine Punkte von Kochen und Backen auf Brauerei zu verschieben.", "You decided to transfer your points from Farming to Husbandry and to transfer your points from Cooking and Baking to Brewing.")); user:setSkill(Character.husbandry, skillValues.farmingTable.major, skillValues.farmingTable.minor); user:setSkill(Character.farming, 0, 0); user:setSkill(Character.brewing, skillValues.cookingBakingTable.major, skillValues.cookingBakingTable.minor); user:setSkill(Character.cookingAndBaking, 0, 0); end}
    

    local changeIds
    if cookingBakingTable.major > 0 and herbloreTable.major < 1 and farmingTable.major < 1 then
        changeIds = {0, 1, 2}
    elseif cookingBakingTable.major < 1 and herbloreTable.major > 0 and farmingTable.major < 1 then
        changeIds = {0, 3}
    elseif cookingBakingTable.major < 1 and herbloreTable.major < 1 and farmingTable.major > 0 then
        changeIds = {0, 5}
    elseif cookingBakingTable.major < 1 and herbloreTable.major > 0 and farmingTable.major > 0 then
        changeIds = {0, 5, 3}
    elseif cookingBakingTable.major > 0 and herbloreTable.major > 0 and farmingTable.major < 1 then
        changeIds = {0, 1, 2, 3, 4}
    elseif cookingBakingTable.major > 0 and herbloreTable.major < 1 and farmingTable.major > 0 then
        changeIds = {0, 1, 2, 5, 6}
    elseif cookingBakingTable.major > 0 and herbloreTable.major > 0 and farmingTable.major > 0 then
        changeIds = {0, 1, 2, 3, 4, 5, 6}
    end
    
    local callback = function(dialog)
        local success = dialog:getSuccess() 
        if not success then
            user:inform("Du wirst dieses Handwerk nicht ausführen können, bis du dich entschieden hast.", "You won't be able to do this craft until you have decided for an option.", Character.highPriority)
        elseif user:getQuestProgress(40) == 0 then
            user:setQuestProgress(40, 1)
            local selected = dialog:getSelectedIndex()+1
            changes[changeIds[selected]].exec(user, {cookingBakingTable = cookingBakingTable, herbloreTable = herbloreTable, farmingTable = farmingTable})
        end
    end
    
    local dialog
    if user:getPlayerLanguage() == Player.german then
        dialog = SelectionDialog("Neue Handwerksfähigkeiten", "Was möchtest du tun?", callback)
    else
        dialog = SelectionDialog("New crafting skills", "What do you want to do?", callback)
    end
    
    for i=1, #changeIds do
        dialog:addOption(0, common.GetNLS(user, changes[changeIds[i]].textDe, changes[changeIds[i]].textEn))
    end
    user:requestSelectionDialog(dialog)
    
end

function M.skillTransferInformCookingHerbloreFarming(user)
    local cookingBakingTable = user:getSkillValue(Character.cookingAndBaking)
    local herbloreTable = user:getSkillValue(Character.herblore)
    local farmingTable = user:getSkillValue(Character.farming)
    
    cookingBakingTable = cookingBakingTable or {major = 0, minor = 0}
    herbloreTable = herbloreTable or {major = 0, minor = 0}
    farmingTable = farmingTable or {major = 0, minor = 0}
    
    if (cookingBakingTable.major < 1 and herbloreTable.major < 1 and farmingTable.major < 1) or user:getQuestProgress(40) ~= 0 then
        return false
    end
    
    local infText = common.GetNLS(user,
       "Illarion hat zwei neue Skills: Brauerei und Landwirtschaft.\nIm folgenden wirst du die Möglichkeit haben, deine Skills anzupassen, wenn du das wüschst.\n\nLandwirtschaft umfasst das Braten am Räucherofen (zuvor gehörte das zum Kochen und Backen Skill), das Ölpressen (das gehörte zuvor zu Kräuterkunde) und das Sammeln von Waben und Verarbeiten von diesen zu Kerzen (beides zuvor Teil von Ackerbau.\n\nBrauerei umfasst das Herstellen von Getränken aller Art. Dies wurde aus dem Kochen und Backen Skill entfernt.\n\nKlicke auf 'Okay' um zu den möglichen Anpassungsoptionen zu gelangen. Bitte bedenke, dass du deine Entscheidung nicht im Nachhinein ändern kannst.",
       
       "Illarion has two new Skills: Brewing and Husbandry.\nYou have now the option to adjust your skills if you wish to do so.\nHusbandry handles now smoking food in the smoke oven (Formerly, this was part of Cooking and Baking.), making oil from thistles (formerly part of Herblore), and collecting honeycombs and making candles from them (formlery part of farming).\nBrewing is producing all kinds of drinks (This was formerly part of Cooking and Baking).\nClick 'Okay' to get to the possible option for adjusting your skills. Mind that you cannot undo your decision afterwards.")
    local title = common.GetNLS(user,"Neue Handwerksskills","New crafting skills")

    local closeTrib=function(onClose)
        transferSkillCookingHerbloreFarming(user)
    end

    local dialogue=MessageDialog(title,infText,closeTrib)
    user:requestMessageDialog(dialogue)
    return true
end

local function transferSkillMining(user)

    local miningTable = user:getSkillValue(Character.mining)
    miningTable = miningTable or {major = 0, minor = 0}

    local callback = function(dialog)
        local success = dialog:getSuccess() 
        if not success then
            user:inform("Du wirst dieses Handwerk nicht ausführen können, bis du dich entschieden hast.", "You won't be able to do this craft until you have decided for an option.", Character.highPriority)
        elseif user:getQuestProgress(41) == 0 then
            user:setQuestProgress(41, 1)
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                user:inform("Es wurde keine Änderung vorgenommen. Du behälst all deine Punkte in Bergbau.", "No changes were done. All your skill points remain in Mining.", Character.highPriority)
            elseif selected == 2 then
                user:inform("Du hast all deine Bergbauerfahrung auf Graben übertragen.", "You have transfered all your points from Mining to Digging", Character.highPriority)
                user:setSkill(Character.digging, miningTable.major, miningTable.minor)
                user:setSkill(Character.mining, 0, 0)
            end
        end
    end
    
    local dialog
    if user:getPlayerLanguage() == Player.german then
        dialog = SelectionDialog("Neue Handwerksfähigkeiten", "Was möchtest du tun?", callback)
    else
        dialog = SelectionDialog("New crafting skills", "What do you want to do?", callback)
    end
    
    dialog:addOption(0, common.GetNLS(user,"Behalte all deine Punkt in Bergbau.\nDu wirst 0 Punkte in Graben haben.", "Keep all your points in Mining.\nYou will have 0 points in Digging."))
    dialog:addOption(0, common.GetNLS(user,"Übertrage all deine Punkte von Bergbau auf Graben.\n Du wirst 0 Punkte in Bergbau haben.", "Transfer all your points from Mining to Digging.\nYou will have 0 points in Mining."))
    user:requestSelectionDialog(dialog)

end

function M.skillTransferInformMining(user)
    local miningTable = user:getSkillValue(Character.mining)
    miningTable = miningTable or {major = 0, minor = 0}

    if miningTable.major < 1 or user:getQuestProgress(41) ~= 0 then
        return false
    end
    
    local infText = common.GetNLS(user,
    "Illarion hat einen neuen Skill: Graben. Darüber läuft das Sammeln von Lehm und Sand, sowieo das Sieben von Sand. Graben gehörte vorher zum Bergbau und wurde ausgekoppelt.\nIm folgenden kannst du deine Fähigkeiten anpassen, sofern du das wünscht. Bitte bedenke, dass du deine Entscheidung im Nachhinein nicht ändern kannst.",
    "Illarion has a new skill: Digging. Collecting clay and sand, and sieving sand is now part of this skill. Those actions were formerly part of Mining but have now become an own skill.\nIn the following, you will be able to adjust your skill in case you wish to do so. Mind that you cannot change your decision afterwards.")
    
    local title = common.GetNLS(user,"Neue Handwerksskills","New crafting skills")
    local closeTrib=function(onClose)
        transferSkillMining(user)
    end

    local dialogue=MessageDialog(title,infText,closeTrib)
    user:requestMessageDialog(dialogue)
    return true    
end

local function transferSkillSmithing(user)

    local blacksmithingTable = user:getSkillValue(Character.blacksmithing)
    blacksmithingTable = blacksmithingTable or {major = 0, minor = 0}

    local callback = function(dialog)
        local success = dialog:getSuccess() 
        if not success then
            user:inform("Du wirst dieses Handwerk nicht ausführen können, bis du dich entschieden hast.", "You won't be able to do this craft until you have decided for an option.", Character.highPriority)
        elseif user:getQuestProgress(42) == 0 then
            user:setQuestProgress(42, 1)
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                user:inform("Es wurde keine Änderung vorgenommen. Du behälst all deine Punkte in Schmieden.", "No changes were done. All your skill points remain in Blacksmithing.", Character.highPriority)
            elseif selected == 2 then
                user:inform("Du hast all deine Schmiedeerfahrung auf Rüstschmieden übertragen.", "You have transfered all your points from Blacksmithing to Armourer", Character.highPriority)
                user:setSkill(Character.armourer, blacksmithingTable.major, blacksmithingTable.minor)
                user:setSkill(Character.blacksmithing, 0, 0)
            end
        end
    end
    
    local dialog
    if user:getPlayerLanguage() == Player.german then
        dialog = SelectionDialog("Neue Handwerksfähigkeiten", "Was möchtest du tun?", callback)
    else
        dialog = SelectionDialog("New crafting skills", "What do you want to do?", callback)
    end
    
    dialog:addOption(0, common.GetNLS(user,"Behalte all deine Punkt in Schmieden.\nDu wirst 0 Punkte in Rüstschmieden haben.", "Keep all your points in Blacksmithing.\nYou will have 0 points in Armourer."))
    dialog:addOption(0, common.GetNLS(user,"Übertrage all deine Punkte von Schmieden auf Rüstschmieden.\n Du wirst 0 Punkte in Schmieden haben.", "Transfer all your points from Blacksmithing to Armourer.\nYou will have 0 points in Blacksmithing."))
    user:requestSelectionDialog(dialog)

end

function M.skillTransferInformSmithing(user)
    local blacksmithingTable = user:getSkillValue(Character.blacksmithing)
    blacksmithingTable = blacksmithingTable or {major = 0, minor = 0}

    if blacksmithingTable.major < 1 or user:getQuestProgress(42) ~= 0 then
        return false
    end
    
    local infText = common.GetNLS(user,
    "Illarion hat einen neuen Skill: Rüstschmieden. Das Schmieden von Rüstungsteilen ist nicht länger Teil des normalen Schmiedeskills, sondern eine eigene Fähigkeit..\nIm folgenden kannst du deine Fähigkeiten anpassen, sofern du das wünscht. Bitte bedenke, dass du deine Entscheidung im Nachhinein nicht ändern kannst.",
    "Illarion has a new skill: Armourer. Crafting armour parts is no longer part of the normal blacksmithing skill but a skill of its own.\nIn the following, you will be able to adjust your skill in case you wish to do so. Mind that you cannot change your decision afterwards.")
    
    local title = common.GetNLS(user,"Neue Handwerksskills","New crafting skills")
    local closeTrib=function(onClose)
        transferSkillSmithing(user)
    end

    local dialogue=MessageDialog(title,infText,closeTrib)
    user:requestMessageDialog(dialogue)
    return true    
end

return M