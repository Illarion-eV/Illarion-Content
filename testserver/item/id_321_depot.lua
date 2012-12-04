-- Depots

-- UPDATE common SET com_script='item.id_321_depot' WHERE com_itemid=321;

module("item.id_321_depot", package.seeall)

function LookAtItem(User,Item)
    local lang = User:getPlayerLanguage();
    local LookAtStr = world:getItemName(321,lang).." (";

--NewIllarion

    if (Item.data==101) then
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
