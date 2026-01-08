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

local lookat = require("base.lookat")
local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local granorsHut = require("content.granorsHut")
local customPotion = require("alchemy.base.customPotion")
local recipe_creation = require("alchemy.base.recipe_creation")
local scheduledFunction = require("scheduled.scheduledFunction")
local missile = require("alchemy.base.missile")
local testing = require("base.testing")

local M = {}

M.attribList   ={"strength","intelligence","dexterity"       ,"perception"  ,"constitution","essence","agility"      ,"willpower"}
M.attribListDe ={"Stärke"  ,"Intelligenz" ,"Geschicklichkeit","Wahrnehmung" ,"Ausdauer"    ,"Essenz" ,"Schnelligkeit","Willenskraft"}

M.intensityListDe = {"stark"   ,"merkbar"  ,"leicht"  ,"kaum merklich"   ,"","kaum merklich"   ,"leicht"  ,"merkbar"  ,"stark"}
M.intensityListEn = {"strongly","noticably","slightly","barely noticably","","barely noticable","slightly","noticably","strongly"}

--lists for HUMANS, DWARVES, HALFLINGS, ELVES, ORCS and LIZARDS
-- apperance lists with the different values for the six races
-- 0 = human; 1 = dwarf; 2 = halfling; 3 = elf; 4 = orc; 5 = lizard
-- the colour sets are seperated by ; while the three values of each set are seperated by ,
local ListSkinColor = {}
ListSkinColor[0] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[1] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[2] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[3] = {227, 217, 213;239, 188, 137;215, 172, 134;188, 124, 95;196, 197, 157;221, 181, 145}
ListSkinColor[4] = {139, 123, 63;84, 134, 37;99, 132, 53;169, 144, 51;125, 92, 49;84, 101, 56}
ListSkinColor[5] = {104, 128, 52;235, 173, 0;159, 59, 59;82, 181, 138;21, 53, 91;184, 135, 214}

local ListHairColor = {}
ListHairColor[0] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[1] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[2] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[3] = {255, 249, 7;104, 128, 52;108, 64, 35;108, 62, 46;216, 216, 216;21, 53, 91}
ListHairColor[4] = {162, 76, 0;116, 1, 4;139, 123, 61;39, 39, 39;166, 166, 166;58, 28, 4}
ListHairColor[5] = {239, 231, 0;154, 0, 0;72, 36, 0;28, 26, 48;44, 115, 133;96, 153, 46}

local ListBeard = {}
ListBeard[0] = {0,1,3,4,5,6}
ListBeard[1] = {1,2,4}
ListBeard[2] = {0}
ListBeard[3] = {0}
ListBeard[4] = {0}
ListBeard[5] = {0}

local ListHairMale = {}
ListHairMale[0] = {0,1,2,3}
ListHairMale[1] = {0,1,2,3}
ListHairMale[2] = {0,1,2}
ListHairMale[3] = {1,2}
ListHairMale[4] = {0,1,2,3,4,5}
ListHairMale[5] = {1,2,3,4,5,6}

local ListHairFemale = {}
ListHairFemale[0] = {1,7,8}
ListHairFemale[1] = {1,7,9}
ListHairFemale[2] = {1,2,9}
ListHairFemale[3] = {1,7,8}
ListHairFemale[4] = {1,7,8}
ListHairFemale[5] = {1,2,3,4,5,6}

local function getToxinAmount(user)
    local toxins = user:getQuestProgress(690)

    return toxins
end

local function scaleAttribValueByToxins(user, value)

    local toxins = getToxinAmount(user)

    local values = {
        {toxin = 200, cap = 1},
        {toxin = 150, cap = 2},
        {toxin = 100, cap = 3},
    }

    for _, val in ipairs(values) do
        if toxins >= val.toxin then
            return math.min(value, val.cap)
        end
    end

    return value
end

local function rubyGenerateEffectMessage(user,dataZList)
    local effectMessagesDe = ""
    local effectMessagesEn = ""
    local anyEffect = false

    local attribEn, attribDe, nPTagEn, nPTagDe, attribIntensityEn, attribIntensityDe
    for i=1,8 do
        if dataZList[i] ~= 5 then

            local value = dataZList[i]

            if value > 5 then
                value = scaleAttribValueByToxins(user, value-5)+5
            end

            attribEn = M.attribList[i] -- attribute
            attribDe = M.attribListDe[i]
            if value > 5 then
                nPTagEn = "in" -- increasing
                nPTagDe = "zu"
            else
                nPTagEn = "de" -- decreasing
                nPTagDe = "ab"
            end
            attribIntensityEn = M.intensityListEn[value] -- how strong it is in/decreased
            attribIntensityDe = M.intensityListDe[value]
            anyEffect = true
            -- we put everything together
            effectMessagesDe = effectMessagesDe.."Deine "..attribDe.." nimmt".." "..attribIntensityDe.." "..nPTagDe..". "
            effectMessagesEn = effectMessagesEn.."Your "..attribEn.." "..nPTagEn.."creases "..attribIntensityEn..". "
        end
    end
    if anyEffect == false then -- no effect
        common.InformNLS(user,"Du spürst keine Wirkung.","You don't feel any effect.")
    else
        common.InformNLS(user,effectMessagesDe,effectMessagesEn)
    end
end



local function addToxins(user, quality)

    if user:isAdmin() then  --admins neither gain nor decrease toxins
        return
    end

    local existingValue = user:getQuestProgress(690)

    if existingValue >= 300 then --capped
        if testing.active then
            user:inform("Capped out at 300 toxins")
        end
        return
    end

    local defaultAddition = 10

    if quality > 9 then -- includes durability
        quality = math.floor(quality/100)
    end

    local qualityAddition = (9 - quality) *2

    local newValue = math.min(300,user:getQuestProgress(690)+qualityAddition+defaultAddition)

    if testing.active then
        user:inform("Increased toxins by "..(defaultAddition+qualityAddition).." to a new value of "..newValue)
    end

    user:setQuestProgress(690, newValue)
end

