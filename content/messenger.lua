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

local price = 5000 -- fifty silver

local common = require("base.common")
local money = require("base.money")

local parchmentSelectionStatus = {}

local M = {}


local function spawnParchment(user, text, signature, descriptionEn, descriptionDe)

    local theDataTable = {["writtenText"] = text, ["signatureText"]  = signature, ["descriptionEn"] = descriptionEn, ["descriptionDe"] = descriptionDe}

    local itemCreated = user:createItem(Item.parchment, 1, 999, theDataTable)

    local notCreated = 1

    if itemCreated == notCreated then
        world:createItemFromId(Item.parchment, 1, user.pos, true, 999, theDataTable)
    end
end

function M.sendStoredMessages(recipient)
    local foundStoredMessages, numberOfMessages = ScriptVars:find(recipient.name.."storedMessages")

    if not foundStoredMessages then
        return
    end

    local parchments = "parchments"

    if tonumber(numberOfMessages) == 1 then
        parchments = "parchment"
    end

    recipient:inform("GERMAN TRANSLATION HERE", "A messenger comes up to you, delivering "..numberOfMessages.." "..parchments.." before scurrying off.")

    for i = 1, tonumber(numberOfMessages) do
        local foundText, text = ScriptVars:find(recipient.name.."storedMessageText"..i)
        local foundSignature, signature = ScriptVars:find(recipient.name.."storedMessageSignature"..i)
        local foundDescriptionEn, descriptionEn = ScriptVars:find(recipient.name.."storedMessageDescriptionEn"..i)
        local foundDescriptionDe, descriptionDe = ScriptVars:find(recipient.name.."storedMessageDescriptionDe"..i)

        if foundText and foundSignature and foundDescriptionEn and foundDescriptionDe then
            spawnParchment(recipient, text, signature, descriptionEn, descriptionDe)
        end
    end

    ScriptVars:set(recipient.name.."storedMessages", "0")
end

local function isRecipientCharacterOnline(recipient)
    local onlineChars = world:getPlayersOnline()

    for _, char in pairs(onlineChars) do
        if char.name == recipient then
            M.sendStoredMessages(char)
        end
    end

end

local function storeMessageInDatabase(user, writtenText, signatureText, descriptionDe, descriptionEn, recipient)

    local foundStoredMessages, numberOfAlreadyStoredMessages = ScriptVars:find(recipient.."storedMessages")

    if not foundStoredMessages then
        numberOfAlreadyStoredMessages = 0
    end

    local messageNumber = tonumber(numberOfAlreadyStoredMessages) + 1

    ScriptVars:set(recipient.."storedMessages", tostring(messageNumber))
    ScriptVars:set(recipient.."storedMessageText"..messageNumber, writtenText)
    ScriptVars:set(recipient.."storedMessageSignature"..messageNumber, signatureText)
    ScriptVars:set(recipient.."storedMessageDescriptionEn"..messageNumber, descriptionEn)
    ScriptVars:set(recipient.."storedMessageDescriptionDe"..messageNumber, descriptionDe)
    ScriptVars:save()

    isRecipientCharacterOnline(recipient)

end

local function payMoney(user, writtenText, signatureText, descriptionDe, descriptionEn, recipient, parchment)

    local hasMoney = money.CharHasMoney(user, price)

    if not hasMoney then
        user:inform("GERMAN TRANSLATION", "You can't afford that.")
        return
    end

    money.TakeMoneyFromChar(user, price)

    world:erase(parchment, 1)

    storeMessageInDatabase(user, writtenText, signatureText, descriptionDe, descriptionEn, recipient)

    user:inform("GERMAN TRANSLATION HERE", "Having paid the "..(price/100).." silver fee, a messenger is dispatched with your letter.")
end

function M.getParchmentSelectionStatus(user)
    if not parchmentSelectionStatus[user.name] then
        return false
    end

    if parchmentSelectionStatus[user.name].position ~= user.pos then
        return -- user moved
    end

    return parchmentSelectionStatus[user.name].status
end

local function writeRecipientName(user, writtenText, signatureText, descriptionDe, descriptionEn, parchment)
    -- Rework if we ever get an entry point allowing us to check if a name is in the player-database without them being online
    -- Write in recipient name. Specify that typos will lead to it not being sent to the correct person.

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        payMoney(user, writtenText, signatureText, descriptionDe, descriptionEn, input, parchment)
    end

    local dialog = InputDialog(common.GetNLS(user, "GERMAN TRANSLATION HERE", "Enter Recipient"), common.GetNLS(user, "GERMAN TRANSLATION HERE", "The messenger needs the name of the intended recipient. Please note that this requires the recipients full name and that any spelling mistakes will lead to it not being sent."), false, 255, callback)
    user:requestInputDialog(dialog)
end

function M.verifyParchment(user, parchment)
    local writtenText = parchment:getData("writtenText")
    local signatureText = parchment:getData("signatureText")
    local descriptionDe = parchment:getData("descriptionDe")
    local descriptionEn = parchment:getData("descriptionEn")

    parchmentSelectionStatus[user.name].status = false

    if writtenText ~= "" and signatureText ~= "" then
        writeRecipientName(user, writtenText, signatureText, descriptionDe, descriptionEn, parchment)
    else
        user:inform("GERMAN TRANSLATION HERE", "The messenger won't accept this parchment. It has to be both written and signed using a quill.")
    end

end

function M.messengerRequested(user)

    user:inform("GERMAN TRANSLATION HERE", "Select the parchment you wish to send by double clicking it. It must be a written and signed parchment for it to be sent. Do also bear in mind that it costs "..(price/100).." silver coins to send a message using this service.")

    if not parchmentSelectionStatus[user.name] then
        parchmentSelectionStatus[user.name] = {}
    end

    parchmentSelectionStatus[user.name].status = true
    parchmentSelectionStatus[user.name].position = user.pos
    --select a parchment you wish to send or message about having no parchments to send
    --activate a top level variable that makes it so the next parchment you double click is selected instead of its usual purpose
    -- if the parchment does not contain a message and signature, decline it
    -- reset the top level variable if the character moves from the spot

end

return M
