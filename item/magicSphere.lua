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
local texts = require("magic.arcane.base.texts")
local teaching = require("magic.arcane.teaching")
local runes = require("magic.arcane.runes")
local increaseArea = require("magic.arcane.harvestFruit")

local M = {}

local function bhonaMessageDialogue(user, germanText, englishText)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, germanText, englishText), callback)

    user:requestMessageDialog(dialog)
end

function M.bhonaInfo(user, sourceItem)

    for _, location in pairs(texts.bhonaPuzzle.locations) do
        if location.location == sourceItem.pos then
            if user:getQuestProgress(7019) < location.before  then
                bhonaMessageDialogue(user, texts.bhonaPuzzle.gibberish.german, texts.bhonaPuzzle.gibberish.english)
            else
                bhonaMessageDialogue(user, location.german, location.english)
                if user:getQuestProgress(7019) == location.before then
                    user:setQuestProgress(7019, location.after)
                end
            end
        end
    end
end

local peraLevers = {
    {id = 1, location = position(395, 138, 0)},
    {id = 2, location = position(429, 219, 0)}
}

function M.peraPuzzle(user, sourceItem)

    local leverPulled

    for _, lever in pairs(peraLevers) do
        if lever.location == sourceItem.pos then
            leverPulled = lever.id
        end
    end

    local lever1 = 436
    local lever2 = 434
    local lever3 = 437
    local lever4 = 439

    if leverPulled then
        local newLeverId

        if sourceItem.id == lever1 then
            newLeverId = lever2
        elseif sourceItem.id == lever2 then
            newLeverId = lever1
        elseif sourceItem.id == lever3 then
            newLeverId = lever4
        elseif sourceItem.id == lever4 then
            newLeverId = lever3
        end
        sourceItem.id = newLeverId
        world:changeItem(sourceItem)
    end

    if leverPulled then
        local otherLever

        if leverPulled == 1 then
            otherLever = 2
        else
            otherLever = 1
        end

        local setTime = true

        if M[user.name.."lever"..otherLever] then

            local timer = 40

            local time = tonumber(world:getTime("unix"))
            local timePulled = tonumber(M[user.name.."lever"..otherLever])
            local timeCheck = time < timePulled+timer

            if timeCheck then
                setTime = false
            else
                user:inform(texts.peraPuzzle.slow.german, texts.peraPuzzle.slow.english)
                M[user.name.."lever"..otherLever] = false
                M[user.name.."lever"..leverPulled] = false
            end
        else
            user:inform(texts.peraPuzzle.pulled.german, texts.peraPuzzle.pulled.english)
        end

        if setTime then
            M[user.name.."lever"..leverPulled] = tonumber(world:getTime("unix"))
        end

        if not setTime then
            user:inform(texts.peraPuzzle.fast.german, texts.peraPuzzle.fast.english)
            user:setQuestProgress(7018, 1)
        end
    end
end

local function passedPeraPuzzle(user)

    if user:getQuestProgress(7018) == 1 then
        return true
    else
        return false
    end
end

function M.peraInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.peraPuzzle.german, texts.peraPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function passesOrlPuzzle(user)
    local monsters = world:getMonstersInRangeOf(user.pos, 5)

    local spiderCount = 0

    local spidersNeeded = 8

    for _, monster in pairs(monsters) do
        if monster:getRace() == Character.spider then
            spiderCount = spiderCount+1
        end
    end

    if spiderCount == spidersNeeded then
        return true
    end

    return false
end

function M.orlInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.orlPuzzle.german, texts.orlPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local mesLamps = {
    position(526, 608, 1),
    position(538, 613, 1),
    position(532, 615, 1),
    position(533, 605, 1),
    position(527, 609, 0),
    position(536, 609, 0),
    position(536, 618, 0)
}

local function checkMesPuzzle()

    local lampOff = 395

    for _, location in pairs(mesLamps) do
        local field = world:getField(location)
        local itemsOnField = field:countItems()
        local topItem = field:getStackItem(itemsOnField-1)
        if topItem.id == lampOff then
            return false
        end
    end

    return true
end

function M.mesInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.mesPuzzle.german, texts.mesPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end


