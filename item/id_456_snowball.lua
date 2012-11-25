-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")
require("alchemy.base.teacher")

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
    local a, b, quest
    a,b,quest = string.find(User.lastSpokenText,"getquest (%d+)")
	if a ~= nil then
		quest = tonumber(quest)
		User:inform("Quest "..quest.." has queststatus"..User:getQuestProgress(quest))
		return
	end
	
	if (User.lastSpokenText == "teacher") then
	alchemy.base.teacher.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    end
end