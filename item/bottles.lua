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

local M = {}

local function evilrockEntrance(user, sourceItem, actionState)

    local evilrockBucket = common.GetItemInArea(user.pos, Item.bucket, 1, false, {key = "evilrockBucket", value = "true"})

    if evilrockBucket == nil or sourceItem.id ~= Item.bottleOfWater then
        return false
    end

    common.TurnTo(user, evilrockBucket.pos) -- turn if necessary

    if ( actionState == Action.none ) then
        user:startAction( 20, 21, 5, 10, 25)
        user:talk(Character.say, "#me beginnt den Eimer zu befüllen.", "#me starts to fill the bucket.")
        return true
    end

    if ( actionState == Action.abort ) then
        common.InformNLS(user, "Du brichst deine Arbeit ab.", "You abort your work.")
        return true
    end

    world:swap(evilrockBucket, 52, 999)
    sourceItem.id = Item.largeEmptyBottle
    world:changeItem(sourceItem)

    for x = 992, 996 do
        local entranceTrap = world:getItemOnField(position(x,195,0))
        if entranceTrap.id == 3097 then
            world:erase(entranceTrap,entranceTrap.number)
            world:makeSound(4,user.pos)
            world:makeSound(5,user.pos)
        end
    end
        common.InformNLS(user, "Du hörst ein seltsames Geräusch von unten.", "You hear a strange noise from below.")
        return true

end

