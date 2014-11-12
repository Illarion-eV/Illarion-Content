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
-- UPDATE common SET com_script='gm.items.id_100_trowel' WHERE com_itemid = 100;
local lookat = require("base.lookat")
local common = require("base.common")
local M = {}

function M.UseItem(User, SourceItem)
	local TargetItem = common.GetTargetItem(User, SourceItem);
	if not TargetItem then
		TargetItem = common.GetFrontItem(User);
	end
	if (TargetItem ~= nil and TargetItem.id > 0) then
	        if string.find(string.lower(User.lastSpokenText), "setnumber (%d+)") then
			local a,b, value = string.find(string.lower(User.lastSpokenText), "setnumber (%d+)");
			world:increase(TargetItem, value - TargetItem.number);
			User:logAdmin("modifies stack size of item " .. world:getItemName(TargetItem.id, Player.english) .. "(" .. TargetItem.id .. ") from " .. TargetItem.number .. " to " .. value)
			return
		end
	end

	-- check if a number was said, if not: don't do anything
	local a,b, value = string.find(User.lastSpokenText, "(%d+)");
	if value == nil or tonumber(value) == nil then
		return
	end

	local target = common.GetFrontPosition(User);

	local itemId = tonumber(value);
	local itemQual = 333;
	local itemData = nil
	local newItem = world:createItemFromId(itemId, 1, target, true, itemQual, itemData);
	newItem.wear = 255;
	world:changeItem(newItem);
	User:logAdmin("creates static item " .. world:getItemName(itemId, Player.english) .. "(" .. itemId .. ") at " .. tostring(target))
end

function M.LookAtItem(User, Item)
	lookat.SetSpecialDescription(Item, "Verwende die Kelle zum aufrufen der Funktionen (create items).", "Use the trowel to pick a function (create items).");
	lookat.SetSpecialName(Item, "Kelle", "Trowel");
	return lookat.GenerateLookAt(User, Item, lookat.METAL)
end

return M

