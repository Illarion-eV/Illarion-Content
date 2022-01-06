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
local texts = require("magic.arcane.base.texts")
local magic = require("base.magic")
local spiritlocation = require("magic.arcane.spirit.location")
local skilling = require("magic.arcane.skilling")
local antiTroll = require("magic.arcane.base.antiTroll")

local M = {}

local castTexts = texts.castSpellTexts
local portalSpots = texts.portalSpots
local myTexts = texts.spatialTexts

function M.attunedSpotsToQuestprogress(attunedSpots)
    if attunedSpots < 2^31 then
        return attunedSpots
    else
        return 2^31- 1 - attunedSpots
    end
end

function M.QuestprogressToAttunedSpots(questprogress)
    if tonumber(questprogress)<0 then
        return 2^31-1-tonumber(questprogress)
    else
        return tonumber(questprogress)
    end
end

function M.spotAttuned(user, spotNumber)
    local attunedSpots = M.QuestprogressToAttunedSpots(user:getQuestProgress(7008))
    local retVal = false
    local offset = math.fmod(spotNumber-1,32)

    if bit32.btest(bit32.lshift(1, offset), attunedSpots) then
        retVal=true
    end

    return retVal
end

function M.attuneSpot(user, spotNumber)
    local offset= math.fmod(spotNumber-1,32);
    local attunedSpots = M.QuestprogressToAttunedSpots(user:getQuestProgress(7008))
    user:setQuestProgress(7008, M.attunedSpotsToQuestprogress(bit32.bor(2^offset, attunedSpots)))
end

local function getDistance(userXY, targetXY)
    if userXY > targetXY then
        return userXY-targetXY
    elseif userXY < targetXY then
        return targetXY-userXY
    else
        return 0
    end
end

local function checkIfDifferentElevation(userPos, targetPos)

    if userPos.z == targetPos.z then
        return false
    end

    return true

end

local function getDirectionDistance(user)
    local usersLevel = user:getSkill(Character.spatialMagic)
    local distance
    local targetPos
    local distanceWithinLevelRange
    local levelRangeTargetPos
    for i = 1, #portalSpots do
        if not M.spotAttuned(user, i) then
            local location = portalSpots[i].location
            local xDiff = getDistance(user.pos.x, location.x)
            local yDiff = getDistance(user.pos.y, location.y)
            local total = xDiff+yDiff
            if not distance then
                distance = total
            elseif total < distance then
                distance = total
                targetPos = location
                if portalSpots[i].level <= usersLevel then
                    if not distanceWithinLevelRange then
                        distanceWithinLevelRange = total
                    elseif total < distanceWithinLevelRange then
                        distanceWithinLevelRange = total
                        levelRangeTargetPos = location
                    end
                end
            end
        end
    end

    -- the nearby portal spots check will prioritize ones within your level range to attune to
    if distanceWithinLevelRange and levelRangeTargetPos then
        distance = distanceWithinLevelRange
        targetPos = levelRangeTargetPos
    end

    if not distance then --No unattuned spots left
        user:inform(myTexts.cantFindMore.german, myTexts.cantFindMore.english)
        return false
    end

    if distance == 0 then
        if checkIfDifferentElevation(user.pos, targetPos) then
            user:inform(myTexts.differentElevation.german, myTexts.differentElevation.english)
            return false
        end
    end

    local directionNameEn = spiritlocation.getDirectionRelativeToUser(user, targetPos)
    local directionNameDe = spiritlocation.getGermanDirection(directionNameEn)
    local binderTextEn = myTexts.binderTexts.english
    local binderTextDe = myTexts.binderTexts.german
    local distanceTextEn
    local distanceTextDe
        local distanceTexts = myTexts.distanceTexts
        for _, distanceText in ipairs(distanceTexts) do
            if distance > distanceText.value then
                distanceTextEn = distanceText.english
                distanceTextDe = distanceText.german
                break
            end
        end
    return common.GetNLS(user, distanceTextDe..binderTextDe..directionNameDe, distanceTextEn..binderTextEn..directionNameEn)
end

function M.checkSpotEligiblity(user)

    for i = 1, #portalSpots do
        if user.pos.x >= portalSpots[i].location.x-5 and user.pos.x <= portalSpots[i].location.x+5 then
            if user.pos.y >= portalSpots[i].location.y-5 and user.pos.y <= portalSpots[i].location.y+5 then
                if user.pos.z == portalSpots[i].location.z then
                    local spatialMagicLevel = user:getSkill(Character.spatialMagic)
                    if M.spotAttuned(user, i) then
                        user:inform(myTexts.alreadyAttuned.german, myTexts.alreadyAttuned.english)
                        return
                    else
                        if spatialMagicLevel >= portalSpots[i].level then
                            M.attuneSpot(user, i)
                            user:inform(myTexts.doneAttuning.german, myTexts.doneAttuning.english)
                            return
                        else
                            user:inform(myTexts.lackingSkill.german, myTexts.lackingSkill.english)
                            return
                        end
                    end
                end
            end
        end
    end
    if not getDirectionDistance(user) then
        return
    end
    user:inform(myTexts.noNearby.german..getDirectionDistance(user), myTexts.noNearby.english..getDirectionDistance(user))
end

