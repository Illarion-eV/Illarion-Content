-- I_533 playing the drum

-- UPDATE common SET com_script='items.553_drum' WHERE com_itemid=553;

require("items.base.music")
require("items.general.wood")

module("items.553_drum", package.seeall(), package.seeall(items.general.wood))

items.base.music.addTalkText("#me hits the drum chaoticly, making a lot of noise.", "#me schlägt planlos auf die Trommel ein und macht eine Menge Lärm." );
items.base.music.addTalkText("#me makes chattering uncoordinated noises on the drum.", "#me macht klappernde, unkoordinierte Geräusche auf der Trommel.");
items.base.music.addTalkText("#me pounds upon the drum in a low sounding monotonous rythm.","#me schlägt im monotonen Rhythmus klangarm auf die Trommel. ");
items.base.music.addTalkText("#me drums a loud though simple rhythm.","#me trommelt einen lauten aber einfachen Rhythmus. ");
items.base.music.addTalkText("#me bangs a powerful, coordinated beat upon the drum.","#me trommelt gut klingende mehrteilige Rhythmen. ");
items.base.music.addTalkText("#me beats in a wild, frenzied pulse, a deep broad sound emitting from the drum.","#me schlägt in wilden vielschichtigen Rhythmen, mit vollem, tiefen Klängen auf die Trommel.");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    items.base.music.PlayInstrument(User,SourceItem,"drum");
end 