local levStatues = {
    {location = position(192, 803, -3), reset = 440, correct = 443, rotation = {440, 441, 442, 443}},
    {location = position(192, 807, -3), reset = 695, correct = 693, rotation = {692, 694, 693, 695}},
    {location = position(192, 811, -3), reset = 693, correct = 692, rotation = {692, 693}},
    {location = position(192, 816, -3), reset = 442, correct = 272, rotation = {692, 694, 442, 272}}
}

function M.changeStatue(user, sourceItem)

    local newStatue

    for _, statue in pairs(levStatues) do
        if statue.location == sourceItem.pos then
            for i = 1, #statue.rotation do
                if statue.rotation[i] == sourceItem.id then
                    if i == #statue.rotation then
                        newStatue = statue.rotation[1]
                        break
                    else
                        newStatue = statue.rotation[i+1]
                        break
                    end
                end
            end
            break
        end
    end

    if newStatue then
        sourceItem.id = newStatue
        world:changeItem(sourceItem)
    end

end

local function passesLevPuzzle()

    local correctStatues = 0

    for _, statue in pairs(levStatues) do
        local field = world:getField(statue.location)
        local itemsOnField = field:countItems()
        local topItem = field:getStackItem(itemsOnField-1)
        if topItem.id == statue.correct then
            correctStatues = correctStatues+1
        end
    end

    if correctStatues == 4 then
        return true
    end

    return false

end

local function resetLevPuzzle()

    for _, statue in pairs(levStatues) do
        local field = world:getField(statue.location)
        local itemsOnField = field:countItems()
        local topItem = field:getStackItem(itemsOnField-1)
        if topItem.id == statue.correct then
            topItem.id = statue.reset
            world:changeItem(topItem)
        end
    end
end

function M.kelInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.kelPuzzle.german, texts.kelPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.kahInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.kahPuzzle.german, texts.kahPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function kahPuzzleSolved()

    local platePos1 = position(793, 803, 0)
    local platePos2 = position(793, 804, 0)
    local platePos3 = position(793, 805, 0)
    local field1 = world:getField(platePos1)
    local field2 = world:getField(platePos2)
    local field3 = world:getField(platePos3)
    local itemsOnField1 = field1:countItems()
    local itemsOnField2 = field2:countItems()
    local itemsOnField3 = field3:countItems()
    local currentItem
    local supper = false
    local dinner = false
    local breakfast = false
    local soup = Item.mushroomSoup
    local dish = Item.venisonDish
    local sandwich = Item.eggSaladSandwich

    for i = 0, itemsOnField1 - 1 do
        currentItem = field1:getStackItem(i)
        if currentItem.id == soup then
            supper = true
            break
        elseif currentItem.id == dish then
            dinner = true
            break
        elseif currentItem.id == sandwich then
            breakfast = true
            break
        end
    end

    for i = 0, itemsOnField2 - 1 do
        currentItem = field2:getStackItem(i)
        if currentItem.id == soup then
            supper = true
            break
        elseif currentItem.id == dish then
            dinner = true
            break
        elseif currentItem.id == sandwich then
            breakfast = true
            break
        end
    end

    for i = 0, itemsOnField3 - 1 do
        currentItem = field3:getStackItem(i)
        if currentItem.id == soup then
            supper = true
            break
        elseif currentItem.id == dish then
            dinner = true
            break
        elseif currentItem.id == sandwich then
            breakfast = true
            break
        end
    end


    if breakfast and dinner and supper then
        return true
    end

    return false

end

function M.iraInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.iraPuzzle.german, texts.iraPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.checkIraPosition(user)

    local penPosition = position(473, 746, -3)

    local distance = 10

    local biggerX =  user.pos.x > penPosition.x + distance
    local smallerX = user.pos.x < penPosition.x - distance
    local biggerY =  user.pos.y > penPosition.y + distance
    local smallerY = user.pos.y < penPosition.y - distance

    if user.pos.z ~= penPosition.z then
        return false
    end

    if biggerX or smallerX or biggerY or smallerY then
        return false
    end

    return true

end

