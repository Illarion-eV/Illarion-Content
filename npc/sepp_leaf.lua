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

--  INSERT INTO npc (npc_type,npc_posx,npc_posy,npc_posz,npc_faceto,npc_is_healer,npc_name, npc_script,npc_sex,npc_hair,npc_beard,npc_hairred,npc_hairgreen,npc_hairblue,npc_skinred,npc_skingreen,npc_skinblue,npc_hairalpha,npc_skinalpha) VALUES(2,690,330,0,4,FALSE,'Sepp Leaf','npc.sepp_leaf',0,1,0,204,144,2,150,79,0,255,255);


local common = require("base.common")
local globalvar = require("base.globalvar")

local teamEast = {}
local teamWest = {}
local itemOnion

local GAME_LEVEL_Z = 0
local posVictoryWest = position(686,330,GAME_LEVEL_Z)
local posVictoryEast = position(693,330,GAME_LEVEL_Z)
local refereePos = position(690,330,GAME_LEVEL_Z)

local borderW = 331
local borderE = 343
local borderS = 683
local borderC = 690
local borderN = 697

local TEAM_NO = 0
local TEAM_WEST = 1
local TEAM_EAST = 2

local CHECK_OK = 0
local CHECK_NOT_IN_FIELD = 1
local CHECK_HIT = 2

local ITEM_ID_ONION = 201

--times in 1/10 s
local GAME_CYCLE_TIME = 5
local TALK_FREQUENCY_GAME_WITHOUT_SPECTATORS = 50
local TALK_FREQUENCY_GAME_WITH_SPECTATORS = 110
local MIN_START_DELAY = 40
local MAX_START_DELAY = 80

local M = {}

local init = {}
local isRunningGame = false
local countGameTime = 0
local isBallReleased = false
local gameStartDelay = 40
local lastWinner = TEAM_NO
local saidText = {}

local npcTalk = {
  --{{said},{answersDe},{answersEn}}
    {   {"hello","greet","hail","good day","good morning","good evening","good night","grüß","gruß","guten morgen","guten tag","guten abend","gute nacht","mahlzeit","tach","moin","mohltied","hiho","hallo","hey","greeb"},
        {"Grüßt euch!","Hiho!","Hallo, Lust auf ein Spiel?"},
        {"Be greeted!","Hiho!","Hello, ready for a match?"} },
    {   {"farewell","bye","fare well","see you","tschüß","tschüss","wiedersehen","gehab wohl","ciao","adieu","au revoir","farebba"},
        {"Auf Wiedersehen!","Bis zum nächsten Spiel!","Kommt mal wieder her!"},
        {"Goodbye!","Until the next match!","Come back again!"} },
    {   {"how are you","how feel","how do you do","wie geht","wie fühlst","wie ist es ergangen","wie befind"},
        {"Gut, danke. Und Euch?","Gut, gut.","Mir ging es nie besser."},
        {"Well thank you, and yourself?","Good, good.","Never felt better."} },
    {   {"your name","who are you","who art thou","ihr name","dein name","wer bist du","wer seid ihr","wie heißt"},
        {"Ich bin der ehemalige Meister in Zwiebelball.","Ich bin der Zwiebelballschiedsrichter Sepp Leaf, und Ihr?","Ich bin Sepp Leaf."},
        {"I'm a former master of onionball.","I'm Sepp Leaf, an onionball referee, and you?","I am Sepp Leaf."} },
    {   {"besser","better","improve"},
        {"Besser zu sein als die, die zuletzt gespielt haben, geht immer.","Wer besser werden will, muss üben, packen wir es an.","Möchtest du kein besserer Spieler werden?"},
        {"You can always play better than the last team. That's not difficult.","Training is the key to becoming better. Let's start.","Don't you want to become a better player?"} },
    {   {"god","gott","gött"},
        {"Ich bin mir sicher die Götter spielten einst Zwiebelball. Ich bin mir allerdings nicht sicher, was dabei die Zwiebel war.","Dieses Spiel erfreut die Götter.","Dank Oldra haben wir genug Bälle."},
        {"Be assured, the gods once played onionball as well, but I'm not sure what they used for a ball.","The gods like you to play onionball.","Thanks to Oldra there are enough balls."} },
    {   {"quest","task","mission","auftrag","aufgabe"},
        {"Ich vergebe keine Aufgaben.","Begib dich in dein Feld, damit das Spiel anfangen kann.","Nein, ich habe für dich nichts zu tun, außer Zwiebelball zu spielen."},
        {"I don't have a quest for you.","Get on the field so the game can start.","No I don't have a quest for you, but you could play onionball."} },
    {   {"play","game","match","spiel","satz"},
        {"Hier wird Zwiebelball gespielt. Das beste Spiel Illarions.","Ihr könnt Zwiebelball spielen, ich mache den Schiedsrichter."},
        {"We play onionball here. The best game in Illarion!","You can play onionball. I'll be your referee."} },
    {   {"regel","rule"},
        {"Die Regeln für Zwiebelball sind ganz einfach. Wer von einer Spielzwiebel getroffen wir, auf eine Spielzwiebel tritt oder aus dem Spielfeld verschwindet beschert der gegnerischen Mannschaft einen Punkt."},
        {"The rules of onionball are very simple. The opposing team gets a point if you are hit by an onion, step on an onion, or leave the game field."} }
}

