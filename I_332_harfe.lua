-- I_332 Harfe spielen

-- UPDATE common SET com_script='I_332_harfe.lua' WHERE com_itemid=332;

dofile( "base_music.lua" );
dofile( "base_lookat.lua" );

addTalkText("#me plays the harp with a horrible crash","#me macht ein furchtbares Geräusch mit der Harfe");
addTalkText("#me plays a stilted tune on the harp","#me spielt eine gezierte Melodie auf der Harfe");
addTalkText("#me plays a smooth melody on the harp","#me spielt eine gleichbleibende Melodie auf der Harfe");
addTalkText("#me plays a pretty tune on the harp","#me spielt eine nette Melodie auf der Harfe");
addTalkText("#me plays a beautiful melody on the harp","#me spielt eine wunderschöne Melodie auf der Harfe");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    PlayInstrument(User,SourceItem,"harp");
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false) );
end