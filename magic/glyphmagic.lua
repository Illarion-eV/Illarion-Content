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
local glyphs = require("base.glyphs")
local magic = require("base.magic")
local globalvar = require("base.globalvar")
local triggerfield = require("triggerfield.base.triggerfield")

local M = {}

M.GLYPH_SHRINE_ID = 3498
M.SKILL_GLYPHING = Character.enchantingOfJewels
M.glyphForgeErectionMinSkill = 25
M.glyphRitualPrepareMinSkill = 0

local ITEM_ID_CANDLES = Item.candles
local ITEM_ID_CANDLEHOLDER = Item.smallCandlestick
local glyphForgeFindTime = 4
local glyphForgeFindMaxSkill = 20
local glyphForgeErectionTime = 54
local glyphRitualPrepareTime = 82
local glyphRitualPrepareExposureTime = 300
local glyphRitualPrepareNecessaryItems = { {ITEM_ID_CANDLES, 2} , {ITEM_ID_CANDLEHOLDER, 2} }
local glyphRitualBreakTimePortion = 0.5
local glyphRitualBreakManaPortion = 0.5

local orderOfGem = {
    {"Amethyst","Amethyst"},
    {"Rubin","Ruby"},
    {"Saphir","Sappire"},
    {"Obsidian","Obsidian"},
    {"Smaragd","Emerald"},
    {"Topas","Topaz"},
    {"Diamant","Diamond"}}

--[[defined working time divided by WORKING_CYCLES_DIV created the number of displayed cycles
WORKING_CYCLE_S is the duration of the displayed cycle]]
local WORKING_CYCLE_S = 8
local WORKING_CYCLES_DIV = 16

local MAX_MANA = 10000

local CHARGE_LOWER_RANGE = 0.5 --relative to nominal charges
local CHARGE_RANGE = 1 --relative to nominal charges

local workingRitual = {}
-- workingCycles, deltaMana, deltaFood, workingForgePos, workingItem, workingResult
local RITUAL_GLYPHING = 1
local RITUAL_ERECT_FORGE = 2
local RITUAL_PREPARE_RITUAL = 3
local RITUAL_BREAK_GLYPH = 4
local ITEM_ID_BURNING_CANDLE = 400

local workingGfx = {globalvar.gfxRAIN,globalvar.gfxSCOTTY,globalvar.gfxSPRINKLE,globalvar.gfxSPRINKLE,globalvar.gfxSPRINKLE}

local function endRitualAddGlyph(user, forgePos, item)

    local workingSkill = M.SKILL_GLYPHING
    local workingTime
    local nominalCharges
    local charges

    if glyphs.consumeShardsUsedToGlyphItem(user, item) then
        world:gfx(globalvar.gfxSUN, forgePos)
        workingTime = glyphs.getGlyphWorkingTime(item.id)
        user:learn(workingSkill, workingTime, 100)
        nominalCharges = glyphs.getNominalCharges(item.id)

        local skillFactor = user:getSkill(workingSkill) / 100 * 0.25
        local attributeFactor = (magic.getBestMageAttribute(user) -10) / 10 * 0.25 --10 - 20
        local qualityFactor = (common.getItemQuality(item) -1 )/ 8 * 0.25
        local randomFactor = math.random() * 0.25
        charges = nominalCharges * CHARGE_LOWER_RANGE + nominalCharges * CHARGE_RANGE * (skillFactor + attributeFactor + qualityFactor + randomFactor)
        glyphs.setRemainingGlyphs(item, charges)
        item:setData("GlyphForger", user.name)
        world:changeItem(item)
        if item.id == 79 or item.id == 3526 or item.id == 3528 then --amethyst amulets are used in the tutorial
            if user:getQuestProgress(241) == 3 then
                user:setQuestProgress(241, 4)
            end
        end
        common.InformNLS(user,"Du versiehst " .. common.getItemName(item, Player.german) .. " mit einer Glyphe.",
                              "You add a glyph to " .. common.getItemName(item, Player.english) .. ".")
    else
        common.HighInformNLS(user,
            "Die notwendigen Splitter sind nicht mehr vorhanden.",
            "You no longer have the required shards with you.")
    end
end

function M.checkForgeIsReady(forgeItem)

    local timeLimit = common.GetCurrentTimestamp() - glyphRitualPrepareExposureTime

    local lastPrepared = tonumber(forgeItem:getData("lastPrepared"))

    if lastPrepared ~= nil and lastPrepared > timeLimit then
        return true
    end

    return false
end

