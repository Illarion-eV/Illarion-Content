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
local sendmessagetoplayer = require("handler.sendmessagetoplayer")
local base = require("questsystem.base")
module("questsystem.Geld_in_Hecke.trigger7", package.seeall)

local QUEST_NUMBER = 700
local PRECONDITION_QUESTSTATE = 14
local POSTCONDITION_QUESTSTATE = 14


function MoveToField( PLAYER )
    if ADDITIONALCONDITIONS(PLAYER)
    and base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    
        HANDLER(PLAYER)
    
        base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        return true
    end
    
    return false
end


function HANDLER(PLAYER)
    sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Irgendetwas ist auffällig an dem Fass bei der Wand. Vielleicht schaust du es dir mal genauer an?", "Something is different with this barrel at the wall. Maybe you should take a closer look?"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end