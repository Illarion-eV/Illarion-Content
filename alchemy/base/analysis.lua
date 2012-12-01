-- analysis

require("alchemy.base.alchemy")
module("alchemy.base.analysis", package.seeall)

function StockAnalysis(User, gem, brew, Counter, Param, ltstate)
	local analysisResultDE = "Substanz:\nKräutersud\n\nWirkstoffkonzentrationen:\n"
	local analysisResultEN = "Substanz:\nHerbal Stock\n\nActive substance concentrations:\n"
	for i=1,8 do -- loop to get the concentration of the eight active substances
		local wirkstoff = alchemy.base.alchemy.wirkstoff
		local myCon = tonumber(brew:getData(""..wirkstoff[i].."Concentration"))
		if myCon == nil then
			myCon = 5
		end
		local conListDE = alchemy.base.alchemy.wirkung_de
		local conListEN = alchemy.base.alchemy.wirkung_en		
		analysisResultDE = analysisResultDE..""..conListDE[myCon].." "..wirkstoff[i].."\n"
		analysisResultEN = analysisResultEN..""..conListEN[myCon].." "..wirkstoff[i].."\n"
	end
	return analysisResultDE, analysisResultEN
end

function EssenceBrewAnalysis(User, gem, brew, Counter, Param, ltstate)
    local cauldron, bottle
	if brew.id >= 1008 and brew.id <= 1018 then -- brew is a cauldron
		cauldron = brew
		bottle = nil
	else -- brew is a bottle
		cauldron = nil
		bottle = brew			
	end	
	local reGem, reGemdust, reCauldron, reBottle = alchemy.base.alchemy.GemDustBottleCauldron(nil, nil, cauldron, bottle) -- get gemdust id
	local analysisResultDE
	local analysisResultEN
	if gem.id ~= reGem then -- the gem used does not match the substance
	    analysisResultDE = "Die Analyse führt zu keinen schlüssigen Ergebnissen."
		analysisResultEN = "The analysis does not provide any decent results."
	else	
		analysisResultDE = "Substanz:\nEssenzgebräu auf "..world:getItemName(reGemdust,Player.german).."basis\n\nEssenzierte Kräuter:\n"
		analysisResultEN = "Substance:\nEssence brew based on "..world:getItemName(reGemdust,Player.english).."\n\nEssenced herbs:\n"
		for i=1,8 do -- loop to get the essence herbs
			if brew:getData("essenceHerb1") == "" then
				analysisResultDE = analysisResultDE.."Keine essenzierten Kräuter entahlten"
				analysisResultEN = analysisResultEN.."Contains no essenced herbs"
				break
			elseif brew:getData("essenceHerb"..i) == "" then
			        break
			else		
				local myId = tonumber(brew:getData("essenceHerb"..i))
				User:inform(""..myId)
				analysisResultDE = analysisResultDE..world:getItemName(myId,Player.german).."\n"
				analysisResultEN = analysisResultEN..world:getItemName(myId,Player.english).."\n"	
			end
		end
	end	
    
	return analysisResultDE, analysisResultEN
end

