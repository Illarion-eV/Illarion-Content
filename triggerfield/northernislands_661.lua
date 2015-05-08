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
-- INSERT INTO triggerfields VALUES (364,49,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (363,56,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (364,56,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (363,65,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (360,73,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (356,71,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (359,66,0,'triggerfield.northernislands_661');

-- INSERT INTO triggerfields VALUES (415,85,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (415,79,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (416,79,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (478,34,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (478,30,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (479,30,0,'triggerfield.northernislands_661');

-- INSERT INTO triggerfields VALUES (488,13,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (496,7,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (499,14,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (502,21,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (499,28,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (480,27,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (419,72,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (423,61,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (420,75,0,'triggerfield.northernislands_661');

local elementDrop = require("content.elementDrop")
local M = {}

local NorthPos={}
NorthPos[1]={position(364,49,0),position(363,56,0),position(364,56,0),position(363,65,0),position(360,73,0),position(356,71,0),position(359,66,0)}
NorthPos[2]={position(415,85,0),position(415,79,0),position(416,79,0),position(419,72,0),position(423,61,0),position(420,75,0)}
NorthPos[3]={position(478,34,0),position(478,30,0),position(479,30,0),position(488,13,0),position(496,7,0),position(499,14,0),position(502,21,0),position(499,28,0),position(480,27,0)}

local createNorthItemID={2553,2554,2551}
local createNorthItemIDB={359,360,372}
local createNorthGfx={9,4,8}

function M.MoveFromField(char)
    for i = 1,3 do
        local AmountPos = #NorthPos[i]
        for j = 1,AmountPos do
            if (char.pos == NorthPos[i][j]) then
                elementDrop.chanceForElementDrop(char, createNorthItemID[i])
            end
        end
    end
end

return M

