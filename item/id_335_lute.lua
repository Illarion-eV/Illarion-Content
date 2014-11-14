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
-- I_335 Laute spielen

-- UPDATE items SET itm_script='item.id_335_lute' WHERE itm_id=335;

local music = require("item.base.music")
local wood = require("item.general.wood")

local M = {}

local skill = Character.lute

music.addTalkText("#me makes a terrible noise on the lute.","#me macht ein furchtbares Geräusch mit der Laute.",  skill);
music.addTalkText("#me plays some halting tunes.","#me spielt einige unsichere Töne auf der Laute.",  skill);
music.addTalkText("#me plays some nice tunes on the lute.","#me spielt einige schöne Töne auf der Laute.",  skill);
music.addTalkText("#me plays some nice sounding tunes on a lute.","#me spielt einige gute klingende Töne auf der Laute.",  skill);
music.addTalkText("#me plays a lilting melody on a lute.","#me spielt eine trällernde Melodie auf der Laute.",  skill);

function M.UseItem(User, SourceItem)
    music.PlayInstrument(User,SourceItem, skill);
end

M.LookAtItem = wood.LookAtItem

return M

