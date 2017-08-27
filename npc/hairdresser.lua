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

--[[Quest ID's
31,Target haircolor
32,Natural hairstyle
33,Natural beardstyle
34,Natural haircolor
226,Time new hair color disappear
227,Time new hair style disappear
228,Time new beard style disappear
229,Cooldown new or trimed cut visible
230,Cooldown polished comb for lizzards
]]

local common = require("base.common")
local hair = require("base.hair")
local money = require("base.money")
local globalvar = require("base.globalvar")

local DYESHORT = 1
local DYELONG = 0
local NOT_FOR_LIZARD = false
local FOR_LIZARD_ONLY = true
local M = {}

local init = {}

local saidText = {
  --{said,answerId}
    {"hello",1},
    {"greet",1},
    {"hail",1},
    {"good day",1},
    {"good morning",1},
    {"good evening",1},
    {"good night",1},
    {"grüß",1},
    {"gruß",1},
    {"guten morgen",1},
    {"guten tag",1},
    {"guten abend",1},
    {"gute nacht",1},
    {"mahlzeit",1},
    {"tach",1},
    {"moin",1},
    {"mohltied",1},
    {"hiho",1},
    {"hallo",1},
    {"hey",1},
    {"greeb",1},
    {"farewell",2},
    {"bye",2},
    {"fare well",2},
    {"see you",2},
    {"tschüß",2},
    {"tschüss",2},
    {"wiedersehen",2},
    {"gehab wohl",2},
    {"ciao",2},
    {"adieu",2},
    {"au revoir",2},
    {"farebba",2},
    {"how are you",3},
    {"how feel",3},
    {"how do you do",3},
    {"wie geht",3},
    {"wie fühlst",3},
    {"wie ist es ergangen",3},
    {"wie befind",3},
    {"your name",4},
    {"who are you",4},
    {"who art thou",4},
    {"ihr name",4},
    {"dein name",4},
    {"wer bist du",4},
    {"wer seid ihr",4},
    {"wie heißt",4},
    {"besser",5},
    {"better",5},
    {"improve",5},
    {"god",6},
    {"gott",6},
    {"gött",6},
    {"quest",7},
    {"task",7},
    {"mission",7},
    {"auftrag",7},
    {"aufgabe",7}
}

local cycleText = {
{"Schnapp, schnipp und ab!", "Snip snip here! Snip snip there, and a couple of Tra La Las!"},
{"#me schaut einen Vorbeigehenden an und ruft: 'Lange nicht mehr geschnitten, oder?'", "#me eyes a passerby and shouts. 'Get a hair cut hippy!'"},
{"#me bürstet ihre Schürze aus.", "#me brushes off her apron."},
{"#me pflückt Haare aus dem Kamm.", "#me plucks hairs from her comb."},
{"#me prüft die Schärfe ihere Schere. ", "#me checks the edge of her scissors."},
{"#me schaut ihr Speigelbild lächelnd an.", "#me smiles looking at her reflection."},
{"#me starrt auf eine Rasierklinge.", "#me stares at her razor."},
{"#me haucht den Spiegel an und putzt ihn mit dem Ärmel.", "#me breaths on her mirror and cleans it with her sleeve."},
{"Haare schneiden fast im Vorbeigehen.", "Hair one moment. Gone the next!"},
{"Einige Krieger kommen und wollen 'Aim the for the flat-top'. Was immer das sein soll.", "Some Warrior once told me, 'Aim the for the flat-top.' Whatever that means."},
{"Zeit euch zu rasieren!?", "Time for a shave yes?!"},
{"Oh Götter, da ist eine tote Ratte auf eurem Kopf.", "Oh my gods! There's a dead rat on your head!."},
{"Ich schneid dem Nächsten die Kehle durch, der mir mit .. Oh Hallo, braucht ihr eine Rasur?", "I'll kill the next fella that.. Oh hello there care for a shave?"}
}

