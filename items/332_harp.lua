-- I_332 Harfe spielen

-- UPDATE common SET com_script='items.332_harp' WHERE com_itemid=332;

require("items.base.music")
require("items.general.wood")

module("items.332_harp", package.seeall(), package.seeall(items.general.wood))

items.base.music.addTalkText("#me plays the harp with a horrible crash","#me macht ein furchtbares Geräusch mit der Harfe");
items.base.music.addTalkText("#me plays a stilted tune on the harp","#me spielt eine gezierte Melodie auf der Harfe");
items.base.music.addTalkText("#me plays a smooth melody on the harp","#me spielt eine gleichbleibende Melodie auf der Harfe");
items.base.music.addTalkText("#me plays a pretty tune on the harp","#me spielt eine nette Melodie auf der Harfe");
items.base.music.addTalkText("#me plays a beautiful melody on the harp","#me spielt eine wunderschöne Melodie auf der Harfe");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    items.base.music.PlayInstrument(User,SourceItem,"harp");
end