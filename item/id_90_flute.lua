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
-- I_90 Floete spielen

-- UPDATE items SET itm_script='item.id_90_flute' WHERE itm_id=90;

local music = require("item.base.music")
local wood = require("item.general.wood")

local M = {}

local skill = Character.flute

music.addTalkText("#me produces some squeaking sounds on the flute.","#me macht einige quietschende Geräusche auf der Flöte.", skill);
music.addTalkText("#me plays a horribly out of tune melody.","#me spielt eine fürchterlich verstimmte Melodie auf der Flöte.", skill);
music.addTalkText("#me plays an out of tune melody.","#me spielt eine verstimmte Melodie auf der Flöte.", skill);
music.addTalkText("#me plays an airy tune on the flute.","#me spielt eine leichte Melodie auf der Flöte.", skill);
music.addTalkText("#me plays a wild tune on the flute.","#me spielt eine wilde Melodie auf der Flöte.", skill);

function M.UseItem(User, SourceItem)

    music.PlayInstrument(User,SourceItem,skill);

end

M.LookAtItem = wood.LookAtItem

return M

