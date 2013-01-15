require("base.common")
require("alchemy.base.alchemy")


module("item.id_3109_open_pell",package.seeall)

-- script currently only used to teach alchemy recipes

ListEffectId = {}
ListTaskText = {}
ListTaskItem = {}

function Init()
    
	ListEffectId["Runewick"] = {}
	ListTaskText["Runewick"] = {}
	ListTaskItem["Runewick"] = {}
	
	ListEffectId["Cadomyr"] = {}
	ListTaskText["Cadomyr"] = {}
	ListTaskItem["Cadomyr"] = {}
	
	ListEffectId["Galmair"] = {}
	ListTaskText["Galmair"] = {}
	ListTaskItem["Galmair"] = {}
	
	--[[
	AddPotion(town,               -- the town in which the potion can be learned e.g. "Runewick"
	          potionEffectId,     -- id of the potion be learned e.g. 46
			  taskText,           -- a list with text the npc says when selecting a potion from the list e.g. {"a stock coantining only high toxic adrazin","einen Sud mit nur hoch toxischem Adrazin"}
			  taskItem)           -- a list with id, quality and datas of the item one has to bring in order to learn the recipe e.g. {331,false,{"AdrazinConcentration","9"}}
	]]                            -- if the quality doesn't matter, set it to false; if no data is needed, just leave it out completely. note that every data gets its own list within the the list
	
	AddPotion("Runewick",
	          10,
			  {"a stock containing no Adrazin, dominant pronounced Illidrium, distinctive Caprazin, dominant marked Hyperborelium, no Echolon, slightly pronounced Dracolin, distinctive Orcanol, saturated solution of Fenolin","einen Sud, der kein Adrazin, konzentriertes Illidrium, merklich Caprazin, eine sehr ausgeprägte Menge Hyperborelium, kein Echolon, geringe Mengen Dracolin, merklich Orcanol, gesättigte Anreicherung von Fenolin beinhaltet"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","5"},{"IllidriumConcentration","8"},{"CaprazinConcentration","3"},{"HyperboreliumConcentration","2"},{"EcholonConcentration","5"},{"DracolinConcentration","6"},{"OrcanolConcentration","3"},{"FenolinConcentration","1"}}
			  )
	AddPotion("Cadomyr", 
	          301, 
			  {"a stock containing distinctive Adrazin, slightly marked Illidrium, distinctive Caprazin, enriched Hyperborelium, slightly marked Echolon, slightly marked Dracolin, saturated solution of Orcanol, slightly pronounced Fenolin", "einen Sud, der merklich Adrazin, schwache Konzentration an Illidrium, merklich Caprazin, etwas Hyperborelium, schwache Konzentration an Echolon, schwache Konzentration an Dracolin, gesättigte Anreicherung von Orcanol, geringe Mengen Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","3"},{"IllidriumConcentration","4"},{"CaprazinConcentration","3"},{"HyperboreliumConcentration","7"},{"EcholonConcentration","4"},{"DracolinConcentration","4"},{"OrcanolConcentration","1"},{"FenolinConcentration","6"}}
			  )
	AddPotion("Galmair", 
	          302, 
			  {"a small explosion bomb with at least average quality", "eine kleine Explosionsbombe von zumindest durchschnittlicher Qualität"},
			  {327,5,{"filledWith","potion"},{"potionEffectId","301"}}
			  )
	AddPotion("Runewick", 
	          304, 
			  {"a medium explosion bomb with at least average quality", "eine mittlere Explosionsbombe von zumindest durchschnittlicher Qualität"},
			  {327,5,{"filledWith","potion"},{"potionEffectId","302"}}
			  )
    AddPotion("Galmair", 
	          306, 
			  {"a stock containing dominant marked Adrazin, dominant marked Illidrium, dominant pronounced Caprazin, no Hyperborelium, slightly pronounced Echolon, slightly marked Dracolin, no Orcanol, saturated solution of Fenolin", "einen Sud, der eine sehr ausgeprägte Menge Adrazin, eine sehr ausgeprägte Menge Illidrium, konzentriertes Caprazin, kein Hyperborelium, geringe Mengen Echolon, schwache Konzentration an Dracolin, kein Orcanol, gesättigte Anreicherung von Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","2"},{"IllidriumConcentration","2"},{"CaprazinConcentration","8"},{"HyperboreliumConcentration","5"},{"EcholonConcentration","6"},{"DracolinConcentration","4"},{"OrcanolConcentration","5"},{"FenolinConcentration","1"}}
			  )			  
	AddPotion("Runewick", 
	          307, 
			  {"a small mana annihilator bomb with at least average quality", "einen kleinen Manaannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"filledWith","potion"},{"potionEffectId","306"}}
			  )
	AddPotion("Cadomyr", 
	          309, 
			  {"a medium mana annihilator bomb with at least average quality", "einen mittleren Manaannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"filledWith","potion"},{"potionEffectId","307"}}
			  )
    AddPotion("Runewick", 
	          311, 
			  {"a stock containing dominant marked Adrazin, slightly pronounced Illidrium, dominant pronounced Caprazin, slightly marked Hyperborelium, distinctive Echolon, dominant pronounced Dracolin, dominant marked Orcanol, saturated solution of Fenolin", "einen Sud, der eine sehr ausgeprägte Menge Adrazin, geringe Mengen Illidrium, konzentriertes Caprazin, schwache Konzentration an Hyperborelium, merklich Echolon, konzentriertes Dracolin, eine sehr ausgeprägte Menge Orcanol, gesättigte Anreicherung von Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","2"},{"IllidriumConcentration","6"},{"CaprazinConcentration","8"},{"HyperboreliumConcentration","4"},{"EcholonConcentration","3"},{"DracolinConcentration","8"},{"OrcanolConcentration","2"},{"FenolinConcentration","1"}}
			  )
    AddPotion("Cadomyr", 
	          312, 
			  {"a small nutrition annihilator bomb with at least average quality", "einen kleinen Nahrungsannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"filledWith","potion"},{"potionEffectId","311"}}
			  )		
    AddPotion("Galmair", 
	          314, 
			  {"a medium nutrition annihilator bomb with at least average quality", "einen mittleren Nahrungsannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"filledWith","potion"},{"potionEffectId","312"}}
			  )
    AddPotion("Galmair", 
	          316, 
			  {"a stock containing dominant pronounced Adrazin, slightly pronounced Illidrium, distinctive Caprazin, dominant pronounced Hyperborelium, slightly pronounced Echolon, no Dracolin, slightly marked Orcanol, slightly pronounced Fenolin", "einen Sud, der konzentriertes Adrazin, geringe Mengen Illidrium, merklich Caprazin, konzentriertes Hyperborelium, geringe Mengen Echolon, kein Dracolin, schwache Konzentration an Orcanol, geringe Mengen Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","8"},{"IllidriumConcentration","6"},{"CaprazinConcentration","3"},{"HyperboreliumConcentration","8"},{"EcholonConcentration","6"},{"DracolinConcentration","5"},{"OrcanolConcentration","4"},{"FenolinConcentration","6"}}
			  )
	AddPotion("Cadomyr", 
	          317, 
			  {"a small slime barrier with at least average quality", "eine eine kleine Schleimbarriere von zumindest durchschnittlicher Qualität"},
			  {327,5,{"filledWith","potion"},{"potionEffectId","316"}}
			  )		  
    AddPotion("Runewick",		  
			  400,
			  {"a wolverine fern","ein Wolfsfarn"},
			  {768,false}
			  )
	AddPotion("Runewick",		  
			  401,
			  {"a heart blood","ein Herzblut"},
			  {758,false}
			  )
    AddPotion("Galmair",		  
			  402,
			  {"a desert sky capsule","eine Wüstenhimmelskapsel"},
			  {146,false}
			  )
    AddPotion("Galmair",		  
			  403,
			  {"a con blossom","eine Trugblüte"},
			  {766,false}
			  )
	AddPotion("Cadomyr",		  
			  404,
			  {"a life root","eine Lebenswurzel"},
			  {152,false}
			  )
    AddPotion("Cadomyr",		  
			  405,
			  {"a rain weed","ein Regenkraut"},
			  {761,false}
			  )
    AddPotion("Cadomyr",		  
			  406,
			  {"a pious berry","eine Frommbeere"},
			  {756,false}
			  )
    AddPotion("Cadomyr",		  
			  605,
			  {"a stock containing no Adrazin, dominant pronounced Illidrium, slightly pronounced Caprazin, slightly marked Hyperborelium, saturated solution of Echolon, enriched Dracolin, slightly pronounced Orcanol, enriched Fenolin","einen Sud, der kein Adrazin, konzentriertes Illidrium, geringe Mengen Caprazin, schwache Konzentration an Hyperborelium, ges??ttigte Anreicherung von Echolon, etwas Dracolin, geringe Mengen Orcanol, etwas Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","5"},{"IllidriumConcentration","8"},{"CaprazinConcentration","6"},{"HyperboreliumConcentration","4"},{"EcholonConcentration","1"},{"DracolinConcentration","7"},{"OrcanolConcentration","6"},{"FenolinConcentration","7"}}
			  )
    AddPotion("Cadomyr",		  
			  601,
			  {"a stock containing dominant marked Adrazin, dominant pronounced Illidrium, enriched Caprazin, no Hyperborelium, saturated solution of Echolon, distinctive Dracolin, enriched Orcanol, highly toxic Fenolin","einen Sude, der eine sehr ausgeprägte Menge Adrazin, konzentriertes Illidrium, etwas Caprazin, kein Hyperborelium, gesättigte Anreicherung von Echolon, merklich Dracolin, etwas Orcanol, hoch toxisches Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","2"},{"IllidriumConcentration","8"},{"CaprazinConcentration","7"},{"HyperboreliumConcentration","5"},{"EcholonConcentration","1"},{"DracolinConcentration","3"},{"OrcanolConcentration","7"},{"FenolinConcentration","9"}}
			  )
    AddPotion("Galmair",		  
			  606,
			  {"a stock containing no Adrazin, slightly pronounced Illidrium, slightly pronounced Caprazin, saturated solution of Hyperborelium, dominant marked Echolon, dominant pronounced Dracolin, dominant marked Orcanol, slightly marked Fenolin","einen Sud der kein Adrazin, geringe Mengen Illidrium, geringe Mengen Caprazin, gesättigte Anreicherung von Hyperborelium, eine sehr ausgeprägte Menge Echolon, konzentriertes Dracolin, eine sehr ausgeprägte Menge Orcanol, schwache Konzentration an Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","5"},{"IllidriumConcentration","6"},{"CaprazinConcentration","6"},{"HyperboreliumConcentration","1"},{"EcholonConcentration","2"},{"DracolinConcentration","8"},{"OrcanolConcentration","2"},{"FenolinConcentration","4"}}
			  )		
    AddPotion("Galmair",		  
			  602,
			  {"a stock containing dominant marked Adrazin, distinctive Illidrium, distinctive Caprazin, slightly pronounced Hyperborelium, highly toxic Echolon, slightly marked Dracolin, dominant pronounced Orcanol, enriched Fenolin","einen Sud, der eine sehr ausgeprägte Menge Adrazin, merklich Illidrium, merklich Caprazin, geringe Mengen Hyperborelium, hoch toxisches Echolon, schwache Konzentration an Dracolin, konzentriertes Orcanol, etwas Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","2"},{"IllidriumConcentration","3"},{"CaprazinConcentration","3"},{"HyperboreliumConcentration","6"},{"EcholonConcentration","9"},{"DracolinConcentration","4"},{"OrcanolConcentration","8"},{"FenolinConcentration","7"}}
			  )
    AddPotion("Galmair",		  
			  600,
			  {"a stock containing dominant marked Adrazin, slightly pronounced Illidrium, enriched Caprazin, dominant marked Hyperborelium, enriched Echolon, slightly marked Dracolin, dominant pronounced Orcanol, dominant marked Fenolin","einen Sud, der eine sehr ausgeprägte Menge Adrazin, geringe Mengen Illidrium, etwas Caprazin, eine sehr ausgeprägte Menge Hyperborelium, etwas Echolon, schwache Konzentration an Dracolin, konzentriertes Orcanol, eine sehr ausgeprägte Menge Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","2"},{"IllidriumConcentration","6"},{"CaprazinConcentration","7"},{"HyperboreliumConcentration","2"},{"EcholonConcentration","7"},{"DracolinConcentration","4"},{"OrcanolConcentration","8"},{"FenolinConcentration","2"}}
			  )
    AddPotion("Runewick",		  
			  604,
			  {"a stock containing dominant pronounced Adrazin, no Illidrium, slightly pronounced Caprazin, saturated solution of Hyperborelium, dominant marked Echolon, slightly pronounced Dracolin, slightly marked Orcanol, dominant pronounced Fenolin","einen Sud, der konzentriertes Adrazin, kein Illidrium, geringe Mengen Caprazin, gesättigte Anreicherung von Hyperborelium, eine sehr ausgeprägte Menge Echolon, geringe Mengen Dracolin, schwache Konzentration an Orcanol, konzentriertes Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","8"},{"IllidriumConcentration","5"},{"CaprazinConcentration","6"},{"HyperboreliumConcentration","1"},{"EcholonConcentration","2"},{"DracolinConcentration","6"},{"OrcanolConcentration","4"},{"FenolinConcentration","8"}}
			  )	
    AddPotion("Runewick",		  
			  603,
			  {"a stock containing no Adrazin, saturated solution of Illidrium, distinctive Caprazin, highly toxic Hyperborelium, enriched Echolon, slightly pronounced Dracolin, enriched Orcanol, slightly marked Fenolin", "einen Sud, der kein Adrazin, gesättigte Anreicherung von Illidrium, merklich Caprazin, hoch toxisches Hyperborelium, etwas Echolon, geringe Mengen Dracolin, etwas Orcanol, schwache Konzentration an Fenolin enthält"},
			  {331,false,{"filledWith","stock"},{"AdrazinConcentration","5"},{"IllidriumConcentration","1"},{"CaprazinConcentration","3"},{"HyperboreliumConcentration","9"},{"EcholonConcentration","7"},{"DracolinConcentration","6"},{"OrcanolConcentration","7"},{"FenolinConcentration","4"}}
			  )
    AddPotion("Runewick",		  
			  607,
			  {"a potion for the common language with the best quality","einen Trank für die Handelssprache in bester Qualität"},
			  {330,9,{"filledWith","potion"},{"potionEffectId","600"}}
			  )			  
	AddPotion("Runewick",		  
			  550,
			  {"a shape shifter potion female lizard with at least average quality","einen Verwandlungstrank weibliche Echse von mindestens durchschnittlicher Qualität"},
			  {329,5,{"filledWith","potion"},{"potionEffectId","551"}}
			  )
    AddPotion("Runewick",		  
			  501,
			  {"a potion for the human language with at least average quality","einen Trank der Menschensprache zumindest durchschnittlicher Qualität"},
			  {330,5,{"filledWith","potion"},{"potionEffectId","601"}}
			  )
    AddPotion("Runewick",		  
			  521,
			  {"a shape shifter potion male halfling with at least average quality","einen Verwandlungstrank männlicher Halbling von mindestens durchschnittlicher Qualität"},
			  {330,5,{"filledWith","potion"},{"potionEffectId","520"}}
			  )
    AddPotion("Runewick",		  
			  530,
			  {"a a potion for the elf language with at least average quality","einen Trank für die Elfensprache von mindestens durchschnittlicher Qualität"},
			  {330,5,{"filledWith","potion"},{"potionEffectId","603"}}
			  )
	AddPotion("Cadomyr",		  
			  500,
			  {"a shape shifter potion female human with at least average quality","einen Verwandlungstrank weiblicher Mensch mit mindestens durchschnittlicher Qualität"},
			  {329,5,{"filledWith","potion"},{"potionEffectId","501"}}
			  )
    AddPotion("Cadomyr",		  
			  540,
			  {"a potion for the orc language with at least average quality","ein Trank für die Orksprache mit zumindest durchschnittlicher Qualität"},
			  {330,5,{"filledWith","potion"},{"potionEffectId","605"}}
			  )
    AddPotion("Cadomyr",		  
			  511,
			  {"a potion for the dwarf language with at least average quality","einen Trank für die Zwergensprache von mindestens durchschnittlicher Qualität"},
			  {330,5,{"filledWith","potion"},{"potionEffectId","602"}}
			  )
    AddPotion("Cadomyr",		  
			  531,
			  {"a shape shifter potion male elf with at least average quality","einen Verwandlungstrank männlicher Elf von mindestens durchschnittlicher Qualität"},
			  {329,5,{"filledWith","potion"},{"potionEffectId","530"}}
			  )	  
	AddPotion("Galmair",		  
			  551,
			  {"a potion for the lizard language with at least average quality","einen Trank für die Echsensprache von mindestens durchschnittlicher Qualität"},
			  {330,5,{"filledWith","potion"},{"potionEffectId","604"}}
			  )
    AddPotion("Galmair",		  
			  520,
			  {"a potion for the halbling language with at least average quality","einen Trank für die Halblingssprache von mindestens durchschnittlicher Qualität"},
			  {330,5,{"filledWith","potion"},{"potionEffectId","606"}}
			  )
    AddPotion("Galmair",		  
			  541,
			  {"a shape shifter male orc with at least average quality","einen Verwandlungstrank männlicher Ork von mindestens durchschnittlicher Qualität"},
			  {329,5,{"filledWith","potion"},{"potionEffectId","540"}}
			  )
    AddPotion("Galmair",		  
			  510,
			  {"a shape shifter female dwarf with at least average quality","einen Verwandlungstrank weiblicher Zwerg von mindestens durchschnittlicher Qualität"},
			  {329,5,{"filledWith","potion"},{"potionEffectId","511"}}
			  )		  
