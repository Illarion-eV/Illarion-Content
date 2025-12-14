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

local oralCasting = require("magic.arcane.oralCasting")
local wands = require("item.wands")
local magicSphere = require("item.magicSphere")
local factions = require("base.factions")

local M = {}

local function correctAnswerInform(player)
    player:inform("Als du die Antwort sprichst, spürst du, wie sich etwas Magisches in der Luft verändert. Vielleicht hätte das Berühren der Glaskugel jetzt andere Ergebnisse?", "As you speak the answer, you feel something magical in the air shift. Perhaps touching the glass sphere would have different results now?")
end

local function puzzleTriggers(player, text)

    if string.find(text, "feather") or string.find(text, "Feather") or string.find(text, "Feder") or string.find(text, "feder") then
        if magicSphere.checkPenPosition(player) then
            correctAnswerInform(player)
        end
    end

    if string.find(text, "beholder") or string.find(text, "Beholder") then
        if magicSphere.checkIraPosition(player) then
            correctAnswerInform(player)
        end
    end

    local raven = {"Raven", "raven", "Rabe", "rabe"}

    for _, variation in pairs(raven) do
        if string.find(text, variation) then
            if magicSphere.checkLhorPosition(player) then
                correctAnswerInform(player)
            end
        end
    end

    local right = {"Right", "right", "Richtig", "richtig"}

    for _, variation in pairs(right) do
        if string.find(text, variation) then
            if magicSphere.checkTahPosition(player) then
                correctAnswerInform(player)
            end
        end
    end

    local man = {"man", "Man", "mensch", "Mensch"}
    for _, variation in pairs(man) do
        if string.find(text, variation) then
            if magicSphere.checkTaurPosition(player) then
                correctAnswerInform(player)
            end
        end
    end

    local hoard = {"hoard", "Hoard", "hort", "Hort"}
    for _, variation in pairs(hoard) do
        if string.find(text, variation) then
            if magicSphere.checkKelPosition(player) then
                correctAnswerInform(player)
            end
        end
    end

end


local function checkIfInteracting(player)

    local activityTrackerEffect = 84

    local nearbyPlayers = world:getPlayersInRangeOf(player.pos, 15)

    local foundEffect, myEffect = player.effects:find(activityTrackerEffect)

    if not foundEffect then
        return --This would only happen for an admin, so no need to proceed. The effect is always initiated on login if not already active for players.
    end

    local realmInteraction = false

    local interaction = false

    for _, nearbyPlayer in pairs(nearbyPlayers) do

        local foundEffectNearbyPlayer, nearbyPlayerEffect = player.effects:find(activityTrackerEffect)

        local targetHasInteractedRecently

        if foundEffectNearbyPlayer then
            -- While not perfectly accurate, this helps verify if there is back and forth RP,
            -- and it is not someone just running past saying hello or someone talking to an afk player,
            -- by ensuring that the recipient is also active. This means the first line you write won't count for the ticks
            -- so quick greetings won't count, only proper RP where someone starts a dialogue.
            local foundLastInteraction, lastInteraction = nearbyPlayerEffect:findValue("lastInteractionTime")
            if foundLastInteraction and lastInteraction >=  world:getTime("unix") - 900 then
                targetHasInteractedRecently = true
                -- there must be a player nearby who spoke in the last 15 min for it to track your RP
            end
        end

        if nearbyPlayer.id ~= player.id and not nearbyPlayer:isAdmin() and targetHasInteractedRecently then --Player is interacting with a player who is not themselves and not a GM and not afk/has spoken recently
            if factions.getFaction(nearbyPlayer).tid == factions.getFaction(player).tid then
                realmInteraction = true
            end
            interaction = true
        end
    end


    local foundLastInteraction, lastInteraction = myEffect:findValue("lastInteractionTime")

    if not foundLastInteraction or lastInteraction < world:getTime("unix") - 300 then -- It has been longer than 5 min since the user last interacted, you are not counted as actively RPing if you do not speak once every 5 min and if you miss one 5 min tick you have to make up for it with two message the next one.
        myEffect:addValue("firstInteractionSkip", 1) -- As the first person to speak does not get the first tick, to make things fair this ensures the first time anyone speaks they do not get the tick
        myEffect:addValue("lastInteractionTime", world:getTime("unix"))
    end

    if interaction then
        myEffect:addValue("lastInteractionTime", world:getTime("unix"))
    end

    if realmInteraction then
        myEffect:addValue("lastRealmInteractionTime", world:getTime("unix"))
    end
end

function M.talk(player, talkType, text, actionState)

    puzzleTriggers(player, text)

    checkIfInteracting(player)

    if talkType == Character.say then
        --[[As there was some confusion as to why spells can only be cast in normal speech mode,
            not shouting/whispered, I am leaving this comment here for future developers who might
            look into it upon player complaint.
            Whisper mode: It should not be possible to hide the incantation from those in range of being
            hit by the spell without using the runes JUS LHOR, as the target should be able to know how to react
            unless the mage pays the extra price of LHOR to disallow them that.
            It should also not be possible to cast using #o.(Yes a check for (()) could be used instead there.)
            As such, whispering does not trigger incantations.
            Shout mode: For consistency, and so that you can more immersively explain away why you can't
            just whisper a spell by claiming a spell incantation needs a specific volume/intonation you
            can't achieve while whispering/shouting, I also disallowed shouting.
            Shouting incantation could be allowed if deemed better, but whispering should never be allowed.
        ]]
        oralCasting.checkForMagicIncantations(player, actionState, text)
    end

    return text
end

function M.actionDisturbed(player, attacker)

    return wands.actionDisturbed(player, attacker)

end

return M
