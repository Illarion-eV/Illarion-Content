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
-- UPDATE items SET itm_script='item.id_336_mirror' WHERE itm_id = 336;

local chardescription = require("content.chardescription")
local jewel = require("item.general.jewel")

local M = {}

M.LookAtItem = jewel.LookAtItem

function M.UseItem(User, SourceItem)
	local output = "";
	local lang = User:getPlayerLanguage();
	local qual,dura = chardescription.getClothesFactor(User);
	local ft = chardescription.getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
	if(lang == 0) then
		output = "Du bist ";
		output = output..chardescription.getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..ft;
		end
		output = output.." und "..chardescription.getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Deine Kleidung wirkt "..chardescription.getClothesQualText(qual, lang).." und "..chardescription.getClothesDuraText(dura, lang)..".";
	else
		output = "You are ";
		output = output..chardescription.getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..chardescription.getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
		end
		output = output.." and "..chardescription.getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Your clothes look "..chardescription.getClothesQualText(qual, lang).." and "..chardescription.getClothesDuraText(dura, lang)..".";
	end
	User:inform(output);
end

return M

