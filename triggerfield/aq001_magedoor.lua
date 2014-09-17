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
-- Location: -37 195 -9 && -37 196 -9 && -36 195 -9 && -36 196 -9
-- Purpose: Opens the Mage Tower with keyword Lothlendar

local keys = require("base.keys")

module("triggerfield.aq001_magedoor", package.seeall)

function CharacterOnField(Character)
    if( string.find( Character.lastSpokenText, "[Ll][Oo][Tt][Hh][Ll][Ee][Nn][Dd][Aa][Rr]" ) ~= nil ) then
        local doora=world:getItemOnField(position( -35, 195, -9 ));
        local doorb=world:getItemOnField(position( -35, 196, -9 ));
        keys.UnlockDoor( doora );
        keys.UnlockDoor( doorb );
        doora=world:getItemOnField(position( -35, 195, -9 ));
        doorb=world:getItemOnField(position( -35, 196, -9 ));
        OpenDoor( doora );
        OpenDoor( doorb );
    end
end
