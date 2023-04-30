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

local M = {}

local common = require("base.common")
local furtunecookies = require("content.furtunecookies")
local alchemy = require("alchemy.base.alchemy")
local herbs = require("alchemy.base.herbs")
local specialeggs = require("content.specialeggs")
local ratCistern = require("content.ratCistern")
local onionball = require("npc.sepp_leaf")

M.foodList = {}

-- COOKED FOOD --
-- Tier 1 Food
M.foodList[Item.breadRoll] = {crafted = true, rareBuff = {constitution = 0}}
M.foodList[Item.sausage] = {crafted = true, rareBuff = {agility = 0}}
M.foodList[Item.ham] = {crafted = true, rareBuff = {dexterity = 0}}
--smoked trout
M.foodList[Item.smokedFish] = {crafted = true, rareBuff = {intelligence = 0}}
--smoked salmon
M.foodList[3916] = {crafted = true, rareBuff = {essence = 0}}
M.foodList[Item.smokedRosefish] = {crafted = true, rareBuff = {perception = 0}}
M.foodList[Item.smokedHorsemackerel] = {crafted = true, rareBuff = {willpower = 0}}
M.foodList[Item.smokedRabbit] = {crafted = true, rareBuff = {strength = 0}}
M.foodList[Item.smokedChicken] = {crafted = true, rareBuff = {constitution = 0}}
M.foodList[Item.grilledSteak] = {crafted = true, rareBuff = {agility = 0}}
M.foodList[Item.grilledLamb] = {crafted = true, rareBuff = {dexterity = 0}}
M.foodList[Item.grilledVenison] = {crafted = true, rareBuff = {intelligence = 0}}
M.foodList[Item.cookies] = {crafted = true, rareBuff = {essence = 0}}
M.foodList[Item.cheese] = {crafted = true, rareBuff = {perception = 1}}
-- Tier 2 Food
M.foodList[Item.mushroomSoup] = {crafted = true, leftOver = 2935, buffs = {agility = 1}}
M.foodList[Item.bakedPotato] = {crafted = true, buffs = {dexterity = 1}}
M.foodList[Item.veggieHash] = {crafted = true, leftOver = 2952, buffs = {essence = 1}}
M.foodList[Item.potatoBread] = {crafted = true, buffs = {strength = 1}}
M.foodList[Item.onionSoup] = {crafted = true, leftOver = 2935, buffs = {intelligence = 1}}
M.foodList[Item.cabbageRoll] = {crafted = true, leftOver = 2952, buffs = {perception = 1}}
M.foodList[Item.troutFilletDish] = {crafted = true, leftOver = 2952, buffs = {willpower = 1}}
M.foodList[Item.sausageOnBread] = {crafted = true, buffs = {constitution = 1}}
-- Tier 3 Food
M.foodList[Item.bananaBread] = {crafted = true, buffs = {willpower = 1, intelligence = 1}}
M.foodList[Item.cabbageStew] = {crafted = true, leftOver = 2935, buffs = {dexterity = 1, agility = 1}}
M.foodList[Item.salmonDish] = {crafted = true, leftOver = 2952, buffs = {strength = 1, constitution = 1}}
M.foodList[Item.blackberryMuffin] = {crafted = true, buffs = {essence = 1, perception = 1}}
M.foodList[Item.mulligan] = {crafted = true, leftOver = 2935, buffs = {willpower = 1, intelligence = 1}}
M.foodList[Item.eggDish] = {crafted = true, leftOver = 2952, buffs = {strength = 1, constitution = 1}}
M.foodList[Item.potatoSoup] = {crafted = true, leftOver = 2935, buffs = {essence = 1, perception = 1}}
M.foodList[Item.meatDish] = {crafted = true, leftOver = 2952, buffs = {dexterity = 1, agility = 1}}
M.foodList[Item.applePie] = {crafted = true, buffs = {willpower = 1, intelligence = 1}}
-- Tier 4 Food
M.foodList[Item.cherryCake] = {crafted = true, buffs = {dexterity = 1, agility = 2}}
M.foodList[Item.eggSalad] = {crafted = true, leftOver = 2935, buffs = {strength = 2, constitution = 1}}
M.foodList[Item.sausagesDish] = {crafted = true, leftOver = 2952, buffs = {essence = 2, perception = 1}}
M.foodList[Item.steakDish] = {crafted = true, leftOver = 2952, buffs = {willpower = 2, intelligence = 1}}
M.foodList[Item.fishSoup] = {crafted = true, leftOver = 2935, buffs = {strength = 1, constitution = 2}}
M.foodList[Item.eggSaladSandwich] = {crafted = true, buffs = {dexterity = 2, agility = 1}}
-- Tier 5 Food
M.foodList[Item.mackerelSalad] = {crafted = true, leftOver = Item.soupBowl, buffs = {essence = 1, willpower = 2, intelligence = 1}}
M.foodList[Item.rosefishDish] = {crafted = true, leftOver = Item.woodenPlate, buffs = {essence = 2, intelligence = 2}}
M.foodList[Item.rosefishStew] = {crafted = true, leftOver = Item.soupBowl, buffs = {perception = 2, agility = 2}}
M.foodList[Item.rabbitDish] = {crafted = true, leftOver = 2952, buffs = {strength = 2, constitution = 2}}
M.foodList[Item.beerSoup] = {crafted = true, leftOver = 2935, buffs = {essence = 1, perception = 2, intelligence = 1}}
M.foodList[Item.strawberryCake] = {crafted = true, buffs = {dexterity = 2, agility = 2}}
M.foodList[Item.lambDish] = {crafted = true, leftOver = 2952, buffs = {essence = 2, perception = 2}}
M.foodList[Item.nutbread] = {crafted = true, buffs = {essence = 1, perception = 1,willpower = 1, intelligence = 1}}
M.foodList[Item.custardPie] = {crafted = true, buffs = {dexterity = 2, agility = 2}}
M.foodList[Item.venisonDish] = {crafted = true, leftOver = 2952, buffs = {strength = 2, constitution = 2}}
M.foodList[Item.goulash] = {crafted = true, leftOver = 2935, buffs = {strength = 1, constitution = 1, agility = 1, dexterity = 1}}
M.foodList[Item.elderberryPie] = {crafted = true, buffs = {willpower = 2, intelligence = 2}}
M.foodList[Item.chickenDish] = {crafted = true, leftOver = 2952, buffs = {essence = 2, perception = 2}}
M.foodList[Item.chickenSoup] = {crafted = true, leftOver = 2935, buffs = {willpower = 2, intelligence = 2}}
-- COOKED FOOD END --

