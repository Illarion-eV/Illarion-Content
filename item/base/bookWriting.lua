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
local tailoring = require("craft.final.tailoring")
local lookat = require("base.lookat")

local parchmentSelectionStatus = {}

local M = {}

M.parchmentMaxTextLength = 986

local setTitle
local selectNewPage
local removePage
local signBook
local getWrittenTextAndSignatureFromBook

local function isBookInHand(user)

    local bookPositions = {Character.left_tool, Character.right_tool}

    for _, bookPos in pairs(bookPositions) do
        local book = user:getItemAt(bookPos)

        for _, bookColour in pairs(tailoring.books) do --is it a book
            for _, bookID in pairs(bookColour) do
                if bookID == book.id then
                    local bookPermissions = book:getData("bookPermissions")

                    if not common.IsNilOrEmpty(book:getData("book")) or (not common.IsNilOrEmpty(bookPermissions) and tonumber(bookPermissions) ~= user.id) then --is it an official book already or a book written by someone else
                        user:inform("Dieses Buch wurde von einem anderen Verfasser geschrieben. Bitte kritzel nicht in ihm herum.", "This is a book that's already been written, and by a different author. It's not your place to write in it.")
                        return false
                    end

                    return book
                end
            end
        end
    end

    user:inform("Nimm das Buch in die Hand um in ihm zu schreiben.", "You must hold a book in your hand if you want to write in it.")
    return false

end


function M.writeBook(user)

    local book = isBookInHand(user)

    if not book then
        return
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        book = isBookInHand(user) -- Check again in case the book was moved

        if not book then
            return
        end

        if index == 1 then
            setTitle(user)
        elseif index == 2 then
            selectNewPage(user)
        elseif index == 3 then
            removePage(user, book)
        elseif index == 4 then
            signBook(user, book)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Verfasse ein Buch","Book Writing") , common.GetNLS(user,"W�hle aus, was du machen willst.","Select what you want to do.") , callback)

    dialog:addOption(0, common.GetNLS(user,"Buchtitel","Set Book Title"))
    dialog:addOption(0, common.GetNLS(user,"Neue Seite","Add New Page"))
    dialog:addOption(0, common.GetNLS(user,"Entferne die letzte Seite","Remove Last Page"))
    dialog:addOption(0, common.GetNLS(user,"Buch signieren","Sign Book"))

    user:requestSelectionDialog(dialog)
end

function setTitle(user)

    local title = common.GetNLS(user, "Buchtitel", "Set Title")

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        if common.IsNilOrEmpty(input) then
            user:inform("Ein Buch ohne Titel ist wie eine Seite ohne Buchstaben.", "The title can not be left blank.")
            return
        end

        if string.len(input) > 40 then
            user:inform("Bei dieser Titell�nge hast du es etwas �bertrieben.", "The cover of the book is not large enough to fit such a long title.")
            return
        end

        local book = isBookInHand(user)

        if not book then
            return
        end

        book:setData("bookTitle", input)
        book:setData("descriptionEn", "Title: "..input)
        book:setData("descriptionDe", "Titel: "..input)
        world:changeItem(book)

        user:inform("Neuer Buchtitel: "..input..".", "You set the title of the book to "..input..".")
    end

    local dialog = InputDialog(title, "", false, 40, callback)

    user:requestInputDialog(dialog)

end

function selectNewPage(user)

    if not parchmentSelectionStatus[user.name] then
        parchmentSelectionStatus[user.name] = {}
    end
        parchmentSelectionStatus[user.name].status = true
        parchmentSelectionStatus[user.name].position = user.pos

    user:inform("Benutze die Schriftrolle, die du dem Buch als Seite hinzuf�gen m�chtest.", "Select the parchment you want to add to the book as a page by using it.")
end


local function getWrittenTextFromParchment(theParchment)
    if not common.IsNilOrEmpty(theParchment:getData("writtenText")) then
        local writtenText = theParchment:getData("writtenText")
        for i = 2, 4 do
            local addText = theParchment:getData("writtenText"..i)
            writtenText = writtenText..addText
        end
        return writtenText
    end

    return false
end

