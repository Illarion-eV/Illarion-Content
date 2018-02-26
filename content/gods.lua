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

-- TODO: move to class
M.GOD_NAME_EN = {
    [M.GOD_USHARA]   = "Ushara",
    [M.GOD_BRAGON]   = "Brágon",
    [M.GOD_ELDAN]    = "Eldan",
    [M.GOD_TANORA]   = "Tanora",
    [M.GOD_FINDARI]  = "Findari",
    [M.GOD_NARGUN]   = "Nargún",
    [M.GOD_ELARA]    = "Elara",
    [M.GOD_ADRON]    = "Adron",
    [M.GOD_OLDRA]    = "Oldra",
    [M.GOD_CHERGA]   = "Cherga",
    [M.GOD_MALACHIN] = "Malachín",
    [M.GOD_IRMOROM]  = "Irmorom",
    [M.GOD_SIRANI]   = "Sirani",
    [M.GOD_ZHAMBRA]  = "Zhambra",
    [M.GOD_RONAGAN]  = "Ronagan",
    [M.GOD_MOSHRAN]  = "Moshran",
    [M.GOD_THEFIVE]  = "Five",
    [M.GOD_THEDEVS]  = "Developers",
}

M.GOD_NAME_DE = {
    [M.GOD_USHARA]   = "Ushara",
    [M.GOD_BRAGON]   = "Brágon",
    [M.GOD_ELDAN]    = "Eldan",
    [M.GOD_TANORA]   = "Tanora",
    [M.GOD_FINDARI]  = "Findari",
    [M.GOD_NARGUN]   = "Nargún",
    [M.GOD_ELARA]    = "Elara",
    [M.GOD_ADRON]    = "Adron",
    [M.GOD_OLDRA]    = "Oldra",
    [M.GOD_CHERGA]   = "Cherga",
    [M.GOD_MALACHIN] = "Malachín",
    [M.GOD_IRMOROM]  = "Irmorom",
    [M.GOD_SIRANI]   = "Sirani",
    [M.GOD_ZHAMBRA]  = "Zhambra",
    [M.GOD_RONAGAN]  = "Ronagan",
    [M.GOD_MOSHRAN]  = "Moshran",
    [M.GOD_THEFIVE]  = "Fünf",
    [M.GOD_THEDEVS]  = "Entwickler",
}



M.DESCRIPTION_EN = {
    [M.GOD_USHARA]="Goddess of earth";
    [M.GOD_BRAGON]="God of fire";
    [M.GOD_ELDAN]="God of spirit";
    [M.GOD_TANORA]="Goddess of water";
    [M.GOD_FINDARI]="Goddess of air";
    [M.GOD_NARGUN]="God of chaos";
    [M.GOD_ELARA]="Goddess of wisdom and knowledge";
    [M.GOD_ADRON]="God of festivities and wine";
    [M.GOD_OLDRA]="Goddess of life and fertility";
    [M.GOD_CHERGA]="Goddess of spirits and the underworld";
    [M.GOD_MALACHIN]="God of battle and hunting";
    [M.GOD_IRMOROM]="God of trade and craftsmanship";
    [M.GOD_SIRANI]="Goddess of love and pleasure";
    [M.GOD_ZHAMBRA]="God of friendship and loyalty";
    [M.GOD_RONAGAN]="God of thieves and shadows";
    [M.GOD_MOSHRAN]="God of blood and bones";
}

M.DESCRIPTION_DE ={
    [M.GOD_BRAGON]="der Gott des Feuers";
    [M.GOD_ELDAN]="der Gott des Geistes";
    [M.GOD_FINDARI]="die Göttin der Luft";
    [M.GOD_TANORA]="die Göttin des Wassers";
    [M.GOD_USHARA]="die Göttin der Erde";
    [M.GOD_ADRON]="der Gott des Weines und der Feste";
    [M.GOD_CHERGA]="die Göttin der Geister und der Unterwelt";
    [M.GOD_ELARA]="die Göttin des Wissens und der Weisheit";
    [M.GOD_IRMOROM]="der Gott des Handels und des Handwerks";
    [M.GOD_MALACHIN]="der Gott der Jagd und der Schlachten";
    [M.GOD_MOSHRAN]="der Gott des Blutes und der Gebeine";
    [M.GOD_NARGUN]="der Gott des Chaos";
    [M.GOD_OLDRA]="die Göttin der Fruchtbarkeit und des Lebens";
    [M.GOD_RONAGAN]="der Gott der Diebe und der Schatten";
    [M.GOD_SIRANI]="die Göttin der Liebe und der Freude";
    [M.GOD_ZHAMBRA]="der Gott der Freundschaft und Treue";
}

