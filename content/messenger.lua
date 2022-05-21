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

local M = {}

function M.sendStoredMessages()
    --script used by login script and recipientCharacterOnline script to send messages.
    -- Should be an inform about a messenger arriving and handing over the parchment(s).
    -- If inventory is full, the parchment(s) should be left at the feet of the player.
end

local function isRecipientCharacterOnline()
    --Check if character is online. If so, invoke script to send stored messages. If not, it is invoked later via login.
end

local function storeMessageInDatabase()
    --Store in database. First get the number of already stored messages. Then store the message under that number +1 and update the stored messages number for that character.
end

local function payMoney()
    --Confirmation whether they accept the sum it costs to send the message. Use common money function to check for and pay money.
end

local function writeRecipientName() -- Rework if we ever get an entry point allowing us to check if a name is in the player-database without them being online
    --Write in recipient name. Specify that typos will lead to it not being sent to the correct person.
end

function M.messengerRequested(user)

    --select a parchment you wish to send or message about having no parchments to send
    --activate a top level variable that makes it so the next parchment you double click is selected instead of its usual purpose
    -- if the parchment does not contain a message and signature, decline it
    -- reset the top level variable if the character moves from the spot

end



return M
