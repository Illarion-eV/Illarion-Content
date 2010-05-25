-- Script muss noch in die Datenbank eingefügt werden (Handspiegel, ID 336)

dofile("base_chardesc.lua");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	local output = "";
	local lang = User:getPlayerLanguage();
	local qual,dura = getClothesFactor(User);
	local ft = getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
	if(lang == 0) then
		output = "Du bist ";
		output = output..getAgeText(User:get_race(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..ft;
		end
		output = output.." und "..getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Deine Kleidung wirkt "..getClothesQualText(qual, lang).." und "..getClothesDuraText(dura, lang)..".";
	else
		output = "You are ";
		output = output..getAgeText(User:get_race(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
		end
		output = output.." and "..getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Your clothes look "..getClothesQualText(qual, lang).." and "..getClothesDuraText(dura, lang)..".";
	end
	User:sendCharDescription(User.id, output);
end