---
-- Check if char is devoted to a god
-- @param User the char to check
-- @param god a god (e.g. gods.Elara) or set of gods (e.g. gods.YOUNGER_GODS) to be checked.
-- If god is not given, the function assumes gods.GODS i.e checks if char is devoted to anyone
-- If god is gods.GOD_NONE then the function returns true if char is not devoted to any god
function M.isDevoted(User, god)
    god = god or M.GODS
    local val = User:getQuestProgress(401)
    if type(god) == 'number' then
        -- a single god to check
        return (val == god)
    else
        -- assume god is a set
        return god[val]
    end
end
---
-- Check if char is a priest of a god
-- @param User the char to check
-- @param god a god (e.g. gods.Elara) or set of gods (e.g. gods.YOUNGER_GODS) to be checked.
-- If god is not given, the function assumes gods.GODS i.e checks if char is devoted to anyone
-- If god is gods.GOD_NONE then the function returns true if char is not a priest
function M.isPriest(User, god)
    god = god or M.GODS
    local val = User:getQuestProgress(402)
    if type(god) == 'number' then
        -- a single god to check
        return (val == god)
    else
        -- assume god is a set
        return god[val]
    end
end

---
-- Make the char devoted to the god (without any checks/prerequisites)
-- @param User the char to change
-- @param god the target god. Should be one of gods.GODS or gods.GOD_NONE (to undevote)
function M.setDevoted(User, god)
    if M.isDevoted(User, god) then
        User:inform("[ERROR] Trying to re-devote to same god. Please inform a developer.");
        return
    end
    if god == M.GOD_NONE then
        common.InformNLS(User, "FIXME " .. M.GOD_NAME_DE[god] .. " FIXME .", "FIXME " .. M.GOD_NAME_EN[god] .. " hates you and denies your faith!")
        -- FIXME visual effects ?
    elseif M.RESPECTED_GODS[god] then
        common.InformNLS(User, "Ihr empfangt den Segen " .. M.GOD_NAME_DE[god] .. "s und weiht euer Leben dem Glaube an die Gottheit.", "You receive the blessing of " .. M.GOD_NAME_EN[god] .. " and devote your life to the faith in the divinity.")
        world:gfx(globalvar.gfxRAIN, User.pos)
        world:makeSound(globalvar.sfxSNARING, User.pos)
    else
        -- Moshran
        common.InformNLS(User, "FIXME Ihr empfangt den Segen " .. M.GOD_NAME_DE[god] .. "s und weiht euer Leben dem Glaube an die Gottheit.", "FIXME " .. M.GOD_NAME_EN[god] .. " is your master now.")
        world:gfx(globalvar.gfxDEMFIRE, User.pos)
        world:makeSound(globalvar.sfxEVIL_LAUGH, User.pos)
    end
    if M.isPriest(User) then
        -- too much spam, this was explained already
        -- common.InformNLS(User, "FIXME", "FIXME You can't remain a priest after switching gods")
        M.setNotPriest(User)
    end
    User:setQuestProgress(401, god) -- mark the char as devoted to the god
end

---
-- Make the char a priest to his god (without any checks/prerequisites)
-- @param User the char to change
function M.setPriest(User)
    local god = User:getQuestProgress(401)
    if not M.GODS[god] then
        User:inform("[ERROR] Trying to set priest status with illegal god. Please inform a developer.");
        return
    end

    if M.RESPECTED_GODS[god] then
        common.InformNLS(User, "FIXME " .. M.GOD_NAME_DE[god] .. "", "FIXME You are now a priest of " .. M.GOD_NAME_EN[god] .. ", have fun.")
        world:gfx(globalvar.gfxRAIN, User.pos)
        world:makeSound(globalvar.sfxSNARING, User.pos)
    else
    -- Moshran
    common.InformNLS(User, "FIXME " .. M.GOD_NAME_DE[god] .. "", "FIXME " .. M.GOD_NAME_EN[god] .. " consumes your soul and gives demonic powers to the empty shell that remains.")
    world:gfx(globalvar.gfxDEMFIRE, User.pos)
    world:makeSound(globalvar.sfxEVIL_LAUGH, User.pos)
    end

    User:setQuestProgress(402, god) -- mark the char as priest of this god
    User:setMagicType(1) -- mark the char as capable of priest magic
    -- FIXME learn magic?
