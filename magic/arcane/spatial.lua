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
local magic = require("base.magic")
local spiritlocation = require("magic.arcane.spirit.location")
local antiTroll = require("magic.base.antiTroll")
local shared = require("magic.arcane.enchanting.core.shared")
local tutorials = require("magic.tutorials")
local globalvar = require("base.globalvar")

local M = {}

local portalSpots = antiTroll.portals
local myTexts = {

    portalBookNeeded = {
        english = "You must have the portal book you wish to evaluate in one of your belt slots.",
        german = "Du musst das Portalbuch, das du bewerten möchtest, in einem deiner Gürtelplätze haben."}, --Verification of chatGPT GERMAN TRANSLATION needed

    distanceTexts = {
        {value = 600, english = " very far ", german = "sehr fern "},
        {value = 400, english = " far ", german = "fern "},
        {value = 100, english = " somewhere ", german = "in der Nähe "},
        {value = 50, english = " close ", german = "nahe "},
        {value = 0, english = " very close ", german = "sehr nahe "},
    },
    binderTexts = {
        english = "to the ",
        german = "in Richtung "
    },
    alreadyAttuned = {
        english  = "You've already attuned your spatial magic to this location.",
        german = "Du hast deine Raummagie bereits auf diesen Ort abgestimmt."
    },
    closePortal = {
        english = "Close a portal",
        german = "Schließe ein Portal."
    },
    doneAttuning  = {
        english = "You've attuned to the crossing mana lines in the area. You will now be able to remember the spatial coordinates to teleport, cast portals and even write portal books that lead to this area, should your expertise in spatial magic allow.",
        german = "Du hast deine Raummagie auf die sich kreuzenden Manalinien dieses Gebiets abgestimmt. Du kannst dir nun die räumlichen Koordinaten merken um dich her zu teleportieren, Portale zu öffnen oder sogar Portalbücher schreiben die dich hier her führen. Natürlich nur wenn es deine Erfahrung in Raummagie erlaubt."
    },
    lackingSkill = {
        english = "You need to attain a higher level of expertise in spatial magic to remember the spatial coordinates for this location.",
        german = "Um dir die räumlichen Koordinaten für diesen Ort merken zu können, musst du deine Fähigkeiten in der Raummagie verbessern."
    },
    lackingAttribs = {
        english = "You do not have the required magical prowess to attune to this particular spatial node.",
        german = "Du besitzt nicht die nötige magische Begabung, um dich mit diesem speziellen räumlichen Knotenpunkt zu verbinden."
    },
    noNearby = {
        english = "There are no crossing mana lines nearby for you to attune your spatial magic to. The nearest one is ",
        german = "Hier befinden sich keine kreuzenden Manalinien um deine Raummagie abzustimmen. Die Näheste befindet sich "
    },
    red = {
        english = "Portal colour set to red",
        german = "Die Farbe deiner Portale ist nun rot."
    },
    blue = {
        english = "Portal colour set to blue",
        german = "Die Farbe deiner Portale ist nun blau."
    },
    name = {
        english = "Spatial Magic",
        german = "Raummagie"
    },
    selectColour = {
        english = "Select which colour your portals should have.",
        german = "Wähle welche Farbe deine Portale haben sollen."
    },
    colours = {
        red = { english = "Red", german = "Rot"},
        blue = { english = "Blue", german = "Blau"}
    },
    incantation = {
        portal = "Locus Ianua", -- latin for "space door"
        teleport = "Locus Itinerantur", --latin for "space travel"
        attune = "Locus Memento", --latin, "space remember"
        close = "Locus Claudere" -- "space shut"
    },
    teleportation = {
        english = "Teleportation",
        german = "Teleportation"
    },
    destination = {
        english = "Select your destination",
        german = "Wähle deinen Zielort"
    },
    castSelect  = {
        english = "What kind of spatial magic do you want to cast?",
        german = "Welche Raummagie möchtest du sprechen?"
    },
    attuneTo = {
        english = "Attune to location",
        german = "Abstimmung mit einem Ort"
    },
    teleport = {
        english = "Teleport",
        german = "Teleport"
    },
    portal = {
        english = "Create Portal",
        german = "Erschaffe ein Portal"
    },
    portalColour = {
        english = "Portal colour",
        german = "Portalfarbe"
    },
    interruptedCast = {
        english = "Your casting of spatial magic was interrupted.",
        german = "Das wirken deiner Raummagie wurde unterbrochen."
    },
    cantFindMore = {
        english = "You don't detect any more crossing mana lines to attune to. Perhaps you've found them all?",
        german = "Du kannst keine sich kreuzenden Manalinien mehr ausmachen. Vielleicht hast du ja schon alle gefunden?"
    },
    differentElevation = {
        english = "You can feel that there are crossed mana lines nearby that you can attune your spatial magic to, however not here. Perhaps you'd had better luck searching at a different elevation?",
        german = "Du kannst spüren, dass du dich direkt in der Nähe einer sich kreuzenden Manalinie befindest, an der du deine Raummagie abstimmen könntest. Es scheint aber als würde sich dieser auf einer anderen Ebene befinden."
    },
    badTarget  = {
        english = "Something in the area disrupts your casting. Perhaps this isn't a good spot for spatial magic?",
        german = "Etwas in der Nähe unterbericht deinen Zauber. Möglicherweise ist das kein guter Ort für Raummagie?"
    },
    locationBlocked = {
        english = "There is not enough free space in front of you for a portal, try again somewhere there is more room.",
        german = "Vor dir ist nicht genug Platz für ein Portal. Versuche es erneut an einem Ort, wo mehr Raum zur Verfügung steht."
    },
    showBookQuality = {
        english = "Portal Book Evaluation",
        german = "Portalbuchbewertung"
    },
    bookQuality = {
        english = "Through your inspection you find that this portal book is of ",
        german = "Durch deine Inspektion stellst du fest, dass dieses Portalbuch von der Qualität "
    },
    bookQualityAddendum = {
        english = " quality. The better the quality, the faster it is to summon a portal through the usage of this book.",
        german = " ist. Je besser die Qualität, desto schneller lässt sich ein Portal mithilfe dieses Buches beschwören."
    }
}

