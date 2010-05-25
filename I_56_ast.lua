dofile( "base_lookat.lua" );
function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,2,false,false ));
end

function UseItemWithCharacter(User,SourceItem,TargetChar,Counter,Param)
    if ( User.id == 1332005118 ) then --only for one special char
        TargetChar:increaseAttrib("hitpoints",10000); --heal the char
        TargetChar:setPoisonValue(0);
        world:gfx(16,TargetChar.pos);
        if ( TargetChar:getPlayerLanguage() == 1 ) then
            TargetChar:inform("You feel how a healing warmth runs through your body and spends you new strength.");
        else
            TargetChar:inform("Du fühlst wie eine heilende Wärme deinen Körper durchströmt und dir neue Kraft schenkt.");
        end
    end
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    User:forceWarp(findPosition(User));
    User:inform("MEHx: "..User.pos.x.."   MEHy: " ..User.pos.y);
end

function findPosition(User)
    found=false;
    while found==false do
        x=math.random(-500,456);
        y=math.random(-500,274);
        newPos=position(x,y,0);
        tileID = world:getField(newPos):tile(); 

        if tileID ~= 5 and tileID ~= 6 then -- not lava and not water
            if world:isItemOnField(newPos) then
                itemID = world:getItemOnField(newPos).id;
                if itemID ~= 287 and (itemID < 622 or itemID > 630) then -- no rock walls on the tile
                    found=true;
                end
            else
                found=true;
            end
        end
    end
    User:inform("MAPx: "..newPos.x.."   MAPy: " ..newPos.y);
    return newPos;
end