-- constants for free food (everything uncooked); use only those
local valueSmall = 800
local valueMedium = 1200
local valueLarge = 3000

-- FREE FOOD
M.foodList[Item.apple]   = {foodPoints = valueMedium}
M.foodList[Item.trout] = {foodPoints = valueMedium}
M.foodList[Item.banana]   = {foodPoints = valueMedium}
M.foodList[Item.berries]   = {foodPoints = valueMedium}
M.foodList[Item.sandberry]  = {foodPoints = valueSmall}
M.foodList[Item.redElder]  = {foodPoints = valueSmall}
M.foodList[Item.blackberry]  = {foodPoints = valueSmall}
M.foodList[Item.strawberry]  = {foodPoints = valueMedium}
M.foodList[Item.bulbspongeMushroom]  = {foodPoints = valueSmall, poisonPoints = 1000}
M.foodList[Item.toadstool]  = {foodPoints = valueSmall, poisonPoints = 1000}
M.foodList[Item.redHead]  = {foodPoints = valueSmall}
M.foodList[Item.herdersMushroom]  = {foodPoints = valueSmall}
M.foodList[Item.birthMushroom]  = {foodPoints = valueSmall, poisonPoints = 1000}
M.foodList[Item.champignon]  = {foodPoints = valueSmall}
M.foodList[Item.tangerine]  = {foodPoints = valueMedium}
M.foodList[Item.tomato]  = {foodPoints = valueMedium}
M.foodList[Item.onion]  = {foodPoints = valueMedium}
M.foodList[Item.cabbage]  = {foodPoints = valueMedium}
M.foodList[Item.cherries]  = {foodPoints = valueMedium}
M.foodList[Item.pork] = {foodPoints = valueMedium}
M.foodList[Item.salmon] = {foodPoints = valueMedium}
M.foodList[Item.grapes]  = {foodPoints = valueMedium}
M.foodList[Item.deerMeat] = {foodPoints = valueMedium}
M.foodList[Item.rabbitMeat] = {foodPoints = valueMedium}
M.foodList[Item.nuts]  = {foodPoints = valueMedium}
M.foodList[Item.whiteEgg] = {foodPoints = valueSmall}
M.foodList[Item.chickenMeat] = {foodPoints = valueMedium}
M.foodList[Item.orange] = {foodPoints = valueMedium}
M.foodList[Item.horseMackerel] = {foodPoints = valueMedium}
M.foodList[Item.roseFish] = {foodPoints = valueLarge}
M.foodList[Item.carrots] = {foodPoints = valueMedium}
M.foodList[Item.lambMeat] = {foodPoints = valueMedium}
M.foodList[Item.rawSteak] = {foodPoints = valueMedium}
M.foodList[Item.potato] = {foodPoints = valueMedium}

