--- Response Parsers
--
-- This file is part of the easyNPC framework.
-- The function in this class take care for postprocessing the responses that
-- are said by the NPCs
--
-- Author: Martin Karing

require("base.class")

module("npc.base.responses", package.seeall)

processorList = {};

do
	--- Default processor implementation that does simply nothing.
	local processor = base.class.class(function(self)
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
		local playerNameProcessor = base.class.class(processor,
		function(self, value)
			processor:init(self);
		end);

		function playerNameProcessor:check(response)
			return (string.find(response, "%CHARNAME", 0, true) ~= nil);
		end;

		function playerNameProcessor:process(playerChar, npc, npcChar, response)
			return string.gsub(response, "%%CHARNAME", playerChar.name);
		end;
		table.insert(processorList, playerNameProcessor());
	end;

	do
		local npcNameProcessor = base.class.class(processor,
		function(self, value)
			processor:init(self);
		end);

		function npcNameProcessor:check(response)
			return (string.find(response, "%NPCNAME", 0, true) ~= nil);
		end;

		function npcNameProcessor:process(playerChar, npc, npcChar, response)
			return string.gsub(response, "%%NPCNAME", npcChar.name);
		end;
		table.insert(processorList, npcNameProcessor());
	end;
end;