local function toxinInform(user, toxins)

    local informs = {
        {value = 200, text = {english = "Your recent excessive use of potions has lead to a very strong decrease in your ability to benefit from their boons.", german = "Dein kürzlich exzessiver Gebrauch von Tränken hat zu einer sehr starken Verringerung deiner Fähigkeit geführt, von ihren Wirkungen zu profitieren."}},
        {value = 150, text = {english = "Your recent overuse of potions has lead to a strong decrease in your ability to benefit from their boons.", german = "Dein kürzlicher übermäßiger Gebrauch von Tränken hat zu einer starken Verringerung deiner Fähigkeit geführt, von ihren Wirkungen zu profitieren."}},
        {value = 100, text = {english = "Your recent abundant use of potions has lead to a moderate decrease in your ability to benefit from their boons.", german = "Dein kürzlich reichlicher Gebrauch von Tränken hat zu einer moderaten Verringerung deiner Fähigkeit geführt, von ihren Wirkungen zu profitieren."}},
        {value = 50, text = {english = "Your recent use of potions has lead to a slight decrease in your ability to benefit from their boons.", german = "Dein kürzlicher Gebrauch von Tränken hat zu einer leichten Verringerung deiner Fähigkeit geführt, von ihren Wirkungen zu profitieren."}}
    }

    for _, inform in ipairs(informs) do
        if toxins >= inform.value then
            user:inform(inform.text.german, inform.text.english)
            break
        end
    end
end

local function scaleValueByToxins(user, value)
    local toxins = getToxinAmount(user)

    toxinInform(user, toxins)

    toxins = math.min(toxins, 200) --actual impact caps out at 200

    local impact = math.max(0, (toxins/2)-10)

    local percent = value/100

    value = (100-impact)*percent

    return math.floor(value) -- between 100% and 10% of the original value based on toxins, as a whole integer
end



local function rubyPotion(user,SourceItem)

    addToxins(user, SourceItem.quality)

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
        return

    elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer
          -- there is already an effect, we remove it
        local foundEffect, myEffect = user.effects:find(59)
        if foundEffect then
            local findsight = myEffect:findValue("sightpotion")
            if findsight then
                common.InformNLS(user, "Deine Augen fühlen sich wieder normal an und der Stärkungstrank beginnt zu wirken.",
                "Your eyes feel normal again and the strengthening potions starts to take effect.")
            else
                common.InformNLS(user, "Du spürst, dass der alte Stärkungstrank seine Wirkung verliert und wie der neue zu wirken einsetzt.",
                "You feel that the old strengthening potion loses its effect and how the new one takes effect.")
            end
            user.effects:removeEffect(59)
        end
        local myEffectDuration = math.floor(SourceItem.quality/100)*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration
        local oldDuration = myEffectDuration
        myEffectDuration = scaleValueByToxins(user, myEffectDuration)

        if testing.active then
            user:inform("Duration reduced from "..oldDuration.." to "..myEffectDuration.." due to toxins")
        end
        myEffect = LongTimeEffect(59,myEffectDuration) -- new effect

        local dataZList = alchemy.splitStock(potionEffectId)
        alchemy.generateTasteMessage(user,dataZList) -- potion taste
        rubyGenerateEffectMessage(user,dataZList) -- inform about the effects

        local attribValue, bottomBorder

        for i=1,8 do

            attribValue = user:increaseAttrib(M.attribList[i],0)

            bottomBorder = 1

            if (attribValue + dataZList[i] - 5) < bottomBorder then
                dataZList[i] = (bottomBorder - attribValue) + 5
            end

            if dataZList[i] ~= 5 then
                local value = dataZList[i]-5
                if value > 1 then
                    value = scaleAttribValueByToxins(user, value)
                end
                user:increaseAttrib(M.attribList[i],value)
                myEffect:addValue("".. M.attribList[i],dataZList[i])
            end

        end

        foundEffect = user.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
        if not foundEffect then
            user.effects:addEffect(myEffect)
        end
    elseif potionEffectId >= 5911111111 and potionEffectId <= 5999999999 then
        local foundEffect = user.effects:find(59)
        if foundEffect then
            user.effects:removeEffect(59)
            common.InformNLS(user, "Du spürst, dass der Trank seine Wirkung verliert. Deine Augen beginnen sich seltsam anzufühlen.",
            "You feel that the old potion loses its effect. You eyes start to feel strange.")
        end
        local myEffectDuration = math.floor(SourceItem.quality/100)*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration

        local myEffect = LongTimeEffect(59,myEffectDuration) -- new effect

        myEffect:addValue("sightpotion",potionEffectId-5900000000)

        foundEffect = user.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
        if not foundEffect then
            user.effects:addEffect(myEffect)
        end
    end

    if SourceItem:getData("granorsHut") ~= "" then
        granorsHut.potionReplacer()
    end
end

local topBorder = {7000       ,7000  ,50000      ,10000        ,7000         ,7000    ,50000        ,10000}
local attribList ={"hitpoints","mana","foodlevel","poisonvalue","hitpointsOT","manaOT","foodlevelOT","poisonvalueOT"}

