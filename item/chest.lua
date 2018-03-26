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

-- UPDATE items SET itm_script='item.chest' WHERE itm_id IN (8,649,650,1360,1361,1362,1367,3788,3789);

local common = require("base.common")
local collectionchest = require("content.collectionchest")

local M = {}

local dragonCaveChestPos = {
    position(819, 676, -3),
    position(819, 674, -3),
    position(827, 655, -3),
    position(812, 650, -3),
    position(795, 617, -3),
    position(787, 631, -3),
    position(787, 632, -3),
    position(783, 640, -3),
    position(785, 657, -3),
    position(794, 668, -3),
    position(783, 630, -3),
    position(782, 630, -3),
    position(664, 617, -3),
    position(662, 617, -3),
    position(705, 613, -6),
    position(703, 616, -6),
    position(704, 617, -6),
}

local function checkIfGotAllItems(User)
    if (User:getQuestProgress(545) == 1 and User:getQuestProgress(546) == 1 and User:getQuestProgress(547) == 1 and User:getQuestProgress(548) == 1 and User:getQuestProgress(549) == 1 and User:getQuestProgress(550) == 1) then
        User:setQuestProgress(543, 2)
        User:inform(
            "Du hast mehrere Gegenstände gefunden, die Brigette gehören könnten. Du solltest zu ihr zurückkehren und mit ihr sprechen.",
            "You have found several items that could be Brigette's. You should check back in with her.")
    end
end

local function ChestContents(User, chestItem)

    -- skip if already tripped in the last 30 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = chestItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 1800) > serverTime)) then
        User:inform("Du findest nichts in diesem Truhe.",
                    "You find nothing inside this chest.")
        return
    end
    -- safe tripping time
    chestItem:setData("tripping_time", serverTime)
    world:changeItem(chestItem)

    local random_number = math.random(1,100)
    if random_number >= 0 and random_number <= 35 then
        User:inform("Du suchst bis zum Boden, findest aber nicht als Rattenkot.", "You search to the bottom but find nothing but rat droppings.")
    elseif random_number >= 36 and random_number <= 70 then
        User:inform("Beim Suchen findest du einen Stapel Geldbörsen - aber alle sind leer.", "As you search, you find a stash of money bags, that are all empty.")
    elseif random_number >= 71 and random_number <= 90 then
        User:inform("Du findest eine Silbermünze.","You discover a silver coin.")
        common.CreateItem(User, 3077, 1, 333, nil) -- silver coin
    elseif random_number >= 91 and random_number <=100 then
        local monPos = common.getFreePos(chestItem.pos, 2) -- radius 2 around vase
        world:createMonster(211, monPos, -20)
        world:gfx(41, monPos) -- swirly
        User:inform("Während du suchst, schleicht irgendwas aus den Schatten um dich herum.",
            "As you are searching, something sneaks in from the shadows around you.")
    end
end

local function ronaganContents(User, ronaganItem)

    -- skip if already tripped in the last 30 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = ronaganItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 1800) > serverTime)) then
        User:inform("Du findest nichts in diesem Truhe.",
                    "You find nothing inside this chest.")
        return
    end
    -- safe tripping time
    ronaganItem:setData("tripping_time", serverTime)
    world:changeItem(ronaganItem)

    local random_number = math.random(1,100)
    if random_number >= 0 and random_number <= 30 then
        User:inform("Die Truhe ist voll mit verschiedenstem Diebesgut, aber es ist nichts dabei, was du möchtest.", "The chest is full of various stolen items, but nothing you want.")
    elseif random_number >= 31 and random_number <= 60 then
        User:inform("Du stößt im Inneren auf eine Falle, kannst ihr aber gerade noch ausweichen.", "You find a trap inside, but are able to narrowly avoid it.")
    elseif random_number >= 61 and random_number <= 85 then
        User:inform("Du findest fünf Silbermünzen.","You discover five silver coins.")
        common.CreateItem(User, 3077, 5, 333, nil) -- silver coin
    elseif random_number >= 86 and random_number <=100 then
        local monPos = common.getFreePos(ronaganItem.pos, 2) -- radius 2 around chest
        world:createMonster(5, monPos, -20)
        world:gfx(41, monPos) -- swirly
        User:inform("Du wurdest bei deinen Diebstahlversuchen ertappt.",
            "Your attempts at theft have been discovered.")
    end
