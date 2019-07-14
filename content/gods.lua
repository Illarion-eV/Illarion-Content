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
--Priest magic: Becoming a devotee, change devotion, become a priest by using an altar

local common = require("base.common")
local globalvar = require("base.globalvar")
local math = require("math")

local gods_common = require("content._gods.gods_common")

local basegod = require("content._gods.basegod")
local baseyounger = require("content._gods.baseyounger")
local baseelder = require("content._gods.baseelder")

local   ushara = require("content._gods.ushara")
local   bragon = require("content._gods.bragon")
local    eldan = require("content._gods.eldan")
local   tanora = require("content._gods.tanora")
local  findari = require("content._gods.findari")
local   nargun = require("content._gods.nargun")
local    elara = require("content._gods.elara")
local    adron = require("content._gods.adron")
local    oldra = require("content._gods.oldra")
local   cherga = require("content._gods.cherga")
local malachin = require("content._gods.malachin")
local  irmorom = require("content._gods.irmorom")
local   sirani = require("content._gods.sirani")
local  moshran = require("content._gods.moshran")
local  zhambra = require("content._gods.zhambra")
local  ronagan = require("content._gods.ronagan")


local M = {}

-- Overview of queststatus:
M._QUEST_DEVOTION = 401 --401 contains the ID of the god the character is devoted to
M._QUEST_PRIESTHOOD = 402 --402 contains the ID of the god the character is a priest of. MUST be equal to value of quest 401 or 0.
--403-418 contains favour (as signed int) of the corresponding god.


M.GOD_NONE     =  0
M.GOD_USHARA   =  1
M.GOD_BRAGON   =  2
M.GOD_ELDAN    =  3
M.GOD_TANORA   =  4
M.GOD_FINDARI  =  5
M.GOD_NARGUN   =  6
M.GOD_ELARA    =  7
M.GOD_ADRON    =  8
M.GOD_OLDRA    =  9
M.GOD_CHERGA   = 10
M.GOD_MALACHIN = 11
M.GOD_IRMOROM  = 12
M.GOD_SIRANI   = 13
M.GOD_ZHAMBRA  = 14
M.GOD_RONAGAN  = 15
M.GOD_MOSHRAN  = 16
M.GOD_THEFIVE  = 17
M.GOD_THEDEVS  = 99

M._godOrdinalToObj = { -- This is the only place where we create instances of god classes
    [M.GOD_USHARA]   =   ushara.Ushara (M.GOD_USHARA,  M.GOD_USHARA - M.GOD_USHARA+1),
    [M.GOD_BRAGON]   =   bragon.Bragon (M.GOD_BRAGON,  M.GOD_BRAGON - M.GOD_USHARA+1),
    [M.GOD_ELDAN]    =    eldan.Eldan  (M.GOD_ELDAN,   M.GOD_ELDAN  - M.GOD_USHARA+1),
    [M.GOD_TANORA]   =   tanora.Tanora (M.GOD_TANORA,  M.GOD_TANORA - M.GOD_USHARA+1),
    [M.GOD_FINDARI]  =  findari.Findari(M.GOD_FINDARI, M.GOD_FINDARI- M.GOD_USHARA+1),
    [M.GOD_NARGUN]   =   nargun.Nargun  (M.GOD_NARGUN,   M.GOD_NARGUN  - M.GOD_NARGUN+1),
    [M.GOD_ELARA]    =    elara.Elara   (M.GOD_ELARA,    M.GOD_ELARA   - M.GOD_NARGUN+1),
    [M.GOD_ADRON]    =    adron.Adron   (M.GOD_ADRON,    M.GOD_ADRON   - M.GOD_NARGUN+1),
    [M.GOD_OLDRA]    =    oldra.Oldra   (M.GOD_OLDRA,    M.GOD_OLDRA   - M.GOD_NARGUN+1),
    [M.GOD_CHERGA]   =   cherga.Cherga  (M.GOD_CHERGA,   M.GOD_CHERGA  - M.GOD_NARGUN+1),
    [M.GOD_MALACHIN] = malachin.Malachin(M.GOD_MALACHIN, M.GOD_MALACHIN- M.GOD_NARGUN+1),
    [M.GOD_IRMOROM]  =  irmorom.Irmorom (M.GOD_IRMOROM,  M.GOD_IRMOROM - M.GOD_NARGUN+1),
    [M.GOD_SIRANI]   =   sirani.Sirani  (M.GOD_SIRANI,   M.GOD_SIRANI  - M.GOD_NARGUN+1),
    [M.GOD_MOSHRAN]  =  moshran.Moshran (M.GOD_MOSHRAN,  M.GOD_MOSHRAN - M.GOD_NARGUN+1),
    [M.GOD_ZHAMBRA]  =  zhambra.Zhambra (M.GOD_ZHAMBRA,  M.GOD_ZHAMBRA - M.GOD_NARGUN+1),
    [M.GOD_RONAGAN]  =  ronagan.Ronagan (M.GOD_RONAGAN,  M.GOD_RONAGAN - M.GOD_NARGUN+1),
}