local function amethystGenerateEffectMessage(user,dataZList)
    local effectMessageDE = ""
    local effectMessageEN = ""
    local anyEffect = false

    local ListPositiveEffectDE = {"Deine Lebenskraft nimmt sofort zu."   ,"Dein Mana nimmt sofort zu."   ,"Du fühlst dich sofort satter."      ,"Das Gift in dir wird geschwächt."       ,"Deine Lebenskraft nimmt mit der Zeit zu.","Dein Mana nimmt mit der Zeit zu.","Mit der Zeit nimmt dein Hunger ab.","Das Gift in dir wird mit der Zeit schwächer."}
    local ListNegativeEffectDE = {"Deine Lebenskraft nimmt sofort ab."   ,"Dein Mana nimmt sofort ab."   ,"Du fühlst dich plötlzich hungriger.","Gift breitet sich in dir aus."          ,"Deine Lebenskraft nimmt mit der Zeit ab.","Dein Mana nimmt mit der Zeit ab.","Mit der Zeit nimmt dein Hunger zu.","Mit der Zeit breitet sich ein stärker werdendes Gift aus."}
    local ListPositiveEffectEN = {"Your life energy increases instantly.","Your mana increases instantly.","You feel instantly more sated."     ,"The poison in you is instantly weakened.","Your life energy increases with time."   ,"Your mana increases with time."  ,"Your hunger decreases with time."  ,"The poison is weakened with time."}
    local ListNegativeEffectEN = {"Your life energy decreases instantly.","Your mana decreases instantly.","You feel instantly more hungry."    ,"You are poisoned."                      ,"Your life energy decreases with time."   ,"Your mana decreases with time."  ,"Your hunger increases with time."  ,"Over time, a stronger poison spreads in your body."}

    for i=1,8 do
        if (dataZList[i] > 5) then
           effectMessageDE = effectMessageDE.." "..ListPositiveEffectDE[i]
           effectMessageEN = effectMessageEN.." "..ListPositiveEffectEN[i]
           anyEffect = true
       elseif (dataZList[i] < 5) then
            effectMessageDE = effectMessageDE.." "..ListNegativeEffectDE[i]
            effectMessageEN = effectMessageEN.." "..ListNegativeEffectEN[i]
            anyEffect = true
       end
    end
    if anyEffect == false then
        effectMessageDE = "Du spürst keine Wirkung."
        effectMessageEN = "You don't feel any effect."
    end
    common.InformNLS(user,effectMessageDE,effectMessageEN);
end

local function amethystPotion(user, SourceItem)

    addToxins(user, SourceItem.quality)

    local isMage = user:getMagicType() == 0 and user:getMagicFlags(0) > 0 or user:getMagicType() == 0 and user:getQuestProgress(37) ~= 0

    local isDruid = user:getMagicType() == 3

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
        return

    elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer

        -- there is already an effect; sadly,therefore, the current potion will have no effect
        local foundEffect = user.effects:find(166)
        if foundEffect then
            common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert. Scheinbar verhindert der bereits wirkende Heiltrank weitere Effekte.",
            "You don't have the feeling that something happens. It seems that the already affecting healing potion prevents other effects.")
            return
        end

        local dataZList = alchemy.splitStock(potionEffectId)
        -- taste and effect message
        alchemy.generateTasteMessage(user,dataZList)
        amethystGenerateEffectMessage(user,dataZList)

        local hitpointsOT, poisonvalueOT, manaOT, foodlevelOT
        for i=1,8 do

            local value = topBorder[i]

            if dataZList[i]-5 > 0 then --Only positive effects get downscaled
                value = scaleValueByToxins(user, value)
            end

            local Val = (dataZList[i]-5) * (value/5) * common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );

            if ( attribList[i] == "hitpointsOT" ) then
                hitpointsOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "poisonvalueOT" ) then
                   poisonvalueOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "manaOT" ) then
                   manaOT = (Val * 1.25) / 5;
                   if not isMage and not isDruid and manaOT < 0 then --decrease and not mage so we add toxins
                        user:setQuestProgress(690, math.min(300,user:getQuestProgress(690)+10))
                        if testing.active then
                            user:inform("Increased toxins by 10 for drinking an over time mana decreaser as a non mage/druid.")
                        end
                    end
            elseif ( attribList[i] == "foodlevelOT" ) then
                   foodlevelOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "poisonvalue" ) then
                Val = common.Limit( (user:getPoisonValue() - Val) , 0, 10000 );
                user:setPoisonValue( Val );
            elseif not (attribList[i] == "mana" ) or (isMage or isDruid) then
                if testing.active then
                    user:inform("Increased "..attribList[i].." by "..tostring(Val))
                end
                user:increaseAttrib(attribList[i],Val);
            elseif attribList[i] == "mana" then --not mage or druid but its mana
                if Val < 0 then -- its a decrease
                    user:setQuestProgress(690, math.min(300,user:getQuestProgress(690)+10))
                    if testing.active then
                        user:inform("Increased toxins by 10 for drinking a mana decreaser as a non mage/druid.")
                    end
                end
            end
        end
        -- LTE
        local myEffect=LongTimeEffect(166,70);
        -- now we add the values
        if hitpointsOT < 0 then
            myEffect:addValue("hitpointsDecrease",hitpointsOT*-1)
        else
            myEffect:addValue("hitpointsIncrease",hitpointsOT)
        end
        if manaOT < 0 and (isMage or isDruid) then
            myEffect:addValue("manaDecrease",manaOT*-1)
        elseif isMage or isDruid then
            myEffect:addValue("manaIncrease",manaOT)
        end
        if foodlevelOT < 0 then
            myEffect:addValue("foodlevelDecrease",foodlevelOT*-1)
        else
            myEffect:addValue("foodlevelIncrease",foodlevelOT)
        end
        if poisonvalueOT < 0 then
            myEffect:addValue("poisonvalueDecrease",poisonvalueOT*-1)
        else
            myEffect:addValue("poisonvalueIncrease",poisonvalueOT)
        end
       myEffect:addValue("counterPink",5)
       user.effects:addEffect(myEffect)

    elseif potionEffectId == 10 then
        -- potion to spit fire

        -- there is already a fire spitting potion effect going on
        -- char pukes out a flame on the map, no further effect added
        local foundEffect = user.effects:find(60)
        if foundEffect then
            common.InformNLS(user, "Sofort steigt Hitze und Erbrochenes in dir auf.",
            "Immediately, your body heats up and and some stomach contents comes up.")
            user:talk(Character.say, "#me übergibt sich und spuckt dabei einen großen Feuerball aus.", "#me throws up and pukes out a big fireball.")
            local frontPos = common.GetFrontPosition(user)
            world:makeSound(5,frontPos)
            world:gfx(9,frontPos)
            world:createItemFromId(359,1,frontPos,true,333,nil)
            local effectRemoved = user.effects:removeEffect(60)
            if not effectRemoved then
                common.InformNLS( user,"Fehler: Informiere einen Dev.", "Error: Inform a dev.")
                return
            end
            return
        end
        -- inform and add effect
        user:inform("Die Flüssigkeit läuft deine Kehle hinunter und sofort merkst du ein starkes Brennen.",
                    "The potion runs down your throat and immediately, you get the feeling that throat was on fire.")

        -- quality determines length until char spits fire (better quality, shorter time)
        local firstCall = (20-(math.floor(SourceItem.quality/100)*1.5))*10

        local myEffect=LongTimeEffect(60,firstCall)
        myEffect:addValue("quality",math.floor(SourceItem.quality/100))
        user.effects:addEffect(myEffect)
    end

    if SourceItem:getData("granorsHut") ~= "" then
        granorsHut.potionReplacer()
    end