local cycleText = {
{"Lust auf ein Spiel?", "Want to play a match?"},
{"Hier wird noch richtig mit Zwiebeln gespielt.", "We play as it should be, with onions."},
{"#me prüft eine Zwiebel in seiner Hand.", "#me checks an onion in his hand."},
{"#me schaut sich um.", "#me looks around."},
{"#me rollt eine Zwiebel von einer Hand in die andere.", "#me rolls an onion from one hand to the other."},
{"Zwiebelball, es gibt nichts besseres als ein Zwiebelballspiel.", "Onionball, there is nothing better than onionball!"},
{"Man könnte Zwiebeln natürlich auch essen.","One could eat onions as well."}
}

local cycleTextGame = {
{"Hop Hop!", "Go! Go!"},
{"Ein guter Wurf!", "A good throw!"},
{"#me rauf sich die Haare.", "#me tears at his hair."},
{"Oh Nein!", "Oh no!"},
{"Das kann doch wohl nicht wahr sein!", "This can't be true!"},
{"#me hält sich die Hände vor die Augen.", "#me covers his eyes with his hands."},
{"Meine Güte, ihr sollt die Zwiebel werfen ... nicht essen!","You have to throw the onion... not eat it!"},
{"Was war das denn?","What was that?"},
{"Ja!","Yes!"},
{"Jetzt bewegt euch mal!","Move yourself!"}
}

local function initNpc(npc)
    for i, textLine in pairs (npcTalk) do
        for _, said in pairs (textLine[1]) do
            table.insert(saidText, {said, i})
        end
    end
    npc:createAtPos(3, 813, 1) --hemd, dress
    npc:createAtPos(9, 826, 1) --trousers
    npc:createAtPos(0, 1415, 1) --hat
--    npc:createAtPos(11, 2384, 1) --coat
    npc:createAtPos(10, 369, 1) -- shoes
    init[npc.id] = true
end

local function removeAllBalls(npc)
    local characters = world:getPlayersInRangeOf(refereePos, 20)
    for _, character in pairs(characters) do
        local hasOnion, onionList = common.userHasItems(character,ITEM_ID_ONION)
        if hasOnion then
            for _, onion in pairs(onionList) do
                if onion:getData("onionball") == "true" then
                    world:erase(onion, onion.number)
                end
            end
        end
    end
    local soleOnion = common.GetItemInArea(refereePos, ITEM_ID_ONION, 20, false)
    if soleOnion ~= nil then
        if soleOnion:getData("onionball") == "true" then
            world:erase(soleOnion, 1)
        end
    end
end

-- removed 030920 to use tiles as the border of the onionball fields instead of lines
-- This function repairs parts of the game borders which can be delted under special circumstances
--local function repairGameFieldBorders(user)
--    common.CreateLine(position(borderC, borderE, GAME_LEVEL_Z), position(borderC, borderW+1, GAME_LEVEL_Z),
--        function(thePos)
--            local found = false
--            local itemsOnField = common.GetItemsOnField(thePos)
--            if #itemsOnField > 0 then
--                for _, currentItem in pairs(itemsOnField) do
--                    if currentItem.id == 433 then
--                        found = true
--                        break
--                    end
--               end
--            end
            
--            if not found then
--                world:createItemFromId(433, 1, thePos, true, 333, {nameDe = "Spielfeldbegrenzung", nameEn = "Game field border"})
--            end
--        end
--    )
--end

local function endGame (npc)
    isRunningGame = false
    isBallReleased = false
    countGameTime = 0
    if itemOnion ~= nil then
        world:erase(itemOnion,1)
    end
    teamEast = {}
    teamWest = 
    removeAllBalls(npc)
    --repairGameFieldBorders()
end