-- get difficulty from the database
for foodId, foodItem in pairs(M.foodList) do
    if foodItem.crafted then
        foodItem.difficulty = world:getItemStatsFromId(foodId).Level
    end
end

local maxDifficulty = 100

local minCraftedFoodvalue = 6000
local maxCraftedFoodvalue = 55000
local difference = maxCraftedFoodvalue - minCraftedFoodvalue
-- calculate food points for crafted food
for _, foodItem in pairs(M.foodList) do
    if foodItem.difficulty ~= nil and foodItem.foodPoints == nil then
      foodItem.foodPoints = minCraftedFoodvalue + difference*(foodItem.difficulty/maxDifficulty)
    end
end

local minCraftedBuffDuration = 1800 -- 1/10 seconds
local maxCraftedBuffDuration = 12000 -- 1/10 seconds
difference = maxCraftedBuffDuration - minCraftedBuffDuration
-- calculate buff duration for crafted food
for _, foodItem in pairs(M.foodList) do
    if foodItem.difficulty ~= nil and foodItem.duration == nil then
        foodItem.duration = math.ceil(minCraftedBuffDuration + difference*(foodItem.difficulty/maxDifficulty))
    end
end

local function poisonedFood(user, sourceItem)
    local poisonPoints = M.foodList[sourceItem.id]["poisonPoints"]
    if poisonPoints then
        user:increaseAttrib("poisonlevel", poisonPoints)
    end
end

local attributesGerman = {}
attributesGerman.strength     = "Stärke"
attributesGerman.constitution   = "Ausdauer"
attributesGerman.agility      = "Schnelligkeit"
attributesGerman.dexterity    = "Geschicklichkeit"
attributesGerman.intelligence = "Intelligenz"
attributesGerman.essence      = "Essenz"
attributesGerman.perception   = "Wahrnehmung"
attributesGerman.willpower    = "Willensstärke"

local function getAmountOfBuffs(buffs)
    local count = 0
    for _ in pairs(buffs) do
        count = count + 1
    end
    return count
end

