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
local licence = require("base.licence")
local gems = require("base.gems")
local gm_lectern = require("gm.gm_lectern")

local M = {}

local alchemyTool = Item.mortar

M.playerPotionStartQuest = 870 -- 870-900 reserved for bitwise storage of potion knowledge

M.playerInventedPotionList = {
    {id = 561, creator = "Amanda Brightrim", index = 1},
    {id = 319, creator = "Amanda Brightrim", index = 2},
    {id = 700, creator = "Yridia Anar", index = 3},
    {id = 562, creator = "Yet to  be invented", index = 4}
}

function M.logConsumption(user, potion)
    gm_lectern.logConsumption(user, potion)
end

function M.getAlchemyTool(user)
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == alchemyTool and common.isBroken(leftTool) == false then
        return leftTool
    elseif rightTool.id == alchemyTool and common.isBroken(rightTool) == false then
        return rightTool
    end

    return false
end

local function getGemBonus(user)
    local handItem = M.getAlchemyTool(user)
    if handItem ~= nil then
        return gems.getGemBonus(handItem)
    else
        return 0
    end
end

local plantList = {}
local function setPlantSubstance(id, plusSubstance, minusSubstance)
    plantList[id] = {plusSubstance, minusSubstance}
end

-- Fruits
setPlantSubstance(15,"","") --Apple
setPlantSubstance(80,"","") --Banana
setPlantSubstance(154,"","") --Hop
setPlantSubstance(200,"","") --Tomato
setPlantSubstance(201,"","") --Onion
setPlantSubstance(259,"","") --Grain
setPlantSubstance(290,"","") --Cabbage
setPlantSubstance(302,"","") --Cherries
setPlantSubstance(772,"","") --Tobacco
setPlantSubstance(778,"","") --Sugarcane
setPlantSubstance(1207,"","") --Orange
setPlantSubstance(2493,"","") --Carrots

-- Rare herbs
setPlantSubstance(138,"","Dracolin") --Night angels blossom
setPlantSubstance(146,"","Echolon") --Desert sky capsule
setPlantSubstance(152,"Echolon","") --Life root
setPlantSubstance(754,"","Caprazin") --Oneleaved fourberry
setPlantSubstance(755,"","Illidrium") --Fire root
setPlantSubstance(756,"Caprazin","") --pious berry
setPlantSubstance(757,"Dracolin","") --tybalt star
setPlantSubstance(758,"Adrazin","") --heart blood
setPlantSubstance(760,"","Fenolin") --ice leaf
setPlantSubstance(761,"Illidrium","") --rain weed
setPlantSubstance(762,"","Orcanol") --gold crack herb
setPlantSubstance(764,"","Adrazin") --dark moss
setPlantSubstance(765,"Hyperborelium","") --daydream
setPlantSubstance(766,"","Hyperborelium") --con blossom
setPlantSubstance(768,"Orcanol","") --wolverine fern
setPlantSubstance(769,"Fenolin","") --desert berry

-- Common herbs
setPlantSubstance(81,"Illidrium","Orcanol") --berries
setPlantSubstance(133,"Adrazin","Orcanol") --sun herb
setPlantSubstance(134,"Fenolin","Illidrium") --fourleafed oneberry
setPlantSubstance(135,"Fenolin","Adrazin") --yellow weed
setPlantSubstance(136,"Adrazin","Fenolin") --anger berry
setPlantSubstance(137,"Echolon","Illidrium") --flamegoblet blossom
setPlantSubstance(140,"Fenolin","Hyperborelium") --donf blade
setPlantSubstance(141,"Caprazin","Echolon") --black thistle
setPlantSubstance(142,"Hyperborelium","Dracolin") --sandberry
setPlantSubstance(143,"Illidrium","Dracolin") --red elder
setPlantSubstance(144,"Adrazin","Dracolin") --virgin's weed
setPlantSubstance(145,"Hyperborelium","Orcanol") --heath flower
setPlantSubstance(147,"Echolon","Adrazin") --blackberry
setPlantSubstance(148,"Echolon","Caprazin") --firnis blossom
setPlantSubstance(149,"Hyperborelium","Echolon") --fir tree sprout
setPlantSubstance(151,"Caprazin","Dracolin") --strawberry
setPlantSubstance(153,"Fenolin","Caprazin") --foot leaf
setPlantSubstance(155,"Illidrium","Echolon") --sibanac leaf
setPlantSubstance(156,"Orcanol","Adrazin") --steppe fern
setPlantSubstance(158,"Illidrium","Fenolin") --bulbsponge mushroom
setPlantSubstance(159,"Dracolin","Hyperborelium") --toadstool
setPlantSubstance(160,"Adrazin","Echolon") --red head
setPlantSubstance(161,"Orcanol","Hyperborelium") --herder's mushroom
setPlantSubstance(162,"Hyperborelium","Fenolin") --birth mushroom
setPlantSubstance(163,"Orcanol","Illidrium") --champignon
setPlantSubstance(199,"Caprazin","Orcanol") --tangerine
setPlantSubstance(388,"Caprazin","Fenolin") --grapes
setPlantSubstance(752,"Orcanol","Caprazin") --mandrake
setPlantSubstance(753,"Dracolin","Adrazin") --blue birdsberry
setPlantSubstance(759,"Dracolin","Illidrium") --nuts
setPlantSubstance(763,"Dracolin","Caprazin") --marsh flower
setPlantSubstance(767,"Echolon","Hyperborelium") --water blossom


function M.getPlantSubstance(id, User)
    if not plantList[id] then
        return false
    end
    local plus, minus
    if plantList[id][1] ~= nil then
        plus = plantList[id][1]
    end
    if plantList[id][2] ~= nil then
        minus = plantList[id][2]
    end
    return plus, minus
end

