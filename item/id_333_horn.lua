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

require("item.base.music")
require("item.general.wood")

module("item.id_333_horn", package.seeall)

skill = Character.horn

item.base.music.addTalkText("#me 's cheeks turn red while blowing in a horn but no sound is audible","#me's Wangen werden beim Blasen in das Horn rot, aber kein Ton ist zu hören.", skill);
item.base.music.addTalkText("#me blows in a horn producing a buzzing sound","#me bläst in das Horn und erzeugt ein summendes Geräusch", skill);
item.base.music.addTalkText("#me blows in a horn, sounding like a dying animal","#me bläst in das Horn und macht ein Geräusch das wie ein sterbendes Tier klingt.", skill);
item.base.music.addTalkText("#me blows into a horn and produces a great sound","#me bläst in das Horn und erzeugt so einen guten Klang", skill);
item.base.music.addTalkText("#me blows into a horn and produces a awesome sound","#me bläst in das Horn und erzeugt einen beeindruckenden Klang", skill);

function UseItem(User, SourceItem)
    item.base.music.PlayInstrument(User,SourceItem, skill);
end

LookAtItem = item.general.wood.LookAtItem
