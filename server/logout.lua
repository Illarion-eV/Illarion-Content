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

local factionLeader = require("scheduled.factionLeader")
local common = require("base.common")

local M = {}

-- Function to exchange the faction leader of a town.
local function exchangeFactionLeader( playerName )
    for i=1, #(factionLeader.informationTable) do
        if playerName == factionLeader.informationTable[i].npcName then
            factionLeader.updatePosition(factionLeader.informationTable[i].newPosition,
                factionLeader.informationTable[i].usualPosition)
        end
    end
end

function M.onLogout( theChar )

    world:gfx(31,theChar.pos); --A nice GFX that announces clearly: A player logged out.

    -- begin tying
    local foundEffect, Tying = theChar.effects:find(24);
    if foundEffect then -- Char is a captive, save logout time
        Tying:addValue("logout",1);
        Tying:addValue("logyears", common.getTime("year"));
        Tying:addValue("logmonths", common.getTime("month"));
        Tying:addValue("logdays", common.getTime("day"));
        Tying:addValue("loghours", common.getTime("hour"));
        Tying:addValue("logminutes", common.getTime("minute")+3);
        Tying:addValue("logseconds", common.getTime("second"));
        local foundCapturer, Capturer = Tying:findValue("Capturer");
        log("[Rope]: Tied up character "..theChar.name.." has logged out."..(foundCapturer and " Capturer: "..Capturer or ""))
    end
    -- end tying

    if theChar.name == "Valerio Guilianni" or theChar.name == "Rosaline Edwards" or theChar.name == "Elvaine Morgan" then
        exchangeFactionLeader( theChar.name )
    end
end

return M