-- the list of possible potions effects
local potionsList = {}
local ingredientsList = {}
M.potionName = {}
local idList = {}


--- Set the effect of a potion
-- @param resultingEffect the resulting effect of the potion
-- @param ... the components effecting the potion one by one
local function setPotionEffect(resultingEffect, ...)
    local currentList = potionsList
    local args = table.pack(...)
    for i=1,args.n do
        if (currentList[args[i]] == nil) then
            currentList[args[i]] = {}
        end
        currentList = currentList[args[i]]
    end
    currentList[0] = resultingEffect
end

local function setPotionIngredients(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)
    if ingredientsList == nil then
        ingredientsList = {}
    end
    ingredientsList[effect] = {gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8}
end
-- setPotion(effect id, stock data, gemdust ,Herb1, Herb2, Herb3, Herb4, Herb5, Herb6, Herb7, Herb8)
-- every effect id is only used once!
-- gemdust is the id of the gemdust used. indirectly, the potion kind
-- stock data is the concentration of the active substances put together in the following order: Adrazin, Illidrium, Caprazin, Hyperborelium, Echolon, Dracolin, Orcanol, Fenolin
-- Herb1...Herb8 are optional. If you use only x Herbs and x < 8 just write false for the rest
-- Example: setPotion(15, 459, 95554553, 133, 15, 81, false, false, false, false, false)
-- for an better overview, we save the names in an own list
local function setPotion(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)
    table.insert(idList,effect)
    setPotionEffect(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)
    setPotionIngredients(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)
end

-- body liquid potions
M.potionName[10]    = {"Dragon Breath","Drachenatem"}
setPotion(10, 450, 58325631, 755, 755, 141, 141, 141, 146, false, false) -- done
-- body liquid end

-- bombs
M.potionName[301] = {"Small Explosion","Kleine Explosion"}
setPotion(301, 446, 34374416, 755, 755, 755, 146, 141 ,141, 141, 133)
M.potionName[302] = {"Medium Explosion","Mittlere Explosion"}
setPotion(302, 446, 44156426, 755, 755, 146, 146, 141 ,141, 141, 133)
M.potionName[304] = {"Big Explosion","Große Explosion"}
setPotion(304, 446, 22446419, 755, 146, 146, 146, 141 ,141, 141, 133) -- done
M.potionName[306] = {"Small Mana Annihilator","Kleiner Manaannihilator"}
setPotion(306, 446, 22856451, 138, 138, 138, 146, 134, 134, 134, 133)
M.potionName[307] = {"Medium Mana Annihilator","Mittlerer Manaannihilator"}
setPotion(307, 446, 21957432, 138, 138, 146, 146, 134, 134, 134, 133)
M.potionName[309] = {"Big Mana Annihilator","Großer Manaannihilator"}
setPotion(309, 446, 22955451, 138, 146, 146, 146, 134, 134, 134, 133)
M.potionName[311] = {"Small Nutrition Annihilator","Kleiner Nahrungsannihilator"}
setPotion(311, 446, 26843821, 754, 754, 754, 146, 135, 135, 135, 133)
M.potionName[312] = {"Medium Nutrition Annihilator","Mittlerer Nahrungsannihilator"}
setPotion(312, 446, 15873523, 754, 754, 146, 146, 135, 135, 135, 133)
M.potionName[314] = {"Big Nutrition Annihilator","Großer Nahrungsannihilator"}
setPotion(314, 446, 15783424, 754, 146, 146, 146, 135, 135, 135, 133)
M.potionName[316] = {"Small Slime Barrier","Kleine Schleimbarriere"}
setPotion(316, 446, 86386546, 140, 140, 140, 152, 146, false, false, false)
M.potionName[317] = {"Big Slime Barrier","Große Schleimbarriere"}
setPotion(317, 446, 76576456, 140, 140, 140, 140, 152, 152, 146, 146)
M.potionName[318] = {"Lennier's Dream","Lenniers Traum"}
setPotion(318, 446, 57932798, 765,146,146,146,148,15,151,764)
M.potionName[319] = {"Proto brew: Brightrim's demon skeleton weakener","Protogebräu: Brightrims Dämonenskelettschwächer"}
setPotion(319, 446, 48923699, 760, 146, 146, 146, 134, 134, 760, 752)
M.potionName[320] = {"Brightrim's demon skeleton weakener","Brightrims Dämonenskelettschwächer"}
-- bombs end

-- quality raiser
M.potionName[400] = {"Quality Raiser for Potions based on Emerald Powder","Qualitätsheber für Tränke auf Smaragdstaubbasis"}
setPotion(400, 448, 69487354, 763, 768, 133, 133, 133, false, false, false)
M.potionName[401] = {"Quality Raiser for Potions based on Ruby Powder","Qualitätsheber für Tränke auf Rubinstaubbasis"}
setPotion(401, 448, 64966357, 763, 758, 133, 133, 133, false, false, false)
M.potionName[402] = {"Quality Raiser for Potions based on Sapphire Powder","Qualitätsheber für Tränke auf Saphirstaubbasis"}
setPotion(402, 448, 62497378, 763, 146, 133, 133, 133, false, false, false)
M.potionName[403] = {"Quality Raiser for Potions based on Obsidian Powder","Qualitätsheber für Tränke auf Obsidianstaubbasis"}
setPotion(403, 448, 64489753, 763, 766, 133, 133, 133, false, false, false)
M.potionName[404] = {"Quality Raiser for Potions based on Amethyst Powder","Qualitätsheber für Tränke auf Amethyststaubbasis"}
setPotion(404, 448, 67645954, 763, 152, 133, 133, 133, false, false, false)
M.potionName[405] = {"Quality Raiser for Potions based on Topaz Powder","Qualitätsheber für Tränke auf Topasstaubbasis"}
setPotion(405, 448, 64873297, 763, 761, 133, 133, 133, false, false, false)
M.potionName[406] = {"Quality Raiser for Potions based on Diamond Powder","Qualitätsheber für Tränke auf Diamantstaubbasis"}
setPotion(406, 448, 64763659, 763, 756, 133, 133, 133, false, false, false)
-- quality raiser end