end

local function noEffect(user, sourceItem)
    user:inform("Der Trank scheint keine Wirkung zu haben.","The potion seems to have no effect.")
end

local function diamondPotion(user,SourceItem)

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
                               "You don't have the feeling that something happens.")
        return

    elseif (potionEffectId >= 600) and (potionEffectId <= 699) then -- language potion

        local listLanguages= {Character.commonLanguage,Character.humanLanguage,Character.dwarfLanguage,Character.elfLanguage,Character.lizardLanguage,Character.orcLanguage,Character.halflingLanguage,Character.ancientLanguage}
        local find, myEffect = user.effects:find(330)

        if find then --  there is already an effect, we remove it, only one language at a time

            local _, languageId = myEffect:findValue("languageId")
            local _, oldSkill = myEffect:findValue( "oldSkill")
            local _, newSkill = myEffect:findValue( "newSkill")
            local skillName = listLanguages[languageId]
            user:increaseSkill(skillName,(-(newSkill-oldSkill))) -- old skill level restored

            local effectRemoved = user.effects:removeEffect(330)

            if not effectRemoved then
                common.InformNLS( user,"Fehler: informiere einen dev. lte nicht entfernt. white bottle script", "Error: inform dev. Lte not removed. white bottle script.")
                return
            end
        end

        local oldSkill = user:getSkill(listLanguages[potionEffectId-599])

        if oldSkill == nil then
           oldSkill = 0
        end

        local newSkill = 100

        local duration = math.floor(SourceItem.quality/100)*600*10
        myEffect = LongTimeEffect(330,duration)

        myEffect:addValue( "oldSkill", oldSkill )
        myEffect:addValue( "newSkill", newSkill )
        myEffect:addValue( "languageId", potionEffectId-599)
        myEffect:addValue("counterWhite", 10)

        user:increaseSkill(listLanguages[potionEffectId-599],newSkill)

        user.effects:addEffect(myEffect)
    end
end

local function applySalve(user, sourceItem)

    local potionEffectId = tonumber(sourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
                               "You don't have the feeling that something happens.")
        return
    elseif potionEffectId == 700 then
        user:inform("Als du die Salbe auf deine Haut aufträgst, spürst du, wie Ausschläge, Verbrennungen oder Hautreizungen spürbar gelindert werden.", "As you apply the salve on your skin, you feel any rashes, burns or irritation of your skin get noticeably soothed.")
        return
    end
end

local function applyProtection(user, duration)

    local myEffect = LongTimeEffect(32,1)
    myEffect:addValue("duration", duration)
    user.effects:addEffect(myEffect)

end

local function isGMTool(itemID)

    local GMtoolIds = {93, 99, 100, 382}

    for _, id in pairs(GMtoolIds) do
        if itemID == id then
            return true
        end
    end

    return false
end

local function checkForWeapons(user)

    local equipmentSlotsToCheck = {}

    for i = 1, 6 do
        table.insert(equipmentSlotsToCheck, user:getItemAt(Character["belt_pos_"..i]))
    end

    table.insert(equipmentSlotsToCheck, user:getItemAt(Character.left_tool))
    table.insert(equipmentSlotsToCheck, user:getItemAt(Character.right_tool))

    for _, equipment in pairs(equipmentSlotsToCheck) do
        local isWeapon = world:getWeaponStruct(equipment.id)

        if isWeapon and not isGMTool(equipment.id) then
            return true
        end
    end

    local backpack = user:getBackPack()

    if not backpack then
        return false
    end

    for i = 0, 99 do
        local success, equipment = backpack:viewItemNr(i)

        if success then
            local isWeapon = world:getWeaponStruct(equipment.id)

            if isWeapon and not isGMTool(equipment.id) then
                return true
            end
        end
    end

    return false

end

local function checkForArmour(user)

    local equipmentSlotsToCheck = {Character.head, Character.breast, Character.hands, Character.legs, Character.feet}

    local equipmentItems = {}

    for _, slot in pairs(equipmentSlotsToCheck) do
        table.insert(equipmentItems, user:getItemAt(slot))
    end

    for _, equipment in pairs(equipmentItems) do
        local isArmour, armour = world:getArmorStruct(equipment.id)

        if isArmour and (armour.Type == ArmorStruct.light or armour.Type == ArmorStruct.medium or armour.Type == ArmorStruct.heavy) then
            return true
        end
    end

    return false

end

