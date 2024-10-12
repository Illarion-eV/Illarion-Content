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

-- UPDATE items SET itm_script='item.drinks' WHERE itm_id IN (2189, 2188, 2187, 2186, 2059, 2058, 2057, 2056, 1910, 1909, 1907, 1906, 1861, 2502, 1841, 1842, 1843, 1844, 1853, 1854, 1855, 1856, 1857, 1859, 1860, 517, 1315, 1316, 1318,1319,1320,1321,1322,1323,3720,3721,3722);

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

-- [item ID], {food value, remnant item}
M.drinkList = {}

M.drinkList[Item.cupWithWater] = {100, Item.woodenCup}
M.drinkList[Item.cupWithWine] = {800, Item.woodenCup}
M.drinkList[Item.cupWithMead] = {1000, Item.woodenCup}
M.drinkList[Item.cupWithCider] = {800, Item.woodenCup}
M.drinkList[Item.cupWithMilk] = {400, Item.woodenCup}
M.drinkList[Item.cupWithFairywine] = {1000, Item.woodenCup}

M.drinkList[Item.clayCupWithWater] = {100, Item.clayCup}
M.drinkList[Item.clayCupWithWine] = {800, Item.clayCup}
M.drinkList[Item.clayCupWithMead] = {1000, Item.clayCup}
M.drinkList[Item.clayCupWithCider] = {800, Item.clayCup}
M.drinkList[Item.clayCupWithMilk] = {400, Item.clayCup}
M.drinkList[Item.clayCupWithFairywine] = {1000, Item.clayCup}

M.drinkList[Item.ceramicCupWithWater] = {100, Item.ceramicCup}
M.drinkList[Item.ceramicCupWithWine] = {800, Item.ceramicCup}
M.drinkList[Item.ceramicCupWithMead] = {1000, Item.ceramicCup}
M.drinkList[Item.ceramicCupWithCider] = {800, Item.ceramicCup}
M.drinkList[Item.ceramicCupWithMilk] = {400, Item.ceramicCup}
M.drinkList[Item.ceramicCupWithFairyWine] = {1000, Item.ceramicCup}

M.drinkList[Item.ironGobletWithWater] = {100, Item.ironGoblet}
M.drinkList[Item.ironGobletWithWine] = {800, Item.ironGoblet}
M.drinkList[Item.ironGobletWithMead] = {1000, Item.ironGoblet}
M.drinkList[Item.ironGobletWithCider] = {800, Item.ironGoblet}
M.drinkList[Item.ironGobletWithMilk] = {400, Item.ironGoblet}
M.drinkList[Item.ironGobletWithFairywine] = {1000, Item.ironGoblet}

M.drinkList[Item.copperGobletWithWater] = {100, Item.copperGoblet}
M.drinkList[Item.copperGobletWithWine] = {800, Item.copperGoblet}
M.drinkList[Item.copperGobletWithMead] = {1000, Item.copperGoblet}
M.drinkList[Item.copperGobletWithCider] = {800, Item.copperGoblet}
M.drinkList[Item.copperGobletWithMilk] = {400, Item.copperGoblet}
M.drinkList[Item.copperGobletWithFairywine] = {1000, Item.copperGoblet}

M.drinkList[Item.silverGobletWithWater] = {100, Item.silverGoblet}
M.drinkList[Item.silverGobletWithWine] = {800, Item.silverGoblet}
M.drinkList[Item.silverGobletWithMead] = {1000, Item.silverGoblet}
M.drinkList[Item.silverGobletWithCider] = {800, Item.silverGoblet}
M.drinkList[Item.silverGobletglassWithMilk] = {400, Item.silverGoblet}
M.drinkList[Item.silverGobletWithFairywine] = {1000, Item.silverGoblet}

M.drinkList[Item.goldenGobletWithWater] = {100, Item.goldenGoblet}
M.drinkList[Item.goldenGobletWithWine] = {800, Item.goldenGoblet}
M.drinkList[Item.goldenGobletWithMead] = {1000, Item.goldenGoblet}
M.drinkList[Item.goldenGobletWithCider] = {800, Item.goldenGoblet}
M.drinkList[Item.goldGobletWithMilk] = {400, Item.goldenGoblet}
M.drinkList[Item.goldGobletWithFairywine] = {1000, Item.goldenGoblet}

M.drinkList[Item.glassWithWater] = {50, Item.glass}
M.drinkList[Item.glassWithWine] = {400, Item.glass}
M.drinkList[Item.glassWithMead] = {500, Item.glass}
M.drinkList[Item.glassWithCider] = {400, Item.glass}
M.drinkList[Item.glassWithMilk] = {400, Item.glass}
M.drinkList[Item.glassWithFairywine] = {1000, Item.glass}

M.drinkList[Item.beerMug] = {200, 1907}
M.drinkList[1907] = {200, 1910} -- nearly full beer mug
M.drinkList[1910] = {200, 1906} -- half full beer mug
M.drinkList[1906] = {200, Item.glassMug} -- nearly empty beer mug

