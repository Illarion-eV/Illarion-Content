-- Default look-at script

require("base.common");
require("base.gems")
require("base.money")

module("base.lookat", package.seeall)

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
GenericDuraEn[3]={"brand new","new"     ,"almost new","used","slightly frayed" ,"frayed" ,"highly frayed" ,"old","threadbare","ragged" };
GenericDuraEn[4]={"sparkling","shiny"    ,"glittery","used","slightly scraped","scraped"  ,"highly scraped"  ,"old","tarnished" ,"fragile"};

GenericDuraLm={90,80,70,60,50,40,30,20,10,0};

NONE = 0;
METAL = 1;
WOOD = 2;
CLOTH = 3;
JEWELLERY = 4;

function GenerateLookAt(user, item, material)
	if (user == nil) then
		debug("Sanity check failed, no valid character supplied.");
		return;
	end;
	
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
    material = material or NONE

	if ((material < NONE) or (material > JEWELLERY)) then
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
	if base.common.IsNilOrEmpty(usedName) then
		usedName = world:getItemName(item.id, user:getPlayerLanguage());
	end;

    -- Enforce Title Case
    local function tchelper(first, rest)
        return first:upper()..rest:lower()
    end
    usedName = usedName:gsub("([%aäöüÄÖÜ])([%wäöüÄÖÜß_']*)", tchelper)

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
	
	if not base.common.IsNilOrEmpty(usedDescription) then
		lookAt.description = usedDescription;
	end;
	
	if itemCommon.AgeingSpeed < 255 and itemCommon.Weight < 30000 then
		local craftedByData = item:getData("craftedBy");
		if not base.common.IsNilOrEmpty(craftedByData) then
			lookAt.craftedBy = craftedByData;
		end;
		
		lookAt.weight = item.number * itemCommon.Weight;
		
        if not base.money.IsCurrency(item.id) then
            lookAt.worth = 20*item.number * itemCommon.Worth;
        end
		
        if material > NONE then
            local itemDura = math.mod(item.quality, 100);
            local itemQual = (item.quality - itemDura) / 100;
            
            local duraIndex;
            for i, duraLimit in pairs(GenericDuraLm) do
                if (itemDura >= duraLimit) then
                    duraIndex = i;
                    break;
                end
            end

            local qualIndex = 10 - itemQual
			
			if qualIndex < 1 then
				qualIndex = 1;
			elseif qualIndex > 10 then
				qualIndex = 10;
			end
            
            if (isGerman) then
                lookAt.qualityText = GenericQualDe[qualIndex];
                lookAt.durabilityText = GenericDuraDe[material][duraIndex];
            else
                lookAt.qualityText = GenericQualEn[qualIndex];
                lookAt.durabilityText = GenericDuraEn[material][duraIndex];
            end;
            lookAt.durabilityValue = itemDura + 1;
		end

		local armourfound, armour = world:getArmorStruct(item.id);

		local weaponfound, weapon = world:getWeaponStruct(item.id);

		if(weaponfound) then
			--lookAt.weaponType =	weapon.Type;
			--lookAt.level = weapon.Level;

			local extrastring = "This weapon's type is ";
			local levelstring = " and its level is ".. weapon.Level..".";
			local typestring = "";

			local germanstring =  "Dies ist eine "
			local germanlevel = "Sie hat das Level "..weapon.Level..".";

			local weaponSkill = 100;

			if(weapon.WeaponType==14) then
				weaponSkill = user:getSkill(Character.parry);
				extrastring = "This shield's level is "..weapon.Level..".";
				germanstring = "";
				levelstring = "";
			elseif(weapon.WeaponType==1 or weapon.WeaponType==4) then -- slash
				typestring = "slashing"
				germanstring =  germanstring.."Hiebwaffe. ";
				weaponSkill = user:getSkill(Character.slashingWeapons);
			elseif(weapon.WeaponType==2 or weapon.WeaponType==5) then -- conc
				typestring = "blunt"
				germanstring =  germanstring.."Schlagwaffe. ";
				weaponSkill = user:getSkill(Character.concussionWeapons);
			elseif(weapon.WeaponType==3 or weapon.WeaponType==6) then -- punc
				typestring = "stabbing"
				germanstring =  germanstring.."Stichwaffe. ";
				weaponSkill = user:getSkill(Character.punctureWeapons);
			elseif(weapon.WeaponType==7) then --ranged
				typestring = "ranged"
				germanstring =  germanstring.."Distanzwaffe. ";
				weaponSkill = user:getSkill(Character.distanceWeapons);
			end;

			local warningstring = "";
			local germanwarning = "";			

			if(weapon.Level>weaponSkill) then
				warningstring = " You don't feel skilled enough to use it effectively.";
				germanwarning  = " Du fühlst dich nicht erfahren genug, um diese Waffe effektiv zu führen.";
			end;

			if(weapon.WeaponType~=10 and weapon.WeaponType~=11 and weapon.WeaponType~=12) then 

				if(base.common.IsNilOrEmpty(lookAt.description)) then
					if(isGerman) then
						lookAt.description = germanstring..germanlevel..germanwarning;
					else
						lookAt.description = extrastring..typestring..levelstring..warningstring;
					end;
				else
					if(isGerman) then
						lookAt.description = lookAt.description.." "..germanstring..germanlevel..germanwarning;
					else
						lookAt.description = lookAt.description.." "..extrastring..typestring..levelstring..warningstring;
					end;
				end;
			end;
		end;

		if(armourfound) then

			local extrastring = "This armour's type is ";
			local typestring = "";

			local germanstring =  "Dies ist eine "
			local germanlevel = "Sie hat das Level "..armour.Level..".";

			local armourSkill = 100;

			if armour.Type == 0 then
				--lookAt.armourType = ArmorStruct.clothing;
				typestring = "clothing"
			elseif armour.Type == 1 then
				--lookAt.armourType = ArmorStruct.general;
				typestring = "general"
			elseif armour.Type == 2 then
				--lookAt.armourType = ArmorStruct.light;
				typestring = "light"
				germanstring =  germanstring.."Leichte Rüstung. "
				armourSkill = user:getSkill(Character.lightArmour);
			elseif armour.Type == 3 then
				--lookAt.armourType = ArmorStruct.medium;
				typestring = "medium"
				germanstring =  germanstring.."Mittlere Rüstung. "
				armourSkill = user:getSkill(Character.mediumArmour);
			elseif armour.Type == 4 then
				--lookAt.armourType = ArmorStruct.heavy;
				typestring = "heavy"
				germanstring =  germanstring.."Schwere Rüstung. "
				armourSkill = user:getSkill(Character.heavyArmour);
			elseif armour.Type == 5 then
				--lookAt.armourType = ArmorStruct.jewellery;
				typestring = "jewellery"
			end;

			local levelstring = " and its level is ".. armour.Level..".";

			local warningstring = "";
			local germanwarning = "";

			if(armour.Level>armourSkill) then
				warningstring = " You don't feel skilled enough to use it effectively.";
				germanwarning  = " Du fühlst dich nicht erfahren genug, um diese Waffe effektiv zu führen.";
			end;

			--lookAt.armorType = armour.Type;
			--lookAt.level = armour.Level;

			if ( armour.Type ~= 0 and armour.Type ~=5) then
				if(base.common.IsNilOrEmpty(lookAt.description)) then
					if(isGerman) then
						lookAt.description = germanstring..germanlevel..germanwarning;
					else
						lookAt.description = extrastring..typestring..levelstring..warningstring;
					end;
				else
					if(isGerman) then
						lookAt.description = lookAt.description.." "..germanstring..germanlevel..germanwarning;
					else
						lookAt.description = lookAt.description.." "..extrastring..typestring..levelstring..warningstring;
					end;
				end;
			end;
		end;

		lookAt.diamondLevel = GetGemLevel(item, "magicalDiamond");
		lookAt.emeraldLevel = GetGemLevel(item, "magicalEmerald");
		lookAt.rubyLevel = GetGemLevel(item, "magicalRuby");
		lookAt.sapphireLevel = GetGemLevel(item, "magicalSapphire");
		lookAt.amethystLevel = GetGemLevel(item, "magicalAmethyst");
		lookAt.obsidianLevel = GetGemLevel(item, "magicalObsidian");
		lookAt.topazLevel = GetGemLevel(item, "magicalTopaz");
		lookAt.bonus = base.gems.getGemBonus(item);
	end;
	
	return lookAt;
