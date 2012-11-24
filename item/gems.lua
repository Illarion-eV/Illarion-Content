require("content.lookat.unique")
require("base.common")

-- UPDATE common SET com_script='item.gems' WHERE com_itemid IN (45, 46, 197, 198, 283, 284, 285);

module("item.gems", package.seeall)

DIAMOND  = 1
EMERALD  = 2
RUBY     = 3
OBSIDIAN = 4
SAPPHIRE = 5
AMETHYST = 6
TOPAZ    = 7

gemItem = {}
gemItem[DIAMOND] = 285
gemItem[EMERALD] = 45
gemItem[RUBY] = 46
gemItem[OBSIDIAN] = 283
gemItem[SAPPHIRE] = 284
gemItem[AMETHYST] = 197
gemItem[TOPAZ] = 198

gemPrefixDE = {"latent", "bedingt", "leicht", "mäßig", "durchschnittlich", "bemerkenswert", "stark", "sehr stark", "unglaublich", "einzigartig"}
gemPrefixEN = {"latent", "limited", "slight", "moderate", "average", "notable", "strong", "very strong", "unbelievable", "unique"}

gemLevelRareness = {}
gemLevelRareness[1] = ItemLookAt.uncommonItem
gemLevelRareness[2] = ItemLookAt.uncommonItem
gemLevelRareness[3] = ItemLookAt.uncommonItem
gemLevelRareness[4] = ItemLookAt.rareItem
gemLevelRareness[5] = ItemLookAt.rareItem
gemLevelRareness[6] = ItemLookAt.rareItem
gemLevelRareness[7] = ItemLookAt.epicItem
gemLevelRareness[8] = ItemLookAt.epicItem
gemLevelRareness[9] = ItemLookAt.epicItem
gemLevelRareness[10] = ItemLookAt.epicItem

function createMagicGem(user, gem, quantity, level)
    local quantity = quantity or 1
    local level = level or 1
    local item = gemItem[gem]
    local data = {}
    data.gemLevel = level
    
    local notCreated = user:createItem(item, quantity, 999, data)
end

function initStones()
    stoneNumber={};
    stoneNumber[285]=1;     -- diamant      285 -> 1
    stoneNumber[45]=2;      -- smaragd      45  -> 2
    stoneNumber[46]=3;      -- rubin        46  -> 3
    stoneNumber[283]=4;     -- schwarzstein 283 -> 4
    stoneNumber[284]=5;     -- blaustein    284 -> 5
    stoneNumber[197]=6;     -- amethyst     197 -> 6
    stoneNumber[198]=7;     -- topas        198 -> 7
end

function initJewel()
	jewelNumber={};
	jewelNumber[280]=1;			-- Diamantring		280 -> 1
	jewelNumber[281]=2;         -- smaragdring      281 -> 2
	jewelNumber[68]=3;      	-- rubinring         68 -> 3
    jewelNumber[278]=4;     	-- schwarzsteinring 278 -> 4
	jewelNumber[279]=5;         -- blausteinring 	279 -> 5
    jewelNumber[277]=6;     	-- amethystring     277 -> 6
	jewelNumber[282]=7;     	-- topasring        282 -> 7
	jewelNumber[235]=8;			-- Goldring			235 -> 8
end

-------------------------------------------
-- stone2 | str2 - 1 | stone1 | str1 - 1 --
-------------------------------------------

function generateData(gemItem,TargetItem,itemCl,dummy)
   if initSt==nil then
        initStones();
        initSt=1;
    end
    if TargetItem.data==0 then  -- first stone inserted
        --dummy:inform("1");
        newData=(gemItem.data-1);
        newData=newData+10*stoneNumber[gemItem.id]
    elseif ((TargetItem.data>9) and (TargetItem.data<100) and itemCl~=7) then   -- second stone inserted (not for jewels)
        --dummy:inform("2");
        newData=TargetItem.data;
        newData=newData+100*(gemItem.data-1);
        newData=newData+1000*stoneNumber[gemItem.id];
    else
        --dummy:inform("3");
        return 0;
    end
    return newData;    
end

function LookAtItem(user, item)
    local lookAt = base.lookat.GenerateLookAt(user, item)

    local gemLevel = tonumber(item:getData("gemLevel"))
    
    if gemLevel then
        if user:getPlayerLanguage() == 0 then
            lookAt.name = gemPrefixDE[gemLevel] .. " magischer " .. lookAt.name
        else
            lookAt.name = gemPrefixEN[gemLevel] .. " magical " .. lookAt.name
        end

        lookAt.rareness = gemLevelRareness[gemLevel]
    end

    world:itemInform(user, item, lookAt)
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    -- 1 -> Waffen
    -- 2 -> Bögen (Fernkampfwaffen)
    -- 3 -> Rüstung
    -- 4 -> Schilde
    -- 5 -> Zauberstäbe
    -- 6 -> Werkzeuge
    -- 7 -> Schmuck
	local TargetItem = base.common.GetTargetItem(User, SourceItem);

    content.lookat.unique.itemList();
    if content.lookat.unique.ItemClass[TargetItem.id] ~= nil then
		if checkjewel(SourceItem, TargetItem,content.lookat.unique.ItemClass[TargetItem.id]) then
			if SourceItem.data >0 and SourceItem.data<11 then
	    	    dataVal=generateData(SourceItem,TargetItem,content.lookat.unique.ItemClass[TargetItem.id],User);
	    	    if dataVal>0 then
	    	        --User:inform("data. "..dataVal);
	    	        TargetItem.data=dataVal;
	    	        world:changeItem(TargetItem);
	    	        world:erase(SourceItem,1);
	    	    else
					base.common.InformNLS(User, "Dieser Edelstein kann dort nicht eingefügt werden.", "The gem cannot be inserted here!");
	    	    end
			end
		else
			base.common.InformNLS(User, "Das funktioniert nicht.", "This cannot be done.");
		end
    end

end

function checkjewel(GemItem, TargetItem,ItemClass)
	if ItemClass==7 then
		if initSt==nil then
	        initStones();
	        initSt=1;
	    end
		if initJw==nil then
	        initJewel();
	        initJw=1;
	    end
		if ( (stoneNumber[GemItem.id]==jewelNumber[TargetItem.id]) or jewelNumber[TargetItem.id]==8 ) then
			return true;
		else
			return false;
		end
	else
		return true;
	end
end
