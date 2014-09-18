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

-- UPDATE items SET itm_script='item.id_313_glassmeltoven' WHERE itm_id IN (313);

local common = require("base.common")
local licence = require("base.licence")
local bricksproducing = require("content.gatheringcraft.bricksproducing")
local glassingotproducing = require("content.gatheringcraft.glassingotproducing")

module("item.id_313_glassmeltoven", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end

	if (User:countItemAt("all",311)==0 and User:countItemAt("all",734)==0) then
		-- no tool at all
		common.HighInformNLS( User,
			"Du brauchst ein Glasblasrohr oder eine Ziegelform um hier zu arbeiten.",
			"You need a glass blow pipe or a brick mould to work here." );
	elseif (User:countItemAt("all",311)>0 and User:countItemAt("all",734)==0) then
		-- only glass blow pipe
		glassingotproducing.StartGathering(User, SourceItem, ltstate);
	elseif (User:countItemAt("all",311)==0 and User:countItemAt("all",734)>0) then
		-- only brick mould
		bricksproducing.StartGathering(User, SourceItem, ltstate);
	else
		-- both tools
		if (User:countItemAt("all",316)>0 and User:countItemAt("all",314)>0) then
			glassingotproducing.StartGathering(User, SourceItem, ltstate);
		elseif ( (User:countItemAt("all",736) > 4) or (User:countItemAt("all",26) > 0) ) then
			bricksproducing.StartGathering(User, SourceItem, ltstate);
		else
			common.HighInformNLS( User,
				"Für die Ziegelform brauchst du Lehm oder fünf ungebrannte Ziegel, für das Glasblasrohr brauchst du Quarzsand und Pottasche.",
				"For the brick mould you need clay or five unfired bricks, for the glass blow pipe you need quartz sand and potash." );
		end
	end
end