M.spatialTexts = myTexts

local function findSpotNameBasedOnCoord(coordinates)

    for _, spot in pairs(portalSpots) do
        if spot.location == coordinates then
            return spot.nameEn, spot.nameDe
        end
    end

    return false
end


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

local function userMeetsAttribReq(user, statReq)
    local baseReq, sum = magic.hasMageAttributes(user)

    if not statReq and baseReq then
        return true
    end

    if sum >= statReq then
        return true
    end

    return false
end

function M.spotAttuned(user, spotNumber)
    local attunedSpots = M.QuestprogressToAttunedSpots(user:getQuestProgress(216))
    local retVal = false
    local offset = math.fmod(spotNumber-1,32)

    if bit32.btest(bit32.lshift(1, offset), attunedSpots) then
        retVal=true
    end

    if not userMeetsAttribReq(user, portalSpots[spotNumber].statReq) then --To prevent people temporarily changing attribs or using pots to learn this and then  cast it with lower than attrib req, we check it here
        return false
    end

    return retVal
end

function M.attuneSpot(user, spotNumber)
    local offset= math.fmod(spotNumber-1,32);
    local attunedSpots = M.QuestprogressToAttunedSpots(user:getQuestProgress(216))
    user:setQuestProgress(216, M.attunedSpotsToQuestprogress(bit32.bor(2^offset, attunedSpots)))
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
        if not M.spotAttuned(user, i) and userMeetsAttribReq(user, portalSpots[i].statReq) then
            local location = portalSpots[i].location

            if location.z ~= 0 and user.pos.z ~= location.z then
                --Lead to the entrance instead of the underground coordinate since the coordinates above and below ground sadly do not match
                location = portalSpots[i].entrance
            end

            local xDiff = getDistance(user.pos.x, location.x)
            local yDiff = getDistance(user.pos.y, location.y)
            local total = xDiff+yDiff
            if not distance then
                distance = total
                targetPos = location
                if portalSpots[i].level <= usersLevel then
                    distanceWithinLevelRange = total
                    levelRangeTargetPos = location
                end
            elseif total < distance then
                distance = total
                targetPos = location
                if portalSpots[i].level <= usersLevel then
                    if not distanceWithinLevelRange then
                        distanceWithinLevelRange = total
                        levelRangeTargetPos = location
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

