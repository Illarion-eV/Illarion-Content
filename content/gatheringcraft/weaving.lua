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

-- loom (169)

-- 2x wool (170) --> grey cloth (176)

-- additional tool: scissors (6)

local common = require("base.common")
local gathering = require("content.gathering")

module("content.gatheringcraft.weaving", package.seeall)

function StartGathering(User, SourceItem, ltstate)

    gathering.InitGathering();
    local weaving = gathering.weaving;

    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    -- additional tool item is needed
    if (User:countItemAt("all",6)==0) then
        common.HighInformNLS( User,
        "Du brauchst eine Schere zum weben.",
        "You need a pair of scissors for weaving." );
        return
    end
    local toolItem = User:getItemAt(5);
    if ( toolItem.id ~= 6 ) then
        toolItem = User:getItemAt(6);
        if ( toolItem.id ~= 6 ) then
            common.HighInformNLS( User,
            "Du musst die Schere in der Hand haben!",
            "You have to hold the scissors in your hand!" );
            return
        end
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ); -- turn if necessary

    -- any other checks?

    if (User:countItemAt("all", 170) < 2) then -- check for items to work on
        if (User:countItemAt("all", 170) == 0) then
            common.HighInformNLS( User,
            "Du brauchst Wolle um zu weben.",
            "You need wool for weaving." );
        else
            common.HighInformNLS( User,
            "Du hast nicht genug Wolle um zu weben.",
            "You don't have enough wool for weaving." );
        end
        return;
    end

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        weaving.SavedWorkTime[User.id] = weaving:GenWorkTime(User, toolItem);
        User:startAction( weaving.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talk(Character.say, "#me beginnt zu weben.", "#me starts to weave.")
        return
    end

    -- since we're here, we're working

    if weaving:FindRandomItem(User) then
        return
    end

    User:learn(weaving.LeadSkill, weaving.SavedWorkTime[User.id], weaving.LearnLimit);
    User:eraseItem(170, 2); -- erase the item we're working on

    local created = common.CreateItem(User, 176, 1, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        if (User:countItemAt("all", 170) > 1) then  -- there are still items we can work on
            weaving.SavedWorkTime[User.id] = weaving:GenWorkTime(User, toolItem);
            User:startAction( weaving.SavedWorkTime[User.id], 0, 0, 0, 0);
        else -- no items left
            common.HighInformNLS(User,
            "Du hast nicht mehr genug Wolle.",
            "You don't have enough wool anymore.");
        end
    end

    if common.ToolBreaks(User, toolItem, weaving:GenWorkTime(User, toolItem)) then -- damage and possibly break the tool
        common.HighInformNLS(User,
        "Deine alte Schere zerbricht.",
        "Your old scissors break.");
        return
    end
end
