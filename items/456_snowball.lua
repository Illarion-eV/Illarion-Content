-- UPDATE common SET com_script='items.456_snowball' WHERE com_itemid IN (456);

module("items.456_snowball", package.seeall)

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if Round==nil then
		Round=1;
	end
	if Round==1 then
        User:talkLanguage(CCharacter.say,CPlayer.german,"#me wirft einen Schneeball.");
        User:talkLanguage(CCharacter.say,CPlayer.english,"#me throws a snowball.");
		Round=2;
	else
		Round=nil;
	end
end