-- I_533 playing the drum

-- UPDATE common SET com_script='item.id_553_drum' WHERE com_itemid=553;

require("item.id_base.music")
require("item.id_general.wood")

module("item.id_553_drum", package.seeall, package.seeall(item.id_general.wood))

item.id_base.music.addTalkText("#me hits the drum chaoticly, making a lot of noise.", "#me schl�gt planlos auf die Trommel ein und macht eine Menge L�rm." );
item.id_base.music.addTalkText("#me makes chattering uncoordinated noises on the drum.", "#me macht klappernde, unkoordinierte Ger�usche auf der Trommel.");
item.id_base.music.addTalkText("#me pounds upon the drum in a low sounding monotonous rythm.","#me schl�gt im monotonen Rhythmus klangarm auf die Trommel. ");
item.id_base.music.addTalkText("#me drums a loud though simple rhythm.","#me trommelt einen lauten aber einfachen Rhythmus. ");
item.id_base.music.addTalkText("#me bangs a powerful, coordinated beat upon the drum.","#me trommelt gut klingende mehrteilige Rhythmen. ");
item.id_base.music.addTalkText("#me beats in a wild, frenzied pulse, a deep broad sound emitting from the drum.","#me schl�gt in wilden vielschichtigen Rhythmen, mit vollem, tiefen Kl�ngen auf die Trommel.");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    item.id_base.music.PlayInstrument(User,SourceItem,"drum");
end 