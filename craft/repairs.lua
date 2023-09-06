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
local lookat = require("base.lookat")

local itemRepairList = {}

local M = {}

local amountOfDurabilityPoints = 99

local maxDurabilityPointsRegainedPerOnePercentKitUsage = 3 --This means that if you repair a 10 gold item with a 10 gold kit you get max 99 points aka one full repair, but if you repair a 1 gold item with a 10 gold kit you get at most 297 points aka 3 full repairs, so you make a loss of 7 gold for using a too high kit.

local maxRepairsInField = 9*amountOfDurabilityPoints

local staticToolCountMultiplier = 2

local maxRepairsAtStaticTool = maxRepairsInField*staticToolCountMultiplier

local weaponType = {}
weaponType[WeaponStruct.slashing] = "blacksmithing"
weaponType[WeaponStruct.concussion] = "carpentry"
weaponType[WeaponStruct.puncture] = "blacksmithing"
weaponType[WeaponStruct.slashingTwoHand] = "blacksmithing"
weaponType[WeaponStruct.concussionTwoHand] = "carpentry"
weaponType[WeaponStruct.punctureTwoHand] = "carpentry"
weaponType[WeaponStruct.firearm] = "carpentry"
weaponType[WeaponStruct.stave] = "carpentry"
weaponType[WeaponStruct.shield] = "carpentry"

local armourType = {}
armourType[ArmorStruct.clothing] = "tailoring"
armourType[ArmorStruct.light] = "tailoring"
armourType[ArmorStruct.medium] = "armourer"
armourType[ArmorStruct.heavy] = "armourer"
armourType[ArmorStruct.juwellery] = "finesmithing"

local itemPos = {{en="Head", de="Kopf"},{en="Neck", de="Hals"},{en="Breast", de="Brust"},{en="Both Hands", de="Beide Hände"},{en="Left Hand", de="Linke Hand"}, {en="Right Hand", de="Rechte Hand"},
    {en="Left Finger", de="Linker Finger"},{en="Right Finger", de="Rechter Finger"} ,{en="Legs", de="Beine"}, {en="Feet", de="Füße"}, {en="Coat", de="Umhang"},{en="Belt 1", de="Gürtel 1"},
    {en="Belt 2", de="Gürtel 2"},{en="Belt 3", de="Gürtel 3"},{en="Belt 4", de="Gürtel 4"},{en="Belt 5", de="Gürtel 5"},{en="Belt 6", de="Gürtel 6"}}
itemPos[0] = {en="Backpack", de="Rucksack"}

local function getQualityAtCreation(theItem)

    local qualityAtCreation = theItem:getData("qualityAtCreation")


    if qualityAtCreation == "" then
        qualityAtCreation = common.getItemQuality(theItem)
        theItem:setData("qualityAtCreation", qualityAtCreation)
    end

    return tonumber(qualityAtCreation)
end



local function getSkillName(itemId)

    local skillName
    for _, itemRange in pairs(lookat.itemRangeTable) do
        if itemId >= itemRange.start and itemId <= itemRange.stop then
            skillName = itemRange.skill
        end
    end

    return skillName

end

local function findStaticTool(user, skillName)

    local anvil = common.GetItemInArea(user.pos, 172)

    local workbench1 = common.GetItemInArea(user.pos, 724)

    local workbench2 = common.GetItemInArea(user.pos, 725)

    local tailorTable1 = common.GetItemInArea(user.pos, 102)

    local tailorTable2 = common.GetItemInArea(user.pos, 103)

    if anvil then
        if skillName == "armourer" or skillName == "finesmithing" or skillName == "blacksmithing" then
            return anvil
        end
    end

    if skillName == "carpentry" then
        if workbench1 then
            return workbench1
        elseif workbench2 then
            return workbench2
        end
    end

    if skillName == "tailoring" then
        if tailorTable1 then
            return tailorTable1
        elseif tailorTable2 then
            return tailorTable2
        end
    end

    return false

end

local function checkSkillLevel(user, skillName, repairKit)

    local kitCommon = world:getItemStatsFromId(repairKit.id)

    local kitLevel = kitCommon.Level

    local skillLevel = user:getSkill(Character[skillName])

    if skillLevel >= kitLevel then
        return true
    end

    return false

end