local function buffsAdding(user, sourceItem)

    local buffs = M.foodList[sourceItem.id].buffs
    local rarity = sourceItem:getData("rareness")

    if not common.IsNilOrEmpty(rarity) then
        rarity = tonumber(rarity)
    else
        rarity = 0
    end

    if not buffs then
        local rareBuff = M.foodList[sourceItem.id].rareBuff
        if rareBuff and rarity >= 3 then
            buffs = rareBuff
        else
            return
        end
    end

    local messageDe = "Durch das Essen erfährst du folgende Veränderungen: "
    local messageEn = "Because of the meal you experience following changes: "

    local foundEffect = user.effects:find(12)
    if foundEffect then
        user.effects:removeEffect(12)
        messageDe = "Die vorherige Nahrungswirkung wird ersetzt. " .. messageDe
        messageEn = "The former diet effect is replaced. " .. messageEn
    end

    local duration = M.foodList[sourceItem.id].duration


    if rarity >= 3 then
        duration = duration*(1 + (rarity-2)/10) -- 10,20% increase of duration based on rarity
    end

    local dietEffect=LongTimeEffect(12, duration)
    local addComma = false

    local rarityBuff = 0
    local attribsRaised = getAmountOfBuffs(buffs)

    local attribsChecked = 0

    local numberOfBuffedStats = 0
    for _, value in pairs(buffs) do
        numberOfBuffedStats = numberOfBuffedStats+1
    end

    for attribute, value in pairs(buffs) do

        if rarity == 3 and rarityBuff == 0 then -- The buff is applied to one stat for rare items

            local rand = math.random(1, attribsRaised-attribsChecked)

            if rand == 1 then
                    value = value + 1
                    rarityBuff = rarityBuff + 1
            end

            attribsChecked = attribsChecked + 1
        end

        if rarity == 4 and rarityBuff < 2 then -- The buff is applied to two stats for unique items or twice for one if there's only one

            local increment = 1

            if numberOfBuffedStats == 1 then
                increment = 2
            end

            value = value + increment
            rarityBuff = rarityBuff + increment

        end

        if addComma then
            messageDe = messageDe .. ", "
            messageEn = messageEn .. ", "
        end

        messageDe = messageDe .. attributesGerman[attribute] .. " +" .. value
        messageEn = messageEn .. attribute .. " +" .. value
        addComma = true

        local oldValue = user:increaseAttrib(attribute, 0)
        local newValue = user:increaseAttrib(attribute, value)

        dietEffect:addValue(attribute, newValue - oldValue)

    end

    user.effects:addEffect(dietEffect)
    user:inform(messageDe, messageEn)
end

local function leftOverCreation(user, leftOverId)
    if leftOverId then
        if math.random(1,20) == 1 then
            user:inform("Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.", Character.highPriority)
        else
            common.CreateItem(user, leftOverId, 1, 333, nil)
        end
    end
end

local function foodLevelInform(user, newFoodLevel, oldFoodLevel)
    local messageDe
    local messageEn

    if newFoodLevel == 60000 or newFoodLevel > 55000 and oldFoodLevel <= 55000 then
        messageDe = "Nur mit Mühe kriegst du noch etwas runter."
        messageEn = "You hardly manage to eat anything else."
    elseif newFoodLevel > 50000 and oldFoodLevel <= 50000 then
        messageDe = "Du bist sehr satt."
        messageEn = "You have had enough."
    elseif newFoodLevel > 40000 and oldFoodLevel <= 40000 then
        messageDe = "Du bist satt."
        messageEn = "You are stuffed."
    elseif newFoodLevel > 30000 and oldFoodLevel <= 30000 then
        messageDe = "Du fühlst dich noch etwas hungrig."
        messageEn = "You still feel a little hungry."
    elseif newFoodLevel > 20000 and oldFoodLevel <= 20000 then
        messageDe = "Du hast noch immer Hunger."
        messageEn = "You are still hungry."
    elseif newFoodLevel > 5000 and oldFoodLevel <= 5000 then
        messageDe = "Dein Magen schmerzt noch immer vor Hunger."
        messageEn = "Your stomach still hurts because of your hunger."
    end

    if messageDe and messageEn then
        user:inform(messageDe,messageEn, Character.mediumPriority)
    end
end

local function mapItem(user, sourceItem)
    if sourceItem.wear == 255 then
        if not ratCistern.checkCarrot(user,sourceItem) then
            user:inform("Das kannst du nicht essen.", "You can't eat that.", Character.highPriority)
        end
        return true
    end
end