local startCycles = 3

function M.checkSpotEligiblity(user, actionState)

    for i = 1, #portalSpots do
        if user.pos.x >= portalSpots[i].location.x-5 and user.pos.x <= portalSpots[i].location.x+5 then
            if user.pos.y >= portalSpots[i].location.y-5 and user.pos.y <= portalSpots[i].location.y+5 then
                if user.pos.z == portalSpots[i].location.z then
                    local spatialMagicLevel = user:getSkill(Character.spatialMagic)
                    if portalSpots[i].nameEn == "Hemp Necktie Inn" then
                        if user:getQuestProgress(240) == 1 then
                            user:setQuestProgress(240, 2)
                        end
                    end
                    if M.spotAttuned(user, i) then
                        user:inform(myTexts.alreadyAttuned.german, myTexts.alreadyAttuned.english)
                        return
                    else
                        if spatialMagicLevel >= portalSpots[i].level and userMeetsAttribReq(user, portalSpots[i].statReq) then
                            M[user.name.."attunement"] = i
                            M[user.name.."cycles"] = startCycles
                            M.startCycle(user, actionState)
                            return
                        elseif not userMeetsAttribReq(user, portalSpots[i].statReq) then
                            user:inform(myTexts.lackingAttribs.german, myTexts.lackingAttribs.english)
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

local minimumWear = 1

local maxWearIncrease = 5

local function getPortalWear(user)

    local leadAttribNames = common.GetLeadAttributeName(Character.spatialMagic)
    local leadAttribValue1 = user:increaseAttrib(leadAttribNames.first, 0) * 0.6
    local leadAttribValue2 = user:increaseAttrib(leadAttribNames.second, 0) * 0.4
    local statBonus = leadAttribValue1 + leadAttribValue2

    local wandQualityBonus = magic.getQualityBonusWand(user) -- A perfect wand equals a bonus of 0.1

    local wandGemBonus = magic.getGemBonusWand(user) -- Each tier of a magic set equals 0.06

    local equipmentBonus = magic.getMagicBonus(user)

    local totalBonus = statBonus + wandQualityBonus + wandGemBonus/100 + equipmentBonus

   --[[
    To reach the best wear duration, a sum of 1.2 is needed.
    Example scenario to reach it:
    Mage with 20 intelligence and willpower. Adds a bonus of 0.5.
    Perfect wand. 0.5 + 0.1 = 0.6
    Wear equipment suitable for magic (high level jewellery, clothing instead of armour), 0.6 + 0.1 = 0.7
    Tier 5 gems. 0.7 + 0.30 = 1
    Drink a +4 intelligence and willpower potion = 1.21
    Eat a +2 intelligence and willpower meal = 1.31
    The reason behind 1.2 is to make consumables and gems
    useful for even a well statted mage, and not allow consumables
    and gems to entirely replace stat requirements.
    Above tier 5 gems it gets considerably harder to reach higher tiers.
    This means if you want to replace consumables or have 6 lower intelligence and willpower
    and still reach the maximum, you would need tier 8-9 gems.
    ]]

    local increase = math.min((maxWearIncrease/120)*(totalBonus*100), maxWearIncrease)

    local wear = minimumWear + increase
    return math.ceil(wear)

end

local baseCastTime = 200 -- 20 seconds as a basis, the static teleporters use this