local instruments = {Item.lute, Item.harp, Item.drum, Item.panpipe, Item.flute}

local smithedTools = {Item.scissors, Item.saw, Item.hammer, Item.shovel, Item.needle, Item.hatchet, Item.finesmithingHammer, Item.sickle, Item.scythe, Item.chisel, Item.tongs, Item.pan, Item.mortar, Item.pan, Item.rasp, Item.mould, Item.plane, Item.razorBlade, Item.armourersHammer, Item.pickaxe, Item.carvingTools, Item.cruciblePincers}

local woodenTools = {Item.fishingRod, Item.rollingPin, Item.peel, Item.cookingSpoon, Item.flail, Item.candleMould, Item.brickMould, Item.collectionPan, Item.dyeingRod, Item.woodenShovel}

local function itemIsSameCategoryAsRepairKit(currentItem, skillName)

    local armourFound, armour = world:getArmorStruct(currentItem.id)
    local weaponFound, weapon = world:getWeaponStruct(currentItem.id)

    if currentItem.id == Item.sling then --Exception for sling as the only distance weapon that isnt carpentry
        if skillName == "tailoring" then
            return true
        else
            return false
        end
    end

    if currentItem.id == Item.crown or currentItem.id == Item.diadem or currentItem.id == 3556 or currentItem.id == 3557 then -- crowns are added as an exception as they are clothing but do not belong to tailoring
        if skillName == "finesmithing" then
            return true
        else
            return false
        end
    end

    if armourFound then
        local skill = armourType[armour.Type]
        if skill == skillName then
            return true
        end
    elseif weaponFound then
        local skill = weaponType[weapon.WeaponType]
        if skill == skillName then
            return true
        end
    end

    for _, tool in pairs(smithedTools) do
        if tool == currentItem.id then
            if skillName == "blacksmithing" then
                return true
            end
        end
    end

    for _, tool in pairs(woodenTools) do
        if tool == currentItem.id then
            if skillName == "carpentry" then
                return true
            end
        end
    end

    for _, instrument in pairs(instruments) do
        if instrument == currentItem.id then
            if skillName == "carpentry" then
                return true
            end
        end
    end

    if currentItem.id == Item.glassBlowPipe or currentItem.id == Item.copperHandBell then
        if skillName == "finesmithing" then
            return true
        end
    end

    if currentItem.id == Item.leatherBag or currentItem.id == Item.rope then
        if skillName == "tailoring" then
            return true
        end
    end

    if currentItem.id == Item.pipe then
        if skillName == "carpentry" then
            return true
        end
    end

    return false

end

local function itemLevelIsSameOrLowerThanKit(currentItem, repairKit)

    local itemCommon = world:getItemStatsFromId(currentItem.id)

    local kitCommon = world:getItemStatsFromId(repairKit.id)

    local itemLevel = itemCommon.Level

    local kitLevel = kitCommon.Level

    if itemLevel <= kitLevel then
        return true
    end

    return false

end

local function getStoredItemForUser(user)

    local theItem = itemRepairList[user.name].theItem
    local theItemPos = itemRepairList[user.name].theItemPos

    return theItem, theItemPos
end

local function storeItemForUser(user, theItem, theItemPos)

    itemRepairList[user.name] = {}
    itemRepairList[user.name].theItem = theItem
    itemRepairList[user.name].theItemPos = theItemPos

end

local function getChanceToRecoverQuality(user, theItem)

    local chance = 0

    local baseChance = 0.3 -- 30% minimum chance to restore it, later increased depending on how much dex you have

    local originalCreatorChance = 0.3 --If you created it, an additional 30% to the above.



    local crafter = theItem:getData("craftedBy")

    chance = chance + baseChance

    if not common.IsNilOrEmpty(crafter) then
        if crafter == user.name then
            chance = chance + originalCreatorChance
        end
    end

    local dexterity = user:increaseAttrib("dexterity", 0)

    local dexBonus = 1+common.GetAttributeBonusHigh(dexterity)

    chance = chance * dexBonus

    return math.min(1, chance)
end

local function checkForQualityRecovery(user, theItem, quality)

    local qualityAtCreation = getQualityAtCreation(theItem)
    local recovered = false

    if quality < qualityAtCreation then
        local rand = math.random()
        local chance = getChanceToRecoverQuality(user, theItem)
        if rand <= chance then
            quality = quality + 1
            recovered = true
        end
    end

    return quality, recovered
