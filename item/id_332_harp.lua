-- I_332 Harfe spielen

-- UPDATE common SET com_script='item.id_332_harp' WHERE com_itemid=332;

require("item.base.music")
require("item.general.wood")

module("item.id_332_harp", package.seeall, package.seeall(item.general.wood))

item.base.music.addTalkText("#me plays the harp with a horrible crash","#me macht ein furchtbares Ger�usch mit der Harfe");
item.base.music.addTalkText("#me plays a stilted tune on the harp","#me spielt eine gezierte Melodie auf der Harfe");
item.base.music.addTalkText("#me plays a smooth melody on the harp","#me spielt eine gleichbleibende Melodie auf der Harfe");
item.base.music.addTalkText("#me plays a pretty tune on the harp","#me spielt eine nette Melodie auf der Harfe");
item.base.music.addTalkText("#me plays a beautiful melody on the harp","#me spielt eine wundersch�ne Melodie auf der Harfe");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    item.base.music.PlayInstrument(User,SourceItem,"harp");
end