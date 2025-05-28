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

local teasets = {

    {tray = Item.fancyIronTray, ceramic = Item.teaSetIronAmethystCeramic, clay = Item.teaSetIronAmethystClay,
    copper = Item.teaSetIronAmethystCopper, glass = Item.teaSetIronAmethystGlass, gold = Item.teaSetIronAmethystGold,
    iron = Item.teaSetIronAmethystIron, silver = Item.teaSetIronAmethystSilver},

    {tray = Item.fancyCopperTray, ceramic = Item.teaSetCopperObsidianCeramic, clay = Item.teaSetCopperObsidianClay,
    copper = Item.teaSetCopperObsidianrCopper, glass = Item.teaSetCopperObsidianGlass, gold = Item.teaSetCopperObsidianGold,
    iron = Item.teaSetCopperObsidianIron, silver = Item.teaSetCopperObsidianSilver},

    {tray = Item.fancySilverTray, ceramic = Item.teaSetSilverSapphireCeramic, clay = Item.teaSetSilverSapphireClay,
    copper = Item.teaSetSilverSapphireCopper, glass = Item.teaSetSilverSapphireGlass, gold = Item.teaSetSilverSapphireGold,
    iron = Item.teaSetSilverSapphireIron, silver = Item.teaSetSilverSapphireSilver},

    {tray = Item.fancyGoldTray, ceramic = Item.teaSetGoldEmeraldCeramic, clay = Item.teaSetGoldEmeraldClay,
    copper = Item.teaSetGoldEmeraldCopper, glass = Item.teaSetGoldEmeraldGlass, gold = Item.teaSetGoldEmeraldGold,
    iron = Item.teaSetGoldEmeraldIron, silver = Item.teaSetGoldEmeraldSilver},

    {tray = Item.stainedGlassTrayBlueGreen, ceramic = Item.teaSetBlueGreenGlassCeramic,
    clay = Item.teaSetBlueGreenGlassClay, copper = Item.teaSetBlueGreenGlassCopper, glass = Item.teaSetBlueGreenGlassGlass,
    gold = Item.teaSetBlueGreenGlassGold, iron = Item.teaSetBlueGreenGlassIron, silver = Item.teaSetBlueGreenGlassSilver},

    {tray = Item.stainedGlassTrayGreenYellow, ceramic = Item.teaSetGreenYellowGlassCeramic,
    clay = Item.teaSetGreenYellowGlassClay, copper = Item.teaSetGreenYellowGlassCopper, glass = Item.teaSetGreenYellowGlassGlass,
    gold = Item.teaSetGreenYellowGlassGold, iron = Item.teaSetGreenYellowGlassIron, silver = Item.teaSetGreenYellowGlassSilver},

    {tray = Item.stainedGlassTrayRedBlack, ceramic = Item.teaSetRedBlackGlassCeramic,
    clay = Item.teaSetRedBlackGlassClay, copper = Item.teaSetRedBlackGlassCopper, glass = Item.teaSetRedBlackGlassGlass,
    gold = Item.teaSetRedBlackGlassGold, iron = Item.teaSetRedBlackGlassIron, silver = Item.teaSetRedBlackGlassSilver},

    {tray = Item.stainedGlassTrayVioletRed, ceramic = Item.teaSetVioletRedGlassCeramic,
    clay = Item.teaSetVioletRedGlassClay, copper = Item.teaSetVioletRedGlassCopper, glass = Item.teaSetVioletRedGlassGlass,
    gold = Item.teaSetVioletRedGlassGold, iron = Item.teaSetVioletRedGlassIron, silver = Item.teaSetVioletRedGlassSilver},

    {tray = Item.ironTraySouth, ceramic = Item.teaSetIronCeramicSouth,
    clay = Item.teaSetIronClaySouth, copper = Item.teaSetIronCopperSouth, glass = Item.teaSetIronGlassSouth,
    gold = Item.teaSetIronGoldSouth, iron = Item.teaSetIronIronSouth, silver = Item.teaSetIronSilverSouth, alternate = Item.ironTrayWest},

    {tray = Item.ironTrayWest, ceramic = Item.teaSetIronCeramicWest,
    clay = Item.teaSetIronClayWest, copper = Item.teaSetIronCopperWest, glass = Item.teaSetIronGlassWest,
    gold = Item.teaSetIronGoldWest, iron = Item.teaSetIronIronWest, silver = Item.teaSetIronSilverWest, alternate = Item.ironTraySouth},

    {tray = Item.copperTraySouth, ceramic = Item.teaSetCopperCeramicSouth,
    clay = Item.teaSetCopperClaySouth, copper = Item.teaSetCopperCopperSouth, glass = Item.teaSetCopperGlassSouth,
    gold = Item.teaSetCopperGoldSouth, iron = Item.teaSetCopperIronSouth, silver = Item.teaSetCopperSilverSouth, alternate = Item.copperTrayWest},

    {tray = Item.copperTrayWest, ceramic = Item.teaSetCopperCeramicWest,
    clay = Item.teaSetCopperClayWest, copper = Item.teaSetCopperCopperWest, glass = Item.teaSetCopperGlassWest,
    gold = Item.teaSetCopperGoldWest, iron = Item.teaSetCopperIronWest, silver = Item.teaSetCopperSilverWest, alternate = Item.copperTraySouth},

    {tray = Item.silverTraySouth, ceramic = Item.teaSetSilverCeramicSouth,
    clay = Item.teaSetSilverClaySouth, copper = Item.teaSetSilverCopperSouth, glass = Item.teaSetSilverGlassSouth,
    gold = Item.teaSetSilverGoldSouth, iron = Item.teaSetSilverIronSouth, silver = Item.teaSetSilverSilverSouth, alternate = Item.silverTrayWest},

    {tray = Item.silverTrayWest, ceramic = Item.teaSetSilverCeramicWest,
    clay = Item.teaSetSilverClayWest, copper = Item.teaSetSilverCopperWest, glass = Item.teaSetSilverGlassWest,
    gold = Item.teaSetSilverGoldWest, iron = Item.teaSetSilverIronWest, silver = Item.teaSetSilverSilverWest, alternate = Item.silverTraySouth},

    {tray = Item.goldTraySouth, ceramic = Item.teaSetGoldCeramicSouth,
    clay = Item.teaSetGoldClaySouth, copper = Item.teaSetGoldCopperSouth, glass = Item.teaSetGoldGlassSouth,
    gold = Item.teaSetGoldGoldSouth, iron = Item.teaSetGoldIronSouth, silver = Item.teaSetGoldSilverSouth, alternate = Item.goldTrayWest},

    {tray = Item.goldTrayWest, ceramic = Item.teaSetGoldCeramicWest,
    clay = Item.teaSetGoldClayWest, copper = Item.teaSetGoldCopperWest, glass = Item.teaSetGoldGlassWest,
    gold = Item.teaSetGoldGoldWest, iron = Item.teaSetGoldIronWest, silver = Item.teaSetGoldSilverWest, alternate = Item.goldTraySouth},

    {tray = Item.naldorTraySouth, ceramic = Item.teaSetNaldorCeramicSouth,
    clay = Item.teaSetNaldorClaySouth, copper = Item.teaSetNaldorCopperSouth, glass = Item.teaSetNaldorGlassSouth,
    gold = Item.teaSetNaldorGoldSouth, iron = Item.teaSetNaldorIronSouth, silver = Item.teaSetNaldorSilverSouth, alternate = Item.naldorTrayWest},

    {tray = Item.naldorTrayWest, ceramic = Item.teaSetNaldorCeramicWest,
    clay = Item.teaSetNaldorClayWest, copper = Item.teaSetNaldorCopperWest, glass = Item.teaSetNaldorGlassWest,
    gold = Item.teaSetNaldorGoldWest, iron = Item.teaSetNaldorIronWest, silver = Item.teaSetNaldorSilverWest, alternate = Item.naldorTraySouth},

    {tray = Item.coniferTraySouth, ceramic = Item.teaSetConiferCeramicSouth,
    clay = Item.teaSetConiferClaySouth, copper = Item.teaSetConiferCopperSouth, glass = Item.teaSetConiferGlassSouth,
    gold = Item.teaSetConiferGoldSouth, iron = Item.teaSetConiferIronSouth, silver = Item.teaSetConiferSilverSouth, alternate = Item.coniferTrayWest},

    {tray = Item.coniferTrayWest, ceramic = Item.teaSetConiferCeramicWest,
    clay = Item.teaSetConiferClayWest, copper = Item.teaSetConiferCopperWest, glass = Item.teaSetConiferGlassWest,
    gold = Item.teaSetConiferGoldWest, iron = Item.teaSetConiferIronWest, silver = Item.teaSetConiferSilverWest, alternate = Item.coniferTraySouth}
}