local bottles = {
    {
        full = {
            Item.bottleOfWater, Item.glassServingJugWithWater, Item.clayServingJugWithWater, Item.ceramicServingJugWithWater,
            Item.ironServingJugWithWater, Item.copperServingJugWithWater, Item.silverServingJugWithWater,
            Item.goldServingJugWithWater},
        half = {
            Item.bottleOfWaterHalf,Item.glassServingJugWithWaterHalf},
        quarter = {Item.bottleOfWaterQuarter, Item.glassServingJugWithWaterQuarter},
        empty = {
            Item.largeEmptyBottle, Item.glassServingJug, Item.clayServingJug, Item.ceramicServingJug,
            Item.ironServingJug, Item.copperServingJug, Item.silverServingJug,
            Item.goldServingJug},
        vessels = {
            {empty = Item.clayCup, filled = Item.clayCupWithWater, amount = 1},
            {empty = Item.ceramicCup, filled = Item.ceramicCupWithWater, amount = 1},
            {empty = Item.woodenCup, filled = Item.cupWithWater, amount = 1},
            {empty = Item.ironGoblet, filled = Item.ironGobletWithWater, amount = 1},
            {empty = Item.copperGoblet, filled = Item.copperGobletWithWater, amount = 1},
            {empty = Item.silverGoblet, filled = Item.silverGobletWithWater, amount = 1},
            {empty = Item.goldenGoblet, filled = Item.goldenGobletWithWater, amount = 1},
            {empty = Item.glass, filled = Item.glassWithWater, amount = 1},
            {empty = Item.clayServingJug, filled = Item.clayServingJugWithWater, amount = 1, max = 10},
            {empty = Item.ceramicServingJug, filled = Item.ceramicServingJugWithWater, amount = 1, max = 10},
            {empty = Item.ironServingJug, filled = Item.ironServingJugWithWater, amount = 1, max = 10},
            {empty = Item.copperServingJug, filled = Item.copperServingJugWithWater, amount = 1, max = 10},
            {empty = Item.silverServingJug, filled = Item.silverServingJugWithWater, amount = 1, max = 10},
            {empty = Item.goldServingJug, filled = Item.goldServingJugWithWater, amount = 1, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithWater, amount = 7, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithWaterHalf, amount = 4, max = 6},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithWaterQuarter, amount = 1, max = 3}},
        type = "jug"},

    {
        full = {
            Item.bottleOfWine, Item.glassServingJugWithWine, Item.clayServingJugWithWine, Item.ceramicServingJugWithWine,
            Item.ironServingJugWithWine, Item.copperServingJugWithWine, Item.silverServingJugWithWine,
            Item.goldServingJugWithWine},
        half = {
            Item.bottleOfWineHalf,Item.glassServingJugWithWineHalf},
        quarter = {Item.bottleOfWineQuarter, Item.glassServingJugWithWineQuarter},
        empty = {
            Item.largeEmptyBottle, Item.glassServingJug, Item.clayServingJug, Item.ceramicServingJug,
            Item.ironServingJug, Item.copperServingJug, Item.silverServingJug,
            Item.goldServingJug},
        vessels = {
            {empty = Item.clayCup, filled = Item.clayCupWithWine, amount = 1},
            {empty = Item.ceramicCup, filled = Item.ceramicCupWithWine, amount = 1},
            {empty = Item.woodenCup, filled = Item.cupWithWine, amount = 1},
            {empty = Item.ironGoblet, filled = Item.ironGobletWithWine, amount = 1},
            {empty = Item.copperGoblet, filled = Item.copperGobletWithWine, amount = 1},
            {empty = Item.silverGoblet, filled = Item.silverGobletWithWine, amount = 1},
            {empty = Item.goldenGoblet, filled = Item.goldenGobletWithWine, amount = 1},
            {empty = Item.glass, filled = Item.glassWithWine, amount = 1},
            {empty = Item.clayServingJug, filled = Item.clayServingJugWithWine, amount = 1, max = 10},
            {empty = Item.ceramicServingJug, filled = Item.ceramicServingJugWithWine, amount = 1, max = 10},
            {empty = Item.ironServingJug, filled = Item.ironServingJugWithWine, amount = 1, max = 10},
            {empty = Item.copperServingJug, filled = Item.copperServingJugWithWine, amount = 1, max = 10},
            {empty = Item.silverServingJug, filled = Item.silverServingJugWithWine, amount = 1, max = 10},
            {empty = Item.goldServingJug, filled = Item.goldServingJugWithWine, amount = 1, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithWine, amount = 7, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithWineHalf, amount = 4, max = 6},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithWineQuarter, amount = 1, max = 3}},
        type = "jug"},

    {
        full = {
            Item.bottleOfCider, Item.glassServingJugWithCider, Item.clayServingJugWithCider, Item.ceramicServingJugWithCider,
            Item.ironServingJugWithCider, Item.copperServingJugWithCider, Item.silverServingJugWithCider,
            Item.goldServingJugWithCider},
        half = {
            Item.bottleOfCiderHalf,Item.glassServingJugWithCiderHalf},
        quarter = {Item.bottleOfCiderQuarter, Item.glassServingJugWithCiderQuarter},
        empty = {
            Item.largeEmptyBottle, Item.glassServingJug, Item.clayServingJug, Item.ceramicServingJug,
            Item.ironServingJug, Item.copperServingJug, Item.silverServingJug,
            Item.goldServingJug},
        vessels = {
            {empty = Item.clayCup, filled = Item.clayCupWithCider, amount = 1},
            {empty = Item.ceramicCup, filled = Item.ceramicCupWithCider, amount = 1},
            {empty = Item.woodenCup, filled = Item.cupWithCider, amount = 1},
            {empty = Item.ironGoblet, filled = Item.ironGobletWithCider, amount = 1},
            {empty = Item.copperGoblet, filled = Item.copperGobletWithCider, amount = 1},
            {empty = Item.silverGoblet, filled = Item.silverGobletWithCider, amount = 1},
            {empty = Item.goldenGoblet, filled = Item.goldenGobletWithCider, amount = 1},
            {empty = Item.glass, filled = Item.glassWithCider, amount = 1},
            {empty = Item.clayServingJug, filled = Item.clayServingJugWithCider, amount = 1, max = 10},
            {empty = Item.ceramicServingJug, filled = Item.ceramicServingJugWithCider, amount = 1, max = 10},
            {empty = Item.ironServingJug, filled = Item.ironServingJugWithCider, amount = 1, max = 10},
            {empty = Item.copperServingJug, filled = Item.copperServingJugWithCider, amount = 1, max = 10},
            {empty = Item.silverServingJug, filled = Item.silverServingJugWithCider, amount = 1, max = 10},
            {empty = Item.goldServingJug, filled = Item.goldServingJugWithCider, amount = 1, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithCider, amount = 7, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithCiderHalf, amount = 4, max = 6},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithCiderQuarter, amount = 1, max = 3}},
        type = "jug"},
    {
        full = {
            Item.bottleOfMead, Item.glassServingJugWithMead, Item.clayServingJugWithMead, Item.ceramicServingJugWithMead,
            Item.ironServingJugWithMead, Item.copperServingJugWithMead, Item.silverServingJugWithMead,
            Item.goldServingJugWithMead},
        half = {
            Item.bottleOfMeadHalf,Item.glassServingJugWithMeadHalf},
        quarter = {Item.bottleOfMeadQuarter, Item.glassServingJugWithMeadQuarter},
        empty = {
            Item.largeEmptyBottle, Item.glassServingJug, Item.clayServingJug, Item.ceramicServingJug,
            Item.ironServingJug, Item.copperServingJug, Item.silverServingJug,
            Item.goldServingJug},
        vessels = {
            {empty = Item.clayCup, filled = Item.clayCupWithMead, amount = 1},
            {empty = Item.ceramicCup, filled = Item.ceramicCupWithMead, amount = 1},
            {empty = Item.woodenCup, filled = Item.cupWithMead, amount = 1},
            {empty = Item.ironGoblet, filled = Item.ironGobletWithMead, amount = 1},
            {empty = Item.copperGoblet, filled = Item.copperGobletWithMead, amount = 1},
            {empty = Item.silverGoblet, filled = Item.silverGobletWithMead, amount = 1},
            {empty = Item.goldenGoblet, filled = Item.goldenGobletWithMead, amount = 1},
            {empty = Item.glass, filled = Item.glassWithMead, amount = 1},
            {empty = Item.clayServingJug, filled = Item.clayServingJugWithMead, amount = 1, max = 10},
            {empty = Item.ceramicServingJug, filled = Item.ceramicServingJugWithMead, amount = 1, max = 10},
            {empty = Item.ironServingJug, filled = Item.ironServingJugWithMead, amount = 1, max = 10},
            {empty = Item.copperServingJug, filled = Item.copperServingJugWithMead, amount = 1, max = 10},
            {empty = Item.silverServingJug, filled = Item.silverServingJugWithMead, amount = 1, max = 10},
            {empty = Item.goldServingJug, filled = Item.goldServingJugWithMead, amount = 1, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithMead, amount = 7, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithMeadHalf, amount = 4, max = 6},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithMeadQuarter, amount = 1, max = 3}},
        type = "jug"},
    {
        full = {
            Item.bottleOfFairyWine, Item.glassServingJugWithFairyWine, Item.clayServingJugWithFairyWine, Item.ceramicServingJugWithFairyWine,
            Item.ironServingJugWithFairyWine, Item.copperServingJugWithFairyWine, Item.silverServingJugWithFairyWine,
            Item.goldServingJugWithFairyWine},
        half = {
            Item.bottleOfFairyWineHalf,Item.glassServingJugWithFairyWineHalf},
        quarter = {Item.bottleOfFairyWineQuarter, Item.glassServingJugWithFairyWineQuarter},
        empty = {
            Item.largeEmptyBottle, Item.glassServingJug, Item.clayServingJug, Item.ceramicServingJug,
            Item.ironServingJug, Item.copperServingJug, Item.silverServingJug,
            Item.goldServingJug},
        vessels = {
            {empty = Item.clayCup, filled = Item.clayCupWithFairywine, amount = 1},
            {empty = Item.ceramicCup, filled = Item.ceramicCupWithFairyWine, amount = 1},
            {empty = Item.woodenCup, filled = Item.cupWithFairywine, amount = 1},
            {empty = Item.ironGoblet, filled = Item.ironGobletWithFairywine, amount = 1},
            {empty = Item.copperGoblet, filled = Item.copperGobletWithFairywine, amount = 1},
            {empty = Item.silverGoblet, filled = Item.silverGobletWithFairywine, amount = 1},
            {empty = Item.goldenGoblet, filled = Item.goldGobletWithFairywine, amount = 1},
            {empty = Item.glass, filled = Item.glassWithFairywine, amount = 1},
            {empty = Item.clayServingJug, filled = Item.clayServingJugWithFairyWine, amount = 1, max = 10},
            {empty = Item.ceramicServingJug, filled = Item.ceramicServingJugWithFairyWine, amount = 1, max = 10},
            {empty = Item.ironServingJug, filled = Item.ironServingJugWithFairyWine, amount = 1, max = 10},
            {empty = Item.copperServingJug, filled = Item.copperServingJugWithFairyWine, amount = 1, max = 10},
            {empty = Item.silverServingJug, filled = Item.silverServingJugWithFairyWine, amount = 1, max = 10},
            {empty = Item.goldServingJug, filled = Item.goldServingJugWithFairyWine, amount = 1, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithFairyWine, amount = 7, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithFairyWineHalf, amount = 4, max = 6},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithFairyWineQuarter, amount = 1, max = 3}},
        type = "jug"},
    {
        full = {
            Item.bottleOfBeer, Item.glassServingJugWithBeer, Item.clayServingJugWithBeer, Item.ceramicServingJugWithBeer,
            Item.ironServingJugWithBeer, Item.copperServingJugWithBeer, Item.silverServingJugWithBeer,
            Item.goldServingJugWithBeer},
        half = {
            Item.bottleOfBeerHalf,Item.glassServingJugWithBeerHalf},
        quarter = {Item.bottleOfBeerQuarter, Item.glassServingJugWithBeerQuarter},
        empty = {
            Item.largeEmptyBottle, Item.glassServingJug, Item.clayServingJug, Item.ceramicServingJug,
            Item.ironServingJug, Item.copperServingJug, Item.silverServingJug,
            Item.goldServingJug},
        vessels = {
            {empty = Item.clayMug, filled = Item.clayBeerMugFull, amount = 1},
            {empty = Item.glassMug, filled = Item.beerMug, amount = 1},
            {empty = Item.clayServingJug, filled = Item.clayServingJugWithBeer, amount = 1, max = 10},
            {empty = Item.ceramicServingJug, filled = Item.ceramicServingJugWithBeer, amount = 1, max = 10},
            {empty = Item.ironServingJug, filled = Item.ironServingJugWithBeer, amount = 1, max = 10},
            {empty = Item.copperServingJug, filled = Item.copperServingJugWithBeer, amount = 1, max = 10},
            {empty = Item.silverServingJug, filled = Item.silverServingJugWithBeer, amount = 1, max = 10},
            {empty = Item.goldServingJug, filled = Item.goldServingJugWithBeer, amount = 1, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithBeer, amount = 7, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithBeerHalf, amount = 4, max = 6},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithBeerQuarter, amount = 1, max = 3}},
        type = "jug"},
    {
        full = {
            Item.bottleOfMilk, Item.glassServingJugWithMilk, Item.bottleOfSheepMilk, Item.bottleOfDeerMilk,
            Item.clayServingJugWithMilk, Item.ceramicServingJugWithMilk,
            Item.ironServingJugWithMilk, Item.copperServingJugWithMilk, Item.silverServingJugWithMilk,
            Item.goldServingJugWithMilk},
        half = {
            Item.bottleOfMilkHalf, Item.bottleOfSheepMilkHalf, Item.bottleOfDeerMilkHalf,
            Item.glassServingJugWithMilkHalf},
        quarter = {Item.bottleOfMilkQuarter, Item.bottleOfSheepMilkQuarter,
                    Item.bottleOfDeerMilkQuarter, Item.glassServingJugWithMilkQuarter},
        empty = {
            Item.largeEmptyBottle, Item.glassServingJug, Item.clayServingJug, Item.ceramicServingJug,
            Item.ironServingJug, Item.copperServingJug, Item.silverServingJug,
            Item.goldServingJug},
        vessels = {
            {empty = Item.clayCup, filled = Item.clayCupWithMilk, amount = 1},
            {empty = Item.ceramicCup, filled = Item.ceramicCupWithMilk, amount = 1},
            {empty = Item.woodenCup, filled = Item.cupWithMilk, amount = 1},
            {empty = Item.ironGoblet, filled = Item.ironGobletWithMilk, amount = 1},
            {empty = Item.copperGoblet, filled = Item.copperGobletWithMilk, amount = 1},
            {empty = Item.silverGoblet, filled = Item.silverGobletglassWithMilk, amount = 1},
            {empty = Item.goldenGoblet, filled = Item.goldGobletWithMilk, amount = 1},
            {empty = Item.glass, filled = Item.glassWithMilk, amount = 1},
            {empty = Item.clayServingJug, filled = Item.clayServingJugWithMilk, amount = 1, max = 10},
            {empty = Item.ceramicServingJug, filled = Item.ceramicServingJugWithMilk, amount = 1, max = 10},
            {empty = Item.ironServingJug, filled = Item.ironServingJugWithMilk, amount = 1, max = 10},
            {empty = Item.copperServingJug, filled = Item.copperServingJugWithMilk, amount = 1, max = 10},
            {empty = Item.silverServingJug, filled = Item.silverServingJugWithMilk, amount = 1, max = 10},
            {empty = Item.goldServingJug, filled = Item.goldServingJugWithMilk, amount = 1, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithMilk, amount = 7, max = 10},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithMilkHalf, amount = 4, max = 6},
            {empty = Item.glassServingJug, filled = Item.glassServingJugWithMilkQuarter, amount = 1, max = 3}},
        type = "jug",
        breakPoint = 3},
    {
        full = {Item.bottleOfElvenWine},
        half = {Item.bottleOfElvenWineHalf},
        quarter = {Item.bottleOfElvenWineQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithElvenWine, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithElvenWine, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithElvenWine, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithElvenWine, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithElvenWine, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithElvenWine, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithElvenWine, amount = 1}
        },
    },
    {
        full = {Item.bottleOfAbsinthe},
        half = {Item.bottleOfAbsinthHalf},
        quarter = {Item.bottleOfAbsinthQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithAbsinthe, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithAbsinthe, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithAbsinthe, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithAbsinthe, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithAbsinthe, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithAbsinthe, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithAbsinthe, amount = 1}
        },
    },
    {
        full = {Item.bottleOfBearSlayer},
        half = {Item.bottleOfBearSlayerHalf},
        quarter = {Item.bottleOfBearSlayerQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithBearSlayer, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithBearSlayer, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithBearSlayer, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithBearSlayer, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithBearSlayer, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithBearSlayer, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithBearSlayer, amount = 1}
        },
    },
    {
        full = {Item.bottleOfBerryBooze},
        half = {Item.bottleOfBerryBoozeHalf},
        quarter = {Item.bottleOfBerryBoozeQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithBerryBooze, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithBerryBooze, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithBerryBooze, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithBerryBooze, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithBerryBooze, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithBerryBooze, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithBerryBooze, amount = 1}
        },
    },
    {
        full = {Item.bottleOfCherrySchnapps},
        half = {Item.bottleOfCherrySchnappsHalf},
        quarter = {Item.bottleOfCherrySchnappsQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithCherrySchnapps, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithCherrySchnapps, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithCherrySchnapps, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithCherrySchnapps, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithCherrySchnapps, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithCherrySchnapps, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithCherrySchnapps, amount = 1}
        },
    },
    {
        full = {Item.bottleOfMulledWine},
        half = {Item.bottleOfMulledWineHalf},
        quarter = {Item.bottleOfMulledWineQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithMulledWine, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithMulledWine, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithMulledWine, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithMulledWine, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithMulledWine, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithMulledWine, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithMulledWine, amount = 1}
        },
    },
    {
        full = {Item.bottleOfOrangeSchnapps},
        half = {Item.bottleOfOrangeSchnappsHalf},
        quarter = {Item.bottleOfOrangeSchnappsQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithOrangeSchnapps, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithOrangeSchnapps, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithOrangeSchnapps, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithOrangeSchnapps, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithOrangeSchnapps, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithOrangeSchnapps, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithOrangeSchnapps, amount = 1}
        },
    },
    {
        full = {Item.bottleOfRum},
        half = {Item.bottleOfRumHalf},
        quarter = {Item.bottleOfRumQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithRum, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithRum, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithRum, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithRum, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithRum, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithRum, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithRum, amount = 1}
        },
    },
    {
        full = {Item.bottleOfStoneFace},
        half = {Item.bottleOfStoneFaceHalf},
        quarter = {Item.bottleOfStoneFaceQuarter},
        empty = {Item.emptyLiquorBottle},
        vessels = {
            {empty = Item.clayShotGlass, filled = Item.clayShotGlassWithStoneFace, amount = 1},
            {empty = Item.ceramicShotGlass, filled = Item.ceramicShotGlassWithStoneFace, amount = 1},
            {empty = Item.ironShotGlass, filled = Item.ironShotGlassWithStoneFace, amount = 1},
            {empty = Item.copperShotGlass, filled = Item.copperShotGlassWithStoneFace, amount = 1},
            {empty = Item.silverShotGlass, filled = Item.silverShotGlassWithStoneFace, amount = 1},
            {empty = Item.goldShotGlass, filled = Item.goldShotGlassWithStoneFace, amount = 1},
            {empty = Item.shotGlass, filled = Item.shotGlassWithStoneFace, amount = 1}
        },
    },
    {
        full = {Item.bottleOfDruidsTea, Item.glassTeapotDruidsTea},
        half = {Item.bottleOfDruidsTeaHalf, Item.glassTeapotDruidsTeaHalf},
        quarter = {Item.bottleOfDruidsTeaQuarter, Item.glassTeapotDruidsTeaQuarter},
        empty = {Item.teaBottle, Item.glassTeapot},
        vessels = {
            {empty = Item.clayTeaCup, filled = Item.clayTeaCupDruid, amount = 1},
            {empty = Item.ceramicTeaCup, filled = Item.ceramicTeaCupDruid, amount = 1},
            {empty = Item.ironTeaCup, filled = Item.ironTeaCupDruid, amount = 1},
            {empty = Item.copperTeaCup, filled = Item.copperTeaCupDruid, amount = 1},
            {empty = Item.silverTeaCup, filled = Item.silverTeaCupDruid, amount = 1},
            {empty = Item.goldTeaCup, filled = Item.goldTeaCupDruid, amount = 1},
            {empty = Item.glassTeaCup, filled = Item.glassTeaCupDruid, amount = 1},
        },
        type = "druid"
    },
    {
        full = {Item.bottleOfGreenTea, Item.glassTeapotGreenTea},
        half = {Item.bottleOfGreenTeaHalf, Item.glassTeapotGreenTeaHalf},
        quarter = {Item.bottleOfGreenTeaQuarter, Item.glassTeapotGreenTeaQuarter},
        empty = {Item.teaBottle, Item.glassTeapot},
        vessels = {
            {empty = Item.clayTeaCup, filled = Item.clayTeaCupGreen, amount = 1},
            {empty = Item.ceramicTeaCup, filled = Item.ceramicTeaCupGreen, amount = 1},
            {empty = Item.ironTeaCup, filled = Item.ironTeaCupGreen, amount = 1},
            {empty = Item.copperTeaCup, filled = Item.copperTeaCupGreen, amount = 1},
            {empty = Item.silverTeaCup, filled = Item.silverTeaCupGreen, amount = 1},
            {empty = Item.goldTeaCup, filled = Item.goldTeaCupGreen, amount = 1},
            {empty = Item.glassTeaCup, filled = Item.glassTeaCupGreen, amount = 1},
        },
        type = "green"
    },
    {
        full = {Item.bottleOfFirNeedleTea, Item.glassTeapotFirNeedleTea},
        half = {Item.bottleOfFirNeedleTeaHalf, Item.glassTeapotFirNeedleTeaHalf},
        quarter = {Item.bottleOfFirNeedleTeaQuarter, Item.glassTeapotFirNeedleTeaQuarter},
        empty = {Item.teaBottle, Item.glassTeapot},
        vessels = {
            {empty = Item.clayTeaCup, filled = Item.clayTeaCupFirNeedle, amount = 1},
            {empty = Item.ceramicTeaCup, filled = Item.ceramicTeaCupFirNeedle, amount = 1},
            {empty = Item.ironTeaCup, filled = Item.ironTeaCupFirNeedle, amount = 1},
            {empty = Item.copperTeaCup, filled = Item.copperTeaCupFirNeedle, amount = 1},
            {empty = Item.silverTeaCup, filled = Item.silverTeaCupFirNeedle, amount = 1},
            {empty = Item.goldTeaCup, filled = Item.goldTeaCupFirNeedle, amount = 1},
            {empty = Item.glassTeaCup, filled = Item.glassTeaCupFirNeedle, amount = 1},
        },
        type = "firNeedle"
    },
    {
        full = {Item.bottleOfVirginsWeedTea, Item.glassTeapotVirginsWeedTea},
        half = {Item.bottleOfVirginsWeedTeaHalf, Item.glassTeapotVirginsWeedTeaHalf},
        quarter = {Item.bottleOfVirginsWeedTeaQuarter, Item.glassTeapotVirginsWeedTeaQuarter},
        empty = {Item.teaBottle, Item.glassTeapot},
        vessels = {
            {empty = Item.clayTeaCup, filled = Item.clayTeaCupVirginWeed, amount = 1},
            {empty = Item.ceramicTeaCup, filled = Item.ceramicTeaCupVirginWeed, amount = 1},
            {empty = Item.ironTeaCup, filled = Item.ironTeaCupVirginWeed, amount = 1},
            {empty = Item.copperTeaCup, filled = Item.copperTeaCupVirginWeed, amount = 1},
            {empty = Item.silverTeaCup, filled = Item.silverTeaCupVirginWeed, amount = 1},
            {empty = Item.goldTeaCup, filled = Item.goldTeaCupVirginWeed, amount = 1},
            {empty = Item.glassTeaCup, filled = Item.glassTeaCupVirginWeed, amount = 1},
            {empty = Item.clayTeapot, filled = Item.clayTeapot, amount = 1, max = 10},
            {empty = Item.ceramicTeapot, filled = Item.ceramicTeapot, amount = 1, max = 10},
            {empty = Item.ironTeapot, filled = Item.ironTeapot, amount = 1, max = 10},
            {empty = Item.copperTeapot, filled = Item.copperTeapot, amount = 1, max = 10},
            {empty = Item.silverTeapot, filled = Item.silverTeapot, amount = 1, max = 10},
            {empty = Item.goldTeapot, filled = Item.goldTeapot, amount = 1, max = 10},
            {empty = Item.glassTeapot, filled = Item.glassTeapot, amount = 1, max = 10}
        },
        type = "virginWeed"
    },
}

