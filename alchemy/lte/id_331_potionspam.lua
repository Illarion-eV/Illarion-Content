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
-- LTE für das Druidensystem
-- by Blay09

local M = {}

-- INSERT INTO longtimeeffects VALUES (331, 'alchemy_potionspam', 'alchemy.lte.id_331_potionspam');

function M.addEffect(Effect, Character)               -- Nur beim ersten Aufruf

end

function M.callEffect(Effect,Character)               -- Effect wird ausgeführt
	-- Tritt nur einmal auf. Nach 4 Stunden. Breche den Effekt also ab.
	return false;
end

function M.loadEffect(Effect,Character)               -- wenn der Charakter erneut einloggt

end

function M.removeEffect(Effect,Character)         

end

return M