end;

function GenerateItemLookAtFromId(user, itemId, stackSize, data)
	local lookAt = ItemLookAt();
	local isGerman = (user:getPlayerLanguage() == Player.german);
	data = data or {};
	
	local usedName;
	if (isGerman) then
		usedName = data["nameDe"];
	else
		usedName = data["nameEn"];
	end;
	if base.common.IsNilOrEmpty(usedName) then
		usedName = world:getItemName(itemId, user:getPlayerLanguage());
	end;
	lookAt.name = usedName;
	
	local rarenessData = data["rareness"];
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
		usedDescription = data["descriptionDe"];
	else
		usedDescription = data["descriptionEn"];
	end;
	
	if not base.common.IsNilOrEmpty(usedDescription) then
		lookAt.description = usedDescription;
	end;

    local itemCommon = world:getItemStatsFromId(itemId)
	lookAt.weight = stackSize * itemCommon.Weight
    lookAt.worth = 20*stackSize * itemCommon.Worth

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

--- Apply a special name to a item. The name is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param german the german name this item is supposed to display
-- @param english the english name this item is supposed to display
function SetSpecialName(item, german, english)	
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	if ((german == nil) or (english == nil)) then
		debug("Sanity check failed, no valid item names supplied.");
		return;
	end;
	
	item:setData("nameDe", german);
	item:setData("nameEn", english);