local materials = {"ceramic", "clay", "iron", "copper", "silver", "gold", "glass"}

local possibleDataValues = {"drinkRarity", "craftedRare", "rareness", "teaType", "drinksRemaining", "craftedBy", "descriptionDe", "descriptionEn", "nameDe", "nameEn"}


function M.putPotCupsOnTray(user, potOrCup)

    local origin = false
    local theMaterial = false
    local foundTray = false

    local possibleTray = common.GetFrontItem(user)

    local commonItem = world:getItemStatsFromId(potOrCup.id)

    for _, material in pairs(materials) do

        local materialToCheckFor = material

        if material == "ceramic" then
            materialToCheckFor = "porcelain"
        end

        if string.find(commonItem.English, "teapot") and string.find(commonItem.English, materialToCheckFor) then

            origin = "pot"
            theMaterial = material

        elseif string.find(commonItem.English, "tea cup") and string.find(commonItem.English, materialToCheckFor) then

            origin = "cup"
            theMaterial = material

        end
    end

    for _, teaset in pairs(teasets) do
        if possibleTray and possibleTray.id == teaset.tray then
            foundTray = teaset[theMaterial]
        end
    end

    if not foundTray or possibleTray.wear == 255 then
        return false
    end

    if not origin or not theMaterial then
        return
    end

    local possibleItems = {}

    for i = 1, 6 do
        table.insert(possibleItems, user:getItemAt(Character["belt_pos_"..i]))
    end

    table.insert(possibleItems, user:getItemAt(Character.left_tool))
    table.insert(possibleItems, user:getItemAt(Character.right_tool))

    local foundCups = {}

    local foundPot = false

    if origin == "pot" then
        foundPot = potOrCup
    end

    local cupID = Item[theMaterial.."TeaCup"]
    local potID = Item[theMaterial.."Teapot"]
    local neededCups = 4

    local cupNumber = 0

    for _, possibleCupOrPot in pairs(possibleItems) do

        if foundPot and #foundCups == neededCups then
            break
        end

        if origin == "cup" and possibleCupOrPot.id == potID then
            foundPot = possibleCupOrPot
        end

        if possibleCupOrPot.id == cupID then
            table.insert(foundCups, possibleCupOrPot)
            cupNumber = cupNumber + possibleCupOrPot.number
        end

    end

    if not foundPot or cupNumber < neededCups then

        local commonCup = world:getItemStatsFromId(cupID)
        local commonPot = world:getItemStatsFromId(potID)

        user:inform("Wenn du ein Teeservice auf dem Tablett anrichten möchtest, brauchst du eine "..commonPot.German.." und vier "..commonCup.German.."s.", "If you want to arrange a tea set on the tray, you need a "..commonPot.English.." and four "..commonCup.English.."s.")
        return true
    end

    for index, cup in pairs(foundCups) do
        possibleTray:setData("cup"..index.."id", cup.id)
    end

    possibleTray:setData("pot".."id", foundPot.id)


    for _, possibleDataValue in pairs(possibleDataValues) do

        for index, cup in pairs(foundCups) do

            possibleTray:setData("cup"..index..possibleDataValue, cup:getData(possibleDataValue))
        end

        possibleTray:setData("pot"..possibleDataValue, foundPot:getData(possibleDataValue))
    end

    possibleTray.id = foundTray

    world:erase(foundPot, 1)

    local erasedCups = 0

    for _, cup in pairs(foundCups) do

        if erasedCups == neededCups then
            break
        end

        local cupsToErase = math.min(neededCups-erasedCups, cup.number)
        erasedCups = erasedCups + cupsToErase
        world:erase(cup, cupsToErase)
    end

    world:changeItem(possibleTray)

    return true
