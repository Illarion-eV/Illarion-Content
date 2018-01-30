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

--Priest magic: Becoming a devotee, change devotion, become a priest by using an altar
--Altars are dedicated to gods, encoded in the data value
-- REFERENCE_IN_LUA - DATA - MEANING
--Elder Gods
-- gods.GOD_USHARA   -  1 - Ushara - Goddess of earth
-- gods.GOD_BRAGON   -  2 - Brágon - God of fire
-- gods.GOD_ELDAN    -  3 - Eldan - God of spirit
-- gods.GOD_TANORA   -  4 - Tanora/Zelphia - Goddess of water
-- gods.GOD_FINDARI  -  5 - Findari - Goddess of air
--Younger Gods
-- gods.GOD_NARGUN   -  6 - Nargùn - God of chaos
-- gods.GOD_ELARA    -  7 - Elara - Goddess of wisdom and knowledge
-- gods.GOD_ADRON    -  8 - Adron - God of festivities and wine
-- gods.GOD_OLDRA    -  9 - Oldra - Goddess of life and fertility
-- gods.GOD_CHERGA   - 10 - Cherga - Goddess of spirits and the underworld
-- gods.GOD_MALACHIN - 11 - Malachín - God of battle and hunting
-- gods.GOD_IRMOROM  - 12 - Irmorom - God of trade and craftsmanship
-- gods.GOD_SIRANI   - 13 - Sirani - Goddess of love and pleasure
-- gods.GOD_ZHAMBRA  - 14 - Zhambra - God of friendship and loyalty
-- gods.GOD_RONAGAN  - 15 - Ronagan - God of thieves and shadows
-- gods.GOD_MOSHRAN  - 16 - Moshran - God of blood and bones

--[[ Some altar locations
The five: 553,137,0
Cherga: 892,388,0
Adron: 734,312,0
Adron: 955,835,3
Moshran: 683,408,2
Moshran: 563,548,-6
Nargun: 255,293,-5
Nargun: 786,443,0
Ronagan: 414,275,-6
Irmorom: 312,232,1
Ushara: 657,681,0
Tanora: 630,594,0
Tanora: 763,336,-9
Tanora: 783,299,-9
Eldan: 959,790,0
Findari: 899,835,5
Elara: 909,829,2
Bragon: 903,773,5
Malachin: 137,678,1
Zhambra: 142,564,0
Sirani: 176,761,0
Sirani: 176,762,0
Oldra: 802,797,0
]]

-- TODO: the book of your god quest (move to npc?)
-- if (User:getQuestProgress(685) == 0) then --quest 'A book about your God' not started
--           User:setQuestProgress(685, 1) --quest 'A book about your God' started
--           common.InformNLS(User,
--           "[Quest 'Ein Buch deines Gottes' gestartet] Weißt du bereits alles über "..gods.GOD_DE[thisGod].."? Vielleicht fragst du mal in einer Bücherei nach einem Buch über deinen Gott?",
--           "[Quest 'A book about your God' started] Do you know everything about "..gods.GOD_EN[thisGod].." already? You could ask in a library for a book about your God.");
--         elseif (User:getQuestProgress(685) == 1) then --quest 'A book about your God' push player
--           common.InformNLS(User,
--           "[Quest 'Ein Buch deines Gottes'] Hast du dir bereits das Buch über "..gods.GOD_DE[thisGod].." beschafft? Frag in einer Bücherei nach.",
--           "[Quest 'A book about your God'] Have you got the book about "..gods.GOD_EN[thisGod].." already? Ask in a library for such a book.");
--

local common = require("base.common")
local gods = require("content.gods")
local lookat = require("base.lookat")

