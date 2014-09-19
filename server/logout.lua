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
require("base.keys")
require("base.common")
require("scheduled.factionLeader")

module("server.logout", package.seeall)

function onLogout( theChar )

	world:gfx(31,theChar.pos); --A nice GFX that announces clearly: A player logged out.

	-- begin tying
	local foundEffect, Tying = theChar.effects:find(24);
	if foundEffect then -- Char is a captive, save logout time
		Tying:addValue("logout",1);
		Tying:addValue("logyears",world:getTime("year"));
		Tying:addValue("logmonths",world:getTime("month"));
		Tying:addValue("logdays",world:getTime("day"));
		Tying:addValue("loghours",world:getTime("hour"));
		Tying:addValue("logminutes",world:getTime("minute")+3);
		Tying:addValue("logseconds",world:getTime("second"));
		foundCapturer, Capturer = Tying:findValue("Capturer");
		log("[Rope]: Tied up character "..theChar.name.." has logged out."..(foundCapturer and " Capturer: "..Capturer or ""))
	end
	-- end tying

	if theChar.name == "Valerio Guilianni" or theChar.name == "Rosaline Edwards" or theChar.name == "Elvaine Morgan" then
		exchangeFactionLeader( theChar.name )
	end

end

-- Function to exchange the faction leader of a town.
function exchangeFactionLeader( playerName )
	for i=1, #(scheduled.factionLeader.informationTable) do
		if playerName == scheduled.factionLeader.informationTable[i].npcName then
			scheduled.factionLeader.updatePosition(scheduled.factionLeader.informationTable[i].newPosition,
				scheduled.factionLeader.informationTable[i].usualPosition)
		end
	end
end
