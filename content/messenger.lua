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

local price = 2000 -- twenty silver, same as bulletins

local common = require("base.common")
local money = require("base.money")
local bookWriting = require("item.base.bookWriting")

local parchmentSelectionStatus = {}

local M = {}

local function checkPosition(user)

    if user.pos ~= parchmentSelectionStatus[user.id].position then
        user:inform("Bitte bleib an Ort und Stelle, damit der Bote deine Nachricht entgegennehmen kann.", "Having moved elsewhere, the messenger lost track of you.")
        return false
    end

    return true
end

local function spawnParchment(user, texts, signature, descriptionEn, descriptionDe)

    local theDataTable = {["writtenText"] = texts[1],["writtenText2"] = texts[2],["writtenText3"] = texts[3],["writtenText4"] = texts[4], ["signatureText"]  = signature, ["descriptionEn"] = descriptionEn, ["descriptionDe"] = descriptionDe}

    local itemCreated = user:createItem(Item.parchment, 1, 999, theDataTable)

    local notCreated = 1

    if itemCreated == notCreated then
        world:createItemFromId(Item.parchment, 1, user.pos, true, 999, theDataTable)
    end
end

local function garbleTheMessage(message) -- Make it recognisable for those with database access to check if it matches, but unrecognisable for others for privacy reasons
    --[[sends the first 21 characters in the letter.
    EG: "I need to talk to you. Find me in Galmair when you read this." becomes "I****d****t****t****."
    Undecipherable for those without database access to match it to the variables there,
    or the foreknowledge of what the message is meant to hold
    ]]
    return string.sub(message, 1, 1).."****"..string.sub(message, 6, 6).."****"..string.sub(message, 11, 11).."****"..string.sub(message, 16, 16).."****"..string.sub(message, 21, 21)
end

local function convertContentsIntoString(contents)

    local retString = ""

    for index, message in pairs(contents) do
        retString = retString.." (Sender "..index..": "..message.sender.." Message"..index..": "..garbleTheMessage(message.text)..")"
    end

    return retString

end

local function logThatMessagesWereReceived(recipient, contents)
    local numberOfMessages = #contents

    local loggedMessage = "[Messenger]: "..recipient.name.." at "..tostring(recipient.pos).." has received "..numberOfMessages.." messages. They contain the following, garbled for privacy reasons: "

    loggedMessage = loggedMessage..convertContentsIntoString(contents)

    log(loggedMessage)
end