end

---
-- Make the char not a priest
-- @param User the char to change
function M.setNotPriest(User)
    local god = User:getQuestProgress(402)
    if not M.GODS[god] then
        User:inform("[ERROR] Trying to clear priest status with illegal god. Please inform a developer.");
        return
    end
    common.InformNLS(User, "FIXME " .. M.GOD_NAME_DE[god] .. " FIXME .", "FIXME " .. M.GOD_NAME_EN[god] .. " hates you and denies your priesthood!")
    world:gfx(globalvar.gfxBLITZ, User.pos)
    world:makeSound(globalvar.sfxTHUNDER, User.pos)

    User:setQuestProgress(402, M.GOD_NONE)
    -- We don't clear the magic type (User:setMagicType), so that the user can't easily switch to another magic profession
end


---
-- Check favour of a god
-- @param User the char to check
-- @param god a god (one of gods.GODS)
-- @return signed int - the favour
function M.getFavour(User, god)
    return User:getQuestProgress(402+god)
end

---
-- Change favour of a god for specific character
-- @param User the char
-- @param god a god (one of gods.GODS)
-- @param amount the change magnitude (an int, may be negative)
function M.increaseFavour(User, god, amount)
    if not M.GODS[god] then
        User:inform("[ERROR] Favour change for invalid god. Please inform a developer.");
        return
    end
    if amount==0 then
        return
    end

    if not M.YOUNGER_GODS[god] then
        -- For elder gods favour simply changes
        User:setQuestProgress(402+god, User:getQuestProgress(402+god) + amount)
        return
    end

    -- Young gods are jealous. Their favour always has zero sum.
    local youngGodIdx = god - M.GOD_NARGUN + 1
    assert(M._YOUNGER_GODS_LIST[youngGodIdx]==god)
    local jealosySign = (amount < 0 and 1) or -1
    local absAmount = math.abs(amount)
    local changes = {}
    -- randomly distribute the change between other gods
    for i,v in ipairs(randomMultinomial(absAmount, M._JEALOUSY_CUMULATIVE_PROBABILITY[youngGodIdx])) do
        -- translate from young god index to regular god enum and apply the correct directon of change
        changes[M._YOUNGER_GODS_LIST[i]] = jealosySign * v
    end
    assert(changes[god] == 0, "Gods shouldn't be jealous to themselves")
    changes[god]=amount
    local checkSum = 0
    for _, favourChange in pairs(changes) do
        checkSum = checkSum + favourChange
    end
    assert(checkSum == 0, "Jealousy check sum was " .. checkSum .. " instead of 0")

    -- apply the change
    for iGod, favourChange in pairs(changes) do
        --User:inform(M.GOD_NAME_EN[iGod] .. " favour change: " .. favourChange)
        User:setQuestProgress(402+ iGod, User:getQuestProgress(402+ iGod) + favourChange)
    end

    return
end

