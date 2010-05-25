-- I_90 Floete spielen

dofile("base_music.lua" );
dofile("base_lookat.lua" );

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if InitInstruments() then
        addTalkText("#me produces some squeaking sounds on the flute","#me macht einige quietschende Geräusche auf der Flöte");
        addTalkText("#me plays a horribly out of tune melody","#me spielt eine fürchterlich verstimmte Melodie auf der Flöte");
        addTalkText("#me plays an out of tune melody","#me spielt eine verstimmte Melodie auf der Flöte");
        addTalkText("#me plays an airy tune on the flute","#me spielt eine leichte Melodie auf der Flöte");
        addTalkText("#me plays a wild tune on the flute","#me spielt eine wilde Melodie auf der Flöte");
    end
    PlayInstrument(User,SourceItem,"flute");
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false) );
end