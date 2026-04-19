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

local M = {}


M.limit = 100 -- You can not store more than 100 charges of a sigil in a pouch at a time.

M.charges = 20 -- Each sigil provides 20 charges

local sigils = {
    {id = 1, name = { english = "Basic Witherweave Sigil", german = "Einfache Welkweb-Siegel"}, hint = {german = "Als du in die Tiefen des Kessels blickst, siehst du eine Vision von dir selbst, wie du von Fianna geführt wirst. Vielleicht solltest du mit ihr sprechen, um Anleitung zum Welkweben zu erhalten.", english = "As you peer into the depths of the cauldron, you see a vision of yourself being guided by Fianna. Perhaps you should speak to her for guidance on Witherweave."}},
    {id = 2, name = { english = "Basic Bloomweave Sigil", german = "Einfache Blütenweb-Siegel"}, hint = {german = "Als du in die Tiefen des Kessels blickst, siehst du eine Vision von dir selbst, wie du von Fianna geführt wirst. Vielleicht solltest du mit ihr sprechen, um Anleitung zum Blütenweben zu erhalten.", english = "As you peer into the depths of the cauldron, you see a vision of yourself being guided by Fianna. Perhaps you should speak to her for guidance on Bloomweave."}},
    {id = 3, name = { english = "Basic Wildweave Sigil", german = "Einfache Wildeweb-Siegel"}, hint = {german = "Als du in die Tiefen des Kessels blickst, siehst du eine Vision von dir selbst, wie du von Fianna geführt wirst. Vielleicht solltest du mit ihr sprechen, um Anleitung zum Wildweben zu erhalten.", english = "As you peer into the depths of the cauldron, you see a vision of yourself being guided by Fianna. Perhaps you should speak to her for guidance on Wildweave."}},
    {id = 4, name = { english = "Basic Stoneweave Sigil", german = "Einfache Steinweb-Siegel"}, hint = {german = "Als du in die Tiefen des Kessels blickst, siehst du eine Vision von dir selbst, wie du von Fianna geführt wirst. Vielleicht solltest du mit ihr sprechen, um Anleitung zum Steinweben zu erhalten.", english = "As you peer into the depths of the cauldron, you see a vision of yourself being guided by Fianna. Perhaps you should speak to her for guidance on Stoneweave."}},
    {id = 5, name = { english = "Basic Deepweave Sigil", german = "Einfache Tiefenweb-Siegel"}, hint = {german = "Als du in die Tiefen des Kessels blickst, siehst du eine Vision von dir selbst, wie du von Fianna geführt wirst. Vielleicht solltest du mit ihr sprechen, um Anleitung zum Tiefenweben zu erhalten.", english = "As you peer into the depths of the cauldron, you see a vision of yourself being guided by Fianna. Perhaps you should speak to her for guidance on Deepweave."}},
}

function M.getSigilHint(sigilName)
    for _, sigil in pairs(sigils) do
        if sigilName == sigil.name.english then
            return sigil.hint
        end
    end
end

local function getSigilIdFromName(sigilName)
    for _, sigil in pairs(sigils) do
        if sigilName == sigil.name.english then
            return sigil.id
        end
    end

    return false
end

function M.getGermanSigilTranslation(sigilName)
    for _, sigil in pairs(sigils) do
        if sigilName == sigil.name.english then
            return sigil.name.german
        end
    end
end

local learningId = 943 --Starts at 943, goes up to 945

function M.checkIfCraftedSigil(user, sigilName)

    local id = getSigilIdFromName(sigilName)

    local learned = common.readBitwise(user, id, learningId)

    return learned

end

function M.learnSigil(user, sigilName)

    if common.IsNilOrEmpty(sigilName) then
        return
    end

    local id = getSigilIdFromName(sigilName)

    if id == false then
        return
    end

    if not M.checkIfCraftedSigil(user, sigilName) then

        common.writeBitwise(user, id, learningId)
    end
end

local function checkForWeaverspouch(user)


    local weaversPouch = common.getItemInHand(user, Item.weaversPouch)

    if not weaversPouch then
        return false
    end

    return weaversPouch

end

function M.UseItem(user, sourceItem, actionState)


    local sigilName = sourceItem:getData("nameEn")

    if common.IsNilOrEmpty(sigilName) then
        --This item must've been spawned in via GM, all crafted ones have a custom name
        return
    end

    local dataKey = sigilName:gsub("%s+", "")

    local weaversPouch = checkForWeaverspouch(user)

    if user:getMagicType() ~= 3 then
        user:inform("Du musst ein Druide sein, um dies nutzen zu können.", "You must be a druid to make use of this.")
        return
    end

    if not weaversPouch then
        user:inform("Um die Kraft im Siegel in nutzbare Gewebe zu verwandeln, musst du einen Weberbeutel in der Hand halten, um sie darin zu speichern.", "To turn the power within the sigil into weaves you can use, you need to hold a weaver's pouch in your hand to store them in.")
        return
    end

    local existingCharges = tonumber(weaversPouch:getData(dataKey))

    if existingCharges and existingCharges >= M.limit then
        user:inform("Dieser Weberbeutel kann keine weiteren Gewebe dieser Art aufnehmen.", "This weaver's pouch can not hold any more weaves of this kind.")
        return
    end

    if actionState == Action.none then
        user:startAction(50, 21, 10, 0, 0)
    elseif actionState == Action.abort then
        user:inform("Du brichst deine Aktion ab, die Kraft des Siegels in den Weberbeutel zu lenken.", "You abort your action of harnessing the power of the sigil into the weavers pouch.")
    elseif actionState == Action.success then

        local newTotal = 0

        if existingCharges then
            newTotal = existingCharges
        end

        newTotal = math.max(M.limit, newTotal + M.charges)

        world:erase(sourceItem, 1)

        weaversPouch:setData(dataKey, tostring(newTotal))

        world:changeItem(weaversPouch)
    end

end

return M
