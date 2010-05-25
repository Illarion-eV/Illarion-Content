-- I_335 Laute spielen

-- UPDATE common SET com_script='I_335_laute.lua' WHERE com_itemid=335;

dofile( "base_music.lua" );
dofile( "base_lookat.lua" );

addTalkText("#me makes a terrible noise on the lute","#me macht ein furchtbares Geräusch mit der Laute");
addTalkText("#me plays some halting tunes","#me spielt einige unsichere Töne auf der Laute");
addTalkText("#me plays some nice tunes on the lute","#me spielt einige schöne Töne auf der Laute");
addTalkText("#me plays some nice sounding tunes on a lute","#me spielt einige gute klingende Töne auf der Laute");
addTalkText("#me plays a lilting melody on a lute","#me spielt eine trällernde Melodie auf der Laute");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    PlayInstrument(User,SourceItem,"lute");
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false) );
end