M.bottles = bottles -- the list is referenced in crafts for remnant purposes

local function getTeaVesselBasedOnType(type)

    local pot

    if type == "druid" then
        pot = Item.glassTeapotDruidsTea
    elseif type == "firNeedle" then
        pot = Item.glassTeapotFirNeedleTea
    elseif type == "virginWeed" then
        pot = Item.glassTeapotVirginsWeedTea
    elseif type == "green" then
        pot = Item.glassTeapotGreenTea
    end

    for _, bottle in pairs(bottles) do
        for _, fullBottle in pairs(bottle.full) do
            if fullBottle == pot then
                return bottle.vessels
            end
        end
    end
end

local teaPots = {Item.clayTeapot, Item.copperTeapot, Item.silverTeapot, Item.goldTeapot, Item.ironTeapot, Item.glassTeapot, Item.ceramicTeapot}

local function getBottleInfo(sourceItem)

    for _, bottle in pairs(bottles) do

        for index, fullBottle in pairs(bottle.full) do
            if fullBottle == sourceItem.id then
                return true, bottle.half[index], bottle.quarter[index], bottle.empty[index], bottle.vessels, 8, index, bottle.type, bottle.breakPoint
            end
        end

        for index, halfBottle in pairs(bottle.half) do
            if halfBottle == sourceItem.id then
                return true, bottle.half[index], bottle.quarter[index], bottle.empty[index], bottle.vessels,  5, index, bottle.type, bottle.breakPoint

            end
        end

        for index, quarterBottle in pairs(bottle.quarter) do
            if quarterBottle == sourceItem.id then
                return true, bottle.half[index], bottle.quarter[index], bottle.empty[index], bottle.vessels,  2, index, bottle.type, bottle.breakPoint
            end
        end
    end

    return false
