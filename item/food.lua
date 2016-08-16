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

-- UPDATE items SET itm_script='item.food' WHERE itm_id IN (15,49,73,80,81,142,143,147,151,158,159,160,161,162,163,191,199,200,201,302,303,306,307,353,354,355,388,453,454,455,552,553,554,555,556,557,559,1207,2276,2277,2278,2456,2459,2493,2922,2923,2934,2940,3051,3711,3712,3716,3715,3709,3710,3713,3714,3723);

local M = {}

local common = require("base.common")
local furtunecookies = require("content.furtunecookies")
local alchemy = require("alchemy.base.alchemy")
local herbs = require("alchemy.base.herbs")
local specialeggs = require("content.specialeggs")

local foodList = {}

-- COOKED FOOD --
-- Tier 1 Food
-- bread roll
foodList[191] = {difficulty = 0}
-- Sausage
foodList[3051] = {difficulty = 0}
-- Ham
foodList[307] = {difficulty = 0}
-- Smoked fish
foodList[455] = {difficulty = 0}
-- Smoked rabbit
foodList[3710] = {difficulty = 0}
-- Smoked chicken
foodList[3709] = {difficulty = 0}
-- Grilled Steak
foodList[3606] = {difficulty = 5}
-- Grilled Lamb
foodList[3613] = {difficulty = 5}
-- Grilled Venison
foodList[3614] = {difficulty = 5}
-- Cookies
foodList[453] = {difficulty = 5}
-- Cheese
foodList[3573] = {difficulty = 5}
-- Tier 2 Food
-- Mushroom Soup
foodList[2456] = {difficulty = 10, leftOver = 2935, buffs = {agility = 1}}
-- Baked Potato
foodList[3568] = {difficulty = 10, buffs = {dexterity = 1}}
-- Veggie Hash
foodList[3716] = {difficulty = 10, leftOver = 2952, buffs = {essence = 1}}
-- Bread
foodList[49] = {difficulty = 20, buffs = {strength = 1}}
-- Onion Soup
foodList[2923] = {difficulty = 20, leftOver = 2935, buffs = {intelligence = 1}}
-- Mystery Meat
foodList[3715] = {difficulty = 20, leftOver = 2952, buffs = {perception = 1}}
-- Trout fillet Dish
foodList[2459] = {difficulty = 25, leftOver = 2952, buffs = {willpower = 1}}
-- Sausage on bread
foodList[3631] = {difficulty = 25, buffs = {durability = 1}}
-- Tier 3 Food
-- Banana Bread
foodList[3609] = {difficulty = 30, buffs = {willpower = 1, intelligence = 1}}
--Cabbage Stew
foodList[2278] = {difficulty = 30, leftOver = 2935, buffs = {dexterity = 1, agility = 1}}
-- Salmon Dish
foodList[556] = {difficulty = 30, leftOver = 2952, buffs = {strength = 1, durability = 1}}
-- Blackberry Muffin
foodList[454] = {difficulty = 40, buffs = {essence = 1, perception = 1}}
-- Mulligan
foodList[2276] = {difficulty = 40, leftOver = 2935, buffs = {willpower = 1, intelligence = 1}}
-- Egg Dish
foodList[1154] = {difficulty = 40, leftOver = 2952, buffs = {strength = 1, durability = 1}}
-- Potato Soup
foodList[3569] = {difficulty = 50, leftOver = 2935, buffs = {essence = 1, perception = 1}}
-- Meat Dish
foodList[2277] = {difficulty = 50, leftOver = 2952, buffs = {dexterity = 1, agility = 1}}
-- Apple Pie
foodList[353] = {difficulty = 50, buffs = {willpower = 1, intelligence = 1}}
-- Tier 4 Food
-- Cherry Cake
foodList[303] = {difficulty = 60, buffs = {dexterity = 1, agility = 2}}
--Egg Salad
foodList[3570] = {difficulty = 60, leftOver = 2935, buffs = {strength = 2, durability = 1}}
--Sausages Dish
foodList[2922] = {difficulty = 60, leftOver = 2952, buffs = {essence = 2, perception = 1}}
-- Steak dish
foodList[557] = {difficulty = 70, leftOver = 2952, buffs = {willpower = 2, intelligence = 1}}
-- Fish Soup
foodList[3572] = {difficulty = 70, leftOver = 2935, buffs = {strength = 1, durability = 2}}
-- Egg Salad Sandwich
foodList[3571] = {difficulty = 70, buffs = {dexterity = 2, agility = 1}}
-- Tier 5 Food
--Rabbit Dish
foodList[555] = {difficulty = 80, leftOver = 2952, buffs = {strength = 2, durability = 2}}
-- Beer Soup
foodList[3712] = {difficulty = 80, leftOver = 2935, buffs = {essence = 1, perception = 2, intelligence = 1}}
-- Strawberry Cake
foodList[354] = {difficulty = 80, buffs = {dexterity = 2, agility = 2}}
-- Lamb Dish
foodList[559] = {difficulty = 85, leftOver = 2952, buffs = {essence = 2, perception = 2}}
-- nut Bread
foodList[3723] = {difficulty = 85, buffs = {essence = 1, perception = 1,willpower = 1, intelligence = 1}}
-- Custard Pie
foodList[1153] = {difficulty = 90, buffs = {dexterity = 2, agility = 2}}
-- Venison Dish
foodList[554] = {difficulty = 90, leftOver = 2952, buffs = {strength = 2, durability = 2}}
-- Goulash
foodList[3711] = {difficulty = 90, leftOver = 2935, buffs = {strength = 1, durability = 1, agility = 1, dexterity = 1}}
-- Elderberry Pie
foodList[3610] = {difficulty = 100, buffs = {willpower = 2, intelligence = 2}}
--Chicken Dish
foodList[1155] = {difficulty = 100, leftOver = 2952, buffs = {essence = 2, perception = 2}}
-- Chicken Soup
foodList[1152] = {difficulty = 100, leftOver = 2935, buffs = {willpower = 2, intelligence = 2}}
-- COOKED FOOD END --

