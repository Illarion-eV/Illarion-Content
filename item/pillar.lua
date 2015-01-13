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
local lookat = require("base.lookat")
local vision = require("content.vision")

local M = {}

-- UPDATE items SET itm_script='item.pillar' WHERE itm_id IN (272, 440, 441, 442, 443, 467, 692, 693, 694, 695, 2805);

local function RosalineLookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Königin Rosaline", "Queen Rosaline")
    itemLookat.description = common.GetNLS(User,
        "Dieses Monument zeigt die junge Königin Rosaline. Eine Auflistung der Herrscher von Cadomyr ist auf einer Messingtafel am Sockel den Monuments zu lesen.",
        "This monument shows young Queen Rosaline. A register of the rulers of Cadomyr is engraved upon a brass plate at the bottom of the pedestal.")
    return itemLookat
end

local function ReginaldLookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Sir Reginald", "Sir Reginald")
    itemLookat.description = common.GetNLS(User,
        "Dieses Monument zeigt Sir Reginald Edwards, den verstorbenen König Cadomyrs und Vater von Königin Rosaline. Die Sitten Cadomyrs sind auf einer Messingtafel am Sockel den Monuments zu lesen.",
        "This monument shows Sir Reginald Edwards, the departed king of Cadomyr and father of Queen Rosaline. The customs of Cadomyr are engraved upon a brass plate at the bottom of the pedestal.")
    return itemLookat
end

local function Chancellor1LookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Kanzler Statue #1", "Chancellor Statue #1")
    itemLookat.description = common.GetNLS(User,
        "Die Namen der Kanzler Galmairs sind auf die Statue graviert.",
        "The names of the Galmairian Chancellors are engraved on the statue.")
    return itemLookat
end

local function Chancellor2LookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Kanzler Statue #2", "Chancellor Statue #2")
    itemLookat.description = common.GetNLS(User,
        "Die Namen der Kanzler Galmairs sind auf die Statue graviert.",
        "The names of the Galmairian Chancellors are engraved on the statue.")
    return itemLookat
end

local function Chancellor3LookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Kanzler Statue #3", "Chancellor Statue #3")
    itemLookat.description = common.GetNLS(User,
        "Die Namen der Kanzler Galmairs sind auf die Statue graviert.",
        "The names of the Galmairian Chancellors are engraved on the statue.")
    return itemLookat
end


function M.LookAtItem(User, Item)

    -- Endurance Cave Quest
    if Item.pos == position(7, 11, -15) then
        local stage = User:getQuestProgress(204)

        if stage >= 9 then
            common.InformNLS(User,
                "Die Frau sieht dich diesmal mit stechendem irren Blick an, ihre Augen blutunterlaufen. Ihr Haar zu roten Flammen gewandelt.",
                "This time the woman leers at you with madness in her bloodshot eyes. Her hair has turned to crimson flames.")
        end
        return
    end

    local itemLookat

    -- Statue of Queen Rosaline
    if Item.pos == position(118, 566, 0) then
        itemLookat = RosalineLookAt(User, Item)
    end

    -- Statue of Sir Reginald Rosaline
    if Item.pos == position(125, 566, 0) then
        itemLookat = ReginaldLookAt(User, Item)
    end

    -- Chancellor Statue 1
    if Item.pos == position(371, 266, 0) then
        itemLookat = Chancellor1LookAt(User, Item)
    end

    -- Chancellor Statue 2
    if Item.pos == position(359, 266, 0) then
        itemLookat = Chancellor2LookAt(User, Item)
    end

    -- Chancellor Statue 3
    if Item.pos == position(374, 282, 0) then
        itemLookat = Chancellor3LookAt(User, Item)
    end

    if itemLookat then
        return itemLookat --Send the custom lookAt
    else
        return lookat.GenerateLookAt(User, Item)
    end
end


