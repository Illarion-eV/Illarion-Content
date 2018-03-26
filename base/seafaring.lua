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
local globalvar = require("base.globalvar")
local doors = require("base.doors")
local character = require("base.character")
local money = require("base.money")
local mob = require("base.mob")
local scheduledFunction = require("scheduled.scheduledFunction")
local monsterHooks = require("monster.base.hooks")

local M = {}

local harborList = {}
    harborList[1] = {nameDe="Cadomyr Hafen", nameEn="Cadomyr Harbour", targetDe="zum Hafen Cadomyr" ,pos=position(101,790,0),pict=2701,start=true}
    harborList[2] = {nameDe="Galmair Hafen", nameEn="Galmair Harbour", targetDe="zum Hafen Galmair", pos=position(451,95,0),pict=61,start=true}
    harborList[3] = {nameDe="Runewick Hafen", nameEn="Runewick Harbour", targetDe="zum Hafen Runewick", pos=position(727,809,0),pict=105,start=true}
    harborList[4] = {nameDe="Gasthof zur Hanfschlinge", nameEn="Hemp Necktie Inn", targetDe="zum Gasthof zur Hanfschlinge", pos=position(683,284,0),pict=155,start=true}
    harborList[5] = {nameDe="Cadomyr - Verlorener Hafen", nameEn="Cadomyr - Lost Harbour", targetDe="zum verlorenen Hafen Cadomyr", pos=position(105,833,0),pict=272,start=true}
    harborList[6] = {nameDe="Leuchtturm", nameEn="Lighthouse", targetDe="zum Leuchtturm", pos=position(554,658,0),pict=509,start=true}
    harborList[7] = {nameDe="Ostland Hafen", nameEn="Eastland Harbour", targetDe="zum Ostlandg Hafen", pos=position(888,485,0),pict=2760,start=true}
    harborList[8] = {nameDe="Nördlicher Hafen", nameEn="Northern Harbour", targetDe="zum Nördlichen Hafen", pos=position(870,285,0),pict=308,start=true}
    harborList[9] = {nameDe="Unüberwindbarer Limes", nameEn="Insurmountable Limes", targetDe="zum Unüberwindbaren Limes", pos=position(678,46,0),pict=474,start=true}
    harborList[10] = {nameDe="Nördliche Inseln - Ra", nameEn="Northern Islands - Ra", targetDe="zu der nördlichen Insel Ra", pos=position(364,49,0),pict=359,start=false}
    harborList[11] = {nameDe="Nördliche Inseln - Hept", nameEn="Northern Islands - Hept", targetDe="zu der nördlichen Insel Hept", pos=position(415,85,0),pict=360,start=false}
    harborList[12] = {nameDe="Nördliche Inseln - Yeg", nameEn="Northern Islands - Yeg", targetDe="zu der nördlichen Insel Yeg", pos=position(478,34,0),pict=372,start=false}
    harborList[13] = {nameDe="Nördliche Inseln - Sohl", nameEn="Northern Islands - Sohl", targetDe="zu der nördlichen Insel Sohl", pos=position(424,24,0),pict=1272,start=false}
    harborList[14] = {nameDe="Nördliche Inseln - Pen", nameEn="Northern Islands - Pen", targetDe="zu der nördlichen Insel Pen", pos=position(389,39,0),pict=467,start=false}

local PRICE_FERRY = 1000 --costs of one trip
local PRICE_PIRATES = 10000 -- pay the pirates
local CHANCE_ATTACK = 5
local chanceToFlee = 25
local attackDuration = 300 -- s until pitates must be killed
local attackLastWarning = 70 -- s before timeout Warning Backstab is sent
local rankPointLoss = 20


M.personalTarget = {}
M.attackEndTime = 0
local LAST_TARGET = 1
local LAST_SHIP = 2
local LAST_OVERBOARD = 3
M.lastTarget = LAST_TARGET

local piratesSpawnPos = {position(349,869,1),
                         position(349,873,1),
                         position(350,881,1),
                         position(352,884,1),
                         position(356,885,1),
                         position(359,882,1),
                         position(359,879,1),
                         position(359,871,1),
                         position(351,863,2),
                         position(355,862,2),
                         position(357,863,2)}
local pirateMobsHigh   = {1,5,6,10}
local pirateMobsMedium = {2,3,4}
local pirateMobsLow    = {7,8,9}
local fighterCapabilityLow = 30
local fighterCapabilityMedium = 70