end

local bottleTexts = {
    english = {
        "There are only a few drops left in the bottle.",
        "The bottle is nearly empty.",
        "A quarter of the bottle contains liquid.",
        "Nearly half of the bottle is full.",
        "Half of the bottle is full.",
        "The bottle is a little above half filled.",
        "The bottle is almost full.",
        "The bottle is full.",
        "The bottle is filled to the brim.",
        "The bottle is overflowing."
    },
    german = {
        "Nur ein paar Tropfen sind noch in der Flasche.",
        "Die Flasche ist fast leer.",
        "Ein Viertel der Flasche enthält Flüssigkeit.",
        "Fast die Hälfte der Flasche ist voll.",
        "Die Flasche ist halb voll.",
        "Die Flasche ist etwas über halb voll.",
        "Die Flasche ist fast voll.",
        "Die Flasche ist voll.",
        "Die Flasche ist bis zum Rand gefüllt.",
        "Die Flasche schwappt über."
    }
}

local servingJugTexts = {
    english = {
        "There are only a few drops left in the jug.",
        "The jug is nearly empty.",
        "A quarter of the jug contains liquid.",
        "Nearly half of the jug is full.",
        "Half of the jug is full.",
        "The jug is a little above half filled.",
        "The jug is almost full.",
        "The jug is full.",
        "The jug is filled to the brim.",
        "The jug is overflowing."
    },
    german = {
        "Nur ein paar Tropfen sind noch in dem Krug.",
        "Der Krug ist fast leer.",
        "Ein Viertel des Krugs enthält Flüssigkeit.",
        "Fast die Hälfte des Krugs ist voll.",
        "Der Krug ist halb voll.",
        "Der Krug ist etwas über halb voll.",
        "Der Krug ist fast voll.",
        "Der Krug ist voll.",
        "Der Krug ist bis zum Rand gefüllt.",
        "Der Krug schwappt über."
    }
}