local maxReduction = 100 -- Mages cast teleport and portals at half the time of a teleporter, 10 seconds, and portal books of perfect quality only available from players can also reach this speed.

local function getCastTime(user, wand)

    -- Since learning scales with cast time, it makes no sense to lower it based on any criteria. As such, it is a flat value.

    return baseCastTime - maxReduction
end

function M.getBookCastDuration(portalBook)

    if not portalBook then -- It's the teleporter
        return baseCastTime
    end

    local quality = math.floor(portalBook.quality/100)+1
    local reducedCastTime = baseCastTime - (maxReduction/10)*quality
    return reducedCastTime
end

local function getBookQualityText(portalBook)

    local quality = math.floor(portalBook.quality/100)
    local germanText = shared.qualityTexts.german[quality]
    local englishText = shared.qualityTexts.english[quality]

    return germanText, englishText
end

local belt = {Character.belt_pos_1, Character.belt_pos_2, Character.belt_pos_3, Character.belt_pos_4, Character.belt_pos_5, Character.belt_pos_6}

function M.listBooksAtBelt(user)

    local portalBookId = 1061

    local retList = {}

    for _, beltSlot in pairs(belt) do
        local beltItem = user:getItemAt(beltSlot)

        if portalBookId == beltItem.id and not common.IsNilOrEmpty(beltItem:getData("destinationCoordsZ")) then --it is a portal book
            table.insert(retList, beltItem)
        end
    end

    return retList

end

local function getDestinationText(book)

    local destinationEn = book:getData("destinationEn")
    local destinationDe = book:getData("destinationDe")

    if common.IsNilOrEmpty(destinationDe) then

        local Z = tonumber(book:getData("destinationCoordsZ"))
        local X = tonumber(book:getData("destinationCoordsX"))
        local Y = tonumber(book:getData("destinationCoordsY"))

        local coordinates = false

        if not common.IsNilOrEmpty(Z) and not common.IsNilOrEmpty(X) and not common.IsNilOrEmpty(Y) then
            coordinates = position(X, Y, Z)
        end

        if coordinates then
            destinationEn, destinationDe = findSpotNameBasedOnCoord(coordinates)
        end

        if common.IsNilOrEmpty(destinationDe) then
            -- The coordinates do not match any mage attuned location
            destinationEn = "Unknown"
            destinationDe = "Unbekannt"
        end
    end

    local prefixEn = "Destination: "
    local prefixDe = "Ziel: "

    return prefixDe..destinationDe.."\n\n", prefixEn..destinationEn.."\n\n"
end

function M.showBookQuality(user)

    local booksAtBelt = M.listBooksAtBelt(user)

    if #booksAtBelt <= 0 then
        user:inform(myTexts.portalBookNeeded.german, myTexts.portalBookNeeded.english)
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        local germanTitle = myTexts.showBookQuality.german
        local englishTitle = myTexts.showBookQuality.english
        local germanText, englishText = getBookQualityText(booksAtBelt[selected])

        local germanTextDestination, englishTextDestination = getDestinationText(booksAtBelt[selected])

        local callback = function(MsgDialog)
        end

        local MsgDialog = MessageDialog(common.GetNLS(user, germanTitle, englishTitle), common.GetNLS(user, germanTextDestination..myTexts.bookQuality.german..germanText..myTexts.bookQualityAddendum.german, englishTextDestination..myTexts.bookQuality.english..englishText..myTexts.bookQualityAddendum.english), callback)
        user:requestMessageDialog(MsgDialog)

    end

    local title = common.GetNLS(user,"Untersuchung von Portalbüchern", "Inspection of portal books")

    local description = common.GetNLS(user, "Wähle das Portalbuch aus, das du untersuchen möchtest.", "Select the portal book you wish to inspect.")

    local dialog = SelectionDialog(title, description, callback)

    for _, book in pairs(booksAtBelt) do
        local commonItem = world:getItemStatsFromId(book.id)
        dialog:addOption(book.id, common.GetNLS(user, commonItem.German, commonItem.English))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

