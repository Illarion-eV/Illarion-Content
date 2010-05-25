function WarpChar(Char,Item)
    if equapos(Item.pos,position(56,-392,0)) then
        Char:warp(position(-60,-274,0));
        world:gfx(45,position(56,-392,0));
        world:gfx(45,position(-60,-274,0));
    elseif equapos(Item.pos,position(-60,-274,0)) then
        Char:warp(position(56,-392,0));
        world:gfx(45,position(56,-392,0));
        world:gfx(45,position(-60,-274,0));
    end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if (User:get_race()==10) then
        WarpChar(User,SourceItem);
    end
end

function UseItemWithCharacter(User,SourceItem,TargetChar,Counter,Param)
    if (User:get_race()==10) then
        WarpChar(TargetChar,SourceItem);
    end
end