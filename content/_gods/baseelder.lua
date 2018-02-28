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

local class = require('base.class')
local basegod = require("content._gods.basegod")

local M = {}

M.BaseElder = class(
    basegod.BaseGod,
    function(self, ...)
        self:_init(...)
    end
)

function M.BaseElder:_init(ordinal, elderOrdinal)
    basegod.BaseGod._init(self, ordinal) -- call the base class constructor
    self.elderOrdinal = elderOrdinal
end

return M