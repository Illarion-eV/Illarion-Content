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

-- UPDATE items SET itm_script='item.food' WHERE itm_id IN (15,49,73,80,81,142,143,147,151,158,159,160,161,162,163,191,199,200,201,302,303,306,307,353,354,355,388,453,454,455,552,553,554,555,556,557,559,1207,2276,2277,2278,2456,2459,2493,2922,2923,2934,2940,3051,3711,3712,3716,3715,3709,3710,3713,3714,3723,3914,3915,3916);

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
-- bread roll
M.foodList[191] = {crafted = true}
-- Sausage
M.foodList[3051] = {crafted = true}
-- Ham
M.foodList[306] = {crafted = true}
-- Smoked trout
M.foodList[455] = {crafted = true}
-- Smoked salmon
M.foodList[3916] = {crafted = true}
-- Smoked rose fish
M.foodList[3915] = {crafted = true}
-- Smoked horse mackerel
M.foodList[3914] = {crafted = true}
-- Smoked rabbit
M.foodList[3710] = {crafted = true}
-- Smoked chicken
M.foodList[3709] = {crafted = true}
-- Grilled Steak
M.foodList[3606] = {crafted = true}
-- Grilled Lamb
M.foodList[3713] = {crafted = true}
-- Grilled Venison
M.foodList[3714] = {crafted = true}
-- Cookies
M.foodList[453] = {crafted = true}
-- Cheese
M.foodList[3573] = {crafted = true}
-- Tier 2 Food
-- Mushroom Soup
M.foodList[2456] = {crafted = true, leftOver = 2935, buffs = {agility = 1}}
-- Baked Potato
M.foodList[3568] = {crafted = true, buffs = {dexterity = 1}}
-- Veggie Hash
M.foodList[3716] = {crafted = true, leftOver = 2952, buffs = {essence = 1}}
-- Bread
M.foodList[49] = {crafted = true, buffs = {strength = 1}}
-- Onion Soup
M.foodList[2923] = {crafted = true, leftOver = 2935, buffs = {intelligence = 1}}
-- Mystery Meat
M.foodList[3715] = {crafted = true, leftOver = 2952, buffs = {perception = 1}}
-- Trout fillet Dish
M.foodList[2459] = {crafted = true, leftOver = 2952, buffs = {willpower = 1}}
-- Sausage on bread
M.foodList[3631] = {crafted = true, buffs = {constitution = 1}}
-- Tier 3 Food
-- Banana Bread
M.foodList[3609] = {crafted = true, buffs = {willpower = 1, intelligence = 1}}
--Cabbage Stew
M.foodList[2278] = {crafted = true, leftOver = 2935, buffs = {dexterity = 1, agility = 1}}
-- Salmon Dish
M.foodList[556] = {crafted = true, leftOver = 2952, buffs = {strength = 1, constitution = 1}}
-- Blackberry Muffin
M.foodList[454] = {crafted = true, buffs = {essence = 1, perception = 1}}
-- Mulligan
M.foodList[2276] = {crafted = true, leftOver = 2935, buffs = {willpower = 1, intelligence = 1}}
-- Egg Dish
M.foodList[1154] = {crafted = true, leftOver = 2952, buffs = {strength = 1, constitution = 1}}
-- Potato Soup
M.foodList[3569] = {crafted = true, leftOver = 2935, buffs = {essence = 1, perception = 1}}
-- Meat Dish
M.foodList[2277] = {crafted = true, leftOver = 2952, buffs = {dexterity = 1, agility = 1}}
-- Apple Pie
M.foodList[353] = {crafted = true, buffs = {willpower = 1, intelligence = 1}}
-- Tier 4 Food
-- Cherry Cake
M.foodList[303] = {crafted = true, buffs = {dexterity = 1, agility = 2}}
--Egg Salad
M.foodList[3570] = {crafted = true, leftOver = 2935, buffs = {strength = 2, constitution = 1}}
--Sausages Dish
M.foodList[2922] = {crafted = true, leftOver = 2952, buffs = {essence = 2, perception = 1}}
-- Steak dish
M.foodList[557] = {crafted = true, leftOver = 2952, buffs = {willpower = 2, intelligence = 1}}
-- Fish Soup
M.foodList[3572] = {crafted = true, leftOver = 2935, buffs = {strength = 1, constitution = 2}}
-- Egg Salad Sandwich
M.foodList[3571] = {crafted = true, buffs = {dexterity = 2, agility = 1}}
-- Tier 5 Food
--Rabbit Dish
M.foodList[555] = {crafted = true, leftOver = 2952, buffs = {strength = 2, constitution = 2}}
-- Beer Soup
M.foodList[3712] = {crafted = true, leftOver = 2935, buffs = {essence = 1, perception = 2, intelligence = 1}}
-- Strawberry Cake
M.foodList[354] = {crafted = true, buffs = {dexterity = 2, agility = 2}}
-- Lamb Dish
M.foodList[559] = {crafted = true, leftOver = 2952, buffs = {essence = 2, perception = 2}}
-- nut Bread
M.foodList[3723] = {crafted = true, buffs = {essence = 1, perception = 1,willpower = 1, intelligence = 1}}
-- Custard Pie
M.foodList[1153] = {crafted = true, buffs = {dexterity = 2, agility = 2}}
-- Venison Dish
M.foodList[554] = {crafted = true, leftOver = 2952, buffs = {strength = 2, constitution = 2}}
-- Goulash
M.foodList[3711] = {crafted = true, leftOver = 2935, buffs = {strength = 1, constitution = 1, agility = 1, dexterity = 1}}
-- Elderberry Pie
M.foodList[3610] = {crafted = true, buffs = {willpower = 2, intelligence = 2}}
--Chicken Dish
M.foodList[1155] = {crafted = true, leftOver = 2952, buffs = {essence = 2, perception = 2}}
-- Chicken Soup
M.foodList[1152] = {crafted = true, leftOver = 2935, buffs = {willpower = 2, intelligence = 2}}
-- COOKED FOOD END --

