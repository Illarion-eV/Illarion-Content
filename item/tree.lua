-- Tree Script
-- Envi
require("base.common")
require("content.tree")
require("base.lookat")
require("alchemy.base.teacher")

module("item.tree", package.seeall)

-- UPDATE common SET com_script='item.tree' WHERE com_itemid IN (308, 586, 1804, 1807, 1808, 1809, 1817, 960, 961, 962, 963, 589);

function UseItem(User, SourceItem, ltstate)
    -- alchemy stuff
	if SourceItem.pos == position(432,238,0) then
		alchemy.base.teacher.UseItem(User, SourceItem, ltstate)
		return
	end
	-- alchemy end
end

function LookAtItem(User,Item)
    -- alchemy stuff
	if Item.pos == position(432,238,0) then
		alchemy.base.teacher.LookAtItem(User, Item)
		return
	end
	-- alchemy end
	
	-- fetching local references
    local signNameDe     = content.tree.signNameDe
	local signNameEn     = content.tree.signNameEn
	local signTextDe     = content.tree.signTextDe;
    local signTextEn     = content.tree.signTextEn;
    local signCoo        = content.tree.signCoo;
    local signItemId     = content.tree.signItemId;
    local signPerception = content.tree.signPerception;

    local lookAt = base.lookat.GenerateLookAt(User, Item)

    local UserPer = User:increaseAttrib("perception",0);
	local tablePosition = tostring(Item.pos.x).." "..tostring(Item.pos.y).." "..tostring(Item.pos.z);
    if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if (Item.pos == signpos) then
                   	lookAt.name = base.common.GetNLS(User, signNameDe[tablePosition][i],signNameEn[tablePosition][i])
					if (UserPer >= signPerception[tablePosition][i]) then
						lookAt.description = base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name))
					else
						lookAt.description = base.common.GetNLS(User,"Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.","You recognise something, but you cannot read it, because you are too blind.")
					end
				end
			end
		end
	end

	world:itemInform(User, Item, lookAt)
    
end