local function getManaCost(user)

    local baseCost = 5000

    local maxDecrease = 2500

    local essence = user:increaseAttrib("essence", 0)

    local essenceBonus = common.GetAttributeBonusHigh(essence) -- A essence of 20 equals a bonus of 0.5, 24 = 0.71, 26 = 0.81

    local wandQualityBonus = magic.getQualityBonusWand(user) -- A perfect wand equals a bonus of 0.1

    local wandGemBonus = magic.getGemBonusWand(user) -- Each tier of a magic set equals 0.06

    local equipmentBonus = magic.getMagicBonus(user)

    local totalBonus = essenceBonus + wandQualityBonus + wandGemBonus/100 + equipmentBonus

    --[[
    To reach the best mana cost, a sum of 1.2 is needed.
    Example scenario to reach it:
    Mage with 20 essence. Adds a bonus of 0.5.
    Perfect wand. 0.5 + 0.1 = 0.6
    Wear equipment suitable for magic (high level jewellery, clothing instead of armour), 0.6 + 0.1 = 0.7
    Tier 5 gems. 0.7 + 0.30 = 1
    Drink a +4 essence potion = 1.21
    Eat a +2 essence meal = 1.31
    The reason behind 1.2 is to make consumables and gems
    useful for even a well statted mage, and not allow consumables
    and gems to entirely replace stat requirements.
    Above tier 5 gems it gets considerably harder to reach higher tiers.
    This means if you want to replace consumables or have 6 lower essence
    and still reach the maximum, you would need tier 8-9 gems.
    ]]

    local decrease = math.min((maxDecrease/120)*(totalBonus*100), maxDecrease)

    local reducedCost = baseCost - decrease
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
            user:setQuestProgress(235, 798)
            user:inform(myTexts.red.german, myTexts.red.english)
        elseif index == 2 then
            user:setQuestProgress(235, 10)
            user:inform(myTexts.blue.german, myTexts.blue.english)
        end
    end

    local dialog = SelectionDialog(
        common.GetNLS(user, myTexts.name.german,  myTexts.name.english),
        common.GetNLS(user, myTexts.selectColour.german, myTexts.selectColour.english),
        callback)
    dialog:addOption(0, common.GetNLS(user, myTexts.colours.red.german, myTexts.colours.red.english))
    dialog:addOption(0, common.GetNLS(user, myTexts.colours.blue.german, myTexts.colours.blue.english))
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end

local function teleport(user, actionState, portal, destination)

    local wear = getPortalWear(user)
    local thePos = user.pos

    local portalType = user:getQuestProgress(235)

        if portalType == 0 then
            portalType = 10
        end

    if portal then
        thePos = common.GetFrontPosition(user)
    end

    local castDuration = getCastTime(user)

    world:gfx(41, thePos)
    world:makeSound(13, thePos)
    removeUsedMana(user)
    magic.wandDegrade(user)
    user:learn(Character.spatialMagic, castDuration, 100)

    if portal then
        if not world:getField(thePos) or (world:isItemOnField(thePos) and world:getItemOnField(thePos).wear == 255) then
            --[[
            Only checks for static items here.
            This way if the player turned around to try and cheat the portal placement,
            it still stops from casting on static. On the other hand, if another player
            tossed an item before them to troll the mage mid cast, it ignores it and just
            places it ontop of the item.
            ]]
            user:inform(myTexts.locationBlocked.german, myTexts.locationBlocked.english)

        elseif antiTroll.passesAntiTrollCheck(thePos) then
            local thePortal = world:createItemFromId(portalType, 1, thePos, true, 999, {destinationCoordsZ = destination.z, destinationCoordsY = destination.y, destinationCoordsX = destination.x})
            thePortal.wear = wear
            world:changeItem(thePortal)
            logPlayer(user.name.."("..user.id..")".." creates portal to "..tostring(destination))
            if tutorials.isTutorialNPCnearby(user) then
                if user:getQuestProgress(240) == 5 then
                    user:setQuestProgress(240, 6)
                end
            end
        else
            user:inform(myTexts.badTarget.german, myTexts.badTarget.english)
        end
    else
        if tutorials.isTutorialNPCnearby(user) then
            if user:getQuestProgress(240) == 3 then
                user:setQuestProgress(240, 4)
            end
        end
        logPlayer(user.name.."("..user.id..")".." teleporting to "..tostring(destination))
        user:warp(destination)
    end
