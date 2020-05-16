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

--  INSERT INTO npc (npc_type,npc_posx,npc_posy,npc_posz,npc_faceto,npc_is_healer,npc_name, npc_script,npc_sex,npc_hair,npc_beard,npc_hairred,npc_hairgreen,npc_hairblue,npc_skinred,npc_skingreen,npc_skinblue,npc_hairalpha,npc_skinalpha) VALUES(0,715,308,0,4,FALSE,'Erza','npc.hairdresser',1,7,0,238,118,0,245,180,137,255,255);

--[[Quest ID's
31,Target hairstyle
32,Natural hairstyle
33,Natural beardstyle
34,Natural haircolour
226,Time new hair colour disappear
227,Time new hair style disappear
228,Time new beard style disappear
229,Cooldown new or trimmed cut visible
230,Cooldown polished comb for lizards
231,Money to pay
232,Cooldown pay later
233,warning to pay
234,Time next hairdresser allowed
]]

local common = require("base.common")
local hair = require("base.hair")
local money = require("base.money")
local globalvar = require("base.globalvar")

local DYESHORT = 1
local DYELONG = 0
local NOT_FOR_LIZARD = false
local FOR_LIZARD_ONLY = true
local DECISION_NOTHING = 1
local DECISION_TAKETHIS = 2
local DECISION_TRIM = 3

local npcPosition = position(715,308,0)
local chairPos = position(715,309,0)

local globalHairdresserDialogOpen = false

local M = {}

local init = {}

local saidText = {}

local npcTalk = {
  --{{said},{answersDe},{answersEn}}
    {   {"hello","greet","hail","good day","good morning","good evening","good night","grüß","gruß","guten morgen","guten tag","guten abend","gute nacht","mahlzeit","tach","moin","mohltied","hiho","hallo","hey","greeb"},
        {"Grüßt euch!","Hallo wieder etwas gewachsen?","Hallo, lange nicht gesehen!"},
        {"Be greeted!","Hello my friend!","Hello, I haven't seen you for a while!"} },
    {   {"farewell","bye","fare well","see you","tschüß","tschüss","wiedersehen","gehab wohl","ciao","adieu","au revoir","farebba"},
        {"Auf Wiedersehen!","Man sieht sich!","Passt auf Eure Haare auf!"},
        {"Goodbye!","Goodbye and good luck!","Take care of your hair!"} },
    {   {"how are you","how feel","how do you do","wie geht","wie fühlst","wie ist es ergangen","wie befind"},
        {"Danke und Euch?","Ich kann nicht klagen aber Ihr solltest das.","Mir ging es nie besser."},
        {"Good, thank you, and yourself?","I can't complain, but you should.","Never better than today."} },
    {   {"your name","who are you","who art thou","ihr name","dein name","wer bist du","wer seid ihr","wie heißt"},
        {"Die schnellste Schere Illarions.","Meister der Haarkunst Erza, und Ihr?","Ich bin Erza."},
        {"The fastest scissors in Illarion.","Master of hair art, Erza, and you?","I am Erza."} },
    {   {"besser","better","improve"},
        {"Man kann immer besser aussehen. Man muss nur wollen.","Es gibt immer was abzuschneiden, packen wir es an.","Wer will schon bleiben wie er ist?"},
        {"You can always make yourself look better, if you want.","There is always something to cut. Let's start.","Do you really want to stay as you are?"} },
    {   {"god","gott","gött"},
        {"Wenn ich Euch unter meine Fittiche nehme, lächeln die Götter.","Die Götter werden Euch immer wiedererkennen, bei allen anderen bin ich mir nicht sicher.","Gleich hinter dem Haus findet Ihr Adrons Altar."},
        {"Be assured, as I work on you the gods will smile.","Gods will recognise you, however, I'm not that sure about everybody else.","Right behind the house is an altar to Adron."} },
    {   {"quest","task","mission","auftrag","aufgabe"},
        {"Ich vergebe keine Aufgaben.","Ich hätte eine unentwirrbare Aufgabe, aber die ist fest auf Eurem Kopf.","Nein ich habe für Euch nichts zu tun, außer still sitzen."},
        {"I don't have a quest for you.","There is an inextricable mission, but it is located on your head.","No I don't have a quest for you, but you could keep still."} },
    {   {"zahl","pay","coins","münze"},
        {"Pünktlich zahlen zahlt sich immer aus.","Nichts ist umsonst zu haben."},
        {"Paying on time always pays off.","There is nothing for free."} }
}

local cycleText = {
{"Schnapp, schnipp und ab!", "Snip snip here! Snip snip there! And a couple of tra-la-las!"},
{"#me schaut einen Vorbeigehenden an und ruft: 'Lange nicht mehr geschnitten, oder?'", "#me eyes a passerby and shouts, 'Get a haircut!'"},
{"#me bürstet ihre Schürze aus.", "#me brushes off her apron."},
{"#me pflückt Haare aus dem Kamm.", "#me plucks hairs from her comb."},
{"#me prüft die Schärfe ihrer Schere. ", "#me checks the blade of her scissors."},
{"#me schaut ihr Spiegelbild lächelnd an.", "#me smiles looking at her reflection."},
{"#me starrt auf eine Rasierklinge.", "#me stares at her razor."},
{"#me haucht den Spiegel an und putzt ihn mit dem Ärmel.", "#me exhales on her mirror, producing a damp mist and cleaning it with her sleeve."},
{"Haare schneiden fast im Vorbeigehen.", "Hair one moment. Gone the next!"},
{"Einige Krieger kommen und wollen 'Aim the for the flat-top'. Was immer das sein soll.", "Some warrior once told me, 'Aim the for the flat-top!' Whatever that means."},
{"Zeit Euch zu rasieren!?", "Time for a shave yes?"},
{"Oh Götter, da ist eine tote Ratte auf Eurem Kopf.", "Oh my gods! There's a dead rat on your head!."},
{"Ich schneid dem Nächsten die Kehle durch, der mir mit .. Oh Hallo, braucht Ihr eine Rasur?", "I'll kill the next fella that.. Oh hello there, care for a shave?"}
}

