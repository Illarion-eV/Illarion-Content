-- I_333 Horn spielen

-- UPDATE common SET com_script='items.333_horn' WHERE com_itemid=333;

require("items.base.music")
require("items.general.wood")

module("items.333_horn", package.seeall(), package.seeall(items.general.wood))

items.base.music.addTalkText("#me 's cheeks turn red while blowing in a horn but no sound is audible","#me's Wangen werden beim Blasen in das Horn rot, aber kein Ton ist zu hören.");
items.base.music.addTalkText("#me blows in a horn producing a buzzing sound","#me bläst in das Horn und erzeugt ein summendes Geräusch");
items.base.music.addTalkText("#me blows in a horn, sounding like a dying animal","#me bläst in das Horn und macht ein Geräusch das wie ein sterbendes Tier klingt.");
items.base.music.addTalkText("#me blows into a horn and produces a great sound","#me bläst in das Horn und erzeugt so einen guten Klang");
items.base.music.addTalkText("#me blows into a horn and produces a awesome sound","#me bläst in das Horn und erzeugt einen beeindruckenden Klang");

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    items.base.music.PlayInstrument(User,SourceItem,"horn");
end