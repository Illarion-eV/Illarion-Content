-- I_533 playing the drum

-- UPDATE common SET com_script='item.id_533_drum' WHERE com_itemid=533;

require("item.base.music")
require("item.general.wood")

module("item.id_533_drum", package.seeall)

skill = Character.drum

item.base.music.addTalkText("#me hits the drum chaoticly, making a lot of noise.", "#me schlägt planlos auf die Trommel ein und macht eine Menge Lärm.", skill );
item.base.music.addTalkText("#me makes chattering uncoordinated noises on the drum.", "#me macht klappernde, unkoordinierte Geräusche auf der Trommel.", skill);
item.base.music.addTalkText("#me pounds upon the drum in a low sounding monotonous rythm.","#me schlägt im monotonen Rhythmus klangarm auf die Trommel. ", skill);
item.base.music.addTalkText("#me drums a loud though simple rhythm.","#me trommelt einen lauten aber einfachen Rhythmus. ", skill);
item.base.music.addTalkText("#me bangs a powerful, coordinated beat upon the drum.","#me trommelt gut klingende mehrteilige Rhythmen. ", skill);
item.base.music.addTalkText("#me beats in a wild, frenzied pulse, a deep broad sound emitting from the drum.","#me schlägt in wilden vielschichtigen Rhythmen, mit vollem, tiefen Klängen auf die Trommel.", skill);

function UseItem(User,SourceItem,TargetItem)
    item.base.music.PlayInstrument(User,SourceItem, skill);
end 

LookAtItem = item.general.wood.LookAtItem