local shipCenterPos = position(352,870,1)
local someShores = {{position(193,839,0),position(191,821,0)},--south Letma
                    {position(352,778,0),position(371,785,0)},--north Kantabi desert
                    {position(667,696,0),position(648,709,0)},--Oldras Altar
                    {position(733,601,0),position(722,588,0)},--3 sisters
                    {position(877,453,0),position(878,437,0)},--Elstree Forest
                    {position(878,399,0),position(877,380,0)},--Pauldron
                    {position(715,261,0),position(725,263,0)},--Hempty opposite
                    {position(664, 89,0),position(650, 97,0)},--Northern forest west
                    {position(851,177,0),position(847,199,0)}}--Northern forest east

local pirateDoors = {position(354,873,0),position(355,873,0)}

local function getSettingsForHarbor(harborId)
    local blockedOut = false
    local blockedIn = false
    local foundValue, blockedHarbors = ScriptVars:find("seafaringBlockOutgoing")
    if not foundValue then
        blockedHarbors = 0
    end
    if common.isBitSet(blockedHarbors, harborId) then
        blockedOut = true
    end
    local foundValue, blockedHarbors = ScriptVars:find("seafaringBlockIncoming")
    if not foundValue then
        blockedHarbors = 0
    end
    if common.isBitSet(blockedHarbors, harborId) then
        blockedIn = true
    end
    return blockedOut, blockedIn
end

local function blockText(user,blockedOut, blockedIn)
    local text
    if blockedOut and blockedIn then
        text = common.GetNLS(user,"gesperrt","blocked")
    elseif blockedOut then
        text = common.GetNLS(user,"nur ankommende Schiffe","incoming ferry only")
    elseif blockedIn then
        text = common.GetNLS(user,"nur auslaufende Schiffe","outgoing ferry only")
    else
        text = common.GetNLS(user,"in Betrieb","operational")
    end
    return text
end

local function setInOut(harborId, state, variable)
    local foundValue, blockedHarbors = ScriptVars:find(variable)
    if not foundValue then
        blockedHarbors = 0
    end
    if state then
        blockedHarbors = common.addBit(blockedHarbors,harborId)
    else
        blockedHarbors = common.removeBit(blockedHarbors,harborId)
    end
    ScriptVars:set(variable, blockedHarbors)
end

local function setOutgoing(harborId, state)
    setInOut(harborId, state, "seafaringBlockOutgoing")
end

local function setIncoming(harborId, state)
    setInOut(harborId, state, "seafaringBlockIncoming")
end

local function getFerryPrice()
    local foundValue, price = ScriptVars:find("seafaringPrice")
    if foundValue then
        return math.max(1, tonumber(price))
    end
    return PRICE_FERRY
end

local function setFerryPrice(price)
    ScriptVars:set("seafaringPrice", price)
end

local function getPiratePrice()
    local foundValue, price = ScriptVars:find("seafaringRansom")
    if foundValue then
        return math.max(1, tonumber(price))
    end
    return PRICE_PIRATES
end

local function setPiratePrice(price)
    ScriptVars:set("seafaringRansom", price)
end

local function getChancePirateAttack()
    local foundValue, chance = ScriptVars:find("seafaringChanceAttack")
    if foundValue then
        return math.max(0, tonumber(chance))
    end
    return CHANCE_ATTACK
end

local function setChancePirateAttack(chance)
    ScriptVars:set("seafaringChanceAttack", chance)
end

local function personsOnShip()
    return common.countPlayersInRangeOf(shipCenterPos, 30)
end

local function isPersonOnShip(user)
    if user:isInRangeToPosition(position(352,870,0), 30) or
       user:isInRangeToPosition(position(352,870,1), 30) or
       user:isInRangeToPosition(position(352,870,2), 30) then
        return true
    end
    return false
end

local function isPirateOnShip()
    local monsters = world:getMonstersInRangeOf(shipCenterPos, 30)
    for i,mon in ipairs(monsters) do
        return true
    end
    return false
end

local function portalForLeftOverRemove()
    while world:isItemOnField(position(355,864,2)) do
        local item = world:getItemOnField(position(355,864,2))
        world:erase(item, item.number)
    end
end