local function initNpc(npc)
    for i, textLine in pairs (npcTalk) do
        for _, said in pairs (textLine[1]) do
            table.insert(saidText, {said, i})
        end
    end
    npc:createAtPos(3, 849, 1) --dress
--    npc:createAtPos(9, 826, 1) --trousers
--    npc:createAtPos(0, 1415, 1) --hat
--    npc:createAtPos(11, 2384, 1) --coat
    npc:createAtPos(10, 369, 1) -- shoes
    init[npc.id] = true
end

--Definitions
local silver = 100
local gold = 100 * silver
local priceTrim = 10 * silver
local pricePolish = 10 * silver
local priceCut = 2 * gold
local priceShave = 2 * gold
local priceDyeShort = 1 * gold
local priceDyeLong = 4 * gold

local timeTrimVisible = 72 -- 6 h (5min cycles)
local timeCutVisible = 72 -- 6 h (5min cycles)
local timePolishVisible = 72 -- 6 h (5min cycles)
local igMonth = 8 * 86400
local timeWashOutShort = 2 * igMonth
local timeWashOutLong = 7 * igMonth
local timeWashOutProcess = 1 * igMonth
local timeBeardRevert = 8 * igMonth
local timeHairRevert = 8 * igMonth
local timeRevertWarning = 1 * igMonth
local timeAfterCheat = 16 * igMonth

local function canPayForWork(user,npc,priceWork)
    local germanMoney, englishMoney = money.MoneyToString(priceWork)

    if not money.CharHasMoney(user,priceWork) then --not enough money!
        common.TalkNLS(npc,Character.say, "Ihr habt nicht genug Geld dabei! Ihr benötigt"..germanMoney..".",
                                          "You don't have enough money with you! You'll need"..englishMoney..".")
        return false
    end
    user:setQuestProgress(231,priceWork) --save money
    return true
end

local function hasDebt(user,npc)
    local questState = user:getQuestProgress(231)
    local priceWork = tonumber(questState)
    local germanMoney, englishMoney = money.MoneyToString(priceWork)
    
    if user:getQuestProgress(234) > common.GetCurrentTimestamp() then
        common.TalkNLS(npc,Character.say, "Verschwinde!", "Leave now!")
        common.InformNLS(user,"Nachdem du versucht hast Erza zu betrügen, wird sie ein Jahr lang nicht für dich da sein.",
                              "Once you tried to cheat Erza, now she'll not serve you for one year.")
        return true
    end
    if user:getQuestProgress(233) ~= 0 and user:getQuestProgress(232) == 0 then
        return false
    end
    if priceWork > 0 then
        common.TalkNLS(npc,Character.say, "Zahlt erst mal Eure Schulden! Ihr schuldet mir"..germanMoney..".",
                                          "Pay your debt first! You owe me"..englishMoney..".")
        common.InformNLS(user,"Sage 'zahlen' um deine Schulden bei Erza zu begleichen.",
                              "Say 'pay' to pay back your debts to Erza.")
        return true
    end
    return false
end

function M.payErza(user)
    local questState = user:getQuestProgress(231)
    local priceWork = tonumber(questState)
    local germanMoney, englishMoney = money.MoneyToString(priceWork)

    globalHairdresserDialogOpen = false
    if priceWork == 0 then
        return
    elseif user:getQuestProgress(233) ~= 0 and user:getQuestProgress(232) == 0 then
        return
    else
        local npc=common.getNpc(npcPosition, 1, "Erza")
        if not money.CharHasMoney(user,priceWork) then --not enough money!
            if user:getQuestProgress(233) == 0 then --first warning
                common.TalkNLS(npc,Character.say, "Ich gebe Euch eine Stunde um hier mit dem Geld aufzutauchen! Ihr schuldet mir"..germanMoney..".",
                                                  "I!ll give you one hour to be here with the money! You owe me"..englishMoney..".")
                common.InformNLS(user,"Komme innerhalb von zwanzig Zwergenminuten zu Erza zurück und zahl deine Schulden. Du weißt, dass du die Konsequenzen nicht tragen willst.",
                                      "Come back to Erza and pay your debt within twenty dwarven minutes. You know you would not like the consequences.")
                user:setQuestProgress(232,5)
                user:setQuestProgress(233,1)
            elseif user:getQuestProgress(233) > 0 then
                common.TalkNLS(npc,Character.say, "Ich gab Euch eine Stunde um hier mit dem Geld aufzutauchen! Ihr schuldet mir noch immer"..germanMoney..".",
                                                  "I gave you one hour to be here with the money! You owe me"..englishMoney..".")
                common.InformNLS(user,"Du hast wirklich nicht mehr viel Zeit um Erza zu bezahlen.",
                                      "There is not much time left to pay Erza.")
            end
            return
        else
            money.TakeMoneyFromChar(user,priceWork) --take money
            user:setQuestProgress(231,0)
            user:setQuestProgress(232,0)
            if user:getQuestProgress(233) > 0 then
                common.TalkNLS(npc,Character.say, "Ihr habt Glück. Ich bin heute gnädig gestimmt.",
                                                  "You are n luck. I'm generous today.")
            else
                common.TalkNLS(npc,Character.say, "Vielen Dank. Kann ich noch etwas für Euch tun?",
                                                  "Thank you. Can I do anything else for you?")
            end
            user:setQuestProgress(233,0)
            
            common.InformNLS(user,"Du hast"..germanMoney.." bezahlt.", "You paid"..englishMoney..".")
            return
        end
    end
end

local function colorRgbFromQuest(hairColor)
    local r = math.floor(hairColor/1000000)
    local g = math.floor((hairColor - r*1000000)/1000)
    local b = math.floor(hairColor - r*1000000 - g*1000)
    return r, g, b
end

local function colorQuestDataFromRgb(r,g,b)
    local questData = r*1000000 + g*1000 + b
    return questData
end

