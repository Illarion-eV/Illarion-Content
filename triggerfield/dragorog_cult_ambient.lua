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
INSERT INTO triggerfields VALUES (X,Y,Z,'triggerfield.akaltutschamber_ambient');

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
DragorogList.add( position(x,y,z), {0,1,7}, "german", "english", {0,1,23}, {1,2,16}, chance );

for db:
INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.dragorog_cult_ambient');
]]


local DragorogList = ambient_base()

DragorogList.add( position(384,465,2),nil,"Es liegt ein beissender Gestank nach Schwefel, verrottendem Abfall und Verwesung in der Luft.","There is an acrid stench of a mixture of sulphur, rotting waste and decay in the air.",nil,nil,50); 
DragorogList.add( position(410,477,2),nil,"Der ganze Boden ist mit abgenagten Knochen bedeckt und nicht alle davon sehen aus, als ob sie von Tieren stammen würden.","The entire floor is covered with gnawed off bones and not all of them look, as though they belonged to animals.",nil,nil,50); 
DragorogList.add( position(438,448,2),nil,"Das Gebäude ist erstaunlich gemütlich eingerichtet und wirkt gut gepflegt.","The building seems surprisingly comfortablly furnished and looks well-kept.",nil,nil,50); 
DragorogList.add( position(410,443,2),nil,"Von der anderen Seite der Brücke her, hörst du ein leises Kratzen, als würde jemand mit einer besonders drahtigen Bürste über Stein fahren.","From across the bridge you hear a faint scratching noise, as though somebody is scrubbing over a stone with a particularly wiry brush.",nil,nil,50); 

function M.MoveToField(Char)
    local this = DragorogList.get(Char)
    if this then
        common.InformNLS(Char, this.german, this.english)
    end
end

return M