-- transformation potions
M.potionName[500] = {"Shape Shifter Male Human","Verwandler Männlicher Mensch"}
setPotion(500, 449, 64135842, 766, 161, 754, 752, false, false, false, false)
M.potionName[501] = {"Shape Shifter Female Human","Verwandler Weiblicher Mensch"}
setPotion(501, 449, 64135842, 766, 162, 754, 752, false, false, false, false)
M.potionName[510] = {"Shape Shifter Male Dwarf","Verwandler Männlicher Zwerg"}
setPotion(510, 449, 74385866, 766, 161, 762, 759, false, false, false, false)
M.potionName[511] = {"Shape Shifter Female Dwarf","Verwandler Weiblicher Zwerg"}
setPotion(511, 449, 74385866, 766, 162, 762, 759, false, false, false, false)
M.potionName[520] = {"Shape Shifter Male Halfling","Verwandler Männlicher Halbling"}
setPotion(520, 449, 84452136, 766, 161, 765, 151, false, false, false, false)
M.potionName[521] = {"Shape Shifter Female Halfling","Verwandler Weiblicher Halbling"}
setPotion(521, 449, 84452136, 766, 162, 765, 151, false, false, false, false)
M.potionName[530] = {"Shape Shifter Male Elf","Verwandler Männlicher Elf"}
setPotion(530, 449, 87372749, 766, 161, 756, 753, false, false, false, false)
M.potionName[531] = {"Shape Shifter Female Elf","Verwandler Weiblicher Elf"}
setPotion(531, 449, 87372749, 766, 162, 756, 753, false, false, false, false)
M.potionName[540] = {"Shape Shifter Male Orc","Verwandler Männlicher Ork"}
setPotion(540, 449, 63584498, 766, 161, 764, 763, false, false, false, false)
M.potionName[541] = {"Shape Shifter Female Orc","Verwandler Weiblicher Ork"}
setPotion(541, 449, 63584498, 766, 162, 764, 763, false, false, false, false)
M.potionName[550] = {"Shape Shifter Male Lizardman","Verwandler Männlicher Echsenmensch"}
setPotion(550, 449, 23417592, 766, 161, 760, 767, false, false, false, false)
M.potionName[551] = {"Shape Shifter Female Lizardman","Verwandler Weiblicher Echsenmensch"}
setPotion(551, 449, 23417592, 766, 162, 760, 767, false, false, false, false)
M.potionName[560] = {"Shape Shifter Dog","Verwandler Hund"}
setPotion(560, 449, 31397191, 766, 152, 81, 81, 762, false, false, false)
M.potionName[561] = {"Shape Shifter Spider","Verwandler Spinne"}
setPotion(561, 449, 71526316, 766, 155, 147, 147, 757, false, false, false)
M.potionName[562] = {"Proto brew: Druid's Escape", "Protogebräu: Druidenflucht"}
setPotion(562, 449, 96962638, 766, 764, 161, 161, 153, false, false, false)
M.potionName[563] = {"Druid's Escape", "Druidenflucht"}
-- transformation potions end

--language potions
M.potionName[600] = {"Language Potion Common Language","Sprachtrank Handelssprache"}
setPotion(600, 452, 26727482, 756, 765, 135, false, false, false, false, false)
M.potionName[601] = {"Language Potion Human Language","Sprachtrank Menschensprache"}
setPotion(601, 452, 28751379, 756, 765, 769, false, false, false, false, false)
M.potionName[602] = {"Language Potion Dwarf Language","Sprachtrank Zwergensprache"}
setPotion(602, 452, 23369487, 756, 765, 762, false, false, false, false, false)
M.potionName[603] = {"Language Potion Elf Language","Sprachtrank Elfensprache"}
setPotion(603, 452, 51397674, 756, 765, 138, false, false, false, false, false)
M.potionName[604] = {"Language Potion Lizard Language","Sprachtrank Echsensprache"}
setPotion(604, 452, 85612648, 756, 765, 761, false, false, false, false, false)
M.potionName[605] = {"Language Potion Orc Language","Sprachtrank Orksprache"}
setPotion(605, 452, 58641767, 756, 765, 764, false, false, false, false, false)
M.potionName[606] = {"Language Potion Halfling Language","Sprachtrank Halblingssprache"}
setPotion(606, 452, 56612824, 756, 765, 768, false, false, false, false, false)
M.potionName[607] = {"Language Potion Ancient Language","Sprachtrank Antike Sprache"}
setPotion(607, 452, 25796346, 756, 756, 765, 152, false, false, false, false)
-- language potions end

-- Salves start
local salveStart = 700
local salveEnd = 799

M.potionName[700] = {"Yridia's Rash and Skin Irritation ointment", "Yridias Salbe gegen Hautausschlag und Hautreizungen"}
setPotion(700, 451, 34885446, 153, 153, 153, 148, 145, false, false, false)

-- salve end


--- Get the effect of a potion
-- @param ... the components effecting the potion one by one
-- @return the resulting effect of the potion
local function getPotion(...)
    local currentList = potionsList
    local args = table.pack(...)
    for i=1,args.n do
        if (currentList[args[i]] == nil) then
            return 0
        end
        currentList = currentList[args[i]]
    end

    if (currentList[0] == nil) then
        return 0
    end
    return currentList[0]
end

function M.getIngredients(effectId)

    if ingredientsList[effectId] == nil then
        return
    else
        return ingredientsList[effectId]
    end
end

