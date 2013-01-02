-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")

module("item.id_456_snowball", package.seeall)

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if Round==nil then
		Round=1;
	end
	if Round==1 then
        User:talkLanguage(Character.say,Player.german,"#me wirft einen Schneeball.");
        User:talkLanguage(Character.say,Player.english,"#me throws a snowball.");
		Round=2;
	else
		Round=nil;
	end
end


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	if (User.lastSpokenText == "attribute") then -- testing function. merung
        User:increaseAttrib("perception",10)
		User:increaseAttrib("essence",10) 
		User:increaseAttrib("intelligence",10)
    end
	
	local ListLanguages={Character.commonLanguage,Character.humanLanguage,Character.dwarfLanguage,Character.elfLanguage,Character.lizardLanguage,Character.orcLanguage,Character.halflingLanguage,Character.ancientLanguage}
	if (User.lastSpokenText == "sprache") then 
	    for i=1,#ListLanguages do
		    User:increaseSkill(ListLanguages[i],(-100))
		end
    end
	
	if (User.lastSpokenText == "set") then 
	    User:increaseSkill(Character.lizardLanguage,100)
	end
    local a,b,change = string.find(User.lastSpokenText,"change (%d+)")
    if a ~= nil then
        change = tonumber(change)
        User:increaseSkill(Character.lizardLanguage,change)
    end		
end