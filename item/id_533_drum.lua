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
-- I_533 playing the drum

-- UPDATE items SET itm_script='item.id_533_drum' WHERE itm_id=533;

local music = require("item.base.music")
local wood = require("item.general.wood")

module("item.id_533_drum", package.seeall)

skill = Character.drum

music.addTalkText("#me hits the drum chaoticly, making a lot of noise.", "#me schlägt planlos auf die Trommel ein und macht eine Menge Lärm.", skill );
music.addTalkText("#me makes chattering uncoordinated noises on the drum.", "#me macht klappernde, unkoordinierte Geräusche auf der Trommel.", skill);
music.addTalkText("#me pounds upon the drum in a low sounding monotonous rythm.","#me schlägt im monotonen Rhythmus klangarm auf die Trommel. ", skill);
music.addTalkText("#me drums a loud though simple rhythm.","#me trommelt einen lauten aber einfachen Rhythmus. ", skill);
music.addTalkText("#me bangs a powerful, coordinated beat upon the drum.","#me trommelt gut klingende mehrteilige Rhythmen. ", skill);
music.addTalkText("#me beats in a wild, frenzied pulse, a deep broad sound emitting from the drum.","#me schlägt in wilden vielschichtigen Rhythmen, mit vollem, tiefen Klängen auf die Trommel.", skill);

function UseItem(User, SourceItem)
    music.PlayInstrument(User,SourceItem, skill);
end 

LookAtItem = wood.LookAtItem