local function payToLate(user,npc)
    local questState = user:getQuestProgress(231)
    local priceWork = tonumber(questState) * 2

    if user:getQuestProgress(233) ~= 0 and user:getQuestProgress(232) == 0 then
        local currentTime = common.GetCurrentTimestamp()
        money.TakeMoneyFromChar(user,priceWork)
        user:setQuestProgress(231, 0)
        user:setQuestProgress(233, 0)
        local timeEnd = currentTime + timeAfterCheat
        user:setQuestProgress(234, timeEnd)
        user:setQuestProgress(227, currentTime + timeHairRevert)
        user:setQuestProgress(229, 0)
        user:setHair(1)
        user:setHairColour(colour(30, 100, 170))
        user:setQuestProgress(31,colorQuestDataFromRgb(30, 100, 170))
        user:setQuestProgress(226,currentTime + timeWashOutShort)
        local currentHealth = user:increaseAttrib("hitpoints", 0) - 1
        user:increaseAttrib("hitpoints", - currentHealth)
        user:forceWarp(position(716,314,0))
        common.TalkNLS(npc,Character.say, "#me färbt und schneidet deine Haare bevor sie mit dem Rasiermesser deine Gurgel durchschneidet. 'Man betrügt mich nicht!'",
                                          "#me dyes and cuts your hair before she cuts your throat with her razor. 'I don't like a cheat!'")
        common.InformNLS(user,"Vielleicht wäre es doch besser gewesen, Erza zu bezahlen. Sie wird dich "..tostring(math.floor(timeAfterCheat/igMonth)).." Monate nicht bedienen.",
                              "Maybe it would have been better to pay Erza. She'll not serve your for "..tostring(math.floor(timeAfterCheat/igMonth)).." month.")
        return true
    else
        return false
    end
end

local function saveNaturalStyle(user)
    if user:getQuestProgress(32) == 0 and user:getQuestProgress(33) == 0 and user:getQuestProgress(34) == 0 then -- no natural hair color saved yet
        user:setQuestProgress(32,user:getHair())
        user:setQuestProgress(33,user:getBeard())
        local hairColour = user:getHairColour()
        local hairColourData = colorQuestDataFromRgb(hairColour.red, hairColour.green, hairColour.blue)
        user:setQuestProgress(34,hairColourData)
    end
end

local function helmetOff(user,npc)
    local helmItem = user:getItemAt(1)
    if helmItem.id == 0 then
        return true
    else
        common.TalkNLS(npc,Character.say, "Solange Ihr den Helm aufhabt, komme ich an nicht an Euren Kopf ran.",
                                          "I cannot touch your head as long as you wear a hat or a helmet.")
        return false
    end
end

local function userOnChair(user,npc)
    local userPos = user.pos
    
    if chairPos ~= userPos then
        common.TalkNLS(npc,Character.say, "Vielleicht setzt Ihr euch erst mal auf den Hocker hier.",
                                          "I can work on your hair if you sit down here on this stool.")
        return false
    end
    return true
end

local function isInTransformationEffekt(user)
    if user.effects:find(329) then
        common.HighInformNLS(user,"[Info] Solange ein Verwandlungstrank wirkt kann die Friseuse nichts tun.",
                                  "[Info] The hairdresser cannot do anything as long as a transformation potion is active.")
    end
end

local function permittedRace(user,npc,isForLizardOnly)
    local race = user:getRace()
    local permittedRaces = {
    globalvar.raceHUMAN,
    globalvar.raceDWARF,
    globalvar.raceHALFLING,
    globalvar.raceELF,
    globalvar.raceORC,
    globalvar.raceLIZARD
}

    if not common.isInList(race,permittedRaces)then
        common.TalkNLS(npc,Character.say, "Ich weiß echt nicht, wie ich das machen soll.",
                                          "I have no idea how I should do that.")
        return false
    end
    if race == globalvar.raceLIZARD and not isForLizardOnly then
        common.TalkNLS(npc,Character.say, "Ich werde Euren Kamm nicht färben oder schneiden. Aber vielleicht wollt ihr eine Politur.",
                                          "I won't cut or dye your ridge, but I could polish it.")
        return false
    end
    if race ~= globalvar.raceLIZARD and isForLizardOnly then
        common.TalkNLS(npc,Character.say, "Diesen Service biete ich nur für Echsenmenschen an.",
                                          "This service is for lizardmen only.")
        return false
    end
    return true
end

local function trimBeard(user,npc)
    local germanMoney, englishMoney = money.MoneyToString(priceTrim)
    money.TakeMoneyFromChar(user,priceTrim)
    user:setQuestProgress(231,0)
    common.TalkNLS(npc,Character.say, "#me rasiert den Bart mit viel Schaum und einem scharfen Messer.",
                                      "#me shaves the beard with a lot of foam and a sharp razor.")
    common.InformNLS(user,"Dein Kinn fühlt sich gut an. Für einige Stunden kann jeder sehen, dass du beim Friseur warst. Du bezahlst"..germanMoney..".",
                          "Your chin feels good. For some hours everybody can see you were at the hairdresser's. You pay"..englishMoney..".")
    user:setQuestProgress(229,timeTrimVisible)
end