--stock,sapphire ,ruby,emerald,obsidian  ,amethyst,topaz,diamant
local gemDustList  = {"non",446      ,447 ,448    ,449       ,450     ,451  ,452}
local gemList      = {"non",284      ,46  ,45     ,283       ,197     ,198  ,285}
local cauldronList = {1012 ,1011     ,1016,1013   ,1009      ,1015    ,1018 ,1017}
M.bottleList   = {331  ,327      ,59  ,165    ,329       ,166     ,167  ,330}

--Qualitätsbezeichnungen
M.qListDe = {"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"}
M.qListEn = {"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"}

-- Liste der Wirkstoffnamen
M.wirkstoff = {}
M.wirkung_de = {}
M.wirkung_en = {}

M.wirkstoff[1] = "Adrazin"
M.wirkstoff[2] = "Illidrium"
M.wirkstoff[3] = "Caprazin"
M.wirkstoff[4] = "Hyperborelium"
M.wirkstoff[5] = "Echolon"
M.wirkstoff[6] = "Dracolin"
M.wirkstoff[7] = "Orcanol"
M.wirkstoff[8] = "Fenolin"

M.wirkung_de[1] = "gesättigte Anreicherung"
M.wirkung_de[2] = "eine sehr ausgeprägte Menge"
M.wirkung_de[3] = "merklich"
M.wirkung_de[4] = "schwache Konzentration"
M.wirkung_de[5] = "kein"
M.wirkung_de[6] = "geringe Mengen"
M.wirkung_de[7] = "etwas"
M.wirkung_de[8] = "konzentriertes"
M.wirkung_de[9] = "hoch toxisches"

M.wirkung_en[1] = "saturated solution"
M.wirkung_en[2] = "dominant marked"
M.wirkung_en[3] = "distinctive"
M.wirkung_en[4] = "slightly marked"
M.wirkung_en[5] = "no"
M.wirkung_en[6] = "slightly pronounced"
M.wirkung_en[7] = "enriched"
M.wirkung_en[8] = "dominant pronounced"
M.wirkung_en[9] = "highly toxic"

--Wirkungen auf Attribute
--Reihe 1
local attr_r1 = {}
local obererGrenzwert = {}

attr_r1[1] = "hitpoints"
obererGrenzwert[1] = 10000

attr_r1[2] = "body_height"
obererGrenzwert[2] = 84

attr_r1[3] = "foodlevel"
obererGrenzwert[3] = 50000

attr_r1[4] = "luck"
obererGrenzwert[4] = 100

attr_r1[5] = "attitude"
obererGrenzwert[5] = 100

attr_r1[6] = "poisonvalue"
obererGrenzwert[6] = 10000

attr_r1[7] = "mental capacity"
obererGrenzwert[7] = 2400

attr_r1[8] = "mana"
obererGrenzwert[8] = 10000

local taste = {}
taste[0] = {"fruchtig","herb"     ,"bitter"    ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"   ,"süß"}
taste[1] = {"fruity"  ,"tartly"   ,"bitter"    ,"putrefactive","sour"        ,"salty"  ,"hot"      ,"sweet"}

-- -------------------------------------------------------------------------------
function M.CheckAttrRow(User,dataZList)

    local retVal = true
    if dataZList[9] ~= 0 then
        retVal = false
    end
    return retVal
end
-- -------------------------------------------------------------------------------
function M.ImpactRow1(User,dataZList)

    for i=1,8 do

        if dataZList[i] < 4 then

            User:inform(dataZList[i].." Vor-Wirkung R1 : "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))
            User:setAttrib(attr_r1[i],(User:increaseAttrib(attr_r1[i],0)*(dataZList[i]*30/100)))
            User:inform("Nach-Wirkung R1: "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))

        elseif dataZList[i] > 5 then

            User:inform(dataZList[i].." Vor-Wirkung R1 : "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))
            local dasIstWirkung = math.floor(User:increaseAttrib(attr_r1[i],0)+(User:increaseAttrib(attr_r1[i],0)*(dataZList[i]-5)*10/100))

            if dasIstWirkung > obererGrenzwert[i] then
                dasIstWirkung = obererGrenzwert[i]
            end

            User:setAttrib(attr_r1[i],dasIstWirkung)
            User:inform("Nach-Wirkung R1: "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))
        end

    end
end
-- --------------------------------------------------------------------------------
function M.SplitData(User,theData)
    local myData
    local dataZList = {}
    for i=1,8 do
        myData = math.floor(theData/(10^(8-i)))
        myData = myData - (math.floor(myData/10))*10
        dataZList[i] = myData
    end
    return dataZList
end

function M.DataListToNumber(dataList)
    local theData = 0
    for i=1,8 do
        theData = theData + dataList[i]*10^(8-i)
    end
    return theData
end

function M.SubstanceDatasToList(theItem)
    local substanceList = {}
    for i=1,8 do
        local concentration = tonumber(theItem:getData(M.wirkstoff[i].."Concentration"))
        if concentration ~= nil then
            table.insert(substanceList,concentration)
        end
    end

    return substanceList
end

-- probably, works only with lists containing no other lists
-- todo: make it also possibel to check lists containing list(s)
function M.CheckListsIfEqual(ListOne,ListTwo)
    local check = true
    if #ListOne == #ListTwo then
        for i=1,#ListOne do
            if ListOne[i] ~= ListTwo[i] then
                check = false
                break
            end
        end
    else
        check = false
    end
    return check
end


