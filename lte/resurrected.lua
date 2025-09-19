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
local activityTracker = require("lte.activity_tracker")

local M = {}

local attribs = {"strength","dexterity","constitution","agility","intelligence","perception","willpower","essence"}

M.deathsTracker = 853

local function getRPvsDeaths(user)

    local deaths = user:getQuestProgress(M.deathsTracker)

    local reputation = user:getQuestProgress(activityTracker.reputationTrackerQuestID)

    local reputationPerReduction = 144 -- 12 hours of RP per death

    local deathsReducedByReputation = math.floor(reputation/reputationPerReduction)

    return math.max(0, deaths - deathsReducedByReputation)

end

M.getRPvsDeaths = getRPvsDeaths

local baseEffectCallVal = 600 -- 1 min

local function applyDeathImpact(callValue, user)

    --[[
        This is applied every tick of the effect and helps determine how long until the next tick is called.
        Since the time it takes to recover is based on your highest attribute, it varies a bit from character to character.
        Basing it off having at least one maxed out attribute, and the range of the human race, we will assume 18 of one attrib as the average.
        Which means an average of 17 ticks to recover.
        That's 17 * whatever the value we get here on top of the base value of 17 * 30-90 seconds.
        Luckiest possible then becomes 8.5 minutes to recover for the base value, 25.5 minutes for the worst luck.
        So assuming the worst possible roll, at 60+ death counter, that's 25.5 min + 102 minutes (17 * 6) so a little
        over 2 hours to recover as opposed to half an hour in the worst case scenario, if you die too frequently without
        taking enough pauses to RP.

    ]]

    local deathImpact = getRPvsDeaths(user) * 60 --Each death count adds 6 seconds to the base timer

    local maxImpact = 60*60 --At 60+ death counter, the max possible value is 360 seconds aka 6 minutes per tick

    local retVal = math.min(maxImpact, callValue + deathImpact)

    return retVal
end

function M.addEffect( rebirthEffect, Reborn )
    if Reborn:isAdmin() then
      return false
    end

        common.InformNLS( Reborn,
        "[Wiederbelebung] Du fühlst dich noch sehr schwach.",
        "[Respawn] You feel very weak." );
    local maxChange = 0;

    for _,attrib in pairs(attribs) do
        local changeBy = Reborn:increaseAttrib( attrib, 0 ) - 1;
        rebirthEffect:addValue( attrib, changeBy );
        maxChange = math.max( maxChange, changeBy );
        Reborn:increaseAttrib( attrib, -changeBy );
    end;
    local foundRegen, regEffect = Reborn.effects:find(2);
    if foundRegen then
        regEffect:addValue( "maxHP", math.floor( 10000 / ( maxChange + 1 ) ) );
        rebirthEffect:addValue( "maxChange", maxChange );
    end;
    local multi = 1;
    local lastDeath = Reborn:getQuestProgress(20);
    local now = common.GetCurrentTimestamp();
    Reborn:setQuestProgress(20,now);
    if lastDeath>0 and (now-lastDeath)>3600 then
        multi = 2;
    end
    rebirthEffect:addValue("multiRes",multi); -- multiplier for multiple resurrection
    if Reborn:isNewPlayer() then
        multi = 0.5
    end

    local callValue = applyDeathImpact(baseEffectCallVal, Reborn) * multi

    rebirthEffect.nextCalled=math.random(callValue-(baseEffectCallVal/2),callValue+(baseEffectCallVal/2))
    return true

end;

function M.loadEffect( rebirthEffect, Reborn )

    if Reborn:isAdmin() then
      return
    end
    local inform = false

    local maxChange = 0;
    for _,attrib in pairs(attribs) do
        local foundChange, changeBy = rebirthEffect:findValue( attrib );
        if foundChange then
            changeBy = math.min( changeBy, Reborn:increaseAttrib( attrib, 0 ) - 1 );
        else
            changeBy = 0;
        end;
        if changeBy > 0 then
            inform = true
            rebirthEffect:addValue( attrib, changeBy );
            maxChange = math.max( maxChange, changeBy );
            Reborn:increaseAttrib( attrib, -changeBy );
        else
            rebirthEffect:removeValue( attrib );
        end;
    end;

    local foundRegen, regEffect = Reborn.effects:find(2);
    if foundRegen then
        local foundMaxChange, oldMaxChange = rebirthEffect:findValue( "maxChange" );
        if not foundMaxChange or oldMaxChange < maxChange then
            oldMaxChange = maxChange;
            rebirthEffect:addValue( "maxChange", maxChange );
        end;
        regEffect:addValue( "maxHP", math.floor( 10000 / ( oldMaxChange + 1 ) * ( oldMaxChange + 1 - maxChange ) ) );
    end;
    if inform then
        common.InformNLS( Reborn,
        "[Wiederbelebung] Du fühlst dich noch immer schwach.",
        "[Respawn] You feel still weak." );
    end
