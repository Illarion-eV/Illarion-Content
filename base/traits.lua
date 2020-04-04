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

local M = {}

local allTraits = {}

local function getSpendableTraitPoints(character)
    return character:getQuestProgress(720)
end

local function removeTraitPoints(character, amount)
    amount = amount or 1
    character:setQuestProgress(720, character:getQuestProgress(720)-1)
end

local function hasTrait(character, traitTable)
    return character:getQuestProgress(traitTable.questId) > 0
end

local function setTrait(character, traitTable)
    character:setQuestProgress(traitTable.questId, 1)
end

local function removeTrait(character, traitTable)
    character:setQuestProgress(traitTable.questId, 0)
end

local function fulfillsPrequisite(character, traitTable)
    if type(traitTable.prerequisiteFunction) == "function" then
        return traitTable.prerequisiteFunction(character)
    else
        return true
    end
end

local function getAllTraitsOfCharacter(character)
    local characterTraits = {}
    for _, traitTable in pairs(allTraits) do
        if hasTrait(character, traitTable) then
            table.insert(characterTraits, traitTable)
        end
    end
    return characterTraits
end

-- Trait categoris --
local GENERAL = 1
local FIGHTING = 2
local CRAFTING = 3
local GATHERING = 4
local MAGIC = 5
local ALCHEMY = 6
local FAITH = 7

local categoriesProperties = {

    [GENERAL] = {nameDe = "Allgemeine Eigeneschaften", nameEn = "General traits", icon = Item.treasureChestOpen},
    [FIGHTING] = {nameDe = "Kämpfereigenschaften", nameEn = "Fighter traits", icon = Item.serinjahSword},
    [CRAFTING] = {nameDe = "Handwerkereigenschaften", nameEn = "Crafter traits", icon = Item.hammer},
    [GATHERING] = {nameDe = "Arbeitereigenschaften", nameEn = "Worker traits", icon = Item.pickaxe},
    [MAGIC] = {nameDe = "Magiereigenschaften", nameEn = "Mage traits", icon = Item.wandOfFire},
    [ALCHEMY] = {nameDe = "Alchemisteneigenschaften", nameEn = "Alchemist trait", icon = Item.cauldronEmpty},
    --[FAITH] = {nameDe = "Glaubenseigenschaften", nameEn = "Faith traits", icon = Item.altarGrey}
    
}

-- GENERAL TRAITS --
M.PASSIVE_INCOME_I = {questId = 721, nameDe = "Passives Einkommen I", nameEn = "Passive income I", descriptionDe = "Jeden Monat erhälst du einen kleinen Geldbetrag aus deinen Quellen.", descriptionEn = "Every month, your sources grant you a small amount of money.", icon = Item.silverCoins, category = GENERAL, prerequisiteFunction = false}
table.insert(allTraits, M.PASSIVE_INCOME_I)

M.PASSIVE_INCOME_II = {questId = 722, nameDe = "Passives Einkommen II", nameEn = "Passive income II", descriptionDe = "Deine Quellen lassen dir einen größeren Beitrag zukommen. \n[Voraussetzung: Passives Einkommen I]", descriptionEn = "Your sources grant you a bigger amount of money. \n[Prerequisite: Passive income I]", icon = Item.goldCoins, category = GENERAL, prerequisiteFunction = function(character) return hasTrait(character, M.PASSIVE_INCOME_I) end}
table.insert(allTraits, M.PASSIVE_INCOME_II)

M.WILFUL_HAIR = {questId = 723, nameDe = "Eigenwilliges Haar", nameEn = "Wilful hair", descriptionDe = "Dein Haar hat Charakter. Das zeigt es jeden Tag aufs Neue, indem es eine andere Farbe annimmt.", descriptionEn = "Your hair has its own will. This is proofen by it changing its colour every day to a new colour.", icon = Item.redDye, category = GENERAL, prerequisiteFunction = false}
table.insert(allTraits, M.WILFUL_HAIR)
-- GENERAL TRAITS END --

