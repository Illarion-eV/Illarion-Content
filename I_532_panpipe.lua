-- I_532 playing the panpipe

-- UPDATE common SET com_script='I_532_panpipe.lua' WHERE com_itemid=532;

dofile( "base_music.lua" );
dofile( "base_lookat.lua" );

addTalkText("#me blows hard in the panpipes, making a loud, annoying, screeching sound.", "#me pustet in die Panflöte und erzeugt ein lautes, nerviges, fast schreiendes Geräusch." );
addTalkText("#me blows in the panpipes randomly, letting out a few loud uncoordinated sounds.", "#me bläßt wirr auf der Panflöte, laute aber unmelodische Töne sind die Folge.");
addTalkText("#me blows gently in the panpipes, singing a few, short tunes.","#me spielt einige leise Töne sachte auf der Panflöte. ");
addTalkText("#me plays a nice, coordinated melody on the panpipes.","#me spielt eine klare Melodie auf der Panflöte. ");
addTalkText("#me plays his panpipes, blowing gently and gracefully, singing an impressively beautiful melody.","#me spielt behändig eine beeindruckende Melodie voller Anmut auf der Panflöte. ");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    PlayInstrument(User,SourceItem,"panpipe");
end 

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false) );
end




 