M.drinkList[Item.clayBeerMugFull] = {400, Item.clayBeerMugHalf}
M.drinkList[Item.clayBeerMugHalf] = {400, Item.clayMug}

M.drinkList[Item.bottleOfBlackberryJuice] = {500, Item.emptyJuiceBottle}
M.drinkList[Item.bottleOfStrawberryJuice] = {500, Item.emptyJuiceBottle}
M.drinkList[Item.blueberryJuice] = {500, Item.emptyJuiceBottle}
M.drinkList[Item.cloudberryJuice] = {500, Item.emptyJuiceBottle}
M.drinkList[Item.raspberryJuice] = {500, Item.emptyJuiceBottle}
M.drinkList[Item.deerberryJuice] = {500, Item.emptyJuiceBottle}
M.drinkList[Item.elderberryJuice] = {500, Item.emptyJuiceBottle}

M.drinkList[Item.bottleOfCabbageJuice] = {500, Item.vegetableJuiceBottle}
M.drinkList[Item.bottleOfCarrotJuice] = {500, Item.vegetableJuiceBottle}
M.drinkList[Item.bellpepperJuice] = {500, Item.vegetableJuiceBottle}
M.drinkList[Item.cucumberJuice] = {500, Item.vegetableJuiceBottle}
M.drinkList[Item.pumpkinJuice] = {500, Item.vegetableJuiceBottle}
M.drinkList[Item.tomatoJuice] = {500, Item.vegetableJuiceBottle}

M.drinkList[Item.bottleOfGrapeJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.bottleOfOrangeJuice] =  {500, Item.fruitJuiceBottle}
M.drinkList[Item.bottleOfTangerineJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.bottleOfBananaJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.appleJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.cherryJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.pearJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.mangoJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.peachJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.plumJuice] = {500, Item.fruitJuiceBottle}
M.drinkList[Item.pineappleJuice] = {500, Item.fruitJuiceBottle}


M.drinkList[Item.clayShotGlassWithAbsinthe] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithBearSlayer] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithBerryBooze] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithCherrySchnapps] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithElvenWine] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithMulledWine] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithOrangeSchnapps] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithStoneFace] = {800, Item.clayShotGlass}
M.drinkList[Item.clayShotGlassWithRum] = {800, Item.clayShotGlass}

M.drinkList[Item.ceramicShotGlassWithAbsinthe] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithBearSlayer] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithBerryBooze] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithCherrySchnapps] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithElvenWine] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithMulledWine] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithOrangeSchnapps] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithStoneFace] = {800, Item.ceramicShotGlass}
M.drinkList[Item.ceramicShotGlassWithRum] = {800, Item.ceramicShotGlass}

M.drinkList[Item.ironShotGlassWithAbsinthe] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithBearSlayer] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithBerryBooze] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithCherrySchnapps] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithElvenWine] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithMulledWine] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithOrangeSchnapps] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithStoneFace] = {800, Item.ironShotGlass}
M.drinkList[Item.ironShotGlassWithRum] = {800, Item.ironShotGlass}

M.drinkList[Item.copperShotGlassWithAbsinthe] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithBearSlayer] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithBerryBooze] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithCherrySchnapps] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithElvenWine] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithMulledWine] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithOrangeSchnapps] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithStoneFace] = {800, Item.copperShotGlass}
M.drinkList[Item.copperShotGlassWithRum] = {800, Item.copperShotGlass}


M.drinkList[Item.silverShotGlassWithAbsinthe] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithBearSlayer] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithBerryBooze] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithCherrySchnapps] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithElvenWine] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithMulledWine] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithOrangeSchnapps] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithStoneFace] = {800, Item.silverShotGlass}
M.drinkList[Item.silverShotGlassWithRum] = {800, Item.silverShotGlass}


M.drinkList[Item.goldShotGlassWithAbsinthe] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithBearSlayer] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithBerryBooze] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithCherrySchnapps] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithElvenWine] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithMulledWine] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithOrangeSchnapps] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithStoneFace] = {800, Item.goldShotGlass}
M.drinkList[Item.goldShotGlassWithRum] = {800, Item.goldShotGlass}

M.drinkList[Item.shotGlassWithAbsinthe] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithBearSlayer] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithBerryBooze] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithCherrySchnapps] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithElvenWine] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithMulledWine] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithOrangeSchnapps] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithStoneFace] = {800, Item.shotGlass}
M.drinkList[Item.shotGlassWithRum] = {800, Item.shotGlass}

M.drinkList[Item.clayTeaCupDruid] = {1000, Item.clayTeaCup}
M.drinkList[Item.clayTeaCupFirNeedle] = {1000, Item.clayTeaCup}
M.drinkList[Item.clayTeaCupGreen] = {1000, Item.clayTeaCup}
M.drinkList[Item.clayTeaCupVirginWeed] = {1000, Item.clayTeaCup}