local function checkTeamList(teamList)
    local countPlayer = 0
    for i, player in pairs(teamList) do
        if player == nil then
            teamList[i] = nil
        elseif player.pos.z ~= GAME_LEVEL_Z then
            teamList[i] = nil
        else
            countPlayer = countPlayer + 1
        end
    end
    return countPlayer
end

local function isPlayer(user)
    for i, player in pairs(teamEast) do
        if player.id == user.id then
            return true
        end
    end
    for i, player in pairs(teamWest) do
        if player.id == user.id then
            return true
        end
    end
    return false
end

local function countSpectators()
    local characters = world:getPlayersInRangeOf(refereePos, 20)
    local spectators = #characters - checkTeamList(teamEast) - checkTeamList(teamWest)
    return spectators
end

local function setUpTeams()
    local posX
    local posY
    local posZ
    teamEast = {}
    teamWest = {}
    local characters = world:getPlayersInRangeOf(refereePos, 20)
    for _, character in pairs(characters) do
        posX = tonumber(character.pos.x)
        posY = tonumber(character.pos.y)
        posZ = tonumber(character.pos.z)
        if posX < borderN and posX > borderS and posY < borderE and posY > borderW and posZ == GAME_LEVEL_Z then
            if posX < borderC then
                teamWest[character.id]=character
                common.TempInformNLS(character, "Du spielst für Mannschaft West", "You play for Team West")
            elseif posX > borderC then
                teamEast[character.id]=character
                common.TempInformNLS(character, "Du spielst für Mannschaft Ost", "You play for Team East")
            end
        end
    end
end

local function startGame (npc)
    setUpTeams()
    removeAllBalls(npc)
    if checkTeamList(teamEast) == 0 then
        common.TalkNLS(npc,Character.say,
                        "Wie sollen wir Zwiebelball spielen, wenn in der Mannschaft Ost keine Spieler sind?",
                        "How should we play onionball if Team East has no players?")
        return
    end
    if checkTeamList(teamWest) == 0 then
        common.TalkNLS(npc,Character.say,
                        "Wie sollen wir Zwiebelball spielen, wenn in der Mannschaft West keine Spieler sind?",
                        "How should we play onionball if Team West has no players?")
        return
    end
    isRunningGame = true
    isBallReleased = false
    countGameTime = 0
    gameStartDelay = math.random(MIN_START_DELAY,MAX_START_DELAY)
    common.TalkNLS(npc,Character.say,"Lasst das Spiel beginnen!","Let the match begin!")
end

local function createBall(npc)
    local borderW = 333
    local borderE = 340
    local posX = 690
    local posY = math.random(borderW, borderE)
    local pos = position(posX, posY, GAME_LEVEL_Z)
    itemOnion = world:createItemFromId(ITEM_ID_ONION, 1, pos, true, 333, {onionball="true",nameDe="Spielzwiebel",nameEn="Game Onion",descriptionDe="Die Zwiebel ist schon recht matschig und stinkt.",descriptionEn="The onion is quite pulpy and stinks.",lookatNoPrice=1,lookatNoWeight=1})
    world:gfx(globalvar.gfxSUN, pos)
    npc:talk(Character.say,"#me wirft eine Zwiebel auf die Mittellinie.","#me throws an onion along the centre line.")
    isBallReleased = true
end

local function playerCheckOnGame(teamList, team)
    local endN
    local endS
    if team == TEAM_WEST then
        endS = borderS
        endN = borderC
    else
        endS = borderC
        endN = borderN
    end

    local checkResult = CHECK_OK
    local posX
    local posY
    for i, player in pairs(teamList) do
        posX = tonumber(player.pos.x)
        posY = tonumber(player.pos.y)
        if posX <= endS or posX >= endN or posY <= borderW or posY >= borderE then
            checkResult = CHECK_NOT_IN_FIELD
            world:gfx(globalvar.gfxFALL, player.pos)
        end
        if world:isItemOnField(player.pos) then
            local item = world:getItemOnField(player.pos)
            if item:getData("onionball") == "true" then
                checkResult = CHECK_HIT
                world:gfx(globalvar.gfxPLATSCH, player.pos)
                world:erase(item,1)
            end
        end
    end
    return checkResult
end

local function spectatorInField()
    local characters = world:getPlayersInRangeOf(refereePos, 20)
    for _, character in pairs(characters) do
        local posX = tonumber(character.pos.x)
        local posY = tonumber(character.pos.y)
        local posZ = tonumber(character.pos.z)
        if posX < borderN and posX > borderS and posY < borderE and posY > borderW and posZ == GAME_LEVEL_Z then
            if not isPlayer(character) then
                return true
            end
        end
    end
    return false