function M.generateTasteMessage(Character,dataZList)
    local textDe = "Der Trank schmeckt "
    local textEn = "The potion tastes "
    local anyTaste = false

    local usedTastes = {}

    for i=1,8 do
        if dataZList[i] > 5 then
            if usedTastes[i]==nil or usedTastes[i]<dataZList[i] then
                usedTastes[i] = dataZList[i]
            end
            anyTaste = true
        elseif dataZList[i] < 5 then
            if usedTastes[9-i]==nil or usedTastes[9-i]<dataZList[i] then
                usedTastes[9-i] = dataZList[i]
            end
            anyTaste = true
        end
    end
    if not anyTaste then
        textDe = textDe .. "nach nichts."
        textEn = textEn .. "like nothing."
    else
        for i=1,8 do
            if usedTastes[i]~=nil then
                if usedTastes[i] > 8 or usedTastes[i] < 2 then
                    textDe = textDe .. "sehr "
                    textEn = textEn .. "very "
                elseif (usedTastes[i] < 7 and usedTastes[i] > 5) or (usedTastes[i] > 3 and usedTastes[i] < 5) then
                    textDe = textDe .. "etwas "
                    textEn = textEn .. "slightly "
                end
                textDe = textDe..taste[0][i]..", "
                textEn = textEn..taste[1][i]..", "
            end
        end
        textDe = string.sub(textDe, 0, -3)
        textDe = textDe.."."
        textEn = string.sub(textEn, 0, -3)
        textEn = textEn.."."
    end
    common.InformNLS(Character,textDe,textEn)
end

function M.CheckIfGemDust(itemId)
    local retVal
    for i,checkId in pairs(gemDustList) do
        if itemId == checkId then
            retVal = itemId
            break
        end
    end
    return retVal
end

local FOOD_NEEDED = 250

function M.checkFood(User)
    if not common.FitForHardWork(User, FOOD_NEEDED) then
        return false
    end
    return true
end

function M.lowerFood(User)
    common.GetHungry(User, FOOD_NEEDED)
end

function M.CheckIfPlant(itemId)
    if plantList[itemId] ~= nil or itemId == 157 then
        return true
    end
    return false
end

function M.CheckIfPotionBottle(SourceItem, User)
    local retVal
    for i,checkId in pairs(M.bottleList) do
        local theItem = SourceItem
        if theItem.id == checkId then
            retVal = theItem
            break
        end
    end
    return retVal
end

function M.GetCauldronInfront(User, Item)
    local retVal
    local item = common.GetFrontItem(User)
    if (item ~= nil) and (item.id >= 1008) and (item.id <= 1018) then
        retVal = item
    end
    return retVal
end

function M.CheckIfAlchemist(user, german, english)
    if (user:getMagicType() ~= 3) then
        user:inform(german, english)
        return false
    else
        return true
    end
end

function M.getBottleFromEffect(effectId)
    -- won't work with NORMAL primar and secundar attribute potins, since the both have 11111111 - 99999999 as a range for effect ids
    if (effectId >= 1) and (effectId <= 99) then
        return 166
    elseif (effectId >= 100) and (effectId <= 199) then
        return 59
    elseif (effectId >= 200) and (effectId <= 299) then
        return 167
    elseif (effectId >= 300) and (effectId <= 399) then
        return 327
    elseif (effectId >= 400) and (effectId <= 499) then
        return 165
    elseif (effectId >= 500) and (effectId <= 599) then
        return 329
    elseif (effectId >= 600) and (effectId <= 699) then
        return 330
    end
    return
end

function M.RemoveEssenceBrew(Item)
    for i=1,8 do
        Item:setData("essenceHerb"..i,"")
    end
end

function M.RemoveStock(Item)
    for i=1,8 do
        Item:setData(M.wirkstoff[i].."Concentration","")
    end
end

function M.RemoveAll(Item)
    M.RemoveEssenceBrew(Item)
    M.RemoveStock(Item)
    Item:setData("creator","")
    Item:setData("potionEffectId","")
    Item:setData("potionQuality","")
    Item:setData("filledWith","")
    Item:setData("legitimateKnowledgeOfPotionRecipe", "")
    if (Item.id >= 1008) or (Item.id <= 1018) then
        Item.id = 1008
    else
        Item.id = 164
    end
end

local function checkBrewingPermissions(fromItem)

    local permitted = fromItem:getData("legitimateKnowledgeOfPotionRecipe")

    if permitted == "false" then
        return false
    end

    return true

end

function M.EmptyBottle(user, bottle)

    local emptyBottle = 164

    local texts = {german = "Die Flasche zerbricht.", english = "The bottle breaks."}

    if bottle.id == 3643 then   --salve jar instead of potion
        emptyBottle = 3642
        texts.german = "Der Salbentiegel zerbricht."
        texts.english = "The salve jar breaks."
    end

    if math.random(1,20) == 1 then

        world:erase(bottle,1) -- bottle breaks
        common.InformNLS(user, texts.german, texts.english, Player.lowPriority)

    elseif bottle.number > 1 then -- if we empty a bottle (stock, potion or essence brew) it should normally never be a stack! but to be one the safe side, we check anyway

        common.CreateItem(user, emptyBottle, 1, 333, nil)
        world:erase(bottle, 1)

    else

        M.RemoveAll(bottle)
        bottle.id = emptyBottle
        bottle.quality = 333
        world:changeItem(bottle)
    end
end

local function potionRequiresPermission(potionId)

    for _, potion in pairs(M.playerInventedPotionList) do
        if potion.id == potionId then
            return true
        end
    end

    return false
end

