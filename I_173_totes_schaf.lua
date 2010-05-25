-- Skript f&uuml;r das Auswaiden eines Schafes

-- UPDATE common SET com_script='I_173_totes_schaf.lua' WHERE com_itemid=173;
function UseItem(User,SourceItem,TargetItem,Counter,Param)
    local erfolg = false;
    liste = {2687,2689,2690,2668,2670,2672,2672,2673,27,2740,2742,2742,2743,189};
    local i=1;
    repeat
        if ((User:getItemAt(6).id == liste[i]) or (User:getItemAt(5).id == liste[i])) then
            erfolg = true
        end
        i=i+1;
    until (i==table.getn(liste)+1 or erfolg)
    if erfolg then
        world:erase(SourceItem,1);
        world:createItemFromId(63,1,SourceItem.pos,true,333,0)
        world:createItemFromId(2934,1,SourceItem.pos,true,333,0)
    end
end -- function
