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
-- Tree Script
-- Envi
require("base.common")
require("content.pennant")
require("base.lookat")

module("item.pennant", package.seeall)

-- UPDATE common SET com_script='item.pennant' WHERE com_itemid IN (2046, 2069, 512, 2924, 2925, 2926, 2927);
 
PennantListGerman = 
{
"PLACEHOLDER.",
};

PennantListEnglish = 
{
"PLACEHOLDER.",
};


function LookAtItemIdent(User,Item)
    local test = "no value";

    -- fetching local references
    local signTextDe     = content.pennant.signTextDe;
    local signTextEn     = content.pennant.signTextEn;
    local signCoo        = content.pennant.signCoo;
    local signItemId     = content.pennant.signItemId;
    local signPerception = content.pennant.signPerception;

    local lookAt = base.lookat.GenerateLookAt(User, Item)

    UserPer = User:increaseAttrib("perception",0);
    tablePosition = Item.pos.x .. Item.pos.y .. Item.pos.z;
	if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if (Item.pos == signpos) then
					if (UserPer >= signPerception[tablePosition][i]) then
						lookAt.description = base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name))
					else
						lookAt.description = base.common.GetNLS(User,"Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.","You recognise something, but you cannot read it, because you are too blind.")
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
