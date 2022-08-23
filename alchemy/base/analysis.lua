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
-- analysis

local alchemy = require("alchemy.base.alchemy")
local common = require("base.common")
local redBottle = require("alchemy.item.id_59_red_bottle")
local granorsHut = require("content.granorsHut")

local M = {}

local chargeText = {}
chargeText[1] = {[Player.german] = " Der Stein droht zu zerbrechen. �berall sind Spr�nge im �berzug und dem Stein zu sehen. Teilweise sind schon sachen rausgebrochen.", [Player.english] = " The gem might be ready to burst. There are cracks covering the whole film and gem. Some parts are already broken off."}
chargeText[2] = {[Player.german] = " Der �berzug und der Stein sind vollkommen von Spr�ngen �berzogen.", [Player.english] = " The film and the gem are completely covered in cracks."}
chargeText[3] = {[Player.german] = " Der �berzug ist komplett von Spr�ngen bedeckt. Auch der Stein hat viele Risse.", [Player.english] = " The film is completely covered with cracks. The gem itself has also a lot of cracks"}
chargeText[4] = {[Player.german] = " Der �berzug ist komplett von Spr�ngen bedeckt. Auch der Stein hat ein paar Risse.", [Player.english] = " The film is completely covered with cracks. The gem itself has also some cracks."}
chargeText[5] = {[Player.german] = " Der �berzug ist komplett von Spr�ngen bedeckt. Auch der Stein selber scheint einen Riss zu haben.", [Player.english] = " The film is completely covered with cracks. The gem itself seems also to have one."}
chargeText[6] = {[Player.german] = " Der �berzug hat sehr viele Spr�nge.", [Player.english] = " The film has a lot of crack in it."}
chargeText[7] = {[Player.german] = " Ein paar Spr�nge befinden sich im �berzug." , [Player.english] = " The film has several cracks."}
chargeText[8] = {[Player.german] = " Ein kleiner Sprung befindet sich im �berzug.", [Player.english] = " The film has a small crack."}
chargeText[9] = {[Player.german] = "", [Player.english] = ""}

local function CharacterAnalysis(User,theGem)

    if not alchemy.CheckIfAlchemist(User) then
        return
    end

    local targetCharacter = common.GetFrontCharacter(User)
    if not targetCharacter then
        User:inform("Du siehst nur unklare Formen, als du durch den Edelstein blickst.","Looking through the gem, you see only unclear forms.")
        return
    end

    User:talk(Character.say,"#me blickt durch einen Rubin auf die Person vor sich.","#me looks through a ruby at the person infront of " .. common.GetGenderText(User, "him", "her") .. ".")

    local analysisResult
    local foundAttributeEffect, attributeEffect = targetCharacter.effects:find(59)
    if not foundAttributeEffect then
        analysisResult = common.GetNLS(User, "Die Gestalt der Person scheint sich im Edelstein aufzul�sen und du erkennst, dass sie scheinbar keinen St�rkungstrank intus hat.", "The figure seems to dissolve within the ruby and you recognize that the person haven't drunk a strengthening potion")
    else
        analysisResult = common.GetNLS(User, "Die Gestalt der Person scheint sich im Edelstein aufzul�sen und du erkennst, dass sie einen St�rkungstrank intus hat:\n", "The figure seems to dissolve within the ruby and you recognize that the person has drunk a strengthening potion:\n")
        for i=1,#redBottle.attribList do
            local findAttribute, attributeChanger = attributeEffect:findValue(redBottle.attribList[i])
            if findAttribute and attributeChanger ~= 5 then
                local increaseOrDecrease
                if attributeChanger < 5 then
                    increaseOrDecrease = common.GetNLS(User, "gesenkte", "decreased")
                else
                    increaseOrDecrease = common.GetNLS(User, "gehobene", "increased")
                end
                analysisResult = analysisResult .. common.GetNLS(User, "\n" .. redBottle.intensityListDe[attributeChanger] .. " " .. increaseOrDecrease .. " " .. redBottle.attribListDe[i], "\n" .. redBottle.intensityListEn[attributeChanger] .. " " .. increaseOrDecrease .. " " .. redBottle.attribList[i])
            end
        end
    end

    local callback = function(dialog) end
    local dialog = MessageDialog(common.GetNLS(User, "Analyseergebnisse", "Results of the analysis"), analysisResult, callback)
    User:requestMessageDialog(dialog)

    local newCharge = tonumber(theGem:getData("analysingCharges")) - 1
    if newCharge < 1 then
        world:erase(theGem,1)
        User:inform("Der Rubin zerspringt in Einzelteile.","The ruby brusts into pieces.",Player.highPriority)
    else
        local descriptionDe = "Ein fester, gelblicher �berzug bedeckt den Rubin." .. chargeText[newCharge][Player.german]
        local descriptionEn = "A hard, yellowish film covers the ruby." .. chargeText[newCharge][Player.english]
        if theGem.number == 1 then
            theGem:setData("descriptionDe",descriptionDe)
            theGem:setData("descriptionEn",descriptionEn)
            theGem:setData("analysingCharges",newCharge)
            world:changeItem(theGem)
        else
            world:erase(theGem, 1)
            common.CreateItem(User, 46, 1, 333, {descriptionDe = descriptionDe, descriptionEn = descriptionEn})
        end
        User:inform("Ein Sprung bildet sich im Edelstein.","A crack appears in the gem.",Player.highPriority)
    end