end;

--- Remove the special name from a item. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function UnsetSpecialName(item)
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	item:setData("nameDe", "");
	item:setData("nameEn", "");
end;

--- Apply a special description to the item. The description is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param german the german description this item is supposed to display
-- @param english the english description this item is supposed to display
function SetSpecialDescription(item, german, english)	
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	if ((german == nil) or (english == nil)) then
		debug("Sanity check failed, no valid item descriptions supplied.");
		return;
	end;
	
	item:setData("descriptionDe", german);
	item:setData("descriptionEn", english);
end;

--- Remove the special description from a item. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function UnsetSpecialDescription(item)
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	item:setData("descriptionDe", "");
	item:setData("descriptionEn", "");
end;

--- Change the rareness of a item. The rareness value is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param rare the rareness value, valid values are: ItemLookAt.commonItem, ItemLookAt.uncommonItem, ItemLookAt.rareItem, ItemLookAt.epicItem
function SetItemRareness(item, rare)	
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	if ((rare ~= ItemLookAt.commonItem) and (rare ~= ItemLookAt.uncommonItem) and (rare ~= ItemLookAt.rareItem) and (rare ~= ItemLookAt.epicItem)) then
		debug("Sanity check failed, no valid item rareness supplied");
		return;
	end;
	
	item:setData("rareness", rare);
end;

--- Set the item rareness back to its default value. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function UnsetItemRareness(item)
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	item:setData("rareness", "");
end;

--- Set or change the name of the crafter who created this item. The rareness value is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param name the name of the person who created this item
function SetItemCraftedBy(item, name)	
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	if (name == nil) then
		debug("Sanity check failed, no valid crafter name supplied.");
		return;
	end;
	
	item:setData("craftedBy", name);
end;

--- Remove the name of the person who created this item from the item. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function UnsetItemCraftedBy(item)
	if (item == nil) then
		debug("Sanity check failed, no valid item supplied.");
		return;
	end;
	
	item:setData("craftedBy", "");
end;