-- constants for free food (everything uncooked); use only those
local valueSmall = 800
local valueMedium = 1200
local valueLarge = 3000

-- FREE FOOD
-- apple:
foodList[15]   = {foodPoints = VALUE_MEDIUM}
-- trout
foodList[73] = {foodPoints = VALUE_MEDIUM}
-- banana:
foodList[80]   = {foodPoints = VALUE_MEDIUM}
-- berries:
foodList[81]   = {foodPoints = VALUE_MEDIUM}
-- sand berry:
foodList[142]  = {foodPoints = VALUE_SMALL}
-- red elder:
foodList[143]  = {foodPoints = VALUE_SMALL}
-- black berry:
foodList[147]  = {foodPoints = VALUE_SMALL}
-- strawberries:
foodList[151]  = {foodPoints = VALUE_MEDIUM}
-- bulbsponge:
foodList[158]  = {foodPoints = VALUE_SMALL, poisonPoints = 1000}
-- toadstool:
foodList[159]  = {foodPoints = VALUE_SMALL, poisonPoints = 1000}
-- redhead:
foodList[160]  = {foodPoints = VALUE_SMALL}
-- herders mushroom:
foodList[161]  = {foodPoints = VALUE_SMALL}
-- birth mushroom:
foodList[162]  = {foodPoints = VALUE_SMALL, poisonPoints = 1000}
-- champignon:
foodList[163]  = {foodPoints = VALUE_SMALL}
-- tangerine:
foodList[199]  = {foodPoints = VALUE_MEDIUM}
-- tomato:
foodList[200]  = {foodPoints = VALUE_MEDIUM}
-- onion:
foodList[201]  = {foodPoints = VALUE_MEDIUM}
-- Cabbage:
foodList[290]  = {foodPoints = VALUE_MEDIUM}
-- cherry:
foodList[302]  = {foodPoints = VALUE_MEDIUM}
-- pork
foodList[307] = {foodPoints = VALUE_MEDIUM}
-- salmon
foodList[355] = {foodPoints = VALUE_MEDIUM}
-- grapes:
foodList[388]  = {foodPoints = VALUE_MEDIUM}
-- deer meat
foodList[552] = {foodPoints = VALUE_MEDIUM}
-- rabbit
foodList[553] = {foodPoints = VALUE_MEDIUM}
-- nuts:
foodList[759]  = {foodPoints = VALUE_MEDIUM}
-- brown egg:
foodList[1149] = {foodPoints = VALUE_SMALL}
-- white egg:
foodList[1150] = {foodPoints = VALUE_SMALL}
-- chicken
foodList[1151] = {foodPoints = VALUE_MEDIUM}
-- orange:
foodList[1207] = {foodPoints = VALUE_MEDIUM}
-- horse mackerel
foodList[1209] = {foodPoints = VALUE_MEDIUM}
-- rose fish
foodList[1210] = {foodPoints = VALUE_LARGE}
-- carrots:
foodList[2493] = {foodPoints = VALUE_MEDIUM}
-- lamb
foodList[2934] = {foodPoints = VALUE_MEDIUM}
-- raw steak
foodList[2940] = {foodPoints = VALUE_MEDIUM}
-- Potato
foodList[3567] = {foodPoints = VALUE_MEDIUM}

