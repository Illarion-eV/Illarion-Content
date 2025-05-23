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
local areas = require("content.areas")
local hairdresser = require("npc.hairdresser")
local seafaring = require("base.seafaring")
local gods_common = require("content._gods.gods_common")
local tutorial = require("content.tutorial")
local keys = require("item.keys")
local ceilingtrowel = require("gm.items.id_382_ceilingtrowel")
local utility = require("housing.utility")
local messenger = require("content.messenger")
local bookrests = require("item.bookrests")
local depotScript = require("item.id_321_depot")

-- Called after every player login

local M = {}

-- Load messages of the day
-- German
local messageG = {
"[Tipp] Leichte R�stungen aus Leder sch�tzen sehr gut gegen stumpfe Waffen aber schlecht gegen Hiebwaffen.",
"[Tipp] Mittlere R�stungen wie Kettenhemden sch�tzen sehr gut gegen Hiebwaffen aber schlecht gegen Stich- und Distanzwaffen.",
"[Tipp] Schwere R�stungen wie Plattenpanzer sch�tzen sehr gut gegen Stich- und Distanzwaffen aber schlecht gegen stumpfe Waffen.",
"[Tipp] Wir spielen miteinander, nicht gegeneinander. Viel Spa� beim Spielen!",
"[Tipp] Bitte besuche uns auch im Discord-Chat: https://discord.gg/yj3htPN",
"[Tipp] Im Forum sind viele interessante Diskussion und Informationen zu finden. Meld dich gleich an!",
"[Tipp] Wenn du einen Gamemaster erreichen m�chtest, schreibe !gm <Deine Nachricht> im Chatfenster.",
"[Tipp] Br�gon ist der Gott des Feuers.",
"[Tipp] Eldan ist der Gott des Geistes.",
"[Tipp] Findari ist die G�ttin der Luft.",
"[Tipp] Tanora ist die G�ttin des Wassers. Bei den Echsenmenschen ist sie als Zelphia bekannt.",
"[Tipp] Ushara ist die G�ttin der Erde.",
"[Tipp] Adron ist der Gott des Weines und der Feste.",
"[Tipp] Cherga ist die G�ttin der Geister und der Unterwelt.",
"[Tipp] Elara ist die G�ttin des Wissens und der Weisheit.",
"[Tipp] Irmorom ist der Gott des Handels und des Handwerks.",
"[Tipp] Malach�n ist der Gott der Jagd und der Schlachten.",
"[Tipp] Moshran ist der Gott des Blutes und der Gebeine.",
"[Tipp] Narg�n ist der Gott des Chaos.",
"[Tipp] Oldra ist die G�ttin der Fruchtbarkeit und des Lebens.",
"[Tipp] Ronagan ist der Gott der Diebe und der Schatten.",
"[Tipp] Sirani ist die G�ttin der Liebe und der Freude.",
"[Tipp] Zhambra ist der Gott der Freundschaft und Treue.",
"[Tipp] Cadomyr ist das Reich der Ehre.",
"[Tipp] Runewick ist das Reich der Weisheit.",
"[Tipp] Galmair ist das Reich des Reichtums.",
"[Tipp] Manchen Monstern sollte man lieber nicht alleine begegnen.",
"[Tipp] Gegenst�nde von geringer Haltbarkeit drohen zu zerbrechen. Ein Fachmann kann sie ausbessern.",
"[Tipp] Fernwaffen werden nicht umsonst so genannt: Stark auf Distanz, nutzlos im Nahkampf.",
"[Tipp] Hiebwaffen sind gut gegen leichte Lederr�stungen, aber schlecht gegen mittlere R�stungen aus Schuppen und Ketten.",
"[Tipp] Stichwaffen sind gut gegen mittlere R�stungen aus Schuppen und Ketten, aber schlecht gegen schwere Plattenr�stungen.",
"[Tipp] Stumpfe Waffen sind gut gegen schwere Plattenr�stungen, aber schlecht gegen leichte Lederr�stungen.",
"[Tipp] Ein Silberst�ck entspricht einhundert Kupferst�cken. Einhundert Silberst�cke entsprechen einem Goldst�ck.",
"[Tipp] Die besten Bergarbeiter leben in Galmair.",
"[Tipp] Die besten Edelsteinschleifer leben in Galmair.",
"[Tipp] Die besten Schmiede leben in Galmair.",
"[Tipp] Die besten R�stschmiede leben in Galmair.",
"[Tipp] Die besten Feinschmiede leben in Galmair.",
"[Tipp] Die besten Steinmetze leben in Galmair.",
"[Tipp] Die besten Holzf�ller leben in Runewick.",
"[Tipp] Die besten Schreiner leben in Runewick.",
"[Tipp] Die besten Schnitzer leben in Runewick.",
"[Tipp] Die besten Schneider leben in Cadomyr.",
"[Tipp] Die besten F�rber leben in Cadomyr.",
"[Tipp] Die besten Gerber leben in Cadomyr.",
"[Tipp] Die besten Weber leben in Cadomyr.",
"[Tipp] Die besten K�che leben in Runewick.",
"[Tipp] Die besten B�cker leben in Runewick.",
"[Tipp] Die besten Kerzenzieher leben in Runewick.",
"[Tipp] Die besten Bauern leben in Runewick.",
"[Tipp] Die besten Kr�uterkundigen leben in Runewick.",
"[Tipp] Die besten Brauer leben in Runewick.",
"[Tipp] Die besten Fischer leben in Runewick.",
"[Tipp] Die besten Landwirte leben in Runewick.",
"[Tipp] Die besten T�pfer leben in Cadomyr.",
"[Tipp] Die besten Glasbl�ser leben in Cadomyr.",
"[Tipp] Die besten Gr�ber leben in Cadomyr.",
"[Tipp] Jedes Reich ist auf bestimmte Handwerke spezialisiert. Wenn es das, was du ben�tigst, nicht auf dem �rtlichen Markt gibt, wirst du wohl reisen m�ssen.",
"[Tipp] Wenn du Probleme bei der Kommunikation mit einem NPC hast, sage 'Hilfe' um eine Liste der Schl�sselw�rter aufzurufen.",
"[Tipp] Obstb�ume haben schon so manchen hungrigen Abenteurer gerettet. Allerdings ist ein schmackhafteres Mahl stets vorzuziehen.",
"[Tipp] Es gibt viele M�glichkeiten, seinen Charakter zu bewegen: Die linke Maustaste, die Pfeiltasten, den Ziffernblock und WASD.",
"[Tipp] Einen NPC nach einer 'Mission' zu fragen ist ein guter Weg um ein paar einfache M�nzen zu verdienen.",
"[Tipp] Scheue dich nicht, andere Spieler um Hilfe zu bitten. Behandle sie mit Respekt und verwende den out-of-character-Modus (#o), wenn n�tig.",
"[Tipp] Um deinen Charakter anderen Charakteren vorzustellen, schreibe #i in die Chatbox und dr�cke Return. Diese erfahren so den Namen deines Charakters.",
"[Tipp] Der Illarion-Chat ist auf der Homepage verlinkt. Du erh�ltst dort technische Unterst�tzung oder kannst einfach andere Spieler kennenlernen.",
"[Tipp] Der Vollbildmodus kann im Optionsmen� des Clients aktiviert werden.",
"[Tipp] Wenn ein neuer Spieler deinem Reich beitritt erh�ltst du eine kurze Mitteilung. Hei�e ihn doch gleich willkommen!",
"[Tipp] Um der Staatskasse deines Reiches etwas zu spenden, lege es einfach auf das Spendenfeld in der N�he deines Anf�hrers.",
"[Tipp] Wenn du auf Reisen gehst, nimm stets Proviant mit. Deine Lebenspunkte regenerieren sich nicht, wenn dein Charakter hungrig ist.",
"[Tipp] Die meisten NPCs reagieren auf 'Hilfe' mit der Ausgabe einer Liste ihrer wichtigsten Schl�sselw�rter.",
"[Tipp] Die Fertigkeiten deines Charakters kannst du aufrufen, indem du 'C' dr�ckst.",
"[Tipp] Ein Stapel von Gegenst�nden l��t sich durch Halten der Shift-Taste beim Bewegen aufl�sen.",
"[Tipp] Hast du dir schon Gedanken zum Hintergrund und zur Vergangenheit deines Charakters gemnacht? Die Homepage www.illarion.org enth�lt eine Menge n�tzliche Informationen �ber Rassen, G�tter und die Geschichte Illarions.",
"[Tipp] Sollte dein Charakter Hunger bekommen, so pfl�cke ein paar Fr�chte indem du einen Obstbaum benutzt. Fr�chte werden gegessen, indem man sie benutzt.",
"[Tipp] Brauchst du Hilfe? Schreibe '!gm Deine Frage' und dr�cke Return. Sobald ein Gamemaster verf�gbar ist wird er dir helfen.",
"[Tipp] Um laut zu rufen, schreibe #s vor deine Nachricht. Um zu fl�stern, verwende #w. F�r den 'Out-of-character'-Modus verwendest du #o.",
"[Tipp] Klicke mit der linken Maustaste auf ein entferntes Feld um automatisch dorthin zu gehen.",
"[Tipp] Alle NPCs reagieren auf eine Reihe von Schl�sselw�rtern. Eine List der wichtigsten Schl�sselw�rter erh�ltst du als Antwort auf 'Hilfe'.",
"[Tipp] Indem du NPCs nach 'Aufgaben' und 'Quests' fragst, kannst du gro�en Reichtum erlangen.",
"[Tipp] Der rote Balken repr�sentiert die Gesundheit deines Charakters. Der gelbe Balken zeigt wie satt dein Charakter ist und der blaue Balken symbolisiert das Mana der Magier.",
"[Tipp] Eine Liste deiner Aufgaben erh�ltst du, indem du 'Q' dr�ckst.",
"[Tipp] Um Beute schnell aufzunehmen, dr�cke 'P' und du sammelst alle umliegenden Gegenst�nde ein.",
"[Tipp] Eine �bersicht aller Kommandos kannst du dir mit F1 anzeigen lassen.",
"[Tipp] Wie schnell deine Fertigkeiten steigen, h�ngt vor allem davon ab, wie viel Zeit du im Spiel verbringst.",
"[Tipp] Es ist nicht n�tig, den ganzen Tag hart zu arbeiten, um deine Fertigkeiten zu steigern. Mach auch mal eine Pause um dich zu unterhalten oder die Welt zu erkunden.",
"[Tipp] Die Steuerungstaste schaltet zwischen Gehen und Laufen um.",
"[Tipp] Je mehr Aktionen du ohne Pause durchf�hrst, desto weniger lernst du von jeder Aktion.",
"[Tipp] Hast du ein Problem mit dem Spiel? Auf der Homepage www.illarion.org sind h�ufig gestellte Fragen (FAQ) beantwortet.",
"[Tipp] Ein Doppelklick auf einen NPC �ffnet eine Liste �blicher Dialogoptionen.",
"[Tipp] Konzentrier dich auf einige, wenige Fertigkeiten. Eierlegende Wollmilchs�ue sind schwer zu z�chten."
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
"[Hint] Br�gon is the God of fire.",
"[Hint] Eldan is the God of spirit.",
"[Hint] Findari is the Goddess of air.",
"[Hint] Tanora is the Goddess of water. Among Lizardmen, she is known as Zelphia.",
"[Hint] Ushara is the Goddess of earth.",
"[Hint] Adron is the God of festivities and wine.",
"[Hint] Cherga is the Goddess of spirits and the underworld.",
"[Hint] Elara is the Goddess of wisdom and knowledge.",
"[Hint] Irmorom is the God of trade and craftsmanship.",
"[Hint] Malach�n is the God of battle and hunting.",
"[Hint] Moshran is the God of blood and bones.",
"[Hint] Narg�n is the God of chaos.",
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
local checkForNewBulletinMessages
local convertWandMagicToFire

local function notRPedEnough(player)

    local questIds = {396, 397, 398, 399, 400}
    local upNext
    local monthBeforeLast

    for _, questId in pairs(questIds) do -- First we find the one from 6 months ago to turn into this month

        local progress = player:getQuestProgress(questId)

        if not upNext then
            upNext = questId

        elseif progress <= player:getQuestProgress(upNext) then -- We want the one that is lowest or at worst equal to another

            upNext = questId
        end

        if not monthBeforeLast then
            monthBeforeLast = questId
        elseif progress > player:getQuestProgress(monthBeforeLast) then
            monthBeforeLast = questId -- we want the highest as that would be the month before last, since we did not save the last one yet that gets saved to upNext
        end
    end

    local comparison = player:getQuestProgress(upNext) -- Take the sixth month to see the difference since then

    local newProgress = player:getQuestProgress(393)

    player:setQuestProgress(upNext, newProgress) --Storing the progress at the start of this month aka accumulated over the past month played

    --Now we have the last 5 months tracked with the latest one replacing the one six months ago and are ready to check activity

    local progress = player:getQuestProgress(393)

    local roleplayedLastMonthOnly = progress - player:getQuestProgress(monthBeforeLast)

    local totalRoleplayed =  progress - comparison
    -- We get how much was roleplayed over the last five months by comparing the latest value to the value of six months ago

    local averageRoleplayed = totalRoleplayed/5

    if averageRoleplayed*5/60 < 1 and roleplayedLastMonthOnly*5/60 < 1 then --stored in ticks of 5 min, divided by 60 for hours. At least 1 hour on average needed
        return true
    end

    local bonus = math.min(math.max(0, roleplayedLastMonthOnly*5/60-1), 23) -- Up to 24 hours bonus, but not counting the first used to unlock gem gain

    bonus = 1/23*bonus -- up to 100% bonus

    return false, bonus --The person has put in at least 1 hour of RP the previous week
end

function M.onLogin( player )

    local leaderNames = {"Elvaine Morgan", "Valerio Guilianni", "Rosaline Edwards"}

    for _, leaderName in pairs(leaderNames) do
        if leaderName == player.name then
            local specialRankStatus = 200
            if player:getQuestProgress(specialRankStatus) ~= 11 then
                player:setQuestProgress(specialRankStatus, 11)
                -- Ensures the player leader characters are the correct rank, for the citizen ledger
                -- and any future aspects of the game they may impact
            end
        end
    end

    --Temporary: Warp players from old Noobia to new newbie spawn
    if player.pos.z == 100 then --Old Noobia
        player:turn(4) --south
        player:warp(position(702, 283, 0))
    end

    --Inform other players about a new player
    if player:isNewPlayer() and areas.PointInArea(player.pos,"trollshaven") then
        welcomeNewPlayer(player)
    end

    --A GFX that announces clearly: A player logged in.
    world:gfx(31, player.pos)

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

    local varTextDe
    local varTextEn

    if #players > 1 then
        varTextDe = ". Es sind "..#players.." Spieler online."
        varTextEn = ". There are "..#players.." players online."
    else --player is alone
        varTextDe =  ". Ein Spieler ist online."
        varTextEn = ". One player is online."
    end

    common.InformNLS(
        player,
        "[Login] Willkommen auf Illarion! Es ist "..hourStringG.." am "..datum..". "..monthString..varTextDe,
        "[Login] Welcome to Illarion! It is "..hourStringE.." on the "..datum..""..extensionString.." of "..monthString..varTextEn
        )

    factions.oneTimeConversionOfReputationPointsToRankPoints(player) --This must take place before taxes to avoid defaulting to rank 1 for those

    --Taxes
    if not player:isAdmin() then --Admins don't pay taxes or get gems.
        if not (player.name == "Valerio Guilianni" or player.name == "Rosaline Edwards" or player.name ==  "Elvaine Morgan") then --Leader don't pay taxes or get gems
            local year = world:getTime("year")
            local month = world:getTime("month")
            local timeStmp = year * 1000 + month

            local taxText, notEnoughRP, bonus = payTaxes(player, timeStmp)
            local gemText = receiveGems(player, bonus, notEnoughRP, timeStmp)
            if gemText ~= nil or taxText ~= nil then
                informPlayeraboutTaxandGems(player, gemText, taxText)
            end
        end
    end

    --Newbie handling
    if player:isInRangeToPosition(position(702, 283, 0), 7) and player:getQuestProgress(325) == 0 and player:getQuestProgress(358) == 0 and player:getQuestProgress(314) ~= 1 then --only show the dialog if the char is close to the noob spawn, has not answered the tutorial message question and did not arrive at the last station of the old tutorial
        showNewbieDialog(player)
    else
        --Messages of the day
        if #messageG ~= #messageE then
            common.HighInformNLS(player, "[Fehler] Anzahl der Tagestipps nicht korrekt.", "[Error] Amount of messages of the day incorrect.") --sending a message
        end
        local dailyMessageID = math.random(1, #messageG) --chosing a message at random
        common.InformNLS(player, messageG[dailyMessageID], messageE[dailyMessageID]) --sending a message
    end

    --Handle legacy quest status
    if player:getQuestProgress(358) == 0 and player:getQuestProgress(325) ~= 0 then
        player:setQuestProgress(358,1)
    end

    --Initiate inline tutorial
    if player.effects:find(13) == false and player:getQuestProgress(325) ~= 2 then
        player.effects:addEffect(LongTimeEffect(13, 1))
    end

    --Exchange leader NPCs if necessary
    if player.name == "Valerio Guilianni" or player.name == "Rosaline Edwards" or player.name ==  "Elvaine Morgan" then
        exchangeFactionLeader(player.name)
    end

    --A hack to display bars correctly
    player:increaseAttrib("foodlevel", -1)
    player:increaseAttrib("foodlevel", 1)

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

    -- Initiate activity tracker
    local activityTrackerID = 84
    if not player:isAdmin() and not player.effects:find(activityTrackerID) then -- Not tracking admins playtime in case we use reputation/playtime for display purposes/highscores or the likes in the future
        player.effects:addEffect(LongTimeEffect(activityTrackerID, 10)) --Initiate the activity tracker for the first time
    end

    --Checking gods cooldown
    found = player.effects:find(gods_common.EFFECT_ID)
    if not found then
        player.effects:addEffect(LongTimeEffect(gods_common.EFFECT_ID, 10))
    end

    utility.keyRetrieval(player, true)
    --Checking for pending town behaviour changes
    keys.changeTownBehaviourOnLogin(player)

    --Checking for pending rank changes
    ceilingtrowel.changeRankOnLogin(player)

    --Checking for pending messages from the messenger
    messenger.sendStoredMessages(player)

    --Check for and provide an inform if there are unread messages at the Troll's haven bulletin board or the relevant town boards if a citizen
    checkForNewBulletinMessages(player)

    -- Convert the old relict wand magic to fire magic
    convertWandMagicToFire(player)

    factions.updateEntry(player) --Updates the citizen ledger status of the player on login as a failsafe

end

function convertWandMagicToFire(player)

    local fireMagicLevel = player:getSkill(Character.fireMagic)
    local wandMagicLevel = player:getSkill(Character.wandMagic)

    if fireMagicLevel >= wandMagicLevel then --If it has already been converted or the old magic skill was transferred and is higher
        if wandMagicLevel > 0 then --This gets rid of wand magic skill in the case of old magic skill transfers having taken place
            player:increaseSkill(Character.wandMagic, 0-wandMagicLevel)
        end
        return
    end

    player:increaseSkill(Character.fireMagic, wandMagicLevel-fireMagicLevel)
    player:increaseSkill(Character.wandMagic, 0-wandMagicLevel)
end

function showNewbieDialog(player)

    local getText = function(deText,enText) return common.GetNLS(player, deText, enText) end

    local callbackNewbie = function(dialogNewbie) --start callback of Newbie Dialog
        local callbackSkip = function(dialogSkip) --start of callback of skipping dialog
            local dialogMessage
            local callbackPostSkip = function (dialogPostSkip)
                player:inform(tutorial.getTutorialInformDE("postSkip"),tutorial.getTutorialInformEN("postSkip"))
            end --empty callback

            if dialogSkip:getSuccess() and dialogSkip:getSelectedIndex() == 1 then --skipping
                if player:getPlayerLanguage() == 0 then --skip message
                    dialogMessage = MessageDialog("Tutorial", tutorial.getTutorialTextDE("skipYes"), callbackPostSkip)
                else
                    dialogMessage = MessageDialog("Tutorial", tutorial.getTutorialTextEN("skipYes"), callbackPostSkip)
                end
                player:setQuestProgress(325,2) --Set flag: Declined tutorial messages
                player:setQuestProgress(358,1) --Set flag: Player took a decision
                player:requestMessageDialog(dialogMessage) --showing the text after skipping dialog

            elseif dialogSkip:getSuccess() and dialogSkip:getSelectedIndex() == 0 then --continue the tutorial
                if player:getPlayerLanguage() == 0 then
                    dialogMessage = MessageDialog("Tutorial", tutorial.getTutorialTextDE("skipNo"), callbackPostSkip)
                else
                    dialogMessage = MessageDialog("Tutorial", tutorial.getTutorialTextEN("skipNo"), callbackPostSkip)
                end
                player:setQuestProgress(325,1) --Set flag: Accepted tutorial messages
                player:setQuestProgress(358,1) --Set flag: Player took a decision
                player:requestMessageDialog(dialogMessage) --showing the text after skipping dialog

            elseif not dialogSkip:getSuccess() then
                player:requestSelectionDialog(dialogSkip) --Show dialog again if player closed it
                common.HighInformNLS(player, "Bitte triff eine Entscheidung.", "Please take a decision.")
            end

        end --end of callback of skip dialog

        local dialogSkip = SelectionDialog(getText("Willkommen bei Illarion!","Welcome to Illarion!"), getText(tutorial.getTutorialTextDE("skip"), tutorial.getTutorialTextEN("skip")), callbackSkip)
        dialogSkip:addOption(0, getText("Zeige Tutorialhinweise.","Show tutorial messages."))
        dialogSkip:addOption(0, getText("Keine Tutorialhinweise.", "No tutorial messages."))
        player:requestSelectionDialog(dialogSkip)

    end --end callback of Newbie dialog

    local dialogNewbie
    if player:getPlayerLanguage() == 0 then
        dialogNewbie = MessageDialog("Willkommen bei Illarion!", tutorial.getTutorialTextDE("welcome"), callbackNewbie)
    else
        dialogNewbie = MessageDialog("Welcome to Illarion!", tutorial.getTutorialTextEN("welcome"), callbackNewbie)
    end

    player:requestMessageDialog(dialogNewbie) --showing the welcome text
end

function welcomeNewPlayer(player)
    local onlinePlayers = world:getPlayersOnline()
    for i, user in ipairs(onlinePlayers) do
        if user.id ~= player.id then
            user:inform("Ein neuer Spieler hat Illarion betreten! Der Charakter ist in Trollshaven.","A new player has entered Illarion! The character is in Troll's Haven.")
        end
    end
end

function payTaxes(taxPayer, timeStmp)

    local lastTax = taxPayer:getQuestProgress(123)

    if (lastTax ~= 0) then
        -- Character didnt pay taxes for this month yet
        if lastTax < timeStmp then
            local notEnoughRP, bonus = notRPedEnough(taxPayer) --This should only be ran once per month per character so it gets put behind the first timestamp like this
            taxPayer:setQuestProgress(123, timeStmp)
            return payNow(taxPayer, notEnoughRP), notEnoughRP, bonus
        end
    else
        -- Character never paid taxes before
        local notEnoughRP, bonus = notRPedEnough(taxPayer) --This should only be ran once per month per character so it gets put behind the first timestamp like this
        taxPayer:setQuestProgress(123, timeStmp)
        return payNow(taxPayer, notEnoughRP), notEnoughRP, bonus
    end
end

function receiveGems(gemRecipient, bonus, notEnoughRP, timeStmp)

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
            return PayOutWage(gemRecipient,town, bonus, notEnoughRP)
        end
    else
        gemRecipient:setQuestProgress(124, timeStmp)
        return PayOutWage(gemRecipient,town, bonus, notEnoughRP)
    end
end

-- transfer
local function createMagicGem(gemId, gemAmount, Recipient)
    local gemData = gems.getMagicGemData(1, Recipient.name)
    common.CreateItem(Recipient, gemId, gemAmount, 333, gemData)
    local basename = world:getItemName(gemId, Recipient:getPlayerLanguage())
    if Recipient:getPlayerLanguage() == 0 then
        basename = "Latent magischer " .. basename
    else
        basename = "Latent magical " .. basename
    end
    basename = "\n" .. tostring(gemAmount) .. " x " .. basename
    return basename
end

local function calculateBaseWageForTaxMoney(taxMoney)

    local wage

    -- before we get here the total collected taxes/donations for this calculation is reduced based on amount of payers

    if taxMoney >= 10000000 then --we use logarithmic math after 1000 gold to even it out

        wage = -396.8 + 86.4 * math.log(taxMoney/10000) --Those numbers might look random but they are a perfect match for the linear math where 1000 gold lands on 200 gems
        -- This creates a soft cap of 200 gems, where it is harder to increase the amount via donations only after
        -- The rank calculation increases/decreases the amount after this function has done its calculation
        -- The bonus for having spent up to 24 hours Rping the past IG month(8 IRL days) adds on after that

    else --we use linear math up to 1000 gold, with 5 gold per gem at 10 taxpayers
        wage = taxMoney/50000
    end

    return wage
end

function PayOutWage(Recipient, town, bonus, notEnoughRP)
    local totalTaxes = townTreasure.GetPaymentAmount(town)
    local totalPayers = townTreasure.GetTaxpayerNumber(town)
    local RecipientRk=factions.getRankAsNumber(Recipient)

    local addendum = " With a basis of "..totalPayers.." payers and "..totalTaxes.." taxes last month."

    if tonumber(totalPayers) <= 0 then
        totalPayers = 1
    end
    if  tonumber(totalTaxes) <= 0 then
        totalTaxes = 1
    end
    -- Instead of skipping magic gem rewards for this months taxes, we give the bare minimum of 1 gem
    -- This also ensures they always get an inform.

    totalTaxes = totalTaxes/2

    -- this equals 10 gold per gem at rank 7 if there was only 1 tax payer last month
    -- in the calculation script further down it is based on 5 gold, hence we double it by halving the money
    -- here. Why? Because I found that simpler and it makes no real difference.

    totalTaxes = totalTaxes + ((totalPayers-1)*(totalTaxes/9))
    -- Every tax payer after the first makes it 11.11~% cheaper up to 10 payers,
    -- to encourage players into doing their best to create a thriving community in their realm
    -- and make it so "leeches" that dont donate and pay little in tax are no longer an issue
    -- The logarithmic returns at a certain point make it so there is little concern if the
    -- community gets "too thriving" and reach a high passive tax income

    local baseWage = calculateBaseWageForTaxMoney(totalTaxes)

    local infText

    --If the recipient is level 1 they don't get anything.
    if RecipientRk <2 then
        infText = common.GetNLS(Recipient,
            "Du solltest dich bem�hen, dein Ansehen in "..town.." zu steigern, damit du einen Lohn f�r deine Abgaben erh�ltst.",
            "You should earn favour in "..town.." in order to receive rewards for your tribute.")

        log(string.format("[gems] %s got 0 magic gems from %s. Character's rank: %d",
            character.LogText(Recipient), town, RecipientRk))
    elseif notEnoughRP then

        log(string.format("[gems] %s got 0 magic gems from %s as they did not meet the RP activity criteria. Character's rank: %d.",
            character.LogText(Recipient), town, RecipientRk))

        infText = common.GetNLS(Recipient,
            "Deine Pr�senz im Reich war in letzter Zeit mangelhaft, sodass sogar der Steuereintreiber dich vergessen hat. Leider bedeutet das auch, dass du diesen Monat keine Edelsteine erhalten wirst.",
            "Your presence in the realm has been lacking as of late, to the point where even the taxman forgot about you. Unfortunately that also means you will not receive any gems this month."
        )
    else

        local RankedWage=math.ceil(baseWage*( 0.3 + 0.1*RecipientRk)) -- -10% or +10% per rank, 100% base value at rank 7
            RankedWage = math.ceil(RankedWage*(1+bonus)) -- up to 100% increased gains if they RPed for a whole 24 hours those 8 days

        local endname=""

        local firstGem = Random.uniform(0,RankedWage)
        local secondGem = RankedWage - firstGem
        local gemsByTown={}
            gemsByTown["Cadomyr"]={gems.TOPAZ, gems.AMETHYST}
            gemsByTown["Runewick"]={gems.EMERALD, gems.RUBY}
            gemsByTown["Galmair"]={gems.SAPPHIRE, gems.OBSIDIAN}

        local firstGemId = gems.getMagicGemId(gemsByTown[town][1])
        local secondGemId = gems.getMagicGemId(gemsByTown[town][2])

        log(string.format("[gems] %s got %d (%d,%d) magic gems from %s. Character's rank: %d"..addendum.." Also an RP bonus of "..tostring(bonus)..".",
            character.LogText(Recipient), RankedWage, firstGem, secondGem, town, RecipientRk))

        if firstGem > 0 then
            endname = endname .. createMagicGem(firstGemId, firstGem, Recipient)
        end

        if secondGem > 0 then
            endname = endname .. createMagicGem(secondGemId, secondGem, Recipient)
        end

        infText = common.GetNLS(Recipient,
            "Deine loyalen Dienste f�r "..town.." werden mit den folgenden magischen Edelsteinen belohnt:"..endname,
            "Your loyal service to "..town.." is awarded with the following magical gems:"..endname)
    end

    return infText

end

function payNow(User, notEnoughRP)
--Cadomyr = 100
--Runewick = 101
--Galmair = 102
--Hemp Necktie Inn = 103 (not a faction!)
--ATTENTION: Depot IDs are magically shifted by 1 compared to the data in item.id_321_depot

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

    if notEnoughRP then --The taxman forgot you, not taxes paid but also no rewards
        return
    end

    local taxHeight=0.01  -- 1% taxes
    local moneyInEachDepot = {}
    local val = 0

    for _, depot in pairs(depotScript.depots) do
        local depotMoney = money.DepotCoinsToMoney(User, depot.id)
        table.insert(moneyInEachDepot, {id = depot.id, money = depotMoney})
        val = val + depotMoney     --how much money is in the depots combined
    end

    val = val + money.CharCoinsToMoney(User) -- total wealth

    local tax = math.floor(val*taxHeight)
    local totTax=tax -- total tax to pay

    if totTax < 1 then
        local infText = common.GetNLS(User,
            "Du bist zu arm um Steuern an "..town.." zu bezahlen.",
            "You are too poor to pay taxes to "..town..".")
        return infText
    end

    -- try to get the payable tax from the depots first
    for _, depot in pairs(depotScript.depots) do
        for _, selectedDepot in pairs(moneyInEachDepot) do
            if selectedDepot.id == depot.id then
                if tax <= selectedDepot.money then
                    money.TakeMoneyFromDepot(User, tax, depot.id)
                    tax = 0
                elseif tax ~= 0 and selectedDepot.money > 0 then
                    money.TakeMoneyFromDepot(User, selectedDepot.money, depot.id)
                    tax = tax - selectedDepot.money
                end
            end
        end
    end

    if tax ~= 0 then --there wasn't enough cash in the depots, get the rest from the char
        money.TakeMoneyFromChar(User,tax)
    end

    local gstring, estring=money.MoneyToString(totTax) --converting money to a string

    local infText = common.GetNLS(User,
        "Du hast deine monatliche Abgabe an "..town.." gezahlt. Diesen Monat waren es "..gstring..". Die Abgabenh�he betrug "..(taxHeight*100).."%",
        "You have paid your monthly tribute to "..town..". This month, it was "..estring..", resulting from a tribute rate of "..(taxHeight*100).."%")

    townTreasure.ChangeTownTreasure(town,totTax)
    townTreasure.IncreaseTaxpayerNumber(town)

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

local function checkTrollsHavenBulletin(user)

    local messageExists = false

    for i = 1, bookrests.BULLETIN_MAX_SLOTS do

        local expirationFound, expirationContent = ScriptVars:find("messageExpiration"..tostring(i))

        if expirationFound and not common.IsNilOrEmpty(expirationContent) then
            expirationContent = tonumber(expirationContent)
            if expirationContent > world:getTime("unix") then
                messageExists = true
            end
        end
    end

    local lastSeen = user:getQuestProgress(255)

    local foundLatest, latest = ScriptVars:find("latestBulletinMessage")

    if not messageExists and foundLatest then --The message expired before the user got the chance to read it and there are no current messages
        lastSeen = tonumber(latest)
        user:setQuestProgress(255, lastSeen)
    end

    if foundLatest and lastSeen ~= tonumber(latest) then
        return true
    end

    return false

end

local function checkRealmBulletin(user)

    local town = factions.getMembershipByName(user)

    if town == "None" then
        return false
    end

    local townBoardQuestIds = {Runewick = 256, Cadomyr = 257, Galmair = 258}

    local townQuestId = townBoardQuestIds[town]

    local foundTownLatest, townLatest = ScriptVars:find("latestMessage"..town)

    local lastSeen = user:getQuestProgress(townQuestId)

    if foundTownLatest and lastSeen ~= tonumber(townLatest) then
        return true, town
    end

    return false

end

function checkForNewBulletinMessages(user)

    local sendTrollsHavenMessage = checkTrollsHavenBulletin(user)

    local sendRealmMessage, town = checkRealmBulletin(user)


    if not sendRealmMessage and not sendTrollsHavenMessage then
        return
    end

    local texts = {}

    if sendRealmMessage and sendTrollsHavenMessage then
        texts.english = "There are new messages to be read at both the Hemp Necktie Inn bulletin board and the town board of "..town.."."
        texts.german = "Neue Nachrichten wurde an das Brett des Gasthofes zur Hanschlinge und von "..town.." angeschlagen."
    elseif sendRealmMessage then
        texts.english = "There are new messages to be read at the "..town.." town board."
        texts.german = "Neue Nachrichten wurde an das Brett von "..town.." angeschlagen."
    else
        texts.english = "There are new messages to be read at the Hemp Necktie Inn bulletin board."
        texts.german = "Neue Nachrichten wurde an das Brett des Gasthofes zur Hanschlinge angeschlagen."
    end

    user:inform("[Nachrichten] "..texts.german, "[Bulletin] "..texts.english)

end

return M