-- constants for free food (everything uncooked); use only those
local valueSmall = 800
local valueMedium = 1200
local valueLarge = 3000

-- FREE FOOD
-- apple:
M.foodList[15]   = {foodPoints = valueMedium}
-- trout
M.foodList[73] = {foodPoints = valueMedium}
-- banana:
M.foodList[80]   = {foodPoints = valueMedium}
-- berries:
M.foodList[81]   = {foodPoints = valueMedium}
-- sand berry:
M.foodList[142]  = {foodPoints = valueSmall}
-- red elder:
M.foodList[143]  = {foodPoints = valueSmall}
-- black berry:
M.foodList[147]  = {foodPoints = valueSmall}
-- strawberries:
M.foodList[151]  = {foodPoints = valueMedium}
-- bulbsponge:
M.foodList[158]  = {foodPoints = valueSmall, poisonPoints = 1000}
-- toadstool:
M.foodList[159]  = {foodPoints = valueSmall, poisonPoints = 1000}
-- redhead:
M.foodList[160]  = {foodPoints = valueSmall}
-- herders mushroom:
M.foodList[161]  = {foodPoints = valueSmall}
-- birth mushroom:
M.foodList[162]  = {foodPoints = valueSmall, poisonPoints = 1000}
-- champignon:
M.foodList[163]  = {foodPoints = valueSmall}
-- tangerine:
M.foodList[199]  = {foodPoints = valueMedium}
-- tomato:
M.foodList[200]  = {foodPoints = valueMedium}
-- onion:
M.foodList[201]  = {foodPoints = valueMedium}
-- Cabbage:
M.foodList[290]  = {foodPoints = valueMedium}
-- cherry:
M.foodList[302]  = {foodPoints = valueMedium}
-- pork
M.foodList[307] = {foodPoints = valueMedium}
-- salmon
M.foodList[355] = {foodPoints = valueMedium}
-- grapes:
M.foodList[388]  = {foodPoints = valueMedium}
-- deer meat
M.foodList[552] = {foodPoints = valueMedium}
-- rabbit
M.foodList[553] = {foodPoints = valueMedium}
-- nuts:
M.foodList[759]  = {foodPoints = valueMedium}
-- brown egg:
M.foodList[1149] = {foodPoints = valueSmall}
-- white egg:
M.foodList[1150] = {foodPoints = valueSmall}
-- chicken
M.foodList[1151] = {foodPoints = valueMedium}
-- orange:
M.foodList[1207] = {foodPoints = valueMedium}
-- horse mackerel
M.foodList[1209] = {foodPoints = valueMedium}
-- rose fish
M.foodList[1210] = {foodPoints = valueLarge}
-- carrots:
M.foodList[2493] = {foodPoints = valueMedium}
-- lamb
M.foodList[2934] = {foodPoints = valueMedium}
-- raw steak
M.foodList[2940] = {foodPoints = valueMedium}
-- Potato
M.foodList[3567] = {foodPoints = valueMedium}

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

local function buffsAdding(user, sourceItem)

    local buffs = M.foodList[sourceItem.id].buffs

    if not buffs then
        return
    end

    local messageDe = "Durch das Essen erfährst du folgende Veränderungen: "
    local messageEn = "Because of the meal you experience following changes: "

    local foundEffect = user.effects:find(12)
    if foundEffect then
        user.effects:removeEffect(12)
        messageDe = "Die vorherige Nahrungswirkung wird ersetzt. " .. messageDe
        messageEn = "The former diet effect is replaced. " .. messageEn
    end

    local dietEffect=LongTimeEffect(12, M.foodList[sourceItem.id].duration)
    local addComma = false
    for attribute, value in pairs(buffs) do
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
    local newFoodLevel = user:increaseAttrib("foodlevel", M.foodList[sourceItem.id].foodPoints)

    foodLevelInform(user, newFoodLevel, oldFoodLevel)

    poisonedFood(user, sourceItem)

    buffsAdding(user, sourceItem)

    customInform(sourceItem, user)

    world:erase(sourceItem, 1)

    leftOverCreation(user, M.foodList[sourceItem.id].leftOver)
end

return M
