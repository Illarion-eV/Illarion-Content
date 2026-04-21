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

--[[

    Pulsegwynt shares part of the damage you and your bonded partner receives.
    % of damage reduced is calculated based on caster's nature magic scaling
    The damage the recipient is to take is converted to nature damage and as such impacted by nature resistance

    Who you are bonded with is stored in a Lua table and thus reset with an !fr or server crash.
    This avoids the lag associated with ScriptVars and avoids the issue of your bonded partner being offline when being replaced.
]]

local shared = require("magic.nature.shared")

local M = {}

M.healthLimit = 2000

M.existingBonds = {}

local function verifyBond(char)

    if M.existingBonds[char.id] then
        local opposingBondExists = M.existingBonds[M.existingBonds[char.id].partner]
        if opposingBondExists and opposingBondExists.partner == char.id then
            return M.existingBonds[char.id] -- Bond still in place with a valid partner
        end
    end

    M.existingBonds[char.id] = nil

    return false
end

local function alreadyPartners(user, target)

    local targetBond = verifyBond(target)
    local userBond = verifyBond(user)

    if targetBond and userBond and userBond.partner == target.id and targetBond.partner == user.id then
        return true
    end

    return false
end

local function percentageToReduce(user, spellName)

    local basePercentage = 5 -- at least 5%
    local percentage = 10 -- Default 10%
    percentage = shared.scaleEffect(user, spellName, percentage)

    local maxPercentage = 50 -- Max 50%

    return math.floor(math.min(maxPercentage, math.max(basePercentage, percentage)))
end

local function percentageDamageToTake(user, spellName, target)

    local basePercentage = 5 -- at least 5%
    local percentage = 10 -- Default 10%
    percentage = shared.scaleEffect(user, spellName, percentage, target)

    local maxPercentage = 50 -- Max 50%

    return math.floor(math.min(maxPercentage, math.max(basePercentage, percentage)))
end

local function findPartner(defender, partnerId)

    local players = world:getPlayersInRangeOf(defender.pos, 10)

    for _, player in pairs(players) do
        if player.id == partnerId then
            return player
        end
    end

    return false
end

function M.breakBond(defender, partner)

    M.existingBonds[defender.id] = nil
    M.existingBonds[partner.id] = nil

    local informText = {german = "Du oder dein Partner seid zu schwer verwundet, um die Bindung aufrechtzuerhalten, wodurch sie zerbricht.", english = "You or your partner is too wounded to maintain the bond, causing it to break."}

    defender:inform(informText.german, informText.english)
    partner:inform(informText.german, informText.english)
end

function M.impactOnDamageTaken(defender, damageTaken)

    local defenderBond = verifyBond(defender)

    if not defenderBond then -- no bond, no point continuing
        return damageTaken
    end

    local partner = findPartner(defender, defenderBond.partner)

    if not partner then -- Partner not online or not in range
        return damageTaken
    end

    local partnerBond = verifyBond(partner)

    if not partnerBond then -- Partner bond is missing
        return damageTaken
    end

    local damageReduction = damageTaken*defenderBond.damageReduced/100

    local partnerDamage = damageTaken*partnerBond.damageTaken/100

    return damageTaken-damageReduction, partner, partnerDamage
end

local function tooWeak(user, target)

    local userHP = user:increaseAttrib("hitpoints", 0)
    local targetHP = target:increaseAttrib("hitpoints", 0)

    if userHP <= M.healthLimit or targetHP <= M.healthLimit then
        user:inform("Du und/oder dein Ziel seid derzeit zu geschwächt, um eine Bindung aufrechtzuerhalten, und müsst euch zunächst von euren Verletzungen erholen.", "You and/or your target are too weak to maintain a bond right now and must first recover from your injuries.")
        return true
    end

    return false
end

function M.effect(user, location, target)

    local spellName = "Pulsegwynt"

    world:gfx(52, location)
    world:makeSound(13, location)

    if tooWeak(user, target) then -- Second check in case either were too wounded during the cast time
        return
    end

    local skipInform = alreadyPartners(user, target) --This spell will likely be used for training early on, so avoiding repetitive informs makes sense

    if not skipInform then
        if verifyBond(user) then
            user:inform("Du löst die Bindung zu deinem vorherigen Partner und bist nun mit deinem neuen Ziel verbunden. In ihrer Nähe teilt ihr euch gegenseitig den Schmerz.", "Breaking the bond with your previous partner, you are now bonded with your new target. Sharing in their pain while near each other.")
        else
            user:inform("Du bist nun mit deinem Ziel verbunden und teilst in ihrer Nähe gegenseitig den Schmerz.", "You are now bonded with your target, sharing in their pain while near each other.")
        end
        if verifyBond(target) then
            target:inform("Durch die gewobene Magie der Tiefengewebe hat sich jemand mit dir verbunden und deine vorherige Bindung ersetzt. In eurer Nähe teilt ihr euch nun gegenseitig den Schmerz.", "Through the woven magic the deepweaves, someone has bonded with you, replacing your previous bond. You will now share each others pain while near each other." )
        else
            target:inform("Durch die gewobene Magie der Tiefengewebe hat sich jemand mit dir verbunden. In eurer Nähe teilt ihr euch nun gegenseitig den Schmerz.", "Through the woven magic the deepweaves, someone has bonded with you. You will now share each others pain while near each other." )
        end
    end

    M.existingBonds[target.id] = { partner = user.id, damageReduced = percentageToReduce(user, spellName), damageTaken = percentageDamageToTake(user, spellName, target)}
    M.existingBonds[user.id] = { partner = target.id, damageReduced = percentageToReduce(user, spellName), damageTaken = percentageDamageToTake(user, spellName, user)}

end

function M.checksToPass(user, location, target)

    if not alreadyPartners(user, target) and verifyBond(target) then
        user:inform("Das Ziel, mit dem du dich verbinden willst, ist bereits mit jemand anderem verbunden. Beachte, dass eine Verbindung mit ihm die vorherige Bindung ersetzt.", "The target you about to bond with is already bonded with someone else. Know that bonding with them will replace the previous bond.")
    end

    if tooWeak(user, target) then
        return
    end

    return true
end

return M