---
-- Change favour of all gods towards 0 for specific character. A function should be called periodically.
-- @param User the char
-- @param multiplier the change magnitude as a float. 0 means no change. 1 means everything becomes 0.
function M.favourDecay(User, multiplier)
    local changes = {}
    -- start by applying the multiplier and rounding
    for iGod,_ in pairs(M.GODS) do
        local oldFavour = User:getQuestProgress(402 + iGod)
        User:inform(M.GOD_NAME_EN[iGod] .. " mult " .. multiplier .. " oldfav " .. oldFavour .. " " ..
                (oldFavour * multiplier) .. " " ..
                (oldFavour * multiplier + 0.5) .. " " ..
                math.floor(oldFavour * multiplier + 0.5)
        )
        changes[iGod] = -1 * math.floor(oldFavour * multiplier + 0.5)
    end
    -- for younger gods we should preserve zero sum
    -- we randomly (uniformly) distribute the unbalanced part between all younger gods
    local unbalancedAmount = 0
    for iGod,_ in pairs(M.YOUNGER_GODS) do
        unbalancedAmount = unbalancedAmount - changes[iGod]
    end
    local unbalancedSign = (unbalancedAmount < 0 and -1) or 1
    local absUnbalancedAmount = math.abs(unbalancedAmount)
    User:inform(unbalancedAmount .. " " .. unbalancedSign .. " " .. absUnbalancedAmount)
    for _=1, absUnbalancedAmount do
        --choose a god randomly
        local rand_god = math.random(#M._YOUNGER_GODS_LIST)
        -- translate from young god index to regular god enum and apply the correct directon of change
        changes[M._YOUNGER_GODS_LIST[rand_god]] = changes[M._YOUNGER_GODS_LIST[rand_god]] + unbalancedSign
    end
    local checkSum = 0
    for iGod,_ in pairs(M.YOUNGER_GODS) do
        checkSum = checkSum - changes[iGod]
    end
    assert(checkSum ==0, "Jealousy check sum was " .. checkSum .. " instead of 0")

    -- apply the change
    for iGod, favourChange in pairs(changes) do
        User:inform(M.GOD_NAME_EN[iGod] .. " favour change: " .. favourChange)
        User:setQuestProgress(402+ iGod, User:getQuestProgress(402+ iGod) + favourChange)
    end

end


function M.pray(User, god)
    common.TalkNLS(User, Character.say , "#me FIXME", "#me FIXME prays to " .. M.GOD_NAME_EN[god])
    -- FIXME adjust numbers when favour is implemented
    -- TODO cooldown
    M.increaseFavour(User, god, 20)
end


---
-- Check that all god-related variables of a char are consistent
-- @return boolean, true means everything is consistent
function M.validate(User)
    local devotionGod = User:getQuestProgress(401)
    local priesthoodGod = User:getQuestProgress(402)

    -- Check questprogress has valid values
    if devotionGod ~= M.GOD_NONE and not M.GODS[devotionGod] then
        User:inform("[ERROR] Devotion to illegal god (" .. devotionGod .. "). Please inform a developer.")
        return false
    end
    if priesthoodGod ~= M.GOD_NONE and priesthoodGod ~= devotionGod then
        User:inform("[ERROR] Priesthood to wrong god (" .. priesthoodGod .. " instead of " .. devotionGod .. "). Please inform a developer.")
        return false
    end

    -- Check piest magic type
    if priesthoodGod ~= M.GOD_NONE and User:getMagicType() ~= 1 then
        User:inform("[ERROR] Priesthood with wrong magic type (" .. User:getMagicType() .. "). Please inform a developer.")
        return false
    end
    -- It is allowed to have User:getMagicType() == 1 with priesthoodGod==M.GOD_NONE. This means a char is an ex-priest (e.g. a priest that lost favour and was deprived of his status

    -- TODO check favour is inside limits

    -- Check favour of younger gods has zero sum
    local checkSum = 0
    for iGod,_ in pairs(M.YOUNGER_GODS) do
        checkSum = checkSum + M.getFavour(User, iGod)
    end
    if (checkSum~=0) then
        User:inform("[ERROR] Favour of younger gods has non-zero sum (" .. checkSum .. "). Please inform a developer.")
        return false
    end

    return true
end

M.ITEMS_DEVOTION = {
    -- FIXME
    [M.GOD_NARGUN]       = {{id = 2, number = 1}},
    [M.GOD_ELARA]        = {{id = 2, number = 1}},
    [M.GOD_ADRON]        = {{id = 2, number = 1}},
    [M.GOD_OLDRA]        = {{id = 2551, number = 1}, {id = 2552, number = 1}},
    [M.GOD_CHERGA]       = {{id = 2, number = 1}},
    [M.GOD_MALACHIN]     = {{id = 2, number = 1}},
    [M.GOD_IRMOROM]      = {{id = 2, number = 1}},
    [M.GOD_SIRANI]       = {{id = 2, number = 1}},
    [M.GOD_ZHAMBRA]      = {{id = 2, number = 1}},
    [M.GOD_RONAGAN]      = {{id = 2, number = 1}},
    [M.GOD_MOSHRAN]      = {{id = 2551, number = 1}, {id = 2553, number = 1}},
}



-- FIXME *** Everything between this line should be reviewed. Most likely it is dead code that never worked ***
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
    [M.GOD_ELARA]    = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_ADRON]    = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_OLDRA]    = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_CHERGA]   = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_MALACHIN] = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_IRMOROM]  = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_SIRANI]   = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_ZHAMBRA]  = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_RONAGAN]  = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_MOSHRAN]  = {gText = "preiset",
                        eText = "praise"},
    [M.GOD_THEFIVE]  = {gText = "preiset",
                        eText = "praise"},
}