end

function M.startCycle(user, actionState, oralCast)

    local attunement = M[user.name.."attunement"]

    if M[user.name.."cycles"] > 0 then

        local castDuration = getCastTime(user)

        M[user.name.."cycles"] = M[user.name.."cycles"] - 1

        local location = user.pos

        local portal = M[user.name.."portal"]

        if portal then
            location = common.GetFrontPosition(user)
        end

        magic.pickAndPlayRandomGfx(location)

        user:performAnimation(globalvar.charAnimationSPELL)
        world:makeSound(globalvar.sfxSNARING, user.pos)

        user:startAction(math.ceil(castDuration/startCycles), 21, 10, 0, 0)

    elseif attunement then
        M.attuneSpot(user, attunement)
        user:inform(myTexts.doneAttuning.german, myTexts.doneAttuning.english)
        M[user.name.."attunement"] = false
    else
        local destination = M[user.name.."destination"]
        local portal = M[user.name.."portal"]
        teleport(user, actionState, portal, destination, oralCast)
    end

end

local function checkForWand(user)

    local wand = common.getItemInHand(user, magic.wandIds)

    if not wand then return true end --You can cast spatial magic without a wand just without the boni of wielding one

    if common.isBroken(wand) then
        user:inform("Dein Zauberstab ist zerbrochen. Du solltest ihn reparieren lassen, bevor du versuchst, ihn zu benutzen.", "Your wand is broken. You should see to its repairs before trying to use it.")
        return false
    end

    return true
end

local function closePortal(user, actionState)

    if not magic.hasSufficientMana(user, 1000) then
        user:inform("Du hast nicht genug Mana.", "You do not have enough mana.")
        return
    end

    local front = common.GetFrontPosition(user)

    local portal = false

    if world:isItemOnField(front) then
        local possiblePortal = world:getItemOnField(front)
        if possiblePortal.id == 10 and possiblePortal.wear ~= 255 then
            portal = possiblePortal
        end
    end

    if not portal then
        user:inform("Es gibt kein Portal, das du schließen kannst. Es muss vor dir sein.", "There's no portal for you to close. It needs to be in front of you.")
        return
    end

    if actionState == Action.none then
        user:startAction(30, 21, 10, 0, 0)
    elseif actionState == Action.success then
        user:increaseAttrib("mana", -1000)
        world:erase(portal,1)
        world:gfx(45,portal.pos)
    end
end


local function chooseLocation(user, actionState, portal, spokenWords)

    if not checkIfEnoughMana(user) then
        user:inform("Du hast nicht genug Mana.", "You do not have enough mana.")
        return
    end

    if not antiTroll.passesAntiTrollCheck(common.GetFrontPosition(user)) then
        user:inform(myTexts.badTarget.german, myTexts.badTarget.english)
        return
    end

    if portal and world:isItemOnField(common.GetFrontPosition(user)) then
        user:inform(myTexts.locationBlocked.german, myTexts.locationBlocked.english)
        return
    end

    local destination
    local spots = getListOfAttunedSpots(user, portal)

    for _, spot in pairs(spots) do

        if spokenWords and (string.find(spokenWords, spot.nameEn) or string.find(spokenWords, spot.nameDe)) then
            M[user.name.."attunement"] = false -- If a previous attunement attempt was interrupted, it might still be stored, so we overwrite it here
            M[user.name.."destination"] = spot.location
            M[user.name.."portal"] = portal
            M[user.name.."cycles"] = startCycles
            M.startCycle(user)
            return
        end

    end


    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        for i = 1, #spots do
            if index == i then
                destination = spots[i].location
                M[user.name.."attunement"] = false -- If a previous attunement attempt was interrupted, it might still be stored, so we overwrite it here
                M[user.name.."destination"] = destination
                M[user.name.."portal"] = portal
                M[user.name.."cycles"] = startCycles
                M.startCycle(user)
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

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end