local function heptPuzzleSolved()

    local mainPos = position(266, 375, 1)
    local positionsToCheck = increaseArea.increaseArea(mainPos)
    local fireFound = false

    for _, currentPos in pairs(positionsToCheck) do
        local field = world:getField(currentPos.position)
        local itemsOnField = field:countItems()
        local currentItem
        local campfire = Item.campFire

        for i = 0, itemsOnField-1 do
            currentItem = field:getStackItem(i)
            if currentItem.id == campfire then
                fireFound = true
                break
            end
        end
    end

    return fireFound
end

function M.heptInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.heptPuzzle.german, texts.heptPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function fhenPuzzleSolved()

    local platePos = position(735, 317, 0)
    local field = world:getField(platePos)
    local itemsOnField = field:countItems()
    local currentItem
    local beerFound = false
    local wineFound = false
    local beer = Item.beerMug
    local wine = Item.bottleOfElvenWine

    for i = 0, itemsOnField-1 do
        currentItem = field:getStackItem(i)
        if currentItem.id == wine then
            wineFound = true
        elseif currentItem.id == beer then
            beerFound = true
        end
        if beerFound and wineFound then
            return true
        end
    end

    return false

end

function M.fhenInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.fhenPuzzle.german, texts.fhenPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function fhanPuzzleSolved()

    local puzzle = {
        {solution = Item.chickenDish, solution2 = Item.chickenSoup, location = position(598, 321, 3)},
        {solution = Item.drowSword, solution2 = Item.drowBlade, location = position(598, 317, 3)},
        {solution = Item.pureFire, location = position(592, 317, 3)},
        {solution = Item.stone, location = position(592, 321, 3)},
    }

    local solved = 0

    for _, segment in pairs(puzzle) do

        local field = world:getField(segment.location)
        local itemsOnField = field:countItems()
        local currentitem

        for i= 0, itemsOnField-1 do --from lowest to highest item in stack
            currentitem = field:getStackItem(i)
            local solution2 = 488 --just a random impossible item

            if segment.solution2 then
                solution2 = segment.solution2
            end

            if currentitem.id == segment.solution or currentitem.id == solution2 then
                solved = solved+1
                break
            end
        end
    end

    if solved == 4 then
        solved = true
    else
        solved = false
    end

    return solved
end

function M.fhanInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.fhanPuzzle.german, texts.fhanPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function dunRequirementCheck(user)

    local mainPos = position(354, 454, 0)
    local pos1 = position(mainPos.x+1, mainPos.y+1, 0)
    local pos2 = position(mainPos.x-1, mainPos.y-1, 0)
    local pos3 = position(mainPos.x+1, mainPos.y-1, 0)
    local pos4 = position(mainPos.x-1, mainPos.y+1, 0)

    local locations1 = increaseArea.increaseArea(pos1)
    local locations2 = increaseArea.increaseArea(pos2)
    local locations3 = increaseArea.increaseArea(pos3)
    local locations4 = increaseArea.increaseArea(pos4)

    for _, location in pairs(locations1) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    for _, location in pairs(locations2) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    for _, location in pairs(locations3) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    for _, location in pairs(locations4) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    return true

end

function M.dunInfo(user)

    local orcish =  user:getSkill(Character["orcLanguage"])


    local callback = function(dialog)
    end

    local english
    local german

    if orcish >= 80 then
        english = texts.dunPuzzle.english
        german = texts.dunPuzzle.german
    else
        english = texts.dunPuzzle.orcish.english
        german = texts.dunPuzzle.orcish.german
    end

    local dialog = MessageDialog("", common.GetNLS(user, german, english), callback)
    user:requestMessageDialog(dialog)

end

local function anthResult(user, answer)

    local status

    if answer == 1332 then
        status = "success"
        ScriptVars:set("anthActivate", 1)
        ScriptVars:save()
    else
        status = "wrong"
    end

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.anthPuzzle[status].german, texts.anthPuzzle[status].english), callback)

    user:requestMessageDialog(dialog)
end

function M.anthInfo(user, item)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()
        anthResult(user, tonumber(input))

    end

    local dialog = InputDialog("", common.GetNLS(user, texts.anthPuzzle.main.german, texts.anthPuzzle.main.english), false, 255, callback)

    user:requestInputDialog(dialog)

end

