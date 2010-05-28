-- I_335 Laute spielen

-- UPDATE common SET com_script='item.id_335_lute' WHERE com_itemid=335;

require("item.id_base.music")
require("item.id_general.wood")

module("item.id_335_lute", package.seeall, package.seeall(item.id_general.wood))

item.id_base.music.addTalkText("#me makes a terrible noise on the lute","#me macht ein furchtbares Ger�usch mit der Laute");
item.id_base.music.addTalkText("#me plays some halting tunes","#me spielt einige unsichere T�ne auf der Laute");
item.id_base.music.addTalkText("#me plays some nice tunes on the lute","#me spielt einige sch�ne T�ne auf der Laute");
item.id_base.music.addTalkText("#me plays some nice sounding tunes on a lute","#me spielt einige gute klingende T�ne auf der Laute");
item.id_base.music.addTalkText("#me plays a lilting melody on a lute","#me spielt eine tr�llernde Melodie auf der Laute");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    item.id_base.music.PlayInstrument(User,SourceItem,"lute");
end