end

local function IsCharacterAnalysingGem(gem)
    if gem:getData("analysingCharges") ~= "" then
        return true
    end
    return false
end

local function StockAnalysis(User, gem, brew)
    local analysisResultDE = "Substanz:\nKr�utersud\n\nWirkstoffkonzentrationen:\n"
    local analysisResultEN = "Substance:\nHerbal Stock\n\nActive substance concentrations:\n"
    for i=1,8 do -- loop to get the concentration of the eight active substances
        local wirkstoff = alchemy.wirkstoff
        local myCon = tonumber(brew:getData(""..wirkstoff[i].."Concentration"))
        if myCon == nil then
            myCon = 5
        end
        local conListDE = alchemy.wirkung_de
        local conListEN = alchemy.wirkung_en
        analysisResultDE = analysisResultDE..""..conListDE[myCon].." "..wirkstoff[i].."\n"
        analysisResultEN = analysisResultEN..""..conListEN[myCon].." "..wirkstoff[i].."\n"
    end
    return analysisResultDE, analysisResultEN
end

local function EssenceBrewAnalysis(User, gem, brew)
    local reGem, reGemdust
    if brew.id >= 1008 and brew.id <= 1018 then -- brew is a cauldron
        reGem, reGemdust = alchemy.GemDustBottleCauldron(nil, nil, brew.id, nil)
    else -- brew is a bottle
        reGem, reGemdust = alchemy.GemDustBottleCauldron(nil, nil, nil, brew.id)
    end
    local analysisResultDE
    local analysisResultEN
    if gem.id ~= reGem then -- the gem used does not match the substance
        analysisResultDE = "Die Analyse f�hrt zu keinen schl�ssigen Ergebnissen."
        analysisResultEN = "The analysis does not provide any decent results."
    else
        analysisResultDE = "Substanz:\nEssenzgebr�u auf "..world:getItemName(reGemdust,Player.german).."basis\n\nEssenzierte Kr�uter:\n"
        analysisResultEN = "Substance:\nEssence brew based on "..world:getItemName(reGemdust,Player.english).."\n\nEssenced herbs:\n"
        for i=1,8 do -- loop to get the essence herbs
            if brew:getData("essenceHerb1") == "" then
                analysisResultDE = analysisResultDE.."Keine essenzierten Kr�uter entahlten"
                analysisResultEN = analysisResultEN.."Contains no essenced herbs"
                break
            elseif brew:getData("essenceHerb"..i) == "" then
                    break
            else
                local myId = tonumber(brew:getData("essenceHerb"..i))
                analysisResultDE = analysisResultDE..world:getItemName(myId,Player.german).."\n"
                analysisResultEN = analysisResultEN..world:getItemName(myId,Player.english).."\n"
            end
        end
    end

    return analysisResultDE, analysisResultEN
end