function M.FillFromTo(fromItem,toItem)
    -- copies all datas (and quality and id) from fromItem to toItem
    for i=1,8 do
        toItem:setData(M.wirkstoff[i].."Concentration",fromItem:getData(M.wirkstoff[i].."Concentration"))
        toItem:setData("essenceHerb"..i,fromItem:getData("essenceHerb"..i))
    end
    toItem:setData("creator",fromItem:getData("creator"))
    toItem:setData("filledWith",fromItem:getData("filledWith"))
    toItem:setData("potionEffectId",fromItem:getData("potionEffectId"))
    toItem:setData("legitimateKnowledgeOfPotionRecipe", fromItem:getData("legitimateKnowledgeOfPotionRecipe"))
    local quality = tonumber(fromItem:getData("potionQuality"))
    if quality == nil then
        quality = fromItem.quality
    end
    if toItem.id >= 1008 and toItem.id <= 1018 then
        toItem:setData("potionQuality",quality)
    else
        toItem.quality = quality
    end
    local _, reCauldron, reBottle
    if fromItem.id >= 1008 and fromItem.id <= 1018 then
        _, _, reCauldron, reBottle = M.GemDustBottleCauldron(nil, nil, fromItem.id, nil)
    else
        _, _, reCauldron, reBottle = M.GemDustBottleCauldron(nil, nil, nil, fromItem.id)
    end
    if toItem.id >= 1008 and toItem.id <= 1018 then
        toItem.id = reCauldron
    else

        if potionRequiresPermission(tonumber(fromItem:getData("potionEffectId"))) then
            local hasPermission = checkBrewingPermissions(fromItem)

            if not hasPermission then
                toItem:setData("potionEffectId", 0)
            end
        end

        if toItem.id == 3643 or toItem.id == 3642 then --account for salve jars
            reBottle = 3643
        end

        toItem.id = reBottle
    end
    world:changeItem(toItem)
end

local USER_EXPLOSION_LIST = {}

function M.CheckExplosionAndCleanList(User)
    local check = false
    if USER_EXPLOSION_LIST[User.id] == true then
        check = true
        USER_EXPLOSION_LIST[User.id] = nil
    end

    return check
end

function M.CauldronDestruction(User,cauldron,effectId)

    if (effectId < 1) or (effectId > 3) or (effectId == nil) then
        effectId = 1
    end

    if effectId == 1 then
        world:gfx(1,cauldron.pos)
        world:makeSound(5,cauldron.pos)
        User:inform("Der Inhalt des Kessels verpufft.",
            "The substance in the cauldron blows out."
        )
    elseif effectId == 2 then
        world:makeSound(5,cauldron.pos)
        world:gfx(36,cauldron.pos)
        User:inform("Deine letzte Handlung scheint den Inhalt des Kessels zerstört und zu einer Explosion geführt zu haben.",
            "Your last doing seems to have destroyed the substance in the cauldron and caused an explosion."
        )
        local myVictims = world:getPlayersInRangeOf(cauldron.pos,1) -- we hurt everyone around the cauldron!
        for i=1,#myVictims do
            myVictims[i]:increaseAttrib("hitpoints",-3000)
            common.HighInformNLS(myVictims[i], "Du wirst von einer Explosion getroffen.", "You are hit by an explosion.")
        end
    end
    USER_EXPLOSION_LIST[User.id] = true
    M.RemoveAll(cauldron)
    cauldron.id = 1008
    world:changeItem(cauldron)
end

function M.informAlchemyToolNeeded(user)
    user:inform(common.GetNLS(user, "Du brauchst einen Mörser, um Zutaten fürs Brauen vorzubereiten.", "You must wield a mortar in order to process the ingredients for your brewing."))
end

function M.SetQuality(user, item)

    local alchemyLevel = user:getSkill(Character.alchemy)
    local gemBonus = tonumber(getGemBonus(user))
    local leadAttribName = common.GetLeadAttributeName(Character.alchemy)
    local leadAttribValue = user:increaseAttrib(leadAttribName, 0)
    local toolItem = M.getAlchemyTool(user)
    local meanQuality = 5
    meanQuality = meanQuality*(1+common.GetAttributeBonusHigh(leadAttribValue)+common.GetQualityBonusStandard(toolItem))+gemBonus/100 --Apply boni of lead attrib, tool quality and gems.
    meanQuality = meanQuality*(0.5+(alchemyLevel/200)) -- The level of your alchemy skill has a 50% influence on the average quality
    meanQuality = common.Limit(meanQuality, 1, 8.5) --Limit to a reasonable maximum to avoid overflow ("everything quality 9"). The value here needs unnatural attributes.
    local quality = 1 --Minimum quality value.
    local rolls = 8 --There are eight chances to increase the quality by one. This results in a quality distribution 1-9.
    local probability = (meanQuality-1)/rolls --This will result in a binominal distribution of quality with meanQuality as average value.

    for i=1,rolls do
        if math.random()<probability then
            quality=quality+1
        end
    end

    quality = common.Limit(quality, 1, common.ITEM_MAX_QUALITY)
    local durability = common.ITEM_MAX_DURABILITY
    local qualityDurability = common.calculateItemQualityDurability(quality, durability)
    item:setData("potionQuality", qualityDurability)
    world:changeItem(item)
end

function M.GemDustBottleCauldron(gemId, gemdustId, cauldronId, bottleId)
    -- this function returns matching gem id, gemdust id, cauldron id and bottle id
    -- only one parameter is needed; if there are more than one, only the first one will be taken into account

    if bottleId == 3643 then
        return 198, 451, 1018, 3643
    end

    local myList
    local myValue
    if gemId then
        myList = gemList
        myValue = gemId
    elseif gemdustId then
        myList = gemDustList
        myValue = gemdustId
    elseif cauldronId then
        myList = cauldronList
        myValue = cauldronId
    elseif bottleId then
        myList = M.bottleList
        myValue = bottleId
    else
        return
    end

    local reGem, reGemdust, reCauldron, reBottle
    for i=1,#myList do
        if myList[i] == myValue then
            reGem = gemList[i]
            reGemdust = gemDustList[i]
            reCauldron = cauldronList[i]
            reBottle = M.bottleList[i]
            break
        end
    end
    return reGem, reGemdust, reCauldron, reBottle
end

local function checkIfPlayerKnowsPotion(user, potionId)

    local creator
    local index

    for _, potion in pairs(M.playerInventedPotionList) do
        if potion.id == potionId then
            creator = potion.creator
            index = potion.index
        end
    end

    if creator == user.name or common.readBitwise(user, index, M.playerPotionStartQuest) then
        return true
    end

    return false