local function shaveSelector(user,npc,firstCall,beardStyleStart,beardStyleEnd)
    local currentTime = common.GetCurrentTimestamp()
    local race = user:getRace()
    local beardTable = hair.beardStyles[race]
    local currentBeard
    local optionList = {}
    local selectedOption
    local dialogTitleText
    local dialogAddText

    globalHairdresserDialogOpen = true
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            user:setBeard(beardStyleStart)
            user:setQuestProgress(228,beardStyleEnd)
            user:setQuestProgress(231,0)
            globalHairdresserDialogOpen = false
            return
        end
        local selected = dialog:getSelectedIndex()
        if isInTransformationEffekt(user) then
            user:setBeard(beardStyleStart)
            user:setQuestProgress(228,beardStyleEnd)
            user:setQuestProgress(231,0)
            globalHairdresserDialogOpen = false
            return
        end
        selectedOption = optionList[selected+1]
        if selectedOption == DECISION_TAKETHIS then
            M.payErza(user)
            common.InformNLS(user,"Du hast eine neue Rasur bekommen. Diese wird ungefähr acht Monate halten. Für einige Zeit kann jeder sehen, dass du beim Friseur warst.",
                                  "You've got a new beard style. It will last for about eight months. For some time everybody can see your beard was freshly shaved.")
            return
        elseif selectedOption == DECISION_NOTHING then
            common.TalkNLS(npc,Character.say, "Richtig! Bleibt dabei. Dieser Stil passt genau zu Euch.",
                                              "You are right. Don't change. This style fits you perfectly.")
            globalHairdresserDialogOpen = false
            return
        elseif selectedOption == DECISION_TRIM then
            user:setBeard(beardStyleStart)
            user:setQuestProgress(228,beardStyleEnd)
            if canPayForWork(user,npc,priceTrim) then
                trimBeard(user,npc,beardStyleStart)
            end
            M.payErza(user)
            return
        else
            if not canPayForWork(user,npc,priceCut) and firstCall then
                globalHairdresserDialogOpen = false
                return
            end
            user:setQuestProgress(228,currentTime + timeBeardRevert)
            user:setQuestProgress(229,timeCutVisible)
            user:setQuestProgress(231,priceCut)
            user:setBeard(selectedOption-10)
            shaveSelector(user,npc,false,beardStyleStart,beardStyleEnd)
        end
    end

    local germanMoneyTrim, englishMoneyTrim = money.MoneyToString(priceTrim)
    local germanMoneyCut, englishMoneyCut = money.MoneyToString(priceCut)

    dialogTitleText = common.GetNLS(user,"Friseur","Hair dresser")
    if firstCall then
        dialogAddText = common.GetNLS(user, "Bitte wähle aus, welche Rasur du haben möchtest.",
                                            "Please select what beard style you wish to have.")
    else
        dialogAddText = common.GetNLS(user, "Gefällt dir die neue Rasur oder möchtest du eine andere?",
                                            "Do you like your new beard style, or would you like to try another one?")
    end
    
    dialogAddText = dialogAddText .. common.GetNLS(user,
                                                "\nNachschneiden:" .. germanMoneyTrim ..
                                                "\nNeue Rasur:" .. germanMoneyCut ..
                                                "\nDu kannst verschiedene Rasuren ausprobieren.",
                                                "\nTrim beard:" .. englishMoneyTrim ..
                                                "\nNew beard style:" .. englishMoneyCut ..
                                                "\nYou can try different styles.")
    local dialog = SelectionDialog(dialogTitleText, dialogAddText, callback)
    dialog:setCloseOnMove()
    currentBeard = user:getBeard()
    if not firstCall then
        dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keine neue Rasur.\nBitte nur "..beardTable[beardStyleStart].nameDe.." nachschneiden!",
                                                "Actually, I don't want a new beard style.\nPlease trim "..beardTable[beardStyleStart].nameEn.." only!"))
        table.insert(optionList,DECISION_TRIM)
        dialog:addOption(0, common.GetNLS(user, "Genau, ich möchte "..beardTable[currentBeard].nameDe.." haben!",
                                                "Yes, I want to have a "..beardTable[currentBeard].nameEn.."."))
        table.insert(optionList,DECISION_TAKETHIS)
    else
        dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keine neue Rasur.", "Actually, I don't want a new beard style."))
        table.insert(optionList,DECISION_NOTHING)
        dialog:addOption(0, common.GetNLS(user, "Nur nachschneiden!", "Just a trim!"))
        table.insert(optionList,DECISION_TRIM)
    end
    for i, _ in pairs(beardTable) do
        if i ~= currentBeard and i ~= beardStyleStart then
            dialog:addOption(0, common.GetNLS(user, "Zeige mir "..beardTable[i].nameDe.."!", "Try a "..beardTable[i].nameEn.."!"))
            table.insert(optionList,10+i)
        end
    end
    user:requestSelectionDialog(dialog)
end

local function shave(user, npc)
    saveNaturalStyle(user)

    local gender = user:increaseAttrib("sex", 0) + 1
    local race = user:getRace()
    
    if not permittedRace(user,npc,NOT_FOR_LIZARD) then
        return
    end

    if not userOnChair(user,npc) then
        return
    end

    if not helmetOff(user,npc) then
        return
    end

    if payToLate(user,npc) then
        return
    end

    -- if character is not human or dwarf, say something and deny service
    if gender == 1 and (race ~= 0 and race ~= 1) then
        common.TalkNLS(npc,Character.say, "Ich kann nichts schneiden, was nicht da ist.",
                                          "I can't cut something that isn't there.")
        return
    -- if character is female, deny service
    elseif gender ~= 1 then
        common.TalkNLS(npc,Character.say, "Ihr seid eine Frau. Frauen haben keinen Bart. Vielleicht Zwerginnen, aber den schneide ich nicht.",
                                          "You're a woman. Women don't have beards. Maybe a dwarfess does, but I won't cut those.")
        return
    end
    
    shaveSelector(user,npc,true,user:getBeard(),user:getQuestProgress(228))
end

local function hairColoringNewFromList(user,listId,timeWashOut)
    local currentTime = common.GetCurrentTimestamp()
    local r = hair.hairColorSimple[listId].r
    local g = hair.hairColorSimple[listId].g
    local b = hair.hairColorSimple[listId].b
    user:setHairColour(colour(r, g, b))
    user:setQuestProgress(31,colorQuestDataFromRgb(r,g,b))
    user:setQuestProgress(226,currentTime + timeWashOut)
end

