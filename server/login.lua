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

local character = require("base.character")
local common = require("base.common")
local factions = require("base.factions")
local money = require("base.money")
local townTreasure = require("base.townTreasure")
local gems = require("base.gems")
local factionLeader = require("scheduled.factionLeader")
local skillTransfer = require("base.skillTransfer")
local areas = require("content.areas")
local hairdresser = require("npc.hairdresser")
local seafaring = require("base.seafaring")
local petsystem = require("petsystem.base")
local gods_common = require("content._gods.gods_common")
-- Called after every player login

local M = {}

-- Load messages of the day
-- German
local messageG = {
"[Tipp] Leichte Rüstungen aus Leder schützen sehr gut gegen stumpfe Waffen aber schlecht gegen Hiebwaffen.",
"[Tipp] Mittlere Rüstungen wie Kettenhemden schützen sehr gut gegen Hiebwaffen aber schlecht gegen Stich- und Distanzwaffen.",
"[Tipp] Schwere Rüstungen wie Plattenpanzer schützen sehr gut gegen Stich- und Distanzwaffen aber schlecht gegen stumpfe Waffen.",
"[Tipp] Wir spielen miteinander, nicht gegeneinander. Viel Spaß beim Spielen!",
"[Tipp] Bitte besuche uns auch im Discord-Chat: https://discord.gg/yj3htPN",
"[Tipp] Im Forum sind viele interessante Diskussion und Informationen zu finden. Meld dich gleich an!",
"[Tipp] Wenn du einen Gamemaster erreichen möchtest, schreibe !gm <Deine Nachricht> im Chatfenster.",
"[Tipp] Brágon ist der Gott des Feuers.",
"[Tipp] Eldan ist der Gott des Geistes.",
"[Tipp] Findari ist die Göttin der Luft.",
"[Tipp] Tanora ist die Göttin des Wassers. Bei den Echsenmenschen ist sie als Zelphia bekannt.",
"[Tipp] Ushara ist die Göttin der Erde.",
"[Tipp] Adron ist der Gott des Weines und der Feste.",
"[Tipp] Cherga ist die Göttin der Geister und der Unterwelt.",
"[Tipp] Elara ist die Göttin des Wissens und der Weisheit.",
"[Tipp] Irmorom ist der Gott des Handels und des Handwerks.",
"[Tipp] Malachín ist der Gott der Jagd und der Schlachten.",
"[Tipp] Moshran ist der Gott des Blutes und der Gebeine.",
"[Tipp] Nargùn ist der Gott des Chaos.",
"[Tipp] Oldra ist die Göttin der Fruchtbarkeit und des Lebens.",
"[Tipp] Ronagan ist der Gott der Diebe und der Schatten.",
"[Tipp] Sirani ist die Göttin der Liebe und der Freude.",
"[Tipp] Zhambra ist der Gott der Freundschaft und Treue.",
"[Tipp] Cadomyr ist das Reich der Ehre.",
"[Tipp] Runewick ist das Reich der Weisheit.",
"[Tipp] Galmair ist das Reich des Reichtums.",
"[Tipp] Manchen Monstern sollte man lieber nicht alleine begegnen.",
"[Tipp] Gegenstände von geringer Haltbarkeit drohen zu zerbrechen. Ein Fachmann kann sie ausbessern.",
"[Tipp] Fernwaffen werden nicht umsonst so genannt: Stark auf Distanz, nutzlos im Nahkampf.",
"[Tipp] Hiebwaffen sind gut gegen leichte Lederrüstungen, aber schlecht gegen mittlere Rüstungen aus Schuppen und Ketten.",
"[Tipp] Stichwaffen sind gut gegen mittlere Rüstungen aus Schuppen und Ketten, aber schlecht gegen schwere Plattenrüstungen.",
"[Tipp] Stumpfe Waffen sind gut gegen schwere Plattenrüstungen, aber schlecht gegen leichte Lederrüstungen.",
"[Tipp] Ein Silberstück entspricht einhundert Kupferstücken. Einhundert Silberstücke entsprechen einem Goldstück.",
"[Tipp] Die besten Bergarbeiter leben in Galmair.",
"[Tipp] Die besten Edelsteinschleifer leben in Galmair.",
"[Tipp] Die besten Schmiede leben in Galmair.",
"[Tipp] Die besten Rüstschmiede leben in Galmair.",
"[Tipp] Die besten Feinschmiede leben in Galmair.",
"[Tipp] Die besten Steinmetze leben in Galmair.",
"[Tipp] Die besten Holzfäller leben in Runewick.",
"[Tipp] Die besten Schreiner leben in Runewick.",
"[Tipp] Die besten Schnitzer leben in Runewick.",
"[Tipp] Die besten Schneider leben in Cadomyr.",
"[Tipp] Die besten Färber leben in Cadomyr.",
"[Tipp] Die besten Gerber leben in Cadomyr.",
"[Tipp] Die besten Weber leben in Cadomyr.",
"[Tipp] Die besten Köche leben in Runewick.",
"[Tipp] Die besten Bäcker leben in Runewick.",
"[Tipp] Die besten Kerzenzieher leben in Runewick.",
"[Tipp] Die besten Bauern leben in Runewick.",
"[Tipp] Die besten Kräuterkundigen leben in Runewick.",
"[Tipp] Die besten Brauer leben in Runewick.",
"[Tipp] Die besten Fischer leben in Runewick.",
"[Tipp] Die besten Landwirte leben in Runewick.",
"[Tipp] Die besten Töpfer leben in Cadomyr.",
"[Tipp] Die besten Glasbläser leben in Cadomyr.",
"[Tipp] Die besten Gräber leben in Cadomyr.",
"[Tipp] Jedes Reich ist auf bestimmte Handwerke spezialisiert. Wenn es das, was du benötigst, nicht auf dem örtlichen Markt gibt, wirst du wohl reisen müssen.",
"[Tipp] Wenn du Probleme bei der Kommunikation mit einem NPC hast, sage 'Hilfe' um eine Liste der Schlüsselwörter aufzurufen.",
"[Tipp] Obstbäume haben schon so manchen hungrigen Abenteurer gerettet. Allerdings ist ein schmackhafteres Mahl stets vorzuziehen.",
"[Tipp] Es gibt viele Möglichkeiten, seinen Charakter zu bewegen: Die linke Maustaste, die Pfeiltasten, den Ziffernblock und WASD.",
"[Tipp] Einen NPC nach einer 'Mission' zu fragen ist ein guter Weg um ein paar einfache Münzen zu verdienen.",
"[Tipp] Scheue dich nicht, andere Spieler um Hilfe zu bitten. Behandle sie mit Respekt und verwende den out-of-character-Modus (#o), wenn nötig.",
"[Tipp] Um deinen Charakter anderen Charakteren vorzustellen, schreibe #i in die Chatbox und drücke Return. Diese erfahren so den Namen deines Charakters.",
"[Tipp] Der Illarion-Chat ist auf der Homepage verlinkt. Du erhältst dort technische Unterstützung oder kannst einfach andere Spieler kennenlernen.",
"[Tipp] Der Vollbildmodus kann im Optionsmenü des Clients aktiviert werden.",
"[Tipp] Wenn ein neuer Spieler deinem Reich beitritt erhältst du eine kurze Mitteilung. Heiße ihn doch gleich willkommen!",
"[Tipp] Um der Staatskasse deines Reiches etwas zu spenden, lege es einfach auf das Spendenfeld in der Nähe deines Anführers.",
"[Tipp] Wenn du auf Reisen gehst, nimm stets Proviant mit. Deine Lebenspunkte regenerieren sich nicht, wenn dein Charakter hungrig ist.",
"[Tipp] Die meisten NPCs reagieren auf 'Hilfe' mit der Ausgabe einer Liste ihrer wichtigsten Schlüsselwörter.",
"[Tipp] Die Fertigkeiten deines Charakters kannst du aufrufen, indem du 'C' drückst.",
"[Tipp] Ein Stapel von Gegenständen läßt sich durch Halten der Shift-Taste beim Bewegen auflösen.",
"[Tipp] Hast du dir schon Gedanken zum Hintergrund und zur Vergangenheit deines Charakters gemnacht? Die Homepage www.illarion.org enthält eine Menge nützliche Informationen über Rassen, Götter und die Geschichte Illarions.",
"[Tipp] Sollte dein Charakter Hunger bekommen, so pflücke ein paar Früchte indem du einen Obstbaum benutzt. Früchte werden gegessen, indem man sie benutzt.",
"[Tipp] Brauchst du Hilfe? Schreibe '!gm Deine Frage' und drücke Return. Sobald ein Gamemaster verfügbar ist wird er dir helfen.",
"[Tipp] Um laut zu rufen, schreibe #s vor deine Nachricht. Um zu flüstern, verwende #w. Für den 'Out-of-character'-Modus verwendest du #o.",
"[Tipp] Klicke mit der linken Maustaste auf ein entferntes Feld um automatisch dorthin zu gehen.",
"[Tipp] Alle NPCs reagieren auf eine Reihe von Schlüsselwörtern. Eine List der wichtigsten Schlüsselwörter erhältst du als Antwort auf 'Hilfe'.",
"[Tipp] Indem du NPCs nach 'Aufgaben' und 'Quests' fragst, kannst du großen Reichtum erlangen.",
"[Tipp] Der rote Balken repräsentiert die Gesundheit deines Charakters. Der gelbe Balken zeigt wie satt dein Charakter ist und der blaue Balken symbolisiert das Mana der Magier.",
"[Tipp] Eine Liste deiner Aufgaben erhältst du, indem du 'Q' drückst.",
"[Tipp] Um Beute schnell aufzunehmen, drücke 'P' und du sammelst alle umliegenden Gegenstände ein.",
"[Tipp] Eine Übersicht aller Kommandos kannst du dir mit F1 anzeigen lassen.",
"[Tipp] Wie schnell deine Fertigkeiten steigen, hängt vor allem davon ab, wie viel Zeit du im Spiel verbringst.",
"[Tipp] Es ist nicht nötig, den ganzen Tag hart zu arbeiten, um deine Fertigkeiten zu steigern. Mach auch mal eine Pause um dich zu unterhalten oder die Welt zu erkunden.",
"[Tipp] Die Steuerungstaste schaltet zwischen Gehen und Laufen um.",
"[Tipp] Je mehr Aktionen du ohne Pause durchführst, desto weniger lernst du von jeder Aktion.",
"[Tipp] Hast du ein Problem mit dem Spiel? Auf der Homepage www.illarion.org sind häufig gestellte Fragen (FAQ) beantwortet.",
"[Tipp] Ein Doppelklick auf einen NPC öffnet eine Liste üblicher Dialogoptionen.",
"[Tipp] Konzentrier dich auf einige, wenige Fertigkeiten. Eierlegende Wollmilchsäue sind schwer zu züchten."
}