-- FIGHTING TRAITS --
M.SWORD_MASTER = {questId = 724, nameDe = "Weg des Schwertes", nameEn = "Way of the sword", descriptionDe = "Du hast eine besondere Verbindung zum Schwert. In deiner Hand ist die Schwertklinge noch tödlicher. \n[Voraussetzung: Umgang mit den besten Schwertern]", descriptionEn = "You have a special connection to swords. In your hand, the blade of the sword becomes even more deadly. \n[Prerequisite: BE able to use the bests swords.]", icon = Item.magicalBroadsword, category = FIGHTING, prerequisiteFunction = function(character) return character:getSkill(Character.slashingWeapons) == 100 end}
table.insert(allTraits, M.SWORD_MASTER)

M.UNDEAD_FIGHTER = {questId = 725, nameDe = "Tötet die Toten!", nameEn = "Kill the dead!", descriptionDe = "Du kennst die Untoten und du weißt, wie sie zu bekämpfen sind. Was auch immer die Quelle deiner Kraft ist - möge es Wissenschaft, Glaube oder etwas ganz anderes sein - du fügst ihnen mehr Schaden zu.", descriptionEn = "You know the undead, and you know how to fight them. Whatever your sources of power is - be it science, be it faith, or somehting else - you do more damage to them.", icon = Item.skullSouth, category = FIGHTING, prerequisiteFunction = false}
table.insert(allTraits, M.UNDEAD_FIGHTER)
-- FIGHTING TRAITS END --

-- CRAFTING TRAITS --
M.CARPENTRY_MASTER = {questId = 726, nameDe = "Ein Künstler mit dem Schnitzmessers", nameEn = "An artist with the carving knife", descriptionDe = "Durch außerordentliche Begabung für Holzarbeiten kennst du so manches Geheimnis. Du kannst Schreinerarbeiten herstellen, die dem gewöhnlichen Schreiner verschlossen bleiben.", descriptionEn = "Due to your special talent for wood work, you know some secrets. You are able to carve things which ordinary carpenters aren't able to produce.", icon = Item.carvingTools, category = CRAFTING, prerequisiteFunction = function(character) return character:getSkill(Character.carpentry) == 100 end}
table.insert(allTraits, M.CARPENTRY_MASTER)
-- CRAFTING TRAITS END --

-- GATHERING TRAITS --
M.BARE_HANDS_DIGGING = {questId = 727, nameDe = "Schaufel? Hände!", nameEn = "Shovel? Hands!", descriptionDe = "Deine Hände sind wie natürliche Schaufeln. Du kannst mit ihnen nach Sand, Lehm und Schätzen graben!", descriptionEn = "Your hands are like natural shovels. You can dig with them for sand, clay and treasures!", icon = Item.shovel, category = GATHERING, prerequisiteFunction = false}
table.insert(allTraits, M.BARE_HANDS_DIGGING)
-- GATHERING TRAITS END--

-- MAGIC TRAITS --
M.INCREASED_WAND_RANGE = {questId = 728, nameDe = "Verlängerte Stabmagie", nameEn = "Extended wand magic", descriptionDe = "Eine besondere Einsicht in die Art und Weise wie deine Stabmagie funktioniert, erlaubt es dir einen Schritt weiter zu zaubern als andere. \n[Voraussetzung: Sei ein Magier.]", descriptionEn = "A special insight into the workings of your wand magic allows you to cast magic one step farther than others can. \n[Prerequisite: Be a mage.]", icon = Item.wandOfSpirit, category = MAGIC, prerequisiteFunction = function(character) return character:getMagicType() == 0 and (character:getQuestProgress(37) ~= 0 or character:getMagicFlags(0) > 0) end}
table.insert(allTraits, M.INCREASED_WAND_RANGE)
-- MAGIC TRAITS END --

-- ALCHEMY TRAITS --
M.UNSTABLE_POTIONS_MADE_STABLE = {questId = 729, nameDe = "Stabilisierte Instabilität", nameEn = "Stabilised instability", descriptionDe = "Die Chance, dass die ebenso mächtigen wie instabilen Tränke explodieren, ist deutlich reduziert. \n[Voraussetzung: Sei ein Alchemist.]", descriptionEn = "The chance that those powerful, but instable potions explode is considerably reduced.\n[Voraussetzung: Be an alchemist.]", icon = Item.lightBlueSparklingPotion, category = ALCHEMY, prerequisiteFunction = function(character) return getMagicType() == 3 end}
table.insert(allTraits, M.UNSTABLE_POTIONS_MADE_STABLE)
-- ALCHEMY TRAIT END

