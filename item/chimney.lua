-- Tree Script
-- Envi
require("base.common")
require("content.chimney")

module("item.chimney", package.seeall)

-- UPDATE common SET com_script='item.chimney' WHERE com_itemid IN (268, 269);

ChimneyListGerman = 
{
"PLACEHOLDER.",
};

ChimneyListEnglish = 
{
"PLACEHOLDER.",
};


function LookAtItemIdent(User,Item)
    local test = "no value";
	if (first==nil) then
        content.chimney.InitChimey()
        first=1;
    end

    -- fetching local references
    local signTextDe     = content.chimney.signTextDe;
    local signTextEn     = content.chimney.signTextEn;
    local signCoo        = content.chimney.signCoo;
    local signItemId     = content.chimney.signItemId;
    local signPerception = content.chimney.signPerception;

    found = false;
    UserPer = User:increaseAttrib("perception",0);
    tablePosition = Item.pos.x .. Item.pos.y .. Item.pos.z;
	if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if Item.pos == signpos then
					if (UserPer >= signPerception[tablePosition][i]) then
						found = true;
						world:itemInform(User,Item,base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name)));
						test = signTextDe[tablePosition][i];
					else
                        found = true;
						world:itemInform(User,Item,base.common.GetNLS(User,"~Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.~","~You recognise something, but you cannot read it, because you are too blind.~"));
                    end
				end
			end
		end
	end

	--[[local outText = checkNoobiaSigns(User,Item.pos);
	if outText and not found then
		world:itemInform(User,Item,outText);
		found = true;
	end ]]

	if not found then
        world:itemInform(User,Item,world:getItemName(Item.id,User:getPlayerLanguage()));
    end
    --[[if not found then
        val = ((Item.pos.x + Item.pos.y + Item.pos.z) % table.getn(ChimneyListGerman))+1;
        world:itemInform( User, Item, base.common.GetNLS(User, ChimneyListGerman[val], ChimneyListEnglish[val]) );
	end]]-- 
	
--		User:inform("in LookAtItem of base_wegweiser.lua");
		--User:inform(test);
end
--[[
	LookAtItemIdent
	identity of LookAtItem
  ]]
LookAtItem = LookAtItemIdent;