end;

function M.callEffect( rebirthEffect, Reborn )

    if Reborn:isAdmin() then
      return false;
    end

    local foundMulti, multi = rebirthEffect:findValue("multiRes");
    if not foundMulti then
        multi = 1;
        rebirthEffect:addValue("multiRes",1);
    end

    local callValue = applyDeathImpact(baseEffectCallVal, Reborn) * multi

    rebirthEffect.nextCalled=math.random(callValue-(baseEffectCallVal/2),callValue+(baseEffectCallVal/2))

    --Addition by Estralis: AFK chars do not regenerate!
    if Reborn:idleTime() > 300 then --absolutely no regeneration effect if the player is afk for more than five minutes
        return true;
    end;

    local maxChange = 0;
    local callAgain = false;
    for _,attrib in pairs(attribs) do
        local foundChange, changeBy = rebirthEffect:findValue( attrib );
        if foundChange then
            if changeBy > 0 then
                Reborn:increaseAttrib( attrib, 1 );
            end;
            changeBy = changeBy - 1;
            if changeBy > 0 then
                rebirthEffect:addValue( attrib, changeBy );
                callAgain = true;
                maxChange = math.max( maxChange, changeBy );
            else
                rebirthEffect:removeValue( attrib );
            end;
        end;
    end;

    local foundRegen, regEffect = Reborn.effects:find(2);
    if foundRegen then
        local foundMaxChange, oldMaxChange = rebirthEffect:findValue( "maxChange" );
        if not foundMaxChange or oldMaxChange < maxChange then
            oldMaxChange = maxChange;
            rebirthEffect:addValue( "maxChange", maxChange );
        end;
        regEffect:addValue( "maxHP", math.floor( 10000 / ( oldMaxChange + 1 ) * ( oldMaxChange + 1 - maxChange ) ) );
    end;
    return callAgain;
end;

function M.removeEffect( rebirthEffect, Reborn )

    if Reborn:isAdmin() then
        Reborn:inform("Admins do not suffer from resurrection.")
        return
    end

    common.InformNLS( Reborn,
        "[Wiederbelebung] Du hast dich vollständig erholt.",
        "[Respawn] You have fully recovered." )

    for _,attrib in pairs(attribs) do
        local foundChange, changeBy = rebirthEffect:findValue( attrib )
        if foundChange and changeBy > 0 then
            Reborn:increaseAttrib( attrib, changeBy )
        end
    end

    local foundRegen, regEffect = Reborn.effects:find(2)

    if foundRegen then
        regEffect:removeValue( "maxHP" )
    end
end

-- NOTE: function is saved locally in npc_yellowcross.lua; Workaround for Mantis issue #451
function M.doubleEffect( rebirthEffect, Reborn )

    if Reborn:isAdmin() then
      return false;
    end

    common.InformNLS( Reborn,
        "[Wiederbelebung] Du fühlst dich noch sehr schwach.",
        "[Respawn] You feel very weak." );
    local maxChange = 0;

    for _,attrib in pairs(attribs) do
        local foundChange, changeBy = rebirthEffect:findValue( attrib );
        if not foundChange then
            changeBy = 0;
        end
        changeBy = changeBy + Reborn:increaseAttrib( attrib, 0 ) - 1;
        rebirthEffect:addValue( attrib, changeBy );
        maxChange = math.max( maxChange, changeBy );
        Reborn:increaseAttrib( attrib, 1 - Reborn:increaseAttrib( attrib, 0 ) );
    end;
    local foundRegen, regEffect = Reborn.effects:find(2);
    if foundRegen then
        regEffect:addValue( "maxHP", math.floor( 10000 / ( maxChange + 1 ) ) );
        rebirthEffect:addValue( "maxChange", maxChange );
    end;
    local foundMulti, multi = rebirthEffect:findValue("multiRes");
    if not foundMulti then
        multi = 1;
    end
    multi = multi +1;
    rebirthEffect:addValue("multiRes",multi);
    Reborn:setQuestProgress(20,common.GetCurrentTimestamp());
    return true;
end

return M
