-- Wegweiser Script
-- Nitram
require("base.common")
require("content.mirror")

module("item.mirror", package.seeall)

-- UPDATE common SET com_script='item.signpost' WHERE com_itemid IN (1817,1809,1808,1807,308,1804,586,3084,3081,3082,3083,519,520,521,337,1914,1915,2046,2069,512,2924,2925,2926,2927);

function LookAtItemIdent(User,Item)
    local test = "no value";
	if (first==nil) then
        content.mirror.InitMirror()
        first=1;
    end
    
    -- fetching local references
    local signTextDe     = content.mirror.signTextDe;
    local signTextEn     = content.mirror.signTextEn;
    local signCoo        = content.mirror.signCoo;
    local signItemId     = content.mirror.signItemId;
    local signPerception = content.mirror.signPerception;
    
    found = false;
    UserPer = User:increaseAttrib("perception",0);
    tablePosition = Item.pos.x .. Item.pos.y .. Item.pos.z;
	if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if equapos(Item.pos,signpos) then
					if (UserPer >= signPerception[tablePosition][i]) then
						found = true;
						world:itemInform(User,Item,base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name)));
						test = signTextDe[tablePosition][i];
					end
				end
			end
		end
	end 

	local outText = checkNoobiaSigns(User,Item.pos);
	if outText and not found then
		world:itemInform(User,Item,outText);
		found = true;
	end

	if not found then
        world:itemInform(User,Item,base.common.GetNLS(User,"Du siehst ","You see ")..world:getItemName(Item.id,User:getPlayerLanguage()));
    end

		User:inform("in LookAtItem of base_wegweiser.lua");
		User:inform(test);
end

--[[
	LookAtItemIdent
	identity of LookAtItem
]]
LookAtItem = LookAtItemIdent;