function M.checkPenPosition(user)

    local penPosition = position(794, 128, 0)

    local distance = 15

    local biggerX =  user.pos.x > penPosition.x + distance
    local smallerX = user.pos.x < penPosition.x - distance
    local biggerY =  user.pos.y > penPosition.y + distance
    local smallerY = user.pos.y < penPosition.y - distance

    if biggerX or smallerX or biggerY or smallerY then
        return false
    end

    return true

end

function M.penInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, texts.penPuzzle.german, texts.penPuzzle.english), callback)

    user:requestMessageDialog(dialog)
end

local function getRune(item)
    for _, rune in pairs(texts.runeHintsBookTexts) do
        if rune.location then
            if rune.location == item.pos then
                return rune
            end
        end
    end
    return false
end

local function learnRune(user, rune)

    teaching.checkForExpiredCooldowns(user)

    local runeNumber = runes.runeNameToNumber(rune)
    local levelCheck = teaching.levelRequirementNotMet(user, runeNumber)
    local statCheck = teaching.statRequirementNotMet(user, runeNumber)
    local notMage = teaching.notAMage(user)
    local knowsRune = runes.checkIfLearnedRune(user, false, runeNumber, "isQuest")

    if notMage then
        user:inform(texts.runeHintsBookTexts.notMage.german, texts.runeHintsBookTexts.notMage.english)
        return
    end

    if knowsRune then
        user:inform(texts.runeHintsBookTexts.alreadyKnows.german, texts.runeHintsBookTexts.alreadyKnows.english)
        return
    end

    if levelCheck or statCheck then
        user:inform(texts.runeHintsBookTexts.notMetCriteria.german, texts.runeHintsBookTexts.notMetCriteria.english)
        return
    end

    if teaching.notEnoughTimeHasPassed(user) then
        user:inform(texts.runeHintsBookTexts.cooldown.german, texts.runeHintsBookTexts.cooldown.english)
        return
    end
    runes.learnRune(user,"", runeNumber, "isQuest")
    teaching.setLearningCooldown(user)
    user:inform(texts.runeHintsBookTexts.learned.german..rune, texts.runeHintsBookTexts.learned.english..rune)
end

local function lightSphere(user, item, lit)
    local newItemId

    if lit then
        newItemId = 3501
    else
        newItemId = 3499
    end
    world:erase(item, item.number)
    world:createItemFromId(newItemId, 1, item.pos, true, 999, {})
end

local portalLocations = {
    {destination = position(342, 150, 1), origin = position(411, 159, 1), lever = position(409, 158, 1)},
    {destination = position(410, 159, 1), origin = position(343, 151, 1), lever = position(343, 150, 1)},
    {destination = position(410, 159, 1), origin = position(337, 161, 1), lever = position(337, 160, 1)},
    {destination = position(855, 242, -3), origin = position(749, 321, 0), lever = position(750, 321, 0)},
    {destination = position(749, 322, 0), origin = position(856, 242, -3), lever = position(855, 243, -3)},
    {destination = position(181, 809, -3), origin = position(230, 711, 0), lever = position(229, 711, 0)},
    {destination = position(230, 712, 0), origin = position(180, 809, -3), lever = position(180, 808, -3)}
}

local function createPortal(user, portalPos)

    for _, location in pairs(portalLocations) do
        if location.origin == portalPos then
            local field = world:getField(portalPos)
            local itemsOnField = field:countItems()
            local topItem = field:getStackItem(itemsOnField-1)
            if topItem.id ~= 10 then
                local destination = location.destination
                world:makeSound(13, destination)
                local thePortal = world:createItemFromId(10, 1, portalPos, true, 999, {destinationCoordsZ = destination.z, destinationCoordsY = destination.y, destinationCoordsX = destination.x})
                thePortal.wear = 3
                world:changeItem(thePortal)
            elseif topItem.id == 10 then
                world:erase(topItem, 1)
            end
            break
        end
    end
end

function M.useLever(user, lever)

    local lever1 = 436
    local lever2 = 434
    local lever3 = 437
    local lever4 = 439

    for  _, currentLever in pairs(portalLocations)  do
        if currentLever.lever == lever.pos then
            createPortal(user, currentLever.origin)
            local newLeverId = 0

            if lever.id == lever1 then
                newLeverId = lever2
            elseif lever.id == lever2 then
                newLeverId = lever1
            elseif lever.id == lever3 then
                newLeverId = lever4
            elseif lever.id == lever4 then
                newLeverId = lever3
            end
            lever.id = newLeverId
            world:changeItem(lever)
        end
    end
