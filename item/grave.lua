-- Tree Script
-- Envi
require("base.common")
require("content.grave")

module("item.grave", package.seeall)

-- UPDATE common SET com_script='item.grave' WHERE com_itemid IN (337, 519, 520, 521);
  
GraveListGerman = 
{
"PLACEHOLDER.",
};

GraveListEnglish = 
{
"PLACEHOLDER.",
};

function LookAtItemIdent(User,Item)
    local test = "no value";
	if (first==nil) then
        content.grave.InitGrave()
        first=1;
    end

    -- fetching local references
    local signTextDe     = content.grave.signTextDe;
    local signTextEn     = content.grave.signTextEn;
    local signCoo        = content.grave.signCoo;
    local signItemId     = content.grave.signItemId;
    local signPerception = content.grave.signPerception;

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

    world:itemInform(User, Item, lookAt)
end
--[[
	LookAtItemIdent
	identity of LookAtItem
  ]]
LookAtItem = LookAtItemIdent;
