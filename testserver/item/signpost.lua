-- Wegweiserskript
-- Nitram
require("base.common")
require("content.signpost")

module("item.signpost", package.seeall)

-- UPDATE common SET com_script='item.signpost' WHERE com_itemid IN (1817,1809,1808,1807,308,1804,586,3084,3081,3082,3083,519,520,521,337,1914,1915,2046,2069,512,2924,2925,2926,2927);

function LookAtItemIdent(User,Item)
	if (first==nil) then
        content.signpost.InitWegweiser()
        first=1;
    end
    
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

    world:itemInform(User, Item, lookAt)

end

--[[
	LookAtItemIdent
	identity of LookAtItem
]]
LookAtItem = LookAtItemIdent;