end

local function letmaContents(User, letmaItem)

    -- skip if already tripped in the last 30 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = letmaItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 1800) > serverTime)) then
        User:inform("Du findest nichts in diesem Truhe.",
                    "You find nothing inside this chest.")
        return
    end
    -- safe tripping time
    letmaItem:setData("tripping_time", serverTime)
    world:changeItem(letmaItem)

    local random_number = math.random(1,100)
    if random_number >= 0 and random_number <= 70 then
        User:inform("Der Deckel der Kiste springt laut auf bevor das Schanier zurückschlägt und der Deckel deine Hand fast einklemmt.", "The chest lid creaks open loudly before the hinges snap the lid shut again nearly closing your hand inside!")
    elseif random_number >= 71 and random_number <=90 then
        local monPos = common.getFreePos(letmaItem.pos, 2) -- radius 2 around chest
        world:createMonster(141, monPos, -20)
        world:gfx(41, monPos) -- swirly
        User:inform("Manchmal ist es besser Dinge in Ruhe zu lassen. Während du nach der Kiste suchst, kommt ihr Besitzer von hinten auf dich zu.",
            "Sometimes it is better to leave things alone. As you are searching the chest its owner comes up behind you.")
    elseif random_number >= 91 and random_number <= 100 then
        User:inform("Unter einem Haufen von nutzlosen Dingen findest du 5 Silberstücke in der Kiste.","Under a pile of rubbish in the chest you find five silver coins.")
        common.CreateItem(User, 3077, 5, 333, nil) -- silver coin
    end
end

local function ronaganTreasureContents(User, ronaganTreasureItem)

    -- skip if already tripped in the last 1 hours
    local serverTime = world:getTime("unix")
    local trippingTime = ronaganTreasureItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 3600) > serverTime)) then
        User:inform("Du findest nichts in diesem Truhe.",
                    "You find nothing inside this chest.")
        return
    end
    -- safe tripping time
    ronaganTreasureItem:setData("tripping_time", serverTime)
    world:changeItem(ronaganTreasureItem)

    local random_number = math.random(1,100)
    if random_number >= 0 and random_number <= 45 then
        User:inform("Die Truhe ist voll mit verschiedenstem Diebesgut, aber es ist nichts dabei, was du möchtest.", "The chest is full of various stolen items, but nothing you want.")
    elseif random_number >= 46 and random_number <= 50 then
        User:inform("Du findest eine Topaskette.","You discover a topaz amulet.")
        common.CreateItem(User, 83, 1, 899, nil) -- topaz amulet
    elseif random_number >= 51 and random_number <= 100 then
        local monPos = common.getFreePos(ronaganTreasureItem.pos, 2) -- radius 2 around chest
        world:createMonster(43, monPos, -20)
        world:gfx(41, monPos) -- swirly
        User:inform("Du wurdest bei deinen Diebstahlversuchen ertappt.",
            "Your attempts at theft have been discovered.")
    end
end