local function monsterTransformation(user,SourceItem, race, newSkincolor1, newSkincolor2, newSkincolor3, customDuration)

    local oldRace = user:getRace()
    local oldSkinColour = user:getSkinColour()
    local oldHairColour = user:getHairColour()
    local oldSex = user:increaseAttrib("sex",0)
    local oldHair = user:getHair()
    local oldBeard = user:getBeard()
    local oldHeight = user:increaseAttrib("body_height",0)

    local duration = math.floor(SourceItem.quality/100)*10 -- effect is called every minute. quality 1 = 10 minutes; quality 9 = 90

    if customDuration then
        duration = customDuration
    end

    -- check if there is already a an effect
    local find, myEffect = user.effects:find(329)
    if find then
        local  findNewRace, LteNewRace = myEffect:findValue("newRace")
        local _, counterBlack = myEffect:findValue("counterBlack")
        if findNewRace then
            if LteNewRace == findNewRace then
                if duration > counterBlack then -- same transformation, but the new potion will last longer
                    myEffect:addValue("counterBlack",duration)
                    return
                end
            else -- not the same transformation; we need to get the old apperance values from the LTE
                local findOldSkincolor1, oldSkincolor1 = myEffect:findValue("oldSkincolor1")
                local findOldSkincolor2, oldSkincolor2 = myEffect:findValue("oldSkincolor2")
                local findOldSkincolor3, oldSkincolor3 = myEffect:findValue("oldSkincolor3")
                local findOldHaircolor1, oldHaircolor1 = myEffect:findValue("oldHaircolor1")
                local findOldHaircolor2, oldHaircolor2 = myEffect:findValue("oldHaircolor2")
                local findOldHaircolor3, oldHaircolor3 = myEffect:findValue("oldHaircolor3")

                if findOldSkincolor1 and findOldSkincolor2 and findOldSkincolor3 then
                    oldSkinColour.red = oldSkincolor1
                    oldSkinColour.green = oldSkincolor2
                    oldSkinColour.blue = oldSkincolor3
                end

                if findOldHaircolor1 and findOldHaircolor2 and findOldHaircolor3 then
                    oldHairColour.red = oldHaircolor1
                    oldHairColour.green = oldHaircolor2
                    oldHairColour.blue = oldHaircolor3
                end

                _, oldHair = myEffect:findValue("oldHair")
                _, oldBeard = myEffect:findValue("oldBeard")
                _, oldSex = myEffect:findValue("oldSex")

                _, oldRace = myEffect:findValue("oldRace")
                _, oldHeight = myEffect:findValue("oldHeight")
                -- and remove the old effect
                local effectRemoved = user.effects:removeEffect(329)
                if not effectRemoved then
                    common.InformNLS( user,"Fehler: informiere einen dev. lte nicht entfernt. black bottle script", "Error: inform dev. Lte not removed. black bottle script.")
                    return
                end
            end
        end
    end

    local newRace = race

    local newHeight = math.random(80,120)

    -- LTE and transformation
    find = user.effects:find(329)
    if not find then
        myEffect = LongTimeEffect(329,1)
        myEffect:addValue("oldSex",oldSex)
        myEffect:addValue("oldHair",oldHair)
        myEffect:addValue("oldBeard",oldBeard)
        myEffect:addValue("oldSkincolor1",oldSkinColour.red)
        myEffect:addValue("oldSkincolor2",oldSkinColour.green)
        myEffect:addValue("oldSkincolor3",oldSkinColour.blue)
        myEffect:addValue("oldHaircolor1",oldHairColour.red)
        myEffect:addValue("oldHaircolor2",oldHairColour.green)
        myEffect:addValue("oldHaircolor3",oldHairColour.blue)
        myEffect:addValue("oldRace",oldRace)
        myEffect:addValue("oldHeight",oldHeight)
        myEffect:addValue("newRace",newRace)
        myEffect:addValue("newHeight",newHeight)
        myEffect:addValue("newSkincolor1",newSkincolor1)
        myEffect:addValue("newSkincolor2",newSkincolor2)
        myEffect:addValue("newSkincolor3",newSkincolor3)

        user:setSkinColour(colour(newSkincolor1,newSkincolor2,newSkincolor3))
        user:setRace(newRace)
        user:setAttrib("body_height",newHeight)

        -- duration depends on the potion's quality
        myEffect:addValue("counterBlack",duration)
        user.effects:addEffect(myEffect)
    end
end

local function druidsEscape(user, duration)

    local foundEffect = user.effects:find(32)

    if foundEffect then
        user:inform("Du hast kürzlich den Trank Druidenflucht getrunken. Ein Weiterer wird deinem Magen nicht gut bekommen.", "You already drank a Druid's Escape recently. Any more and you will only feel sick.")
        return false
    end

    if checkForArmour(user) or checkForWeapons(user) then
        user:inform("Als Reh mit Waffen und Rüstung wirst du deine Feinde nicht täuschen können. Ushara ist nicht mit denen, die anderen Schaden zufügen wollen.", "As you are equipped with tools of war, your attackers are still able to recognise you even as a deer. Perhaps it is Ushara refusing to protect those armed to harm others?")
        return true
    end

    user:inform("Durch deine Verwandlung stiftest du Verwirrung unter deinen Feinden. Doch Usharas Segen wird dich nicht ewig beschützen, also nimm die Beine in die Hand!", "Your sudden transformation seems to confuse most enemies, whether by Ushara's blessing or something else entirely. It won't last forever, though, so you better hurry to get away!")
    applyProtection(user, duration)

    return true
end

