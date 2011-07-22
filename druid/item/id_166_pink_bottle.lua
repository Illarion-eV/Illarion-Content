module("druid.item.id_166_pink_bottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    User:talk(CCharacter.say,"Using");
    User:talk(CCharacter.say,"Ich setze auf: "..User.lastSpokenText);
    SourceItem:setData("test",User.lastSpokenText);
    User:talk(CCharacter.say,"gesetzt auf: "..SourceItem:getData("test"));
end
	