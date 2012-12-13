-- I_532 playing the panpipe

-- UPDATE common SET com_script='item.id_532_panpipe' WHERE com_itemid=532;

require("item.base.music")
require("item.general.wood")

module("item.id_532_panpipe", package.seeall)

skill = Character.panpipe

item.base.music.addTalkText("#me blows hard in the panpipes, making a loud, annoying, screeching sound.", "#me pustet in die Panflöte und erzeugt ein lautes, nerviges, fast schreiendes Geräusch.", skill );
item.base.music.addTalkText("#me blows in the panpipes randomly, letting out a few loud uncoordinated sounds.", "#me bläst wirr auf der Panflöte, laute aber unmelodische Töne sind die Folge.", skill);
item.base.music.addTalkText("#me blows gently in the panpipes, singing a few, short tunes.","#me spielt einige leise Töne sachte auf der Panflöte. ", skill);
item.base.music.addTalkText("#me plays a nice, coordinated melody on the panpipes.","#me spielt eine klare Melodie auf der Panflöte. ", skill);
item.base.music.addTalkText("#me plays his panpipes, blowing gently and gracefully, singing an impressively beautiful melody.","#me spielt behändig eine beeindruckende Melodie voller Anmut auf der Panflöte. ", skill);

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    item.base.music.PlayInstrument(User,SourceItem, skill);
end

LookAtItem = item.general.wood.LookAtItem