end
----------------------------------------------------
-- combine of stock and essence brew to create a potion
-- function is only called when item 331 is a stock or when a potion-bottle is an essence brew
function M.CombineStockEssence( user, stock, essenceBrew)

    local cauldron = M.GetCauldronInfront(user)
    if cauldron then

        -- we get the gem dust used as an ingredient; and the new cauldron id we need later
        local _, ingredientGemdust, newCauldron
        if cauldron:getData("filledWith") == "essenceBrew" then
            _, ingredientGemdust, newCauldron = M.GemDustBottleCauldron(nil, nil, essenceBrew.id, nil)
        else
            _, ingredientGemdust, newCauldron = M.GemDustBottleCauldron(nil, nil, nil, essenceBrew.id)
        end
        -- create our ingredients list
        local myIngredients = {}
        -- firstly, the gem dust which has been used (indirectly, that is the potion kind)
        myIngredients[1] = ingredientGemdust
        -- secondly, the stock
        local stockConc = ""
        for i=1,8 do
            local currentSubs = stock:getData(M.wirkstoff[i].."Concentration")
            if currentSubs == "" then
                currentSubs = 5
            end
            stockConc = stockConc..currentSubs
        end
        myIngredients[2] = tonumber(stockConc)
        -- thirdly, the (at maximum) eight herbs of the essenceBrew
        for i=1,8 do
            if essenceBrew:getData("essenceHerb"..i) ~= "" then
                myIngredients[i+2] = tonumber(essenceBrew:getData("essenceHerb"..i))
            else
                myIngredients[i+2] = false
            end
        end
        -- get the potion effect id
        local effectID
        if (myIngredients[3] == false) and (ingredientGemdust == 447 or ingredientGemdust == 450) then
            -- potion kind is primary or secondary attributes AND there was no plant in the essence brew -> stock concentration determines the effect
            effectID = stockConc
        else
            if ingredientGemdust == 447 then
                if myIngredients[3] == 136 and myIngredients[4] == 136 and myIngredients[5] == 761 and myIngredients[6] == 765 and myIngredients[7] == 159 then
                    debug("stockCocn is "..stockConc)
                    effectID = 59*100000000+stockConc
                    debug("eefctID is "..effectID)
                else
                    effectID = getPotion(myIngredients[1],myIngredients[2],myIngredients[3],myIngredients[4],myIngredients[5],myIngredients[6],myIngredients[7],myIngredients[8],myIngredients[9],myIngredients[10])
                end
            else
                effectID = getPotion(myIngredients[1],myIngredients[2],myIngredients[3],myIngredients[4],myIngredients[5],myIngredients[6],myIngredients[7],myIngredients[8],myIngredients[9],myIngredients[10])
            end
        end
        -- check if char is able to combine
        effectID = tonumber(effectID)
        if effectID >= 1000 and effectID <= 1999 then
            if user:getQuestProgress(effectID+1000) == 0 then
                user:inform("Du versuchst die Gebräue zu verbinden, doch sie scheinen sich nicht vermischen zu wollen. Scheinbar beherrscht du diesen Trank noch nicht richtig.",
                    "You try to combine the brews but they just don't admix. It seem that you haven't learned how to create this potion properly.")
                return false
            end
        end
        -- delte old cauldron datas and add new ones
        M.RemoveAll(cauldron)
        M.SetQuality(user,cauldron)
        cauldron.id = newCauldron
        cauldron:setData("potionEffectId", ""..effectID)
        if potionRequiresPermission(effectID) then
            cauldron:setData("legitimateKnowledgeOfPotionRecipe", tostring(checkIfPlayerKnowsPotion(user, effectID)))
        end

        if effectID <= salveEnd and effectID >= salveStart then
            cauldron:setData("filledWith", "salve")
        else
            cauldron:setData("filledWith", "potion")
        end
        world:changeItem(cauldron)
        world:makeSound(13,cauldron.pos)
        world:gfx(52,cauldron.pos)
        -- and learn!
        user:learn(Character.alchemy, 80/2, 100)
        return true
    end
end

-- COPIED from alchemy.id_165_blue_bottle
-- Some circular requiring messed up the code. Therefore, I put the functions here as well.
-- Bad coding. Will be removed once I bother to do it properly.
local function SupportEssenceBrew(User,support,essenceBrew)

    -- no effects yet, support has no effect, essenceBrew is unchanged

    local cauldron = common.GetFrontItem( User )
    -- remove the support
    M.RemoveAll(cauldron)
    -- fill in the brew
    M.FillFromTo(essenceBrew,cauldron)
    world:changeItem(cauldron)
    world:gfx(1,cauldron.pos)
end

-- COPIED from alchemy.id_165_blue_bottle
-- Some circular requiring messed up the code. Therefore, I put the functions here as well.
-- Bad coding. Will be removed once I bother to do it properly.
local function SupportPotion(User,support,potion)
    local cauldron = common.GetFrontItem( User )
    local supportEffectId = tonumber(support:getData("potionEffectId"))

    local supportQuality, potionQuality
    if support.id >= 1008 and support.id <= 1018 then
        supportQuality = tonumber(support:getData("potionQuality"))
        potionQuality = potion.quality
    else
        supportQuality = support.quality
        potionQuality = tonumber(potion:getData("potionQuality"))
    end
    if (supportEffectId >= 400) and (supportEffectId <= 406) then -- quality raiser
    -- list with potions in cauldron and bottle
    local cauldronPotion = {1011,1016,1013,1009,1015,1018,1017}
    local bottlePotion   = {327 ,59  ,165 ,329 ,166 ,167 ,330}

    if (potion.id == cauldronPotion[supportEffectId-399]) or (potion.id == bottlePotion[supportEffectId-399]) then -- support and potion belong together

    supportQuality = common.Limit(math.floor(supportQuality/100), 1, 9)
    local chance = supportQuality*9  -- support quality * 9 = chance that potion's quality is increased
    if common.Chance(chance, 100)==true then
        potionQuality = common.Limit(potionQuality+100, 100, 999) -- new quality
        world:gfx(53,cauldron.pos)
    else -- no success, quality stays the same
    world:gfx(1,cauldron.pos)
    end

    else
        world:gfx(1,cauldron.pos)
    end

    else
        world:gfx(1,cauldron.pos)
    end
    M.RemoveAll(cauldron)
    M.FillFromTo(potion,cauldron)
    cauldron:setData("potionQuality",potionQuality) -- here we set the new quality, in case the quality raiser was successfull
    world:changeItem(cauldron)
