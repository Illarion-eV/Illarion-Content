-- Depots

-- UPDATE common SET com_script='item.id_321_depot' WHERE com_itemid=321;

module("item.id_321_depot", package.seeall)

function LookAtItem(User,Item)
    local lang = User:getPlayerLanguage();
    local LookAtStr = world:getItemName(321,lang).." (";
    if (Item.data==0) then
        LookAtStr = LookAtStr.."Troll's Bane";
    elseif (Item.data==1) then
        LookAtStr = LookAtStr.."Varshikar";
    elseif (Item.data==2) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Graue Rose";
        else
            LookAtStr = LookAtStr.."Grey Rose";
        end
    elseif (Item.data==3) then
        LookAtStr = LookAtStr.."Greenbriar";
    elseif (Item.data==4) then
        LookAtStr = LookAtStr.."Tol Vanima";
    elseif (Item.data==5) then
        LookAtStr = LookAtStr.."Farmers Union";
    elseif (Item.data==6) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Ork-Höhle";
        else
            LookAtStr = LookAtStr.."Orc Cave";
        end
    elseif (Item.data==7) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Silberbrand";
        else
            LookAtStr = LookAtStr.."Silverbrand";
        end
    elseif (Item.data==8) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Akademie der Magie";
        else
            LookAtStr = LookAtStr.."Academy of Magic";
        end
    elseif (Item.data==9) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Eldan-Kloster & Haus der Druiden des Waldes";
        else
            LookAtStr = LookAtStr.."Eldan monastery & House of the druids of the forest";
        end
    elseif (Item.data==10) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Der Tempel";
        else
            LookAtStr = LookAtStr.."The Temple";
        end
    elseif (Item.data==11) then
        LookAtStr = LookAtStr.."Kallahorn";
    elseif (Item.data==12) then
        LookAtStr = LookAtStr.."Miners Guild";
    elseif (Item.data==13) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Nordmark";
        else
            LookAtStr = LookAtStr.."Northmark";
        end
    elseif (Item.data==14) then
        LookAtStr = LookAtStr.."Caelum";

--NewIllarion

    elseif (Item.data==101) then
            LookAtStr = LookAtStr.."Cadomyr";

    elseif (Item.data==102) then
            LookAtStr = LookAtStr.."Runewick";

    elseif (Item.data==103) then
            LookAtStr = LookAtStr.."Galmair";

    elseif (Item.data==104) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Gasthof zur Hanfschlinge";
        else
            LookAtStr = LookAtStr.."The Hemp Necktie Inn";
        end

    elseif (Item.data==1337) then
        if (lang==0) then
            LookAtStr = LookAtStr.."Estralis - Hand ab, sonst Hand ab!";
        else
            LookAtStr = LookAtStr.."Estralis - Hands off or hands off!";
        end

    else

        theOwner=getCharForId(Item.data);
        if theOwner then   
            LookAtStr = LookAtStr..theOwner.name;
        else
            LookAtStr = LookAtStr.."Debugging: Unknown depot";
        end
    end
    
    LookAtStr = LookAtStr..")";
    world:itemInform(User,Item,LookAtStr);
end