local function endRitualErectForge(user, forgePos, unused)
    local workingSkill = M.SKILL_GLYPHING
    local workingTime = glyphForgeErectionTime
    world:gfx(globalvar.gfxSUN,forgePos)
    local forgeCreated = world:createItemFromId(M.GLYPH_SHRINE_ID,1,forgePos,false,333,{craftedBy=user.name})
    forgeCreated.wear = 60
    world:changeItem(forgeCreated)
    user:learn(workingSkill, workingTime, 100)
end

local function endRitualPrepareRitual(user, forgePos, forgeItem)

    local workingSkill = M.SKILL_GLYPHING
    local workingTime = glyphRitualPrepareTime
    local candlePos
    local candleItem

    if not common.userHasItems(user, glyphRitualPrepareNecessaryItems) then

        common.InformNLS(user,
            "Um das Ritual erfolgreich abzuschließen, benötigst du zwei Kerzen und zwei Kerzenhalter.",
            "To prepare the ritual successfully you need two candles and two small candlesticks.")

        world:gfx(globalvar.gfxFIZZLE,forgePos)

        return
    end

    for i=1,2 do
        candlePos = common.getFreePos(forgeItem.pos, 1)
        candleItem = world:createItemFromId(ITEM_ID_BURNING_CANDLE,1,candlePos,false,333,{belongsTo="ritual"})
        candleItem.wear = 2
        world:changeItem(candleItem)
        world:gfx(globalvar.gfxSUN,candlePos)
    end

    user:eraseItem(ITEM_ID_CANDLES,2)
    user:eraseItem(ITEM_ID_CANDLEHOLDER,2)

    forgeItem:setData("lastPrepared", common.GetCurrentTimestamp())
    world:changeItem(forgeItem)

    user:learn(workingSkill, workingTime, 100)
    common.InformNLS(user,"Der Glyphen-Ritualplatz ist vorbereitet. Jetzt können hier Rituale durchgeführt werden.",
                          "The glyph ritual place is prepared. Now it is possible to perform rituals here.")
    if user:getQuestProgress(241) == 1 then
        user:setQuestProgress(241, 2)
    end
end

local function endRitualBreakGlyph(user, forgePos, item)

    local workingSkill = M.SKILL_GLYPHING
    local workingTime

    world:gfx(globalvar.gfxSPLASH,forgePos)
    workingTime = glyphs.getGlyphWorkingTime(item.id) / glyphRitualBreakTimePortion
    user:learn(workingSkill, workingTime, 100)

    local nominalCharges = glyphs.getNominalCharges(item)
    local maxCharges = nominalCharges * CHARGE_LOWER_RANGE + nominalCharges * CHARGE_RANGE
    local remainingCharges = glyphs.getRemainingGlyphs(item)
    local material = glyphs.getGlyphMaterial(item)

    local materialBonus = material - 1

    local skillBonus = math.max(0, - math.floor(user:getSkill(workingSkill) / 15) + 3)

    local returnedShards = math.min (7, math.random( math.floor(0.5 * remainingCharges / maxCharges * 7), math.floor(0.9 * remainingCharges / maxCharges * 7)) + materialBonus + skillBonus)

    local shardList = glyphs.getListOfShardsRequiredToGlyphTheItem(item.id)

    common.Shuffle(shardList)

    if returnedShards > 0 then

        for i=1, returnedShards do
            local shardId = shardList[i]
            common.CreateItem(user, shardId, 1, 999)
        end

        if returnedShards == 1 then
            common.InformNLS(user,"Du brichst die Glyphe aus folgendem Objet heraus: " .. common.getItemName(item, Player.german) .. ". Der Gegenstand zerbricht und dir bleibt ein Glyphensplitter.",
                                  "You break the glyph from the following object: " .. common.getItemName(item, Player.english) .. ". The item breaks and one shard remains.")
        else
            common.InformNLS(user,"Du brichst die Glyphe aus folgendem Objekt heraus: " .. common.getItemName(item, Player.german) .. ". Der Gegenstand zerbricht und dir bleiben " .. tostring(returnedShards) .. " Glyphensplitter.",
                                  "You break the glyph from the following object: " .. common.getItemName(item, Player.english) .. ". The item breaks and " .. tostring(returnedShards) .. " shards remain.")
        end
    else
        common.InformNLS(user,"Du brichst die Glyphe aus folgendem Objet heraus: " .. common.getItemName(item, Player.german) .. ". Der Gegenstand zerbricht und nichts bleibt zurück.",
                              "You break the glyph from the following object: " .. common.getItemName(item, Player.english) .. ". The item breaks and nothing remains.")
    end
    world:erase(item,item.number)
    if item.id == 79 or item.id == 3526 or item.id == 3528 then --amethyst amulets are used in the tutorial
        if user:getQuestProgress(241) == 5 then
            user:setQuestProgress(241, 6)
        end
    end