end

-- function to fill stock, essencebrew or potion into a cauldron
function M.FillIntoCauldron(user, sourceItem, cauldron, ltstate)

    local tool = M.getAlchemyTool(user)
    local bottleContents = sourceItem:getData("filledWith")
    local cauldronContents = cauldron:getData("filledWith")

    if not tool then
        M.informAlchemyToolNeeded(user)
        return
    end

    -- is the char an alchemist?
    local anAlchemist = M.CheckIfAlchemist(user,
                        "Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
                        "Only those who have been introduced to the art of alchemy are able to work here.")

    if not anAlchemist then
        return
    end

    if licence.licence(user) then --checks if user is citizen or has a licence
        return -- avoids crafting if user is neither citizen nor has a licence
    end

    if not M.checkFood(user) then
        return
    end

    if ltstate == Action.abort then
        common.InformNLS(user, "Du brichst deine Arbeit ab.", "You abort your work.")
        return
    end

    if ltstate == Action.none then
        local actionDuration
        if bottleContents =="essenceBrew" and cauldronContents == "stock" then
            actionDuration = 80 -- when we combine a stock and an essence brew, it takes longer
        else
            actionDuration = 20
        end
        user:startAction( actionDuration, 21, 5, 10, 45)
        return
    end

    if bottleContents == "essenceBrew" or bottleContents == "potion" or bottleContents == "salve" then -- essence brew should be filled into the cauldron
        -- water, essence brew or potion is in the cauldron; leads to a failure

        if cauldronContents == "water" then
            M.CauldronDestruction(user,cauldron,1)

        elseif cauldronContents == "essenceBrew" then
            M.CauldronDestruction(user, cauldron, 2)

        elseif cauldronContents == "potion" then
            if cauldron.id == 1013 then -- support potion
                if bottleContents == "potion" then
                    SupportPotion(user, cauldron, sourceItem)
                elseif bottleContents == "essenceBrew" then
                    SupportEssenceBrew(user, cauldron, sourceItem)
                else
                    M.CauldronDestruction(user, cauldron, 2)
                end
            else
                M.CauldronDestruction(user, cauldron, 2)
            end
        elseif cauldronContents == "salve" then
            M.CauldronDestruction(user, cauldron, 2)

        elseif cauldronContents == "stock" then -- stock is in the cauldron; we call the combin function
            if bottleContents == "essenceBrew" then
                M.CombineStockEssence(user, cauldron, sourceItem)
            else
                M.CauldronDestruction(user, cauldron, 2)
            end

        else -- nothing in the cauldron, we just fill in the essence brew
            M.FillFromTo(sourceItem, cauldron)
        end
    end
    M.EmptyBottle(user, sourceItem)
end

-- a bug led to a situation that some potions missed the "filledWith"-data
-- this function will be called whenever seomething is done to a potion and set the proper data
function M.repairPotion(Item)
    local filled
    if tonumber(Item:getData("potionEffectId")) ~= nil then
        local effectID = tonumber(Item:getData("potionEffectId"))
        if effectID <= salveEnd and effectID >= salveStart then
            filled = "salve"
        else
            filled = "potion"
        end
        Item:setData("filledWith", filled)
        world:changeItem(Item)
    end
end

-- return a list containing values for actionStart
--@param theIngredient can be: "water","bottle","plant","gemPowder","stock","essenceBrew","potion"; everything else gets a default value
function M.GetStartAction(User, theIngredient, cauldron)

    local duration = 0
    local gfxId = 0
    local gfxIntervall = 0
    local sfxId = 0
    local sfxIntervall = 0

    if theIngredient == "water" then -- bucket with water
    duration = 20
    gfxId = 21
    gfxIntervall = 5
    sfxId = 0
    sfxIntervall = 0

    elseif theIngredient == "bottle" then -- empty bottle
    duration = 20
    gfxId = 21
    gfxIntervall = 5
    sfxId = 15
    sfxIntervall = 25

    elseif theIngredient == "plant" then -- plant or rotten tree bark
    duration = 50
    gfxId = 21
    gfxIntervall = 5
    sfxId = 15
    sfxIntervall = 25

    elseif theIngredient == "gemPowder" then -- gem powder
    duration = 80
    gfxId = 21
    gfxIntervall = 5
    sfxId = 0
    sfxIntervall = 0

    elseif (theIngredient == "stock" and cauldron:getData("filledWith")=="essenceBrew") or (theIngredient =="essenceBrew" and cauldron:getData("filledWith")=="stock") then
        -- we combine stock and essence brew
        duration = 80
        gfxId = 21
        gfxIntervall = 5
        sfxId = 10
        sfxIntervall = 45

    elseif theIngredient == "stock" or theIngredient == "essenceBrew" or theIngredient == "potion" then
        duration = 20
        gfxId = 21
        gfxIntervall = 5
        sfxId = 10
        sfxIntervall = 45
    end
    return duration,gfxId,gfxIntervall,sfxId,sfxIntervall
end

return M