function M.UseItem(User, SourceItem, ltstate)

    vision.UseDarkColumnsPuzzle(User, SourceItem, ltstate)
    vision.UseDarkColumns(User, SourceItem, ltstate)

    if SourceItem.pos == position(125, 566, 0) then --Sir Reginald's statue

        --Dialog
        local dialogTitle = common.GetNLS(User, "Sitten Cadomyrs", "Customs of Cadomyr")
        local dialogText = common.GetNLS(User,
            "I. Glaube: Ehre die Götter. Nur sie alleine sind wahrhaftig allmächtig.\nII. Gehorsam: Sei loyal und folgsam. Dein Monarch verkörpert den Willen der Götter.\nIII. Ehre: Handle stets ehrenhaft. Deine Ehre zu verteidigen ist dein Recht und deine Pflicht.\nIV. Abstammung: Kenne deinen Platz. Deine Geburt zählt mehr als dein Leben oder dein Tod.\nV. Ehrlichkeit: Halte dein Wort und gib kein falsches Zeugnis ab. Du wirst an deinen Worten gemessen.\nVI. Gerechtigkeit: Sei gerecht zu jedem. Stehle nicht, gib deine Freundschaft dem Freund und dein Schwert dem Feind.\nVII. Courage: Fürchte nicht. Stehe für deinen Herrscher und dein Ehre ein. Kein Rückzug, niemals aufgeben.\nVIII. Patriarchat: Gehorche dem Vater. Gehorche dem Ehemann. Aber gehorche nicht dem Sohn.\nIX. Besitz: Was dein ist, soll auch dein bleiben, sei es Getreide, Hund oder Mann.\nX. Verantwortung: Deine Taten hängen dir nach. Nur du bist ihr Ursprung.",
            "I. Faith: Worship the Gods, they alone are true and almighty.\nII. Obedience: Be loyal and obedient, your monarch represents the will of the gods.\nIII. Honour: In all things act with honour. Defending it is your right and duty.\nIV. Lineage: Know your place. Your birth matters more than your life or death.\nV. Truth: Keep your word and give no false testimony. The strength of your word measures your worth.\nVI. Justice: In all things be fair and just; never steal, offer your friendship freely, but do not spare your enemy the sword.\nVII. Courage: Fear is not permissible. Stand for your honour and sovereign. Never retreat, never surrender.\nVIII. Patriarchy: Obey your father, obey your husband, but never your son.\nIX. Property: What is yours will remain yours, be it crop, dog, or man.\nX. Responsibility: In all things you are bound to your deeds. You are their origin.")
        local callbackReginald = function(nothing) end --empty callback
        local dialogReginald = MessageDialog(dialogTitle, dialogText, callbackReginald)

        User:requestMessageDialog(dialogReginald)

        --Quest
        if User:getQuestProgress(111) == 1 then --change when quest is ready!

            User:setQuestProgress(111, 2); --the player read all laws
            common.InformNLS(User, "[Queststatus] Du hast nun die Sitten Cadomyrs gelesen.", "[Quest progress] You read the Cadomyrian customs.")

        end

    elseif SourceItem.pos == position(118, 566, 0) then --Queen Rosaline's statue

        --Dialog
        local dialogTitle = common.GetNLS(User, "Herrscher Cadomyrs", "Souvereigns of Cadomyr")
        local dialogText = common.GetNLS(User,
            "1. König Edward - 16 BS\n\n2. König Reginald - 0 AS\n\n3. Königin Rosaline Edwards - 22 AS",
            "1. Sir Edward - 16 BS\n\n2. Sir Reginald - 0 AS\n\n3. Queen Rosaline Edwards - 22 AS")
        local callbackRosaline = function(nothing) end --empty callback
        local dialogRosaline = MessageDialog(dialogTitle, dialogText, callbackRosaline)

        User:requestMessageDialog(dialogRosaline)

    elseif SourceItem.pos == position(371, 266, 0) then -- Chancellor Statue 1

        --Dialog
        local dialogTitle = common.GetNLS(User, "Liste der Galmarianischen Kanzler", "List of Galmairian Chancellors")
        local dialogText = common.GetNLS(User,
            "Arcia im Jahr 44\nEvie Pryler im Jahr 43\nOxiana im Jahr42\nOxiana im Jahr 41",
            "Arcia in the year 44\nEvie Pryler in the year 43\nOxiana in the year 42\nOxiana in the year 41")
        local callbackChancellor1 = function(nothing) end --empty callback
        local dialogChancellor1 = MessageDialog(dialogTitle, dialogText, callbackChancellor1)

        User:requestMessageDialog(dialogChancellor1)

    elseif SourceItem.pos == position(359, 266, 0) then --Chancellor Statue 2

        --Dialog
        local dialogTitle = common.GetNLS(User, "Liste der Galmarianischen Kanzler", "List of Galmairian Chancellors")
        local dialogText = common.GetNLS(User,
            "Kyre im Jahr 44\nVelisai im Jahr 43\nKyre im Jahr42\nKyre im Jahr 41",
            "Kyre in the year 44\nVelisai in the year 43\nKyre in the year 42\nKyre in the year 41")
        local callbackChancellor2 = function(nothing) end --empty callback
        local dialogChancellor2 = MessageDialog(dialogTitle, dialogText, callbackChancellor2)

        User:requestMessageDialog(dialogChancellor2)

    elseif SourceItem.pos == position(374, 282, 0) then --Chancellor Statue 3

        --Dialog
        local dialogTitle = common.GetNLS(User, "Liste der Galmarianischen Kanzler", "List of Galmairian Chancellors")
        local dialogText = common.GetNLS(User,
            "Sarangerel (Ufedhin Copperhand) im Jahr 44\nSarangerel im Jahr 43\nUhuru Pryler im Jahr42\nPurple im Jahr 41",
            "Sarangerel (Ufedhin Copperhand) in the year 44\nSarangerel in the year 43\nUhuru Pryler in the year 42\nPurple in the year 41")
        local callbackChancellor3 = function(nothing) end --empty callback
        local dialogChancellor3 = MessageDialog(dialogTitle, dialogText, callbackChancellor3)

        User:requestMessageDialog(dialogChancellor3)

    end

end

return M