function M.addNewPageToBook(user, sourceItem)

    parchmentSelectionStatus[user.name].status = false

    if sourceItem.wear == 255 then
        user:inform("Diesem Buch kannst du keine Seiten hinzuf�gen.", "You can't add this page to the book, it's been pinned down!")
        return
    end

    local book = isBookInHand(user)

    if not book then
        return
    end

    local pageText = getWrittenTextFromParchment(sourceItem)

    if not pageText then
        user:inform("Auf der Schriftrolle steht nichts.", "The parchment must have been written on.")
    end

    local lastPage = book:getData("pageCount")

    if common.IsNilOrEmpty(lastPage) then
        lastPage = 0
    end

    local nextPage = lastPage + 1

    local texts = {
        string.sub(pageText, 1, 250),
        string.sub(pageText, 251, 500),
        string.sub(pageText, 501, 750),
        string.sub(pageText, 751, 986),
    }

    for int , text in ipairs(texts) do
        book:setData("page"..nextPage.."part"..int, text)
    end

    local signature = sourceItem:getData("signatureText")

    if not common.IsNilOrEmpty(signature) then
        book:setData("page"..nextPage.."signature", signature)
    end

    book:setData("pageCount", nextPage)

    world:changeItem(book)

    world:erase(sourceItem, 1)

    user:inform("Seite hinzugef�gt.", "You added the selected parchment to the book.")

end

function removePage(user, book)

    local pageNumber = tonumber(book:getData("pageCount"))

    if not pageNumber or pageNumber <= 0 then
        user:inform("Du kannst keine Seite aus einem leeren Buch entfernen.", "You can not remove a page from a book that has none.")
        return
    end


    local theText, theSignature = getWrittenTextAndSignatureFromBook(book, pageNumber)

    local theParchment = world:createItemFromId(Item.parchment, 1, user.pos, true, 333, {})

    if not common.IsNilOrEmpty(theSignature) then
        theParchment:setData("signatureText", theSignature)
        lookat.SetSpecialDescription(theParchment,"Das Pergament ist unterschrieben.","The parchment is signed.")
    end

    M.convertStringToMultipleParchmentDataValues(theParchment, theText)

    local usersBag = user:getBackPack()

    if usersBag and usersBag:getSlotCount() > 0 then
        world:erase(theParchment, 1)
        usersBag:insertItem(theParchment, true)
    end

    book:setData("pageCount", pageNumber-1)

    for i = 1, 4 do
        book:setData("page"..pageNumber.."part"..i, "")
    end

    book:setData("page"..pageNumber.."signature", "")

    world:changeItem(book)

    user:inform("Du rei�t die Seite vorsichtig aus dem Buch.", "Carefully removing the page from the book, you are left with a written parchment.")

end

function signBook(user, book)

    book:setData("bookPermissions", user.id)
    book:setData("bookAuthor", user.name)

    world:changeItem(book)

    user:inform("Du hast das Buch signiert. Nur noch du kannst �nderungen an ihm vornehmen.", "You sign the book. From now on, only you have the permission to write in the book.")

end

function getWrittenTextAndSignatureFromBook(book, pageNumber)

    local writtenText = ""

    for i = 1, 4 do
        writtenText = writtenText..book:getData("page"..pageNumber.."part"..i)
    end

    local signature = book:getData("page"..pageNumber.."signature")

    return writtenText, signature
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

M.germanParchmentDescription = "Das Pergament ist beschrieben."
M.englishParchmentDescription = "The parchment has been written on."


function M.convertStringToMultipleParchmentDataValues(theParchment, writtenText)
    local texts = {
        string.sub(writtenText, 1, 250),
        string.sub(writtenText, 251, 500),
        string.sub(writtenText, 501, 750),
        string.sub(writtenText, 751, M.parchmentMaxTextLength),
    }

    theParchment:setData("writtenText", texts[1])

    for i = 2, 4 do
        theParchment:setData("writtenText"..i, texts[i])
    end

    lookat.SetSpecialDescription(theParchment,M.germanParchmentDescription,M.englishParchmentDescription)

    theParchment.wear = 254 -- Written parchments should have maximum rot time to allow message exchange

    world:changeItem(theParchment)

end

return M