end

local function getRemainingRepairValue(theRepairKit)

    local remainingValue = theRepairKit:getData("remainingValue")

    local commonRepairKit = world:getItemStatsFromId(theRepairKit.id)

    if common.IsNilOrEmpty(remainingValue) then
        remainingValue = commonRepairKit.Worth - (commonRepairKit.Worth/100) -- 99% of the value because an item only has 99 durability points
    else
        remainingValue = tonumber(remainingValue)
    end

    return remainingValue
end

local function getPossibleRepairs(theItem, theRepairKit)

    local remainingValue = getRemainingRepairValue(theRepairKit)

    local commonRepairKit = world:getItemStatsFromId(theRepairKit.id)

    local minimumDecrease = math.ceil(commonRepairKit.Worth/100/maxDurabilityPointsRegainedPerOnePercentKitUsage) --math.ceil in case it results in a decimal number, eg 10 gold value divided by 100 divided by 3 would be 333.333~~ so instead turns into 334

    local decreasePerDurabilityPoint

    if theItem then --Same function used for the lookat, where there is no item to repair selected yet, hence we check for it

        local commonItem = world:getItemStatsFromId(theItem.id)

        decreasePerDurabilityPoint = commonItem.Worth/100 -- 1% of the item value per point of durability repaired, making for 10% of value for one durability grade

        if decreasePerDurabilityPoint < minimumDecrease then
            decreasePerDurabilityPoint = minimumDecrease
        end
    else
        decreasePerDurabilityPoint = minimumDecrease
    end

    local retVal = math.floor(remainingValue/decreasePerDurabilityPoint)

    if remainingValue - retVal*decreasePerDurabilityPoint > 0 then -- Give some leeway to the cost of the last point so we dont end up with repair kits with only 1 point left to give
        retVal = retVal + 1
    end

    if retVal < 1 then
        retVal = 1
    end

    return retVal, decreasePerDurabilityPoint

end

local function getRepairAmount(user, theItem, staticTool, repairCount, theRepairKit)

    local durability = common.getItemDurability(theItem)
    local itemCommon = world:getItemStatsFromId(theItem.id)
    local possibleRepairs = getPossibleRepairs(theItem, theRepairKit)
    local maxRepairs = maxRepairsInField

    if staticTool then
        maxRepairs = maxRepairsAtStaticTool
    end

    if repairCount >= maxRepairs then
        local germanText = itemCommon.German.." ist durch deine Reparaturversuche schon so abgenutzt, dass eine weitere Instandsetzung außerhalb einer Werkstatt nutzlos wären."
        local englishText = "The "..itemCommon.English.." is so worn down by all your repairs that any further repair work while out in the field would surely be pointless."
        if staticTool then
            germanText = itemCommon.German.." ist nun sowas von verfrickelt, dass ein weiterer Reparaturversuch besser von einem Fachmann durchgeführt werden sollte."
            englishText = "You've made too many attempts at repairing the "..itemCommon.English.." to the point where any further repair will require a proportionately skilled craftsman."
        end
        user:inform(germanText, englishText)
        return false
    end

    local durabilityReduction = math.ceil(repairCount/amountOfDurabilityPoints)

    if staticTool then
        durabilityReduction = math.ceil(durabilityReduction/staticToolCountMultiplier)
    end


    local maxDurability = 99 - (durabilityReduction)

    local durabilityIncreasedBy = maxDurability-durability

    if durabilityIncreasedBy > possibleRepairs then
        durabilityIncreasedBy = possibleRepairs
    end

    if maxDurability > durability + possibleRepairs then
        maxDurability = durability + possibleRepairs
    end

    local increasedCount = durabilityIncreasedBy

    if maxDurability <= durability then
        local germanText = itemCommon.German.." wurde zu oft außerhalb einer Werkstatt repariert und kann nicht weiter instand gesetzt werden."
        local englishText = "You've previously done too many repairs to the "..itemCommon.English.." to increase the durability any further than it already is, at least while out in the field."

        if staticTool then
            germanText = itemCommon.German.." wurde zu oft von ungeschickten Händen repariert und um weiter instand gesetzt zu werden sollte ein Fachmann übernehmen."
            englishText = "You've previously done too many repairs to the "..itemCommon.English.." to increase the durability any further than it already is. If you want to increase the durability even further, you'll have to seek out a proportionately skilled craftsman."
        end

        user:inform(germanText, englishText)
        return false
    end

    return maxDurability, increasedCount

