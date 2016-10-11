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
-- triggerfields for better atmosphere

--[[ SQL Statements:
INSERT INTO triggerfields VALUES (909,515,-6,'triggerfield.spidernest_ambient');
INSERT INTO triggerfields VALUES (909,516,-6,'triggerfield.spidernest_ambient');
INSERT INTO triggerfields VALUES (909,518,-6,'triggerfield.spidernest_ambient');
INSERT INTO triggerfields VALUES (909,519,-6,'triggerfield.spidernest_ambient');
INSERT INTO triggerfields VALUES (909,520,-6,'triggerfield.spidernest_ambient');
INSERT INTO triggerfields VALUES (909,521,-6,'triggerfield.spidernest_ambient');

]]

local common = require("base.common")
local ambient_base = require("triggerfield.base.ambient")

local M = {}

--[[
position: coordinates
direction: array with directions, 0=North,2=East,4=South,6=West. Set nil for always
german/english: text
hours: array with hours when text shall be shown, in range of 0 to 23. Set to nil for always.
months: array with months when text shall be shown, in range of 1 to 16. Set to nil for always.
chance: Chance that this triggerfield is triggered in percent (integer)

for script:
cisternList:add( position(x,y,z), {0,1,7}, "german", "english", {0,1,23}, {1,2,16}, chance );

for db:
INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.spidernest_ambient');


]]


local spidernestList = ambient_base()

--spidernest triggers using Ambient.lua as a guide
spidernestList.add( position(909,515,-6),{5,6,7},"Zu deiner Rechten siehst du einen Totelschädel liegen, der dich mit glühend roten Augen zu mustern scheint.","Off to your right, you see a skull whose eyes glow a bright red, beckoning you over.");
spidernestList.add( position(909,516,-6),{5,6,7},"Zu deiner Rechten siehst du einen Totelschädel liegen, der dich mit glühend roten Augen zu mustern scheint.","Off to your right, you see a skull whose eyes glow a bright red, beckoning you over.");
spidernestList.add( position(909,518,-6),{5,6,7},"Zu deiner Rechten siehst du einen Totelschädel liegen, der dich mit glühend roten Augen zu mustern scheint.","Off to your right, you see a skull whose eyes glow a bright red, beckoning you over.");
spidernestList.add( position(909,519,-6),{5,6,7},"Zu deiner Rechten siehst du einen Totelschädel liegen, der dich mit glühend roten Augen zu mustern scheint.","Off to your right, you see a skull whose eyes glow a bright red, beckoning you over.");
spidernestList.add( position(909,520,-6),{5,6,7},"Zu deiner Rechten siehst du einen Totelschädel liegen, der dich mit glühend roten Augen zu mustern scheint.","Off to your right, you see a skull whose eyes glow a bright red, beckoning you over.");
spidernestList.add( position(909,521,-6),{5,6,7},"Zu deiner Rechten siehst du einen Totelschädel liegen, der dich mit glühend roten Augen zu mustern scheint.","Off to your right, you see a skull whose eyes glow a bright red, beckoning you over.");

function M.MoveToField(Char)
    local this = spidernestList.get(Char)
    if this then
        common.InformNLS(Char, this.german, this.english)
    end
end

return M
