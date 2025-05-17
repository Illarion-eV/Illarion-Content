--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

-- UPDATE items SET itm_script='item.spidernet' WHERE itm_id IN (3093,3094,3095,3096);

local M = {}

local LastWarp = {}

function M.CharacterOnField(User)

    local AktTime = {world:getTime("day"),world:getTime("hour"),world:getTime("minute")};
    local Ensnarl

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
        --User.movepoints=User.movepoints-40; -- ANNYOING AS HELL! deactivated.
        if (User:getPlayerLanguage() == 0) then
            User:inform("Du verf�ngst dich im Spinnennetz, kannst es aber zerrei�en.");
        else
            User:inform("You become entangled in the spiderweb but you can rip it.");
        end

        LastWarp[PosVal] = AktTime;
    end
end

return M

