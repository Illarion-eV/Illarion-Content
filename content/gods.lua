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
--Overview of queststatus:
--401 contains the ID of the god the character is devoted to
--402 contains the ID of the god the character is a priest of. MUST be equal to 401 or 0.
--403-418 contains favour (as signed int) of the corresponding god.

local common = require("base.common")
local globalvar = require("base.globalvar")
local math = require("math")

local gods_cooldowns_common = require("content._gods.gods_cooldowns_common")

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


--TODO move to a separate file
---
-- Turn a list into a "set"
-- Use set[item] to check if an item is contained in set
-- Taken from: http://lua-users.org/wiki/SetOperations
-- For more operaions (union, intersection) see the above and also https://www.lua.org/pil/13.1.html
--@param t list of values to be included in the set
local function set(t)
    local s = {}
    for _,v in pairs(t) do s[v] = true end
    return s
end

---
-- Take two sets and create a union (set containing all items from the sets, without repetition)
-- @param a - a set
-- @param b - a set
local function setUnion(a, b)
    local s = {}
    for v, _ in pairs(a) do s[v] = true end
    for v, _ in pairs(b) do s[v] = true end
    return s
end

--- Sample from categorical distribution, e.g. rolling an N-sided die
-- @param cumulativeProb - array of legth N - cumulative sum of probabilities
--          should be monotonic non-decreasing, first element is the probability of first category
--          every other element is sum of previous element and probability of current category
--          last element should be 1
-- @return int - the index of category that won
--
local function randomCategorical(cumulativeProb)
    local r = math.random()
    local category
    for i,v in ipairs(cumulativeProb) do
        if r <= v then
            category = i
            break
        end
    end
    assert(category, "Failed sampling categorical distribution, last cumulativeProbability was " .. cumulativeProb[#cumulativeProb])
    return category
end

--- Sample from multinomial distribution, i.e. repeated categorical trials
-- @param numTrials - number of categorical trials to simulate. Sum of values in returned array will be equal to this.
-- @param cumulativeProb - cumulative sum of probabilities, same as in randomCategorical function
-- @return array of integers - number of times each category won
--
local function randomMultinomial(numTrials, cumulativeProb)
    local result = {}
    for i = 1, #cumulativeProb do
        result[i] = 0
    end
    for _ = 1, numTrials do
        local category = randomCategorical(cumulativeProb)
        result[category] = result[category] + 1
    end
    return result
end

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

M.YOUNGER_GODS = set(M._YOUNGER_GODS_LIST)
M.ELDER_GODS = set(M._ELDER_GODS_LIST)
M.GODS = setUnion(M.ELDER_GODS, M.YOUNGER_GODS)

M.RESPECTED_GODS = setUnion(M.ELDER_GODS, M.YOUNGER_GODS)  -- copy of M.GODS
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
-- Get the god  user is devoted to
-- @param charobj
-- @return god object
--
function M._getDevotionGod(User)
    return M._godOrdinalToObj[User:getQuestProgress(M._QUEST_DEVOTION)]
end

---
-- Set the god  user is devoted to
-- @param charobj
-- @param godObj - god object
--
function M._setDevotionGod(User, godObj)
    User:setQuestProgress(M._QUEST_DEVOTION, godObj.ordinal)
end

---
-- Get the god  user is priest of
-- @param charobj
-- @return god object
--
function M._getPriesthoodGod(User)
    return M._godOrdinalToObj[User:getQuestProgress(M._QUEST_PRIESTHOOD)]
end

---
-- Set the god  user is devoted to
-- @param charobj
-- @param godObj - god object
--
function M._setPriesthoodGod(User, godObj)
    User:setQuestProgress(M._QUEST_PRIESTHOOD, godObj.ordinal)
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
-- @param godOrdinal
-- @return list of item ids. It is a reference and not a copy, so don't modify it
--
function M.getItemsForDevotion(godOrdinal)
    return M._godOrdinalToObj[godOrdinal].devotionItems
end

---
-- Get string describing the character relations with gods (in two languages)
-- @param charobj the char to check
function M.getCharStatus(User)
    local statusDe
    local statusEn
    local godObj = M._getDevotionGod(User)
    if not godObj then
        statusDe = "FIXME not devoted to any God"
        statusEn = "not devoted to any God"
    elseif M._getPriesthoodGod(User) == godObj then
        statusDe = "FIXME priest of " .. godObj.nameEn
        statusEn = "priest of " .. godObj.nameEn
    else
        statusDe = "FIXME devoted to " .. godObj.nameEn
        statusEn = "devoted to " .. godObj.nameEn
    end
    return statusDe, statusEn
end


---
-- Check if char is devoted to a god
-- @param charobj the char to check
-- @param godOrdinal a god ordinal (e.g. gods.GOD_ELARA) or set of ordinals (e.g. gods.YOUNGER_GODS) to be checked.
-- If godOrdinal is not given, the function assumes gods.GODS i.e checks if char is devoted to anyone
-- If god is gods.GOD_NONE then the function returns true if char is not devoted to any god
function M.isDevoted(User, godOrdinal)
    godOrdinal = godOrdinal or M.GODS
    local val = User:getQuestProgress(M._QUEST_DEVOTION)
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
-- @param charobj the char to check
-- @param godOrdinal a god ordinal (e.g. gods.GOD_ELARA) or set of ordinals (e.g. gods.YOUNGER_GODS) to be checked.
-- If godOrdinal is not given, the function assumes gods.GODS i.e checks if char is a priest at all
-- If god is gods.GOD_NONE then the function returns true if char is not a priest
function M.isPriest(User, godOrdinal)
    godOrdinal = godOrdinal or M.GODS
    local val = User:getQuestProgress(M._QUEST_PRIESTHOOD)
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
-- @param charobj the char to change
-- @param godOrdinal the target god. Should be one of gods.GODS
function M.setDevoted(User, godOrdinal)
    if M.isDevoted(User, godOrdinal) then
        User:inform("[ERROR] Trying to re-devote to same god. Please inform a developer.");
        return
    end
    if godOrdinal == M.GOD_NONE then
        -- TODO undevotion
        User:inform("[ERROR] Undevoting was not implemented and shouldn't have been used. Please inform a developer.");
    else
        --TODO favour penalty if was devoted/priest of another
        local godObj = M._godOrdinalToObj[godOrdinal]
        godObj:informBecomeDevoted(User)
    end
    if M.isPriest(User) then
        -- too much spam, this was explained already
        -- common.InformNLS(User, "", "You can't remain a priest after switching gods")
        M.setNotPriest(User)
    end
    User:setQuestProgress(M._QUEST_DEVOTION, godOrdinal) -- mark the char as devoted to the god
end

---
-- Make the char a priest to his god (without any checks/prerequisites)
-- @param charobj the char to change
function M.setPriest(User)
    local godObj = M._getDevotionGod(User)
    if not godObj then
        User:inform("[ERROR] Trying to set priest status with illegal god. Please inform a developer.");
        return
    end

    godObj:informBecomePriest(User)

    M._setPriesthoodGod(User, godObj)
    User:setMagicType(1) -- mark the char as capable of priest magic
    -- FIXME learn magic?
end

---
-- Make the char not a priest
-- @param charobj the char to change
function M.setNotPriest(User)
    local godObj = M._getPriesthoodGod(User)
    if not godObj then
        User:inform("[ERROR] Trying to clear priest status with illegal god. Please inform a developer.");
        return
    end

    godObj:informStopBeingPriest(User)
    User:setQuestProgress(M._QUEST_PRIESTHOOD, M.GOD_NONE)
    -- We don't clear the magic type (User:setMagicType), so that the user can't easily switch to another magic profession
end


---
-- Check favour of a god
-- @param charobj the char to check
-- @param godOrdinal a god ordinal (one of gods.GODS)
-- @return signed int - the favour
function M.getFavour(User, godOrdinal)
    return M._godOrdinalToObj[godOrdinal].getFavour(User)
end

---
-- Change favour of a god for specific character
-- @param charobj the char
-- @param godOrdinal a god (one of gods.GODS)
-- @param amount the change magnitude (an int, may be negative)
function M.increaseFavour(User, godOrdinal, amount)
    local godObj = M._godOrdinalToObj[godOrdinal]
    if not godObj then
        User:inform("[ERROR] Favour change for invalid god. Please inform a developer.");
        return
    end
    if amount==0 then
        return
    end

    if not godObj:is_a(baseyounger.BaseYounger) then
        -- For elder gods favour simply changes
        godObj:setFavour(User, godObj:getFavour(User) + amount)
        return
    end

    -- Young gods are jealous. Their favour always has zero sum.
    local youngerOrdinal = godObj.youngerOrdinal
    assert(M._YOUNGER_GODS_LIST[youngerOrdinal]== godOrdinal)
    local jealosySign = (amount < 0 and 1) or -1
    local absAmount = math.abs(amount)
    local changes = {}
    -- randomly distribute the change between other gods
    for i,v in ipairs(randomMultinomial(absAmount, M._JEALOUSY_CUMULATIVE_PROBABILITY[youngerOrdinal])) do
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
        --User:inform(M.GOD_NAME_EN[iGod] .. " favour change: " .. favourChange)
        local curGodObj = M._youngerOrdinalToObj[curYoungOrdinal]
        curGodObj:setFavour(User, curGodObj:getFavour(User) + favourChange)
    end

    return
end

---
-- Change favour of all gods towards 0 for specific character. This function should be called periodically.
-- @param charobj the char
-- @param multiplier the change magnitude as a float. 0 means no change. 1 means everything becomes 0.
function M.favourDecay(User, multiplier)
    multiplier = multiplier or gods_cooldowns_common.DONATION_DECAY_COEFF
    local changes = {}
    -- start by applying the multiplier and rounding
    for _,curGodObj in pairs(M._godOrdinalToObj) do
        local oldFavour = curGodObj:getFavour(User)
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
        changes[M._youngerOrdinalToObj[randYoungOrdinal]] = changes[M._youngerOrdinalToObj[randYoungOrdinal]] + unbalancedSign
    end
    local checkSum = 0
    for _,curGodObj in pairs(M._youngerOrdinalToObj) do
        checkSum = checkSum - changes[curGodObj]
    end
    assert(checkSum == 0, "Jealousy check sum was " .. checkSum .. " instead of 0")

    -- apply the change
    for curGodObj,favourChange in pairs(changes) do
        curGodObj:setFavour(User, curGodObj:getFavour(User) + favourChange)
    end

end


---
-- Perform a prayer to the god and update his favour
-- @param charobj
-- @param godOrdinal
function M.pray(User, godOrdinal)
    local godObj = M._godOrdinalToObj[godOrdinal]
    if not godObj then
        User:inform("[ERROR] Praying to invalid god. Please inform a developer.");
        return
    end

    common.TalkNLS(User, Character.say , "#me FIXME pray " .. godObj.nameDe, "#me FIXME prays to " .. godObj.nameEn)
    if gods_cooldowns_common.prayerCooldownCounter:hasEnded(User) then
        M.increaseFavour(User, godOrdinal, gods_cooldowns_common.PRAYER_FAVOUR_INCREASE)
        gods_cooldowns_common.prayerCooldownCounter:restart(User)
    else
        -- prayed not so long ago
        common.InformNLS(User, "FIXME", "FIXME Thou shalt not take the name of the Lord thy God in vain.")
    end

end


---
-- Check that all god-related variables of a char are consistent
-- @return boolean, true means everything is consistent
function M.validate(User)
    local devotionGodOrdinal = User:getQuestProgress(M._QUEST_DEVOTION)
    local priesthoodGodOrdinal = User:getQuestProgress(M._QUEST_PRIESTHOOD)

    -- Check questprogress has valid values
    if devotionGodOrdinal ~= M.GOD_NONE and not M.GODS[devotionGodOrdinal] then
        User:inform("[ERROR] Devotion to illegal god (" .. devotionGodOrdinal .. "). Please inform a developer.")
        return false
    end
    if priesthoodGodOrdinal ~= M.GOD_NONE and priesthoodGodOrdinal ~= devotionGodOrdinal then
        User:inform("[ERROR] Priesthood to wrong god (" .. priesthoodGodOrdinal .. " instead of " .. devotionGodOrdinal .. "). Please inform a developer.")
        return false
    end

    -- Check piest magic type
    if priesthoodGodOrdinal ~= M.GOD_NONE and User:getMagicType() ~= 1 then
        User:inform("[ERROR] Priesthood with wrong magic type (" .. User:getMagicType() .. "). Please inform a developer.")
        return false
    end
    -- It is allowed to have User:getMagicType() == 1 with priesthoodGod==M.GOD_NONE. This means a char is an ex-priest (e.g. a priest that lost favour and was deprived of his status

    -- TODO check favour is inside limits

    -- Check favour of younger gods has zero sum
    local checkSum = 0
    for _,curGodObj in pairs(M._youngerOrdinalToObj) do
        checkSum = checkSum + curGodObj:getFavour(User)
    end
    if (checkSum~=0) then
        User:inform("[ERROR] Favour of younger gods has non-zero sum (" .. checkSum .. "). Please inform a developer.")
        return false
    end

    return true
end

---
--
-- @param charobj
-- @param godOrdinal
function M.donationDecay(User)

end


-- Register callbacks for periodic decay
gods_cooldowns_common.favourDecayCounter:addCallback(M.favourDecay)
gods_cooldowns_common.donationDecayCounter:addCallback(M.donationDecay)


-- FIXME *** Everything between this line should be reviewed ***
--[[
PRAYER_CONVERSION = {
    {skill = "Healing",
        gText = "bitte (.+) heilung",
        eText = "please (.+) healing"
    }
}

PRAYER_MASS = {
    [M.GOD_NARGUN]   = {gText = "preiset narg[uú]n, gott des chaos",
                        eText = "praise narg[uú]n, god of chaos"},
    [M.GOD_???]    = {gText = "preiset",
                        eText = "praise"},
}

PRAYER_FOLLOWER = {
    [M.GOD_NARGUN]   = {gText = "segne mich nargun",
                        eText = "bless me nargun"},
    [M.GOD_???]    = {gText = "segne mich",
                        eText = "bless me"},
}

PRAYER_PRIEST = {
    [M.GOD_NARGUN]   = {gText = "segne mich erneut nargun",
                        eText = "bless me again nargun"},
    [M.GOD_???]    = {gText = "segne mich",
                        eText = "bless me"},
}

--]]
return M