local function hairColoringSelector(user,npc,firstCall,colorStart,colorEnd,colorTarget,dyeType,newColorId)
    local priceDye
    local textActionDe
    local textActionEn
    local durationMonth
    local timeWashOut
    local optionList = {}
    local selectedOption
    local dialogTitleText
    local dialogAddText

    if dyeType == DYESHORT then
        priceDye = priceDyeShort
        textActionDe = "kurzer"
        textActionEn = "short"
        timeWashOut = timeWashOutShort
    else
        priceDye = priceDyeLong
        textActionDe = "langer"
        textActionEn = "long"
        timeWashOut = timeWashOutLong
    end
    local germanMoney, englishMoney = money.MoneyToString(priceDye)
    durationMonth = math.floor(timeWashOut / igMonth)

    globalHairdresserDialogOpen = true
    local callback = function(dialog)
        if (not dialog:getSuccess()) then
            user:setHairColour(colour(colorStart.red, colorStart.green, colorStart.blue))
            user:setQuestProgress(226,colorEnd)
            user:setQuestProgress(31,colorTarget)
            user:setQuestProgress(231,0)
            globalHairdresserDialogOpen = false
            return
        end
        local selected = dialog:getSelectedIndex()
        if isInTransformationEffekt(user) then
            globalHairdresserDialogOpen = false
            return
        end
        selectedOption = optionList[selected+1]
        if selectedOption == DECISION_NOTHING then
            user:setHairColour(colour(colorStart.red, colorStart.green, colorStart.blue))
            user:setQuestProgress(226,colorEnd)
            user:setQuestProgress(31,colorTarget)
            user:setQuestProgress(231,0)
            globalHairdresserDialogOpen = false
            common.TalkNLS(npc,Character.say, "Genau, mit dieser Farbe seht Ihr am Besten aus.",
                                              "That's right. The old hair colour suits you best.")
            return
        elseif selectedOption == DECISION_TAKETHIS then
            M.payErza(user)
            common.InformNLS(user,"Du hast eine neue Haarfarbe bekommen. Diese wird mindestens "..tostring(durationMonth).." Monate halten.",
                                  "You've got a new hair colour. It will last for at least "..tostring(durationMonth).." month.")
            globalHairdresserDialogOpen = false
            return
        else
            if canPayForWork(user,npc,priceDye) then
                newColorId = selectedOption-10
                hairColoringNewFromList(user,newColorId,timeWashOut)
                hairColoringSelector(user,npc,false,colorStart,colorEnd,colorTarget,dyeType,newColorId)
            else
                if firstCall then
                    user:setQuestProgress(231,0)
                end
                M.payErza(user)
                globalHairdresserDialogOpen = false
                return
            end
            
        end
    end

    dialogTitleText = common.GetNLS(user,"Friseur","Hair dresser")
    if firstCall then
        dialogAddText = common.GetNLS(user, "Bitte wähle aus, welche Farbe du haben möchtest.",
                                            "Please select what hair colour you wish to have.")
    else
        dialogAddText = common.GetNLS(user, "Gefällt dir die neue Farbe oder möchtest du eine andere?",
                                            "Do you like your new hair colour, or would you like to try another one?")
    end
    
    dialogAddText = dialogAddText .. common.GetNLS(user,
                                                "\nFärben für " .. textActionDe .. " Wirkung kostet" .. germanMoney .."."..
                                                "\nDu kannst verschiedene Farben ausprobieren.",
                                                "\nDying with a " .. textActionEn .. " duration costs you" .. englishMoney .."."..
                                                "\nYou can try different colours.")
    local dialog = SelectionDialog(dialogTitleText, dialogAddText, callback)
    dialog:setCloseOnMove()
    optionList = {}
    dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keine neue Haarfarbe.", "Actually, I don't want a new hair colour."))
    table.insert (optionList,DECISION_NOTHING)
    if not firstCall then
        dialog:addOption(0, common.GetNLS(user, "Genau, die Farbe "..hair.hairColorSimple[newColorId].nameDe.." möchte ich haben.",
                                                "I want to have "..hair.hairColorSimple[newColorId].nameEn.." hair colour."))
        table.insert (optionList,DECISION_TAKETHIS)
    end
    local hairColour = user:getHairColour()
    local hairColourData = colorQuestDataFromRgb(hairColour.red, hairColour.green, hairColour.blue)
    local hairColourNewData
    for i, hairColorSimpleRow in pairs(hair.hairColorSimple) do
        hairColourNewData = colorQuestDataFromRgb(hairColorSimpleRow.r,hairColorSimpleRow.g,hairColorSimpleRow.b)
        if hairColourNewData ~= hairColourData then
            dialog:addOption(0, common.GetNLS(user,"zeige mir "..hairColorSimpleRow.nameDe.."!","Try "..hairColorSimpleRow.nameEn.."!"))
            table.insert (optionList,10+i)
        end
    end
    user:requestSelectionDialog(dialog)
end