local maxDifficulty = 100

local minCraftedFoodvalue = 6000
local maxCraftedFoodvalue = 55000
local function calculateFoodPoints()
    local diff = maxCraftedFoodvalue - minCraftedFoodvalue
    for _,foodItem in pairs(foodList) do
        if foodItem.difficulty ~= nil and foodItem.foodPoints == nil then
          foodItem.foodPoints = minCraftedFoodvalue + diff*(foodItem.difficulty/maxDifficulty)
        end
    end
end
calculateFoodPoints()

local minCraftedBuffDuration = 180
local maxCraftedBuffDuration = 1200
local function calculateBuffDuration()
    local diff = maxCraftedBuffDuration - minCraftedBuffDuration
    for _,foodItem in pairs(foodList) do
        if foodItem.difficulty ~= nil and foodItem.foodPoints == nil then
          foodItem.foodPoints = math.ceil(minCraftedBuffDuration + diff*(foodItem.difficulty/maxDifficulty))
        end
    end
end
calculateBuffDuration()

local function poisonedFood(User,SourceItem)
    local poisonPoints = foodList[SourceItem.id]["poisonPoints"]
    if poisonPoints then
        User:increaseAttrib("poisonlevel",poisonPoints)
    end
end

local attributesGerman = {}
attributesGerman.strength     = "Stärke"
attributesGerman.durability   = "Ausdauer"
attributesGerman.agility      = "Schnelligkeit"
attributesGerman.dexterity    = "Geschicklichkeit"
attributesGerman.intelligence = "Intelligenz"
attributesGerman.essence      = "Essenz"
attributesGerman.perception   = "Wahrnehmung"
attributesGerman.willpower    = "Willensstärke"

local function buffsAdding(User,SourceItem)

    local buffs = foodList[SourceItem.id].buffs

    if not buffs then
        return
    end
    
    local messageDe = "Durch das Essen erfährst du folgende Veränderungen: "
    local messageEn = "Because of the meal you experience following changes: "
    
    local foundEffect,dietEffect=User.effects:find(12)
    if foundEffect then
        User.effects:removeEffect(12)
        messageDe = "Die vorherige Nahrungswirkung wird ersetzt." .. messageDe
        messageEn = "The former diet effect is replaced." .. messageEn
    end
    
    local commaCheck = false
    for attribute, value in pairs(buffs) do
        if commaCheck then
            messageDe = messageDe .. ", "
            messageEn = messsageEn .. ", "
        end
        messageDe = messageDe .. ", " .. attribute .. " +" .. value
        messageEn = messageEn .. ", " .. attribute .. " +" .. value
        
        User:increaseAttrib(attribute,value)
    end

    User:inform(messageDe,messageEn)
    
    --Debug from here. LongTimeEffect requires two ints.
    local dietEffect=LongTimeEffect(12,foodList[SourceItem.id].buffs)
    dietEffect:addValue("foodId",SourceItem.id)
    User.effects:addEffect(dietEffect)
    
end

local function leftOverCreation(User,leftOverId)
    if leftOverId then
        if Random.uniform(1,20) == 1 then
            User:inform("Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.",Character.highPriority)
        else
            common.CreateItem(User, leftOverId, 1, 333, nil)
        end
    end
end