local function getListOfAttunedSpots(user, portal)
    local spots = {}
    for i = 1, #portalSpots do
        if M.spotAttuned(user, i) then
            spots[#spots+1] = portalSpots[i]
        end
    end
    return spots
end

local function getPortalWear(user)
    local spatialMagicLevel = user:getSkill(Character.spatialMagic)
    local duration = math.ceil(spatialMagicLevel/1000)
    return duration
end

local function getCastTime(user)
    local spatialMagicLevel = user:getSkill(Character.spatialMagic)
    local baseCastTime = 30 --seconds
    local reducedCastTime = baseCastTime - math.floor(0.15*spatialMagicLevel) --minimum of 15 seconds, no cheesy teleporting away from instant danger
    return reducedCastTime*10
end

local function getManaCost(user)
    local spatialMagicLevel = user:getSkill(Character.spatialMagic)
    local baseCost = 5000
    local reducedCost = baseCost - 25*spatialMagicLevel
    return reducedCost
end

local function checkIfEnoughMana(user)
    local mana = getManaCost(user)
    if magic.hasSufficientMana(user, mana) then
        return true
    end
    return false
end

local function removeUsedMana(user)
    local mana = getManaCost(user)
    user:increaseAttrib("mana", -mana)
end

function M.selectPortalColor(user)
    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index == 1 then
            user:setQuestProgress(7011, 798)
            user:inform(myTexts.red.german, myTexts.red.english)
        elseif index == 2 then
            user:setQuestProgress(7011, 10)
            user:inform(myTexts.blue.german, myTexts.blue.english)
        end
    end

    local dialog = SelectionDialog(
        common.GetNLS(user, myTexts.name.german,  myTexts.name.english),
        common.GetNLS(user, myTexts.selectColour.german, myTexts.selectColour.english),
        callback)
    dialog:addOption(0, common.GetNLS(user, myTexts.colours.red.german, myTexts.colours.red.english))
    dialog:addOption(0, common.GetNLS(user, myTexts.colours.blue.german, myTexts.colours.blue.english))
    user:requestSelectionDialog(dialog)
end

local function teleport(user, actionState, portal, destination)
    local castDuration = getCastTime(user)
    local wear = getPortalWear(user)
    local thePos = user.pos
    local incantation = myTexts.incantation.teleport

    local portalType = user:getQuestProgress(7011)

        if portalType == 0 then
            portalType = 10
        end

    if portal then
        thePos = common.GetFrontPosition(user)
        incantation = myTexts.incantation.portal
    end

    user:talk(Character.say, incantation)
    world:gfx(41, thePos)
    world:makeSound(13, thePos)
    removeUsedMana(user)
    skilling.increaseExperiencePortalMagic(user, castDuration)
    if portal then
        if antiTroll.passesAntiTrollCheck(thePos) then
            local thePortal = world:createItemFromId(portalType, 1, thePos, true, 999, {destinationCoordsZ = destination.z, destinationCoordsY = destination.y, destinationCoordsX = destination.x})
            thePortal.wear = wear
            world:changeItem(thePortal)
        else
            user:inform(myTexts.badTarget.german, myTexts.badTarget.english)
        end
    else
        user:talk(Character.say, myTexts.vanish.german, myTexts.vanish.english)
        user:warp(destination)
        user:talk(Character.say, myTexts.appear.german, myTexts.appear.english)
    end
end

local function chooseLocation(user, actionState, portal)
    local castDuration = getCastTime(user)
    if not checkIfEnoughMana(user) then
        user:inform(castTexts.mana.german, castTexts.mana.english)
        return
    end
    local destination
    local spots = getListOfAttunedSpots(user, portal)
    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        for i = 1, #spots do
            if index == i then
                destination = spots[i].location
                M[user.name.."destination"] = destination
                M[user.name.."portal"] = portal
                user:startAction(castDuration, 21, 10, 0, 0)
            end
        end
    end
    local dialog = SelectionDialog(
        common.GetNLS(user, myTexts.teleportation.german, myTexts.teleportation.english),
        common.GetNLS(user, myTexts.destination.german, myTexts.destination.english),
        callback)

    for i = 1, #spots do
        dialog:addOption(0, common.GetNLS(user, spots[i].nameDe, spots[i].nameEn))
    end

    user:requestSelectionDialog(dialog)
end

local function portalMenu(user, ltstate)
    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index == 1 then
            M.checkSpotEligiblity(user)
            return
        elseif index == 2 then
            chooseLocation(user, ltstate)
        elseif index == 3 then
            chooseLocation(user, ltstate, true)
        elseif index == 4 then
            M.selectPortalColor(user)
            return
        end
    end
    local dialog = SelectionDialog(
        common.GetNLS(user, myTexts.name.german, myTexts.name.english),
        common.GetNLS(user, myTexts.castSelect.german, myTexts.castSelect.english),
        callback)
    dialog:addOption(0,common.GetNLS(user, myTexts.attuneTo.german, myTexts.attuneTo.english))
    dialog:addOption(0, common.GetNLS(user, myTexts.teleport.german, myTexts.teleport.english))
    dialog:addOption(0, common.GetNLS(user, myTexts.portal.german, myTexts.portal.english))
    if user:getQuestProgress(7010) ~= 0 then
        dialog:addOption(0, common.GetNLS(user, myTexts.portalColour.german, myTexts.portalColour.english))
    end
    user:requestSelectionDialog(dialog)
end

function M.castSpatialMagic(user, actionState)
    if actionState == Action.none then
        portalMenu(user, actionState)
    elseif actionState == Action.abort then
        user:inform(common.GetNLS(user, myTexts.interruptedCast.german, myTexts.interruptedCast.english))
        return
    elseif actionState == Action.success then
        local destination = M[user.name.."destination"]
        local portal = M[user.name.."portal"]
        teleport(user, actionState, portal, destination)
    end
end

return M