end

local function checkGameRules(npc)
    local checkResult
    if checkTeamList(teamEast) == 0 then
        common.TalkNLS(npc,Character.say,
                        "Wie sollen wir Zwiebelball spielen, wenn in der Mannschaft Ost keine Spieler sind?",
                        "How should we play onionball if Team East has no players?")
        return false
    end
    if checkTeamList(teamWest) == 0 then
        common.TalkNLS(npc,Character.say,
                        "Wie sollen wir Zwiebelball spielen, wenn in der Mannschaft West keine Spieler sind?",
                        "How should we play onionball if Team West has no players?")
        return false
    end
    checkResult = playerCheckOnGame(teamEast, TEAM_EAST)
    if checkResult == CHECK_NOT_IN_FIELD then
        common.TalkNLS(npc,Character.say,
                        "Spielfeld verlassen! Mannschaft West gewinnt.",
                        "Touch! Team West wins.")
        lastWinner = TEAM_WEST
        world:gfx(globalvar.gfxSPLASH, posVictoryWest)
        return false
    elseif checkResult == CHECK_HIT then
        common.TalkNLS(npc,Character.say,
                        "Treffer! Mannschaft West gewinnt.",
                        "Hit! Team West wins.")
        lastWinner = TEAM_WEST
        world:gfx(globalvar.gfxSPLASH, posVictoryWest)
        return false
    end
    checkResult = playerCheckOnGame(teamWest, TEAM_WEST)
    if checkResult == CHECK_NOT_IN_FIELD then
        common.TalkNLS(npc,Character.say,
                        "Spielfeld verlassen! Mannschaft Ost gewinnt.",
                        "Touch! Team East wins.")
        lastWinner = TEAM_EAST
        world:gfx(globalvar.gfxSPLASH, posVictoryEast)
        return false
    elseif checkResult == CHECK_HIT then
        common.TalkNLS(npc,Character.say,
                        "Treffer! Mannschaft Ost gewinnt.",
                        "Hit! Team East wins.")
        lastWinner = TEAM_EAST
        world:gfx(globalvar.gfxSPLASH, posVictoryEast)
        return false
    end
    if spectatorInField() then
        common.TalkNLS(npc,Character.say,
                    "Abbruch! Das gibt's doch nicht! Zuschauer haben auf dem Spielfeld nichts zu suchen!",
                    "Abort! Get out of there! Spectators must stay off the game field!")
        lastWinner = TEAM_NO
        return false
    end
    return true
end

local function tellLastWinner(npc)
    if lastWinner == TEAM_EAST then
        common.TalkNLS(npc,Character.say,
                        "Mannschaft Ost hat das letzte Spiel gewonnen.",
                        "Team East won the last match.")
    elseif lastWinner == TEAM_WEST then
        common.TalkNLS(npc,Character.say,
                        "Mannschaft West hat das letzte Spiel gewonnen.",
                        "Team West won the last match.")
    else
        common.TalkNLS(npc,Character.say,
                        "Keine der Mannschaften hat das letzte Spiel gewonnen.",
                        "No team won the last match.")
    end
end

function M.useOnion(user, item)
    if item.id == ITEM_ID_ONION and item:getData("onionball") == "true" then
        common.InformNLS(user, "Du fasst die vergammelte Zwiebel an und entscheidest dich spontan, sie lieber nicht zu essen.",
                               "You touch the rotten onion and immediately decide not to eat it.")
        return true
    end
    return false
end