local glassTeaPotTexts = {
    english = {
        "The pot is empty.",
        "There are only a few drops of tea left in the pot.",
        "The pot barely has any tea left.",
        "A quarter of the pot contains tea.",
        "Nearly half of the pot is full of tea.",
        "Half of the pot is full of tea.",
        "The pot is a little above half filled with tea.",
        "The pot is almost full with tea.",
        "The pot is full of tea.",
        "The pot is filled to the brim with tea.",
        "The pot is overflowing with tea."
    },
    german = {
        "Die Kanne ist leer.",
        "Nur ein paar Tropfen Tee sind noch in der Kanne.",
        "Die Kanne enthält kaum noch Tee.",
        "Ein Viertel der Kanne enthält Tee.",
        "Fast die Hälfte der Kanne ist voll mit Tee.",
        "Die Kanne ist halb voll mit Tee.",
        "Die Kanne ist etwas über halb voll mit Tee.",
        "Die Kanne ist fast voll mit Tee.",
        "Die Kanne ist voll mit Tee.",
        "Die Kanne ist bis zum Rand mit Tee gefüllt.",
        "Die Kanne schwappt über mit Tee."
    }
}

local teaPotTexts = {
    english = {
        "The pot is empty.",
        "The pot only has a few drops left of the ",
        "The pot barely has any ",
        "A quarter of the pot contains ",
        "Nearly half of the pot is full of ",
        "Half of the pot is full of ",
        "The pot is a little above half filled with ",
        "The pot is almost full with ",
        "The pot is full of ",
        "The pot is filled to the brim with ",
        "The pot is overflowing with "
    },
    german = {
        "Die Kanne ist leer.",
        "In der Kanne sind noch nur ein paar Tropfen ",
        "Die Kanne enthält kaum noch ",
        "Ein Viertel der Kanne enthält ",
        "Fast die Hälfte der Kanne ist voll mit ",
        "Die Kanne ist halb voll mit ",
        "Die Kanne ist etwas über halb voll mit ",
        "Die Kanne ist fast voll mit ",
        "Die Kanne ist voll mit ",
        "Die Kanne ist bis zum Rand gefüllt mit ",
        "Die Kanne schwappt über mit "
    }
}

