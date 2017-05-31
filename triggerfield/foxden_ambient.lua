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
INSERT INTO triggerfields VALUES (X,Y,Z,'triggerfield.foxden');

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
foxdenList.add( position(x,y,z), {0,1,7}, "german", "english", {0,1,23}, {1,2,16}, chance );

for db:
INSERT INTO triggerfields VALUES (815,386,-3,'triggerfield.foxden_ambient');
INSERT INTO triggerfields VALUES (819,390,-3,'triggerfield.foxden_ambient');
INSERT INTO triggerfields VALUES (813,386,-3,'triggerfield.foxden_ambient');
INSERT INTO triggerfields VALUES (815,383,-3,'triggerfield.foxden_ambient');
INSERT INTO triggerfields VALUES (816,383,-3,'triggerfield.foxden_ambient');
INSERT INTO triggerfields VALUES (817,383,-3,'triggerfield.foxden_ambient');
INSERT INTO triggerfields VALUES (822,393,-3,'triggerfield.foxden_ambient');
INSERT INTO triggerfields VALUES (810,385,-3,'triggerfield.foxden_ambient');
]]


local foxdenList = ambient_base()

--foxden_ambient triggers using Ambient.lua as a guide
foxdenList.add( position(815,386,-3),{4},"Einige Welpen können dabei beobachtet werden, wie sie im Schlamm spielen und dabei in der ganzen Umgebung den Dreck verteilen.","Some pups can be seen playing around in the mud, splashing mud all over the area.",nil,nil,30);
foxdenList.add( position(819,390,-3),nil,"Die Welpen bemerken dich und setzen sich auf. Ihre Köpfe neigen sich zur Seite und ihre Ohren stellen sich aufmerksam auf. Ihre Schwänze beginnen schnell und erwartungsvoll zu wedeln.","The pups sit up and take notice of you, their heads quirking to one side and their ears sitting up attentively. Their tails begin to wag very quickly in anticipation.",nil,nil,30);
foxdenList.add( position(813,386,-3),nil,"Die Welpen bemerken dich und setzen sich auf. Ihre Köpfe neigen sich zur Seite und ihre Ohren stellen sich aufmerksam auf. Ihre Schwänze beginnen schnell und erwartungsvoll zu wedeln.","The pups sit up and take notice of you, their heads quirking to one side and their ears sitting up attentively. Their tails begin to wag very quickly in anticipation.",nil,nil,30);
foxdenList.add( position(815,383,-3),{6},"In der Höhle ist es still. Jegliches Licht, das du bei dir trägst, könnte sich in dutzenden hungrigen und neugierigen Augen widerspiegeln, die dich von der anderen Seite des Weges her beobachten. Vielleicht könnte man dabei helfen, sie satt zu machen, indem man ihnen fünf Stücke irgend einer Fleischsorte bringt?","The cave is quiet. Any light you have might be reflected in the many hungry and curious eyes watching you from across the way. Perhaps bringing them five of any meat item might help keep them fed?",nil,nil,30);
foxdenList.add( position(816,383,-3),{2,4,6},"In der Höhle ist es still. Jegliches Licht, das du bei dir trägst, könnte sich in dutzenden hungrigen und neugierigen Augen widerspiegeln, die dich von der anderen Seite des Weges her beobachten. Vielleicht könnte man dabei helfen, sie satt zu machen, indem man ihnen fünf Stücke irgend einer Fleischsorte bringt?","The cave is quiet. Any light you have might be reflected in the many hungry and curious eyes watching you from across the way. Perhaps bringing them five of any meat item might help keep them fed?",nil,nil,30);
foxdenList.add( position(817,383,-3),{2,4,6},"In der Höhle ist es still. Jegliches Licht, das du bei dir trägst, könnte sich in dutzenden hungrigen und neugierigen Augen widerspiegeln, die dich von der anderen Seite des Weges her beobachten. Vielleicht könnte man dabei helfen, sie satt zu machen, indem man ihnen fünf Stücke irgend einer Fleischsorte bringt?","The cave is quiet. Any light you have might be reflected in the many hungry and curious eyes watching you from across the way. Perhaps bringing them five of any meat item might help keep them fed?",nil,nil,30);
foxdenList.add( position(822,393,-3),nil,"Die Fuchsmutter beobachtet dich mistrauisch und lässt ein leises, warnendes Knurren hören.","The fox mother eyes you suspiciously as she begins to growl a warning.",nil,nil,30);
foxdenList.add( position(810,385,-3),nil,"Ein einsames Junges stimmt ein trauerndes Jaulen an.","A lone pup begins to howl a mournful tune.",nil,nil,30);

function M.MoveToField(Char)
    local this = foxdenList.get(Char)
    if this then
        common.InformNLS(Char, this.german, this.english)
    end
end

return M