end

function M.leverPosCheck(lever)

    for  _, currentLever in pairs(portalLocations) do
        if currentLever.lever == lever.pos then
            return true
        end
    end

    return false

end

local function cunPuzzleSolved()

    local waterItems = {52, 1841, 1854, 1855, 2058, 2186, 2496, 2554}
    local solved = false
    local platePos = position(628, 598, 0)
    local field = world:getField(platePos)
    local itemsOnField = field:countItems()
    local currentitem

    for i= 0, itemsOnField-1 do --from lowest to highest item in stack
        currentitem = field:getStackItem(i)
        for _, water in pairs(waterItems) do
            if currentitem.id == water then
                solved = true
                break
            end
        end
    end

    return solved
end

local function checkIfCriteriaMet(user, rune)

    local retVal = false

    if rune == "CUN" then
        if cunPuzzleSolved() then
            retVal = true
        end
    elseif rune == "PEN" then
        if M.penActivate then
            M.penActivate = false
            retVal = true
        end
    elseif rune == "Anth" then
        local success, anthActivate = ScriptVars:find("anthActivate")
        if success then
            if tonumber(anthActivate) == 1 then
                ScriptVars:set("anthActivate", 0)
                ScriptVars:save()
                retVal = true
            end
        end
    elseif rune == "Dun" then
        if dunRequirementCheck(user) then
            retVal = true
        end
    elseif rune == "Fhan" then
        if fhanPuzzleSolved() then
            retVal = true
        end
    elseif rune == "Fhen" then
        if fhenPuzzleSolved() then
            retVal = true
        end
    elseif rune == "Hept" then
        if heptPuzzleSolved() then
            retVal = true
        end
    elseif rune == "Ira" then
        if M.iraActivate then
            M.iraActivate = false
            retVal = true
        end
    elseif rune == "Kah" then
        if kahPuzzleSolved() then
            retVal = true
        end
    elseif rune == "Kel" then
        if user:getQuestProgress(7017) == 1 then
            retVal = true
            user:setQuestProgress(7017, 0)
        end
    elseif rune == "Lev" then
        if passesLevPuzzle() then
            resetLevPuzzle()
            retVal = true
        end
    elseif rune == "Mes" then
        if checkMesPuzzle() then
            retVal = true
        end
    elseif rune == "Orl" then
        if passesOrlPuzzle(user) then
            retVal = true
        end
    elseif rune == "Pera" then
        if passedPeraPuzzle(user) then
            retVal = true
        end
    elseif rune == "BHONA" then
        if user:getQuestProgress(7019) == 18 then
            retVal = true
        end
    else --Any remaining puzzles will only require you to find, get to and use the sphere to activate it
        retVal = true
    end

    if retVal then
        user:inform(texts.runeHintsBookTexts.activated.german, texts.runeHintsBookTexts.activated.english)
    end

    return retVal
end

function M.LookAtItem(user, item)

    local lookAt = lookat.GenerateLookAt(user, item)

    local rune = getRune(item)

    if rune then
        if item.id == 3501 then
            lookAt.name= common.GetNLS(user, rune.name.german , rune.name.english )
            lookAt.description = common.GetNLS(user, rune.description.german, rune.description.english)
        else
            lookAt.name = common.GetNLS(user, texts.runeHintsBookTexts.unlitSphere.german, texts.runeHintsBookTexts.unlitSphere.english)
        end
    end


    return lookAt
end

function M.UseItem(user, item)

    local rune = getRune(item)

    if rune then
        if item.id == 3501 then
            learnRune(user, rune.rune)
            lightSphere(user, item, false)
        elseif item.id == 3499 then
            if checkIfCriteriaMet(user, rune.rune) then
                lightSphere(user, item, true)
            else
                user:inform(texts.runeHintsBookTexts.unsolved.german, texts.runeHintsBookTexts.unsolved.english)
            end
        end
    end

end

return M