function M.UseItem(User, SourceItem)

    if collectionchest.collectionChestUsed(User, SourceItem) then
        return
    end

    if (User:getQuestProgress(510) == 24) and  SourceItem.pos == position(783, 640, -3) then --OK, the player does the quest
    User:inform(
        "In der Truhe liegt eine goldenes Amulet, das mit einem großen Smaragd geschmückt ist. Auf dem Stein ist ein goldenes Zwergenwappen. Danach hatte Obsidimine gefragt.",
        "Inside the chest lays a golden amulet adorned with a large emerald. On the stone is a golden Dwarven coat of arms. This is what Obsidimine was inquiring about.")
    User:setQuestProgress(510, 25)
    return
    end

    if (User:getQuestProgress(543) == 1 and User:getQuestProgress(545) <= 0 and SourceItem.pos == position(901, 586, -3)) then --OK, the player does the quest 1 for Brigette Russ
    User:inform(
        "Im Inneren der Truhe liegt ein Kupferkelch, den du herausnimmst. Dies könnte eines von Brigettes verlorenen Besitztümern sein.",
        "Inside the chest lays a copper goblet that you take. This could be one of Brigette's lost belongings.")
    User:setQuestProgress(545, 1)
    common.CreateItem(User, 1840, 1, 851, nil)
    checkIfGotAllItems(User)
    end
    if (User:getQuestProgress(543) == 1 and User:getQuestProgress(546) <= 0 and SourceItem.pos == position(902, 586, -3)) then --OK, the player does the quest 1 for Brigette Russ
    User:inform(
        "Im Inneren der Truhe liegt ein goldener Ring, den du herausnimmst. Dies könnte eines von Brigettes verlorenen Besitztümern sein.",
        "Inside the chest lays a golden ring that you take. This could be one of Brigette's lost belongings.")
    User:setQuestProgress(546, 1)
    common.CreateItem(User, 235, 1, 860, nil)
    checkIfGotAllItems(User)
    end
    if (User:getQuestProgress(543) == 1 and User:getQuestProgress(547) <= 0 and SourceItem.pos == position(897, 593, -3)) then --OK, the player does the quest 1 for Brigette Russ
    User:inform(
        "Im Inneren der Truhe liegt ein goldener Rubinring, den du herausnimmst. Dies könnte eines von Brigettes verlorenen Besitztümern sein.",
        "Inside the chest lays a ruby gold ring that you take. This could be one of Brigette's lost belongings.")
    User:setQuestProgress(547, 1)
    common.CreateItem(User, 68, 1, 740, nil)
    checkIfGotAllItems(User)
    end
    if (User:getQuestProgress(543) == 1 and User:getQuestProgress(548) <= 0 and SourceItem.pos == position(897, 594, -3)) then --OK, the player does the quest 1 for Brigette Russ
    User:inform(
        "Im Inneren der Truhe liegt ein Teller, den du herausnimmst. Dies könnte eines von Brigettes verlorenen Besitztümern sein.",
        "Inside the chest lays a plate that you take. This could be one of Brigette's lost belongings.")
    User:setQuestProgress(548, 1)
    common.CreateItem(User, 1001, 1, 650, nil)
    checkIfGotAllItems(User)
    end
    if (User:getQuestProgress(543) == 1 and User:getQuestProgress(549) <= 0 and SourceItem.pos == position(902, 588, -3)) then --OK, the player does the quest 1 for Brigette Russ
    User:inform(
        "Im Inneren der Truhe liegt eine Flöte, die du herausnimmst. Dies könnte eines von Brigettes verlorenen Besitztümern sein.",
        "Inside the chest lays a flute that you take. This could be one of Brigette's lost belongings.")
    User:setQuestProgress(549, 1)
    common.CreateItem(User, 90, 1, 950, nil)
    checkIfGotAllItems(User)
    end
    if (User:getQuestProgress(543) == 1 and User:getQuestProgress(550) <= 0 and SourceItem.pos == position(902, 589, -3)) then --OK, the player does the quest 1 for Brigette Russ
    User:inform(
        "Im Inneren der Truhe liegt ein grauer Hut mit einer Feder, den du herausnimmst. Dies könnte eines von Brigettes verlorenen Besitztümern sein.",
        "Inside the chest lays a grey hat with a feather that you take. This could be one of Brigette's lost belongings.")
    User:setQuestProgress(550, 1)
    common.CreateItem(User, 830, 1, 801, nil)
    checkIfGotAllItems(User)
    end
    local itemData
    local isronaganChest = (SourceItem:getData("ronaganChest") == "true")
    if (isronaganChest) then
        ronaganContents(User, SourceItem)
        return
    end

    local isletmaChest = (SourceItem:getData("letmaChest") == "true")
    if (isletmaChest) then
        letmaContents(User, SourceItem)
        return
    end

    for i = 1, #dragonCaveChestPos do
        if (SourceItem.pos == dragonCaveChestPos[i]) then
            ChestContents(User, SourceItem)
            return
        end
    end

    local isronaganTreasurechest = (SourceItem:getData("ronaganTreasurechest") == "true")
    if (isronaganTreasurechest) then
        ronaganTreasureContents(User, SourceItem)
        return
    end
end

return M
