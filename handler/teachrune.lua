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
local class = require("base.class")
local M = {}

M.teachRune = class(function(tchrune, ply, mtype, rID)
    tchrune.player=ply;
    tchrune.magictype=mtype;
    tchrune.runeID=rID;
end);

function M.teachRune:execute()
  (self.player):teachMagic(self.magictype,2^(self.runeID));
end

return M