-- These lists and sets are of god ordinals. For god object use `is_a` function
M._YOUNGER_GODS_LIST = {M.GOD_NARGUN,M.GOD_ELARA,M.GOD_ADRON,M.GOD_OLDRA,M.GOD_CHERGA,M.GOD_MALACHIN,
            M.GOD_IRMOROM,M.GOD_SIRANI,M.GOD_ZHAMBRA,M.GOD_RONAGAN,M.GOD_MOSHRAN};
M._ELDER_GODS_LIST = {M.GOD_USHARA, M.GOD_BRAGON, M.GOD_ELDAN, M.GOD_TANORA, M.GOD_FINDARI}

M.YOUNGER_GODS = common.setFromList(M._YOUNGER_GODS_LIST)
M.ELDER_GODS = common.setFromList(M._ELDER_GODS_LIST)
M.GODS = common.setUnion(M.ELDER_GODS, M.YOUNGER_GODS)

M.RESPECTED_GODS = common.setUnion(M.ELDER_GODS, M.YOUNGER_GODS)  -- copy of M.GODS
M.RESPECTED_GODS[M.GOD_MOSHRAN] = nil  -- ban Moshran

--- A 2D array of probabilities (from 0 to 1) for jealosusy between young gods.
-- A[i][j] is probability that god j compensates favour change of god i.
-- Aech row in the matrix should sum up to 1 (in latex: \forall i: \sum_{j}A[i][j] = 1 ).
-- Each column doesn't have to sum up to 1, the higher value means god j is more "jealous" / affected by others.
M._JEALOUSY_PROBABILITY = {
    --                 1:NARGUN,   3:ADRON,    5:CHERGA,   7:IRMOROM,  9:ZHAMBRA,  11:MOSHRAN,
    --                       2:ELARA,    4:OLDRA,    6:MALACHIN, 8:SIRANI,   10:RONAGAN,
    --[[ 1:NARGUN  ]] {0.00, 0.14, 0.09, 0.12, 0.07, 0.13, 0.07, 0.11, 0.11, 0.07, 0.09},
    --[[ 2:ELARA   ]] {0.14, 0.00, 0.07, 0.07, 0.07, 0.10, 0.09, 0.12, 0.10, 0.11, 0.13},
    --[[ 3:ADRON   ]] {0.08, 0.07, 0.00, 0.07, 0.07, 0.12, 0.10, 0.10, 0.11, 0.14, 0.14},
    --[[ 4:OLDRA   ]] {0.10, 0.07, 0.07, 0.00, 0.12, 0.09, 0.09, 0.08, 0.10, 0.14, 0.14},
    --[[ 5:CHERGA  ]] {0.07, 0.11, 0.11, 0.13, 0.00, 0.11, 0.09, 0.10, 0.11, 0.09, 0.08},
    --[[ 6:MALACHIN]] {0.14, 0.10, 0.09, 0.10, 0.07, 0.00, 0.08, 0.07, 0.07, 0.13, 0.15},
    --[[ 7:IRMOROM ]] {0.07, 0.12, 0.11, 0.11, 0.07, 0.10, 0.00, 0.12, 0.10, 0.07, 0.13},
    --[[ 8:SIRANI  ]] {0.10, 0.11, 0.11, 0.07, 0.07, 0.07, 0.12, 0.00, 0.07, 0.14, 0.14},
    --[[ 9:ZHAMBRA ]] {0.12, 0.11, 0.10, 0.11, 0.07, 0.07, 0.07, 0.08, 0.00, 0.12, 0.15},
    --[[10:RONAGAN ]] {0.07, 0.11, 0.10, 0.11, 0.07, 0.14, 0.07, 0.12, 0.11, 0.00, 0.10},
    --[[11:MOSHRAN ]] {0.06, 0.11, 0.10, 0.11, 0.07, 0.12, 0.12, 0.10, 0.12, 0.09, 0.00}
}