-- English
local messageE = {
"[Hint] Light armours, such as those made of leather, offer good protection against blunt weapons but perform poorly against slashing weapons.",
"[Hint] Medium armours, such as chain mail, offer good protection against slashing weapons but are more vulnerable to stabbing weapons.",
"[Hint] Heavy armours, such as those made from sturdy metal plates, offer good protection against stabbing weapons but are vulnerable to blunt weapons.",
"[Hint] We play with, not against each other. Have fun playing!",
"[Hint] Please join our Discord chat: https://discord.gg/yj3htPN",
"[Hint] The forum contains many interesting discussions and a lot of useful information. Register today!",
"[Hint] If you want to contact a gamemaster, type !gm <Your message> in the chat box.",
"[Hint] Brágon is the God of fire.",
"[Hint] Eldan is the God of spirit.",
"[Hint] Findari is the Goddess of air.",
"[Hint] Tanora is the Goddess of water. Among Lizardmen, she is known as Zelphia.",
"[Hint] Ushara is the Goddess of earth.",
"[Hint] Adron is the God of festivities and wine.",
"[Hint] Cherga is the Goddess of spirits and the underworld.",
"[Hint] Elara is the Goddess of wisdom and knowledge.",
"[Hint] Irmorom is the God of trade and craftsmanship.",
"[Hint] Malachín is the God of battle and hunting.",
"[Hint] Moshran is the God of blood and bones.",
"[Hint] Nargùn is the God of chaos.",
"[Hint] Oldra is the Goddess of life and fertility.",
"[Hint] Ronagan is the God of thieves and shadows.",
"[Hint] Sirani is the Goddess of love and pleasure.",
"[Hint] Zhambra is the God of friendship and loyalty.",
"[Hint] Cadomyr is the realm of honour.",
"[Hint] Runewick is the realm of wisdom.",
"[Hint] Galmair is the realm of wealth.",
"[Hint] There are some monsters which you should avoid while adventuring alone.",
"[Hint] Items of low durability might break any time. A specialist can repair them.",
"[Hint] Ranged weapons have their name for a reason: They are useful for distant targets, but useless in a melee.",
"[Hint] Slashing weapons are good against light leather armour but bad against medium chain and scale armour.",
"[Hint] Stabbing weapons are good against medium chain and scale armour but bad against heavy plate armour.",
"[Hint] Blunt weapons are good against heavy plate armour but bad against light leather armour.",
"[Hint] A single silver coin equals a hundred copper coins. One hundred silver coins equal one gold coin.",
"[Hint] The best miners are living in Galmair.",
"[Hint] The best gem grinders are living in Galmair.",
"[Hint] The best blacksmiths are living in Galmair.",
"[Hint] The best armourers are living in Galmair.",
"[Hint] The best finesmiths are living in Galmair.",
"[Hint] The best masons are living in Galmair.",
"[Hint] The best lumberjacks are living in Runewick.",
"[Hint] The best carpenters are living in Runewick.",
"[Hint] The best carvers are living in Runewick.",
"[Hint] The best tailors are living in Cadomyr.",
"[Hint] The best dyers are living in Cadomyr.",
"[Hint] The best tanners are living in Cadomyr.",
"[Hint] The best weavers are living in Cadomyr.",
"[Hint] The best cooks are living in Runewick.",
"[Hint] The best bakers are living in Runewick.",
"[Hint] The best candle makers are living in Runewick.",
"[Hint] The best farmers are living in Runewick.",
"[Hint] The best herbalists are living in Runewick.",
"[Hint] The best brewers are living in Runewick.",
"[Hint] The best fishers are living in Runewick.",
"[Hint] The best husbandmen are living in Runewick.",
"[Hint] The best potters are living in Cadomyr.",
"[Hint] The best glass blowers are living in Cadomyr.",
"[Hint] The best diggers are living in Cadomyr.",
"[Hint] Each realm specialises in certain crafts. If you can't find what you are looking for in your home market, you may need to travel abroad.",
"[Hint] If you ever get stuck while communicating with an NPC, the 'help' command will provide you with a list of useful topics.",
"[Hint] Fruit trees have saved the lives of countless starving travellers. You will soon find yourself needing a more filling meal, though.",
"[Hint] There are many ways to move your character around in Illarion. The left mouse button, arrow keys, number pad, and WASD will all work.",
"[Hint] Asking an NPC whether they have a 'quest' for you to carry out can be a good way to earn a quick coin or two.",
"[Hint] Don't be afraid to ask the other players around you for help if you encounter difficulties. But make sure to remain respectful and to use OOC chat (#o), where appropriate.",
"[Hint] If you want to introduce your character to other players, type #i in the chatbox and hit return. The other players will then be able to see your character's name.",
"[Hint] The Illarion chat is linked on the website www.illarion.org. It is useful for technical assistance and for simply getting to know your fellow players.",
"[Hint] Fullscreen mode can be activated in the options menu when the client is started.",
"[Hint] You will receive a notification when a new player chooses to join your realm. Give them a friendly welcome!",
"[Hint] In order to donate something to your realm's treasury, just place the item on the donation square close to your leader.",
"[Hint] If you go on a journey, always have some rations with you. Your character's hitpoints won't regenerate if your character is hungry.",
"[Hint] Most NPCs react on 'help' with a list of their most important keywords.",
"[Hint] You can review the skills of your character by hitting 'C'.",
"[Hint] To split a stack of items, hold shift while moving it.",
"[Hint] Did you already think about the background and past of your character? The website www.illarion.org contains a lot of information on the races, the gods, and the lore of Illarion.",
"[Hint] If your character ever gets hungry, just harvest some fruits by using a fruit tree. You can then eat the fruits by using them.",
"[Hint] Do you need help? Type '!gm <your question>' and hit enter. As soon as a Gamemaster is available, they will assist you.",
"[Hint] To shout, type #s in front of your message. To whisper, use #w. And use #o for the out of character mode.",
"[Hint] Click with the left mouse button while pointing at a distant field to make your character walk there automatically.",
"[Hint] All NPCs react on a number of keywords. You can get a list of the most important keywords for a particular NPC with the command 'help'.",
"[Hint] By asking NPCs for 'missions' and 'quests' you can become extremely wealthy.",
"[Hint] The red bar represents the health of your character. The yellow bar is an indicator of how hungry your character is, and the blue bar shows the mana level of mage characters.",
"[Hint] You can review the quests of your character by hitting 'Q'.",
"[Hint] To collect loot quickly, press 'P' to collect all items within reach.",
"[Hint] To see an overview of all commands, hit F1.",
"[Hint] The speed of skillgain is mainly determined by the time you spend in the game.",
"[Hint] It is not necessary to work all day long to raise your skills. Take a break to chat or explore the world!",
"[Hint] CTRL toggles walking/running.",
"[Hint] The more actions you do over time, the less you learn from each action.",
"[Hint] Got a problem? On the website, you can find frequently asked questions (FAQ) answered.",
"[Hint] Double clicking an NPC opens a list with common dialog options.",
"[Hint] Focus on a selection of skills. Remember: Jack of all trades - master of none."
}
-- Messages of the day - END

