-- I_92 Oel-Lampe

-- UPDATE common SET com_script='item.id_92_oillamp' WHERE com_itemid=92;

require("base.common")

module("item.id_92_oillamp", package.seeall)

function UseItem(User, SourceItem)
    x=math.random(99);
    if x < 6 then
        base.common.InformNLS(User,"Du bist nicht sicher, aber es scheint als würde die Lampe etwas leuchten","You are not sure, but it seems the lamp starts to glow a little.");
    elseif x < 16 then
        base.common.InformNLS(User,"Du glaubst zu fühlen, dass die Lampe wärmer wird","You think the lamp gets warmer!");
    elseif x < 30 then
        base.common.InformNLS(User,"Your strength was " .. User:increaseAttrib("strength",0),"Your strength was " .. User:increaseAttrib("strength",0))
        User:tempChangeAttrib("strength",5,60)
        base.common.InformNLS(User,"The lamp magically disappears and you suddenly feel a rising might in you.","The lamp magically disappears and you suddenly feel a rising might in you.")
        world:erase( SourceItem, 1 )
        base.common.InformNLS(User,"Your strength is " .. User:increaseAttrib("strength",0),"Your strength is " .. User:increaseAttrib("strength",0))
--        base.common.InformNLS(User,"The lamp suddenly breaks and an item is revealed.","The lamp suddenly breaks and an item is revealed.");
--        world:erase( SourceItem, 1 )
--        --User:eraseItem( 92, 1 )
--        -- create random ring
--        itemId = math.random( 0, 5 )
--        User:createItem( 277 + itemId, 1, 550, 0 )
    else
        base.common.InformNLS(User,"Du reibst an der Lampe, doch nichts passiert.","You rub the lamp but nothing happens.");

    end
end