-- TODO move to a separate file
local SelectionDialogWrapper = function(User, title, description, buttons, onclose, closeOnMove)
    onclose = onclose or { func = function() end, args = {} }
    closeOnMove = closeOnMove or true
    -- User:inform("#buttons = " .. #buttons)
    buttons = buttons or {}
    local callback = function(dialog)
        if (not dialog:getSuccess()) then
            onclose.func(table.unpack(onclose.args))
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index >= 1 and index <= #buttons then
            if buttons[index].func ~= nil then
                buttons[index].func(table.unpack(buttons[index].args))
            end
        else
            User:inform("((Error! No valid function))")
        end
    end
    local sd = SelectionDialog(title, description, callback)
    for _, btn in ipairs(buttons) do
        sd:addOption(btn.icon, btn.text)
    end
    if closeOnMove then
        sd:setCloseOnMove()
    end
    User:requestSelectionDialog(sd)
end



local M = {}
--
----These are the items I need to become a devotee
--local devoteItems = {};
--devoteItems[1] = { 733, 316, 2588 }; --Ushara: Stone block, Quartz sand, Brick
--devoteItems[2] = { 314, 236, 43 }; --Brágon: potash, Gold ignot, Candle
--devoteItems[3] = { 256, 2745, 155 }; --Eldan: Raw diamonds, Parchment, Sibanac leaf
--devoteItems[4] = { 52, 253, 72 }; --Tanora: Bucket of water, Raw sapphire, Fishing rod
--devoteItems[5] = { 64, 463, 65 }; --Findari: Arrow, Quill, Short Bow
--devoteItems[6] = { 80, 356, 733 }; --Nargùn: Banana, Slouch hat, Stone block
--devoteItems[7] = { 2745, 43, 463 }; --Elara: Parchment, Candle, Quill
--devoteItems[8] = { 223, 2500, 388 }; --Adron: Iron Goblet, Bottle of Wine, Grapes
--devoteItems[9] = { 258, 534, 259 }; --Oldra: Flail, Onion seeds, Grain
--devoteItems[10] = { 24, 43, 182 }; --Cherga: Shovel, Candle, Black shirt
--devoteItems[11] = { 19, 65, 2586 }; --Malachín: Metal shield, Short bow, Fur
--devoteItems[12] = { 3077, 23, 2140 }; --Irmorom: Silver coin, Hammer, Tongs
--devoteItems[13] = { 235, 144, 174 }; --Sirani: Gold ring, Virgins weed, Red cloth
--devoteItems[14] = { 2760, 17, 78 }; --Zhambra: Rope, Wooden shield, Short sword
--devoteItems[15] = { 2760, 190, 48 }; --Ronagan: Rope, Ornate dagger, Leather gloves
--devoteItems[16] = { 16, 63, 2757 }; --Moshran: Orcish helmet, Entrails, Scimitar
--
----These are the items I need to become a priest. Not relevant for now since there is no priest magic.
--local priestItems = {};
--priestItems[1] = { 2416, 40, 26, 726, 735 }; --Ushara: Brown priest robe, Cleric's staff, Clay, Coarse sand, Raw stone
--priestItems[2] = { 2419, 40, 391, 46, 234 }; --Brágon: Red priest robe, Cleric's staff, Torch, Ruby, Gold nugget
--priestItems[3] = { 2418, 40, 41, 285, 463 }; --Eldan: Grey priest robe, Cleric's staff, Glass ingot, Diamond, Quill
--priestItems[4] = { 193, 40, 2496, 284, 279 }; --Tanora: Blue robe, Cleric's staff, Bottle of Water, Sapphire, Sapphire ring
--priestItems[5] = { 2421, 40, 2780, 322, 166 }; --Findari: White priest robe, Cleric's staff, Longbow, Wind arrow, Big empty bottle
--priestItems[6] = { 2418, 445, 355, 225, 290 }; --Nargùn: Grey priest robe, Wooden sword, Salmon, Crown, Cabbage
--priestItems[7] = { 368, 76, 397, 3110, 222 }; --Elara: Yellow priest robe, Mage's staff, Oil lamp, Pell, Amulet
--priestItems[8] = { 2419, 224, 335, 2744, 155 }; --Adron: Red priest robe, Golden goblet, Lute, Pipe, Sibanac leaf
--priestItems[9] = { 2416, 271, 126, 56, 249 }; --Oldra: Brown priest robe, Scythe, Sickle, Bough, Bundle of grain
--priestItems[10] = { 2420, 271, 138, 314, 726 }; --Cherga: Black priest robe, Scythe, Night angels blossom, potash, Coarse sand
--priestItems[11] = { 2421, 20, 391, 2291, 78 }; --Malachín: White priest robe, Large metal shield, Torch, Salkamaerian Paladin's helmet, Shortsword
--priestItems[12] = { 2418, 226, 74, 2763, 2752 }; --Irmorom: Grey priest robe, War Hammer, Hatchet, Pickaxe, Carving tools
--priestItems[13] = { 2421, 40, 280, 354, 222 }; --Sirani: White priest robe, Cleric's staff, Diamond ring, Strawberry cake, Amulet
--priestItems[14] = { 368, 20, 2701, 40, 333 }; --Zhambra: Yellow priest robe, Large metal shield, Longsword, Cleric's staff, Horn
--priestItems[15] = { 2420, 2689, 384, 365, 285 }; --Ronagan: Black priest robe, Poisoned ornate dagger, Thieves gloves, Half leather armour, Diamond
--priestItems[16] = { 2420, 552, 39, 69, 2746 }; --Moshran: Black priest robe, Deer meat, Skull staff, Raw leather, razor blade
--

local function tellItems(User, list)
    local lang = User:getPlayerLanguage()
    local text = "";
    text = text .. world:getItemName(list[1].id, lang);
    for i = 2, #list do
        text = text .. ", ";
        text = text .. world:getItemName(list[i].id, lang);
    end
    return text;
end

local function checkItems(User, list)
    for i = 1, #list do
        if User:countItem(list[i].id) < list[i].number then
            return false;
        end
    end
    return true;
end

local function deleteItems(User, list)
    for i = 1, #list do
        User:eraseItem(list[i].id, list[i].number);
    end
end

--
--local function checkAudience(god, position)
--    local theCandidates = world:getPlayersInRangeOf(position, 10);
--    local counter = 0;
--    for i = 1, #theCandidates do
--        local candidate = theCandidates[i];
--        if candidate:getQuestProgress(401) == god then
--            counter = counter + 1;
--        end
--    end
--    if counter > 3 then --I need three other characters with the same devotion around
--        return true;
--    else
--        return false;
--    end
--end

local function canDevote(User, god)
    -- FIXME check favour
    return checkItems(User, gods.ITEMS_DEVOTION[god])
end

local function doDevote(User, god)
    if not canDevote(User, god) then
        -- Was capable when opened dialog, but not when accepted. Cheater?
        common.InformNLS(User, "FIXME", "FIXME You do not satisfy the devotion criteria")
    end
    deleteItems(User, gods.ITEMS_DEVOTION[god])
    gods.setDevoted(User, god)
end

local function confirmDevote(User, god)
    local explanation = ""
    if gods.isDevoted(User, god) then
        User:inform("[ERROR] Devotion confirmation for same god. Please inform a developer.")
        return
    elseif gods.isPriest(User) then
        explanation = explanation .. common.GetNLS(User,
            "Als Priester einer anderen Gottheit müßtet ihr eurer Gottheit abschwören, um ein Priester " .. gods.GOD_NAME_DE[god] .. "s zu werden FIXME status loss.",
            "As priest of another god, you'll have to abjure your god to become a priest of " .. gods.GOD_NAME_EN[god] .. ", FIXME and you will lose your status."
        )
    elseif gods.isDevoted(User) then
        explanation = explanation .. common.GetNLS(User,
            "Als Anhänger einer anderen Gottheit werdet ihr eurem Gott abschwören müssen, um euch " .. gods.GOD_NAME_DE[god] .. " zu weihen.",
            "As devotee of another god, you'll have to abjure your god to devote yourself to " .. gods.GOD_NAME_EN[god] .. "."
        )
    else -- noob
        explanation = explanation .. common.GetNLS(User, "FIXME", "FIXME You can only devote yourself to one god at a time and bla-bla-bla")
    end
    explanation = explanation .. "\nYou will need to donate " .. tellItems(User, gods.ITEMS_DEVOTION[god])

    if canDevote(User, god) then
        SelectionDialogWrapper(User, common.GetNLS(User, "FIXME", "Devote"), explanation, {
            { icon = 0, text = common.GetNLS(User, "FIXME", "FIXME Yes, I do!"),             func = doDevote, args = { User, god } },
            { icon = 0, text = common.GetNLS(User, "FIXME", "FIXME You must be crazy. No!"), func = nil, args = nil },
        })
    else
        local dialog = MessageDialog(common.GetNLS(User, "FIXME", "Devote"), explanation, --[[callback=]]function(d) end)
        User:requestMessageDialog(dialog)
    end
end

local function pray(User, god)
    common.TalkNLS(User, Character.say , "#me FIXME", "#me FIXME prays to " .. gods.GOD_NAME_EN[god])
    -- FIXME adjust numbers when favour is implemented
    -- TODO cooldown
    gods.increaseFavour(User, 20)
end


local function donate(User, god)
    -- FIXME
    User:inform("FIXME not implemented")
end

local function defile(User, god)
    common.TalkNLS(User, Character.say , "#me FIXME", "#me FIXME spits on the altar and curses the name of " .. gods.GOD_NAME_EN[god])
    local favour_penalty
    -- FIXME adjust numbers when favour is implemented
    if gods.isPriest(User, god) then
        -- Apostate!
        gods.setNotPriest(User)
        favour_penalty = 500
    elseif gods.isDevoted(User, god) then
        favour_penalty = 200
    else
        favour_penalty = 100
    end
    -- TODO cooldown
    gods.increaseFavour(User, -favour_penalty)
end

local function becomePriest(User, god)
    -- TODO audience, rutial etc
    gods.setPriest(User, god)
end

local function performService(User, god)
    -- TODO priest magic
    common.TalkNLS(User, Character.say , "#me FIXME", "#me FIXME performs a service in honor of " .. gods.GOD_NAME_EN[god])
end


local function ZeniaAltar(User, SourceItem)

    if User:getQuestProgress(502) == 1 then
        User:setQuestProgress(502, 2) --Prayer done
        User:inform("[Quest status] Du hast gebetet und hoffentlich Zenia damit erfreut. Kehre zu ihr zurück", "[Quest status] You feel as if you have prayed sufficient to please Zenia. Please return to her.")
    elseif User:getQuestProgress(502) == 8 and User:countItemAt("all", 2760) >= 2 and User:countItemAt("all", 3) >= 5 and User:countItemAt("all", 26) >= 5 and User:countItemAt("all", 73) >= 10 then -- Take raft items
        User:eraseItem(2760, 2)
        User:eraseItem(3, 5)
        User:eraseItem(26, 5)
        User:eraseItem(73, 10)
        User:setQuestProgress(502, 9) --  You made a raft.
        User:inform("[Quest status] Du sieht, nach dem Beten, dass die Materialien sich von selbst zu einem kleinen Floss zusammenfügen.  Du klettert darauf und wird zu einer kleinen Insel transportiert.", "[Quest status] After praying, you see the items magically form a small raft.  You climb on board and are transported to a small island.")
        User:warp(position(753, 351, -9))
        world:gfx(11, User.pos)
        world:makeSound(9, User.pos)
    elseif User:getQuestProgress(502) == 8 then -- You dropped something you needed.
        User:inform("Sie müssen alle Einzelteile für Floß und Gebet.", "You need all items for raft and prayer.")
    elseif User:getQuestProgress(502) == 10 and User:countItemAt("all",355) >= 10 then -- Revisit Zenia
        User:eraseItem(355, 10)
        User:setQuestProgress(502, 9) --  Ready to leave again.
        User:inform("[Quest status] Du sieht, nach dem Beten, einen hellen Lichtblitz und das kleine Floss erscheint im Wasser. Nachdem du darauf geklettert bist, wirst du zurück auf die kleine Insel gebracht.", "[Quest status]  After praying, you see a bright light flash and your small raft magically appears in the water. Climbing onto it, you are transported back to the small island.")
        User:warp(position(753, 351, -9))
        world:gfx(11, User.pos)
        world:makeSound(9, User.pos)
    elseif  User:getQuestProgress(502) == 10 then -- You dropped something you needed.
        User:inform("Sie verfügen nicht über die richtigen Elemente für das Gebet.", "You lack the proper items for prayer.")
    end
end

function M.LookAtItem(User, Item)
    local god = tonumber(Item:getData("god"))
    god = god or gods.GOD_NONE

    --Tell the user who's altar that is
    if not gods.GODS[god] then --undedicated altar
        lookat.SetSpecialName(Item, "Altar", "Altar")
    else --dedicated altar
        local msg_en = "Altar of " .. gods.GOD_NAME_EN[god] .. ", the " .. gods.DESCRIPTION_EN[god] .. "."
        local msg_de = "Altar " .. gods.GOD_NAME_DE[god] .. "s, " .. gods.DESCRIPTION_DE[god] .. "."
        if gods.isDevoted(User, god) then
            msg_en = msg_en .. "Beholding the altar of " .. gods.GOD_NAME_EN[god] .. " makes you feel proud of your devotion."
            msg_de = msg_de .. "Der Anblick von " .. gods.GOD_NAME_DE[god] .. "s Altar erfüllt dich in deiner Ergebenheit mit Stolz."
        end
        lookat.SetSpecialName(Item,
            msg_de,
            msg_en
        )
--                --For enabling becoming a priest, use the stuff below. Doesn't make any sense without priest magic, though.
--                -- TODO needs adjustment.
--                --[[
--                      if User:getMagicType()== 0 and User:getMagicFlags(0)~= 0 then --a mage! Can't become priest
--                        common.InformNLS(User,"Ein Magier kann leider kein Priester werden.","As a magician, you cannot become a priest anymore.");
--                      elseif User:getMagicType()== 2 and User:getMagicFlags(2)~= 0 then --a bard! Can't become priest
--                        common.InformNLS(User,"Ein Barde kann leider kein Priester werden.","As a bard, you cannot become a priest anymore.");
--                      elseif User:getMagicType()== 3 and User:getMagicFlags(3)~= 0 then --a druid! Can't become priest
--                        common.InformNLS(User,"Ein Druide kann leider kein Priester werden.","As a druid, you cannot become a priest anymore.");
--                      else --a noob, may become priest
--                        common.InformNLS(User,"Um ein Priester "..godName[god].."s zu werden, werdet ihr folgendes opfern müssen:","To become a priest of "..godName[god]..", you'll have to donate:");
--                        User:inform(tellStuff(priestItems[god],User:getPlayerLanguage())); --stuff4priest
--                      end
--                ]]
--            elseif devotion ~= god then
--                -- devoted to another god
--                if (priesthood == 0) then
--                    common.InformNLS(User, "Als Anhänger einer anderen Gottheit werdet ihr eurem Gott abschwören müssen, um euch " .. gods.GOD_NAME_DE[god] .. " zu weihen.", "As devotee of another god, you'll have to abjure your god to devote yourself to " .. gods.GOD_NAME_EN[god] .. ".");
--                    common.InformNLS(User, "Um euch " .. gods.GOD_NAME_DE[god] .. " zu weihen, werdet ihr folgendes opfern müssen:", "To devote yourself to " .. gods.GOD_NAME_EN[god] .. ", you'll have to donate:");
--                    User:inform(tellStuff(devoteItems[god], User:getPlayerLanguage())); --stuff4devotee
--                else
--                    common.InformNLS(User, "Als Priester einer anderen Gottheit müßtet ihr eurer Gottheit abschw�ren, um ein Priester " .. gods.GOD_NAME_DE[god] .. "s zu werden.", "As priest of another god, you'll have to abjure your god to become a priest of " .. gods.GOD_NAME_EN[god] .. ".");
--                    common.InformNLS(User, "Um ein Priester " .. gods.GOD_NAME_DE[god] .. "s zu werden, werdet ihr folgendes opfern müssen:", "To devote yourself to " .. gods.GOD_NAME_EN[god] .. ", you'll have to donate:");
--                    User:inform(tellStuff(devoteItems[god], User:getPlayerLanguage())); --stuff4devotee
--                    User:inform(tellStuff(priestItems[god], User:getPlayerLanguage())); --stuff4priest
--                end
--            end
--        end -- younger gods
    end --dedicated altar
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

--function

function M.UseItem(User, SourceItem, ltstate)

    -- Lake of Life Altar
    if SourceItem.pos == position(763, 336, -9) then --Zenia's Altar
        ZeniaAltar(User, SourceItem)
        return
    end

    local god = tonumber(SourceItem:getData("god"))

    if god == nil then
        god = 0;
    end;

    --Depending on who's altar that is and who uses it, execute different actions
    if not gods.GODS[god] then --undedicated altar
        common.InformNLS(User, "Ihr berührt den Altar, die Abwesenheit göttlichen Wirkens ist offensichtlich.", "You touch the altar, the absence of divine blessing is obvious.");
    else --dedicated altar
        local title = common.GetNLS(User,
            "Altar " .. gods.GOD_NAME_DE[god] .. "s",
            "Altar of " .. gods.GOD_NAME_EN[god]
        )
        local description = common.GetNLS(User,
            "Altar " .. gods.GOD_NAME_DE[god] .. "s, " .. gods.DESCRIPTION_DE[god] .. ". FIXME",
            "Altar of " .. gods.GOD_NAME_EN[god] .. ", the " .. gods.DESCRIPTION_EN[god] .. ".\nChoose your action:"
        )
        local dialogOptions = {
            -- TODO icons
            { icon = 1060, text = "Pray",   func = pray,          args = { User, god } }, -- 128 - book as in quest, 1060/1061/1089 - open book?
            { icon = 2831, text = "Donate",   func = donate,          args = { User, god } }, -- 1367 - tresure chest, 2830 - mysterious chest, 2831 - open chest
            { icon = 372, text = "Defile", func = defile,        args = { User, god } }, -- 157 - rotten bark, 26 - clay, 2038/2039 - skull, 3101/3102 - blood, 372 - poison cloud
        }
        if gods.isPriest(User, god) then
            table.insert(dialogOptions,
                { icon = 3105, text = "Perform service", func = performService, args = { User, god } } -- 3105 - bookrest, 661 - lectern
            )
        elseif gods.isDevoted(User, god) then
            if true then -- FIXME check is not mage/alchenmist/whatever
                table.insert(dialogOptions,
                    { icon = 128, text = "Become a priest", func = becomePriest, args = { User, god } } -- 40 - cleric's staff, 128 - book as in quest
                )
            end
        else
            table.insert(dialogOptions,
                { icon = 467, text = "Devote yourself", func = confirmDevote, args = { User, god } } -- 467 - light
            )
        end

        SelectionDialogWrapper(User, "Altar.", description, dialogOptions)
--
--        if (god > 5) then
--            -- anything else is only for the younger gods
--            --Now send the user some infos what he should do if he wants to become a devotee, change dedication or become a priest
--            local devotion = User:getQuestProgress(401)
--            local priesthood = User:getQuestProgress(402)
--            --Check for corrupted status
--            if priesthood ~= 0 and devotion ~= priesthood and User:getMagicType() == 1 then --Error! The character is a priest, but not a priest of "his" god!
--                common.InformNLS(User, "[Fehler] Bitte informiere einen Entwickler. Der Priesterstatus deines Charakters ist fehlerhaft.", "[Error] Please inform a developer, the priest status of your character is flawed.");
--                return; --bailing out
--            end
--            --Error! The character is not a priest, but has a priest quest status! Or player uses priest magic but has no dedicated god!
--            if (priesthood ~= 0 and User:getMagicType() ~= 1) or (priesthood == 0 and User:getMagicType() == 1) then
--                common.InformNLS(User, "[Fehler] Bitte informiere einen Entwickler. Der Priesterstatus deines Charakters ist fehlerhaft.", "[Error] Please inform a developer, the priest status of your character is flawed.");
--                return; --bailing out
--            end
--            --Check what the User is and send him instructions accordingly
--            if (devotion == 0) then
--                --a noob without a god
--                if checkStuff(User, devoteItems[god]) then
--                    deleteStuff(User, devoteItems[god]);
--                    common.InformNLS(User, "Ihr empfangt den Segen " .. gods.GOD_DE[god] .. "s und weiht euer Leben dem Glaube an die Gottheit. Euer Opfer:", "You receive the blessing of " .. gods.GOD_NAME_EN[god] .. " and devote your life to the faith in the divinity. Your donation:");
--                    world:gfx(16, User.pos);
--                    world:makeSound(13, User.pos);
--                    User:setQuestProgress(401, god); --become devotee
--                    User:setQuestProgress(402, 0); --the char was no priest before - must not be one afterwards
--                else --does not have the stuff
--                    common.InformNLS(User, "Um euch " .. gods.GOD_DE[god] .. " zu weihen, werdet ihr folgendes opfern müssen:", "To devote yourself to " .. gods.GOD_NAME_EN[god] .. ", you'll have to donate:");
--                end
--                User:inform(tellStuff(devoteItems[god], User:getPlayerLanguage())); --stuff4devotee
--            elseif (devotion == god) then
--                -- devoted to this god
--                common.InformNLS(User,
--                    "Ihr betet zu " .. gods.GOD_DE[god] .. " und bekräftigt euren Glauben.",
--                    "You pray to " .. gods.GOD_EN[god] .. " and confirm your faith.");
--                if (priesthood == 0) then
--                    common.InformNLS(User,
--                        "[INFO] An dieser Stelle könntest du Priester werden, aber Priestermagie ist noch nicht verfügbar.",
--                        "[INFO] At this point you could become a priest, but priest magic is not available yet.");
--                    --Below, even more stuff that only makes sense with priest magic. Code makes devotees become priests.
--                    --[[
--                    if User:getMagicType()== 0 and User:getMagicFlags(0)~= 0 then --a mage! Can't become priest
--                      common.InformNLS(User,"Ein Magier kann leider kein Priester werden.","As a magician, you cannot become a priest anymore.");
--                    elseif User:getMagicType()== 2 and User:getMagicFlags(2)~= 0 then --a bard! Can't become priest
--                      common.InformNLS(User,"Ein Barde kann leider kein Priester werden.","As a bard, you cannot become a priest anymore.");
--                    elseif User:getMagicType()== 3 and User:getMagicFlags(3)~= 0 then --a druid! Can't become priest
--                      common.InformNLS(User,"Ein Druide kann leider kein Priester werden.","As a druid, you cannot become a priest anymore.");
--                    else --a noob, may become priest
--                      if checkAudience(god,User.pos) then
--                        if checkStuff(User,priestItems[god]) then
--                          deleteStuff(User,priestItems[god]);
--                          common.InformNLS(User,"Ihr empfangt die Weihe eines Priesters "..godName[god].."s. Euer Opfer:","You receive the ordination to the priesthood of "..godName[god]..". Your donation:");
--                          world:gfx(31,User.pos);
--                          world:makeSound(13,User.pos);
--                          User:setQuestProgress(402,god); --become priest of this god
--                          User:setMagicType(1);
--                          User:teachMagic(1,1); --priest runes
--                          User:teachMagic(1,2);
--                          User:teachMagic(1,3);
--                        else --does not have the stuff
--                          common.InformNLS(User,"Um ein Priester "..godName[god].."s zu werden, werdet ihr folgendes opfern müssen:","To become a priest of "..godName[god]..", you'll have to donate:");
--                        end --item check
--                        User:inform(tellStuff(priestItems[god],User:getPlayerLanguage())); --stuff4priest
--                      else --not enough devotees around
--                        common.InformNLS(User,"Um die Priesterweihe zu empfangen müßt ihr wenigstens drei Anhänger "..godName[god].."s zu einer Messe versammeln.","To receive the ordination to the priesthood of "..godName[god]..", you'll have to gather at least three devotees for a mass.");
--                      end --audience check
--                    end --noob
--                    --]]
--                end
--            elseif devotion ~= god then
--                -- devoted to another god
--                if (priesthood == 0) then
--                    if checkStuff(User, devoteItems[god]) then
--                        deleteStuff(User, devoteItems[god]);
--                        common.InformNLS(User, "Ihr empfangt den Segen " .. gods.GOD_DE[god] .. "s und weiht euer Leben dem Glaube an die Gottheit. Euer Opfer:", "You receive the blessing of " .. gods.GOD_EN[god] .. " and devote your life to the faith in the divinity. Your donation:"); world:gfx(16, User.pos);
--                        world:makeSound(13, User.pos);
--                        User:setQuestProgress(401, god); --become devotee
--                        User:setQuestProgress(402, 0); --the char was no priest before - must not be one afterwards
--                    else --does not have the stuff
--                        common.InformNLS(User, "Um euch " .. gods.GOD_DE[god] .. " zu weihen, werdet ihr folgendes opfern müssen:", "To devote yourself to " .. gods.GOD_EN[god] .. ", you'll have to donate:");
--                    end
--                    User:inform(tellStuff(devoteItems[god], User:getPlayerLanguage())); --stuff4devotee
--                else
--                    common.InformNLS(User,
--                        "[INFO] An dieser Stelle könntest du Priester werden, aber Priestermagie ist noch nicht verfügbar.",
--                        "[INFO] At this point you could become a priest, but priest magic is not available yet.");
--                    -- useless without priest magic
--                    --[[
--                      if checkAudience(god,User.pos) then
--                        if checkStuff(User,devoteItems[god]) and checkStuff(User,priestItems[god]) then
--                          deleteStuff(User,devoteItems[god]);
--                          common.InformNLS(User,"Ihr schwört eurem alten Glauben ab und empfangt die Weihe eines Priesters "..godName[god].."s. Euer Opfer:","You abjure your old faith and receive the ordination to the priesthood of "..godName[god]..". Your donation:");
--                          world:gfx(16,User.pos);
--                          world:makeSound(13,User.pos);
--                          User:setQuestProgress(401,god); --become devotee of this god
--                          User:setQuestProgress(402,god); --become priest of this god
--
--                        else --does not have the stuff
--                          common.InformNLS(User,"Um ein Priester "..godName[god].."s zu werden, werdet ihr folgendes opfern müssen:","To become a  priest of "..godName[god]..", you'll have to donate:");
--                        end
--                      else --not enough devotees around
--                        common.InformNLS(User,"Um die Priesterweihe zu empfangen müßt ihr wenigstens drei Anhänger "..godName[god].."s zu einer Messe versammeln.","To receive the ordination to the priesthood of "..godName[god]..", you'll have to gather at least three devotees for a mass.");
--                      end --audience check
--                      User:inform(tellStuff(devoteItems[god],User:getPlayerLanguage())); --stuff4devotee
--                      User:inform(tellStuff(priestItems[god],User:getPlayerLanguage())); --stuff4priest
--                      --]]
--                end
--            end
--        else
--            -- elder gods
--            common.InformNLS(User,
--                "Du kannst kein Anhänger der alten Götter werden.",
--                "You cannot become a devotee of the elder gods.");
--        end
    end --dedicated altar
end

--function

return M
