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
--- Response Parsers
--
-- This file is part of the easyNPC framework.
-- The function in this class take care for postprocessing the responses that
-- are said by the NPCs
--
-- Author: Martin Karing

local class = require("base.class")
local factions = require("base.factions")

module("npc.base.responses", package.seeall)

processorList = {};

do
	--- Default processor implementation that does simply nothing.
	local processor = class.class(function(self)
		-- "check" is the function called once a response is added. This function
		-- has to determine if this processor has at any point a impact on the 
		-- response. If this function returns "false" the processor will never be
		-- executed for this class.
		self["check"] = _processor_check_default;
		
		-- This function is called in order to process the actual response text.
		-- This function has to return the new text in any case.
		self["process"] = _processor_process_default;
	end);

	function _processor_check_default(self, response)
		return false;
	end;

	function _processor_process_default(self, playerChar, npc, npcChar, response)
		return response;
	end;

	do
		-- Player name processor
		-- This processor replaces %CHARNAME with the name of the character
		-- that is talking with the NPC.
		local playerNameProcessor = class.class(processor,
		function(self, value)
			processor:init(self);
		end);

		function playerNameProcessor:check(response)
			return (string.find(response, "%%CHARNAME") ~= nil);
		end;

		function playerNameProcessor:process(playerChar, npc, npcChar, response)
			return string.gsub(response, "%%CHARNAME", playerChar.name);
		end;
		table.insert(processorList, playerNameProcessor());
	end;

	do
		-- NPC name processor
		-- This processor replaces %NPCNAME with the name of the NPC.
		local npcNameProcessor = class.class(processor,
		function(self, value)
			processor:init(self);
		end);

		function npcNameProcessor:check(response)
			return (string.find(response, "%%NPCNAME") ~= nil);
		end;

		function npcNameProcessor:process(playerChar, npc, npcChar, response)
			return string.gsub(response, "%%NPCNAME", npcChar.name);
		end;
		table.insert(processorList, npcNameProcessor());
	end;
	
	do
		-- town processor
		-- This processor replaces %TOWN with the name of the town a character belongs to.
		local townNameProcessor = class.class(processor,
		function(self, value)
			processor:init(self);
		end);

		function townNameProcessor:check(response)
			return (string.find(response, "%%TOWN") ~= nil);
		end;

		function townNameProcessor:process(playerChar, npc, npcChar, response)
			local townName = factions.getMembershipByName(playerChar)
			return string.gsub(response, "%%TOWN", townName);
		end;
		table.insert(processorList, townNameProcessor());
	end;
	
	do
		-- rank processor
		-- This processor replaces %RANK with the rank of a character.
		local rankProcessor = class.class(processor,
		function(self, value)
			processor:init(self);
		end);

		function rankProcessor:check(response)
			return (string.find(response, "%%RANK") ~= nil);
		end;

		function rankProcessor:process(playerChar, npc, npcChar, response)
			local rank = factions.getRank(playerChar)
			return string.gsub(response, "%%RANK", rank);
		end;
		table.insert(processorList, rankProcessor());
	end;	
end;