end

local SFXGFX = {}
SFXGFX["blacksmithing"] = {SFX = 8, SFXDuration = 27, GFX = 21, GFXDuration = 10}
SFXGFX["armourer"] = {SFX = 8, SFXDuration = 27, GFX = 21, GFXDuration = 10}
SFXGFX["finesmithing"] = {SFX = 17, SFXDuration = 15, GFX = 21, GFXDuration = 10}
SFXGFX["tailoring"] = {SFX = 0, SFXDuration = 0, GFX = 21, GFXDuration = 10}
SFXGFX["carpentry"] = {SFX = 14, SFXDuration = 17, GFX = 21, GFXDuration = 10}

local function getSFXGFXFromSkillName(skillName)

    local GFX = SFXGFX[skillName].GFX
    local SFX = SFXGFX[skillName].SFX
    local GFXDuration = SFXGFX[skillName].GFXDuration
    local SFXDuration = SFXGFX[skillName].SFXDuration

    return GFX, GFXDuration, SFX, SFXDuration

end

local function reduceRepairCount(user, repairCount)

    local dexterity = user:increaseAttrib("dexterity", 0)

    local meanReduction = 5
    meanReduction = meanReduction*(1+common.GetAttributeBonusHigh(dexterity))
    meanReduction = common.Limit(meanReduction, 1, 8.5)
    local rolls = 8
    local reduction = 1 + common.BinomialByMean((meanReduction-1), rolls)

    reduction = maxRepairsAtStaticTool/amountOfDurabilityPoints*reduction

    reduction = common.Limit(reduction, 1, tonumber(repairCount))

    return tonumber(repairCount) - math.ceil(reduction)

end

local function repairItem(user, theRepairKit)

    local skillName = getSkillName(theRepairKit.id)

    local foundStaticTool = findStaticTool(user, skillName)

    local hasRequiredSkill = checkSkillLevel(user, skillName, theRepairKit)

    local theItem, theItemPos = getStoredItemForUser(user)

    local item = user:getItemAt(tonumber(theItemPos))

    local previousDurability = math.floor(common.getItemDurability(theItem))

    local itemIsValid = item ~= nil and item.id == theItem.id

    local commonItem = world:getItemStatsFromId(item.id)

    local commonRepairKit = world:getItemStatsFromId(theRepairKit.id)

    if not itemIsValid then
        return
    end

    local quality = common.getItemQuality(item)

    local repairCountIncrease = 0
    local repairCount = item:getData("repairCount")

    if repairCount == "" then
        repairCount = 0
    end

    local recovered

    if foundStaticTool and hasRequiredSkill then
        quality, recovered = checkForQualityRecovery(user, item, quality)
        repairCount = reduceRepairCount(user, repairCount)
    end

    local newDurability, increasedCount = getRepairAmount(user, item, foundStaticTool, tonumber(repairCount), theRepairKit)

    if not newDurability then
        return
    end

    if not foundStaticTool or not hasRequiredSkill then
        repairCountIncrease = increasedCount
    end

    item:setData("repairCount", repairCount+repairCountIncrease)

    common.setItemQualityDurability(item, tonumber(quality), tonumber(newDurability))

    local minimumDecrease = math.ceil(commonRepairKit.Worth/100/maxDurabilityPointsRegainedPerOnePercentKitUsage) --math.ceil in case it results in a decimal number, eg 10 gold value divided by 100 divided by 3 would be 333.333~~ so instead turns into 334

    local _, decreasePerPointOfDurability = getPossibleRepairs(theItem, theRepairKit)

    local valueRemaining = getRemainingRepairValue(theRepairKit)

    local durabilitiesRepaired = newDurability - previousDurability

    local totalDecrease = durabilitiesRepaired*decreasePerPointOfDurability

    local valueRemainingAfterRepair = valueRemaining - totalDecrease
    local germanText
    local englishText

    if valueRemainingAfterRepair < minimumDecrease then
        world:erase(theRepairKit, 1)
        germanText = "Du reparierst "..commonItem.German.." und verbrauchst dabei "..commonRepairKit.German.."."
        englishText = "You repair the "..commonItem.English..", using the "..commonRepairKit.English.." up."
    else

        germanText = "Du reparierst "..commonItem.German.." mit "..commonRepairKit.German..". Der Reparatursatz wird dir noch weiter von Nutzen sein."
        englishText = "You repair the "..commonItem.English..", using the "..commonRepairKit.English..", which can be used again."

        if theRepairKit.number == 1 then
            theRepairKit:setData("remainingValue", tostring(valueRemainingAfterRepair))
            world:changeItem(theRepairKit)
        else
            world:erase(theRepairKit, 1)

            local itemsFailedToCreate = user:createItem(theRepairKit.id, 1, 999, {["remainingValue"] = tostring(valueRemainingAfterRepair)})

            if itemsFailedToCreate == 1 then
                world:createItemFromId(theRepairKit.id, 1, user.pos, true, 999, {["remainingValue"] = tostring(valueRemainingAfterRepair)})
            end
        end
    end

    if recovered then
        germanText = germanText.." Mit Erfahrung und geschickter Hand gelingt es dir, den Pfusch, den ein anderer angerichtet hat, auszubessern. Die Qualität des Gegenstandes steigt."
        englishText = englishText.." Through your skill and expertise, you manage to recover some of the quality previously lost at the hands of an inferior craftsman."
    end

    user:inform(germanText, englishText)
