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
local globalvar = require("base.globalvar")
local magic = require("base.magic")
local triggerfield = require("triggerfield.base.triggerfield")
local glyphTutorial = require("magic.arcane.enchanting.core.tutorial")

local M = {}

local ongoingRitual = {}

function M.findSuitableLocation(user)

    local position = common.GetFrontPosition(user)

    local permittedTiles = {common.GroundType.forest, common.GroundType.sand, common.GroundType.grass}

    local freeViewAxis = {{2,-2,0},{1,-1,0},{0,0,0},{-1,1,0},{-2,2,0}}

    -- Exclude triggerfields
    if triggerfield.isTriggerfield(position) then
        common.InformNLS(user,"Die Magie dieses Ortes verindert das Aufstellen des Glyphenritualschreins.",
                              "The magic of this location prevents you from building a glyph ritual shrine.")
        return false
    end

    local theField = world:getField(position)
    if not common.isInList(common.GetGroundType(theField:tile()), permittedTiles) then
        common.InformNLS(user,"Dieser Boden eignet sich nicht für das Aufstellen des Glyphenritualschreins. Vielleicht solltest du es besser in einem Wald, auf einer Wiese oder in der Wüste versuchen.",
                              "This ground is not good for building a glyph ritual place. Perhaps you should try somewhere else like a forest, a grassy plain or the desert.")
        return false
    end

    -- Field must be empty and  there must be no blocking items in view axis
    if theField:countItems() > 0 or (common.getNumberOfPassableFieldsInArea(user.pos, 1) < 9 or common.getNumberOfPassableFieldsFromList(position, freeViewAxis) < #freeViewAxis) then
        common.InformNLS(user,"Hier ist nicht genügend Platz für einen Glyphenritualschrein.",
                              "There is not enough space for a glyph ritual shrine here.")
        return false
    end


    -- must be layer 0
    if user.pos.z > 0 then
        common.InformNLS(user,"Hier oben scheinen die Manaflüsse gestört zu sein. Du solltest versuchen einen Schrein an einer tiefergelegenen Stelle zu errichten.",
                              "The mana flows irregularly up here. You should try erecting a shrine further down in elevation instead.")
        return false
    elseif user.pos.z < 0 then
        common.InformNLS(user,"Hier unten scheinen die Manaflüsse gestört zu sein. Du solltest versuchen einen Schrein an einer höhergelegenen Stelle zu errichten.",
                              "The mana flows irregularly down here. You should try erecting a shrine on the surface of Illarion instead.")
        return false
    end

    return true, position
end

local function pickAndPlayRandomGfx(location)

    local gfxList = {globalvar.gfxRAIN, globalvar.gfxSCOTTY, globalvar.gfxSPRINKLE, globalvar.gfxSPRINKLE, globalvar.gfxSPRINKLE}

    local selectedGfx = gfxList[math.random(1,#gfxList)]

    world:gfx(selectedGfx, location)

end

function M.candleRitualExists(forgeItem)

    local timeLimit = common.GetCurrentTimestamp() - 3600 -- Glyph crafting sessions are limited to one hour without having to re-do the ritual

    local lastPrepared = tonumber(forgeItem:getData("lastPrepared"))

    if lastPrepared ~= nil and lastPrepared > timeLimit then
        return true
    end

    return false
end

local function checkForCandlesAndSticks(user, location)
    local hasCandlesAndSticks = common.userHasItems(user, { {Item.candles, 2} , {Item.smallCandlestick, 2} })

    if not hasCandlesAndSticks then

        common.InformNLS(user,
            "Um das Ritual erfolgreich abzuschließen, benötigst du zwei Kerzen und zwei Kerzenhalter.",
            "To prepare the ritual successfully you need two candles and two small candlesticks.")

        world:gfx(globalvar.gfxFIZZLE, location)

        return false
    end

    return true
end

local function startNewCycle(user)

    local location = ongoingRitual[user.id].location

    local consumption = 100

    if user:increaseAttrib("mana", 0) < consumption then
        common.InformNLS(user,"Dein Mana reicht nicht aus, um das Ritual abzuschließen.","You don't have sufficient mana to finish the ritual.")
        world:gfx(globalvar.gfxFIZZLE, location)
        ongoingRitual[user.id] = nil
        return
    end

    if (user:increaseAttrib("foodlevel", 0) < consumption) then
        common.InformNLS(user,
        "Du bist zu erschöpft, um das Ritual abzuschließen. Du solltest etwas essen.",
        "You are too exhausted to finish the ritual. You should eat something.")
        world:gfx(globalvar.gfxFIZZLE, location)
        ongoingRitual[user.id] = nil
        return
    end

    common.GetHungry(user, consumption)
    user:increaseAttrib("mana", -consumption)
    magic.wandDegrade(user)

    ongoingRitual[user.id].cyclesRemaining = ongoingRitual[user.id].cyclesRemaining - 1

    pickAndPlayRandomGfx(location)

    user:performAnimation(globalvar.charAnimationSPELL)
    world:makeSound(globalvar.sfxSNARING, user.pos)

    user:startAction(60, globalvar.gfxCLAW, 10, 0, 0)

end

function M.start(user, actionstate, location, candleOrShrine)

    if candleOrShrine == "candle" and not checkForCandlesAndSticks(user, location) then
        return
    end

    if not magic.hasSufficientMana(user, 1000) then
        common.InformNLS(user,"Dein Mana wird voraussichtlich nicht ausreichen, um das Ritual abzuschließen. Du wartest lieber noch etwas.",
                              "It's unlikely that you have enough mana to finish the ritual successfully. Best wait a moment first.")
        return
    end

    if not common.FitForWork(user) then
        return
    end

    common.TurnTo(user, location)

    ongoingRitual[user.id] = {}

    ongoingRitual[user.id].cyclesRemaining = 5

    ongoingRitual[user.id].location = location

    ongoingRitual[user.id].type = candleOrShrine

    user:performAnimation(globalvar.charAnimationSPELL)
    world:makeSound(globalvar.sfxSNARING, user.pos)

    if candleOrShrine == "shrine" then
        common.InformNLS(user,"Du beginnst ein Ritual, um einen Glyphenritualschrein zu errichten.",
                              "You begin the ritual to build a glyph ritual shrine.")
    elseif candleOrShrine == "candle" then
        common.InformNLS(user,"Du beginnst ein Ritual, um Glyphen am Schrein zu verbinden oder aufzubrechen.",
                              "You begin the ritual necessary to combine and break apart glyphs at the shrine.")
    end

    user:startAction(60, globalvar.gfxCLAW, 20, 0, 0)

end

local function finishCandles(user, actionstate, forge)

    if not forge then -- The forge decayed after starting the ritual
        user:inform("Du konntest das Ritual nicht beenden, weil der Schrein auseinandergefallen ist.", "You could not finish the ritual as the forge has decayed!")
        return
    end

    if not checkForCandlesAndSticks(user, forge.pos) then
        return
    end

    for i=1,2 do
        local candlePos = common.getFreePos(forge.pos, 1)
        local candleItem = world:createItemFromId(400, 1, candlePos, false, 333, {belongsTo="ritual"})
        candleItem.wear = 12 -- one hour
        world:changeItem(candleItem)
        world:gfx(globalvar.gfxSUN,candlePos)
    end

    user:eraseItem(Item.candles, 2)
    user:eraseItem(Item.smallCandlestick, 2)

    forge:setData("lastPrepared", common.GetCurrentTimestamp())

    world:changeItem(forge)

    common.InformNLS(user,
        "Der Glyphenritualschrein ist vorbereitet. Nun können hier Glyphen zusammengefügt und auseinandergebrochen werden.",
        "The glyph ritual place is prepared. Now it is possible to combine and shatter glyphs here.")

    glyphTutorial.update(user, 3)

end

local function finishForge(user)

    local location = common.GetFrontPosition(user)

    world:gfx(globalvar.gfxSUN, location)

    local forge = world:createItemFromId(3498, 1, location, false, 333, {craftedBy=user.name})

    forge.wear = 60

    world:changeItem(forge)

end


function M.continue(user, actionstate, forge, candleOrShrine)

    if actionstate == Action.success then

        if not ongoingRitual[user.id] then
            return
        end

        if ongoingRitual[user.id].cyclesRemaining == 0 then

            if candleOrShrine == "shrine" then
                finishForge(user)
            else
                finishCandles(user, ongoingRitual[user.id].location, forge)
            end
        else
            startNewCycle(user)
        end

    elseif actionstate == Action.abort then

        common.InformNLS(user,"Du brichst das Ritual ab.","You interrupt the ritual.")

        world:gfx(globalvar.gfxFIZZLE,user.pos)
    end

end

return M