local function portalForLeftOverCreate()
    portalForLeftOverRemove()
    world:createItemFromId( 10, 1, position(355,864,2), true, 999, nil)
    local portal = world:getItemOnField(position(355,864,2))
    portal.id = 10
    portal.quality = 999
    portal.wear = 255
    local targetPos = common.getOneOutOfList(someShores)[1]
    portal:setData("destinationCoordsX",targetPos.x)
    portal:setData("destinationCoordsY",targetPos.y)
    portal:setData("destinationCoordsZ",targetPos.z)
    world:changeItem(portal)
end

local function informAllOnShip(msgDe,msgEn)
    for i, targetStruct in pairs (M.personalTarget) do
        local user = targetStruct[1]
        if isPersonOnShip(user) then
            common.InformNLS(user,msgDe,msgEn)
        end
    end
end

local function sendAllToTarget(msgDe,msgEn)
    for i, targetStruct in pairs (M.personalTarget) do
        local user = targetStruct[1]
        if isPersonOnShip(user) then
            user:warp(targetStruct[2])
            world:gfx(globalvar.gfxPLATSCH,user.pos)
            world:makeSound(9,user.pos)
            common.InformNLS(user,msgDe,msgEn)
            M.personalTarget[i]=nil
        end
    end
end

local function fellOverBoard(user)
    common.InformNLS(user,"Wo bist du? Du warst auf einem Schiff, bist über Bord gegangen und hier gelandet.",
                          "Where are you? You were on a ship, went over board and landed here.")
    local targetPos = common.getOneOutOfList(someShores)[1]
    user:warp(targetPos)
end

local function killAllPirates()
    local monsters = world:getMonstersInRangeOf(shipCenterPos, 30)
    for _, monster in ipairs(monsters) do
        monsterHooks.setForcedDeath(monster)
        monsterHooks.setNoDrop(monster)
        monster:increaseAttrib("hitpoints", -10000)
        monsterHooks.cleanHooks(monster)
    end
end

local function isBackstabDoorOpen()
    for d=1,2 do
        local checkDoor = world:getItemOnField(pirateDoors[d])
        if checkDoor.id == 3318 then
            return true
        end
    end
    return false
end

local function closeBackstabDoors()
    for d=1,2 do
        local checkDoor = world:getItemOnField(pirateDoors[d])
        if checkDoor.id == 3318 then
            world:swap(checkDoor,3314,233)
        end
    end
end

local function piratesRule()
    informAllOnShip("Malachín war wohl mit den Piraten. Sie sind in der Lage das Schiff zu überrennen und setzen alle Anwesenden ihrem Glück mit Cherga aus. Wird Cherga Gnade haben?",
                    "Malachín was obviously with the pirates. They overrun the ship and all passenger have to face Cherga. Will Cherga have mercy on you?")
    local players = world:getPlayersInRangeOf(shipCenterPos, 30); --get all player on ship
    for i, targetStruct in pairs (M.personalTarget) do
        local user = targetStruct[1]
        if isPersonOnShip(user) then
            character.DeathAfterTime(user,math.random(10,30),0,27,true)
        end
    end
    portalForLeftOverCreate()
    closeBackstabDoors()
    killAllPirates()
    M.lastTarget = LAST_OVERBOARD
end

local function georgeBackstabRocks()
    informAllOnShip("George Backstab stürmt die Stufen hinauf und schmeißt alle, Piraten und Reisende über Bord. Du erreichst eine Küste. Sei vorsichtig, auch die Piraten haben die Küste erreicht.",
                    "George Backstab storms up the stairs and throws all the pirates and passengers over the ship's rail. You reach a shore. Be carefully, the pirates might be nearby.")
    local targetShore = common.getOneOutOfList(someShores)
    local players = world:getPlayersInRangeOf(shipCenterPos, 30); --get all player on ship
    for i, player in pairs (players) do
            player:warp(targetShore[1])
            world:gfx(globalvar.gfxPLATSCH,player.pos)
    end
    local monsters = world:getMonstersInRangeOf(shipCenterPos, 30); --get all pirates on ship
    for i, monster in pairs (monsters) do
            monster:warp(targetShore[2])
            world:gfx(globalvar.gfxPLATSCH,monster.pos)
    end
    portalForLeftOverCreate()
    closeBackstabDoors()
    M.lastTarget = LAST_OVERBOARD
