-- Spinnennetze
-- Nitram

-- UPDATE common SET com_script='item.spidernet' WHERE com_itemid IN (3093,3094,3095,3096);

module("item.spidernet", package.seeall)

function CharacterOnField(User)
    --User:inform("Los");
    --Variables 'LastChar' and 'Last Warp' have to be remanent.
    --Variables 'AktTime' and 'Ensnarl' are defined as local.
    local AktTime = {world:getTime("day"),world:getTime("hour"),world:getTime("minute")};
    local Ensnarl = true;
    if (LastWarp==nil) then
        LastWarp={};
    end
    --User:inform("Grundwerte");
    --if (LastChar == User.id) then Ensnarl = false end
    local PosVal=User.pos.x+User.pos.y+User.pos.z
    if (LastWarp[PosVal] ~= nil) then
        if (AktTime[1] ~= LastWarp[PosVal][1]) and (AktTime[2] ~= LastWarp[PosVal][2]) and (AktTime[3] ~= LastWarp[PosVal][3]) then
            Ensnarl = true;
        else
            Ensnarl = false;
        end
    else
        Ensnarl = true;
    end
    if Ensnarl then
        User.movepoints=User.movepoints-40;
        if (User:getPlayerLanguage() == 0) then
            User:inform("Du verf‰ngst dich im Spinnennetz, kannst es aber zerreiﬂen.");
        else
            User:inform("You become entangled in the spiderweb but you can rip it.");
        end
        --LastChar = User.id;
        LastWarp[PosVal] = AktTime;
    end
end
