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

-- UPDATE items SET itm_script='item.vase' WHERE itm_id IN (75,292,315);

local common = require("base.common")

local M = {}

local lakeOfLifeVasePos = {
    position(660, 239, -9),
    position(744, 204, -9),
    position(777, 187, -9),
    position(705, 263, -9),
    position(725, 287, -9),
    position(763, 263, -9),
    position(777, 284, -9),
    position(759, 304, -9)
}
local dragonCaveVasePos = {
    position(658, 610, -3),
	position(661, 639, -3),
	position(663, 610, -3),
	position(665, 634, -3),
	position(670, 634, -3),
	position(675, 640, -3),
	position(676, 627, -3),
	position(678, 610, -3),
	position(678, 617, -3),
	position(676, 633, -3),
	position(676, 635, -3),
	position(678, 644, -3),
	position(681, 620, -3),
	position(683, 620, -3),
	position(684, 620, -3),
	position(685, 628, -3),
	position(685, 637, -3),
	position(687, 610, -3),
	position(691, 612, -3),
	position(685, 639, -3),
	position(692, 643, -3),
	position(697, 637, -3),
	position(701, 623, -3),
	position(659, 610, -3),
	position(660, 620, -3),
	position(669, 616, -3),
	position(669, 623, -3),
	position(674, 610, -3),
	position(675, 616, -3),
	position(677, 642, -3),
	position(685, 641, -3),
	position(691, 620, -3),
	position(694, 637, -3),
	position(701, 627, -3),
	position(691, 611, -3),
	position(698, 622, -6),
	position(702, 615, -6),
	position(707, 615, -6),
	}

local dragongem = {} --a list with positions
dragongem[1] = position(658, 610, -3) --1: Dragon emerald
dragongem[2] = position(665, 634, -3) --2: Dragon ruby
dragongem[3] = position(685, 639, -3) --3: Dragon amethyst
dragongem[4] = position(687, 610, -3) --4: Dragon sapphire
dragongem[5] = position(660, 620, -3) --5: Dragon topaz
dragongem[6] = position(685, 641, -3) --6: Dragon diamond
dragongem[7] = position(694, 637, -3) --7: Dragon obsidian

local messageG = {}
messageG[1] = "[Queststatus] Du findest einen großen Smaragd in dem in Drachenkopf eingeschliffen ist. Wahrscheinlich hat Obsidimine hiervon gesprochen."
messageG[2] = "[Queststatus] Du findest einen großen Rubin in dem in Drachenkopf eingeschliffen ist. Wahrscheinlich hat Obsidimine hiervon gesprochen."
messageG[3] = "[Queststatus] Du findest einen großen Amethyst in dem in Drachenkopf eingeschliffen ist. Wahrscheinlich hat Obsidimine hiervon gesprochen."
messageG[4] = "[Queststatus] Du findest einen großen Saphir in dem in Drachenkopf eingeschliffen ist. Wahrscheinlich hat Obsidimine hiervon gesprochen."
messageG[5] = "[Queststatus] Du findest einen großen Topas in dem in Drachenkopf eingeschliffen ist. Wahrscheinlich hat Obsidimine hiervon gesprochen."
messageG[6] = "[Queststatus] Du findest einen großen Diamant in dem in Drachenkopf eingeschliffen ist. Wahrscheinlich hat Obsidimine hiervon gesprochen."
messageG[7] = "[Queststatus] Du findest einen großen Obsidian in dem in Drachenkopf eingeschliffen ist. Wahrscheinlich hat Obsidimine hiervon gesprochen."

local messageE = {}
messageE[1] = "[Quest status] You have discovered a large emerald engraved with a dragon head.  This must be what Obsidimine was speaking about."
messageE[2] = "[Quest status] You have discovered a large ruby engraved with a dragon head.  This must be what Obsidimine was speaking about."
messageE[3] = "[Quest status] You have discovered a large amethyst engraved with a dragon head.  This must be what Obsidimine was speaking about."
messageE[4] = "[Quest status] You have discovered a large sapphire engraved with a dragon head.  This must be what Obsidimine was speaking about."
messageE[5] = "[Quest status] You have discovered a large topaz engraved with a dragon head.  This must be what Obsidimine was speaking about."
messageE[6] = "[Quest status] You have discovered a large diamond engraved with a dragon head.  This must be what Obsidimine was speaking about."
messageE[7] = "[Quest status] You have discovered a large obsidian engraved with a dragon head.  This must be what Obsidimine was speaking about."