end

local function isRepairKitInHand(user, theRepairKit)

    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == theRepairKit.id  then
        return true
    elseif rightTool.id == theRepairKit.id then
        return true
    end

    return false
end

local function maxDurationBasedOnCraftsMath(chosenItem)

    local theItem = world:getItemStatsFromId(chosenItem.id)

    local maxDuration = math.max ((30+theItem.Worth-200)*(1500-30)/(133300-200),30)

    if maxDuration > 99 then
        maxDuration = 10 * math.floor(maxDuration/10 + 0.5) -- Round correctly to whole seconds
    end

    return maxDuration
end

local function getDurationBasedOnRestoredDurability(user, repairKit, chosenItem)
    local maxDuration = maxDurationBasedOnCraftsMath(chosenItem)
    local skillName = getSkillName(repairKit.id)
    local staticTool = findStaticTool(user, skillName)
    local repairCount = chosenItem:getData("repairCount")
    local hasRequiredSkill = checkSkillLevel(user, skillName, repairKit)

    if repairCount == "" then
        repairCount = 0
    else
        repairCount = tonumber(repairCount)
    end

    if staticTool and hasRequiredSkill then
        repairCount = reduceRepairCount(user, repairCount)
    end


    local repairAmount = getRepairAmount(user, chosenItem, staticTool, repairCount, repairKit)

    if not repairAmount then
        return false
    end

    local repairPerAmount = maxDuration/99

    local baseRepairTime = repairPerAmount

    local actualRepairTime = math.ceil(baseRepairTime + repairPerAmount*repairAmount)

    return actualRepairTime
end

