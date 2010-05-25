function LookAtItem(User,Item)
    if (equapos(position(293,-341,-6),Item.pos)) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Hier ruht Darlok, Lord von Northerot, größter Held seiner Zeit.");
        else
            world:itemInform(User,Item,"Here rests Darlok, Lord of Northerot, greates hero of our time.");
        end
    end
end