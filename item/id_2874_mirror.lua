require("base.common")
require("content.chardescription")

module("item.id_2874_mirror", package.seeall, package.seeall(content.chardescription))

-- UPDATE common SET com_script='item.id_2874_mirror' WHERE com_itemid = 2874;

function init()
   lpos = position(-32,193,-8);
   mpos = position(-28,193,-8);
end

function LookAtItem( User, Item )
    if (first==nil) then
        init();
        first=1;
    end
    lang=User:getPlayerLanguage();
    if ( equapos(Item.pos, mpos) and (User:getFaceTo() == 2) and equapos(User.pos, position(-29,193,-8)) ) then
        if lang==0 then
            world:itemInform(User, Item, "Hinter deinem Rücken erkennst du deutlich eine Leiter im Spiegel");
        else
            world:itemInform(User, Item, "Behind your back you can clearly see a ladder in the mirror");
        end
        if ( not base.common.isItemIdInFieldStack( 35, lpos ) ) then
            world:createItemFromId( 35, 1, lpos, true, 999 ,0);
        end;
    else
        if lang==0 then
            world:itemInform(User, Item, "Spiegel");
        else
            world:itemInform(User, Item, "mirror");
        end
    end;
--	User:inform("in LookAtItem of spiegel");
	LookAtItemIdent(User,Item);
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	local output = "";
	local lang = User:getPlayerLanguage();
	local qual,dura = getClothesFactor(User);
	local ft = getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
	if(lang == 0) then
		output = "Du bist ";
		output = output..getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..ft;
		end
		output = output.." und "..getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Deine Kleidung wirkt "..getClothesQualText(qual, lang).." und "..getClothesDuraText(dura, lang)..".";
	else
		output = "You are ";
		output = output..getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
		end
		output = output.." and "..getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Your clothes look "..getClothesQualText(qual, lang).." and "..getClothesDuraText(dura, lang)..".";
	end
	User:sendCharDescription(User.id, output);
end