PRAYER_FOLLOWER = {
    [M.GOD_NARGUN]   = {gText = "segne mich nargun",
                        eText = "bless me nargun"},
    [M.GOD_ELARA]    = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_ADRON]    = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_OLDRA]    = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_CHERGA]   = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_MALACHIN] = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_IRMOROM]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_SIRANI]   = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_ZHAMBRA]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_RONAGAN]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_MOSHRAN]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_THEFIVE]  = {gText = "segnet mich",
                        eText = "bless me"},
}

PRAYER_PRIEST = {
    [M.GOD_NARGUN]   = {gText = "segne mich erneut nargun",
                        eText = "bless me again nargun"},
    [M.GOD_ELARA]    = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_ADRON]    = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_OLDRA]    = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_CHERGA]   = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_MALACHIN] = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_IRMOROM]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_SIRANI]   = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_ZHAMBRA]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_RONAGAN]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_MOSHRAN]  = {gText = "segne mich",
                        eText = "bless me"},
    [M.GOD_THEFIVE]  = {gText = "segnet mich",
                        eText = "bless me"},
}

ALTARS = {
    [M.GOD_NARGUN]    = position(-69,-100,0),
    [M.GOD_ELARA]        = position(0,0,0),
    [M.GOD_ADRON]        = position(0,0,0),
    [M.GOD_OLDRA]        = position(0,0,0),
    [M.GOD_CHERGA]       = position(0,0,0),
    [M.GOD_MALACHIN]     = position(0,0,0),
    [M.GOD_IRMOROM]      = position(0,0,0),
    [M.GOD_SIRANI]       = position(0,0,0),
    [M.GOD_ZHAMBRA]      = position(0,0,0),
    [M.GOD_RONAGAN]      = position(0,0,0),
    [M.GOD_MOSHRAN]    = position(0,0,0),
    [M.GOD_THEFIVE]      = position(0,0,0)
}

ITEMS_FOLLOWER = {
    [M.GOD_NARGUN]    = {{id = 2, number = 1}},
    [M.GOD_ELARA]        = {{id = 2, number = 1}},
    [M.GOD_ADRON]        = {{id = 2, number = 1}},
    [M.GOD_OLDRA]        = {{id = 2, number = 1}},
    [M.GOD_CHERGA]       = {{id = 2, number = 1}},
    [M.GOD_MALACHIN]     = {{id = 2, number = 1}},
    [M.GOD_IRMOROM]      = {{id = 2, number = 1}},
    [M.GOD_SIRANI]       = {{id = 2, number = 1}},
    [M.GOD_ZHAMBRA]      = {{id = 2, number = 1}},
    [M.GOD_RONAGAN]      = {{id = 2, number = 1}},
    [M.GOD_MOSHRAN]    = {{id = 2, number = 1}},
    [M.GOD_THEFIVE]      = {{id = 2, number = 1}}
}

ITEMS_PRIEST = {
    [M.GOD_NARGUN]    = {{id = 2, number = 1}},
    [M.GOD_ELARA]        = {{id = 2, number = 1}},
    [M.GOD_ADRON]        = {{id = 2, number = 1}},
    [M.GOD_OLDRA]        = {{id = 2, number = 1}},
    [M.GOD_CHERGA]       = {{id = 2, number = 1}},
    [M.GOD_MALACHIN]     = {{id = 2, number = 1}},
    [M.GOD_IRMOROM]      = {{id = 2, number = 1}},
    [M.GOD_SIRANI]       = {{id = 2, number = 1}},
    [M.GOD_ZHAMBRA]      = {{id = 2, number = 1}},
    [M.GOD_RONAGAN]      = {{id = 2, number = 1}},
    [M.GOD_MOSHRAN]    = {{id = 2, number = 1}},
    [M.GOD_THEFIVE]      = {{id = 2, number = 1}}
}

-- magic flags
-- category runes
RUNE_HEALING = 1;
-- other runes
RUNE_SMALL = 32;
--]]
return M