local function selectItemToRepair(user, repairKit, actionState)
    local chosenItem
    local chosenPos
    local posOnChar
    local skillName = getSkillName(repairKit.id)
    local staticTool = findStaticTool(user, skillName)
    local language = user:getPlayerLanguage()

    if staticTool then
        common.TurnTo(user, staticTool.pos)
    end

    local dialogTitle = common.GetNLS(user, "Reparieren",  "Repair")
    local dialogInfoText = common.GetNLS(user, "Wähle den Gegenstand aus, den du reparieren möchtest:", "Please choose an item you wish to repair:")

    local itemsOnChar = {}
    local itemTooHighLevelButCorrectSkill = false

    for i = 17, 0, -1 do
        local currentItem = user:getItemAt(i)
        local itemExists = currentItem.id > 0
        local itemIsNotAStack = currentItem.number == 1
        local itemHasLoweredDurability = common.getItemDurability(currentItem) ~= 99
        if itemExists and itemIsNotAStack and itemHasLoweredDurability and itemIsSameCategoryAsRepairKit(currentItem, skillName) then
            if itemLevelIsSameOrLowerThanKit(currentItem, repairKit) then
                table.insert(itemsOnChar, {currentItem,itemPos[i],i})
            else
                itemTooHighLevelButCorrectSkill = true
            end
        end
    end
    if #itemsOnChar == 0 then --nothing to repair
        if itemTooHighLevelButCorrectSkill then
            user:inform(
                "Mit diesem Reparatursatz kannst du keinen deiner beschädigten Gegenstände reparieren. Du benötigst einen höherwertigen Reparatursatz.",
                "While there are things for you to repair, there is nothing you can do with your current repair kit. You need a more advanced one.")
            return
        else
            user:inform(
            "Bei dir gibt's nichts zu reparieren. Es können nur ausgerüstete Gegenstände im Inventar oder im Gürtel repariert werden.",
            "You have nothing left to repair. Items you want to repair must be equipped, in your hands or in one of your belt slots.")
            return
        end
    end

    local cbChooseItem = function (dialog)
        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        chosenItem = itemsOnChar[index][1]
        posOnChar = itemsOnChar[index][3]

        local GFX, GFXDuration, SFX, SFXDuration = getSFXGFXFromSkillName(skillName)

        if chosenItem ~= nil then
            local duration = getDurationBasedOnRestoredDurability(user, repairKit, chosenItem)

            if not duration then
                return
            end
            storeItemForUser(user, chosenItem, posOnChar)
            user:startAction(duration, GFX, GFXDuration, SFX, SFXDuration)
        end
    end
    local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem)
    sdItems:setCloseOnMove()
    local itemName
    local itemPosText
    for i=1,#itemsOnChar do
        chosenItem = itemsOnChar[i][1]
        chosenPos = itemsOnChar[i][2]
        itemName = world:getItemName(chosenItem.id, language)
        itemPosText = common.GetNLS(user, chosenPos.de, chosenPos.en)
        sdItems:addOption(chosenItem.id,itemName .. " (" .. itemPosText .. ")")
    end
    user:requestSelectionDialog(sdItems)
end

function M.UseItem(user, repairKit, actionState)

    if not isRepairKitInHand(user, repairKit) then
        user:inform("Du musst den Reparatursatz in den Händen halten.", "You must hold the repair kit in your hands in order to use it.")
        return
    end

    if actionState == Action.none then
        selectItemToRepair(user, repairKit, actionState)
    elseif actionState == Action.success then
        repairItem(user, repairKit)
    elseif actionState == Action.abort then
        user:inform("Du unterbrichst deinen Reparaturversuch.", "You interrupt the ongoing repairs.")
    end

end

function M.actionDisturbed(user, attacker)
    user:inform("Nicht recht sicher hier, such dir lieber einen geschützten Ort zum Reparieren.", "You should find somewhere safe from enemies before attempting to repair something.")
    return true
end

local usedDescriptions = {}
usedDescriptions[Player.german] = {
    "Der Reparatursatz ist kaum noch zu etwas gut.",
    "Der Reparatursatz ist schäbig.",
    "Der Reparatursatz ist alt.",
    "Der Reparatursatz ist sehr abgenutzt.",
    "Der Reparatursatz ist abgenutzt.",
    "Der Reparatursatz ist leicht abgenutzt.",
    "Der Reparatursatz ist gebraucht.",
    "Der Reparatursatz ist fast neu.",
    "Der Reparatursatz ist neu.",
    "Der Reparatursatz ist nagelneu."
}
usedDescriptions[Player.english] = {
    "The kit is worn down, it can barely be used anymore.",
    "The kit is shabby.",
    "The kit is old.",
    "The kit is highly scraped.",
    "The kit is scraped.",
    "The kit is slightly scraped.",
    "The kit is used.",
    "The kit is almost new.",
    "The kit is new.",
    "The kit is brand new."
}

function M.LookAtItem(user, repairKit)

    local baseLookat = lookat.GenerateLookAt(user, repairKit)

    local repairUsesLeft = math.ceil(getPossibleRepairs(nil, repairKit)/10/maxDurabilityPointsRegainedPerOnePercentKitUsage)

    local addedDescription = usedDescriptions[user:getPlayerLanguage()][repairUsesLeft]

    baseLookat.description = baseLookat.description.."\n\n"..addedDescription

    return baseLookat
end

return M
