require("base.common")

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	if(TargetItem.wear == 255) then
		base.common.InformNLS(User, "So sehr du es auch versuchst, das Blut lässt sich einfach nicht wegwischen.", "No matter how much you try to wipe up the blood, you are unable to remove it.");
		return
	end
    world:erase(TargetItem,1);
    User:talkLanguage(CCharacter.say,CPlayer.german ,"#me kniet sich hin und wischt das Blut auf.");
    User:talkLanguage(CCharacter.say,CPlayer.english,"#me kneels down and wipes the blood up.");
end