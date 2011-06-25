-- I_2744_pfeife.lua
--
require("base.common")
require("item.general.wood")

module("item.id_2744_pipe", package.seeall, package.seeall(item.general.wood))

-- UPDATE common SET com_script='item.id_2744_pipe' WHERE com_itemid = 2744;

function UseItem( Character, SourceItem, TargetItem, Counter, Param)

    if (Character:countItemAt("belt",155)==0) then -- kein Sibanac???
        base.common.InformNLS( Character,
        "Du benötigst Sibanac-Blätter um Pfeife rauchen zu können.",
        "You need sibanac-leafs to smoke a pipe." );
        return
    end

    -- Effekt setzen falls noch nicht vorhanden
    find, stonedEffect = Character.effects:find(19);
    if find then
	found, stonedIndex = stonedEffect:findValue("stonedIndex");
	if found then
	    stonedEffect:addValue("stonedIndex",(stonedIndex+1));
	end
    else

	Character.effects:addEffect( CLongTimeEffect(19,10) );
    end

    Character:talkLanguage(CCharacter.say,CPlayer.german ,"#me nimmt einen tiefen Zug von der Pfeife.");
    Character:talkLanguage(CCharacter.say,CPlayer.english,"#me takes a deep drag from the pipe.");
    
    Character:eraseItem( 155, 1 );

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
