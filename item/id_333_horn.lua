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
-- I_333 Horn spielen

-- UPDATE items SET itm_script='item.id_333_horn' WHERE itm_id=333;

local music = require("item.base.music")
local wood = require("item.general.wood")

local M = {}

local skill = Character.horn

music.addTalkText("#me's cheeks turn red while blowing into a horn, but no sound is audible.","#me's Wangen werden beim Blasen in das Horn rot, aber kein Ton ist zu h�ren.", skill);
music.addTalkText("#me blows into a horn, producing a buzzing sound.","#me bl�st in das Horn und erzeugt ein summendes Ger�usch.", skill);
music.addTalkText("#me blows into a horn, producing a sound akin to that of a dying animal.","#me bl�st in das Horn und macht ein Ger�usch das wie ein sterbendes Tier klingt.", skill);
music.addTalkText("#me blows into a horn, producing a great sound.","#me bl�st in das Horn und erzeugt so einen guten Klang.", skill);
music.addTalkText("#me blows into a horn, producing an awesome sound.","#me bl�st in das Horn und erzeugt einen beeindruckenden Klang.", skill);

function M.UseItem(User, SourceItem)
    music.PlayInstrument(User,SourceItem, skill);
end

M.LookAtItem = wood.LookAtItem

return M

