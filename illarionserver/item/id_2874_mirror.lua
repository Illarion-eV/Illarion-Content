require("base.common")
require("content.chardescription")

module("item.id_2874_mirror", package.seeall)
-- belongs also to item id 2873

-- UPDATE common SET com_script='item.id_2874_mirror' WHERE com_itemid = 2874;

ladderPosition = position(-32,193,-8)
mirrorPosition = position(-28,193,-8)

function LookAtItem(User, Item)
    
	local lookAt = base.lookat.GenerateLookAt(User, Item)

    if Item.pos == mirrorPosition and User:getFaceTo() == Character.dir_east and User.pos == position(-29, 193, -8) then
        lookAt.description = base.common.GetNLS("Hinter deinem Rücken erkennst du deutlich eine Leiter im Spiegel.",
                                                "Behind your back you can clearly see a ladder in the mirror.")
    
        if ( not base.common.isItemIdInFieldStack(35, ladderPosition)) then
            world:createItemFromId(35, 1, ladderPosition, true, 999, nil)
        end
    end
	
    world:itemInform(User, Item, lookAt)
end

function UseItem(User, SourceItem)
	local output = "";
	local lang = User:getPlayerLanguage();
	local qual,dura = content.chardescription.getClothesFactor(User);
	local ft = content.chardescription.getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
	if(lang == 0) then
		output = "Du bist ";
		output = output..content.chardescription.getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..ft;
		end
		output = output.." und "..content.chardescription.getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Deine Kleidung wirkt "..content.chardescription.getClothesQualText(qual, lang).." und "..content.chardescription.getClothesDuraText(dura, lang)..".";
	else
		output = "You are ";
		output = output..content.chardescription.getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..content.chardescription.getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
		end
		output = output.." and "..content.chardescription.getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Your clothes look "..content.chardescription.getClothesQualText(qual, lang).." and "..content.chardescription.getClothesDuraText(dura, lang)..".";
	end
	User:inform(output);
end