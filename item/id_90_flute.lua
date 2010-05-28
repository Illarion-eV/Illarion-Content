-- I_90 Floete spielen

-- UPDATE common SET com_script='item.id_90_flute' WHERE com_itemid=90;

require("item.id_base.music")
require("item.id_general.wood")

module("item.id_90_flute", package.seeall, package.seeall(item.id_general.wood))

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if InitInstruments() then
        addTalkText("#me produces some squeaking sounds on the flute","#me macht einige quietschende Ger�usche auf der Fl�te");
        addTalkText("#me plays a horribly out of tune melody","#me spielt eine f�rchterlich verstimmte Melodie auf der Fl�te");
        addTalkText("#me plays an out of tune melody","#me spielt eine verstimmte Melodie auf der Fl�te");
        addTalkText("#me plays an airy tune on the flute","#me spielt eine leichte Melodie auf der Fl�te");
        addTalkText("#me plays a wild tune on the flute","#me spielt eine wilde Melodie auf der Fl�te");
    end
    PlayInstrument(User,SourceItem,"flute");
end