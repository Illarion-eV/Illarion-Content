
function LookAtItem(User,Item)
    local ItemText="";
    if (User:getPlayerLanguage()==0) then
        ItemText="Du siehst den Ring des Erzmagiers";
    else
        ItemText="You see the ring of the archmage";
    end
    if (Item.quality==1) then
        ItemText=ItemText.." Saladin Tyrus";
    elseif (Item.quality==2) then
        ItemText=ItemText.." Vasco Armengol Seda"
    elseif (Item.quality==3) then
        ItemText=ItemText.." Bernadette de Cyr"
    end
    world:itemInform(User,Item,ItemText);
end
