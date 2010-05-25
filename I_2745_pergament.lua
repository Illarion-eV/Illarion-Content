require("base.common")

function LookAtItem(User,Item)
    local text = base.common.GetNLS(User,"Du siehst ein Pergament","You see a parchment");
    if equapos(Item.pos,position(18,-334,-23)) then
        text = text .. base.common.GetNLS(User,
        " mit der Aufschrift: \"Der Ring ist weg. Die Halblinge sind weg. Es sind immer noch Orks da, und ich habe das dumme Gefühl, ich sollte ganz woanders sein.\"",
        " with the text: \"The ring is gone. The halflings are gone. There are still orcs around, and i have the stupid feeling that i should be somewhere else.\"");
    elseif equapos(Item.pos,position(9,-351,-23)) then
        text = text .. base.common.GetNLS(User,
        " mit der Aufschrift: \"Man sagt, Drachen reagieren freundlicher, wenn man sie mit netter Musik weckt.\"",
        " with the text: \"It is believed that dragons react friendlier if you awake them with nice music.\"");
    elseif(Item.data==1) then
        text = text .. base.common.GetNLS(User,
        " mit der Aufschrift: \"Nachricht für Clarissa\"",
        " with the text: \"Message for Clarissa\"");
    elseif (Item.data==16) then
        text = "Knight's Prayer for Malachin";
    end
    world:itemInform(User,Item,text);
end

function UseItem(User, SourceItem, TargetItem, counter, param)
    mess = math.random(3);
    if(SourceItem.data==1) then
        if (mess==1) then
            base.common.InformNLS(User,
            "Liebste! Ich habe hier viel zu tun, aber ich hoffe, bald können wir uns wiedersehen. - In Liebe, Progor",
            "My love! I have a lot of work to do here, but I hope we soon can meet. - Love, Progor");
        elseif (mess==2) then
            base.common.InformNLS(User,
            "Hallo Clarissa! Tut mir leid, dass ich vergessen hab' dir zu schreiben. Ich hoffe, wir sehen uns bald mal wieder. - Progor",
            "Hello Clarissa! I'm sorry, that I forgot to write you. I hope we can soon meet. - Progor");
        elseif (mess==3) then
            base.common.InformNLS(User,
            "Clarissa! Es ist vorbei mit uns. Es tut mir leid. - Progor",
            "Clarissa! It's over between us. I'm sorry. - Progor");
        end
    elseif (SourceItem.data==16) then
        if (counter==1) then
            User:talk( CCharacter.say, "Oh Lord of Battle, patron of warriors, I call for your presence, I as a knight to become, and I as your disciple." );
        elseif (counter==2) then
            User:talk( CCharacter.say, "I come before you with my armor, the sign of my loyalty to the knighthood and my loyalty to you, my lord." );
        elseif (counter==3) then
            User:talk( CCharacter.say, "I pray you to watch over me and my path that I take, to protect me and to help me protect others." );
        elseif (counter==4) then
            User:talk( CCharacter.say, "Bless this armor which I bear, the armor which will suffer many battles, but which will aid me fight for the right and the just." );
        end;
    end;
end