local TRAIT_MANAGING_START = 1
local DISPLAY_ALL_OWN_TRAITS = 2
local DISPLAY_OWNED_TRAIT_DETAILS = 3
local DISPLAY_ALL_TRAIT_CATEGORIES = 4
local DISPLAY_ALL_TRAITS_FROM_SELECTED_CATEGORY = 5
local DISPLAY_SELECTED_UNOWNED_TRAIT_DETAILS = 6
local PLAYER_WANTS_TRAIT = 7

function M.traitsManagement(user, state, selectedTraitTable, selectedCategory)
    
    state = state or TRAIT_MANAGING_START
    
    if state == TRAIT_MANAGING_START then
        
        local buttonCharacterTraits = {icon = Item.blackBookSmall, text = common.GetNLS(user, "Zeige Charaktereigenschaften des Charakters an", "Display the character's traits"), func = M.traitsManagement, args = {user, DISPLAY_ALL_OWN_TRAITS}}
        local buttonAllTraits = {icon = Item.pileOfBooksSmall, text = common.GetNLS(user, "Zeige alle möglichen Charaktereigenschaften an", "Display all possible traits"), func = M.traitsManagement, args = {user, DISPLAY_ALL_TRAIT_CATEGORIES}}
        
        common.selectionDialogWrapper(user, common.GetNLS(user, "Charactereigenschaften", "Character traits"), common.GetNLS(user, "Hier kannst du dir die speziellen Eigenschaften deines Charakters anzeigen lassen oder neue hinzufügen.\n\nDu kannst noch" .. getSpendableTraitPoints(user) .. " Eigenschaften für deinen Charakter auswählen.", "Here you can look at the special traits of your character or add new to traits them.\n\nYou have " .. getSpendableTraitPoints(user) .. " traits left you can add."), {buttonCharacterTraits, buttonAllTraits}, nil, true)
    
    elseif state == DISPLAY_ALL_OWN_TRAITS then
    
        local allTraitsOfCharacter = getAllTraitsOfCharacter(user)
        if #allTraitsOfCharacter == 0 then
            user:inform("Der Charakter hat bisher keine speziellen Eigenschaften.", "Your chararcter doesn't have any specific traits yet.")
            return
        end
        
        local buttonsForAllTraitsOfCharacter = {}
        for _, traitTable in pairs(allTraitsOfCharacter) do
            local buttonForTrait = {icon = traitTable.icon, text = common.GetNLS(user, traitTable.nameDe, traitTable.nameEn), func = M.traitsManagement, args = {user, DISPLAY_OWNED_TRAIT_DETAILS, traitTable}}
            table.insert(buttonsForAllTraitsOfCharacter, buttonForTrait)
        end
        
        local onClose = {func = M.traitsManagement, args = {user, TRAIT_MANAGING_START}}
    
        common.selectionDialogWrapper(user, common.GetNLS(user, "Charactereigenschaften", "Character traits"), common.GetNLS(user, "Hier ist eine Übersicht all der Charactereigenschaften deines Charakters.", "Here you find an overview over all of your character's traits."), buttonsForAllTraitsOfCharacter, onClose, true)
    
    elseif state == DISPLAY_OWNED_TRAIT_DETAILS then
    
        local callback = function(dialog) 
            local returnToState
            if selectedCategory then
                returnToState = DISPLAY_ALL_TRAITS_FROM_SELECTED_CATEGORY
            else
                returnToState = DISPLAY_ALL_OWN_TRAITS
            end
            M.traitsManagement(user, returnToState, selectedTraitTable, selectedCategory)
        end
        
        local dialog = MessageDialog(common.GetNLS(user, selectedTraitTable.nameDe, selectedTraitTable.nameEn), common.GetNLS(user, selectedTraitTable.descriptionDe .. "\n\n[Diese Eigenschaft hat dein Charakter bereits.]", selectedTraitTable.descriptionEn .. "\n\n[Your character has this trait already.]"), callback)
        user:requestMessageDialog(dialog)
    
    elseif state == DISPLAY_ALL_TRAIT_CATEGORIES then
    
        local buttonsForAllTraitCategories = {}
        for category, categoryProperties in pairs(categoriesProperties) do
            local buttonForTraitCategory = {icon = categoryProperties.icon, text = common.GetNLS(user, categoryProperties.nameDe, categoryProperties.nameEn), func = M.traitsManagement, args = {user, DISPLAY_ALL_TRAITS_FROM_SELECTED_CATEGORY, nil, category}}
            table.insert(buttonsForAllTraitCategories, buttonForTraitCategory)
        end
        
        local onClose = {func = M.traitsManagement, args = {user, TRAIT_MANAGING_START}}
    
        common.selectionDialogWrapper(user, common.GetNLS(user, "Charactereigenschaften", "Character traits"), common.GetNLS(user, "Hier sind alle Kategorien an Charaktereigenschaften. Wähle eine aus, um die entsprechenden Charaktereigenschaften zu sehen.", "Here you find all categories of character traits. Select a category to see all its traits."), buttonsForAllTraitCategories, onClose, true)
    
    elseif state == DISPLAY_ALL_TRAITS_FROM_SELECTED_CATEGORY then
    
        local buttonsForAllTraitsOfCategory = {}
        for _, traitTable in pairs(allTraits) do
            
            if traitTable.category == selectedCategory then
                
                local newState
                if hasTrait(user, traitTable) then
                    newState = DISPLAY_OWNED_TRAIT_DETAILS
                else
                    newState = DISPLAY_SELECTED_UNOWNED_TRAIT_DETAILS
                end
                local buttonForTrait = {icon = traitTable.icon, text = common.GetNLS(user, traitTable.nameDe, traitTable.nameEn), func = M.traitsManagement, args = {user, newState, traitTable, selectedCategory}}
                table.insert(buttonsForAllTraitsOfCategory, buttonForTrait)
            end
        end

        local onClose = {func = M.traitsManagement, args = {user, DISPLAY_ALL_TRAIT_CATEGORIES}}    
            
        local categoryName = common.GetNLS(user, categoriesProperties[selectedCategory].nameDe, categoriesProperties[selectedCategory].nameEn)
        common.selectionDialogWrapper(user, categoryName, common.GetNLS(user, "Wähle eine Eigenschaft aus, um mehr über sie zu erfahren.", "Select a trait to learn more about it."), buttonsForAllTraitsOfCategory, onClose, true)
    
    elseif state == DISPLAY_SELECTED_UNOWNED_TRAIT_DETAILS then
        
        local buttonNo = {icon = Item.ruby, text = common.GetNLS(user, "Nein.", "No."), func = M.traitsManagement, args = {user, DISPLAY_ALL_TRAITS_FROM_SELECTED_CATEGORY, nil, selectedCategory}}
        local buttonYes = {icon = Item.emerald, text = common.GetNLS(user, "Ja.", "Yes."), func = M.traitsManagement, args = {user, PLAYER_WANTS_TRAIT, selectedTraitTable, nil}}
        
        local onClose = {func = M.traitsManagement, args = {user, DISPLAY_ALL_TRAITS_FROM_SELECTED_CATEGORY, nil, selectedCategory}}
    
        common.selectionDialogWrapper(user, common.GetNLS(user, "Charaktereigenschaft wählen?", "Select this trait?"), common.GetNLS(user, selectedTraitTable.nameDe .. ": " .. selectedTraitTable.descriptionDe .. "\n\n[Eine Wahl einer Eigenschaft kann nicht rückgängig gemacht werden!]", selectedTraitTable.nameEn .. ": " .. selectedTraitTable.descriptionEn .. "\n\n[You cannot change your choice once you made it!]"), {buttonNo, buttonYes}, onClose, true)
    
    elseif state == PLAYER_WANTS_TRAIT then
    
        local spendableTraitPoints = getSpendableTraitPoints(user)
        if spendableTraitPoints == 0 then
            user:inform("[Keine Punkte für Charaktereigenschaften mehr verfügbar!]","[You have no points to spend on your character's traits!]")
            return
        end
    
        if not selectedTraitTable.prerequisiteFunction or selectedTraitTable.prerequisiteFunction(user) then
            user:setQuestProgress(selectedTraitTable.questId, 1)
            removeTraitPoints(user, 1)
            user:inform("[Dein Charakter hat diese Eigenschaften erhalten: " .. selectedTraitTable.nameDe .. "]", "[Your character has now the trait: " .. selectedTraitTable.nameEn .. "]")
        else
            user:inform("[Dein Charakter erfüllt die entsprechende Voraussetzung nicht.]", "[Your character does not fulfill the prerequisite.]")
        end
    
    end

end

return M