local function portalMenu(user, ltstate)

    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if index == 1 then
            local incantation = myTexts.incantation.attune
            user:talk(Character.say, incantation)
            return
        elseif index == 2 then
            local incantation = myTexts.incantation.teleport
            user:talk(Character.say, incantation)
            return
        elseif index == 3 then
            local incantation = myTexts.incantation.portal
            user:talk(Character.say, incantation)
            return
        elseif index == 4 then
            M.showBookQuality(user)
        elseif index == 5 then
            local incantation = myTexts.incantation.close
            user:talk(Character.say, incantation)
        elseif index == 6 then
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
    dialog:addOption(0,common.GetNLS(user, myTexts.showBookQuality.german, myTexts.showBookQuality.english))
    dialog:addOption(0,common.GetNLS(user, myTexts.closePortal.german, myTexts.closePortal.english))
    if user:getQuestProgress(225) ~= 0 then
        dialog:addOption(0, common.GetNLS(user, myTexts.portalColour.german, myTexts.portalColour.english))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end

local  function skipPortalMenu(user, actionState, incantation, spokenWords)
    if incantation == myTexts.incantation.teleport then
        chooseLocation(user, actionState, false, spokenWords)
    elseif incantation == myTexts.incantation.portal then
        chooseLocation(user, actionState, true, spokenWords)
    elseif incantation == myTexts.incantation.attune then
        M.checkSpotEligiblity(user)
    elseif incantation == myTexts.incantation.close then
        closePortal(user, actionState)
    end
end

function M.castSpatialMagic(user, actionState, oralCast, spokenWords)

    if not checkForWand(user) then return end

    if actionState == Action.none then
        if not oralCast then
            portalMenu(user, actionState)
        else
            skipPortalMenu(user, actionState, oralCast.spatial, spokenWords)
        end
    elseif actionState == Action.abort then
        user:inform(common.GetNLS(user, myTexts.interruptedCast.german, myTexts.interruptedCast.english))
        return
    elseif actionState == Action.success then

        if oralCast.spatial == myTexts.incantation.close then
            closePortal(user, actionState)
        else
            M.startCycle(user, actionState, oralCast)
        end
    end
end


--GM tool functions:

function M.chooseLocationToAttune(user, target)

    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        local skippedSpots = 0

        for i = 1, #portalSpots do
            if M.spotAttuned(target, i) then
                skippedSpots = skippedSpots+1
            elseif index == i - skippedSpots then
                M.attuneSpot(target, i)
                user:inform("You attuned "..target.name.." to the portal location of "..portalSpots[i]["nameEn"])
                user:logAdmin(user.name.." has attuned "..target.name.." to the portal location of "..portalSpots[i]["nameEn"])
            end
        end
    end
    local dialog = SelectionDialog("Runes", "Select a rune to teach", callback)

    local unknownSpots = 0

    for i = 1, #portalSpots do
        if not M.spotAttuned(target, i) then
            dialog:addOption(0, portalSpots[i]["nameEn"])
            unknownSpots = unknownSpots +1
        end
    end

    if unknownSpots > 0 then
        dialog:setCloseOnMove()
        user:requestSelectionDialog(dialog)
    else
        user:inform(target.name.." is already attuned to all spots.")
    end

end

function M.attuneAllLocations(user, target)

    for i = 1, #portalSpots do
        if not M.spotAttuned(target, i) then
            M.attuneSpot(target, i)
        end
    end
    user:inform(target.name.." has been attuned to all portal spots.")
    user:logAdmin(user.name.." has attuned all portal spots "..target.name)

end

return M