local function hairColoring(user, npc)
    saveNaturalStyle(user)

    if not permittedRace(user,npc,NOT_FOR_LIZARD) then
        return
    end

    if not userOnChair(user,npc) then
        return
    end

    if not helmetOff(user,npc) then
        return
    end

    local germanMoneyShort, englishMoneyShort = money.MoneyToString(priceDyeShort)
    local germanMoneyLong, englishMoneyLong = money.MoneyToString(priceDyeLong)


    globalHairdresserDialogOpen = false
    local callback = function(dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        if isInTransformationEffekt(user) then
            return
        end
        if selected == 0 then
            common.TalkNLS(npc,Character.say, "Wie ihr wünscht. Lassen wir es, wie es ist, die Farbe steht Euch.",
                                              "As you wish. We will change nothing, that hair colour suits you.")
            globalHairdresserDialogOpen = false
            return
        elseif selected == 1 then
            hairColoringSelector(user,npc,true,user:getHairColour(),user:getQuestProgress(226),user:getQuestProgress(31),DYESHORT,0)
            globalHairdresserDialogOpen = false
        elseif selected == 2 then
            hairColoringSelector(user,npc,true,user:getHairColour(),user:getQuestProgress(226),user:getQuestProgress(31),DYELONG,0)
            globalHairdresserDialogOpen = false
        else
            if canPayForWork(user,npc,priceDyeShort) then
                money.TakeMoneyFromChar(user,priceDyeShort)
                user:setQuestProgress(231,0)
                local hairColor = user:getQuestProgress(34)
                local r, g, b = colorRgbFromQuest(hairColor)
                user:setHairColour(colour(r, g, b))
                user:setQuestProgress(226,0)
                common.TalkNLS(npc,Character.say, "#me wäscht die Haare und entfernt die Reste der Haarfarbe.",
                                                  "#me washes the hair and removes the residual hair colouring.")
                common.InformNLS(user,"Du hast wieder deine ursprüngliche Haarfarbe und bezahlst"..germanMoneyShort..".",
                                      "You have got your natural hair colour back and paid"..englishMoneyShort..".")
            end
            globalHairdresserDialogOpen = false
            return
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Friseur","Hair dresser"),
                                   common.GetNLS(user,
                                                "Bitte wähle aus, welche Farbe du haben möchtest." ..
                                                "\nKurz haltende Farbe (2 Monate):" .. germanMoneyShort ..
                                                "\nLang haltende Haarfarbe (7 Monate):" .. germanMoneyLong ..
                                                "\nZurück zur natürliche Farbe:" .. germanMoneyShort,
                                                "Please select what hair colour you wish to have." ..
                                                "\nShort term colour (2 month):" .. englishMoneyShort ..
                                                "\nLong term colour (7 month):" .. englishMoneyLong) ..
                                                "\nBack to natural colour:" .. englishMoneyShort, callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, common.GetNLS(user, "Ich möchte die Haare nicht färben lassen.", "I don't want to dye my hair."))
    dialog:addOption(0, common.GetNLS(user,"Kurzzeit Haarfarbe", "Short lasting hair colour"))
    dialog:addOption(0, common.GetNLS(user,"Lang haltende Haarfarbe", "Long lasting hair colour"))
    local hairColour = user:getHairColour()
    local hairColourData = colorQuestDataFromRgb(hairColour.red, hairColour.green, hairColour.blue)
    if hairColourData ~= user:getQuestProgress(34) then
        dialog:addOption(0, common.GetNLS(user,"Natürliche Haarfarbe", "Natural hair colour"))
    end
    user:requestSelectionDialog(dialog)
end

local function trimHair(user,npc,hairStyleStart)
    local germanMoney, englishMoney = money.MoneyToString(priceTrim)
    money.TakeMoneyFromChar(user,priceTrim)
    user:setQuestProgress(231,0)
    if hairStyleStart == 0 then
        common.TalkNLS(npc,Character.say, "#me poliert die Glatze mit weichen, gutriechenden Tüchern.",
                                          "#me polishes the bald head using a soft, scented cloth.")
    else
        common.TalkNLS(npc,Character.say, "#me stutzt und kämmt die Haare mit geübten Griffen.",
                                          "#me's skilled hands trim and comb the hair.")
    end
    common.InformNLS(user,"Dein Kopf fühlt sich gut an. Für einige Stunden kann jeder sehen, dass du beim Friseur warst. Du bezahlst"..germanMoney..".",
                          "Your head feels good. For some hours everybody can see you were at the hairdresser's. You pay"..englishMoney..".")
    user:setQuestProgress(229,timeTrimVisible)
end

local function haircutSelector(user,npc,firstCall,hairStyleStart,hairStyleEnd)
    local currentTime = common.GetCurrentTimestamp()
    local race = user:getRace()
    local gender = user:increaseAttrib("sex", 0)
    local hairTable = hair.hairStyles[race][gender]
    local currentHair
    local optionList = {}
    local selectedOption
    local dialogTitleText
    local dialogAddText

    globalHairdresserDialogOpen = true
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            user:setHair(hairStyleStart)
            user:setQuestProgress(227,hairStyleEnd)
            user:setQuestProgress(231,0)
            globalHairdresserDialogOpen = false
            return
        end
        local selected = dialog:getSelectedIndex()
        if isInTransformationEffekt(user) then
            user:setHair(hairStyleStart)
            user:setQuestProgress(227,hairStyleEnd)
            user:setQuestProgress(231,0)
            globalHairdresserDialogOpen = false
            return
        end
        selectedOption = optionList[selected+1]
        if selectedOption == DECISION_TAKETHIS then
            M.payErza(user)
            common.InformNLS(user,"Du hast einen neuen Haarschnitt bekommen. Dieser wird ungefähr acht Monate halten. Für einige Zeit kann jeder sehen, dass du beim Friseur warst.",
                                  "You've got a new haircut. It will last for about eight months. For some time everybody can see your hair was freshly cut.")
            return
        elseif selectedOption == DECISION_NOTHING then
            common.TalkNLS(npc,Character.say, "#me zuckt mit den Schultern. 'Wie ihr wünscht, lassen wir es wie es war.'",
                                              "#me shrugs: 'As you wish, we will leave it as it was.'")
            globalHairdresserDialogOpen = false
            return
        elseif selectedOption == DECISION_TRIM then
            user:setHair(hairStyleStart)
            user:setQuestProgress(227,hairStyleEnd)
            if canPayForWork(user,npc,priceTrim) then
                trimHair(user,npc,hairStyleStart)
            end
            M.payErza(user)
            return
        else
            if not canPayForWork(user,npc,priceCut) and firstCall then
                globalHairdresserDialogOpen = false
                return
            end
            user:setQuestProgress(227,currentTime + timeHairRevert)
            user:setQuestProgress(229,timeCutVisible)
            user:setQuestProgress(231,priceCut)
            user:setHair(selectedOption-10)
            haircutSelector(user,npc,false,hairStyleStart,hairStyleEnd)
        end
    end

    local germanMoneyTrim, englishMoneyTrim = money.MoneyToString(priceTrim)
    local germanMoneyCut, englishMoneyCut = money.MoneyToString(priceCut)

    dialogTitleText = common.GetNLS(user,"Friseur","Hair dresser")
    if firstCall then
        dialogAddText = common.GetNLS(user, "Bitte wähle aus, welche Frisur du haben möchtest.",
                                            "Please select what hair style you wish to have.")
    else
        dialogAddText = common.GetNLS(user, "Gefällt dir die neue Frisur oder möchtest du eine andere?.",
                                            "Do you like your new hair style, or would you like to try another one?")
    end
    
    dialogAddText = dialogAddText .. common.GetNLS(user,
                                                "\nNachschneiden:" .. germanMoneyTrim ..
                                                "\nNeue Frisur:" .. germanMoneyCut ..
                                                "\nDu kannst verschiedene Schnitte ausprobieren.",
                                                "\nTrim hair:" .. englishMoneyTrim ..
                                                "\nNew hair style:" .. englishMoneyCut ..
                                                "\nYou can try different styles.")
    local dialog = SelectionDialog(dialogTitleText, dialogAddText, callback)
    dialog:setCloseOnMove()
    currentHair = user:getHair()
    if not firstCall then
        dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keinen neuen Haarschnitt.\nBitte nur "..hairTable[hairStyleStart].nameDe.." nachschneiden!",
                                                "Actually, I don't want a new haircut.\nPlease trim "..hairTable[hairStyleStart].nameEn.." only!"))
        table.insert(optionList,DECISION_TRIM)
        dialog:addOption(0, common.GetNLS(user, "Genau, ich möchte "..hairTable[currentHair].nameDe.." haben!",
                                                "Yes, I want to have "..hairTable[currentHair].nameEn.."."))
        table.insert(optionList,DECISION_TAKETHIS)
    else
        dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keinen neuen Haarschnitt.", "Actually, I don't want a new haircut."))
        table.insert(optionList,DECISION_NOTHING)
        dialog:addOption(0, common.GetNLS(user, "Nur nachschneiden!", "Just a trim!"))
        table.insert(optionList,DECISION_TRIM)
    end
    for i, _ in pairs(hairTable) do
        if i ~= currentHair and i ~= hairStyleStart then
            dialog:addOption(0, common.GetNLS(user, "Zeige mir "..hairTable[i].nameDe.."!", "Try "..hairTable[i].nameEn.."!"))
            table.insert(optionList,10+i)
        end
    end
    user:requestSelectionDialog(dialog)
