
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