local function getVesselToFill(user, vessels, amount)

    for _, vessel in pairs(vessels) do

        if amount >= vessel.amount then -- Checks amount so that it skips to the half/quarter serving jugs if there is not enough liquid for full/half

            if common.hasItemIdInHand(user, vessel.empty) then
                return common.getItemInHand(user, vessel.empty), vessel.filled, vessel.amount, vessel.max
            end

            local potentialVessel = common.GetFrontItem(user)

            if potentialVessel and potentialVessel.id == vessel.empty then
                return potentialVessel, vessel.filled, vessel.amount, vessel.max
            end
        end
    end

    return false

end

local function isTeaPot(sourceItem)

    for _, pot in pairs(teaPots) do

        if sourceItem.id == pot then
            return true
        end

    end

    return false

end

local function getTypeOfTea(sourceItem)

    for _, bottle in pairs(bottles) do
        for _, fullBottle in pairs(bottle.full) do
            if fullBottle == sourceItem.id then
                return bottle.type
            end
        end

        for _, halfBottle in pairs(bottle.half) do
            if halfBottle == sourceItem.id then
                return bottle.type
            end
        end

        for _, quarterBottle in pairs(bottle.quarter) do
            if quarterBottle == sourceItem.id then
                return bottle.type
            end
        end
    end