--process the probability matrix
M._JEALOUSY_CUMULATIVE_PROBABILITY = {}
for i,row in ipairs(M._JEALOUSY_PROBABILITY) do
    M._JEALOUSY_CUMULATIVE_PROBABILITY[i] = {}
    local cumsum = 0
    for j, val in ipairs(row) do
        cumsum = cumsum + val
        M._JEALOUSY_CUMULATIVE_PROBABILITY[i][j] = cumsum
    end
    assert(math.abs(cumsum-1)<0.0001, "Jealousy probability doesn't sum to 1 in row " .. i)
    M._JEALOUSY_CUMULATIVE_PROBABILITY[i][#row] = 1 -- to ensure it's never slightly below, like 0.99999
end

M._youngerOrdinalToObj = {}
for youngerOrdinal, ordinal in ipairs(M._YOUNGER_GODS_LIST) do
    M._youngerOrdinalToObj[youngerOrdinal] = M._godOrdinalToObj[ordinal]
end


---
-- Get the god  char is devoted to
-- @param charObj-- @return god object
--
function M._getDevotionGod(charObj)
    return M._godOrdinalToObj[charObj:getQuestProgress(M._QUEST_DEVOTION)]
end

---
-- Set the god  char is devoted to
-- @param charObj
-- @param godObj - god object
--
function M._setDevotionGod(charObj, godObj)
    charObj:setQuestProgress(M._QUEST_DEVOTION, godObj.ordinal)
end

---
-- Get the god  char is priest of
-- @param charObj
-- @return god object
--
function M._getPriesthoodGod(charObj)
    return M._godOrdinalToObj[charObj:getQuestProgress(M._QUEST_PRIESTHOOD)]
end

---
-- Set the god  char is a priest of
-- @param charObj
-- @param godObj - god object
--
function M._setPriesthoodGod(charObj, godObj)
    charObj:setQuestProgress(M._QUEST_PRIESTHOOD, godObj.ordinal)
end


---
-- Get the name of the god  (in each langauage)
-- @param godOrdinal
-- @return string - the name
--
function M.getNameEn(godOrdinal)
    return M._godOrdinalToObj[godOrdinal].nameEn
end
function M.getNameDe(godOrdinal)
    return M._godOrdinalToObj[godOrdinal].nameDe
end

---
-- Get the description of the god  (in each langauage)
-- @param godOrdinal
-- @return string - the description
--
function M.getDescriptionEn(godOrdinal)
    return M._godOrdinalToObj[godOrdinal].descriptionEn
end
function M.getDescriptionDe(godOrdinal)
    return M._godOrdinalToObj[godOrdinal].descriptionDe
end

---
-- Get the items needed to become devoted to the god
-- @param charObj the char to be devoted
-- @param godOrdinal
-- @return list of item ids. It is a reference and not a copy, so don't modify it
--
function M.getItemsForDevotion(charObj, godOrdinal)
    return M._godOrdinalToObj[godOrdinal]:getDevotionItems(charObj)
end

---
-- Get string describing the character relations with gods (in two languages)
-- @param charObj the char to check
function M._getCharStatus(charObj)
    local statusDe
    local statusEn
    local godObj = M._getDevotionGod(charObj)
    if not godObj then
        statusDe = "kein Anhänger einer Gottheit"
        statusEn = "not devoted to any God"
    elseif M._getPriesthoodGod(charObj) == godObj then
        statusDe = "Priester von " .. godObj.nameDe
        statusEn = "priest of " .. godObj.nameEn
    else
        statusDe = "Anhänger von " .. godObj.nameDe
        statusEn = "devoted to " .. godObj.nameEn
    end
    return statusDe, statusEn
end

---
-- Get string describing the character relations with gods, (in each language separately)
-- @param charObj the char to check
function M.getCharStatusEn(charObj)
    local statusDe, statusEn = M._getCharStatus(charObj)
    return statusEn
end
function M.getCharStatusDe(charObj)
    local statusDe, statusEn = M._getCharStatus(charObj)
    return statusDe
end



---
-- Check if char is devoted to a god
-- @param charObj the char to check
-- @param godOrdinal a god ordinal (e.g. gods.GOD_ELARA) or set of ordinals (e.g. gods.YOUNGER_GODS) to be checked.
-- If godOrdinal is not given, the function assumes gods.GODS i.e checks if char is devoted to anyone
-- If god is gods.GOD_NONE then the function returns true if char is not devoted to any god
function M.isDevoted(charObj, godOrdinal)
    godOrdinal = godOrdinal or M.GODS
    local val = charObj:getQuestProgress(M._QUEST_DEVOTION)
    if type(godOrdinal) == 'number' then
        -- a single god to check
        return (val == godOrdinal)
    else
        -- assume god is a set
        return godOrdinal[val]
    end
end
---
-- Check if char is a priest of a god
-- @param charObj the char to check
-- @param godOrdinal a god ordinal (e.g. gods.GOD_ELARA) or set of ordinals (e.g. gods.YOUNGER_GODS) to be checked.
-- If godOrdinal is not given, the function assumes gods.GODS i.e checks if char is a priest at all
-- If god is gods.GOD_NONE then the function returns true if char is not a priest
function M.isPriest(charObj, godOrdinal)
    godOrdinal = godOrdinal or M.GODS
    local val = charObj:getQuestProgress(M._QUEST_PRIESTHOOD)
    if type(godOrdinal) == 'number' then
        -- a single god to check
        return (val == godOrdinal)
    else
        -- assume god is a set
        return godOrdinal[val]
    end
end

---
-- Make the char devoted to the god (without any checks/prerequisites)
-- @param charObj the char to change
-- @param godOrdinal the target god. Should be one of gods.GODS or gods.GOD_NONE
function M.setDevoted(charObj, godOrdinal)
    local favourPenalty = 0
    local currentGodObj = M._getDevotionGod(charObj)
    if M.isDevoted(charObj, godOrdinal) then
        common.informError(charObj, "Trying to re-devote to same god.")
        return
    end
    if godOrdinal == M.GOD_NONE then
        currentGodObj:informStopBeingDevoted(charObj)
    else
        local godObj = M._godOrdinalToObj[godOrdinal]
        local favour = godObj:getFavour(charObj)
        if favour < gods_common.LOSE_DEVOTION_FAVOUR_THRESHOLD then
            -- Usually favour >= DEVOTION_FAVOUR_THRESHOLD is checked before, but a GM might bypass that.
            common.InformNLS(charObj, "Du stehst nicht in ausreichender Gunst, um ein Priester zu sein.", "Your favour is too low to be a priest.")
            return
        end

        -- Check if there is favour penalty from the current god
        if currentGodObj then
            if M.isPriest(charObj) then
                favourPenalty = gods_common.CHANGE_DEVOTION_PRIEST_PENALTY
            else
                favourPenalty = gods_common.CHANGE_DEVOTION_PENALTY
            end
        end
        godObj:informBecomeDevoted(charObj)
    end
    if M.isPriest(charObj) then
        M.setNotPriest(charObj)
    end
    charObj:setQuestProgress(M._QUEST_DEVOTION, godOrdinal) -- mark the char as devoted to the god

    -- If any penalty is due, do it now. We don't do it before to avoid spam of losing status due to low favour
    M.increaseFavour(charObj, currentGodObj.ordinal, -favourPenalty)

    if (charObj:getQuestProgress(685) > 0) and (charObj:getQuestProgress(685) < 8) then
        -- Book of your god is started but not finished -> reset the progress
        charObj:setQuestProgress(685, 0)
        charObj:setQuestProgress(686, 0)
        common.InformNLS(charObj,
            "[Ein Buch über deinen Gott] Du brauchst dieses Buch nicht mehr.",
            "[A book about your God] You don't need this book anymore."
        )
    end
end

---
-- Make the char not devoted to agod (without any checks/prerequisites)
-- @param charObj the char to change
function M.setNotDevoted(charObj)
    M.setDevoted(charObj, M.GOD_NONE)
end

---
-- Make the char a priest to his god (without prerequisites)
-- @param charObj the char to change
function M.setPriest(charObj)
    local godObj = M._getDevotionGod(charObj)
    if not godObj then
        common.informError(charObj, "Trying to set priest status with illegal god.");
        return
    end

    local favour = godObj:getFavour(charObj)
    if favour < gods_common.LOSE_PRIESTHOOD_FAVOUR_THRESHOLD then
        -- Usually favour >= PRIESTHOOD_FAVOUR_THRESHOLD is checked before, but a GM might bypass that.
        common.InformNLS(charObj, "Du stehst nicht in ausreichender Gunst, um ein Priester zu sein.", "Your favour is too low to be a priest.")
        return
    end

    godObj:informBecomePriest(charObj)

    M._setPriesthoodGod(charObj, godObj)
    charObj:setMagicType(1) -- mark the char as capable of priest magic
    -- TODO learn magic / spells?
end

---
-- Make the char not a priest
-- @param charObj the char to change
function M.setNotPriest(charObj)
    local godObj = M._getPriesthoodGod(charObj)
    if not godObj then
        common.informError(charObj, "Trying to clear priest status with illegal god.");
        return
    end

    godObj:informStopBeingPriest(charObj)
    charObj:setQuestProgress(M._QUEST_PRIESTHOOD, M.GOD_NONE)
    -- We don't clear the magic type (charObj:setMagicType), so that the user can't easily switch to another magic profession
end


---
-- Perform checks/actions after a change in char's favour
-- E.g. remove priesthood/devotion status
function M._afterFavourChange(charObj)
    local godObj = M._getDevotionGod(charObj)
    if not godObj then
        -- not devoted - nothing to do
        return
    end
    local favour = godObj:getFavour(charObj)
    if (favour < gods_common.LOSE_PRIESTHOOD_FAVOUR_THRESHOLD) and M.isPriest(charObj) then
        M.setNotPriest(charObj)
    end
    if (favour < gods_common.LOSE_DEVOTION_FAVOUR_THRESHOLD) then
        M.setNotDevoted(charObj)
    end
end

---
-- Check favour of a god
-- @param charObj the char to check
-- @param godOrdinal a god ordinal (one of gods.GODS)
-- @return signed int - the favour
function M.getFavour(charObj, godOrdinal)
    return M._godOrdinalToObj[godOrdinal]:getFavour(charObj)
end

---
-- Change favour of a god for specific character
-- @param charObj the char
-- @param godOrdinal a god (one of gods.GODS)
-- @param amount the change magnitude (an int, may be negative)
function M.increaseFavour(charObj, godOrdinal, amount)
    local godObj = M._godOrdinalToObj[godOrdinal]
    if not godObj then
        common.informError(charObj, "Favour change for invalid god.");
        return
    end
    if amount==0 then
        return
    end
    -- limiting (the limits shouldn't be reached during normal gameplay, this is to keep powergamers and cheaters from overflow)
    local targetFavour = godObj:getFavour(charObj) + amount
    if targetFavour > gods_common.MAX_FAVOUR then
        amount = gods_common.MAX_FAVOUR - godObj:getFavour(charObj)
        targetFavour = gods_common.MAX_FAVOUR
    elseif targetFavour < gods_common.MIN_FAVOUR then
        amount = gods_common.MIN_FAVOUR - godObj:getFavour(charObj)
        targetFavour = gods_common.MIN_FAVOUR
    end

    if not godObj:is_a(baseyounger.BaseYounger) then
        -- For elder gods favour simply changes
        godObj:setFavour(charObj, targetFavour)
        return
    end

    -- Young gods are jealous. Their favour always has zero sum.
    local youngerOrdinal = godObj.youngerOrdinal
    assert(M._YOUNGER_GODS_LIST[youngerOrdinal]== godOrdinal)
    local jealosySign = (amount < 0 and 1) or -1
    local absAmount = math.abs(amount)
    local changes = {}
    -- randomly distribute the change between other gods
    for i,v in ipairs(common.randomMultinomial(absAmount, M._JEALOUSY_CUMULATIVE_PROBABILITY[youngerOrdinal])) do
        changes[i] = jealosySign * v
    end
    assert(changes[youngerOrdinal] == 0, "Gods shouldn't be jealous to themselves")
    changes[youngerOrdinal]=amount
    local checkSum = 0
    for _, favourChange in pairs(changes) do
        checkSum = checkSum + favourChange
    end
    assert(checkSum == 0, "Jealousy check sum was " .. checkSum .. " instead of 0")

    -- apply the change
    for curYoungOrdinal, favourChange in pairs(changes) do
        local curGodObj = M._youngerOrdinalToObj[curYoungOrdinal]
        curGodObj:setFavour(charObj, curGodObj:getFavour(charObj) + favourChange)
    end

    M._afterFavourChange(charObj)
end

---
-- Change favour of all gods towards 0 for specific character. This function should be called periodically.
-- @param charObj the char
-- @param multiplier the change magnitude as a float. 0 means no change. 1 means everything becomes 0.
function M.favourDecay(charObj, multiplier)
    multiplier = multiplier or gods_common.FAVOUR_DECAY_COEFF
    local changes = {}
    -- start by applying the multiplier and rounding
    for _,curGodObj in pairs(M._godOrdinalToObj) do
        local oldFavour = curGodObj:getFavour(charObj)
        debug(curGodObj.nameEn .. " multiplier " .. multiplier .. " oldFavour " .. oldFavour ..
                ", desired change " .. (oldFavour * multiplier) ..
                ", rounded change " .. math.floor(oldFavour * multiplier + 0.5)
        )
        changes[curGodObj] = -1 * math.floor(oldFavour * multiplier + 0.5)
    end
    -- for younger gods we should preserve zero sum
    -- we randomly (uniformly) distribute the unbalanced part between all younger gods
    local unbalancedAmount = 0
    for _,curGodObj in pairs(M._youngerOrdinalToObj) do
        unbalancedAmount = unbalancedAmount - changes[curGodObj]
    end
    local unbalancedSign = (unbalancedAmount < 0 and -1) or 1
    local absUnbalancedAmount = math.abs(unbalancedAmount)
    debug("unbalancedAmount " .. unbalancedAmount .. ", unbalancedSign " .. unbalancedSign .. ", absUnbalancedAmount " .. absUnbalancedAmount)
    for _=1, absUnbalancedAmount do
        --choose a god randomly
        local randYoungOrdinal = math.random(#M._youngerOrdinalToObj)
        -- translate from young god index to regular god enum and apply the correct directon of change
        changes[M._youngerOrdinalToObj[randYoungOrdinal]] = changes[M._youngerOrdinalToObj[randYoungOrdinal]] + unbalancedSign*1
    end
    local checkSum = 0
    for _,curGodObj in pairs(M._youngerOrdinalToObj) do
        checkSum = checkSum - changes[curGodObj]
    end
    assert(checkSum == 0, "Jealousy check sum was " .. checkSum .. " instead of 0")

    -- apply the change
    for curGodObj,favourChange in pairs(changes) do
        curGodObj:setFavour(charObj, curGodObj:getFavour(charObj) + favourChange)
    end

    M._afterFavourChange(charObj)
end


---
-- Perform a prayer to the god and update his favour
-- @param charObj
-- @param godOrdinal
function M.pray(charObj, godOrdinal)
    local godObj = M._godOrdinalToObj[godOrdinal]
    if not godObj then
        common.informError(charObj, "Praying to invalid god.")
        return
    end

    common.TalkNLS(charObj, Character.say , "#me betet.", "#me prays.")
    if gods_common.prayerCooldownCounter:hasEnded(charObj) then
        M.increaseFavour(charObj, godOrdinal, gods_common.PRAYER_FAVOUR_INCREASE)
        gods_common.prayerCooldownCounter:restart(charObj)
    else
        -- prayed not so long ago
        common.InformNLS(charObj, "Deinem Gebet fehlte es an Hingabe.", "Your prayer wasn't whole-hearted.")
    end
end


---
-- Sacrifice an item to the god and update his favour
-- @param charObj
-- @param godOrdinal
-- @param item - scriptItem that is donated
function M.sacrifice(charObj, godOrdinal, item)
    local godObj = M._godOrdinalToObj[godOrdinal]
    if not godObj then
        common.informError(charObj, "Sacrificing to invalid god.");
        return
    end

    debug("Sacrificing item id " .. item.id .. " to " .. godObj.nameEn)
    local favourBonus = godObj:sacrifice(charObj, item)
    if favourBonus > 0 then
        M.increaseFavour(charObj, godOrdinal, favourBonus)
        world:erase(item, item.number)
    end
end

---
-- Change "sacrifice cumulative value" of all gods towards 0 for specific character, that is forget old sacrifices. This function should be called periodically.
-- @param charObj
function M.sacrificeDecay(charObj, multiplier)
    multiplier = multiplier or gods_common.SACRIFICE_DECAY_COEFF
    for _,curGodObj in pairs(M._godOrdinalToObj) do
        -- we do floor and not round, so that it can return to 0 eventually
        local newValue = math.floor((1-multiplier) * curGodObj:getSacrificeCumulativeValue(charObj))
        curGodObj:setSacrificeCumulativeValue(charObj, newValue)
    end
end

---
-- Check that all god-related variables of a char are consistent
-- @return boolean, true means everything is consistent
function M.validate(charObj)
    local devotionGodOrdinal = charObj:getQuestProgress(M._QUEST_DEVOTION)
    local priesthoodGodOrdinal = charObj:getQuestProgress(M._QUEST_PRIESTHOOD)

    -- Check questprogress has valid values
    if devotionGodOrdinal ~= M.GOD_NONE and not M.GODS[devotionGodOrdinal] then
        common.informError(charObj, "Devotion to illegal god (" .. devotionGodOrdinal .. ").")
        return false
    end
    if priesthoodGodOrdinal ~= M.GOD_NONE and priesthoodGodOrdinal ~= devotionGodOrdinal then
        common.informError(charObj, "Priesthood to wrong god (" .. priesthoodGodOrdinal .. " instead of " .. devotionGodOrdinal .. ").")
        return false
    end

    -- Check piest magic type
    if priesthoodGodOrdinal ~= M.GOD_NONE and charObj:getMagicType() ~= 1 then
        common.informError(charObj, "Priesthood with wrong magic type (" .. charObj:getMagicType() .. ").")
        return false
    end
    -- It is allowed to have charObj:getMagicType() == 1 with priesthoodGod==M.GOD_NONE. This means a char is an ex-priest (e.g. a priest that lost favour and was deprived of his status


    -- Check favour of younger gods has zero sum
    local checkSum = 0
    for _,curGodObj in pairs(M._godOrdinalToObj) do
        local favour = curGodObj:getFavour(charObj)
        -- Check favour is inside limits
        if (favour < gods_common.MIN_FAVOUR) or (favour > gods_common.MAX_FAVOUR) then
            common.informError(charObj, "Favour of " .. curGodObj.nameEn .. " is out of limits (" .. favour .. ").")
            return false
        end
        if curGodObj:is_a(baseyounger.BaseYounger) then
            checkSum = checkSum + favour
        end
    end
    if (checkSum~=0) then
        common.informError(charObj, "Favour of younger gods has non-zero sum (" .. checkSum .. ").")
        return false
    end

    return true
end


-- Register callbacks for periodic decay
gods_common.favourDecayCounter:addCallback(M.favourDecay)
gods_common.sacrificeDecayCounter:addCallback(M.sacrificeDecay)
gods_common.nargunRandomization:addCallback(nargun.RandomizeSacrificeableItems)


-- TODO review. This seems to be some old implementation that used speech for priest spells activation
--[[
local PRAYER_CONVERSION = {
    {skill = "Healing",
        gText = "bitte (.+) heilung",
        eText = "please (.+) healing"
    }
}

local PRAYER_MASS = {
    [M.GOD_NARGUN]   = {gText = "preiset narg[uú]n, gott des chaos",
                        eText = "praise narg[uú]n, god of chaos"},
    [M.GOD_???]    = {gText = "preiset",
                        eText = "praise"},
}

local PRAYER_FOLLOWER = {
    [M.GOD_NARGUN]   = {gText = "segne mich nargun",
                        eText = "bless me nargun"},
    [M.GOD_???]    = {gText = "segne mich",
                        eText = "bless me"},
}

local PRAYER_PRIEST = {
    [M.GOD_NARGUN]   = {gText = "segne mich erneut nargun",
                        eText = "bless me again nargun"},
    [M.GOD_???]    = {gText = "segne mich",
                        eText = "bless me"},
}

--]]
return M
