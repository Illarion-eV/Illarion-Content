-- I_532 playing the panpipe

-- UPDATE common SET com_script='item.id_532_panpipe' WHERE com_itemid=532;

require("item.base.music")
require("item.general.wood")

module("item.id_532_panpipe", package.seeall, package.seeall(item.general.wood))

item.base.music.addTalkText("#me blows hard in the panpipes, making a loud, annoying, screeching sound.", "#me pustet in die Panfl�te und erzeugt ein lautes, nerviges, fast schreiendes Ger�usch." );
item.base.music.addTalkText("#me blows in the panpipes randomly, letting out a few loud uncoordinated sounds.", "#me bl��t wirr auf der Panfl�te, laute aber unmelodische T�ne sind die Folge.");
item.base.music.addTalkText("#me blows gently in the panpipes, singing a few, short tunes.","#me spielt einige leise T�ne sachte auf der Panfl�te. ");
item.base.music.addTalkText("#me plays a nice, coordinated melody on the panpipes.","#me spielt eine klare Melodie auf der Panfl�te. ");
item.base.music.addTalkText("#me plays his panpipes, blowing gently and gracefully, singing an impressively beautiful melody.","#me spielt beh�ndig eine beeindruckende Melodie voller Anmut auf der Panfl�te. ");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    item.base.music.PlayInstrument(User,SourceItem,"panpipe");
end