local function foodLevelInform(User,newFoodLevel,oldFoodLevel)
    if newFoodLevel > 55000 then
        User:inform("Nur mit Mühe kannst du dir noch etwas hinunter zwingen.","You hardly manage to eat something more.")
    elseif newFoodLevel > 50000 and newFoodLevel-oldFoodLevel <= 50000 then
        User:inform("Du bist sehr satt.","You have had enough.")
    elseif newFoodLevel > 40000 and newFoodLevel-oldFoodLevel <= 40000 then
        User:inform("Du bist satt.","You are stuffed.")
    elseif newFoodLevel > 30000 and newFoodLevel-oldFoodLevel <= 30000 then
        User:inform("Du fühlst dich noch etwas hungrig.","You still feel a little hungry.")
    elseif newFoodLevel > 20000 and newFoodLevel-oldFoodLevel <= 20000 then
        User:inform("Du hast noch immer Hunger.","You are still hungry.")
    elseif  newFoodLevel > 5000 and newFoodLevel-oldFoodLevel <= 5000 then
        User:inform("Dein Magen schmerzt noch immer vor Hunger.","Your stomach still hurts because of your hunger.")
    end
end

local function mapItem(User, SourceItem)
    if SourceItem.wear == 255 then
        User:inform("Das kannst du nicht essen.","You can't eat that.",Character.highPriority)
        return true
    end
end

local function alchemyCheck(User, SourceItem, ltstate)
    local isPlant, ignoreIt = alchemy.getPlantSubstance(SourceItem.id, User)
    local cauldron = alchemy.GetCauldronInfront(User,SourceItem)
    if (cauldron ~= nil) and isPlant then
        herbs.UseItem(User, SourceItem, ltstate)
        return true
    end
    return false
end

local function specialEgg(User, SourceItem)
    if specialeggs.checkSpecialEgg(SourceItem, User) then
        return true
    end
    return false
end

local function holyGrapes(user, sourceItem)
    user:increaseAttrib("foodlevel",2000)
    user:inform("Die Trauben haben einen vollen Geschmack und füllen deinen ganzen Mund mit ihrem süßlichen Saft. Köstlich! Doch sie umspielen nicht nur deine Geschmacksknospen, sondern auch deinen Geist. Du bist leicht angetrunken.","The grapes have a rich, sweet taste that lingers on your tongue as their flavorful juice fills your entire mouth. Delicious! However, they not only play with your taste buds but also with your mind. You feel slightly drunk.")
    world:erase(sourceItem,1)
end

function M.UseItem(User,SourceItem,ltstate)

    if SourceItem:getData("nameEn") == "Holy Grapes" then
        holyGrapes(User, SourceItem)
        return
    end
    if specialEgg(User,SourceItem) then
        return
    end
    if alchemyCheck(User,SourceItem,ltstate) then
        return
    end
    if SourceItem:getData("nameEn") == "Thieves Dinner" and User:getQuestProgress(543) == 7 and User:countItemAt("all", 1323) == 0 then
        User:inform("Du benötigst das Gift, um es unter das Essen zu mischen.","You need the poison to tamper with the food.")
    elseif SourceItem:getData("nameEn") == "Thieves Dinner" and User:getQuestProgress(543) == 7 and User:countItemAt("all", 1323) >= 0 then
        User:eraseItem(1323, 1)
        User:inform("Du hast den Inhalt des Fläschchens unbemerkt unter das Essen gemischt. Kehre zu Brigette zurück, um deine Belohnung abzuholen.","You successfully sneak the contents of the vial Brigette gave you into the food, return to her for a reward.")
        User:setQuestProgress(543, 8) --  You poisoned the food.
        return
    end
    if mapItem(User,SourceItem) then
        return
    end
    
      -- fortune cookies
    if (SourceItem.id == 453) then
        if (math.random(1,100)==1) then
            local deText, enText = furtunecookies.cookie();
            common.InformNLS( User,
            "Du findest ein Stück Papier in dem Keks: \""..deText.."\"",
            "You find a piece of paper inside the cookie: \""..enText.."\"");
        end
    end
    local oldFoodLevel = User:increaseAttrib("foodlevel",0)
    local newFoodLevel = User:increaseAttrib("foodlevel",foodList[SourceItem.id].foodPoints)

    foodLevelInform(User,newFoodLevel,oldFoodLevel)

    poisonedFood(User,SourceItem)

    buffsAdding(User,SourceItem)

    world:erase(SourceItem,1)

    leftOverCreation(User,foodList[SourceItem.id["leftOver"]])
end

return M