end

local function fillTea(user, sourceItem, amount, half, quarter, empty, vesselToFill)

    local type = sourceItem:getData("teaType")

    if vesselToFill and isTeaPot(vesselToFill) and not isTeaPot(sourceItem) then
        type = getTypeOfTea(sourceItem)
    end

    local suitableVessels = getTeaVesselBasedOnType(type)

    local filledVessel, minAmountToFill, maxAmountToFill

    vesselToFill, filledVessel, minAmountToFill, maxAmountToFill = getVesselToFill(user, suitableVessels, amount)

    if not vesselToFill then
        common.InformNLS(user,
            "Dir fällt auf, dass du gar kein Gefäß hast, welches du füllen könntest.",
            "You notice that you do not have a vessel which you could fill.")
        return false
    end

    if vesselToFill.number > 1 then
        user:inform("Du kannst nicht in mehrere Gefäße auf einmal gießen! Wähle eins aus und versuche es erneut.", "You can't pour into multiple items at once! Single one out, then try again.")
        return false
    end

    local amountToFill = minAmountToFill

    if not maxAmountToFill then
        maxAmountToFill =  minAmountToFill
    end

    if amount >= maxAmountToFill then
        amountToFill = maxAmountToFill
    elseif amount > minAmountToFill then
        amountToFill = amount
    end

    local newAmount = amount - amountToFill

    vesselToFill.id = filledVessel

    if maxAmountToFill > 1 then
        vesselToFill:setData("teaType", type)
        vesselToFill:setData("drinksRemaining", amountToFill)
    end

    world:changeItem(vesselToFill)

    sourceItem:setData("drinksRemaining", newAmount)

    if newAmount == 0 then
        sourceItem:setData("drinksRemaining", "")
        vesselToFill:setData("teaType", "")
        if empty then
            sourceItem.id = empty
        end
    elseif quarter and newAmount <= 2 then
        sourceItem.id = quarter
    elseif half and newAmount <= 5 then
        sourceItem.id = half
    end

    world:changeItem(sourceItem)

    return true, sourceItem
end

