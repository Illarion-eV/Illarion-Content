-- data values in use: 100,101,102,666,700,800, 10000

require("base.lookat")
require("base.common")
require("content.jewelbonus")

module("item.id_235_goldring", package.seeall, package.seeall(content.jewelbonus))

function LookAtItem(User,Item)

    --------------------------------- SPIELERRINGE [ Data 100 - 500 ] --------------------------------------------------------------------------------
    if ( tonumber(Item:getData("ringData")) == 101) then -- Trauring von Roveig
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Goldener Trauring mit der Gravur: Katarine und Roveig, 7.Tag des Eldas im 23.Jahr")
        else
            world:itemInform(User,Item,"golden wedding ring with the gravure: Katarine and Roveig, 7.Day of Eldas in the 23.Year")
        end
    elseif ( tonumber(Item:getData("ringData")) == 102) then -- Trauring von Katarine
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Goldener Trauring mit der Gravur: Roveig und Katarine, 7.Tag des Eldas im 23.Jahr")
        else
            world:itemInform(User,Item,"golden wedding ring with the gravure: Roveig and Katarine, 7.Day of Eldas in the 23.Year")
        end
	elseif ( tonumber(Item:getData("ringData")) == 103) then -- Dajmail's Ring
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Goldener Ring mit der Gravur: Dajmail und Nordwind")
        else
            world:itemInform(User,Item,"golden ring with the gravure: Dajmail and Northwind")
        end

        -------------------------------- QUESTRINGE [ Data > 500 ] ------------------------------------------------------------------------------------
    else
        world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,false,false ));
    end
end

function MoveItemAfterMove( User, SourceItem, TargetItem )
    -- Trauring von Roveig und Katarine
    if ( TargetItem:getType() == 4 and (TargetItem.itempos == 7 or TargetItem.itempos == 8) and (tonumber(TargetItem:getData("ringData")) == 101
            or tonumber(TargetItem:getData("ringData")) == 102) and (User.id==479308490 or User.id==975152582) ) then
                User:inform("Als du den Ring anlegst, überkommt Dich ein wohliges Gefühl.");
	end
	return true;
end

function MoveItemBeforeMove( Character, SourceItem, TargetItem)
	return true;
end

function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
	return;
end
