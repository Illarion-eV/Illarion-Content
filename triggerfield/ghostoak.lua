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

-- INSERT INTO triggerfields VALUES (501,120,0,'triggerfield.ghostoak');

local common = require("base.common")

local M = {}

function M.MoveToField(User)

    if User:getType() == Character.player and User:getQuestProgress(112) == 1 then
        -- Quest: The Ghost Oak (112)
        common.InformNLS(User,
            "[Queststatus] Ein Schauer läuft dir den Rücken herunter, als du den Hain betrittst. Du hast die Geistereiche gefunden.",
            "[Quest status] A shiver runs down your spine as you enter the grove. This must be the ghost oak.")
        User:setQuestProgress(112, 2)
        return
    elseif User:getType() == Character.monster then
        -- Dont let Bone Ghost escape from quest area
        if User:getMonsterType() ~= 743 then -- Bone Ghost
            return
        end

        local Characters = world:getPlayersInRangeOf(User.pos, 5);
        for _, Char in pairs(Characters) do
            common.InformNLS(Char,
                "Silbrige Fäden ziehen das Gerippe zur Geistereiche zurück.",
                "Silver threads pull the Bones back to the Ghost Oak.")
        end
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
        User:warp(position(501, 108, 0))
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
    end
end

return M
