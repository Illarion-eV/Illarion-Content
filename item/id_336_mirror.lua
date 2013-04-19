-- Script muss noch in die Datenbank eingefügt werden (Handspiegel, ID 336)

require("content.chardescription")

module("item.id_336_mirror", package.seeall, package.seeall(content.chardescription))

-- UPDATE common SET com_script='item.id_336_mirror' WHERE com_itemid = 336;

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