local function obsidianPotion(user,SourceItem)

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil or potionEffectId == 562  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
        return true

    elseif (potionEffectId >= 500) and (potionEffectId < 599) then -- transformation potion

        local dog = 560
        local spider = 561
        local deer = 563

        if potionEffectId == dog then
            monsterTransformation(user,SourceItem, 58, 102, 51, 0, false)
            return true
        end

        if potionEffectId == spider then
            monsterTransformation(user, SourceItem, 19, 102, 51, 0, false)
            return true
        end

        if potionEffectId == deer then
            local deerID = 116
            local duration = math.floor(SourceItem.quality/100) -- 1-9 seconds of protection, 1-9 min of transformation
            if druidsEscape(user, duration) then
                monsterTransformation(user, SourceItem, deerID, 255, 255, 255, duration)
                return true
            else
                return false
            end
        end

        local duration = math.floor(SourceItem.quality/100)*10 -- effect is called every minute. quality 1 = 10 minutes; quality 9 = 90
        -- new apperance
        local newSex = potionEffectId - ((math.floor(potionEffectId/10))*10) -- example 551: race id 5 (lizard), sex 1 (female)
        local newRace = math.floor(((potionEffectId - newSex - 500)/10))
        local isMonster = 0
        -- our old value to change the char later back
        local oldRace = user:getRace()
        local oldSkinColour = user:getSkinColour()
        local oldHairColour = user:getHairColour()
        local oldSex = user:increaseAttrib("sex",0)
        local oldHair = user:getHair()
        local oldBeard = user:getBeard()
        local oldHeight = user:increaseAttrib("body_height",0)
        -- check if there is already a an effect
        local  find, myEffect = user.effects:find(329)

        if find then
            local findNewRace, LteNewRace = myEffect:findValue("newRace")
            local _, counterBlack = myEffect:findValue("counterBlack")
            if findNewRace then
                if LteNewRace == newRace then
                    user:inform("LteNewRace == newRace")
                    if duration > counterBlack then -- same transformation, but the new potion will last longer
                        myEffect:addValue("counterBlack",duration)
                        return true
                    end
                else -- not the same transformation; we need to get the old apperance values from the LTE
                   local _, foundMonster = myEffect:findValue("isMonster")
                    if foundMonster ~= 1 then
                        local findOldSkincolor1, oldSkincolor1 = myEffect:findValue("oldSkincolor1")
                        local findOldSkincolor2, oldSkincolor2 = myEffect:findValue("oldSkincolor2")
                        local findOldSkincolor3, oldSkincolor3 = myEffect:findValue("oldSkincolor3")
                        local findOldHaircolor1, oldHaircolor1 = myEffect:findValue("oldHaircolor1")
                        local findOldHaircolor2, oldHaircolor2 = myEffect:findValue("oldHaircolor2")
                        local findOldHaircolor3, oldHaircolor3 = myEffect:findValue("oldHaircolor3")

                        if findOldSkincolor1 and findOldSkincolor2 and findOldSkincolor3 then
                            oldSkinColour.red = oldSkincolor1
                            oldSkinColour.green = oldSkincolor2
                            oldSkinColour.blue = oldSkincolor3
                        end

                        if findOldHaircolor1 and findOldHaircolor2 and findOldHaircolor3 then
                            oldHairColour.red = oldHaircolor1
                            oldHairColour.green = oldHaircolor2
                            oldHairColour.blue = oldHaircolor3
                        end

                        _, oldHair = myEffect:findValue("oldHair")
                        _, oldBeard = myEffect:findValue("oldBeard")
                        _, oldSex = myEffect:findValue("oldSex")
                    end
                    _, oldRace = myEffect:findValue("oldRace")
                    _, oldHeight = myEffect:findValue("oldHeight")
                    -- and remove the old effect
                    local effectRemoved = user.effects:removeEffect(329)
                    if not effectRemoved then
                        common.InformNLS( user,"Fehler: informiere einen dev. lte nicht entfernt. black bottle script", "Error: inform dev. Lte not removed. black bottle script.")
                        return true
                    end
                end
            end
        end
        local newBeard, newHair
        if (newRace <= 1) and (newSex == 0) then -- only male humans or dwarves get a beard
            newBeard = ListBeard[newRace][math.random(1,#ListBeard)]
        else
             newBeard = 0
        end
        if (newSex) == 0 then
            newHair = ListHairMale[newRace][math.random(1,#ListHairMale[newRace])]
        else
            newHair = ListHairFemale[newRace][math.random(1,#ListHairFemale[newRace])]
        end
        local HairColorRandomPosition = ((math.random(1,(#ListHairColor[newRace]/3)))*3)
        local newHaircolor1 = ListHairColor[newRace][HairColorRandomPosition-2]
        local newHaircolor2 = ListHairColor[newRace][HairColorRandomPosition-1]
        local newHaircolor3 = ListHairColor[newRace][HairColorRandomPosition]

        local SkinColorRandomPosition = ((math.random(1,(#ListSkinColor[newRace]/3)))*3)
        local newSkincolor1 = ListSkinColor[newRace][SkinColorRandomPosition-2]
        local newSkincolor2 = ListSkinColor[newRace][SkinColorRandomPosition-1]
        local newSkincolor3 = ListSkinColor[newRace][SkinColorRandomPosition]

        local newHeight = math.random(80,120)

        -- LTE and transformation
        find = user.effects:find(329)
        if not find then

        myEffect = LongTimeEffect(329,1)

            -- saving of the old values
              if isMonster ~= 1 then -- we transform him into an other memeber of on of the six races, so we need to save those old values
                    myEffect:addValue("oldSex",oldSex)
                    myEffect:addValue("oldHair",oldHair)
                    myEffect:addValue("oldBeard",oldBeard)
                    myEffect:addValue("oldSkincolor1",oldSkinColour.red)
                    myEffect:addValue("oldSkincolor2",oldSkinColour.green)
                    myEffect:addValue("oldSkincolor3",oldSkinColour.blue)
                    myEffect:addValue("oldHaircolor1",oldHairColour.red)
                    myEffect:addValue("oldHaircolor2",oldHairColour.green)
                    myEffect:addValue("oldHaircolor3",oldHairColour.blue)

                    myEffect:addValue("newSex",newSex)
                    myEffect:addValue("newHair",newHair)
                    myEffect:addValue("newBeard",newBeard)
                    myEffect:addValue("newSkincolor1",newSkincolor1)
                    myEffect:addValue("newSkincolor2",newSkincolor2)
                    myEffect:addValue("newSkincolor3",newSkincolor3)
                    myEffect:addValue("newHaircolor1",newHaircolor1)
                    myEffect:addValue("newHaircolor2",newHaircolor2)
                    myEffect:addValue("newHaircolor3",newHaircolor3)

              end
                myEffect:addValue("oldRace",oldRace)
                myEffect:addValue("oldHeight",oldHeight)
                myEffect:addValue("newRace",newRace)
                myEffect:addValue("newHeight",newHeight)
                myEffect:addValue("isMonster",isMonster)

          -- transformation
          if isMonster ~= 1 then
             user:setAttrib("sex",newSex)
             user:setHair(newHair)
             user:setBeard(newBeard)
             user:setSkinColour(colour(newSkincolor1,newSkincolor2,newSkincolor3))
             user:setHairColour(colour(newHaircolor1,newHaircolor2,newHaircolor3))
          end
          user:setRace(newRace)
          user:setAttrib("body_height",newHeight)

          -- to make the changes visible
          user:increaseAttrib("hitpoints",-10)
          user:increaseAttrib("hitpoints",10)

          -- duration depends on the potion's quality
         myEffect:addValue("counterBlack",duration)
          user.effects:addEffect(myEffect)
        end
    end
    return true
end

local function lightBomb(user, sourceItem)

    local potionEffectId = tonumber(sourceItem:getData("potionEffectId"))

    local isNotABomb = not potionEffectId or potionEffectId < 300 or potionEffectId > 399 or potionEffectId == 319

    if isNotABomb then
        return
    end

    if sourceItem.id == Item.unlitAlchemyBomb then
        sourceItem.id = Item.litAlchemyBomb
        common.InformNLS( user, "Du entsicherst des Wurfkörper. Vorsicht damit.", "You activate the missile. Careful with it.")
    elseif sourceItem.id == Item.litAlchemyBomb then
        sourceItem.id = Item.unlitAlchemyBomb
        common.InformNLS( user, "Du sicherst den Wurfkörper.", "You deactivate the missile.")
    end

    world:changeItem(sourceItem)

end


local potionTypes = {
    {id = Item.rubyPotion, effect = rubyPotion, emote = {german = "#me trinkt eine rote Flüssigkeit.", english = "#me drinks a red liquid."}},
    {id = Item.amethystPotion, effect = amethystPotion, emote = {german = "#me trinkt eine violette Flüssigkeit.", english = "#me drinks a violet liquid."}},
    {id = Item.topazPotion, effect = noEffect, emote = { german = "#me trinkt eine gelbe Flüssigkeit.", english = "#me drinks a yellow liquid."}},
    {id = Item.emeraldPotion, effect = noEffect, emote = { german = "#me trinkt eine hellblaue Flüssigkeit.", english = "#me drinks a light blue liquid."}},
    {id = Item.whitePotion, effect = diamondPotion, emote = { german = "#me trinkt eine weiße Flüssigkeit.", english = "#me drinks a white liquid."}},
    {id = Item.obsidianPotion, effect = obsidianPotion, emote = { german = "#me trinkt eine schwarze Flüssigkeit.", english = "#me drinks a black liquid."}},
    {id = Item.sapphirePotion, effect = noEffect, emote = { german = "#me trinkt eine dunkelblaue Flüssigkeit.", english = "#me drinks a dark blue liquid."}},
    {id = Item.stock, effect = noEffect, emote = { german = "#me trinkt eine grüne Flüssigkeit.", english = "#me drinks a green liquid."}},
    {id = Item.salveJar, effect = applySalve, emote = { german = "#me trägt eine Salbe aus einem Tiegel auf.", english = "#me applies a salve from a jar."}},
    {id = Item.litAlchemyBomb, effect = lightBomb},
    {id = Item.unlitAlchemyBomb, effect = lightBomb}

}

function M.UseItem(user, sourceItem, actionState)

    alchemy.repairPotion(sourceItem)

    -- item should not be static
    if sourceItem.wear == 255 then
        common.HighInformNLS(user,
            "Das kannst du nicht trinken.",
            "You can't drink that.")
        return
    end

    if sourceItem:getData("filledWith")=="meraldilised slime" then
        user:inform("Die Öffnung der Flasche ist von Klumpen verklebt, wodurch der zähflüssige Inhalt nicht ausfließen kann.",
                    "The opening of the bottle is clotted by gobs, so that its semifluid content cannot flow out.")
        return
    end

    if sourceItem:getData("customPotion") ~= "" then
        customPotion.drinkInform(user, sourceItem)
    end

    local filledWith = sourceItem:getData("filledWith")

    if common.IsNilOrEmpty(filledWith) then
        return -- Not a valid potion
    end

    local cauldron = alchemy.GetCauldronInfront(user)

    if cauldron then -- infront of a cauldron?

        if sourceItem.id == Item.litAlchemyBomb or sourceItem.id == Item.unlitAlchemyBomb then
            return
        end

        local theKey = filledWith
        local theValue = sourceItem.id

        if filledWith == "essenceBrew"  or filledWith == "essence" then
            theKey = "essence"

            local essence = ""

            for i = 1, 8 do

                local essenceIngredient = sourceItem:getData("essenceHerb"..i)

                if common.IsNilOrEmpty(essenceIngredient) then
                    break
                end

                if i > 1 then
                    essence = essence..";"
                end

                essence = essence..essenceIngredient
            end

            theValue = essence

        elseif filledWith == "potion" then
            theKey = "potion"
            theValue = sourceItem:getData("potionEffectId")
        elseif filledWith == "stock" then

            local substances = ""

            for i=1,8 do
                local substance = sourceItem:getData(substances[i].."Concentration")

                if common.IsNilOrEmpty(substance) then
                    substance = 5 --Neutral value
                end

                if i > 1 then
                    substances = substances..";"
                end

                substances = substances..substance
            end

            theValue = substances
        end

        local recipeTable = {
            {key = theKey, value = theValue}
        }

        recipe_creation.useRecipe(user, recipeTable, actionState)

    else -- not infront of a cauldron, therefore use the potion/salve/bomb!
        for _, potionType in pairs(potionTypes) do
            if potionType.id == sourceItem.id then
                if (potionType.id == Item.obsidianPotion and potionType.effect(user, sourceItem)) or potionType.id ~= Item.obsidianPotion then
                    alchemy.logConsumption(user, sourceItem)
                    user.movepoints = user.movepoints - 20
                    if potionType.emote then
                        user:talk(Character.say, potionType.emote.german, potionType.emote.english)
                    end
                    if potionType.id ~= Item.obsidianPotion then
                        potionType.effect(user, sourceItem)
                    end
                    if potionType.id ~= Item.unlitAlchemyBomb and potionType.id ~= Item.litAlchemyBomb then
                        alchemy.EmptyBottle(user,sourceItem)
                    end
                end
                break
            end
        end
    end
end

function M.LookAtItem(user, potion)

    local potionEffectId = tonumber(potion:getData("potionEffectId"))

    if potionEffectId and potion.id ~= Item.unlitAlchemyBomb and potion.id ~= Item.litAlchemyBomb and (potionEffectId > 300 and potionEffectId < 399) then --bomb
        potion.id = Item.unlitAlchemyBomb
        world:changeItem(potion)
    end

    return lookat.GenerateLookAt(user, potion, 0)
end

local function potionChangeID(stackPosition, timeStamp, effectID)

    if not world:isItemOnField(stackPosition) then
        return false
    end

    local newID = {
        [562] = 563
    }

    local theField = world:getField(stackPosition)
    local counter = 1
    while counter <= theField:countItems() do
        local checkItem = theField:getStackItem(theField:countItems()- counter )
        if 329 == checkItem.id and checkItem:getData("identifierTimeStamp") == tostring(timeStamp) and tonumber(checkItem:getData("potionEffectId")) == effectID then
            checkItem:setData("potionEffectId", newID[effectID])
            world:changeItem(checkItem)
            return true
        end
        counter = counter + 1
    end

    return false

end


local function nearUsharaAltar(thePosition)

    local altars = {1162, 1163, 2872}

    local positions = {
        thePosition,
        position(thePosition.x +1, thePosition.y +1, thePosition.z),
        position(thePosition.x +1, thePosition.y -1, thePosition.z),
        position(thePosition.x +1, thePosition.y, thePosition.z),
        position(thePosition.x -1, thePosition.y +1, thePosition.z),
        position(thePosition.x -1, thePosition.y -1, thePosition.z),
        position(thePosition.x -1, thePosition.y, thePosition.z),
        position(thePosition.x, thePosition.y +1, thePosition.z),
        position(thePosition.x, thePosition.y -1, thePosition.z)}

    for _, currentPosition in pairs(positions) do
        local theField = world:getField(currentPosition)

        for i = 0, theField:countItems() do
            local checkItem = theField:getStackItem(i)
            for _, altar in pairs(altars) do
                if checkItem.id == altar then
                    local god = checkItem:getData("god")
                    if god == "1" then  --It is an altar dedicated to Ushara of either the Ushara's altar variant or generic five gods variant
                        return true
                    end
                end
            end
        end
    end

    return false
end

local function druidsEscapePrototype(user, targetItem)
    local itemPos = position(targetItem.pos.x, targetItem.pos.y, targetItem.pos.z)

    if targetItem:getType() == 3 and nearUsharaAltar(itemPos) then
        local timeStamp = world:getTime("unix")
        targetItem:setData("identifierTimeStamp", timeStamp)
        world:changeItem(targetItem)

        scheduledFunction.registerFunction(360, function()
            if potionChangeID(itemPos, timeStamp, 562) then
                world:gfx(16, itemPos)
            end
        end)
    else
        if targetItem:getData("identifierTimeStamp") ~= "" then
            targetItem:setData("identifierTimeStamp", "")
            world:changeItem(targetItem)
        end
    end
end

local function demonskeletonWeakenerPrototype(user, targetItem)

    local itemPos = position(targetItem.pos.x, targetItem.pos.y, targetItem.pos.z)
    local theField = world:getField(itemPos)

    if targetItem:getType() == 3 and common.GetGroundType(theField:tile()) == common.GroundType.snow then
        local timeStamp = world:getTime("unix")
        targetItem:setData("identifierTimeStamp", timeStamp)
        world:changeItem(targetItem)
        local potionQuality = targetItem.quality

        scheduledFunction.registerFunction(360, function()
            local field = world:getField(itemPos)

            if field:countItems() > 0 then
                local deleted = common.DeleteItemFromStack(itemPos, {itemId = 327, quality = potionQuality, data = { {dataKey = "potionEffectId", dataValue = 319}, {dataKey = "identifierTimeStamp", dataValue = timeStamp}}})

                if deleted then
                    world:createItemFromId(327, 1, itemPos, true, potionQuality, {potionEffectId = 320, filledWith = "potion"})
                    world:gfx(4, itemPos)
                end
            end
        end)
    else
        if targetItem:getData("identifierTimeStamp") ~= "" then
            targetItem:setData("identifierTimeStamp", "")
            world:changeItem(targetItem)
        end
    end
end

local function explode(user, targetItem, potionEffectId)

    for i = 1, 18 do
        if potionEffectId == 300+i then
            missile["effect_"..i](user, targetItem)
        end
    end

    if potionEffectId == 320 then
        missile.weakenRedSkeletons(user, targetItem)
    end

    world:gfx(36, targetItem.pos)
    world:makeSound(5, targetItem.pos)
    world:erase(targetItem,1)

end

function M.MoveItemAfterMove(user, sourceItem, targetItem)

    local potionEffectId = tonumber(sourceItem:getData("potionEffectId"))

    if not potionEffectId then
        return
    end

    if potionEffectId == 562 then
        druidsEscapePrototype(user, targetItem)
    end

    if potionEffectId == 319 then
        demonskeletonWeakenerPrototype(user, targetItem)
        return true
    end

    --Handling of bombs begins

    if sourceItem.id ~= Item.litAlchemyBomb or potionEffectId < 300 or potionEffectId > 399 or targetItem:getType() ~= 3 or sourceItem:getType() ~= 4 then
        return true
    end

    explode(user, targetItem, potionEffectId)
    user:talk(Character.say, "#me wirft eine Flasche, die zerplatzt.", "#me throws a bottle that splits.")
    user.movepoints=user.movepoints-30;
    return true

end

function M.MoveItemBeforeMove( user, sourceItem, targetItem)

    --Handling of bombs
    local potionEffectId = tonumber(sourceItem:getData("potionEffectId"))

    if sourceItem.id ~= Item.litAlchemyBomb or not potionEffectId or potionEffectId < 300 or potionEffectId > 399 or targetItem:getType() ~= 3 then
        return true
    end

    if sourceItem:getType() ~= 4 then
        common.InformNLS( user,
        "Du musst den Wurfkörper aus der Hand werfen.",
        "You have to throw the missile out of your hand.");
        return false
    end

    --Handling of bombs over

    return true
end


return M


