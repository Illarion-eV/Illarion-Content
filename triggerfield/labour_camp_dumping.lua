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
-- INSERT INTO triggerfields VALUES (-492,-489,-40,'triggerfield.labour_camp_dumping');
-- INSERT INTO triggerfields VALUES (-492,-488,-40,'triggerfield.labour_camp_dumping');
-- INSERT INTO triggerfields VALUES (-491,-488,-40,'triggerfield.labour_camp_dumping');
-- INSERT INTO triggerfields VALUES (-491,-489,-40,'triggerfield.labour_camp_dumping');

local common = require("base.common")
local townTreasure = require("base.townTreasure")

local M = {}

function M.PutItemOnField(Item,User)
    -- coal, iron, copper, gold, silver; more resources can be added
    if Item.id == 21 or Item.id == 22 or Item.id == 2536 or Item.id == 234 or Item.id == 1062 then

        local FactionImpr = User:getQuestProgress(26) -- faction which imprisoned the char
        local town
        if FactionImpr == 1 then
            town = "Cadomyr"
        elseif FactionImpr == 2 then
            town = "Runewick"
        elseif FactionImpr == 3 then
            town = "Galmair"
        elseif FactionImpr == 0 then
            town = "None"
        end

        local workLoad = User:getQuestProgress(25)
        if town then -- security check: only if the char as been sent to forced labour by a faction

            local theItemStats = world:getItemStats(Item)
            local itemNumberPay = common.Limit(Item.number,0,workLoad) -- we do only count the items a char has to deliver
            local payToFaction = itemNumberPay * theItemStats.Worth * 0.1 -- 10% of teh value

            if town ~= "None" then
                townTreasure.ChangeTownTreasure(town, payToFaction) -- add to the town treasure
            end

            -- reduce work load of char
            if (workLoad - Item.number) <= 0 then
                if workLoad > 0 then -- the char was actually still forced to work, inform him that he's free
                    local myNpc = world:getNPCSInRangeOf(position(-495, -484, -40), 10)
                    for i = 1, #myNpc do
                        if myNpc[i].name == "Percy Dryless" then -- check if it is the camp leader
                            myNpc[i]:talk(Character.say, "So, du Wicht, du hast deine Strafe abgearbeitet. Hau ab!", "Now, you runt, you're done with your punishment. Get lost!")
                            break
                        end
                    end
                    common.InformNLS(User, "Freiheit!", "Freedom!")
                else
                    common.InformNLS(User,
                        "Du bemerkt, wie der Aufseher kopfsch�ttelnd zu dir blickt. Deine Strafe ist doch schon l�ngst abgearbeitet.",
                        "You notice that the guard looks at you, shaking his head. You are already done!")
                end
                User:setQuestProgress(25, 0)
                User:setQuestProgress(26, 0)
            else
                User:setQuestProgress(25, workLoad - Item.number)
                common.InformNLS(User,
                    "Du bemerkt, wie der Aufseher sich kurz etwas notiert. Scheinbar noch nicht deine letzte Ladung. Du musst noch "..(workLoad - Item.number).." Bodensch�tze abliefern.",
                    "You notice that the guard seems to take a short note. Obviously, not your last charge. You still have to deliver "..(workLoad - Item.number).." resources.")
            end
        end
        world:gfx(46, Item.pos)
        world:erase(Item, Item.number)
    end
end

function M.MoveToField(User)
    -- check for spam and put a new spam marker in case it is no spam
    if common.spamProtect(User, 5) then
        return
    end

    common.InformNLS(User,
        "Ein seltsames Kribbeln erf�llt dich. Auf dieser Plattform m�ssen die Rohstoffe scheinbar abgelegt werden.",
        "You feel a strange prickling. This platform is the place where you have to bring the resources to.")
end

return M
