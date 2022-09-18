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
-- UPDATE items SET itm_script='item.id_6_scissors' WHERE itm_id IN (6);

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

local function sendHospitalBellInform(user, location)

    local shortDistancePlayers = world:getPlayersInRangeOf(location, 10)

    local mediumDistancePlayers = world:getPlayersInRangeOf(location, 30)

    local longDistancePlayers = world:getPlayersInRangeOf(location, 60)

    local sendShortMessageTo = {}

    local sendMediumMessageTo = {}

    local sendLongMessageTo = {}

    for _, playerChar in pairs(longDistancePlayers) do

        local charDistance = "long"

        for _, playerCharMedium in pairs(mediumDistancePlayers) do
            if playerCharMedium == playerChar then
                charDistance = "medium"
            end
        end

        for _, playerCharShort in pairs(shortDistancePlayers) do
            if playerCharShort == playerChar then
                charDistance = "short"
            end
        end

        if charDistance == "long" then
            table.insert(sendLongMessageTo, playerChar)
        elseif charDistance == "medium" then
            table.insert(sendMediumMessageTo, playerChar)
        elseif charDistance == "short" then
            table.insert(sendShortMessageTo, playerChar)
        end
    end

    for _, recipient in pairs(sendLongMessageTo) do
        recipient:inform("Von weit her hörst du die Spitalglocke läuten. Deine Hilfe wird benötigt.", "Off in the distance you hear the ringing of the hospital bell. Perhaps your aid could be required?")
    end

    for _, recipient in pairs(sendMediumMessageTo) do
        recipient:inform("Du hörst die Spitalglocke läuten. Deine Hilfe wird benötigt.", "You hear the ringing of the hospital bell. Perhaps your aid could be required?")
    end

    for _, recipient in pairs(sendShortMessageTo) do
        recipient:inform("Deine Ohren klingeln vom Läuten der Spitalglocke. Hilfe wird sicher bald eintreffen.", "The hospital bell rings loudly in your ears as it is rung. With some luck, assistance will be here soon.")
    end

end

local function isCooldownOver(sourceItem)

    local cooldown = sourceItem:getData("hospitalBellCooldown")

    if common.IsNilOrEmpty(cooldown) then
        return true
    end

    if tonumber(cooldown) > world:getTime("unix") then
        return false
    end

    return true
end

local function triggerHospitalBell(user, sourceItem)

    if not isCooldownOver(sourceItem) then
        user:inform("Die Spitalglocke wurde kürzlich schon geläutet. Ihre magische Aufladung ist verbraucht.", "The hospital bell has been used too recently. The magical enhancement needs time to recharge.")
        return false
    end

    local cooldownDuration = 600

    sourceItem:setData("hospitalBellCooldown", world:getTime("unix") + cooldownDuration)
    world:changeItem(sourceItem)

    sendHospitalBellInform(user, sourceItem.pos)

    return true
end



local function ringTheBell(user, sourceItem)
    user:talk(Character.say,"#me läutet eine Glocke, die ein klingelndes Geräusch macht.", "#me shakes the bell, producing a light ringing sound.")
end

function M.UseItem(user, sourceItem)

    local hospitalBell = sourceItem:getData("hospitalBell")

    if not common.IsNilOrEmpty(hospitalBell) and triggerHospitalBell(user, sourceItem) then
        return
    end

    ringTheBell(user, sourceItem)

end

function M.LookAtItem(user, sourceItem)

    local hospitalBell = sourceItem:getData("hospitalBell")

    if not common.IsNilOrEmpty(hospitalBell) then
        local text = {}
        local suffix = {
            recharged = {},
            charging = {}
        }
        text.english = "A bell that has been magically enchanted to spread its sound far and wide."
        text.german = "Eine magisch aufgeladene Glocke, der Klang über Feld und Wald erschallen kann."
        suffix.recharged.english = " If you require assistance, ring the bell."
        suffix.recharged.german = " Falls du Hilfe benötigst, läute die Glocke."
        suffix.charging.english = " The bell is currently recharging its magic after recent use, you'll have to wait if you want to make use of it again."
        suffix.charging.german = " Die Magie der Glocke muss sich zunächst aufladen, bevor du sie benutzen kannst."

        if isCooldownOver(sourceItem) then
            text.english = text.english..suffix.recharged.english
            text.german = text.german..suffix.recharged.german
        else
            text.english = text.english..suffix.charging.english
            text.german = text.german..suffix.charging.german
        end

        lookat.SetSpecialDescription(sourceItem, text.german, text.english)
        lookat.SetSpecialName(sourceItem, "Spitalglocke", "Hospital Bell")
    end

    return lookat.GenerateLookAt(user, sourceItem, lookat.METAL)
end

return M