end

local function performRitual(user)
    local workingCycles = workingRitual[user.id][1]
    local deltaMana = workingRitual[user.id][2]
    local deltaFood = workingRitual[user.id][3]
    local workingPlace = workingRitual[user.id][4]
    local ritualId = workingRitual[user.id][5]
    local specialValues = workingRitual[user.id][6]
    user:performAnimation(globalvar.charAnimationSPELL)
    if user:increaseAttrib("mana", deltaMana) < 1 then
        common.InformNLS(user,"Dein Mana reicht nicht aus, um das Ritual abzuschließen.","You don't have sufficient mana to finish the ritual.")
        world:gfx(globalvar.gfxFIZZLE,workingPlace)
        workingRitual[user.id]=nil
        return
    end
    common.GetHungry(user,deltaFood)
    magic.wandDegrade(user)
    if workingCycles > 0 then
        local playGfx = workingGfx[math.random(1,#workingGfx)]
        if playGfx ~= 0 then
            world:gfx(playGfx,workingPlace)
        end
        workingCycles = workingCycles - 1
        workingRitual[user.id][1] = workingCycles
        user:startAction(WORKING_CYCLE_S * 10,globalvar.gfxCLAW,20,0,0)
    else
        if ritualId == RITUAL_GLYPHING then
            endRitualAddGlyph(user, workingPlace, specialValues)
        elseif ritualId == RITUAL_ERECT_FORGE then
            endRitualErectForge(user, workingPlace, specialValues)
        elseif ritualId == RITUAL_PREPARE_RITUAL then
            endRitualPrepareRitual(user, workingPlace, specialValues)
        elseif ritualId == RITUAL_BREAK_GLYPH then
            endRitualBreakGlyph(user, workingPlace, specialValues)
        end
        workingRitual[user.id]=nil
    end
end

local function startRitual(user, workingTime, manaConsumption, workingPlace, ritualId, specialValues)

    manaConsumption = magic.getValueWithGemBonus(user, manaConsumption)

    local workingFood = magic.neededFood(user, workingTime)

    if not common.FitForHardWork(user, workingFood) then
        return false
    end

    local workingCycles = math.max(1, math.floor(workingTime/ WORKING_CYCLES_DIV))

    if not magic.hasSufficientMana(user,manaConsumption) then
        common.InformNLS(user,"Dein Mana wird voraussichtlich nicht ausreichen, um das Ritual abzuschließen. Du wartest lieber noch etwas.",
                              "Most probably you don't have sufficient mana to finish the ritual successfully. Better you wait a moment.")
        return false
    end

    local deltaMana = - math.floor(manaConsumption / workingCycles)

    local deltaFood = math.floor(workingFood / workingCycles)

    workingRitual[user.id]={workingCycles, deltaMana, deltaFood, workingPlace, ritualId, specialValues}

    performRitual(user)

    if workingTime < 45 then
        common.InformNLS(user,"Das Ritual wird nicht allzu lange dauern.",
                                  "The ritual will take a few moments.")
    elseif workingTime < 100 then
        common.InformNLS(user,"Das Ritual wird einige Zeit in Anspruch nehmen.",
                                  "The ritual will take a while.")
    else
        common.InformNLS(user,"Das Ritual wird sehr lange deine ungeteilte Aufmerksamkeit beanspruchen.",
                                  "The ritual will take a your undivided attention for a very long time.")
    end
    return true
end

local function startRitualGlyphToItem(user, item)

    local workingTime = glyphs.getGlyphWorkingTime(item.id)

    local manaConsumption = (40 - 20 * glyphs.getSkillRequiredToGlyphTheItem(item.id) / 100) * MAX_MANA / 100

    local workingPlace = common.GetFrontPosition(user)

    local ritualId = RITUAL_GLYPHING

    local specialValues = item

    if startRitual(user, workingTime, manaConsumption, workingPlace, ritualId, specialValues) then
        common.InformNLS(user,"Du beginnst ein Ritual, um eine Glyphe in das Schmuckstück einzuarbeiten.",
                              "You start a ritual to work a glyph into the jewellery.")
    end
end

local function startRitualErectGlyphForge(user)
    local workingTime = glyphForgeErectionTime
    local manaConsumption = (20 - 10 * user:getSkill(M.SKILL_GLYPHING) / 100) * MAX_MANA / 100
    local workingPlace = common.GetFrontPosition(user)
    local ritualId = RITUAL_ERECT_FORGE
    local specialValues = nil

    if startRitual(user, workingTime, manaConsumption, workingPlace, ritualId, specialValues) then
        common.InformNLS(user,"Du beginnst ein Ritual, um einen Glyphen-Ritualplatz zu errichten.",
                              "You start a ritual to build a glyph ritual place.")
    end
end

local function startRitualPrepareGlyphRitual(user, forgeItem)
    local workingTime = glyphRitualPrepareTime
    local manaConsumption = (40 - 20 * user:getSkill(M.SKILL_GLYPHING) / 100) * MAX_MANA / 100
    local workingPlace = forgeItem.pos
    local ritualId = RITUAL_PREPARE_RITUAL
    local specialValues = forgeItem

    if startRitual(user, workingTime, manaConsumption, workingPlace, ritualId, specialValues) then
        common.InformNLS(user,"Du bereitest ein Ritual an einem einen Glyphen-Ritualplatz vor.",
                              "You prepare a ritual at a glyph ritual place.")
    end
end

local function startRitualBreakGlyph(user, item)
    local workingTime = glyphs.getGlyphWorkingTime(item.id) * glyphRitualBreakManaPortion
    local manaConsumption = (40 - 20 * glyphs.getSkillRequiredToGlyphTheItem(item.id) / 100) * MAX_MANA / 100 * glyphRitualBreakManaPortion
    local workingPlace = common.GetFrontPosition(user)
    local ritualId = RITUAL_BREAK_GLYPH
    local specialValues = item

    if startRitual(user, workingTime, manaConsumption, workingPlace, ritualId, specialValues) then
        common.InformNLS(user,"Du beginnst ein Ritual, um eine Glyphe aufzubrechen.",
                              "You start a ritual to break a glyph.")
    end
end

local function showShardStateDetail(user, ringOrAmulet, gemTypeNumber)

    local displayText

    local callback = function (dialog)
        return
    end

    local windowText

    local suffix = {german = "Amulette", english = "amulets"}

    if ringOrAmulet == "ring" then
        suffix = {german = "Ringe", english = "rings"}
    end

    windowText = common.GetNLS(user,
        "Verfügbare Splitter für " .. orderOfGem[gemTypeNumber][Player.german+1] .. " "..suffix.german..":",
        "Available shards for " .. orderOfGem[gemTypeNumber][Player.english+1] .. " "..suffix.english..":",
        callback)

    local commentText = common.GetNLS(user,"Ringe oder Amulette können nur dann mit Glyphen versehen werden, wenn alle Splitter vorhanden sind.",
                                           "Rings and amulets can be glyphed if all of the required shards are available.")

    local sd = SelectionDialog(windowText, commentText, callback)

    local listOfShardsRequired =  glyphs.getListOfShardsRequiredToGlyphItemViaGemTypeNumber(ringOrAmulet, gemTypeNumber)

    for _, shardId in ipairs(listOfShardsRequired) do

        if user:countItem(shardId) > 0 then
            displayText = common.GetNLS(user," (verfügbar)", " (available)")
        else
            displayText = common.GetNLS(user," (fehlt)", " (missing)")
        end

        local shardStats = world:getItemStatsFromId(shardId)

        displayText = common.GetNLS(user, shardStats.German..displayText, shardStats.English..displayText)

        sd:addOption(shardId, displayText)

    end

    sd:setCloseOnMove()
    user:requestSelectionDialog(sd)
end

function M.showShardState(user)

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index <= 7 then
            showShardStateDetail(user, "ring", index)
        else
            showShardStateDetail(user, "amulet", index-7)
        end
    end

    local windowText = common.GetNLS(user,"Verfügbare Splitter", "Available shards")

    local sd = SelectionDialog(windowText, "", callback)

    for i= 1, 7 do

        local ringId = glyphs.getJewelledItemBasedOnGemTypeNumber("ring", i)
        local amuletId = glyphs.getJewelledItemBasedOnGemTypeNumber("amulet", i)
        local requiredShardsForRing, shardsFoundRing = glyphs.playerHasRequiredShardsToGlyphTheItem(user, ringId)
        local requiredShardsForAmulet, shardsFoundAmulet = glyphs.playerHasRequiredShardsToGlyphTheItem(user, amuletId)
        local haveSet = common.GetNLS(user,"Vollständiger Satz!", "Complete set!")
        local lackingSet = common.GetNLS(user," Splitter fehlen!", " missing shards!")
        local lackingShardsAmulet = 7 - shardsFoundAmulet
        local lackingShardsRing = 7 - shardsFoundRing
        local ringDisplayText = common.GetNLS(user, orderOfGem[i][1] .. " Ringe: ", orderOfGem[i][2] .. " rings: ") .. shardsFoundRing .. common.GetNLS(user," Splitter (", " shards (")
        local amuletDisplayText = common.GetNLS(user, orderOfGem[i][1] .. " Amulette: ", orderOfGem[i][2] .. " amulets: ") .. shardsFoundAmulet .. common.GetNLS(user," Splitter (", " shards (")

        if requiredShardsForRing then
            ringDisplayText = ringDisplayText..haveSet..")"
        else
            ringDisplayText = ringDisplayText..lackingShardsRing..lackingSet..")"
        end

        if requiredShardsForAmulet then
            amuletDisplayText = amuletDisplayText..haveSet..")"
        else
            amuletDisplayText = amuletDisplayText..lackingShardsAmulet..lackingSet..")"
        end

        sd:addOption(ringId, ringDisplayText)
        sd:addOption(amuletId, amuletDisplayText)
    end

    sd:setCloseOnMove()
    user:requestSelectionDialog(sd)
end

local function addJewelleryToDialog(user, sd, jewelleryList, theJewellery, ringOrAmulet, forgeOrBreak)

    local displayText
    local skillReq = glyphs.getSkillRequiredToGlyphTheItem(theJewellery.id)
    if forgeOrBreak == "break" then
        skillReq = skillReq + 20
        if skillReq > 100 then
            skillReq = 100
        end
    end
    local hasSkill = user:getSkill(M.SKILL_GLYPHING) > skillReq
    local glyphed = glyphs.isGlyphed(theJewellery)
    local hasShards, shardAmount = glyphs.playerHasRequiredShardsToGlyphTheItem(user, theJewellery.id)

    if not hasSkill then
        displayText = common.GetNLS(user," (Skill nicht ausreichend)"," (Skill not sufficient)")
    elseif glyphed and forgeOrBreak == "forge" then
        displayText = common.GetNLS(user," (Glyphe bereits eingearbeitet)"," (Glyph forged already)")
    elseif glyphed and forgeOrBreak == "break" then
        displayText = common.GetNLS(user," (Glyphe zerstörbar)"," (Glyph can be destroyed)")
    elseif forgeOrBreak == "forge" and shardAmount == 6 then
        displayText = common.GetNLS(user," (1 Splitter fehlt)", " (1 shard missing)")
    elseif forgeOrBreak == "forge" and shardAmount < 6 then
        displayText = common.GetNLS(user," (" .. tostring(7 - shardAmount) .. " Splitter fehlen)",
        " (" .. tostring(7 - shardAmount) .. " shards missing)")
    elseif forgeOrBreak == "forge" and shardAmount == 7 then
        displayText = common.GetNLS(user," (Bearbeitbar)"," (Forgeable)")
    else
        displayText = common.GetNLS(user, " (Keine Glyphe eingearbeitet)", " (Contains no glyph)")
    end

    local data = {
        amuletOrRing = ringOrAmulet,
        item = theJewellery,
        skillMet = hasSkill,
        glyphed = glyphed,
        shardsOwned = hasShards
        }

    sd:addOption(theJewellery.id, common.GetNLS(user,common.getItemName(theJewellery, Player.german), common.getItemName(theJewellery, Player.english)) .. displayText )

    table.insert(jewelleryList, data)
end

local function showForgeBreakSelection(user, userRings, userAmulets, forgeOrBreak)

    local jewelleryList = {}

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        local selectedJewellery = jewelleryList[index]

        if not selectedJewellery.shardsOwned and forgeOrBreak == "forge" then
            showShardStateDetail(user, selectedJewellery.ringOrAmulet, glyphs.getGemTypeNumberFromJewelleryId(selectedJewellery.item))
        elseif selectedJewellery.glyphed and forgeOrBreak == "forge" then
            common.InformNLS(user,
                "Diese Gegenstand kann keine zweite Glyphe aufnehmen: " .. common.getItemName(selectedJewellery.item, Player.german),
                "This object cannot take a second glyph: " ..common.getItemName(selectedJewellery.item, Player.english))
        elseif not selectedJewellery.glyphed and forgeOrBreak == "break" then
            common.InformNLS(user,
                "Das Item "..common.getItemName(selectedJewellery.item, Player.german) .. " beinhaltet noch keine Glyphe.",
                "The item "..common.getItemName(selectedJewellery.item, Player.english) .. " doesn't have a glyph.")
        elseif not selectedJewellery.skillMet then
            if forgeOrBreak == "forge" then
                common.InformNLS(user,
                    "Deine Fähigkeiten reichen nicht aus um diesen Gegenstand mit einer Glyphe zu versehen: " ..common.getItemName(selectedJewellery.item, Player.german),
                    "Your skill is not sufficient to add a glyph to this object: "..common.getItemName(selectedJewellery.item, Player.english))
            else
                common.InformNLS(user,
                    "Deine Fähigkeiten reichen nicht aus um diesen Gegenstand zu zerstören: " ..common.getItemName(selectedJewellery.item, Player.german),
                    "Your skill is not sufficient to destroy this item: "..common.getItemName(selectedJewellery.item, Player.english))
            end
        elseif forgeOrBreak == "forge" then
            startRitualGlyphToItem(user, selectedJewellery.item)
        elseif forgeOrBreak == "break" then
            startRitualBreakGlyph(user, selectedJewellery.item)
        end
    end

    local windowText = common.GetNLS(user,"Ringe und Amulette", "Rings and amulets")

    local commentText = common.GetNLS(user,"Wähle einen Gegenstand aus, das alle Voraussetzungen erfüllt, um mit einer Glyphe versehen zu werden.",
                                           "Please select an item that should get a glyph.\nAll preconditions must be fulfilled")

    if forgeOrBreak == "break" then
        commentText = common.GetNLS(user,"Wähle einen Gegenstand aus, den du zerstören willst, um einige der Splitter wiederzubekommen.",
        "Please select an item that is to be destroyed to get back some of the shards.")
    end

    local sd = SelectionDialog(windowText, commentText, callback)

    for _, ring in ipairs(userRings) do

        addJewelleryToDialog(user, sd, jewelleryList, ring, "ring", forgeOrBreak)

    end

    for _, amulet in ipairs(userAmulets) do

        addJewelleryToDialog(user, sd, jewelleryList, amulet, "amulet", forgeOrBreak)

    end

    sd:setCloseOnMove()

    user:requestSelectionDialog(sd)

end

function M.forgeGlyphs(user, glyphForgeItem, ltstate)

    local isMage = user:getMagicType() == 0 and (user:getQuestProgress(37) ~= 0 or user:getMagicFlags(0) > 0)

    if not isMage then
        common.InformNLS(user,"Dieser Ritualplatz ist voll mit Symbolen, die dir nichts sagen. Du entschließt dich hier nichts zu verändern und zählst die Splitter in deiner Tasche.",
                              "This ritual place is covered in symbols that mean nothing to you. You decide not to change anything here and count the shards in your bag.")
        M.showShardState(user)
        return
    end

    if ltstate == Action.none then

        if glyphForgeItem.wear < 3 then
            common.InformNLS(user,
                "Dieser Glyphen-Ritualplatz zeigt schon deutliche Zeichen des Verfalls. Vergeude deine Zeit nicht hier.",
                "This glyph ritual place already shows signs of decay. Do not waste your time here.")
            return
        end

        if not M.checkForgeIsReady(glyphForgeItem) then
            common.InformNLS(user,
                "Hier ist noch nichts vorbereitet. Vielleicht solltest du damit beginnen.",
                "Nothing is prepared. You should arrange everything for a successful ritual.")
            return
        end

        local tableOfRings, tableOfAmulets = glyphs.hasRingOrAmulet(user)

        local userRings = #tableOfRings
        local userAmulets = #tableOfAmulets

        common.TurnTo(user, glyphForgeItem.pos)

        if userRings == 0 and userAmulets == 0 then
            common.InformNLS(user,
                "Du hast keinen Ring und kein Amulett. Nimm den Gegenstand, den du glyphen willst, in die Hand oder in den Gürtel.",
                "You don't have a ring or amulet. The item you want to glyph has to be in your hand or your belt.")
                M.showShardState(user)
        else
            showForgeBreakSelection(user, tableOfRings, tableOfAmulets, "forge")
        end

    elseif ltstate == Action.success then

        performRitual(user)

    elseif ltstate == Action.abort then

        common.InformNLS(user,"Du brichst das Ritual ab.","You interrupt the ritual.")

        world:gfx(globalvar.gfxFIZZLE,user.pos)

        workingRitual[user.id]=nil

    end
end

function M.breakGlyphs(user,glyphForgeItem,ltstate)

    if ltstate == Action.none then

        if glyphForgeItem.wear < 3 then
            common.InformNLS(user,"Dieser Glyphen-Ritualplatz zeigt schon deutliche Zeichen des Verfalls. Vergeude deine Zeit nicht hier.",
                                  "This glyph ritual place already shows signs of decay. Do not waste your time here.")
            return
        end

        if not M.checkForgeIsReady(glyphForgeItem) then
            common.InformNLS(user,"Hier ist noch nichts vorbereitet. Vielleicht solltest du damit beginnen.",
                                  "Nothing is prepared. You should arrange everything for a successful ritual.")
            return
        end

        local userRings, userAmulets = glyphs.hasRingOrAmulet(user)

        common.TurnTo(user,glyphForgeItem.pos)

        if #userRings == 0 and #userAmulets == 0 then
            common.InformNLS(user,"Du hast keinen Ring und kein Amulett. Nimm den Gegenstand, den du zerstören willst, in die Hand oder in den Gürtel.",
                                  "You don't have a ring or amulet. The item you want to destroy has to be in your hand or your belt.")
        else
            showForgeBreakSelection(user, userRings, userAmulets, "break")
        end

    elseif ltstate == Action.success then

        performRitual(user)

    elseif ltstate == Action.abort then

        common.InformNLS(user,"Du brichst das Ritual ab.","You interrupt the ritual.")
        world:gfx(globalvar.gfxFIZZLE,user.pos)
        workingRitual[user.id]=nil
    end
end

local function isPossibleLocation(user, position)
    local permittedTiles = {common.GroundType.forest, common.GroundType.sand, common.GroundType.grass}
    local freeViewAxis = {{2,-2,0},{1,-1,0},{0,0,0},{-1,1,0},{-2,2,0}}
    -- Exclude triggerfields
    if triggerfield.isTriggerfield(position) then
        common.InformNLS(user,"Die Magie dieses Ortes verindert das Aufstellen des Glyphen-Ritualplatzes.",
                              "The magic of this location prevents you from building a glyph ritual place.")
        return false
    end

    local theField = world:getField(position)
    if not common.isInList(common.GetGroundType(theField:tile()),permittedTiles) then
        common.InformNLS(user,"Dieser Boden eignet sich nicht für das Aufstellen des Glyphen-Ritualplatzes.",
                              "This ground is not good for building a glyph ritual place.")
        return false
    end

    -- Empty field
    if theField:countItems() > 0 then
        common.InformNLS(user,"Hier ist nicht genügend Platz für einen Glyphen-Ritualplatz.",
                              "There is not enough space for a glyph ritual place.")
        return false
    end

    -- Access and no blocking items in view axis
    if common.getNumberOfPassableFieldsInArea(user.pos, 1) < 9 or common.getNumberOfPassableFieldsFromList(position, freeViewAxis) < #freeViewAxis then
        common.InformNLS(user,"Hier ist nicht genügend Platz für einen Glyphen-Ritualplatz.",
                              "There is not enough space for a glyph ritual place.")
        return false
    end

    -- not level 0
    if user.pos.z ~= 0 then
        common.InformNLS(user,"Nur die Götter wissen, was an diesem Platz nicht stimmt. Probier es doch auf der Oberfläche Illarions.",
                              "Only the gods know what is wrong in this place. Try it on the surface of Illarion.")
        return false
    end

    return true
end

function M.findGlyphForge(user)
    user:performAnimation(globalvar.charAnimationSPELL)
    local forgeItem = common.GetItemInArea(user.pos, M.GLYPH_SHRINE_ID, 60, true)
    if forgeItem ~= nil then
        world:gfx(globalvar.gfxSUN,forgeItem.pos)
        local directionInfo = common.getDistanceHint(user, forgeItem.pos)
        local textDirection = common.GetNLS(user,"Möglicherweise befindet sich " .. directionInfo.distance.de .. " im " .. directionInfo.direction.de .. " ein Glyphen-Ritualplatz.",
                                                 "There might be a glyph ritual place " .. directionInfo.distance.en .. " in the " .. directionInfo.direction.en .. ".")

        if user:getQuestProgress(562) == 0 and user:getSkill(M.SKILL_GLYPHING) <= glyphForgeFindMaxSkill then
            local nextLearn = math.random(1,2)
            user:setQuestProgress(562,nextLearn)
            user:learn(M.SKILL_GLYPHING, glyphForgeFindTime, 100)
            common.InformNLS(user,textDirection .. " Seine Magie zieht dich an und doch kannst du dich für einen Moment nicht bewegen.",
                                  textDirection .. " The magic attracts you but for a moment you are unable to move.")
            common.ParalyseCharacter(user, glyphForgeFindTime)
        else
            common.InformNLS(user,textDirection .. " Vielleicht kannst du ihn bereits sehen?",
                                  textDirection .. " Maybe you can see it already?")
        end
        return true
    end
    return false
end

function M.examineGlyphForge(user, glyphForge)
    if glyphForge.wear < 3 then
        common.InformNLS(user, "Die Steine bröckeln. Die Magie des Ortes scheint fast völlig verschwunden.",
                               "The stones start to crumble and the magic of the place seems to have almost completely disappeared.")
    elseif M.checkForgeIsReady(glyphForge) then
        common.InformNLS(user, "Das Ritual ist bereits vorbereitet. You kannst gleich beginnen.",
                               "A ritual is already prepared. You can start right now.")
    end
end

function M.placeGlyphForge(user, ltstate)
    if ltstate == Action.none then
        if M.findGlyphForge(user) then
            return
        end
        local position = common.GetFrontPosition(user)
        if  user:getSkill(M.SKILL_GLYPHING) < M.glyphForgeErectionMinSkill then
            common.InformNLS(user,"Deine Fähigkeiten reichen nicht aus, um das Ritual durchzuführen.",
                                  "Your skills are not sufficient to perform the ritual.")
            return
        end
        if isPossibleLocation(user, position) then
            startRitualErectGlyphForge(user)
        end
    elseif ltstate == Action.success then
        performRitual(user)
    elseif ltstate == Action.abort then
        common.InformNLS(user,"Du brichst das Ritual ab.","You interrupt the ritual.")
        world:gfx(globalvar.gfxFIZZLE,user.pos)
        workingRitual[user.id]=nil
    end
end

function M.prepareGlyphRitual(user, ltstate)
    if ltstate == Action.none then
        local forgeItem = common.GetItemInArea(user.pos, M.GLYPH_SHRINE_ID, 1, true)
        if forgeItem == nil then
            M.findGlyphForge(user)
            return
        end
        common.TurnTo(user, forgeItem.pos )
        if forgeItem.wear < 3 then
            common.InformNLS(user,"Dieser Glyphen-Ritualplatz zeigt schon deutliche Zeichen des Verfalls. Vergeude deine Zeit nicht hier.",
                                  "This glyph ritual place already shows signs of decay. Do not waste your time here.")
            return
        end
        if M.checkForgeIsReady(forgeItem) then
            common.InformNLS(user,"Hier ist bereits alles vorbereitet. Du kannst nichts mehr tun.",
                                  "Everything is prepared already, there is nothing left to do.")
            return
        end
        if not common.userHasItems(user, glyphRitualPrepareNecessaryItems) then
            common.InformNLS(user,"Um das Ritual vorzubereiten, benötigst du zwei Kerzen und zwei Kerzenhalter.",
                                  "To prepare the ritual you need two candles and two small candlesticks.")
            return
        end

        if  user:getSkill(M.SKILL_GLYPHING) >= M.glyphRitualPrepareMinSkill then
            startRitualPrepareGlyphRitual(user, forgeItem)
        else
            common.InformNLS(user,"Deine Fähigkeiten reichen nicht aus, um das Ritual durchzuführen.",
                                  "Your skills are not sufficient to perform the ritual.")
            return
        end
    elseif ltstate == Action.success then
        performRitual(user)
    elseif ltstate == Action.abort then
        common.InformNLS(user,"Du brichst das Ritual ab.","You interrupt the ritual.")
        world:gfx(globalvar.gfxFIZZLE,user.pos)
        workingRitual[user.id]=nil
    end
end

function M.removeGlyphForge(user)
    -- returns false if no glyph forge
    local forgeItem = common.GetFrontItem(user,user:getFaceTo())
    if forgeItem ~= nil and forgeItem.id == M.GLYPH_SHRINE_ID then
        local userSkill = user:getSkill(Character.mining)
        local limitSkill --wear 3=0, 43=100 max wear=60
        if forgeItem.wear < 3 then
            limitSkill = 0
        else
            limitSkill = math.floor((forgeItem.wear - 3) * 100 / 40)
        end
        if userSkill > limitSkill then
            local playerInSight = world:getPlayersInRangeOf(forgeItem.pos,1)
            if #playerInSight > 1 then
                common.InformNLS(user,"Du hältst inne, weil noch jemand neben dem Glyphen-Ritualplatz steht.",
                                      "You stop since somebody else stands next to the glyph ritual place.")
            else
                world:gfx(globalvar.gfxFALL,forgeItem.pos)
                user:setQuestProgress(562, forgeItem.wear)
                world:erase(forgeItem, 1)
            end
        else
            common.InformNLS(user,"Die Magie des Ortes lässt die Spitzhacke zurückspringen. Vielleicht gelingt es dir den Glyphen-Ritualplatz zu beseitigen, wenn du noch etwas wartest.",
                                  "The magic of the place deflects your pickaxe. You may have to wait some time to succeed in destroying this glyph ritual place.")
        end
        return true
    else
        return false
    end
end

return M