local function PotionAnalysis(User, theGem, brew)
    local potionQuality, potionQualityDE, potionQualityEN
    local reGem, reGemdust
    if brew.id >= 1008 and brew.id <= 1018 then -- brew is a cauldron
        reGem, reGemdust = alchemy.GemDustBottleCauldron(nil, nil, brew.id, nil)
        potionQuality = tonumber(brew:getData("potionQuality"))
    else -- brew is a bottle
        reGem, reGemdust = alchemy.GemDustBottleCauldron(nil, nil, nil, brew.id)
        potionQuality = brew.quality
    end
    local analysisResultDE
    local analysisResultEN
    if theGem.id ~= reGem then -- the gem used does not match the substance
        analysisResultDE = "Die Analyse f�hrt zu keinen schl�ssigen Ergebnissen."
        analysisResultEN = "The analysis does not provide any decent results."
    else
        potionQualityEN = alchemy.qListEn[math.floor(potionQuality/100)]
        potionQualityDE = alchemy.qListDe[math.floor(potionQuality/100)]
        analysisResultDE = "Substanz:\nTrank auf "..world:getItemName(reGemdust,Player.german).."basis\n\nTrankg�te:\n"..potionQualityDE.." Qualit�t\n\nWirkung:\n"
        analysisResultEN = "Substance:\nPotion based on "..world:getItemName(reGemdust,Player.english).."\n\nPotion quality:\n"..potionQualityEN.." quality\n\nEffect:"
        local potionEffectId = tonumber(brew:getData("potionEffectId"))
        if (potionEffectId == 0) or (potionEffectId == nil) then
            analysisResultDE = analysisResultDE.."Keine Wirkung"
            analysisResultEN = analysisResultEN.."No effect"
        elseif (potionEffectId >= 11111111) and (potionEffectId <= 99999999) then
            if (reGemdust == 447) or (reGemdust == 450) then
                local dataZList = alchemy.SplitData(User,brew:getData("potionEffectId"))
                for i=1,8 do
                    local wirkstoff = alchemy.wirkstoff
                    local myCon = dataZList[i]
                    if myCon == nil then
                        myCon = 5
                    end
                    local conListDE = alchemy.wirkung_de
                    local conListEN = alchemy.wirkung_en
                    analysisResultDE = analysisResultDE..""..conListDE[myCon].." "..wirkstoff[i].."\n"
                    analysisResultEN = analysisResultEN..""..conListEN[myCon].." "..wirkstoff[i].."\n"
                end
            end
        elseif potionEffectId >= 5911111111 and potionEffectId <= 5999999999 then
            analysisResultDE = analysisResultDE.."Sichtungstrank"
            analysisResultEN = analysisResultEN.."Sighting potion"
        else
            local effectList = alchemy.potionName
            local potionEffectEN = effectList[potionEffectId][1]
            local potionEffectDE = effectList[potionEffectId][2]
            if (potionEffectEN == nil) or (potionEffectDE == nil) then -- potion has an effect id, but the effect id has no entry in the name list
                potionEffectEN = "Unknow effect"; potionEffectDE = "Unbekannte Wirkung"
            end
            analysisResultDE = analysisResultDE..potionEffectDE
            analysisResultEN = analysisResultEN..potionEffectEN
        end
    end
    return analysisResultDE, analysisResultEN
end

local function salveAnalysis(user, theGem, brew)

    local quality, qualityDE, qualityEN

    local gem = Item.topaz

    local dust = Item.topazPowder

    if brew.id >= 1008 and brew.id <= 1018 then -- brew is a cauldron
        quality = tonumber(brew:getData("potionQuality"))
    else -- brew is a salve jar
        quality = brew.quality
    end

    local analysisResultDE
    local analysisResultEN

    if theGem.id ~= gem then -- the gem used does not match the substance
        analysisResultDE = "Die Analyse f�hrt zu keinen schl�ssigen Ergebnissen."
        analysisResultEN = "The analysis does not provide any decent results."
    else
        qualityEN = alchemy.qListEn[math.floor(quality/100)]
        qualityDE = alchemy.qListDe[math.floor(quality/100)]
        analysisResultDE = "Substanz:\nSalbe auf "..world:getItemName(dust,Player.german).."basis\n\nSalbeg�te:\n"..qualityDE.." Qualit�t\n\nWirkung:\n"
        analysisResultEN = "Substance:\nSalve based on "..world:getItemName(dust,Player.english).."\n\nSalve quality:\n"..qualityEN.." quality\n\nEffect:"
        local potionEffectId = tonumber(brew:getData("potionEffectId"))
        if (potionEffectId == 0) or (potionEffectId == nil) then
            analysisResultDE = analysisResultDE.."Keine Wirkung"
            analysisResultEN = analysisResultEN.."No effect"
        else
            local effectList = alchemy.potionName
            local potionEffectEN = effectList[potionEffectId][1]
            local potionEffectDE = effectList[potionEffectId][2]
            if (potionEffectEN == nil) or (potionEffectDE == nil) then -- potion has an effect id, but the effect id has no entry in the name list
                potionEffectEN = "Unknown effect"; potionEffectDE = "Unbekannte Wirkung"
            end
            analysisResultDE = analysisResultDE..potionEffectDE
            analysisResultEN = analysisResultEN..potionEffectEN
        end
    end
    return analysisResultDE, analysisResultEN