local function fillVessel(user, sourceItem, bottle)

    local _, half, quarter, empty, vessels, maxAmount = getBottleInfo(sourceItem)

    local amount = sourceItem:getData("drinksRemaining")

    if common.IsNilOrEmpty(amount) then
        amount = maxAmount
    else
        amount = tonumber(amount)
    end

    local vesselToFill, filledVessel, minAmountToFill, maxAmountToFill = getVesselToFill(user, vessels, amount)

    if not vesselToFill then
        common.InformNLS(user,
            "Dir fällt auf, dass du gar kein Gefäß hast, welches du füllen könntest.",
            "You notice that you do not have a vessel which you could fill.")
        return false
    end

    if vesselToFill.number > 1 then
        user:inform("Du kannst nicht in mehrere Gefäße auf einmal gießen! Wähle eins aus und versuche es erneut.", "You can't pour into multiple items at once! Single one out, then try again.")
        return false
    end

    if isTeaPot(vesselToFill) then
        return fillTea(user, sourceItem, amount, half, quarter, empty, vesselToFill)
    end

    local amountToFill = minAmountToFill

    if not maxAmountToFill then
        maxAmountToFill =  minAmountToFill
    end

    if amount >= maxAmountToFill then
        amountToFill = maxAmountToFill
    elseif amount > minAmountToFill then
        amountToFill = amount
    end

    local newAmount = amount - amountToFill

    vesselToFill.id = filledVessel

    if maxAmountToFill > 1 then
        vesselToFill:setData("drinksRemaining", amountToFill)
    end

    world:changeItem(vesselToFill)

    sourceItem:setData("drinksRemaining", newAmount)

    if newAmount == 0 then
        sourceItem:setData("drinksRemaining", "")
        sourceItem.id = empty
    elseif newAmount <= 2 then
        sourceItem.id = quarter
    elseif newAmount <= 5 then
        sourceItem.id = half
    end

    world:changeItem(sourceItem)

    return true, sourceItem

end



function M.UseItem(user, sourceItem, actionState)

    if evilrockEntrance(user, sourceItem, actionState) == true then
        return
    end

    if sourceItem.wear == 255 then --It's a static display item, not something to consume
        return
    end

    if sourceItem.number > 1 then
        user:inform("Du kannst nicht aus mehreren Gefäßen auf einmal ausschenken! Wähle eins aus und versuche es erneut.", "You can't pour from multiple items at once! Single one out, then try again.")
        return
    end

    local filled = false

    local updatedSourceItem = nil

    local amount = sourceItem:getData("drinksRemaining")

    if isTeaPot(sourceItem) and common.IsNilOrEmpty(amount) then
        amount = 0
    else
        amount = tonumber(amount)
    end

    if not isTeaPot(sourceItem) then
        for _, bottle in ipairs(bottles) do

            for _, quarterBottle in pairs(bottle.quarter) do
                if quarterBottle == sourceItem.id then
                    filled, updatedSourceItem = fillVessel(user, sourceItem, bottle)
                end
            end

            for _, halfBottle in pairs(bottle.half) do
                if halfBottle == sourceItem.id then
                    filled, updatedSourceItem = fillVessel(user, sourceItem, bottle)
                end
            end

            for index, fullBottle in pairs(bottle.full) do
                if fullBottle == sourceItem.id then
                    filled, updatedSourceItem  = fillVessel(user, sourceItem, bottle)
                end
            end
        end
    elseif amount > 0 then
        filled, updatedSourceItem = fillTea(user, sourceItem, amount)
    end

    if not filled then
        return
    end

    local isBigBottle, _, _, empty = getBottleInfo(updatedSourceItem)

    local isEmpty = false

    if isBigBottle and empty == updatedSourceItem.id then
        isEmpty = true
    end

    if isEmpty and math.random(1,20) == 1 then -- Same chance as with food dishes breaking is applied
        user:inform("Die leere Flasche ist angeschlagen und unbrauchbar.",
        "The empty bottle is broken and no longer usable.", Character.highPriority)
    end

end

local teaNames = {
    druid = {german = "Druidentee", english = "druids tea"},
    firNeedle = {german = "Tannenadeltee", english = "fir needle tea"},
    virginWeed = {german = "Jungfernkrauttee", english = "virgin weed tea"},
    green = {german = "grüner Tee", english = "green tea"}}

function M.LookAtItem(user, sourceItem)

    local typeOfTea = sourceItem:getData("teaType")

    local teaName

    if not common.IsNilOrEmpty(typeOfTea) then
        teaName = teaNames[typeOfTea]
    end

    local lookAt = lookat.GenerateLookAt(user, sourceItem)

    local amount = sourceItem:getData("drinksRemaining")

    local textsToUse

    local isBottle, _, _, _, _, maxAmount, index, type, breakPoint = getBottleInfo(sourceItem)

    if not breakPoint then
        breakPoint = 1
    end

    if isBottle or isTeaPot(sourceItem) then
        if common.IsNilOrEmpty(amount) and isBottle then
            amount = maxAmount
        elseif common.IsNilOrEmpty(amount) and isTeaPot(sourceItem) then
            amount = 0
        else
            amount = tonumber(amount)
        end

        if isTeaPot(sourceItem) then
            amount = amount+1 --since lua tables(arrays) dont start at 0
        end

        textsToUse = bottleTexts

        if index and index > breakPoint then -- First listed is always the bottle, then come the jugs/pots. If there's more than one bottle, a breakpoint is provided
            if type == "jug" then
                textsToUse = servingJugTexts
            elseif isTeaPot(sourceItem) then
                textsToUse = teaPotTexts
            else
                textsToUse = glassTeaPotTexts
                amount = amount+1
            end
        elseif not index then -- empty teapot
            textsToUse = teaPotTexts
        end
    else
        return lookAt -- item is not in any of the lists for texts to add
    end

    local description = common.GetNLS(user, textsToUse.german[amount], textsToUse.english[amount])

    if teaName and amount > 1 then --add the type of tea if the tea pot is not empty for the non-glass teapots so we know what is in them
        description = common.GetNLS(user, description..teaName.german..".", description..teaName.english..".")
    end

    if lookAt.description ~= nil then
        description = description.."\n"..lookAt.description;
    end

    lookAt.description = description

    return lookAt
end

return M
