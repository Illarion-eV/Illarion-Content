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

local M = {}

M.BaseGod = class(
    function(self, ...)
        self:_init(...)
    end
)

function M.BaseGod:_init(ordinal)
    self._ordinal = ordinal
    self._name_de = nil -- str, should be set in child class
    self._name_en = nil -- str, should be set in child class
    self._description_de = nil -- str, should be set in child class
    self._description_en = nil -- str, should be set in child class
    self._devotion_items = nil -- array of item ids, should be set in child class
end

function M.BaseGod:getOrdinal()
    return self._ordinal
end

--function M.BaseGod:_setOrdinal(ordinal)
--    self.ordinal = ordinal
--end

function M.BaseGod:getNameEn()
    return self._name_en
end

function M.BaseGod:getNameDe()
    return self._name_de
end

function M.BaseGod:getDescriptionEn()
    return self._description_en
end

function M.BaseGod:getDescriptionDe()
    return self._description_de
end

function M.BaseGod:getDevotionItems()
    return self._devotion_items
end

function M.BaseGod:getFavour(User)
    return User:getQuestProgress(402 + self._ordinal)
end

function M.BaseGod:setFavour(User, newValue)
    User:setQuestProgress(402 + self._ordinal, newValue)
end

return M