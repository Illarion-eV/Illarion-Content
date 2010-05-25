-- I_283.lua Teleport to blackstone cult cave

function UseItem( User, SourceItem, TargetItem, Counter, Param , ltstate )
    if ( ((SourceItem.data == 6666)or(SourceItem.data == 6667)) and ( SourceItem.itempos == CCharacter.left_tool or SourceItem.itempos == CCharacter.right_tool ) ) then
        if (User.pos.x < 250) or (User.pos.y < 50) then
            if ( ltstate == nil or ltstate == Action.success ) then
                if ( Counter == 2 ) then
                    User:warp(position(247,-362,-6));
                    world:gfx(5,position(248,-363,-6));
                    world:gfx(5,position(246,-363,-6));
                    world:gfx(5,position(248,-361,-6));
                    world:gfx(5,position(-246,-361,-6));
                else
                    User:warp(position(-255,20,-25));
                    world:gfx(5,position(-254,19,-25));
                    world:gfx(5,position(-256,19,-25));
                    world:gfx(5,position(-254,21,-25));
                    world:gfx(5,position(-256,21,-25));
                    if world:isItemOnField(position(-257,33,-25)) then
                        local effectItem = world:getItemOnField(position(-257,33,-25));
                        if (effectItem.id == 42) then
                            world:erase(effectItem,1);
                        end
                    end
                end
            elseif ( ltstate == Action.none ) then
                User:startAction( 100, 5, 4, 0, 0);
                if ( Counter == 2 ) then
                    world:gfx(5,position(248,-363,-6));
                    world:gfx(5,position(246,-363,-6));
                    world:gfx(5,position(248,-361,-6));
                    world:gfx(5,position(-246,-361,-6));
                else
                    world:gfx(5,position(-254,19,-25));
                    world:gfx(5,position(-256,19,-25));
                    world:gfx(5,position(-254,21,-25));
                    world:gfx(5,position(-256,21,-25));
                    local effectItem = world:createItemFromId(42, 1, position(-257,33,-25), true, 333, 0);
                    effectItem.wear = 4;
                    world:changeItem(effectItem);
                end
                User:talkLanguage( CCharacter.say, CPlayer.german, "#me berührt einen Schwarzstein welcher sogleich zu leuchten beginnt.");
                User:talkLanguage( CCharacter.say, CPlayer.english, "#me touches a blackstone, which starts to glow immediately.");
            elseif ( ltstate == Action.abort ) then
                User:talkLanguage(CCharacter.say, CPlayer.german, "#me wird abgelenkt und das Leuchten des Schwarzsteins verschwindet.");
                User:talkLanguage(CCharacter.say, CPlayer.english,"#me gets distracted and the glowing of the blackstone disappears instandly.");
                if ( Counter == 2 ) then
                    --Add handling for effect item here
                else
                    if world:isItemOnField(position(-257,33,-25)) then
                        local effectItem = world:getItemOnField(position(-257,33,-25));
                        if (effectItem.id == 42) then
                            world:erase(effectItem,1);
                        end
                    end
                end
            end
        else
            User:inform("Suddenly a long scratch runs over the blackstone.");
            SourceItem.data = 6667;
            world:changeItem(SourceItem);
        end;
    end;
end

function LookAtItem(User,Item)
    local ItemText="";
    if (Item.data==6666) then
        if (User:getPlayerLanguage()==0) then
            ItemText="Du siehst Schwarzstein des Tempels";
        else
            ItemText="You see Temple Blackstone";
        end
    elseif (Item.data==6667) then
        if (User:getPlayerLanguage()==0) then
            ItemText="Du siehst zerkratzten Schwarzstein des Tempels";
        else
            ItemText="You see scratched Temple Blackstone";
        end
    elseif (Item.data==667) then
        if (User:getPlayerLanguage()==0) then
            ItemText="Du siehst zerkratzten Schwarzstein";
        else
            ItemText="You see scratched blackstone";
        end
    else
        if (User:getPlayerLanguage()==0) then
            ItemText="Du siehst Schwarzstein";
        else
            ItemText="You see Blackstone";
        end
    end
    world:itemInform(User,Item,ItemText);
end