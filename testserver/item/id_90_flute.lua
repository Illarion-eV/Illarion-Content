-- I_90 Floete spielen

-- UPDATE common SET com_script='item.id_90_flute' WHERE com_itemid=90;

require("item.base.music")

module("item.id_90_flute", package.seeall)

item.base.music.addTalkText("#me produces some squeaking sounds on the flute.","#me macht einige quietschende Geräusche auf der Flöte.","flute");
item.base.music.addTalkText("#me plays a horribly out of tune melody.","#me spielt eine fürchterlich verstimmte Melodie auf der Flöte.","flute");
item.base.music.addTalkText("#me plays an out of tune melody.","#me spielt eine verstimmte Melodie auf der Flöte.","flute");
item.base.music.addTalkText("#me plays an airy tune on the flute.","#me spielt eine leichte Melodie auf der Flöte.","flute");
item.base.music.addTalkText("#me plays a wild tune on the flute.","#me spielt eine wilde Melodie auf der Flöte.","flute");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	item.base.music.PlayInstrument(User,SourceItem,Character.flute);
end
