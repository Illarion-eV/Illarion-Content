-- I_2744_pfeife.lua
--
require("base.common")
require("item.general.wood")

module("item.id_2744_pipe", package.seeall, package.seeall(item.general.wood))

-- UPDATE common SET com_script='item.id_2744_pipe' WHERE com_itemid = 2744;

function UseItem( User, SourceItem, TargetItem, Counter, Param)
	New = User:createItem (1061, 1, 333, 0)
	New.setData("destination","1")
	world:changeItem(New)
	
	--local ammountSib = User:countItemAt("belt",155);
	--local ammountTob = User:countItemAt("belt",772);
	if (User:countItemAt("belt",155) == 0 and User:countItemAt("belt",772) == 0) then
		base.common.InformNLS( User,
        "Du benötigst Sibanac-Blätter oder Tabak um Pfeife rauchen zu können.",
        "You need sibanac-leaves or tobacco to smoke a pipe." );
		
		
	elseif (User:countItemAt("belt",155) ~= 0) then 
		User:talkLanguage(Character.say,Player.german ,"#me nimmt einen tiefen Zug von der Pfeife.");
		User:talkLanguage(Character.say,Player.english,"#me takes a deep drag from the pipe.");
		User:eraseItem( 155, 1 );
			
	elseif (User:countItemAt("belt",772) ~= 0) then
		User:talkLanguage(Character.say,Player.german ,"#me bläst einen Rauchkringel in die Luft.");
		User:talkLanguage(Character.say,Player.english,"#me puffs a ring of smoke into the air.");
		User:eraseItem( 772, 1 );
	--[[Effekt setzen falls noch nicht vorhanden
	-- LTE to get High, currently not working
			find, stonedEffect = Character.effects:find(19);
			if find then
			found, stonedIndex = stonedEffect:findValue("stonedIndex");
			if found then
			stonedEffect:addValue("stonedIndex",(stonedIndex+1));
			end
			else

			Character.effects:addEffect( LongTimeEffect(19,10) );
			end]]

	end
end
	

	
	
function LookAtItem(User, Item)
	
	local customText = base.lookat.GetItemDescription(User,Item,2,false,false);
	if Item.data > 2^30 then
		world:itemInform( User, Item, customText );
	else
		world:itemInform( User, Item, User:getPlayerLanguage()==0 and
			world:getItemName(Item.id,0) or
			world:getItemName(Item.id,1) );
	end
end
