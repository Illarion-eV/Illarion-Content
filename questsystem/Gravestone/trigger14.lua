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
local createplayeritem = require("handler.createplayeritem")
local base = require("questsystem.base")
module("questsystem.Gravestone.trigger14", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 99
local POSTCONDITION_QUESTSTATE = 104

local NPC_TRIGGER_DE = "[Gg]rab"
local NPC_TRIGGER_EN = "[Gg]rave"
local NPC_REPLY_DE = "Ich danke euch vielmals. Ich schenke euch einen Rubinring,  ein Symbol der Ewigkeit. Ein Geschenkt für eure wahre Liebe."
local NPC_REPLY_EN = "Thank you very much. I give you a ruby ring, a symbol of eternity. Save it for your true love one day."

function receiveText(npc, type, text, PLAYER)
    if ADDITIONALCONDITIONS(PLAYER)
    and PLAYER:getType() == Character.player
    and base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
        if PLAYER:getPlayerLanguage() == Player.german then
            NPC_TRIGGER=string.gsub(NPC_TRIGGER_DE,'([ ]+)',' .*');
        else
            NPC_TRIGGER=string.gsub(NPC_TRIGGER_EN,'([ ]+)',' .*');
        end

        foundTrig=false
        
        for word in string.gmatch(NPC_TRIGGER, "[^|]+") do 
            if string.find(text,word)~=nil then
                foundTrig=true
            end
        end

        if foundTrig then
      
            npc:talk(Character.say, getNLS(PLAYER, NPC_REPLY_DE, NPC_REPLY_EN))
            
            HANDLER(PLAYER)
            
            base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        
            return true
        end
    end
    return false
end

function getNLS(player, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    return textDe
  else
    return textEn
  end
end


function HANDLER(PLAYER)
    createplayeritem.createPlayerItem(PLAYER, 68, 990, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end