function LookAtItem(User,Item)
    if equapos(Item.pos,position(147,-195,-3)) then
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Du siehst eine Vogelscheuche die seltsamerweise einen Bart und eine Krone tr‰gt. Auﬂerdem hat sie ein Schild am Arm befestigt auf dem steht: \"Was willst?\"");
        else
            world:itemInform(User,Item,"You see a scarecrow, with a beard and a crown. The scarecrow holds an paper with the lable: \"What did you want?\"");
        end
    else
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Du siehst eine Vogelscheuche");
        else
            world:itemInform(User,Item,"You see a scarecrow");
        end
    end
end