-- Default look-at script

module("base.lookat", package.seeall, package.seeall(content.bonusitems))

-- init german descriptions
GenericQualDe={"perfekt","exzellent","sehr gut","gut","normal","mäßig","schlecht","sehr schlecht","schrecklich","furchtbar"};
GenericDuraDe={};
GenericDuraDe[1]={"nagelneu" ,"neu"      ,"fast neu","gebraucht","leicht abgenutzt","abgenutzt","sehr abgenutzt","alt"   ,"rostig"       ,"klapprig"  };
GenericDuraDe[2]={"nagelneu" ,"neu"      ,"fast neu","gebraucht","leicht abgenutzt","abgenutzt","sehr abgenutzt","alt"   ,"morsch"       ,"zerfallend"};
GenericDuraDe[3]={"nagelneu" ,"neu"      ,"fast neu","gebraucht","leicht abgenutzt","abgenutzt","sehr abgenutzt","alt"   ,"fadenscheinig","zerfetzt"  };
GenericDuraDe[4]={"funkelnd" ,"strahlend","glänzend","gebraucht","angekratzt",      "zerkratzt","matt",          "alt"   ,"stumpf",       "brüchig"   };

-- init english descriptions
GenericQualEn={"perfect","excellent","very good","good","normal","average","bad","very bad","awful","horrible"};
GenericDuraEn={};
GenericDuraEn[1]={"brand new","new"     ,"almost new","used","slightly scraped"  ,"scraped"  ,"highly scraped"  ,"old","rusty"     ,"corroded"      };
GenericDuraEn[2]={"brand new","new"     ,"almost new","used","slightly scratched","scratched","highly scratched","old","rotten"    ,"nearly decayed"};
GenericDuraEn[3]={"brand new","new"     ,"almost new","used","slightly torn"     ,"torn"     ,"highly torn"     ,"old","threadbare","torn"          };
GenericDuraEn[4]={"sparkling","shiny"    ,"glittery","used","slightly scraped","scraped"  ,"highly scraped"  ,"old","tarnished" ,"fragile"};

NONE = 0;
METAL = 1;
WOOD = 2;
CLOTH = 3;
JEWELERY = 4;

function GenerateLookAt(user, item, material)
	if (user == nil) then
		debug("Sanity check failed, no valid character supplied.");
		return;
	end;
	
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	if ((material < NONE) or (meterial > JEWELERY)) then
		debug("Sanity check failed, no valid material supplied.");
	end;
	
	local itemCommon = world:getItemStatsFromId(item.id);
	local lookAt = ItemLookAt();
	
	local isGerman = (user:getPlayerLanguage() == Player.german);
	
	local usedName;
	if (isGerman) then
		usedName = item:getData("nameDe");
	else
		usedName = item:getData("nameEn");
	end;
	if (usedName == nil) then
		usedName = world:getItemName(item.id, user:getPlayerLanguage());
	end;
	lookAt.name = usedName;
	
	local rarenessData = item:getData("rareness");
	if (rarenessData == nil) then
		lookAt.rareness = ItemLookAt.commonItem;
	else
		local value = tonumber(rarenessData);
		if (value ~= nil) then
			lookAt.rareness = value;
	    end;
	end;
	
	local usedDescription;
	if (isGerman) then
		usedDescription = item:getData("descriptionDe");
	else
		usedDescription = item:getData("descriptionEn");
	end;
	
	if (usedDescription ~= nil) then
		lookAt.description = descriptionData;
	end;
	
	if ((itemCommon.AgeingSpeed < 255) and (material > NONE)) then
		local craftedByData = item:getData("craftedBy");
		if (craftedByData ~= nil) then
			lookAt.craftedBy = craftedByData;
		end;
		
		lookAt.weight = itemCommon.Weight;
		lookAt.worth = itemCommon.Worth;
		
		local itemDura = math.mod(Item.quality, 100);
		local itemQual = (Item.quality - itemDura) / 100;
		
		local duraIndex;
		for i, duraLimit in pairs(GenericDuraLm) do
	        if (itemDura >= duraLimit) then
	            duraIndex = i;
				break;
	        end
	    end
		
		if (isGerman) then
			lookAt.qualityText = GenericQualDe[itemQual];
			lookAt.durabilityText = GenericDuraDe[material][duraIndex];
		else
			lookAt.qualityText = GenericQualEn[itemData];
			lookAt.durabilityText = GenericDuraEn[material][duraIndex];
		end;
		lookAt.durabilityValue = itemDura + 1;
		
		lookAt.diamondLevel = GetGemLevel(item, "magicalDiamond");
		lookAt.emeraldLevel = GetGemLevel(item, "magicalEmerald");
		lookAt.rubyLevel = GetGemLevel(item, "magicalRuby");
		lookAt.sapphireLevel = GetGemLevel(item, "magicalSapphire");
		lookAt.amethystLevel = GetGemLevel(item, "magicalAmethyst");
		lookAt.obsidianLevel = GetGemLevel(item, "magicalObsidian");
		lookAt.topazLevel = GetGemLevel(item, "magicalTopaz");
		lookAt.bonus = 0;
	end;
	
	return lookAt;
end;

function GetGemLevel(item, dataEntry)
	local dataEntry = item:getData(dataEntry);
	if (dataEntry == nil) then
		return 0;
	end;
	
	local value = tonumber(dataEntry);
	if (value == nil) then
		return 0;
	end;
	
	if ((value < 0) or (value > 10)) then
		return 0;
	else
		return value;
	end;
end;

function GetItemDescription(User, Item, material, Weapon, Priest)
	return GenerateLookAt(User, Item, material);
end;