local function alchemyCheck(user, sourceItem, ltstate)
    local isPlant = alchemy.getPlantSubstance(sourceItem.id, user)
    local cauldron = alchemy.GetCauldronInfront(user, sourceItem)
    if (cauldron ~= nil) and isPlant then
        herbs.UseItem(user, sourceItem, ltstate)
        return true
    end
    return false
end

local function specialEgg(user, sourceItem)
    if specialeggs.checkSpecialEgg(sourceItem, user) then
        return true
    end
    return false
end

local function holyGrapes(user, sourceItem)
    if sourceItem:getData("nameEn") == "Holy Grapes" then
        user:increaseAttrib("foodlevel", 2000)
        user:inform("Die Trauben haben einen vollen Geschmack und füllen deinen ganzen Mund mit ihrem süßlichen Saft. Köstlich! Doch sie umspielen nicht nur deine Geschmacksknospen, sondern auch deinen Geist. Du bist leicht angetrunken.","The grapes have a rich, sweet taste that lingers on your tongue as their flavourful juice fills your entire mouth. Delicious! However, they not only play with your taste buds but also with your mind. You feel slightly drunk.")
        world:erase(sourceItem, 1)
        return true
    end
end

local function thievesPoisonQuest(user, sourceItem)

    if sourceItem:getData("nameEn") == "Thieves Dinner" then
        if user:getQuestProgress(543) == 7 then
            if user:countItemAt("all", 1323) == 0 then
                user:inform("Du benötigst das Gift, um es unter das Essen zu mischen.", "You need the poison to tamper with the food.")
            else
                user:inform("Du hast den Inhalt des Fläschchens unbemerkt unter das Essen gemischt. Kehre zu Brigette zurück, um deine Belohnung abzuholen.", "You successfully sneak the contents of the vial Brigette gave you into the food, return to her for a reward.")
                user:setQuestProgress(543, 8)
                user:eraseItem(1323, 1)
            end
        end
        return true
    end

    return false
end

local function fortuneCookie(sourceItem, user)
    if sourceItem.id == 453 then
        if math.random(1, 100) == 1 then
            local deText, enText = furtunecookies.cookie()
            user:inform("Du findest ein Stück Papier in dem Keks: \""..deText.."\"", "You find a piece of paper inside the cookie: \""..enText.."\"")
        end
    end
end

local function customInform(sourceItem, user)
    local customInformEN = sourceItem:getData("customInformEN")
    local customInformDE = sourceItem:getData("customInformDE")
    if customInformEN ~= "" and customInformDE ~= "" then
        common.InformNLS( user, customInformDE, customInformEN)
    end
end
function M.MoveItemAfterMove( user, SourceItem, TargetItem )
    if onionball.moveOnion(user, SourceItem, TargetItem) then
        return false
    end
    return true
end


function M.UseItem(user, sourceItem, ltstate)
    if onionball.useOnion(user, sourceItem) then
        return
    end

    if holyGrapes(user, sourceItem) then
        return
    elseif specialEgg(user, sourceItem) then
        return
    elseif alchemyCheck(user, sourceItem, ltstate) then
        return
    elseif thievesPoisonQuest(user, sourceItem) then
        return
    elseif mapItem(user, sourceItem) then
        return

    end

    fortuneCookie(sourceItem, user)

    local oldFoodLevel = user:increaseAttrib("foodlevel", 0)

    local foodIncrease = M.foodList[sourceItem.id].foodPoints

    local rarity = sourceItem:getData("rareness")

    if rarity ~= "" then
        rarity = tonumber(rarity)
        foodIncrease = foodIncrease*(1 + (rarity-1)/10) --This results in a 10%, 20% and 30% food value increase for the uncommon, rare and unique food rarities
    end

    local newFoodLevel = user:increaseAttrib("foodlevel", foodIncrease)

    foodLevelInform(user, newFoodLevel, oldFoodLevel)

    poisonedFood(user, sourceItem)

    buffsAdding(user, sourceItem)

    customInform(sourceItem, user)

    world:erase(sourceItem, 1)

    leftOverCreation(user, M.foodList[sourceItem.id].leftOver)
end

return M
