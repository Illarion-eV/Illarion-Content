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

local common = require('base.common')
local globalvar = require("base.globalvar")
local class = require('base.class')
local gods_cooldowns_common = require("content._gods.gods_cooldowns_common")

local M = {}

M.BaseGod = class(
    function(self, ...)
        self:_init(...)
    end
)

function M.BaseGod:_init(ordinal)
    self.ordinal = ordinal
    self.nameDe = nil -- str, should be set in child class
    self.nameEn = nil -- str, should be set in child class
    self.descriptionDe = nil -- str, should be set in child class
    self.descriptionEn = nil -- str, should be set in child class
    self.devotionItems = nil -- array of item ids, should be set in child class
end

function M.BaseGod:getFavour(User)
    return User:getQuestProgress(402 + self.ordinal)
end

function M.BaseGod:setFavour(User, newValue)
    debug(self.nameEn .. " favour changes from " .. self:getFavour(User) .. " to " .. newValue .. " for user " .. User.name .. "(" .. User.id .. ")")
    User:setQuestProgress(402 + self.ordinal, newValue)
end

function M.BaseGod:getSacrificeCumulativeValue(User)
    return User:getQuestProgress(418 + self.ordinal)
end

function M.BaseGod:setSacrificeCumulativeValue(User, newValue)
    debug(self.nameEn .. " sacrifice cumulative value changes from " .. self:getSacrificeCumulativeValue(User) .. " to " .. newValue .. " for user " .. User.name .. "(" .. User.id .. ")")
    User:setQuestProgress(418 + self.ordinal, newValue)
end

function M.BaseGod:_getRawSacrificeValue(item)
    -- FIXME use a list of desired items per god
    local itemStats = world:getItemStats(item)
    return item.number * itemStats.Worth
end

function M.BaseGod:informBecomeDevoted(User)
    common.InformNLS(User, "Ihr empfangt den Segen " .. self.nameDe .. "s und weiht euer Leben dem Glaube an die Gottheit.", "You receive the blessing of " .. self.nameEn .. " and devote your life to the faith in the divinity.")
    world:gfx(globalvar.gfxRAIN, User.pos)
    world:makeSound(globalvar.sfxSNARING, User.pos)
end

function M.BaseGod:informBecomePriest(User)
    common.InformNLS(User, "FIXME " .. self.nameDe .. "", "FIXME You are now a priest of " .. self.nameEn .. ", have fun.")
    world:gfx(globalvar.gfxRAIN, User.pos)
    world:makeSound(globalvar.sfxSNARING, User.pos)
end

function M.BaseGod:informStopBeingPriest(User)
    common.InformNLS(User, "FIXME " .. self.nameDe .. " FIXME .", "FIXME " .. self.nameEn .. " hates you and denies your priesthood!")
    world:gfx(globalvar.gfxBLITZ, User.pos)
    world:makeSound(globalvar.sfxTHUNDER, User.pos)
end

---
-- Sacrifice an item to this god
-- Favour update is not performed, to simpolify implementation of god jealousy. Instead, the need favour change is returned.
-- @param User
-- @param item  - scriptItem that is donated
-- @return favour bonus
function M.BaseGod:sacrifice(User, item)
    local rawVal = self:_getRawSacrificeValue(item)
    if not rawVal then
        -- item not allowed for danation
        --TODO inform
        return 0
    end
    local oldCumulativeValue = self:getSacrificeCumulativeValue(User) + gods_cooldowns_common.SACRIFICE_VALUE_OFFSET_copper
    local newCumulativeValue = oldCumulativeValue + rawVal
    local favourBonus = math.floor(gods_cooldowns_common.SACRIFICE_FAVOUR_COEFFICIENT * math.log(newCumulativeValue/oldCumulativeValue))
    if favourBonus <= 0 then
        --TODO inform?
        return 0
    end
    common.InformNLS(User, "FIXME " .. self.nameDe .. " FIXME .", "FIXME " .. self.nameEn .. " accepts your sacrifice")
    world:gfx(globalvar.gfxSUN --[[FIXME maybe gfxFLAMESTRIKE ]], item.pos)

    self:setSacrificeCumulativeValue(User, newCumulativeValue - gods_cooldowns_common.SACRIFICE_VALUE_OFFSET_copper)
    return favourBonus
end

return M