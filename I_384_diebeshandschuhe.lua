dofile( "base_lookat.lua" );

function HideUser(User)
    if (User:getPlayerLanguage()==0) then
        User:inform("Du fühlst dich verborgen!");
    else
        User:inform("You feel hidden!");
    end;
    User.isinvisible = true;
end

function ShowUser(User)
    if (User:getPlayerLanguage()==0) then
        User:inform("Du fühlst dich paranoid.");
    else
        User:inform("You feel paranoid.");
    end;
    User.isinvisible = false;
end

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,3,false,false ));
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if (SourceItem.data==1) and (SourceItem.itempos==4) then
        if User.isinvisible then
            ShowUser(User);
        else
            HideUser(User);
        end;
    end;
end

function MoveItemAfterMove(User, SourceItem, TargetItem)
    if User.isinvisible and (SourceItem.itempos==4) then
        ShowUser(User);
    end;
end