end
local function underAttack()
            world:gfx(11,shipCenterPos)
    local currentTime = common.GetCurrentTimestamp()
    if isPirateOnShip() then
        if isBackstabDoorOpen() then
            georgeBackstabRocks()
            return
        elseif currentTime > M.attackEndTime then
            piratesRule()
            return
        elseif (currentTime > M.attackEndTime - attackLastWarning) and not M.attackWarningSaid then
            informAllOnShip("[Hinweis] Es ist nur noch eine Minute übrig, das Schiff von den Piraten zu säubern. Vielleicht sollte doch die Hilfe des rabiaten George Backstab in Anspruch genommen werden. Hierzu einfach die Verliestür unten im Schiffsbauch öffnen.",
                            "[Hint] There is only one minute left to clear the boat of pirates. You should probably consider using the brutally help of George Backstab. Just open the door down in the ship's hold.")
            M.attackWarningSaid = true
        end
        scheduledFunction.registerFunction(5, function() underAttack() end)
    else
        sendAllToTarget("Nachdem die Piratenmeute zurückgeschlagen werden konnte, wird das gewünschte Ziel sicher erreicht.",
                        "After all the pirates were pushed back, you reach your final destination safely.")
        portalForLeftOverCreate()
        M.lastTarget = LAST_TARGET
    end
end

