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
-- Wegweiserskript
-- Nitram
require("base.common")
require("content.signpost")
require("base.lookat")
require("triggerfield.slimeFeeding")

module("item.signpost", package.seeall)

-- UPDATE common SET com_script='item.signpost' WHERE com_itemid IN (1817,1809,1808,1807,308,1804,586,3084,3081,3082,3083,519,520,521,337,1914,1915,2046,2069,512,2924,2925,2926,2927);

function LookAtItemIdent(User,Item)
    -- slime quest sign
	triggerfield.slimeFeeding.setSign()
	
	-- fetching local references
    local signTextDe     = content.signpost.signTextDe;
    local signTextEn     = content.signpost.signTextEn;
    local signCoo        = content.signpost.signCoo;
    local signItemId     = content.signpost.signItemId;
    local signPerception = content.signpost.signPerception;
    
    local lookAt = base.lookat.GenerateLookAt(User, Item)

    UserPer = User:increaseAttrib("perception",0);
    tablePosition = tostring(Item.pos.x).." "..tostring(Item.pos.y).." "..tostring(Item.pos.z);
	if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if (Item.pos == signpos) then
					if (UserPer >= signPerception[tablePosition][i]) then
						lookAt.description = base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name))
					end
				end
			end
		end
	end 

    return lookAt

end

--[[
	LookAtItemIdent
	identity of LookAtItem
]]
LookAtItem = LookAtItemIdent;