M.drinkList[Item.ceramicTeaCupDruid] = {1000, Item.ceramicTeaCup}
M.drinkList[Item.ceramicTeaCupFirNeedle] = {1000, Item.ceramicTeaCup}
M.drinkList[Item.ceramicTeaCupGreen] = {1000, Item.ceramicTeaCup}
M.drinkList[Item.ceramicTeaCupVirginWeed] = {1000, Item.ceramicTeaCup}

M.drinkList[Item.ironTeaCupDruid] = {1000, Item.ironTeaCup}
M.drinkList[Item.ironTeaCupFirNeedle] = {1000, Item.ironTeaCup}
M.drinkList[Item.ironTeaCupGreen] = {1000, Item.ironTeaCup}
M.drinkList[Item.ironTeaCupVirginWeed] = {1000, Item.ironTeaCup}

M.drinkList[Item.copperTeaCupDruid] = {1000, Item.copperTeaCup}
M.drinkList[Item.copperTeaCupFirNeedle] = {1000, Item.copperTeaCup}
M.drinkList[Item.copperTeaCupGreen] = {1000, Item.copperTeaCup}
M.drinkList[Item.copperTeaCupVirginWeed] = {1000, Item.copperTeaCup}

M.drinkList[Item.silverTeaCupDruid] = {1000, Item.silverTeaCup}
M.drinkList[Item.silverTeaCupFirNeedle] = {1000, Item.silverTeaCup}
M.drinkList[Item.silverTeaCupGreen] = {1000, Item.silverTeaCup}
M.drinkList[Item.silverTeaCupVirginWeed] = {1000, Item.silverTeaCup}

M.drinkList[Item.goldTeaCupDruid] = {1000, Item.goldTeaCup}
M.drinkList[Item.goldTeaCupFirNeedle] = {1000, Item.goldTeaCup}
M.drinkList[Item.goldTeaCupGreen] = {1000, Item.goldTeaCup}
M.drinkList[Item.goldTeaCupVirginWeed] = {1000, Item.goldTeaCup}

M.drinkList[Item.glassTeaCupDruid] = {1000, Item.glassTeaCup}
M.drinkList[Item.glassTeaCupFirNeedle] = {1000, Item.glassTeaCup}
M.drinkList[Item.glassTeaCupGreen] = {1000, Item.glassTeaCup}
M.drinkList[Item.glassTeaCupVirginWeed] = {1000, Item.glassTeaCup}


function M.UseItem(user, SourceItem)

    if user.attackmode then
        common.InformNLS( user, "Du würdest alles verschütten.", "You'd spill everything.")
        return
    end

    -- item should not be static
    if SourceItem.wear == 255 then
        common.HighInformNLS(user,
            "Das kannst du nicht trinken.",
            "You can't drink that.")
        return
    end

    -- Prevent the drinking of quest item  -  Path of the Fox by Brigette Russ
    if SourceItem:getData("descriptionDe") == "Geheimnisvoller Violett Flasche" or SourceItem:getData("descriptionEn") == "Mysterious Violet Bottle" then
         common.HighInformNLS(user,
            "Das kannst du nicht trinken.",
            "You can't drink that.")
        return
    end

    local drink = M.drinkList[SourceItem.id]

    if not drink then
        user:inform("Unknown drinking Item: ID"..SourceItem.id.." Please Report this to a developer.")
        return
    end

    local customInformEN = SourceItem:getData("customInformEN")
    local customInformDE = SourceItem:getData("customInformDE")
    if customInformEN ~= "" and customInformDE ~= "" then
        common.InformNLS( user, customInformDE, customInformEN)
    end

    local foodLevel = user:increaseAttrib("foodlevel", 0) + drink[1]
    world:makeSound(12, user.pos) -- drink sound

    if math.random(50) <= 1 then
        common.InformNLS( user, "Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.")
    else
        local dataCopy = {descriptionDe=SourceItem:getData("descriptionDe"), descriptionEn=SourceItem:getData("descriptionEn")}
        common.CreateItem(user, drink[2], 1, 333, dataCopy) -- create the remnant item
    end
    world:erase(SourceItem, 1)

    if foodLevel > 40000 then
        common.InformNLS( user, "Du hast genug getrunken.", "You have had enough to drink.")
    elseif foodLevel > 40000 then
        common.InformNLS( user, "Du schaffst es nicht noch mehr zu trinken.", "You cannot drink anything else.")
        foodLevel = foodLevel - drink[1]
    end

    if user:increaseAttrib("foodlevel", 0) ~= foodLevel then
        user:increaseAttrib("foodlevel",-(user:increaseAttrib("foodlevel",0) - foodLevel))
    end
end


function M.LookAtItem(user, Item)

    local food = M.drinkList[Item.id]

    if food == nil then
        user:inform("unknown drink item ID"..Item.id)
    end

    return lookat.GenerateLookAt(user, Item, lookat.NONE)
end

return M