local welcomeNewPlayer
local informPlayeraboutTaxandGems
local showNewbieDialog
local exchangeFactionLeader
local payTaxes
local receiveGems
local PayOutWage
local payNow

function M.onLogin( player )

    skillTransfer.setQuestStatusForNoSkillChars(player)

    welcomeNewPlayer(player)

    world:gfx(31, player.pos) --A GFX that announces clearly: A player logged in.

    --General welcome message
    local players = world:getPlayersOnline() --Reading all players online so we can count them

    --Reading current date
    local datum = world:getTime("day")
    local monthString = common.Month_To_String(world:getTime("month"))
    local hourStringG, hourStringE = common.Hour_To_String(world:getTime("hour"))

    local lastDigit = datum % 10 --Is it st, nd or rd?

    local extensionString
    if lastDigit == 1 and datum ~= 11 then
        extensionString = "st"
    elseif lastDigit == 2 and datum ~= 12 then
        extensionString = "nd"
    elseif lastDigit == 3 and datum ~= 13 then
        extensionString = "rd"
    else
        extensionString = "th" --default
    end

    if #players > 1 then
        common.InformNLS(player,"[Login] Willkommen auf Illarion! Es ist "..hourStringG.." am "..datum..". "..monthString..". Es sind "..#players.." Spieler online.","[Login] Welcome to Illarion! It is "..hourStringE.." on the "..datum..""..extensionString.." of "..monthString..". There are "..#players.." players online.") --sending a message
    else --player is alone
        common.InformNLS(player,"[Login] Willkommen auf Illarion! Es ist "..hourStringG.." am "..datum..". "..monthString..". Ein Spieler ist online.","[Login] Welcome to Illarion! It is "..hourStringE.." on the "..datum..""..extensionString.." of "..monthString..". One player is online.") --sending a message
    end

    --Taxes
    if not player:isAdmin() then --Admins don't pay taxes or get gems.
        if not (player.name == "Valerio Guilianni" or player.name == "Rosaline Edwards" or player.name ==  "Elvaine Morgan") then --Leader don't pay taxes or get gems

            local taxText = payTaxes(player)
            local gemText = receiveGems(player)
            if gemText ~= nil or taxText ~= nil then
                informPlayeraboutTaxandGems(player, gemText, taxText)
            end
        end
    end

    --Noobia handling
    if (common.isOnNoobia(player.pos)) then --On Noobia
        local found = player.effects:find(13) --Noob effect
        if not found then --new player!
            player.effects:addEffect(LongTimeEffect(13, 1))
        end
        if  player:isInRangeToPosition(position(31, 22, 100), 7) then --only show the dialog if the char is close to the noob spawn
            showNewbieDialog(player)
        end
    end --Noobia end

    --Messages of the day
    if #messageG ~= #messageE then
        common.HighInformNLS(player, "[Fehler] Anzahl der Tagestipps nicht korrekt.", "[Error] Amount of messages of the day incorrect.") --sending a message
    end
    local dailyMessageID = math.random(1, #messageG) --chosing a message at random
    common.InformNLS(player, messageG[dailyMessageID], messageE[dailyMessageID]) --sending a message

    --Exchange leader NPCs if necessary
    if player.name == "Valerio Guilianni" or player.name == "Rosaline Edwards" or player.name ==  "Elvaine Morgan" then
        exchangeFactionLeader(player.name)
    end

    --A hack to display bars correctly
    player:increaseAttrib("foodlevel", -1)

    --hair messages
    hairdresser.hairOnLogin(player)

    --on ferry
    seafaring.login(player)

    --Check regeneration script
    local found = player.effects:find(2)
    if not found then
        player.effects:addEffect(LongTimeEffect(2, 10))
    end

    --Checking longterm cooldown
    found = player.effects:find(33)
    if not found then
        player.effects:addEffect(LongTimeEffect(33, 10))
    end

    --Checking gods cooldown
    found = player.effects:find(gods_common.EFFECT_ID)
    if not found then
        player.effects:addEffect(LongTimeEffect(gods_common.EFFECT_ID, 10))
    end
    
    --Handle pets
    --petsystem.loadPet(player)
end

function showNewbieDialog(player)
    skillTransfer.setNewbieQuestStatus(player)

    local getText = function(deText,enText) return common.GetNLS(player, deText, enText) end

    local callbackNewbie = function(dialogNewbie) --start callback of Newbie Dialog
        local callbackSkip = function(dialogSkip) --start of callback of skipping dialog
            local dialogPostSkip
            local callbackPostSkip = function (dialogPostSkip) end --empty callback

            if dialogSkip:getSuccess() and dialogSkip:getSelectedIndex()==1 then --skipping
                player:warp(position(36, 97, 100))
                world:gfx(46, player.pos)
                if player:getPlayerLanguage() == 0 then --skip message
                    dialogPostSkip = MessageDialog("Einführung", "Du hast entschieden, das Tutorial zu überspringen. Wähle ein Reich aus, welchem dein Charakter zukünftig angehören wird. Gehe hierzu durch eines der Portale auf den kleinen Inseln. Du kannst diese Entscheidung später im Spiel jederzeit revidieren. Viola Baywillow kann dir einiges über die drei Reiche erzählen, frage sie einfach nach 'Hilfe'.", callbackPostSkip)
                else
                    dialogPostSkip = MessageDialog("Tutorial", "You have decided to skip the tutorial. Please choose which realm you desire to be the home for your character by stepping through the corresponding portal on the three islands. You can reconsider this decision at any time once you have joined the game. Viola Baywillow will provide you with more information on the three available realms, just ask her for 'help'.", callbackPostSkip)
                end

            else --continue the tutorial
                if player:getPlayerLanguage() == 0 then
                    dialogPostSkip = MessageDialog("Einführung", "Gehe zum Menschen am Ende des Piers um mit dem Tutorial zu beginnen. Klicke mit der linken Maustaste auf ein Feld neben dem Menschen. Alternativ kannst du deinen Charakter auch mit WASD, dem Ziffernblock oder den Pfeiltasten bewegen. Durch Drücken der Steuerungstaste läuft dein Charakter.\n\nEine Übersicht aller Kommandos kannst du dir mit F1 anzeigen lassen. Auf der Homepage www.illarion.org findest du zudem eine Auflistung häufig gestellter Fragen (FAQ).", callbackPostSkip)
                else
                    dialogPostSkip = MessageDialog("Tutorial", "To start the tutorial, please walk to the human at the end of the pier. To move, click with the left mouse button on a spot close to the human. Alternatively, you can walk using the num pad, the arrow keys or WASD. Pressing the control key makes your character run.\n\nTo see an overview of all commands, hit F1. On the website www.illarion.org, you can find frequently asked question (FAQ) answered.", callbackPostSkip)
                end
            end

            player:requestMessageDialog(dialogPostSkip) --showing the text after skipping dialog

        end --end of callback of skip dialog

        local dialogSkip = SelectionDialog(getText("Willkommen zu Illarion!","Welcome to Illarion!"), getText("Die Einführung ist für neue Spieler gedacht. Du kannst sie ohne Nachteil überspringen. \n\nSage 'Überspringe die Einführung' zu einem NPC, wenn du die Einführung später abbrechen möchtest.", "The tutorial is recommended for new players. You may skip the tutorial without any disadvantage. \n\nSay 'skip tutorial' to any NPC if you want to abort the tutorial later on."), callbackSkip)
        dialogSkip:addOption(0, getText("Einführung beginnen.","Start the tutorial."))
        dialogSkip:addOption(0, getText("Einführung überspringen.", "Skip the tutorial."))
        player:requestSelectionDialog(dialogSkip)

    end --end callback of Newbie dialog

    local dialogNewbie
    if player:getPlayerLanguage() == 0 then
        dialogNewbie = MessageDialog("Willkommen zu Illarion!", "Eine lange Reise nähert sich ihrem Ende. Du gehst von Bord des Schiffes und hast endlich wieder festen Boden unter den Füßen. In diesem Land wirst du vor eine Entscheidung gestellt, die wohl die wichtigste deines Lebens sein wird.\nDas edle Cadomyr, das weise Runewick oder das reiche Galmair - welchen Weg wirst du einschlagen?\n\nWillkommen zu Illarion, dem kostenlosen dem Open-Source MMORPG mit echtem Rollenspiel. Dieses Tutorial wird dich auf deinen ersten Schritten begleiten und dir die Bedienung des Spiels beibringen.", callbackNewbie)
    else
        dialogNewbie = MessageDialog("Welcome to Illarion!", "A long, tiresome journey finally comes to an end. You disembark the ship and feel solid ground beneath your feet. In these lands, you will soon be faced with a choice, perhaps the most important of your entire life. Noble Cadomyr, wise Runewick, or wealthy Galmair - whose side shall you join?\n\nWelcome to Illarion, the free open source MMORPG where true roleplaying is enforced. This tutorial will guide you through your first steps and teach you the controls of the game.", callbackNewbie)
    end

    player:requestMessageDialog(dialogNewbie) --showing the welcome text
end

local function jumpToNewPlayer(user, player)
    if not isValidChar(player) then
        common.InformNLS(user,"Der Character ist nicht mehr online.","This character is not online anymore.")
        return
    end
    local playerPos = player.pos
    if areas.PointInArea(playerPos,"Runewick") and not factions.isPlayerPermittedInTown(user,factions.runewick) then
        common.InformNLS(user,"Dein Charakter darf Runewick nicht betreten. Du kannst hier nicht helfen.",
                              "Your character is not permitted to enter Runewick. You cannot help.")
        return
    elseif areas.PointInArea(playerPos,"Cadomyr") and not factions.isPlayerPermittedInTown(user,factions.cadomyr) then
        common.InformNLS(user,"Dein Charakter darf Cadomyr nicht betreten. Du kannst hier nicht helfen.",
                              "Your character is not permitted to enter Cadomyr. You cannot help.")
        return
    elseif areas.PointInArea(playerPos,"Galmair") and not factions.isPlayerPermittedInTown(user,factions.galmair) then
        common.InformNLS(user,"Dein Charakter darf Galmair nicht betreten. Du kannst hier nicht helfen.",
                              "Your character is not permitted to enter Galmair. You cannot help.")
        return
    end
    
    local plyList = world:getPlayersInRangeOf(playerPos, 20)
    local playerCount = 0
    for i, player in pairs(plyList) do
        if not player:isNewPlayer() then
            playerCount = playerCount + 1
        end
    end
    
    if playerCount > 1 then
        common.InformNLS(user,"Bei dem neuen Spielen sind bereits mindestens 2 Helfer.",
                              "There are already 2 helper next to the new player.")
    else
        user:warp(player.pos)
        world:gfx(46, player.pos)
        user:setQuestProgress(850, user:getQuestProgress(850)+1)
    end

end

function welcomeNewPlayer(player)
    if not player:isNewPlayer() then
        player:setQuestProgress(851, 0) -- reset session check for newbie welcome dialog
        return
    end

    local onlinePlayers = world:getPlayersOnline()
    for i=1,#onlinePlayers do
        local user = onlinePlayers[i]

        if not user:isNewPlayer() and not common.isInPrison(user.pos) then -- no new player and not in the prison mine

            if user:getQuestProgress(851) == 0 then

                local getText = function(deText,enText) return common.GetNLS(user, deText, enText) end

                local callback = function(dialog)
                    local success = dialog:getSuccess()
                    if success then
                        local selected = dialog:getSelectedIndex()+1
                        if selected == 1 then
                            jumpToNewPlayer(user, player)
                        elseif selected == 2 then
                            -- nothing
                        elseif selected == 3 then
                            user:setQuestProgress(851,1)
                        end
                    end
                end

                local textUse = getText("Ein neuer Spieler hat Illarion betreten! Möchtest du deine Hilfe anbieten?\nEr befindet sich derzeit ",
                                        "A new player has entered Illarion! Do you want to offer your help?\nHe is at the moment ")
                local playerPos = player.pos
                if common.isOnNoobia(playerPos) then
                    textUse = textUse .. getText("auf Noobia.","on Noobia.")
                elseif areas.PointInArea(playerPos,"Runewick") then
                    textUse = textUse .. getText("in Runewick.","in Runewick.")
                elseif areas.PointInArea(playerPos,"RunewickRegion") then
                    textUse = textUse .. getText("nahe Runewicks.","close to Runewick.")
                elseif areas.PointInArea(playerPos,"Cadomyr") then
                    textUse = textUse .. getText("in Cadomyr.","in Cadomyr.")
                elseif areas.PointInArea(playerPos,"CadomyrRegion") then
                    textUse = textUse .. getText("nahe Cadomyrs.","close to Cadomyr.")
                elseif areas.PointInArea(playerPos,"Galmair") then
                    textUse = textUse .. getText("in Galmair.","in Galmair.")
                elseif areas.PointInArea(playerPos,"GalmairRegion") then
                    textUse = textUse .. getText("nahe Galmairs.","close to Galmair.")
                else
                    textUse = textUse .. getText("irgendwo in der Wildnis.","anywhere in the wilderness.")
                end
                local timeMinutes = player:getQuestProgress(852)
                local timeHours = math.floor(tonumber(timeMinutes)/60)
                if timeHours == 0 then
                    textUse = textUse .. getText("\nDer Spieler ist noch keine Stunde online.","\nThe player has been online for less than an hour.")
                elseif timeHours == 1 then
                    textUse = textUse .. getText("\nDer Spieler war bereits über eine Stunde online.",
                                                 "\nThe player has already been online for an hour.")
                else
                    textUse = textUse .. getText("\nDer Spieler war bereits " .. tostring(timeHours) .. " Stunden online.",
                                                 "\nThe player was already online for " .. tostring(timeHours) .. " hours.")
                end
                
                local dialog = SelectionDialog(getText("Ein neuer Spieler!","A new player!"), textUse, callback)
                dialog:addOption(0, getText("Teleportier mich zu ihm. Ich will helfen!","Warp me to him, let me help!"))
                dialog:addOption(0, getText("Nicht jetzt.", "Not now."))
                dialog:addOption(0, getText("Nicht für diese Sitzung.","Not for this session."))
                user:requestSelectionDialog(dialog)
            end
        end
    end
end

function payTaxes(taxPayer)
    local yr = world:getTime("year")
    local mon = world:getTime("month")
    local timeStmp = yr * 1000 + mon
    local lastTax = taxPayer:getQuestProgress(123)

    if (lastTax ~= 0) then
        -- Character didnt pay taxes for this month yet
        if lastTax < timeStmp then
            taxPayer:setQuestProgress(123, timeStmp)
            return payNow(taxPayer)
        end
    else
        -- Character never payed taxes before
        taxPayer:setQuestProgress(123, timeStmp)
        return payNow(taxPayer)
    end
end

function receiveGems(gemRecipient)
    local yr = world:getTime("year")
    local mon = world:getTime("month")
    local timeStmp = yr * 1000 + mon
    local town = factions.getMembershipByName(gemRecipient)
    if town == "None" then
        return
    end

    -- first check if there was a switch from collecting taxes to pay out gems already
    local fnd, lastSwitch = ScriptVars:find("SwitchedToPayment"..town)
    if not fnd then
        -- first payout ever
        townTreasure.NewMonthSwitch(town,timeStmp)
        fnd, lastSwitch = ScriptVars:find("SwitchedToPayment"..town)
    end

    if fnd and tonumber(lastSwitch) ~= timeStmp then
        townTreasure.NewMonthSwitch(town, timeStmp)
        lastSwitch = timeStmp
    end

    -- now check if last payment was before actual month and actual month is the one to pay out.
    local lastGem = gemRecipient:getQuestProgress(124)
    if (lastGem ~= 0) then
        if timeStmp >= tonumber(lastSwitch) and tonumber(lastGem) < timeStmp then
            gemRecipient:setQuestProgress(124, timeStmp)
            return PayOutWage(gemRecipient,town)
        end
    else
        gemRecipient:setQuestProgress(124, timeStmp)
        return PayOutWage(gemRecipient,town)
    end
end

-- transfer
local function createMagicGem(gemId, gemAmount, Recipient)
    local gemData = gems.getMagicGemData(1)
    common.CreateItem(Recipient, gemId, gemAmount, 333, gemData)
    local basename={}
    basename=world:getItemName(gemId, Recipient:getPlayerLanguage())
    if Recipient:getPlayerLanguage() == 0 then
        basename = "Latent magischer " .. basename
    else
        basename = "Latent magical " .. basename
    end
    basename = "\n" .. tostring(gemAmount) .. " x " .. basename
    return basename
end

function PayOutWage(Recipient, town)
    local totalTaxes = townTreasure.GetPaymentAmount(town)
    local totalPayers = townTreasure.GetTaxpayerNumber(town)

    local infText = ""

    if tonumber(totalPayers)>0 then
        if tonumber(totalTaxes)>0 then
            local baseWageUnit=totalTaxes/(totalPayers*10000)        -- 10000: "base unit" change accordingly if necessary.
            local RecipientRk=factions.getRankAsNumber(Recipient)

            --If the recipient is level 1 they don't get anything.
            if RecipientRk <2 then
                infText = common.GetNLS(Recipient,
                    "Du solltest dich bemühen, dein Ansehen in "..town.." zu steigern, damit du einen Lohn für deine Abgaben erhältst.",
                    "You should earn favour in "..town.." in order to receive rewards for your tribute.")

                log(string.format("[gems] %s got 0 magic gems from %s. Character's rank: %d",
                    character.LogText(Recipient), town, RecipientRk))
            else
                local RankedWage=math.ceil(RecipientRk*baseWageUnit*0.5)
                local endname=""

                local firstGem = Random.uniform(0,RankedWage)
                local secondGem = RankedWage - firstGem
                local gemsByTown={}
                      gemsByTown["Cadomyr"]={gems.TOPAZ, gems.AMETHYST}
                      gemsByTown["Runewick"]={gems.EMERALD, gems.RUBY}
                      gemsByTown["Galmair"]={gems.SAPPHIRE, gems.OBSIDIAN}
                local firstGemId = gems.getMagicGemId(gemsByTown[town][1])
                local secondGemId = gems.getMagicGemId(gemsByTown[town][2])
                
                log(string.format("[gems] %s got %d (%d,%d) magic gems from %s. Character's rank: %d",
                    character.LogText(Recipient), RankedWage, firstGem, secondGem, town, RecipientRk))
                
                if firstGem > 0 then
                    endname = endname .. createMagicGem(firstGemId, firstGem, Recipient)
                end
                if secondGem > 0 then
                    endname = endname .. createMagicGem(secondGemId, secondGem, Recipient)
                end

                infText = common.GetNLS(Recipient,
                    "Deine loyalen Dienste für "..town.." werden mit den folgenden magischen Edelsteinen belohnt:"..endname,
                    "Your loyal service to "..town.." is awarded with the following magical gems:"..endname)
            end
            return infText
        end
    end
end

function payNow(User)
--Cadomyr = 100
--Runewick = 101
--Galmair = 102
--Hemp Necktie Inn = 103 (not a faction!)
--ATTENTION: Depot IDs are magically shifted by 1 compared to the data in item.id_321_depot

    local infText = ""

     -- no member of any town
    local town = factions.getMembershipByName(User)
    if town == "None" then
        return
    end

    -- no rank
    local rank = factions.getRankAsNumber(User)
    if rank < 2 then
        return
    end

    local taxHeight=0.01  -- 1% taxes

    local depNr={100,101,102,103}
    local valDepot={0,0,0,0}
    local val = 0

    for i=1, #(depNr) do
        valDepot[i]=money.DepotCoinsToMoney(User,depNr[i])
        val = val + valDepot[i]     --how much money is in the depots combined
    end

    val = val + money.CharCoinsToMoney(User) -- total wealth

    local tax = math.floor(val*taxHeight)
    local totTax=tax -- total tax to pay

    if totTax < 1 then
        infText = common.GetNLS(User,
            "Du bist zu arm um Steuern an "..town.." zu bezahlen.",
            "You are too poor to pay taxes to "..town..".")
        return infText
    end
    
    -- try to get the payable tax from the depots first
    for i = 1, #(depNr) do
        if tax<=valDepot[i] then -- if you fild all you need in the first/ next depot, take it.
            money.TakeMoneyFromDepot(User,tax,depNr[i])
            tax = 0
            break
        elseif tax ~= 0 and valDepot[i] > 0 then -- if not, take as much as you can from the following depots
            money.TakeMoneyFromDepot(User,valDepot[i],depNr[i])
            tax = tax - valDepot[i]
        end
    end

    if tax ~= 0 then --there wasn't enough cash in the depots, get the rest from the char
        money.TakeMoneyFromChar(User,tax)
    end

    local gstring, estring=money.MoneyToString(totTax) --converting money to a string

    infText = common.GetNLS(User,
        "Du hast deine monatliche Abgabe an "..town.." gezahlt. Diesen Monat waren es "..gstring..". Die Abgabenhöhe betrug "..(taxHeight*100).."%",
        "You have paid your monthly tribute to "..town..". This month, it was "..estring..", resulting from a tribute rate of "..(taxHeight*100).."%")

    local userRank = factions.getRankAsNumber(User)
    townTreasure.ChangeTownTreasure(town,totTax)
    townTreasure.IncreaseTaxpayerNumber(town)
    townTreasure.IncreasePayerRanks(town,userRank)

    log(string.format("[taxes] %s paid %d. Faction wealth of %s increased to %d copper.",
                character.LogText(User), totTax, town, townTreasure.GetTownTreasure(town)))
    return infText
end

function informPlayeraboutTaxandGems(User, gemText, taxText)
    local infText = ""
    if taxText ~= nil then
        infText = taxText.."\n\n"
    end
    if gemText ~= nil then
        infText = infText..gemText
    end
    local title = common.GetNLS(User,"Abgabenbenachrichtigung","Tribute information")

    local callback = function(empty) end
    local dialog = MessageDialog(title, infText, callback)
    User:requestMessageDialog(dialog)
end

-- Function to exchange the faction leader of a town.
function exchangeFactionLeader( playerName )
    for i=1, #(factionLeader.informationTable) do
        if playerName == factionLeader.informationTable[i].npcName then
            factionLeader.updatePosition(factionLeader.informationTable[i].usualPosition,
                factionLeader.informationTable[i].newPosition)
        end
    end
end

return M