local function piratesFight(user)
    informAllOnShip("Die Piraten erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?",
                    "The pirates reach the ship and draw their weapons. Which side will be supported by Malachín?")
    informAllOnShip("[Hinweis] Von nun an bleiben nur noch fünf Minuten über, um ein Scheitern und somit die Begegnung mit Cherga zu vermeiden. Unten im Schiffsbauch befindet sich Hilfe. Öffne die Tür für den Sträfling George Backstab und er wird das Schiff von den Piraten säubern. Aber bedenke, er ist nicht zimperlich.",
                    "[Hint] You have just five minutes left to avoid failure and thus a meeting with Cherga. There is help waiting for you downstairs in the ship's hold. Open the door to free the prisoner George Backstab and he will help you clear the ship of pirates. However, he was never demure.")

    local spawnPos = common.Shuffle(piratesSpawnPos)
    local partyMember = {}
    for _, member in pairs (M.personalTarget) do
        table.insert(partyMember, member[1])
    end
    local countParty, bestFighter, totalParty = mob.getPartyFightCapability(partyMember)
    local monsterMob
    if bestFighter < fighterCapabilityLow then
        monsterMob = pirateMobsLow[math.random(1,#pirateMobsLow)]
    elseif bestFighter < fighterCapabilityMedium then
        monsterMob = pirateMobsMedium[math.random(1,#pirateMobsMedium)]
    else
        monsterMob = pirateMobsHigh[math.random(1,#pirateMobsHigh)]
    end
    local monsterAmount = math.max(4, math.min(11,countParty*2+math.random(-2,2)))
    local monsterList = mob.getMonsters(monsterMob, monsterAmount)

    for p=1,monsterAmount do
        local enemy = monsterList[p]
        world:gfx(41,spawnPos[p])
        world:createMonster(enemy,spawnPos[p],0)
        world:makeSound(1,user.pos)
    end

    M.attackEndTime = common.GetCurrentTimestamp() + attackDuration
    M.attackWarningSaid = false
    scheduledFunction.registerFunction(5, function() underAttack() end)
end

local function piratesFlee(user)
    if math.random(1,100) <= chanceToFlee then
        sendAllToTarget("Die Bemühungen zahlen sich aus und die Flucht gelingt. Sicher wird das gewünschte Ziel erreicht.",
                        "Your effort is rewarded. You are able to flee successfully and reach your final destination safely.")
        portalForLeftOverCreate()
        M.lastTarget = LAST_TARGET
    else
        informAllOnShip("Oh nein, zu langsam für eine erfolgreiche Flucht!", "Oh no, too slow for a successful escape!")
        piratesFight(user)
        M.lastTarget = LAST_SHIP
    end
end

local function piratesPay(user)
    local pricePirates = getPiratePrice()
    local germanMoney, englishMoney = money.MoneyToString(pricePirates)
    if money.CharHasMoney(user,pricePirates) then
        money.TakeMoneyFromChar(user,pricePirates)
        common.TalkNLS(user,Character.say,"#me bezahlt" .. germanMoney .. " an die Piraten. Die Freibeuter verlassen daraufhin grölend das Schiff.",
                                          "#me pay" .. englishMoney .. " to the pirates. The wild gang left the ship chanting.")
        sendAllToTarget("Das Gold ist weg, aber dafür wird das gewünschte Ziel ohne Blessuren erreicht.",
                        "The gold is gone but in return you reach your final destination safely.")
        portalForLeftOverCreate()
        M.lastTarget = LAST_TARGET
    else
        informAllOnShip("Nein, das ist zu wenig Geld! Damit lassen sich die Piraten nicht bestechen.",
                        "No, that's not enough for bribing the pirates!")
        piratesFight(user)
        M.lastTarget = LAST_SHIP
    end
end

local function piratesAttack(user)
    local dialogTitle
    local dialogAddText
    local pricePirates = getPiratePrice()
    local germanMoney, englishMoney = money.MoneyToString(pricePirates)

    closeBackstabDoors()

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()
            if (selected == 0) then
                M.lastTarget = LAST_SHIP
                piratesFight(user)
            elseif (selected == 1) then
                piratesFlee(user)
            elseif (selected == 2) then
                piratesPay(user)
            end
        elseif isPersonOnShip(user) then
            piratesAttack(user)
        end
    end

    dialogTitle = common.GetNLS(user,"Piratenangriff","Pirates attack")
    dialogAddText = common.GetNLS(user,"Piraten nähern sich dem Schiff. Folgende Möglichkeiten stehen zur Wahl:",
                                       "Pirates are coming closer to your ship. You can choose between the following options:")
    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)

    dialog:addOption(1,common.GetNLS(user,"Kämpfe gegen die Piraten","Fight against the pirates"))
    dialog:addOption(53,common.GetNLS(user,"Fliehe vor den Piraten (25% Erfolgschance, ansonsten wartet der Kampf)",
                                           "Flee from the pirates (25% chance of success, otherwise you have to fight)"))
    dialog:addOption(61,common.GetNLS(user,"Zahle" .. germanMoney .. ", um verschont zu bleiben.",
                                           "Pay" .. englishMoney .. " in order to be spared"))
    user:requestSelectionDialog(dialog)

end

local function directTravel(user,harborId)
    common.InformNLS(user,"Du hast dich dazu entschlossen, " .. harborList[harborId].targetDe .. " zu reisen.",
                           "You have chosen to travel to " ..harborList[harborId].nameEn ..".")
    world:gfx(1,user.pos)
    world:makeSound(9,user.pos)
    user:warp(harborList[harborId].pos)
    world:gfx(globalvar.gfxPLATSCH,user.pos)
    world:makeSound(9,user.pos)
end

local function travelToShip(user)
    local pricePirates = getPiratePrice()
    local germanMoney, englishMoney = money.MoneyToString(pricePirates)

    common.InformNLS(user,"[Hinweis 1] Piraten nähern sich dem Schiff. Folgende Möglichkeiten stehen zur Wahl: Kämpfen, fliehen oder" .. germanMoney .. " zahlen.",
                            "[Information 1] Pirates are coming closer to your ship. You can choose between the following options: fight, flee or pay" .. englishMoney .. ".")
    common.InformNLS(user,"[Hinweis 2] Die Entscheidung liegt bei der Person, die für die Fähre bezahlt hat.", "[Information 2] The person who paid for the ferry trip decides.")
    world:gfx(1,user.pos)
    world:makeSound(9,user.pos)
    user:warp(shipCenterPos)
    world:gfx(globalvar.gfxPLATSCH,user.pos)
    world:makeSound(9,user.pos)
end

local function takePartInTravel(user, harborId)
    local dialogTitle
    local dialogAddText

    local callback = function(extDialog)

        local success = extDialog:getSuccess()
        if success then
            local selected = extDialog:getSelectedIndex()
            if  selected == 0 then
                if M.lastTarget == LAST_SHIP then
                    travelToShip(user)
                elseif M.lastTarget == LAST_TARGET then
                    directTravel(user,harborId)
                else -- overboard
                    fellOverBoard(user)
                end
            else
            end
        else
        end
    end

    dialogTitle = common.GetNLS(user,"Fähre","Ferry")
    dialogAddText = common.GetNLS(user,"Möchtest du in die Fähre " .. harborList[harborId].targetDe .. " einsteigen?",
                                       "Do you want to enter the ferry to " .. harborList[harborId].nameEn .. "?")
    local extDialog = SelectionDialog(dialogTitle, dialogAddText, callback)
    extDialog:setCloseOnMove()

    extDialog:addOption(harborList[harborId].pict, common.GetNLS(user,"Ja, ich möchte reisen!","Yes, I want to travel!"))
    extDialog:addOption(228, common.GetNLS(user,"Nein, ich will hier bleiben!","No, I want to stay here!"))
    user:requestSelectionDialog(extDialog)
end

local function travelToTarget(user, harborId, startPos)
    local limitChancePirateAttack = getChancePirateAttack()
    local facePirates = false
    if math.random(1,100) < limitChancePirateAttack and personsOnShip() == 0 then --Pirates!
        facePirates = true
    end

    local travelers = world:getPlayersInRangeOf(startPos, 5)
    for _, player in pairs(travelers) do
        if facePirates then
            M.personalTarget[player.id] = {player, harborList[harborId].pos}
        else
            M.personalTarget[player.id]=nil
        end
        if user.id ~= player.id then
            takePartInTravel(player, harborId)
        elseif facePirates then
            M.lastTarget = LAST_SHIP
            piratesAttack(user)
            travelToShip(user)
            portalForLeftOverRemove()
        else
            M.lastTarget = LAST_TARGET
            directTravel(user,harborId)
       end
    end

end

local function startFerry(user, sourceItem)
    local dialogTitle
    local dialogAddText
    local dialogOption

    local foundValue, blockedHarbors = ScriptVars:find("seafaringBlockIncoming")
    if not foundValue then
        blockedHarbors = 0
    end
    local priceFerry = getFerryPrice()
    local germanMoney, englishMoney = money.MoneyToString(priceFerry)

    common.TurnTo(user,sourceItem.pos)

    local callback = function(dialog)

        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()
            if dialogOption[selected+1][2] then
                if  money.CharHasMoney(user,priceFerry) then
                    money.TakeMoneyFromChar(user,priceFerry)
                    travelToTarget(user, dialogOption[selected+1][1],sourceItem.pos)
                else
                    common.InformNLS(user,"Du hast nicht genug Geld für diese Reise. Die Reise kostet" .. germanMoney .." für eine Überfahrt.",
                                           "You don't have enough money for this journey. The journey costs" .. englishMoney .." for one passage.")
                end
            else
                common.InformNLS(user,"Kein Schiffsführer ist bereit, diesen Hafen anzusteuern. Du wirst wohl den Landweg nehmen müssen.",
                                      "No sailor is willing to head for this port. You will probably have to walk.")
            end
        end
    end

    dialogTitle = common.GetNLS(user,"Fähre","Ferry")
    dialogAddText = common.GetNLS(user,"Eine Reise kostet" .. germanMoney .." für die ganze Gruppe. Wähle eine Ziel aus.",
                                       "A journey costs" .. englishMoney .." for the group. Choose a destination.")
    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)
    dialog:setCloseOnMove()

    dialogOption = {}
    for i, harbor in pairs(harborList) do
        if not common.isBitSet(blockedHarbors, i) and sourceItem.pos ~= harbor.pos then
            dialog:addOption(harbor.pict, common.GetNLS(user,harbor.nameDe,harbor.nameEn))
            table.insert(dialogOption,{i,true})
        elseif sourceItem.pos ~= harbor.pos then
            dialog:addOption(harbor.pict, common.GetNLS(user,harbor.nameDe .. " (keine Verbindung)",
                                                             harbor.nameEn .. " (no boats)"))
            table.insert(dialogOption,{i,false})
        end
    end
    user:requestSelectionDialog(dialog)
end

function M.ferryLookAt(user, sourceItem, lookAt)
    for i, harbor in pairs(harborList) do
        if sourceItem.pos == harbor.pos then
            local foundValue, blockedHarbors = ScriptVars:find("seafaringBlockOutgoing")
            if not foundValue then
                blockedHarbors = 0
            end
            lookAt.name = common.GetNLS(user,"Fähre","Ferry")
            if common.isBitSet(blockedHarbors, i) then
                lookAt.description = common.GetNLS(user,"Der Hafen ist verwaist. Hier wird so schnell keine Fähre vorbeikommen.",
                                                        "The port is deserted. Don't waste your time waiting for a ferry.")
            else
                local germanMoney, englishMoney = money.MoneyToString(getFerryPrice())
                lookAt.description = common.GetNLS(user,"Wer bei der nächsten Fahrt mit möchte, sollte sich schnellstens hier innerhalb von fünf Schritten sammeln. Die Fahrt kostet"..germanMoney.." für die ganze Gruppe.",
                                                        "Anyone who would like to join for the next trip should gather here within five steps. A trip costs"..englishMoney.." for the whole group.")
            end
            return true, lookAt
        end
    end
    return false
end

local function gmManageCostFerry(user)
    local dialogTitle
    local dialogAddText
    local priceFerry = getFerryPrice()
    local germanMoney, englishMoney = money.MoneyToString(priceFerry)
    local thisInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            local newPrice = tonumber(input)
            if newPrice ~= nil then
                if newPrice > 0 and newPrice <= 1000000 then --100 gold
                    setFerryPrice(newPrice)
                    germanMoney, englishMoney = money.MoneyToString(newPrice)
                    user:inform("The new ferry price is"..englishMoney.." .")
                    user:logAdmin("[Ferry] Ferry price changed to"..englishMoney.." .")
                    return
                end
                user:inform("The price for the ferry must be in between 1 Copper and 100 Gold")
            end
        end

    end
    dialogTitle = common.GetNLS(user,"Fähre - Einstellungen","Ferry - Settings")
    dialogAddText = common.GetNLS(user,"Preis einer Fährfahrt:"..englishMoney.." ("..tostring(priceFerry).." Kupfer)\nBitte neuen Preis in Kupferstücken angeben.",
                                       "Price of one trip:"..englishMoney.." ("..tostring(priceFerry).." copper)\nPlease enter new price in amount of copper.")

    user:requestInputDialog(InputDialog(dialogTitle, dialogAddText ,false, 255, thisInputDialog))
end

local function gmManageCostPirate(user)
    local dialogTitle
    local dialogAddText
    local pricePirates = getPiratePrice()
    local germanMoney, englishMoney = money.MoneyToString(pricePirates)
    local thisInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            local newPrice = tonumber(input)
            if newPrice ~= nil then
                if newPrice > 0 and newPrice <= 10000000 then --1000 gold
                    setPiratePrice(newPrice)
                    germanMoney, englishMoney = money.MoneyToString(newPrice)
                    user:inform("The ransom to the pirates is"..englishMoney.." .")
                    user:logAdmin("[Ferry] Ransom to pirates changed to"..englishMoney.." .")
                    return
                end
                user:inform("The price for the pirates must be in between 1 Copper and 1000 Gold")
            end
        end

    end
    dialogTitle = common.GetNLS(user,"Fähre - Einstellungen","Ferry - Settings")
    dialogAddText = common.GetNLS(user,"Lösegeld an die Piraten:"..englishMoney.." ("..tostring(pricePirates).." Kupfer)\nBitte neuen Preis in Kupferstücken angeben.",
                                       "Ransom to pay to the pirates:"..englishMoney.." ("..tostring(pricePirates).." copper)\nPlease enter new price in amount of copper.")

    user:requestInputDialog(InputDialog(dialogTitle, dialogAddText ,false, 255, thisInputDialog))
end

local function gmManageProbabilityPirates(user)
    local dialogTitle
    local dialogAddText
    local chancePirateAttack = getChancePirateAttack()
    local thisInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            local newChance = tonumber(input)
            if newChance ~= nil then
                if newChance >= 0 and newChance <= 101 then
                    setChancePirateAttack(newChance)
                    user:inform("The chance the pirates attack is"..tostring(newChance).."%.")
                    user:logAdmin("[Ferry] Chance the pirates attack changed to"..tostring(newChance).."%.")
                    return
                end
                user:inform("The chance the pirates attack must be in between 0 and 101 %")
            end
        end

    end
    dialogTitle = common.GetNLS(user,"Fähre - Einstellungen","Ferry - Settings")
    dialogAddText = common.GetNLS(user,"Wahrscheinlichkeit eines Piratenüberfalls: "..tostring(chancePirateAttack).." %)\nBitte neuen Wert in Prozent (0-101) angeben.",
                                       "Chance the pirates attack: "..tostring(chancePirateAttack).." %)\nPlease enter the new value in percent (0-101).")

    user:requestInputDialog(InputDialog(dialogTitle, dialogAddText ,false, 255, thisInputDialog))
end

local function gmManageBlockPort(user,harborId)
    local dialogTitle
    local dialogAddText
    local blockedOut
    local blockedIn

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        if (selected == 0 or selected == 2) and blockedOut then
            setOutgoing(harborId, false)
        elseif (selected == 1 or selected == 3) and not blockedOut then
            setOutgoing(harborId, true)
        end
        if (selected == 0 or selected == 1) and blockedIn then
            setIncoming(harborId, false)
        elseif (selected == 2 or selected == 3) and not blockedIn then
            setIncoming(harborId, true)
        end
    end
    blockedOut, blockedIn = getSettingsForHarbor(harborId)
    dialogTitle = common.GetNLS(user,"Fähre - Einstellungen","Ferry - Settings")
    dialogAddText = common.GetNLS(user,harborList[harborId].nameDe,harborList[harborId].nameEn) .. "\n" ..blockText(user,blockedOut, blockedIn)

    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)
    dialog:addOption(0, common.GetNLS(user,"Voll in Betrieb","Fully operational"))
    dialog:addOption(0, common.GetNLS(user,"Nur ankommender Verkehr","Incoming ferry only"))
    dialog:addOption(0, common.GetNLS(user,"Nur auslaufender Verkehr","Outgoing ferry only"))
    dialog:addOption(0, common.GetNLS(user,"Außer Betrieb","Out of operation"))
    user:requestSelectionDialog(dialog)
end

function M.gmManagePorts(user)
    local optionList = {}
    local dialogTitle
    local dialogAddText
    local blockedOut
    local blockedIn
    local germanMoney
    local englishMoney
    local SELECT_COST_FERRY = 10001
    local SELECT_COST_PIRATE = 10002
    local SELECT_PROPERTY_PIRATE = 10003

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        local selectedOption = optionList[selected+1]
        if selectedOption == SELECT_COST_FERRY then
            gmManageCostFerry(user)
        elseif selectedOption == SELECT_COST_PIRATE then
            gmManageCostPirate(user)
        elseif selectedOption == SELECT_PROPERTY_PIRATE then
            gmManageProbabilityPirates(user)
        else
            gmManageBlockPort(user,selectedOption)
        end
    end
    dialogTitle = common.GetNLS(user,"Fähre - Einstellungen","Ferry - Settings")
    dialogAddText = common.GetNLS(user,"Wähle die gewünsche Einstellung aus oder Fähre aua",
                                       "Select the property or the ferry.")
    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)
    germanMoney, englishMoney = money.MoneyToString(getFerryPrice())
    dialog:addOption(3077, common.GetNLS(user,"Kosten eine Fährfahrt ("..germanMoney..")","Costs one ferry trip("..englishMoney..")"))
    table.insert(optionList, SELECT_COST_FERRY)
    germanMoney, englishMoney = money.MoneyToString(getPiratePrice())
    dialog:addOption(61, common.GetNLS(user,"Lösegeld ("..germanMoney..")","Ramson ("..englishMoney..")"))
    table.insert(optionList, SELECT_COST_PIRATE)
    local chancePirateAttack = getChancePirateAttack()
    dialog:addOption(1, common.GetNLS(user,"Wahrscheilichkeit Piratenüberfall ("..tostring(chancePirateAttack).."%)","Probability pirate attack ("..tostring(chancePirateAttack).."%)"))
    table.insert(optionList, SELECT_PROPERTY_PIRATE)
    for i, harbor in pairs (harborList) do
        if not common.IsNilOrEmpty(harbor.nameDe) and not common.IsNilOrEmpty(harbor.nameEn) then
            blockedOut, blockedIn = getSettingsForHarbor(i)
            dialog:addOption(harbor.pict, common.GetNLS(user,harbor.nameDe,harbor.nameEn).." ("..blockText(user,blockedOut, blockedIn)..")")
            table.insert(optionList, i)
        end
    end
    user:requestSelectionDialog(dialog)
end

function M.login(user)
    if isPersonOnShip(user) then
        if isPirateOnShip() then
            common.InformNLS(user,"Piraten sind gerade dabei, das Schiff zu überrennen. Mitgefangen, mitgehangen! Deine Hilfe wäre nicht schlecht.",
                                  "Pirates are about to attack the ship. Cling together, swing together! Your help might be very appreciated.")
        else
            fellOverBoard(user)
        end
    end
end

function M.useFerry(user, sourceItem)
    for i, harbor in pairs(harborList) do
        if sourceItem.pos == harbor.pos then
            local foundValue, blockedHarbors = ScriptVars:find("seafaringBlockOutgoing")
            if not foundValue then
                blockedHarbors = 0
            end
            if not common.isBitSet(blockedHarbors, i) then
                startFerry(user, sourceItem)
            end
            return true
        end
    end
    return false
end

return M
