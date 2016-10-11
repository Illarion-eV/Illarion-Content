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

function M.get_text_and_talktype(text)
    if (string.find(text, "[#/]w") == 1) then
        return Character.whisper, string.gsub(text, "[#/]w%s*", "", 1)
    elseif (string.find(text, "[#/]s") == 1) then 
        return Character.yell, string.gsub(text, "[#/]s%s*", "", 1)
    elseif (string.find(text, "[#/]o") == 1) then 
        return Character.whisper, text
    else
        return Character.say, text
    end
end

function M.set_value(value)
    if (type(value) == "function") then
        return value, 2
    elseif (value == "%NUMBER") then
        return nil, 1
    else
        return tonumber(value), 0
    end
end

function M.get_value(npc, value, type)
    if (type == 2) then
        return value(npc._saidNumber)
    elseif (type == 1) then
        return npc._saidNumber
    elseif (type == 0) then
        return value
    else
        return 0
    end
end

return M