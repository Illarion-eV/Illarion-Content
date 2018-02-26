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

local basegod = {}
basegod.__index = basegod

setmetatable(basegod, {
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function basegod:_init(ordinal, name_de, name_en)
    self._ordinal = ordinal
    self._name_de = name_de
    self._name_en = name_en
end

function basegod:getOrdinal()
    return self.ordinal
end

--function basegod:_setOrdinal(ordinal)
--    self.ordinal = ordinal
--end

function basegod:getNameEn()
    return self._name_en
end

function basegod:getNameDe()
    return self._name_de
end

function basegod:getNameEn()
    return self._name_en
end
