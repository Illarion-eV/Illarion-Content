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

local common = require("base.common")

local M = {} -- a list that is returned to server as table

function M.UseItem(user, sourceItem, ltstate)
  world:makeSound( 9, user.pos )
  common.InformNLS(user,
  "Du fühlst dich gleich viel sauberer.", -- use the same text as use bucket of self
  "You feel much cleaner.")
end

return M -- return tabel to server
