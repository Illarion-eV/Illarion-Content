-- I_533 playing the drum

-- UPDATE common SET com_script='item.id_533_drum' WHERE com_itemid=533;

require("item.base.music")
require("item.general.wood")

module("item.id_533_drum", package.seeall, package.seeall(item.general.wood))

item.base.music.addTalkText("#me hits the drum chaoticly, making a lot of noise.", "#me schlägt planlos auf die Trommel ein und macht eine Menge Lärm.","drum" );
item.base.music.addTalkText("#me makes chattering uncoordinated noises on the drum.", "#me macht klappernde, unkoordinierte Geräusche auf der Trommel.","drum");
item.base.music.addTalkText("#me pounds upon the drum in a low sounding monotonous rythm.","#me schlägt im monotonen Rhythmus klangarm auf die Trommel. ","drum");
item.base.music.addTalkText("#me drums a loud though simple rhythm.","#me trommelt einen lauten aber einfachen Rhythmus. ","drum");
item.base.music.addTalkText("#me bangs a powerful, coordinated beat upon the drum.","#me trommelt gut klingende mehrteilige Rhythmen. ","drum");
item.base.music.addTalkText("#me beats in a wild, frenzied pulse, a deep broad sound emitting from the drum.","#me schlägt in wilden vielschichtigen Rhythmen, mit vollem, tiefen Klängen auf die Trommel.","drum");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    item.base.music.PlayInstrument(User,SourceItem,"drum");
end 
