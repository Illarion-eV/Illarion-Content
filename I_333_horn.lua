-- I_333 Horn spielen

-- UPDATE common SET com_script='I_333_horn.lua' WHERE com_itemid=333;

dofile( "base_music.lua" );
dofile( "base_lookat.lua" );

addTalkText("#me 's cheeks turn red while blowing in a horn but no sound is audible","#me's Wangen werden beim Blasen in das Horn rot, aber kein Ton ist zu hören.");
addTalkText("#me blows in a horn producing a buzzing sound","#me bläst in das Horn und erzeugt ein summendes Geräusch");
addTalkText("#me blows in a horn, sounding like a dying animal","#me bläst in das Horn und macht ein Geräusch das wie ein sterbendes Tier klingt.");
addTalkText("#me blows into a horn and produces a great sound","#me bläst in das Horn und erzeugt so einen guten Klang");
addTalkText("#me blows into a horn and produces a awesome sound","#me bläst in das Horn und erzeugt einen beeindruckenden Klang");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    PlayInstrument(User,SourceItem,"horn");
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false) );
end

function UseItemWithCharacter(User,SourceItem,Character,Counter,Param)
    -- mummy
    if ( Character:get_race() == 10 ) then
        p = Character.pos;
        Character:increaseAttrib( "hitpoints", - Character:increaseAttrib( "hitpoints", 0 ) );
        while world:isItemOnField( p ) do
            item = world:getItemOnField( p );
            world:erase( item, 1 );
        end;
        SourceItem.data = 101;
        world:changeItem( SourceItem );
    end
end

function UseItemWithField(User,SourceItem, TargetPos, Counter, Param)
    if ( SourceItem.data == 101 ) then
        world:createMonster(SourceItem.data,TargetPos,0);
        SourceItem.data = 0;
        world:changeItem( SourceItem );
    end;
end