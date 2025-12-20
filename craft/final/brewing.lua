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
local crafts = require("craft.base.crafts")

local M = {}

local brewing = crafts.Craft:new{
                     craftEN = "Brewing",
                     craftDE = "Brauen",
                     handTool = 227,
                     leadSkill = Character.brewing,
                     sfx = 10,
                     sfxDuration = 15,
                   }

brewing:addTool(339) -- barrel
brewing:addTool(1410) -- barrel
brewing:addTool(1411) -- barrel

local product
local catId

catId = brewing:addCategory("Soft Liquors", "Leichter Alkohol")

product = brewing:addProduct(catId, Item.bottleOfCider, 1)
product:addIngredient(Item.largeEmptyBottle, 1)
product:addIngredient(Item.apple, 5)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfMead, 1)
product:addIngredient(Item.largeEmptyBottle, 1)
product:addIngredient(Item.beeHoney, 6)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfBeer, 1)
product:addIngredient(Item.largeEmptyBottle, 1)
product:addIngredient(Item.hop, 6)
product:addIngredient(Item.grain, 7)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfWine, 1)
product:addIngredient(Item.largeEmptyBottle, 1)
product:addIngredient(Item.grapes, 5)
product:addIngredient(Item.bucketOfWater, 1)

catId = brewing:addCategory("Fruit Juices", "Fruchtsäfte")

product = brewing:addProduct(catId, Item.bottleOfTangerineJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.tangerine, 5)

product = brewing:addProduct(catId, Item.appleJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.apple, 5)
product:addIngredient(Item.beeHoney, 2)

product = brewing:addProduct(catId, Item.bottleOfBananaJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.banana, 9)
product:addIngredient(Item.bottleOfMilk, 1)

product = brewing:addProduct(catId, Item.cherryJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.cherries, 10)
product:addIngredient(Item.beeHoney, 3)

product = brewing:addProduct(catId, Item.pearJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.pear, 11)
product:addIngredient(Item.beeHoney, 4)

product = brewing:addProduct(catId, Item.peachJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.peach, 11)
product:addIngredient(Item.beeHoney, 5)

product = brewing:addProduct(catId, Item.mangoJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.mango, 8)
product:addIngredient(Item.beeHoney, 3)

product = brewing:addProduct(catId, Item.plumJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.plum, 8)
product:addIngredient(Item.beeHoney, 4)

product = brewing:addProduct(catId, Item.bottleOfOrangeJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.orange, 4)
product:addIngredient(Item.sugarcane, 2)

product = brewing:addProduct(catId, Item.bottleOfGrapeJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.grapes, 5)
product:addIngredient(Item.sugarcane, 2)

product = brewing:addProduct(catId, Item.pineappleJuice, 1)
product:addIngredient(Item.fruitJuiceBottle, 1)
product:addIngredient(Item.pineapple, 5)
product:addIngredient(Item.sugarcane, 2)

catId = brewing:addCategory("Berry Juices", "Beerensäfte")

product = brewing:addProduct(catId, Item.blueberryJuice, 1)
product:addIngredient(Item.emptyJuiceBottle, 1)
product:addIngredient(Item.blueberry, 3)

product = brewing:addProduct(catId, Item.bottleOfStrawberryJuice, 1)
product:addIngredient(Item.emptyJuiceBottle, 1)
product:addIngredient(Item.strawberry, 3)
product:addIngredient(Item.beeHoney, 2)

product = brewing:addProduct(catId, Item.bottleOfBlackberryJuice, 1)
product:addIngredient(Item.emptyJuiceBottle, 1)
product:addIngredient(Item.blackberry, 4)
product:addIngredient(Item.beeHoney, 3)

product = brewing:addProduct(catId, Item.elderberryJuice, 1)
product:addIngredient(Item.emptyJuiceBottle, 1)
product:addIngredient(Item.redElder, 3)
product:addIngredient(Item.beeHoney, 2)

product = brewing:addProduct(catId, Item.raspberryJuice, 1)
product:addIngredient(Item.emptyJuiceBottle, 1)
product:addIngredient(Item.raspberry, 3)
product:addIngredient(Item.beeHoney, 3)

product = brewing:addProduct(catId, Item.cloudberryJuice, 1)
product:addIngredient(Item.emptyJuiceBottle, 1)
product:addIngredient(Item.cloudberry, 3)
product:addIngredient(Item.beeHoney, 4)

