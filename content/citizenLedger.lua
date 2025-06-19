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

local lookat = require("base.lookat")
local common = require("base.common")
local factions = require("base.factions")

local M = {}

local ledgers = factions.ledgers



local maxEntriesPerPage = 25



local function notDeletedCharacter(book, index, entryID, entryName, entryRank)

    local exists, id = world:getPlayerIdByName(entryName)

    if not exists or id ~= tonumber(entryID) then -- Either the character was deleted or recreated
        book:setData("entry"..index.."ID", "")
        book:setData("entry"..index.."name", "")
        book:setData("entry"..index.."rank", "")
        world:changeItem(book)
        return false
    end

    return true

end

local function cleanUpEntries(ledgerInfo, book, entries)

    for i = 1, entries do
        book:setData("entry"..i.."ID", "")
        book:setData("entry"..i.."name", "")
        book:setData("entry"..i.."rank", "")
    end

    book:setData("ledgerEntries", tostring(#ledgerInfo))

    for index, entry in pairs(ledgerInfo) do
        book:setData("entry"..index.."ID", entry.id)
        book:setData("entry"..index.."name", entry.name)
        book:setData("entry"..index.."rank", entry.rank)
    end

    world:changeItem(book)
    --book should now only contain legitimate entries, this is just to avoid infinite entries when people delete characters

end


local function getSortedEntries(book, entries)

    local ledgerInfo = {}


    for i = 1, entries do
        local entryID = book:getData("entry"..i.."ID")
        local entryName = book:getData("entry"..i.."name")
        local entryRank = book:getData("entry"..i.."rank")

        if not common.IsNilOrEmpty(entryID) and notDeletedCharacter(book, i, entryID, entryName, entryRank) then

            table.insert(ledgerInfo, {id = entryID, name = entryName, rank = tonumber(entryRank)})
        end
    end

    local sortedLedgerInfo = {}
    for rank = 10, 1, -1 do --This way higher ranks will get indexed and thus listed first
        for _, info in pairs(ledgerInfo) do
            if tonumber(info.rank) == rank then
                table.insert(sortedLedgerInfo, info)
            end
        end
    end

    if #sortedLedgerInfo > entries + 50 then --We have fifty or more deleted entries, time to clean up
        cleanUpEntries(sortedLedgerInfo, book, entries)
    end

    return sortedLedgerInfo

end

local viewDialog

function viewDialog(user, ledgerInfo, page, tid, entries)

    local startEntry = page*maxEntriesPerPage+1
    local endEntry = (page+1)*maxEntriesPerPage
    local maxNumberOfPages = math.ceil(entries/maxEntriesPerPage) - 1

    local text = ""

    for index, entry in ipairs(ledgerInfo) do
        if index >= startEntry and index <= endEntry then
            local germanRank, englishRank = factions.getRankNamesWithoutPlayer(tid, tonumber(entry.rank))
            text = text..entry.name.." - "..common.GetNLS(user, germanRank, englishRank).."\n"
        end
    end

    if entries <= maxEntriesPerPage then
        local callback = function(dialog) end

        local dialog = MessageDialog(common.GetNLS(user, "B�rgerbuch","Citizen Ledger"), text, callback)
        user:requestMessageDialog(dialog)
    else

        local callback = function(dialog)

            if not dialog:getSuccess() then
                return
            end

            local index = dialog:getSelectedIndex() + 1

            if index == 1 and page == 0 then
                viewDialog(user, ledgerInfo, page+1, tid, entries)
            elseif index == 1 and page >= 1 then
                viewDialog(user, ledgerInfo, page-1, tid, entries)
            elseif index == 2 then
                viewDialog(user, ledgerInfo, page+1, tid, entries)
            end
        end

        local dialog = SelectionDialog(common.GetNLS(user, "B�rgerbuch", "Citizen Ledger"), text, callback)

        if page > 0 then
            dialog:addOption(2745, "Previous Page")
        end

        if page < maxNumberOfPages then
            dialog:addOption(2745, "Next Page")
        end

        dialog:setCloseOnMove()

        user:requestSelectionDialog(dialog)

    end
end

function M.isCitizenLedger(item)

    for _, ledger in pairs(ledgers) do
        if ledger.pos == item.pos then
            return true
        end
    end

    return false

end

function M.UseItem(user, book)

    local entries = tonumber(book:getData("ledgerEntries"))

    if common.IsNilOrEmpty(entries) or entries <= 0 then
        return --Nothing to display here, should never happen once at least one citizen of each realm logs on for the first time after the update
    end

    local tid = 0

    for _, ledger in pairs(ledgers) do
        if book.pos == ledger.pos then
            tid = ledger.tid
        end
    end

    viewDialog(user, getSortedEntries(book, entries), 0, tid, entries)

end

function M.LookAtItem(user, book)

    local lookAt = lookat.GenerateLookAt(user, book)

    local town

    for _, ledger in pairs(ledgers) do
        if ledger.pos == book.pos then
            town = ledger.town
        end
    end

    lookAt.name = common.GetNLS(user, "B�rgerbuch", "Citizen Ledger")
    lookAt.description = common.GetNLS(user, ""..town, "The citizen ledger of "..town)

    return lookAt
end

return M