end

local function haircut(user, npc)
    saveNaturalStyle(user)

    if not permittedRace(user,npc,NOT_FOR_LIZARD) then
        return
    end

    if not userOnChair(user,npc) then
        return
    end

    if not helmetOff(user,npc) then
        return
    end

    if payToLate(user,npc) then
        return
    end

    haircutSelector(user,npc,true,user:getHair(),user:getQuestProgress(227))
end

local function combPolish(user,npc)

    if not permittedRace(user,npc,FOR_LIZARD_ONLY) then
        return
    end

    if not userOnChair(user,npc) then
        return
    end

    if not helmetOff(user,npc) then
        return
    end

    local germanMoney, englishMoney = money.MoneyToString(pricePolish)

    globalHairdresserDialogOpen = true
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        if isInTransformationEffekt(user) then
            return
        end
        if selected == 0 then
            return
        else
            if canPayForWork(user,npc,pricePolish) then
                money.TakeMoneyFromChar(user,priceTrim)
                user:setQuestProgress(231,0)
                user:setQuestProgress(230,timePolishVisible)
                common.TalkNLS(npc,Character.say, "#me poliert den Kamm mit weichen, gutriechenden Tüchern.",
                                                  "#me polishes the comb using a soft, scented cloth.")
                common.InformNLS(user,"Dein Kamm fühlt sich gut an und glänzt im Licht. Die Politur wird für einige Stunden für jeden sichtbar sein. Du zahlst"..germanMoney..".",
                                      "Your comb feels good and shines. For some hours everybody can appreciate that. You pay"..englishMoney..".")
            end
        end
        globalHairdresserDialogOpen = false
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Friseur","Hair dresser"),
                                   common.GetNLS(user,
                                                "Einmal Kamm polieren kostet" .. germanMoney .. ".",
                                                "Polishing your comb costs you" .. englishMoney) .. ".", callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, common.GetNLS(user, "Nein, ich möchte den Kamm nicht poliert haben.", "No, I don't want a comb polish."))
    dialog:addOption(0, common.GetNLS(user, "Ja, bitte einmal polieren.", "Yes, please polish the comb."))
    user:requestSelectionDialog(dialog)
end

--Banduk test for GM only, we let that in
local function testFunction(user,npc)
    if user:isAdmin() then
        local hairColour = user:getHairColour()
        user:inform(">current colour:" .. tostring(hairColour.red) .. "," .. tostring(hairColour.green) .. "," .. tostring(hairColour.blue))
        user:inform(">current hair :" .. tostring(user:getHair()))
        user:inform(">current beard:" .. tostring(user:getBeard()))
        user:inform(">current time :" .. tostring(common.GetCurrentTimestamp()))
        user:inform(">31 :"..tostring(user:getQuestProgress(31)).."     Target hair colour")
        user:inform(">32 :"..tostring(user:getQuestProgress(32)).."     Natural hairstyle")
        user:inform(">33 :"..tostring(user:getQuestProgress(33)).."     Natural beardstyle")
        user:inform(">34 :"..tostring(user:getQuestProgress(34)).."     Natural haircolour")
        user:inform(">226:"..tostring(user:getQuestProgress(226)).."     Time new hair colour disappear")
        user:inform(">227:"..tostring(user:getQuestProgress(227)).."     Time new hair style disappear")
        user:inform(">228:"..tostring(user:getQuestProgress(228)).."     Time new beard style disappear")
        user:inform(">229:"..tostring(user:getQuestProgress(229)).."     Cooldown new or trimmed cut visible")
        user:inform(">230:"..tostring(user:getQuestProgress(230)).."     Cooldown polished comb for lizards")
        user:inform(">231:"..tostring(user:getQuestProgress(231)).."     money to pay")
        user:inform(">232:"..tostring(user:getQuestProgress(232)).."     Cooldown for delayed payment")
        user:inform(">233:"..tostring(user:getQuestProgress(233)).."     Warnings for delayed payment")
        user:inform(">234:"..tostring(user:getQuestProgress(234)).."     Time next haircut possible")
    end
end

--Banduk test for admin, we let that in
local function testLogin(user,npc)
    if user:isAdmin() then
        M.hairOnLogin(user)
        common.InformNLS(user,">hair function on login performed.")
    end