function M.UseItem(User, SourceItem)

    for i = 1, #lakeOfLifeVasePos do
        if (SourceItem.pos == lakeOfLifeVasePos[i]) and User:getQuestProgress(508) == 1 then
            world:gfx(53, User.pos) -- nice GFX
            world:makeSound(13, User.pos) -- nice SFX
            common.InformNLS(User, "Das Pulver legt sich auf deine feuchte Haut und du beginnst zu glitzern.", "The powder settles on your damp body and you begin to sparkle.")
            User:setQuestProgress(508, 0)
            User:setQuestProgress(509, 0)
        elseif (SourceItem.pos == lakeOfLifeVasePos[i]) and User:getQuestProgress(508) == 0 then
            common.InformNLS(User, "Du musst dich für diese Arbeit erst reinigen.", "You must cleanse first for this to work.")
        end
    end
	
	if (User:getQuestProgress(510) == 13) then --OK, the player does the quest
        local queststatus = User:getQuestProgress(512) --here, we save which gems have been found
        local queststatuslist = {}
        queststatuslist = common.Split_number(queststatus, 7) --reading the digits of the queststatus as table

        for i = 1, 7 do
            if (SourceItem.pos == dragongem[i])  and queststatuslist[i] == 0 then
                queststatuslist[i] = 1 --found it!
                common.InformNLS(User, messageG[i], messageE[i])
                User:setQuestProgress(512, queststatuslist[1] * 1000000 + queststatuslist[2] * 100000 + queststatuslist[3] * 10000 + queststatuslist[4] * 1000 + queststatuslist[5] * 100 + queststatuslist[6] * 10 + queststatuslist[7] * 1) --saving the new queststatus
                queststatus = User:getQuestProgress(512) --and reading it again
                if queststatus == 1111111 then --found all dragongem
                    User:setQuestProgress(510, 14) --Quest solved!
                    common.InformNLS(User, "[Queststatus] Du hast alle Drachensteine gefunden. Bring sie zurück zu Obsidimine.", "[Quest status] You have found all the dragon gems.  Take them back to Obsidimine.")
                    return --more than solving isn't possible, bailing out
                end
            end
        end
    end
	
	for i = 1, #dragonCaveVasePos do
            if (SourceItem.pos == dragonCaveVasePos[i]) then
                VaseContents(User, SourceItem)
                return
            end
        end	
end

function VaseContents(User, vaseItem)

    -- skip if already tripped in the last 5 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = vaseItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
        User:inform("Du findest nichts in diesem vase.",
                    "You find nothing inside this vase.")
        return
    end
    -- safe tripping time
    vaseItem:setData("tripping_time", serverTime)
    world:changeItem(vaseItem)
        
	local random_number = math.random(1,100)
	if random_number >= 0 and random_number <= 35 then
	    User:inform("Eine kleine Spinne krabbelt aus der Vase auf deine Hand und sucht dann das Weite.", "A small spider scampers out of the vase and towards your hand, before running the other way.")
	elseif random_number >= 36 and random_number <= 70 then
	    User:inform("Staub wirbelt auf.", "A cloud of dust escapes into the air.")
	elseif random_number >= 71 and random_number <= 90 then
        User:inform("Du findest einen ungeschliffenen Diamanten.","You discover a raw diamond.")
		local notCreated = User:createItem(254, 1, 333, nil) -- raw diamond
        if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
            world:createItemFromId(254, notCreated, User.pos, true, 333, nil)
            common.HighInformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.")
			end
	elseif random_number >= 91 and random_number <=100 then
		local monPos = common.getFreePos(vaseItem.pos, 2) -- radius 2 around vase
            world:createMonster(222, monPos, -20)
            world:gfx(41, monPos) -- swirly
            User:inform("Schlechte Wahl, Abenteuerer! Etwas springt aus dem vase heraus und greift dich an.",
                "Wrong choice traveler! Something hops out of the vase and attacks you.")
	   end
    end

return M
