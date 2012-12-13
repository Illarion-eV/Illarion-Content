-- I_335 Laute spielen

-- UPDATE common SET com_script='item.id_335_lute' WHERE com_itemid=335;

require("item.base.music")

module("item.id_335_lute", package.seeall)

skill = Character.lute

item.base.music.addTalkText("#me makes a terrible noise on the lute.","#me macht ein furchtbares Geräusch mit der Laute.",  skill);
item.base.music.addTalkText("#me plays some halting tunes.","#me spielt einige unsichere Töne auf der Laute.",  skill);
item.base.music.addTalkText("#me plays some nice tunes on the lute.","#me spielt einige schöne Töne auf der Laute.",  skill);
item.base.music.addTalkText("#me plays some nice sounding tunes on a lute.","#me spielt einige gute klingende Töne auf der Laute.",  skill);
item.base.music.addTalkText("#me plays a lilting melody on a lute.","#me spielt eine trällernde Melodie auf der Laute.",  skill);

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    item.base.music.PlayInstrument(User,SourceItem, skill);
end