end


function M.UseItem(user, sourceItem)

    if sourceItem.wear == 255 then
        return
    end

    for _, teaset in pairs(teasets) do

        if sourceItem.id == teaset.tray then
            user:inform("Mit vier passenden Teetassen und einer Teekanne könnten Sie ein Teeservice auf diesem Tablett arrangieren.", "With four matching tea cups and a tea pot, you could arrange a tea set on this tray.")
            if teaset.alternate then
                sourceItem.id = teaset.alternate
                world:changeItem(sourceItem)
            end
            return
        end

        for _, material in pairs(materials) do
            if sourceItem.id == teaset[material] then
                local teaPot = Item[material.."Teapot"]
                local teaCup = Item[material.."TeaCup"]

                local data = {
                    cup1 = {}, cup2 = {}, cup3 = {}, cup4 = {}, pot = {}
                }

                for _, possibleDataValue in pairs(possibleDataValues) do
                    for i = 1, 4 do
                        data["cup"..i][possibleDataValue] = sourceItem:getData("cup"..i..possibleDataValue)
                        sourceItem:setData("cup"..i..possibleDataValue, "")
                    end

                    data["pot"][possibleDataValue] = sourceItem:getData("pot"..possibleDataValue)
                    sourceItem:setData("pot"..possibleDataValue, "")
                end

                local storedIdPot = sourceItem:getData("potid")

                if not common.IsNilOrEmpty(storedIdPot) then
                    teaPot = tonumber(storedIdPot)
                end

                local storedCupIds = {}

                for i = 1, 4 do
                    storedCupIds[i] = sourceItem:getData("cup"..i.."id")
                    sourceItem:setData("cup"..i.."id", "")
                end

                sourceItem.id = teaset.tray

                sourceItem:setData("potid", "")

                world:changeItem(sourceItem)

                local potNotCreated = user:createItem(teaPot, 1, 333, data.pot)

                if potNotCreated == 1 then
                    world:createItemFromId(teaPot, 1, sourceItem.pos, true, 333, data.pot)
                end

                for i = 1, 4 do
                    local storedIdCup = storedCupIds[i]

                    local idToUse = teaCup

                    if not common.IsNilOrEmpty(storedIdCup) then
                        idToUse = tonumber(storedIdCup)
                    end
                    local cupNotCreated = user:createItem(idToUse, 1, 333, data["cup"..i])

                    if cupNotCreated == 1 then
                        world:createItemFromId(idToUse, 1, sourceItem.pos, true, 333, data["cup"..i])
                    end
                end

                return
            end
        end
    end

end

return M