end

function M.resetDialog()
    globalHairdresserDialogOpen = false
end

function M.hairOnLogin(user)
    local currentTime = common.GetCurrentTimestamp()
    saveNaturalStyle(user)

    local dayRemain
    
    local hairStyleTimeOut = user:getQuestProgress(227)
    if hairStyleTimeOut > 0 then
        if hairStyleTimeOut <= currentTime then
            user:setQuestProgress(227,0)
            local targetHair = user:getQuestProgress(32)
            user:setHair(targetHair)
            common.InformNLS(user,"[Friseur] Dein Haar hat wieder seinen natürlichen Stil.",
                                  "[Hairdresser] Over time your hair style has reverted back to normal.")
        elseif hairStyleTimeOut - timeRevertWarning <= currentTime then
            dayRemain = math.ceil((hairStyleTimeOut-currentTime)/86400)
            common.InformNLS(user,"[Friseur] In spätestens "..tostring(dayRemain)..(dayRemain == 1 and " Tag" or " Tagen").." wird die Frisur wieder natürlich aussehen.",
                                  "[Hairdresser] In at least "..tostring(dayRemain)..(dayRemain == 1 and " day" or " days").." your hair style becomes natural again.")
        end
    end
    
    local beardStyleTimeOut = user:getQuestProgress(228)
    if beardStyleTimeOut > 0 then
        if beardStyleTimeOut <= currentTime then
            user:setQuestProgress(228,0)
            local targetBeard = user:getQuestProgress(33)
            user:setBeard(targetBeard)
            common.InformNLS(user,"[Friseur] Dein Bart hat wieder seinen natürlichen Stil.",
                                  "[Hairdresser] Over time your beard style has reverted back to normal.")
        elseif beardStyleTimeOut - timeRevertWarning <= currentTime then
            dayRemain = math.ceil((beardStyleTimeOut-currentTime)/86400)
            common.InformNLS(user,"[Friseur] In spätestens "..tostring(dayRemain)..(dayRemain == 1 and " Tag" or " Tagen").." wird der Bart wieder natürlich aussehen.",
                                  "[Hairdresser] In at least "..tostring(dayRemain)..(dayRemain == 1 and " day" or " days").." your beard style becomes natural again.")
        end
    end
    
    local hairColorTimeOut = user:getQuestProgress(226)
    local hairColor
    local r, g, b
    if hairColorTimeOut > 0 then
        if hairColorTimeOut <= currentTime then
            user:setQuestProgress(226,0)
            hairColor = user:getQuestProgress(34)
            r, g, b = colorRgbFromQuest(hairColor)
            user:setHairColour(colour(r, g, b))
            common.InformNLS(user,"[Friseur] Dein Haar hat wieder seine natürliche Farbe.",
                                  "[Hairdresser] Over time your hair colour has reverted back to normal.")
        elseif hairColorTimeOut - timeWashOutProcess <= currentTime then
            hairColor = user:getQuestProgress(34)
            local r0, g0, b0 = colorRgbFromQuest(hairColor)
            hairColor = user:getQuestProgress(31)
            local r1, g1, b1 = colorRgbFromQuest(hairColor)
            local relationTime = (hairColorTimeOut-currentTime) / timeWashOutProcess
            r = r0 + relationTime * (r1 - r0)
            g = g0 + relationTime * (g1 - g0)
            b = b0 + relationTime * (b1 - b0)
            user:setHairColour(colour(r, g, b))
            dayRemain = math.ceil((hairColorTimeOut-currentTime)/86400)
            common.InformNLS(user,"[Friseur] In spätestens "..tostring(dayRemain)..(dayRemain == 1 and " Tag" or " Tagen").." wird die Farbe deines Haares wieder natürlich sein.",
                                  "[Hairdresser] In at least "..tostring(dayRemain)..(dayRemain == 1 and " day" or " days").." your hair colour becomes natural again.")
        end
    end
end

function M.useNPC(npc, user)
    M.receiveText(npc, nil, "help", user)
end

function M.receiveText(npc, ttype, text, user)
    if string.match(text, "test") then
        testFunction(user,npc)
        return
    end

    if not npc:isInRange(user, 2) then
        return
    end

    if not globalHairdresserDialogOpen then
        if string.match(text, "[Zz]ahl") or string.match(text, "[Pp]ay") or string.match(text, "[Ss]chuld") or string.match(text, "[Dd]ebt") then
            M.payErza(user)
            return
        end
        if hasDebt(user,npc) then
            return
        end
        if string.match(text, "[Cc]ut") or string.match(text, "[Ss]chneid") then
            haircut(user,npc)
            return
        elseif string.match(text, "[Ss]have") or string.match(text, "[Rr]asier") then
            shave(user,npc)
            return
        elseif string.match(text, "[Dd]ye") or string.match(text, "[Ff][aä]rb") then
            hairColoring(user,npc)
            return
        elseif string.match(text, "[Pp]olish") or string.match(text, "[Pp]olier") then
            combPolish(user,npc)
            return
        end
    end
    if string.match(text, "login") then
        testLogin(user,npc)
        return
    end
    if string.match(text, "[Hh]ilf") or string.match(text, "[Hh]elp") then
        common.InformNLS(user,"[Hilfe] Dieser NPC ist eine Friseuse. Bitte sie, dir die Haare oder den Bart zu machen. Schlüsselwörter: schneid, rasier, färb, polier, zahlen",
                              "[Help] This NPC is a hair dresser. Ask her to change your hair style (cut), beard style (shave) or hair colour (dye). Keywords: cut, shave, dye, polish, pay")
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

function M.nextCycle(npc)
    if math.random(4000) == 1 then
        local textNo = math.random(#cycleText)
        common.TalkNLS(npc,Character.say,cycleText[textNo][1],cycleText[textNo][2])
        if not world:isCharacterOnField(chairPos) then
            globalHairdresserDialogOpen = false
        end
    end
    if not init[npc.id] then
        initNpc(npc)
    end
end

return M
