
module("druid.item.id_166_pink_bottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    User:talk(Character.say,"Using");
    User:talk(Character.say,"Ich setze auf: "..User.lastSpokenText);
    SourceItem:setValue(1,User.lastSpokenText);
    User:talk(Character.say,"gesetzt auf: "..SourceItem:getValue(1));
end
