-- UPDATE common SET com_script='item.id_222_amulett' WHERE com_itemid IN (222);

require("item.priest.jewel")
require("base.common")

module("item.id_222_amulett", package.seeall)

function MoveItemBeforeMove( who, sourceItem, targetItem )
    fnd, eff = who.effects:find(9)
    if (fnd) then
        base.common.InformNLS(who, "Der Einfluss des Daemons hindert dich daran das Amulett ab zu nehmen","The power of the demon hinders you to remove the amulet");
        return false;
    else
        if ( targetItem.data == 777 ) then
		    if ( sourceItem.itempos == 2) then
		    	who:inform("Du kannst das Amulett nicht abnehmen.")
		        return false;
	 	    else
		    	return true;
		    end
		elseif targetItem.data == 111 then
			if sourceItem:getType() == 3 then
				base.common.InformNLS(who,
					"Etwas hindert dich daran, das Amulett auch nur anzufassen.",
					"Something won't let you even touch the amulet.");
				--return false;
			end
		end
    end
	return true;
end

function LookAtItem(User, Item)
    if ( Item.data == 666 ) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Verfluchtes Amulett des Sukkubus");
        else
            world:itemInform(User,Item,"Cursed amulet of the Succubus");
        end
    elseif ( Item.data == 777 ) then
		if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Leevens Amulett");
        else
            world:itemInform(User,Item,"Leeven's amulet");
        end
	elseif ( Item.data == 778 ) then
		if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Sternförmiges Amulett in dessen Mitte eine stilisierte Eisflamme eingelassen ist, die sich um eine ebenso stilisierte Feuerflamme windet");
        else
            world:itemInform(User,Item,"star-shaped amulet with a	stylized iceflame in the middle, which twines about an equally stylized fireflame");
        end
    else
        world:itemInform(User,Item,GetItemDescription(User,Item,1,false,false ));
    end
end


function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
	local target = base.common.GetFrontItem(User);
	if target then
		TargetItem = target;
	end
		
	if (TargetItem.id == 914) and (TargetItem.data == 666) then
        User:talkLanguage(Character.say,Player.german ,"#me's Hand leuchtet, ebenso wie das Drachenamulett, hell auf und als das Licht verlischt liegt ein seltsam geformter Schlüssel in der Hand und die Schrift auf dem Steinsockel glüht auf.");
        User:talkLanguage(Character.say,Player.english,"#me's Hand, as well as the dragon amulet, starts to glow brightly and as the light is gone there is a strange formed key inside the hand and the letters on the stone socket starts to shine.");
		world:gfx(8,TargetItem.pos);
		world:gfx(11,TargetItem.pos);
		world:gfx(31,TargetItem.pos);
		world:swap(TargetItem,3105,333);
		world:makeSound(7,TargetItem.pos);
		world:makeSound(26,TargetItem.pos);
		Keydata=0;
		if (User.pos.z == -6) then
			Keydata=666;
		elseif (User.pos.z == 1) then
			Keydata=667;
		elseif (User.pos.z == 3) then
			Keydata=668;
		elseif (User.pos.z == 0) then
			Keydata=669;
		end
		User:createItem( 2144, 1, 333, Keydata );
	
	elseif SourceItem.data == 111 and SourceItem.itempos == 2 then
		if counter == 1 then
			RingOfPower(User);
		elseif counter >= 2 and counter <= 5 then
			if not RoadToNode(User, counter-1) then
			end
		elseif counter == 6 then
			MuckyLuck(User);
		elseif counter == 7 then
			RemoveMuckyLuck(User, TargetItem);
		elseif counter == 8 and ((TargetItem ~= nil) and (TargetItem.id ~= 0)) then
			world:erase(TargetItem,255);
		end
	end

end

function RingOfPower(User)
	
	local pos = base.common.GetFrontPosition(User);
	world:gfx(2,pos);
	world:makeSound(4,pos);
	local flame = world:createItemFromId(359,1,pos,true,333,0);
	flame.wear = 1;
	world:changeItem(flame);
	world:makeSound(7,pos);
end

function RoadToNode(User, effectType)
	
	local charList = world:getPlayersInRangeOf(User.pos, 5);
	local validChars = {};
	local retVal = false;
	for i,char in charList do
		if char.id ~= User.id and char.pos.z == User.pos.z then
			if not char.effects:find(29) then
				table.insert(validChars, char);
				retVal = true;
			end
		end
	end
	if retVal then
		local target = validChars[math.random(1,table.getn(validChars))];
		local effect = LongTimeEffect(29,1);
		effect:addValue("effectType", effectType);
		target.effects:addEffect(effect);
	end
	return retVal;
end

function RemoveMuckyLuck(User, TargetItem)
	
	local radius = 2;
	local foodItems = {158,159,162};
	if TargetItem.id ~= 0 then
		for i,id in foodItems do
			if id == TargetItem.id and TargetItem.wear == 255 then
				world:erase(TargetItem,1);
			end
		end
	else
		local item;
		local event;
		event = function(pos)
			item = world:getItemOnField(pos);
			for i,id in foodItems do
				if id == item.id and item.wear == 255 then
					world:erase(item,1);
					return;
				end
			end
		end
		for i=1,radius do
			base.common.CreateCircle(User.pos,i,event);
		end
	end
end

function MuckyLuck(User)
	
	local radius = 2;
	local foodItems = {158,159,162};
	local pos = base.common.GetFrontPosition(User);
	if world:createDynamicNPC("Mucky Luck Sheep",18,pos,0,"npc_mucky_luck_sheep.lua") then
		world:makeSound(13,User.pos);
		local event;
		local item;
		local count = 1;
		event = function(posi)
			item = world:getItemOnField(posi);
			if item.id == 0 then
				count = (count > table.getn(foodItems)) and 1 or count;
				item = world:createItemFromId(foodItems[count],1,posi,false,333,0);
				item.wear = 255;
				world:changeItem(item);
				count = count + 1;
			end
		end
		for i=1,radius do
			base.common.CreateCircle(pos,i,event);
		end
	else
		base.common.InformNLS(User,
			"Irgendetwas verhindert die Ausführung des Rituals.",
			"Something inhibits performing the ritual.");
	end
end