function M.moveOnion(user, sourceItem, targetItem)
    if sourceItem.id == ITEM_ID_ONION and sourceItem:getData("onionball") == "true" then
        local posX = tonumber(sourceItem.pos.x)
        local posY = tonumber(sourceItem.pos.y)
        local posZ = tonumber(sourceItem.pos.z)
        if posX > borderN or posX < borderS or posY > borderE or posY < borderW or posZ ~= GAME_LEVEL_Z then
            common.InformNLS(user, "Die vergammelte Zwiebel wird von deinen Fingern zerquetscht.",
                                   "You squash the rotten onion between your fingers.")
            world:erase(sourceItem,1)
            world:erase(targetItem,1)
            return true
        end
        posX = tonumber(targetItem.pos.x)
        posY = tonumber(targetItem.pos.y)
        posZ = tonumber(targetItem.pos.z)
        if posX > borderN or posX < borderS or posY > borderE or posY < borderW or posZ ~= GAME_LEVEL_Z then
            common.TalkNLS(user,Character.say, "#me lässt die vergammelte Zwiebel fallen und trifft sich selbst damit.",
                                               "#me loses hold of the rotten onion and it squashes against them.")
            world:erase(targetItem,1)
            local pos = user.pos
            itemOnion = world:createItemFromId(ITEM_ID_ONION, 1, pos, true, 333, {onionball="true",nameDe="Spielzwiebel",nameEn="Game Onion",descriptionDe="Die Zwiebel ist schon recht matschig und stinkt.",descriptionEn="The onion is quite pulpy and stinks.",lookatNoPrice=1,lookatNoWeight=1})
            return true
        end
        if user.pos.x > borderN or user.pos.x < borderS or user.pos.y > borderE or user.pos.y < borderW or user.pos.z ~= GAME_LEVEL_Z then
            common.InformNLS(user, "Ein Blick auf diese Zwiebel genügt und du entscheidest, dir lieber nicht die Finger schmutzig zu machen.",
                                   "You look at the onion and decide it is better not to dirty your hands with such a stinky item.")
            return true
        end
    end

    return false
end

function M.nextCycle(npc)
    local talkative = TALK_FREQUENCY_GAME_WITHOUT_SPECTATORS
    if isRunningGame then
        countGameTime = countGameTime + 1
        if isBallReleased then
            if countGameTime > GAME_CYCLE_TIME then
                if not checkGameRules(npc) then
                    endGame(npc)
                end
                countGameTime = 0
            else
                local spectators = tonumber(countSpectators())
                if spectators > 0 then
                    local talkative = TALK_FREQUENCY_GAME_WITH_SPECTATORS * spectators
                end
                if math.random(talkative) == 1 then
                    local textNo = math.random(#cycleTextGame)
                    common.TalkNLS(npc,Character.say,cycleTextGame[textNo][1],cycleTextGame[textNo][2])
                end
            end
        else
            if countGameTime > gameStartDelay then
                countGameTime = 0
                createBall(npc)
                return
            end
        end
    else
        if math.random(4000) == 1 then
            local textNo = math.random(#cycleText)
            common.TalkNLS(npc,Character.say,cycleText[textNo][1],cycleText[textNo][2])
        end
    end
    if not init[npc.id] then
        initNpc(npc)
    end
end

function M.useNPC(npc, user)
    M.receiveText(npc, nil, "help", user)
end

function M.receiveText(npc, ttype, text, user)
    if isRunningGame then
        if string.match(text, "[Ss]top") and isPlayer(user) then
            endGame(npc)
            common.TalkNLS(npc,Character.say,"Aufhören, wir machen eine Pause!","Stop, we have a break!")
            return
        end
    else
        if string.match(text, "[Ss]tart") then
            startGame(npc)
            return
        end
    end

    if not npc:isInRange(user, 2) then
        return
    end

    if not isRunningGame then
        if string.match(text, "[Ww]inner") or string.match(text, "[Gg]ewinn") then
            tellLastWinner(npc)
            return
        end
    end

    if string.match(text, "[Hh]elp") then
        user:inform("[Help] This NPC is Sepp Leaf, an onionball referee. Ask him to oversee a match. Keywords: start, stop, winner, rule")
        user:inform("[Help] How to play: Players have to stay in their respective match field. Call 'Start' and Sepp will provide a game onion. A hit or leaving the game field ends the match in favour of the other team.")
        return
    end
    
    if string.match(text, "[Hh]ilf") then
        user:inform("[Hilfe] Dieser NPC heißt Sepp Leaf. Er ist ein Zwiebelballschiedsrichter. Bitte ihn, ein Spiel zu pfeifen. Schlüsselwörter: start, stop, gewinner, regel")
        user:inform("[Hilfe] Spielablauf: Die Spieler stellen sich in den Spielfeldern auf. Auf 'Start' stellt Sepp eine Spielzwiebel bereit. Ein Treffer oder das Verlassen des Feldes beendet das Spiel zugunsten der anderen Mannschaft.")
        return
    end
    
    for i=1,#saidText do
        if string.match(string.lower(text), saidText[i][1]) then
            local answerId = saidText[i][2]
            local answerDe = npcTalk[answerId][2][math.random(1,#npcTalk[answerId][2])]
            local answerEn = npcTalk[answerId][3][math.random(1,#npcTalk[answerId][3])]
            if not common.IsNilOrEmpty(answerDe) and not common.IsNilOrEmpty(answerEn) then
                common.TalkNLS(npc, Character.say, answerDe, answerEn)
                return
            end
        end
    end
end

return M
