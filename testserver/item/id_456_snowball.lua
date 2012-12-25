-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")
require("alchemy.base.teacher")
require("alchemy.base.alchemy")
require("alchemy.base.brewing")

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
    if (User.lastSpokenText == "food") then
	    User:increaseAttrib("foodlevel",60000)
	end	
end