function PotionAnalysis(User, gem, brew, Counter, Param, ltstate)
	local cauldron, bottle, potionQuality, potionQualityDE, potionQualityEN
	if brew.id >= 1008 and brew.id <= 1018 then -- brew is a cauldron
		cauldron = brew
		bottle = nil
		potionQuality = tonumber(brew:getData("potionQuality"))
	else -- brew is a bottle
		cauldron = nil
		bottle = brew
		potionQuality = brew.quality
	end
	local reGem, reGemdust, reCauldron, reBottle = alchemy.base.alchemy.GemDustBottleCauldron(nil, nil, cauldron, bottle) -- get gemdust id
	local analysisResultDE
	local analysisResultEN
	if gem.id ~= reGem then -- the gem used does not match the substance
	    analysisResultDE = "Die Analyse führt zu keinen schlüssigen Ergebnissen."
		analysisResultEN = "The analysis does not provide any decent results."
	else	
		local qListDE = alchemy.base.alchemy.qListDe
		local qListEN = alchemy.base.alchemy.qListEn
		potionQualityEN = alchemy.base.alchemy.qListEn[math.floor(potionQuality/100)]
		potionQualityDE = alchemy.base.alchemy.qListDe[math.floor(potionQuality/100)]
		analysisResultDE = "Substanz:\nTrank auf "..world:getItemName(reGemdust,Player.german).."basis\n\nTrankgüte:\n"..potionQualityDE.." Qualität\n\nWirkung:\n"
		analysisResultEN = "Substance:\nPotion based on "..world:getItemName(reGemdust,Player.german).."\n\nPotion quality:\n"..potionQualityEN.." quality\n\nEffect:"
		local potionEffectId = tonumber(brew:getData("potionEffectId"))
		if (potionEffectId == 0) or (potionEffectId == nil) then
			analysisResultDE = analysisResultDE.."Keine Wirkung"
			analysisResultEN = analysisResultEN.."No effect"
		elseif (potionEffectId >= 11111111) and (potionEffectId <= 99999999) then
			if (reGemdust == 447) or (reGemdust == 450) then 
				local dataZList = alchemy.base.alchemy.SplitData(User,brew:getData("potionEffectId"))
				for i=1,8 do 
					local wirkstoff = alchemy.base.alchemy.wirkstoff
					local myCon = dataZList[i]
					if myCon == nil then
						myCon = 5
					end
					local conListDE = alchemy.base.alchemy.wirkung_de
					local conListEN = alchemy.base.alchemy.wirkung_en		
					analysisResultDE = analysisResultDE..""..conListDE[myCon].." "..wirkstoff[i].."\n"
					analysisResultEN = analysisResultEN..""..conListEN[myCon].." "..wirkstoff[i].."\n"
				end			
			end
		else 
			effectList = alchemy.base.alchemy.potionName
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

function AnalysisOfBrew(User, gem, brew, Counter, Param, ltstate)

    local isAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Nur jene, die die Kunst der Alchemie beherrschen vermögen zu analysieren.","Only those who have been introduced to the art of alchemy are able to analyse.")
    if not isAlchemist then
        return
    end
	
	if brew.id == 1008 then -- empty cauldron!
	    User:inform("Hier gibt es nichts zu analysieren.","There is nothing you could analyse.")
		return
	end
    
	-- for every possible substance, we create the proper informs
    local analysisResultDE
	local analysisResultEN
	if brew:getData("filledWith") == "water" then
	    analysisResultDE = "Substanz: Wasser"
		analysisResultEN = "Substance: Water"
		
	elseif brew:getData("filledWith") == "stock" then
	    analysisResultDE, analysisResultEN = StockAnalysis(User, gem, brew, Counter, Param, ltstate)
		
	elseif brew:getData("filledWith") == "essenceBrew" then
        analysisResultDE, analysisResultEN = EssenceBrewAnalysis(User, gem, brew, Counter, Param, ltstate)
		
	elseif brew:getData("filledWith") == "potion" then
	    analysisResultDE, analysisResultEN = PotionAnalysis(User, gem, brew, Counter, Param, ltstate)
	end	
	
	if analysisResultDE and analysisResultEN then 
		-- message box for the results
		local callback = function(dialog) end
		if User:getPlayerLanguage() == 0 then
			dialog = MessageDialog("Analyseergebnis", analysisResultDE, callback)
		else
			dialog = MessageDialog("Results of the analysis", analysisResultEN, callback)
		end
		User:requestMessageDialog(dialog)
	end	
end

function CauldronPotionCheck(User, SourceItem, TargetItem, Counter, Param, ltstate)
    User:inform("debug analysis 1")
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	if cauldron then
	User:inform("debug analysis 2")
	    AnalysisOfBrew(User, SourceItem, cauldron, Counter, Param, ltstate)
	else	
	    local brew = User:getItemAt(5)
		if (brew:getData("filledWith") == "stock") or (brew:getData("filledWith") == "essenceBrew") or (brew:getData("filledWith") == "potion") then
	        AnalysisOfBrewCauldron(User, SourceItem, brew, Counter, Param, ltstate)
		else	
	        local brew = User:getItemAt(6)
			if (brew:getData("filledWith") == "stock") or (brew:getData("filledWith") == "essenceBrew") or (brew:getData("filledWith") == "potion") then
				AnalysisOfBrewCauldron(User, SourceItem, brew, Counter, Param, ltstate)
			end
        end
    end		
			
end