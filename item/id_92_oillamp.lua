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
-- I_92 Oel-Lampe

-- UPDATE items SET itm_script='item.id_92_oillamp' WHERE itm_id=92;

local common = require("base.common")

local M = {}

function M.UseItem(User, SourceItem)

    local randomValue = Random.uniform(1,99)
    
    if randomValue < 6 then
        User:inform("Du bist nicht sicher, aber es scheint als würde die Lampe etwas leuchten","You are not sure, but it seems the lamp starts to glow a little.")
    elseif randomValue < 16 then
        User:inform("Du glaubst zu fühlen, dass die Lampe wärmer wird","You think the lamp gets warmer!")
    else
        User:inform("Du reibst an der Lampe, doch nichts passiert.","You rub the lamp but nothing happens.")
    end
    
end

return M