end

function AddPotion(town, potionEffectId, taskText, taskItem)
    table.insert(ListEffectId[town],potionEffectId)
	table.insert(ListTaskText[town],taskText)
	table.insert(ListTaskItem[town],taskItem)
end

function getTown(SourceItem)

    if SourceItem.pos == position(952,767,5) then
	    return "Runewick"
	elseif SourceItem.pos == position(137,542,0) then
	    return "Cadomyr"
	elseif SourceItem.pos == position(376,222,0) then
        return "Galmair"
    end		
	return false
end

function getNPC(SourceItem)

    local myNPC = false
    local npcList = world:getNPCSInRangeOf(SourceItem.pos,5)
	if npcList[1] == nil then
	    return myNPC
	else
        for i=1,#npcList do 
            if (npcList[i].name == "Vallaria Medrota") or (npcList[i].name == "Grator Bottlebreak") or (npcList[i].name == "Joseph Quatrilla") then 
                myNPC = npcList[i] 
                break
			end	
        end
	end
    return myNPC	
end

function RecipeInform( User, SourceItem, TargetItem, ltstate )

    if (ListEffectId["Runewick"] == nil) then
	    Init()
    end

	-- is the char an alchemist?
	local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Auf dem Schriftstück steht nur dir unverständliches Alchemistengeschwafel.","For you the document only appears to contain unintelligible alchemical gibberish.")
	if not anAlchemist then
		return
	end
	
	local town = getTown(SourceItem)
	local myListEffectId = ListEffectId[town]
	local myListTaskText = ListTaskText[town]
	local myListTaskItem = ListTaskItem[town]
	
	local language 
	if User:getPlayerLanguage() == Player.english then
	    language = 1
	else
        language = 2
    end		
	myNPC = getNPC(SourceItem)
	if myNPC == false then
	    return
	end

	local originalPos = {}
	local callback = function(dialog)
		local success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			local orgPos = originalPos[selected+1]
            local effectId = myListEffectId[orgPos]
			if User:getQuestProgress(effectId+1000) == 0 then
				myNPC:talkLanguage(Character.say,Player.english,"If you want me to show you how to create this potion properly, bring me "..myListTaskText[orgPos][language]..". Just put it here ony my table so that I can analyse it.")
				myNPC:talkLanguage(Character.say,Player.german,"Wenn Ihr wollt, dass ich Euch zeige, wie dieser Trank richtig hergestellt wird, bringt mir "..myListTaskText[orgPos][language]..". Einfach hier auf meinen Tisch tun, damit ich meine Analyse vollziehen kann.")
		    else
			    triggerfield.potionToTeacher.TellRecipe(User, effectId)
			end	
		end
	end
	local dialog
	if language == 1 then
	    dialog = SelectionDialog("Potion Recipes", "Which recipe are you interested in?", callback)
	else
	    dialog = SelectionDialog("Trankrezepte", "An welchem Rezept bist du interessiert?", callback)
	end	
	local alreadyLearned = {}
	for i=1,#myListEffectId do
		if User:getQuestProgress(myListEffectId[i]+1000) == 0 then
			dialog:addOption(164, alchemy.base.alchemy.potionName[myListEffectId[i]][language])
		else
		    local bottle = alchemy.base.alchemy.getBottleFromEffect(myListEffectId[i])
		    dialog:addOption(bottle, alchemy.base.alchemy.potionName[myListEffectId[i]][language])
		end	
		table.insert(originalPos,i)
	end
	User:requestSelectionDialog(dialog)
end

function UseItem(User, SourceItem, ltstate)
      
    if (SourceItem:getType()~=3) then -- no map item
	    return
	end	

    local town = getTown(SourceItem)
	if town == false then
	    return
	else
	    RecipeInform( User, SourceItem, TargetItem, ltstate )
	end	
	
end

function LookAtItem(User, Item)
    local lookAt = ItemLookAt()
	local town = getTown(Item)
	if town then
		lookAt.name = base.common.GetNLS(User, "Schriftrolle", "Scroll")
		lookAt.description = base.common.GetNLS(User, "Alchemierezepte", "Alchemy recipes")
	end	
	world:itemInform(User, Item, lookAt)
    return true    
end