product = brewing:addProduct(catId, Item.deerberryJuice, 1)
product:addIngredient(Item.emptyJuiceBottle, 1)
product:addIngredient(Item.berries, 3)
product:addIngredient(Item.sugarcane, 1)

catId = brewing:addCategory("Vegetable Juices", "Gemüsesäfte")

product = brewing:addProduct(catId, Item.tomatoJuice, 1)
product:addIngredient(Item.vegetableJuiceBottle, 1)
product:addIngredient(Item.tomato, 5)
product:addIngredient(Item.beeHoney, 2)

product = brewing:addProduct(catId, Item.cucumberJuice, 1)
product:addIngredient(Item.vegetableJuiceBottle, 1)
product:addIngredient(Item.cucumber, 5)
product:addIngredient(Item.apple, 3)
product:addIngredient(Item.tangerine, 3)

product = brewing:addProduct(catId, Item.bottleOfCarrotJuice, 1)
product:addIngredient(Item.vegetableJuiceBottle, 1)
product:addIngredient(Item.carrots, 4)
product:addIngredient(Item.orange, 2)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfCabbageJuice, 1)
product:addIngredient(Item.vegetableJuiceBottle, 1)
product:addIngredient(Item.cabbage, 3)
product:addIngredient(Item.apple, 3)
product:addIngredient(Item.cucumber, 2)
product:addIngredient(Item.orange, 2)

product = brewing:addProduct(catId, Item.bellpepperJuice, 1)
product:addIngredient(Item.vegetableJuiceBottle, 1)
product:addIngredient(Item.bellpepper, 4)
product:addIngredient(Item.carrots, 2)
product:addIngredient(Item.orange, 1)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.pumpkinJuice, 1)
product:addIngredient(Item.vegetableJuiceBottle, 1)
product:addIngredient(Item.pumpkin, 2)
product:addIngredient(Item.sugarcane, 3)
product:addIngredient(Item.apple, 10)
product:addIngredient(Item.bucketOfWater, 1)

catId = brewing:addCategory("Teas", "Tee")

product = brewing:addProduct(catId, Item.bottleOfFirNeedleTea, 1)
product:addIngredient(Item.teaBottle, 1)
product:addIngredient(Item.firTreeSprout, 3)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfGreenTea, 1)
product:addIngredient(Item.teaBottle, 1)
product:addIngredient(Item.heathFlower, 2)
product:addIngredient(Item.yellowWeed, 2)
product:addIngredient(Item.tangerine, 1)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfVirginsWeedTea, 1)
product:addIngredient(Item.teaBottle, 1)
product:addIngredient(Item.virginsWeed, 3)
product:addIngredient(Item.sugarcane, 1)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfDruidsTea, 1)
product:addIngredient(Item.teaBottle, 1)
product:addIngredient(Item.waterBlossom, 1)
product:addIngredient(Item.steppeFern, 1)
product:addIngredient(Item.footLeaf, 1)
product:addIngredient(Item.sugarcane, 1)
product:addIngredient(Item.bucketOfWater, 1)

catId = brewing:addCategory("Hard Liquors", "Stark alkoholische Getränke")

product = brewing:addProduct(catId, Item.bottleOfCherrySchnapps, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.cherries, 7)
product:addIngredient(Item.beeHoney, 3)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfStoneFace, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.plum, 3)
product:addIngredient(Item.apple, 5)
product:addIngredient(Item.beeHoney, 3)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfBerryBooze, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.blueberry, 3)
product:addIngredient(Item.strawberry, 3)
product:addIngredient(Item.blackberry, 3)
product:addIngredient(Item.beeHoney, 1)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfOrangeSchnapps, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.orange, 3)
product:addIngredient(Item.beeHoney, 4)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfMulledWine, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.grapes, 4)
product:addIngredient(Item.beeHoney, 4)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfBearSlayer, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.toadstool, 3)
product:addIngredient(Item.apple, 5)
product:addIngredient(Item.beeHoney, 4)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfRum, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.sugarcane, 6)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfAbsinthe, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.sandberry, 2)
product:addIngredient(Item.heathFlower, 2)
product:addIngredient(Item.sugarcane, 1)
product:addIngredient(Item.bucketOfWater, 1)

product = brewing:addProduct(catId, Item.bottleOfElvenWine, 1)
product:addIngredient(Item.emptyLiquorBottle, 1)
product:addIngredient(Item.elfCaps, 1)
product:addIngredient(Item.pineapple, 1)
product:addIngredient(Item.nuts, 4)
product:addIngredient(Item.sugarcane, 2)
product:addIngredient(Item.bucketOfWater, 1)

M.brewing = brewing
return M