function M.sendStoredMessages(recipient)

    local foundStoredMessages, numberOfMessages = ScriptVars:find(recipient.id.."storedMessages")
    local foundScriptMessages, numberOfScriptMessages = ScriptVars:find(recipient.id.."storedScriptMessages")
    local totalMessages = 0


    if foundStoredMessages and foundScriptMessages then
        totalMessages =  tonumber(numberOfMessages) + tonumber(numberOfScriptMessages)
    elseif foundStoredMessages then
        totalMessages = tonumber(numberOfMessages)
    elseif foundScriptMessages then
        totalMessages = tonumber(numberOfScriptMessages)
    end

    if totalMessages == 0 then
        return
    end

    local parchments = totalMessages.." parchments"
    local parchmentsDE = totalMessages.." Nachrichten"

    if tonumber(totalMessages) == 1 then
        parchments = "a parchment"
        parchmentsDE = "eine Nachricht"
    end

    local text = common.GetNLS(recipient, "Ein Bote bringt dir "..parchmentsDE.." und verschwindet wieder, so schnell er gekommen ist.", "A messenger comes up to you, delivering "..parchments.." before scurrying off.")
    local title = common.GetNLS(recipient, "Post", "Message Delivery")
    local contents = {}

    if foundStoredMessages then
        for i = 1, tonumber(numberOfMessages) do
            local foundText1, text1 = ScriptVars:find(recipient.id.."storedMessageText"..i)
            local foundText2, text2 = ScriptVars:find(recipient.id.."storedMessageText2"..i)
            local foundText3, text3 = ScriptVars:find(recipient.id.."storedMessageText3"..i)
            local foundText4, text4 = ScriptVars:find(recipient.id.."storedMessageText4"..i)
            local foundSignature, signature = ScriptVars:find(recipient.id.."storedMessageSignature"..i)
            local foundDescriptionEn, descriptionEn = ScriptVars:find(recipient.id.."storedMessageDescriptionEn"..i)
            local foundDescriptionDe, descriptionDe = ScriptVars:find(recipient.id.."storedMessageDescriptionDe"..i)

            if foundText1 and foundText2 and foundText3 and foundText4 and foundSignature and foundDescriptionEn and foundDescriptionDe then
                local texts = {text1, text2, text3, text4}
                table.insert(contents, {text = text1, sender = signature})
                spawnParchment(recipient, texts, signature, descriptionEn, descriptionDe)
            else
                log("Message "..i.." out of "..numberOfMessages.." to be received by "..recipient.name.."("..recipient.id..") failed to be sent. Texts found: "..tostring(foundText1).." "..tostring(foundText2).." "..tostring(foundText3).." "..tostring(foundText4).." ".." Signature found: "..tostring(foundSignature).." Descriptions found: "..tostring(foundDescriptionEn).." "..tostring(foundDescriptionDe))
            end
        end
    end

    if foundScriptMessages then
        for i = 1, tonumber(numberOfScriptMessages) do
            local foundGermanText1, germanText1 = ScriptVars:find(recipient.id.."storedScriptMessageTextGerman"..i)
            local foundGermanText2, germanText2 = ScriptVars:find(recipient.id.."storedScriptMessageTextGerman2"..i)
            local foundGermanText3, germanText3 = ScriptVars:find(recipient.id.."storedScriptMessageTextGerman3"..i)
            local foundGermanText4, germanText4 = ScriptVars:find(recipient.id.."storedScriptMessageTextGerman4"..i)
            local foundEnglishText1, englishText1 = ScriptVars:find(recipient.id.."storedScriptMessageTextEnglish"..i)
            local foundEnglishText2, englishText2 = ScriptVars:find(recipient.id.."storedScriptMessageTextEnglish2"..i)
            local foundEnglishText3, englishText3 = ScriptVars:find(recipient.id.."storedScriptMessageTextEnglish3"..i)
            local foundEnglishText4, englishText4 = ScriptVars:find(recipient.id.."storedScriptMessageTextEnglish4"..i)
            local descriptionEnglish = bookWriting.englishParchmentDescription
            local descriptionGerman = bookWriting.germanParchmentDescription

            if foundGermanText1 and foundGermanText2 and foundGermanText3 and foundGermanText4 and foundEnglishText1 and foundEnglishText2 and foundEnglishText3 and foundEnglishText4 then
                local texts = common.GetNLS(recipient, {germanText1, germanText2, germanText3, germanText4}, {englishText1, englishText2, englishText3, englishText4})
                spawnParchment(recipient, texts, "", descriptionEnglish, descriptionGerman)
            else
                log("Message "..i.." out of "..numberOfScriptMessages.." script sent messages to be received by "..recipient.name.."("..recipient.id..") failed to be sent. Texts found: "..tostring(foundGermanText1).." "..tostring(foundGermanText2).." "..tostring(foundGermanText3).." "..tostring(foundGermanText4)..tostring(foundEnglishText1).." "..tostring(foundEnglishText2).." "..tostring(foundEnglishText3)..tostring(foundEnglishText4))
            end
        end
    end

    if tonumber(#contents) > 0 then
        logThatMessagesWereReceived(recipient, contents)
    end

    if tonumber(#contents) ~= tonumber(numberOfMessages) then
        local failed = tonumber(numberOfMessages) - tonumber(#contents)
        log(failed.." messages meant for "..recipient.name.."("..recipient.id..")".."failed to send!")
    end

    ScriptVars:set(recipient.id.."storedMessages", "0")
    ScriptVars:set(recipient.id.."storedScriptMessages", "0")
    ScriptVars:save()

    local callback = function(dialog)
    end

    local dialog = MessageDialog(title, text, callback)

    recipient:requestMessageDialog(dialog)
end

local function tooManyMessages(recipient)

    local foundStoredMessages, numberOfMessages = ScriptVars:find(recipient.id.."storedMessages")

    if not foundStoredMessages then
        return false
    end

    if tonumber(numberOfMessages) >= 21 then --Seven people can send the messaging cap of 3 letters each
        return true
    end

    return false

end

local function alreadySentTooManyMessages(user, recipient)

    local foundStoredMessages, numberOfMessages = ScriptVars:find(recipient.."storedMessages")

    if not foundStoredMessages then
        return false
    end

    local messageCount = 0
    numberOfMessages = tonumber(numberOfMessages)

    for i = 1, numberOfMessages do
        local foundSender, sender = ScriptVars:find(recipient.."sender"..i)
        if foundSender then
            if sender == user.id then
                messageCount = messageCount + 1
            end
        end
    end

    if messageCount >= 3 then
        user:inform("Du hast diesem Empfänger schon drei Nachrichten geschickt. Lass ihn doch erstmal lesen, was du geschrieben hast.", "You've already sent that person three messages. Please wait for them to receive those before trying to send more.")
        return true
    end

    return false
end



local function isRecipientCharacterOnline(recipient)
    local onlineChars = world:getPlayersOnline()

    for _, char in pairs(onlineChars) do
        if char.id == recipient then
            M.sendStoredMessages(char)
        end
    end

end

local function storeMessageInDatabase(user, writtenTexts, signatureText, descriptionDe, descriptionEn, recipient)

    local foundStoredMessages, numberOfAlreadyStoredMessages = ScriptVars:find(recipient.."storedMessages")

    if not foundStoredMessages then
        numberOfAlreadyStoredMessages = 0
    end

    local messageNumber = tonumber(numberOfAlreadyStoredMessages) + 1

    ScriptVars:set(recipient.."storedMessages", tostring(messageNumber))
    ScriptVars:set(recipient.."storedMessageText"..messageNumber, writtenTexts[1])
    ScriptVars:set(recipient.."storedMessageText2"..messageNumber, writtenTexts[2])
    ScriptVars:set(recipient.."storedMessageText3"..messageNumber, writtenTexts[3])
    ScriptVars:set(recipient.."storedMessageText4"..messageNumber, writtenTexts[4])
    ScriptVars:set(recipient.."storedMessageSignature"..messageNumber, signatureText)
    ScriptVars:set(recipient.."storedMessageDescriptionEn"..messageNumber, descriptionEn)
    ScriptVars:set(recipient.."storedMessageDescriptionDe"..messageNumber, descriptionDe)
    ScriptVars:set(recipient.."sender"..messageNumber, user.id)
    ScriptVars:save()

    isRecipientCharacterOnline(recipient)

end

local function isParchmentStillViable(user, signatureText, writtenTexts)

    local possibleItems = {}

    for i = 1, 6 do
        table.insert(possibleItems, user:getItemAt(Character["belt_pos_"..i]))
    end

    table.insert(possibleItems, user:getItemAt(Character.left_tool))
    table.insert(possibleItems, user:getItemAt(Character.right_tool))


    for _, possibleParchment in pairs(possibleItems) do

        if possibleParchment.id == Item.parchment then
            local selectedParchmentText = possibleParchment:getData("writtenText")
            local selectedParchmentSignature = possibleParchment:getData("signatureText")

            if selectedParchmentText == writtenTexts[1] and selectedParchmentSignature == signatureText then
                return possibleParchment
            end
        end
    end

    user:inform("Die Schriftrolle muss sich in deinen Händen oder im Gürtel befinden.", "The selected parchment must be in your belt or your hands.")

    return false

end

local function payMoney(user, writtenTexts, signatureText, descriptionDe, descriptionEn, recipient)

    local hasMoney = money.CharHasMoney(user, price)

    if not hasMoney then
        user:inform("Das kannst du dir nicht leisten.", "You can't afford that.")
        return
    end

    if tooManyMessages(user, recipient) or alreadySentTooManyMessages(user, recipient) or not checkPosition(user) then
        return
    end

    local parchment = isParchmentStillViable(user, signatureText, writtenTexts)

    if not parchment then
        return
    end

    money.TakeMoneyFromChar(user, price)

    world:erase(parchment, 1)

    storeMessageInDatabase(user, writtenTexts, signatureText, descriptionDe, descriptionEn, recipient)

    user:inform("Du zahlst "..(price/100).." Silberstücke und ein Bote macht sich mit deiner Nachricht auf den Weg.", "Having paid the "..(price/100).." silver fee, a messenger is dispatched with your letter.")
end

function M.getParchmentSelectionStatus(user, parchment)

    if parchmentSelectionStatus[user.id] and parchmentSelectionStatus[user.id].status and parchmentSelectionStatus[user.id].position == user.pos then
        M.verifyParchment(user, parchment)
        return true
    end

    return false
end

local function writeRecipientName(user, writtenTexts, signatureText, descriptionDe, descriptionEn)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        local recipientExists, recipientId = world:getPlayerIdByName(input)

        if not checkPosition(user) then
            return
        end

        if not recipientExists then
            user:inform("Unbekannter Adressat.", "No recipient by that name exists.")
            return
        end

        payMoney(user, writtenTexts, signatureText, descriptionDe, descriptionEn, recipientId)
    end

    local dialog = InputDialog(common.GetNLS(user, "Empfänger", "Enter Recipient"), common.GetNLS(user, "An wen soll der Bote die Nachricht liefern?", "The messenger needs the name of the intended recipient."), false, 255, callback)

    if not isParchmentStillViable(user, signatureText, writtenTexts) or not checkPosition(user) then
        return
    end

    user:requestInputDialog(dialog)
end

function M.verifyParchment(user, parchment)
    local writtenText1 = parchment:getData("writtenText")
    local writtenText2 = parchment:getData("writtenText2")
    local writtenText3 = parchment:getData("writtenText3")
    local writtenText4 = parchment:getData("writtenText4")
    local writtenTexts = {writtenText1, writtenText2, writtenText3, writtenText4}
    local signatureText = parchment:getData("signatureText")
    local descriptionDe = parchment:getData("descriptionDe")
    local descriptionEn = parchment:getData("descriptionEn")

    parchmentSelectionStatus[user.id].status = false

    if writtenText1 ~= "" and signatureText ~= "" then
        writeRecipientName(user, writtenTexts, signatureText, descriptionDe, descriptionEn)
    else
        user:inform("Der Bote weist deine Nachricht zurück. Sie muss beschriftet und unterschrieben sein.", "The messenger won't accept this parchment. It has to be both written and signed using a quill.")
    end

end

function M.messengerRequested(user)

    user:inform("Wähle die Schriftrolle, die du verschicken möchtest, mit einem Doppelklick. Nur beschriebene und unterzeichnete Schriftrollen können verschickt werden. Diese Dienstleistung kostet "..(price/100).." Silberstücke.", "Select the parchment you wish to send by double clicking it. It must be a written and signed parchment for it to be sent. Do also bear in mind that it costs "..(price/100).." silver coins to send a message using this service.")

    if not parchmentSelectionStatus[user.id] then
        parchmentSelectionStatus[user.id] = {}
    end

    parchmentSelectionStatus[user.id].status = true
    parchmentSelectionStatus[user.id].position = position(user.pos.x, user.pos.y, user.pos.z)
    --select a parchment you wish to send or message about having no parchments to send
    --activate a top level variable that makes it so the next parchment you double click is selected instead of its usual purpose
    -- if the parchment does not contain a message and signature, decline it
    -- reset the top level variable if the character moves from the spot

end


local function isScriptMessageRecipientCharacterOnline(recipient)
    local onlineChars = world:getPlayersOnline()

    for _, char in pairs(onlineChars) do
        if char.id == recipient then
            M.sendStoredMessages(char)
        end
    end
end

local function storeScriptMessageInDatabase(recipient, english, german)

    local foundStoredMessages, numberOfAlreadyStoredMessages = ScriptVars:find(recipient.."storedScriptMessages")

    if not foundStoredMessages then
        numberOfAlreadyStoredMessages = 0
    end

    local messageNumber = tonumber(numberOfAlreadyStoredMessages) + 1

    ScriptVars:set(recipient.."storedScriptMessages", tostring(messageNumber))
    ScriptVars:set(recipient.."storedScriptMessageTextEnglish"..messageNumber, english[1])
    ScriptVars:set(recipient.."storedScriptMessageTextEnglish2"..messageNumber, english[2])
    ScriptVars:set(recipient.."storedScriptMessageTextEnglish3"..messageNumber, english[3])
    ScriptVars:set(recipient.."storedScriptMessageTextEnglish4"..messageNumber, english[4])
    ScriptVars:set(recipient.."storedScriptMessageTextGerman"..messageNumber, german[1])
    ScriptVars:set(recipient.."storedScriptMessageTextGerman2"..messageNumber, german[2])
    ScriptVars:set(recipient.."storedScriptMessageTextGerman3"..messageNumber, german[3])
    ScriptVars:set(recipient.."storedScriptMessageTextGerman4"..messageNumber, german[4])
    ScriptVars:save()

    isScriptMessageRecipientCharacterOnline(recipient)
end

function M.sendMessageViaScript(english, german, recipientID)

    local englishTexts = {
        string.sub(english, 1, 250),
        string.sub(english, 251, 500),
        string.sub(english, 501, 750),
        string.sub(english, 751, bookWriting.parchmentMaxTextLength),
    }

    local germanTexts = {
        string.sub(german, 1, 250),
        string.sub(german, 251, 500),
        string.sub(german, 501, 750),
        string.sub(german, 751, bookWriting.parchmentMaxTextLength),
    }

    storeScriptMessageInDatabase(recipientID, englishTexts, germanTexts)
end

return M