function M.nextCycle(npc)
    if math.random(4000) == 1 then
        local textNo = math.random(#cycleText)
        npc:talk(Character.say,cycleText[textNo][1],cycleText[textNo][2])
    end
    if not init[npc.id] then
        npc:createAtPos(3, 849, 1) --dress
        npc:createAtPos(10, 369, 1) -- feet
        init[npc.id] = true
    end
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


local function payForWork(user,npc,priceWork)
    local germanMoney, englishMoney = money.MoneyToString(priceWork)

    if not money.CharHasMoney(user,priceWork) then --not enough money!
        npc:talk(Character.say, "Ihr habt nicht genug Geld dabei! Ihr benötigt "..germanMoney..".",
                                "You don't have enough money with you! You'll need "..englishMoney..".")
        return false
    end
    money.TakeMoneyFromChar(user,priceWork) --take money
    npc:talk(Character.say, "Vielen Dank. Kann ich noch etwas für euch tun?",
                            "Thank you. Can I do anything else for you?")
    user:inform("Du hast "..germanMoney.." bezahlt.", "You paid "..englishMoney..".", Player.lowPriority)
    return true
end

local function payBack(user,priceBack,priceWork)
    moneyReturn = priceBack - priceWork
    if moneyReturn <= 0 then -- saefty grid
        return
    end
    local germanMoney, englishMoney = money.MoneyToString(priceWork)
    if moneyReturn == 0 then
        user:inform("Du bekommst dein Geld zurück.", "You get money back.")
    else
        user:inform("Du bekommst Geld zurück und hast nur "..germanMoney.." für Nachschneiden bezahlt.",
                    "You get money back and paid for a trim "..englishMoney.." only.")
    end
    money.GiveMoneyToChar(user,moneyReturn)
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
        npc:talk(Character.say, "Solange ihr den Helm aufhabt, komme ich an Euren Kopf nicht ran.",
                                "I cannot touch your head as long as you wear a helmet.")
        return false
    end
end

local function userOnChair(user,npc)
    local chairPos = position(715,309,0)
    local userPos = user.pos
    
    if chairPos ~= userPos then
        npc:talk(Character.say, "Vielleicht setzt ihr euch erst mal auf den Hocker hier.",
                                "I'll work on your hair if you sit down here on that stool.")
        return false
    end
    return true
end

local function isInTransformationEffekt(user)
    if user.effects:find(329) then
        user:inform("[Info] Solange ein Verwandlungstrank wirkt kann die Friseuse nichts tun.",
                    "[Info] The hairdresser cannot do anything as long as a transormation potion is active.", Player.highPriority)
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
        npc:talk(Character.say, "Ich weiß echt nicht, wie ich das machen soll.",
                                "I have no idea how I should do that.")
        return false
    end
    if race == globalvar.raceLIZARD and not isForLizardOnly then
        npc:talk(Character.say, "Ich werde Euren Kamm nicht färben oder schneiden. Aber vielleicht wollt ihr eine Politur.",
                                "I won't cut or dye your ridge. But I could polish it.")
        return false
    end
    if race ~= globalvar.raceLIZARD and isForLizardOnly then
        npc:talk(Character.say, "Diesen Service biete ich nur für Echsenmenschen an.",
                                "This service is for lizardmen only.")
        return false
    end
    return true
end

local function shaveSelector(user,npc,firstCall,beardStyleStart,beardStyleEnd)
    local currentTime = common.GetCurrentTimestamp()
    local race = user:getRace()

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
        elseif selected == 1 then
            npc:talk(Character.say, "Richtig! Bleibt dabei. Dieser Stil passt genau zu Euch.",
                                    "You are right. Don't change. This style perfectly fits you.")
            if not firstCall then
                user:setBeard(beardStyleStart)
                payBack(user,priceShave,priceTrim)
                user:setQuestProgress(228,beardStyleEnd)
                user:setQuestProgress(229,timeTrimVisible)
            end
            return
        elseif selected == 2 then
            if firstCall then
                if payForWork(user,npc,priceTrim) then
                    user:setQuestProgress(229,timeTrimVisible)
                end
            else
                user:setBeard(beardStyleStart)
                payBack(user,priceShave,priceTrim)
                user:setQuestProgress(228,beardStyleEnd)
                user:setQuestProgress(229,timeTrimVisible)
            end
            return
        else
            if firstCall then
                if payForWork(user,npc,priceShave) then
                    user:setQuestProgress(228,currentTime + timeBeardRevert)
                    user:setQuestProgress(229,timeCutVisible)
                    user:setBeard(hair.beardStyles[race][selected-2].id)
                else
                    return
                end
            else
                user:setQuestProgress(228,currentTime + timeBeardRevert)
                user:setQuestProgress(229,timeCutVisible)
                user:setBeard(hair.beardStyles[race][selected-2].id)
            end
            shaveSelector(user,npc,false,beardStyleStart,beardStyleEnd)
        end
    end

    local germanMoneyTrim, englishMoneyTrim = money.MoneyToString(priceTrim)
    local germanMoneyShave, englishMoneyShave = money.MoneyToString(priceShave)

    local dialog = SelectionDialog(common.GetNLS(user,"Friseur","Hair dresser"),
                                   common.GetNLS(user,
                                                "Bitte wähle aus, welche Barttyp du haben möchtest." ..
                                                "\nNachschneiden: " .. germanMoneyTrim ..
                                                "\nNeuer Bart: " .. germanMoneyShave ..
                                                "\nDu kannst verschiedene Stile ausprobieren. Wählst du keinen aus, bekommst du bie auf den Preis eines Nachschneidens alles Geld zurück",
                                                "Please select what beard style you wish to have." ..
                                                "\nTrim beard: " .. englishMoneyTrim ..
                                                "\nNew beard style: " .. englishMoneyShave) ..
                                                "\nYou can try different styles. Except the price of a trim you get your money back if you don't choose one.", callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, common.GetNLS(user, "Genau diesen jetzigen Bartstil möchte ich haben.", "I want to have this current beard style."))
    dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keinen neuen Bart.", "Actually I don't want a new beard."))
    dialog:addOption(0, common.GetNLS(user, "Nur nachschneiden", "Trim beard only"))
    local beardTable = hair.beardStyles[race]
    for i = 1, #beardTable do
        dialog:addOption(0, common.GetNLS(user, beardTable[i].nameDe, beardTable[i].nameEn))
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

    -- if character is not human or dwarf, say something and deny service
    if gender == 1 and (race ~= 0 and race ~= 1) then
        npc:talk(Character.say, "Ich kann nichts schneiden, was nicht da ist.",
                                "I can't cut something that isn't there.")
        return
    -- if character is female, deny service
    elseif gender ~= 1 then
        npc:talk(Character.say, "Ihr seid eine Frau. Frauen haben keinen Bart. Vielleicht Zwerginnen, aber den schneide ich nicht.",
                                "You're a woman. Women don't have beards. Maybe dwarfess but I won't cut those.")
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

local function hairColoringSelector(user,npc,firstCall,colorStart,colorEnd,colorTarget,dyeType)
    local priceDye
    local textActionDe
    local textActionEn
    local timeWashOut
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
    
    local callback = function(dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        if isInTransformationEffekt(user) then
            return
        end
        if selected == 0 then
            return
        elseif selected == 1 then
            if not firstCall then
                payBack(user,priceDye,0)
                user:setHairColour(colour(colorStart.red, colorStart.green, colorStart.blue))
                user:setQuestProgress(226,colorEnd)
                user:setQuestProgress(31,colorTarget)
            end
            npc:talk(Character.say, "Genau, mit dieser Farbe seht ihr am Besten aus.",
                                    "Exact my opinion. The old colour fits you best.")
            return
        else
            if firstCall then
                if payForWork(user,npc,priceDye) then
                    hairColoringNewFromList(user,selected-1,timeWashOut)
                else
                    return
                end
            else
                hairColoringNewFromList(user,selected-1,timeWashOut)
            end
            hairColoringSelector(user,npc,false,colorStart,colorEnd,colorTarget,dyeType)
        end
    end

    local germanMoney, englishMoney = money.MoneyToString(priceDye)

    local dialog = SelectionDialog(common.GetNLS(user,"Friseur","Hair dresser"),
                                   common.GetNLS(user,
                                                "Bitte wähle aus, welche Farbe du haben möchtest." ..
                                                "\nFärben für " .. textActionDe .. " Wirkung kostet " .. germanMoney,
                                                "Please select what hair color you wish to have." ..
                                                "\nDying with a " .. textActionEn .. " duration costs you " .. englishMoney), callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, common.GetNLS(user, "Genau die jetzige Farbe möchte ich haben.", "I want to have this current hair colour."))
    dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keine neue Haarfarbe.", "Actually I don't want a new hair colour."))
    for i = 1, #hair.hairColorSimple do
        dialog:addOption(0, common.GetNLS(user,hair.hairColorSimple[i].nameDe,hair.hairColorSimple[i].nameEn))
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

    local callback = function(dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        if isInTransformationEffekt(user) then
            return
        end
        if selected == 0 then
            npc:talk(Character.say, "Wie ihr wünscht. Lassen wir es, wie es ist, die Farbe steht Euch.",
                                    "As you want. We will change nothing, the colour fits you.")
            return
        elseif selected == 1 then
            if payForWork(user,npc,priceDyeShort) then
                local hairColor = user:getQuestProgress(34)
                local r, g, b = colorRgbFromQuest(hairColor)
                user:setHairColour(colour(r, g, b))
            end
            return
        elseif selected == 2 then
            hairColoringSelector(user,npc,true,user:getHairColour(),user:getQuestProgress(226),user:getQuestProgress(31),DYESHORT)
        else
            hairColoringSelector(user,npc,true,user:getHairColour(),user:getQuestProgress(226),user:getQuestProgress(31),DYELONG)
        end
    end

    local germanMoneyShort, englishMoneyShort = money.MoneyToString(priceDyeShort)
    local germanMoneyLong, englishMoneyLong = money.MoneyToString(priceDyeLong)

    local dialog = SelectionDialog(common.GetNLS(user,"Friseur","Hair dresser"),
                                   common.GetNLS(user,
                                                "Bitte wähle aus, welche Farbe du haben möchtest." ..
                                                "\nZurück zur natürliche Farbe: " .. germanMoneyShort ..
                                                "\nKurz haltende Farbe (2 Monate): " .. germanMoneyShort ..
                                                "\nLang haltende Haarfarbe (7 Monate): " .. germanMoneyLong,
                                                "Please select what hair color you wish to have." ..
                                                "\nBack to natural colour: " .. englishMoneyShort ..
                                                "\nShort term colour (2 month): " .. englishMoneyShort ..
                                                "\nLong term colour (7 month): " .. englishMoneyLong), callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, common.GetNLS(user, "Ich möchte die Haare nicht färben lassen.", "I don't want dyeing my hair."))
    dialog:addOption(0, common.GetNLS(user,"Natürliche Haarfarbe", "Natural hair color"))
    dialog:addOption(0, common.GetNLS(user,"Kurzzeit Haarfarbe", "Short lasting hair colour"))
    dialog:addOption(0, common.GetNLS(user,"Lang haltende Haarfarbe", "Long lasting hair colour"))
    user:requestSelectionDialog(dialog)
end

local function haircutSelector(user,npc,firstCall,hairStyleStart,hairStyleEnd)
    local currentTime = common.GetCurrentTimestamp()
    local race = user:getRace()
    local gender = user:increaseAttrib("sex", 0) + 1

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
        elseif selected == 1 then
            npc:talk(Character.say, "#me zuckt mit den Schultern. 'Wie ihr wünscht, lassen wir es wie es war.'",
                                    "#me shrugs: 'As you want. We let it as it was.'")
            if not firstCall then
                user:setHair(hairStyleStart)
                payBack(user,priceCut,priceTrim)
                user:setQuestProgress(227,hairStyleEnd)
                user:setQuestProgress(229,timeTrimVisible)
            end
            return
        elseif selected == 2 then
            if firstCall then
                if payForWork(user,npc,priceTrim) then
                    user:setQuestProgress(229,timeTrimVisible)
                end
            else
                user:setHair(hairStyleStart)
                payBack(user,priceCut,priceTrim)
                user:setQuestProgress(227,hairStyleEnd)
                user:setQuestProgress(229,timeTrimVisible)
            end
            return
        else
            if firstCall then
                if payForWork(user,npc,priceShave) then
                    user:setQuestProgress(227,currentTime + timeHairRevert)
                    user:setQuestProgress(229,timeCutVisible)
                    user:setHair(hair.hairStyles[race][gender][selected-2].id)
                else
                    return
                end
            else
                user:setQuestProgress(227,currentTime + timeHairRevert)
                user:setQuestProgress(229,timeCutVisible)
                user:setHair(hair.hairStyles[race][gender][selected-2].id)
            end
            haircutSelector(user,npc,false,hairStyleStart,hairStyleEnd)
        end
    end

    local germanMoneyTrim, englishMoneyTrim = money.MoneyToString(priceTrim)
    local germanMoneyCut, englishMoneyCut = money.MoneyToString(priceCut)

    local dialog = SelectionDialog(common.GetNLS(user,"Friseur","Hair dresser"),
                                   common.GetNLS(user,
                                                "Bitte wähle aus, welche Frisur du haben möchtest." ..
                                                "\nNachschneiden: " .. germanMoneyTrim ..
                                                "\nNeue Frisur: " .. germanMoneyCut ..
                                                "\nDu kannst verschiedene Schnitte ausprobieren. Wählst du keinen aus, bekommst du bie auf den Preis eines Nachschneidens alles Geld zurück",
                                                "Please select what hair style you wish to have." ..
                                                "\nTrim hair: " .. englishMoneyTrim ..
                                                "\nNew hair style: " .. englishMoneyCut ..
                                                "\nYou can try different styles. Except the price of a trim you get your money back if you don't choose one."), callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, common.GetNLS(user, "Genau diesen jetzigen Schnitt möchte ich haben.", "I want to have this current haircut."))
    dialog:addOption(0, common.GetNLS(user, "Ich möchte doch keinen neuen Haarschnitt.", "Actually I don't want a new haircut."))
    dialog:addOption(0, common.GetNLS(user, "Nur nachschneiden", "Trim hair only"))
    local hairTable = hair.hairStyles[race][gender]
    for i = 1, #hairTable do
        dialog:addOption(0, common.GetNLS(user, hairTable[i].nameDe, hairTable[i].nameEn))
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

    haircutSelector(user,npc,true,user:getHair(),user:getQuestProgress(227))
end

local function combPolish(user,npc)

    if not permittedRace(user,npc,FOR_LIZARD_ONLY) then
        return
    end

    if not userOnChair(user,npc) then
        return
    end

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
            if payForWork(user,npc,pricePolish) then
                user:setQuestProgress(230,timePolishVisible)
                npc:talk(Character.say, "#me poliert den Kamm mit weichen, gutriechenden Tüchern.",
                                        "#me polishes the comb using soft and well smelling cloth.")
                user:inform("Dein Kamm fühlt sich gut an und glänzt im Licht. Die Politur wird für einige Stunden für jeden sichtbar sein",
                            "Your comb feels well and shines. For some hours everybody can see that.")
            end
        end
    end

    local germanMoney, englishMoney = money.MoneyToString(pricePolish)

    local dialog = SelectionDialog(common.GetNLS(user,"Friseur","Hair dresser"),
                                   common.GetNLS(user,
                                                "Einmal Kamm polieren kostet " .. germanMoney .. ".",
                                                "Polishing your comb costs you " .. englishMoney) .. ".", callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, common.GetNLS(user, "Nein, ich möchte den Kamm nicht poliert haben.", "No I don't want a comb polish."))
    dialog:addOption(0, common.GetNLS(user, "Ja, bitte einmal polieren.", "Yes please polish the comb."))
    user:requestSelectionDialog(dialog)
end

--Banduk remove that once it is tested properly
local function testFunction(user,npc)
    if user:isAdmin() then
        local hairColour = user:getHairColour()
        user:inform(">current color:" .. tostring(hairColour.red) .. "," .. tostring(hairColour.green) .. "," .. tostring(hairColour.blue))
        user:inform(">current hair :" .. tostring(user:getHair()))
        user:inform(">current beard:" .. tostring(user:getBeard()))
        user:inform(">current time :" .. tostring(common.GetCurrentTimestamp()))
        user:inform(">31 :"..tostring(user:getQuestProgress(31)).."     Target hair color")
        user:inform(">32 :"..tostring(user:getQuestProgress(32)).."     Natural hairstyle")
        user:inform(">33 :"..tostring(user:getQuestProgress(33)).."     Natural beardstyle")
        user:inform(">34 :"..tostring(user:getQuestProgress(34)).."     Natural haircolor")
        user:inform(">226:"..tostring(user:getQuestProgress(226)).."     Time new hair color disappear")
        user:inform(">227:"..tostring(user:getQuestProgress(227)).."     Time new hair style disappear")
        user:inform(">228:"..tostring(user:getQuestProgress(228)).."     Time new beard style disappear")
        user:inform(">229:"..tostring(user:getQuestProgress(229)).."     Cooldown new or trimed cut visible")
        user:inform(">230:"..tostring(user:getQuestProgress(230)).."     Cooldown polished comb for lizzards")
    end
end

--Banduk remove that once it is tested properly
local function testLogin(user,npc)
    if user:isAdmin() then
        M.hairOnLogin(user)
        user:inform(">hair function on login performed.")
    end
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
            user:inform("[Friseur] Dein Haar hat wieder seinen natürlichen Stil.",
                        "[Hairdresser] Your hair style became natural again.")
        elseif hairStyleTimeOut - timeRevertWarning <= currentTime then
            dayRemain = math.ceil((hairStyleTimeOut-currentTime)/86400)
            user:inform("[Friseur] In spätestens "..tostring(dayRemain)..(dayRemain == 1 and " Tag" or " Tagen").." wird die Frisur wieder natürlich aussehen.",
                        "[Hairdresser] In at least "..tostring(dayRemain)..(dayRemain == 1 and " day" or " days").." your hair style becomes natural again.")
        end
    end
    
    local beardStyleTimeOut = user:getQuestProgress(228)
    if beardStyleTimeOut > 0 then
        if beardStyleTimeOut <= currentTime then
            user:setQuestProgress(228,0)
            local targetBeard = user:getQuestProgress(33)
            user:setBeard(targetBeard)
            user:inform("[Friseur] Dein Bart wieder seinen natürlichen Stil.",
                        "[Hairdresser] Your beard style became natural again.")
        elseif beardStyleTimeOut - timeRevertWarning <= currentTime then
            dayRemain = math.ceil((beardStyleTimeOut-currentTime)/86400)
            user:inform("[Friseur] In spätestens "..tostring(dayRemain)..(dayRemain == 1 and " Tag" or " Tagen").." wird der Bart wieder natürlich aussehen.",
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
            user:inform("[Friseur] Dein Haar hat wieder seine natürliche Farbe.",
                        "[Hairdresser] Your hair color became natural again.")
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
            user:inform("[Friseur] In spätestens "..tostring(dayRemain)..(dayRemain == 1 and " Tag" or " Tagen").." wird die Farbe deines Haares wieder natürlich sein.",
                        "[Hairdresser] In at least "..tostring(dayRemain)..(dayRemain == 1 and " day" or " days").." your hair color becomes natural again.")
        end
    end
end

function M.useNPC(npc, user)
    M.receiveText(npc, nil, "help", user)
end

function M.receiveText(npc, ttype, text, user)


    
    local answeredText = {}
    answeredText[1] = {"Grüßt euch!","Hallo wieder etwas gewachsen?","Hallo, lange nicht gesehen!","Be greeted!","Hello my friend!","Hello, I haven't seen you for awhile!"}
    answeredText[2] = {"Auf Wiedersehen!","Man sieht sich!","Pass auf eure Haare auf!","Good Bye!","Goodbye and good luck!","Take care of your hair!"}
    answeredText[3] = {"Danke und euch?","Ich kann nicht klagen aber ihr solltest das.","Mir ging es nie besser.","Thank you, and yourself?","I can't complain, but you should.","Never better than today."}
    answeredText[4] = {"Die schnellste Scheere Illarions.","Meister der Haarkunst Ezra, und ihr?","Ich bin "..npc.name..".","The fastes scissors in Illarion.","Master of the art of hair, and you?","I am "..npc.name.."."}
    answeredText[5] = {"Man kann immer besser aussehen. Man muss nur wollen.","Es gibt immer was abzuschneiden, packen wir es an.","Wer will schon bleiben wie er ist?","You can always make yourself looking better, if you want.","There is always something to cut. Let's start.","Do you really want to stay as you are?"}
    answeredText[6] = {"Wenn ich euch unter meine Fitiche nehme, lächeln die Götter.","Die Götter werden euch immer wiedererkennen, bei allen anderen bin ich mir nicht sicher.","Gleich hinter dem haus findet ihr Adrons Altar.","Be assured as I work with you the Gods will smile.","Gods will recognize you however, I'm not that sure for everybody else.","Right behind the house is an altar of Adron."}
    answeredText[7] = {"Ich vergebe keine Aufgaben.","Ich hätte eine unentwirrbare Aufgabe, aber die ist fest auf Eurem Kopf.","Nein ich habe für Euch nichts zu tun, außer still sitzen.","I don't have a quest for you.","There is an inextricable mission. But this is located on your head.","No I don't have a quest for you but you could keep still."}
    
    if not npc:isInRange(user, 2) then
        return
    end

    if string.match(text, "[Hh]elp") then
        user:inform("[Help] This NPC is a hair dresser. Ask him for changing your hair style, beard style or hair color. Keywords: cut, shave, dye, polish")
        return
    end
    
    if string.match(text, "[Hh]ilf") then
        user:inform("[Hilfe] Dieser NPC ist ein Friseur. Bitte ihn dir die Haare zu machen. Schlüsselwörter: schneid, rasier, färb, polier")
        return
    end
    
    for i=1,#saidText do
        if string.match(string.lower(text), saidText[i][1]) then
            local answerId = saidText[i][2]
            local textSelection = math.random(1,3)
            if not common.IsNilOrEmpty(answeredText[answerId][textSelection]) and not common.IsNilOrEmpty(answeredText[answerId][textSelection+3]) then
                common.TalkNLS(npc, Character.say,
                        answeredText[answerId][textSelection],
                        answeredText[answerId][textSelection+3])
                return
            end
        end
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
    if string.match(text, "test") then
        testFunction(user,npc)
        return
    end
    if string.match(text, "login") then
        testLogin(user,npc)
        return
    end
end

return M