end

local function AnalysisOfBrew(user, theGem, brew)

    local isAlchemist = alchemy.CheckIfAlchemist(user)
    if not isAlchemist then
        user:inform("Nur jene, die die Kunst der Alchemie beherrschen verm�gen zu analysieren.","Only those who have been introduced to the art of alchemy are able to analyse.")
        return
    end

    if ( user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30 then
        user:inform("Verstand, ein gutes Auge und ein Gesp�r f�r die feinstofflichen Dinge - dir fehlt es daran, als dass du hier arbeiten k�nntest.",
                    "Mind, good eyes and a feeling for the world of fine matter - with your lack of those, you are unable to work here."
                    )
        return
    end

    -- for every possible substance, we create the proper informs
    local analysisResultDE
    local analysisResultEN
    if brew:getData("filledWith") == "water" then
        analysisResultDE = "Substanz: Wasser"
        analysisResultEN = "Substance: Water"

    elseif brew:getData("filledWith")=="meraldilised slime" then
        analysisResultDE = "Substanz: Meraldilierter Schleim"
        analysisResultEN = "Substance: Meraldilised Slime"

    elseif brew:getData("filledWith") == "stock" then
        analysisResultDE, analysisResultEN = StockAnalysis(user, theGem, brew)

    elseif brew:getData("filledWith") == "essenceBrew" then
        analysisResultDE, analysisResultEN = EssenceBrewAnalysis(user, theGem, brew)

    elseif brew:getData("filledWith") == "potion" then
        analysisResultDE, analysisResultEN = PotionAnalysis(user, theGem, brew)

    elseif brew:getData("filledWith") == "salve" then
        analysisResultDE, analysisResultEN = salveAnalysis(user, theGem, brew)

    elseif brew:getData("granorsHut") ~= "" then
        analysisResultDE, analysisResultEN = granorsHut.granorsPotion()
    end

    if analysisResultDE and analysisResultEN then
        -- message box for the results
        local callback = function(dialog) end
        local dialog
        if user:getPlayerLanguage() == 0 then
            dialog = MessageDialog("Analyseergebnis", analysisResultDE, callback)
        else
            dialog = MessageDialog("Results of the analysis", analysisResultEN, callback)
        end
        user:requestMessageDialog(dialog)
    end
end

local function CauldronPotionCheck(User, SourceItem)
    local cauldron = alchemy.GetCauldronInfront(User)
    if (cauldron) and (cauldron.id ~= 1008) then
        AnalysisOfBrew(User, SourceItem, cauldron)
    else
        local brew = User:getItemAt(Character.left_tool)
        -- repair potion in case it's broken
        alchemy.repairPotion(brew)
        -- repair end
        if (brew:getData("filledWith") == "stock") or (brew:getData("filledWith") == "essenceBrew") or (brew:getData("filledWith") == "potion") or brew:getData("filledWith")=="meraldilised slime" or brew:getData("filledWith") == "salve" then
            AnalysisOfBrew(User, SourceItem, brew)
        else
            brew = User:getItemAt(Character.right_tool)
            -- repair potion in case it's broken
            alchemy.repairPotion(brew)
            -- repair end
            if (brew:getData("filledWith") == "stock") or (brew:getData("filledWith") == "essenceBrew") or (brew:getData("filledWith") == "potion") or brew:getData("filledWith")=="meraldilised slime" or brew:getData("filledWith") == "salve" then
                AnalysisOfBrew(User, SourceItem, brew)
            end
        end
    end
end

function M.AnalysisMain(User,theGem)
    if IsCharacterAnalysingGem(theGem) then
        CharacterAnalysis(User,theGem)
    else
        CauldronPotionCheck(User,theGem)
    end
end

return M
