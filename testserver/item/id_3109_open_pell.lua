require("base.common")
require("alchemy.base.alchemy")


module("item.id_3109_open_pell",package.seeall)

-- script currently only used to teach alchemy recipes


function Init()
    ListEffectId = {}
	ListTaskText = {}
	ListTaskItem = {}
	
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
	
	AddPotion("Cadomyr", 
	          301, 
			  {"a stock containing only highly toxic Adrazin", "einen Sud, der nur nur hoch toxisches Adrazin enthält"},
			  {331,false,{"AdrazinConcentration","9"},{"IllidriumConcentration","5"},{"CaprazinConcentration","5"},{"HyperboreliumConcentration","5"},{"EcholonConcentration","5"},{"DracolinConcentration","5"},{"OrcanolConcentration","5"},{"FenolinConcentration","5"}}
			  )
	AddPotion("Galmair", 
	          302, 
			  {"a small explosion bomb with at least average quality", "eine kleine Explosionsbombe von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","301"}}
			  )
	AddPotion("Runewick", 
	          304, 
			  {"a medium explosion bomb with at least average quality", "eine mittlere Explosionsbombe von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","302"}}
			  )
    
	AddPotion("Galmair", 
	          306, 
			  {"a stock containing only highly toxic Caprazin", "einen Sud, der nur nur hoch toxisches Caprazin enthält"},
			  {331,false,{"AdrazinConcentration","5"},{"IllidriumConcentration","5"},{"CaprazinConcentration","9"},{"HyperboreliumConcentration","5"},{"EcholonConcentration","5"},{"DracolinConcentration","5"},{"OrcanolConcentration","5"},{"FenolinConcentration","5"}}
			  )			  
	AddPotion("Runewick", 
	          307, 
			  {"a small mana annihilator bomb with at least average quality", "einen kleinen Manaannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","306"}}
			  )
	AddPotion("Cadomyr", 
	          309, 
			  {"a medium mana annihilator bomb with at least average quality", "einen mittleren Manaannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","307"}}
			  )

	AddPotion("Runewick", 
	          311, 
			  {"a stock containing only highly toxic Illidrium", "einen Sud, der nur nur hoch toxisches Illidrium enthält"},
			  {331,false,{"AdrazinConcentration","5"},{"IllidriumConcentration","9"},{"CaprazinConcentration","5"},{"HyperboreliumConcentration","5"},{"EcholonConcentration","5"},{"DracolinConcentration","5"},{"OrcanolConcentration","5"},{"FenolinConcentration","5"}}
			  )
    AddPotion("Cadomyr", 
	          312, 
			  {"a small nutrition annihilator bomb with at least average quality", "einen kleinen Nahrungsannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","311"}}
			  )		
    AddPotion("Cadomyr", 
	          312, 
			  {"a small nutrition annihilator bomb with at least average quality", "einen kleinen Nahrungsannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","311"}}
			  )

	AddPotion("Galmair", 
	          316, 
			  {"a medium mana annihilator bomb with at least average quality", "einen mittleren Manaannihilator von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","307"}}
			  )
	AddPotion("Cadomyr", 
	          317, 
			  {"a big explosion bomb with at least average quality", "eine eine große Explosionsbombe von zumindest durchschnittlicher Qualität"},
			  {327,5,{"potionEffectId","304"}}
			  )		  
    AddPotion("Runewick",		  
			  400,
			  {"a desert sky capsule","eine Wüstenhimmelskapsel"}
			  {146,false}
			  )
	AddPotion("Runewick",		  
			  401,
			  {"a dark moss","ein Dunkelmoos"}
			  {764,false}
			  )
    AddPotion("Galmair",		  
			  402,
			  {"a rain weed","ein Regenkraut"}
			  {761,false}
			  )
    AddPotion("Galmair",		  
			  403,
			  {"a con blossom","eine Trugblüte"}
			  {766}
			  )
	AddPotion("Cadomyr",		  
			  404,
			  {"a life root","eine Lebenswurzel"}
			  {152,false}
			  )
    AddPotion("Cadomyr",		  
			  405,
			  {"a heart blood","ein Herzblut"}
			  {758,false}
			  )
    AddPotion("Cadomyr",		  
			  406,
			  {"a daydream","einen Tragtraum"}
			  {765,false}
			  )
    AddPotion("Cadomyr",		  
			  605,
			  {"a stock containing no Adrazin, dominant pronounced Illidrium, no Caprazin, slightly marked Hyperborelium, saturated solution of Echolon, enriched Dracolin, no Orcanol and enriched Fenolin","einen Sud der kein Adrazin, konzentriertes Illidrium, kein Caprazin, schwache Konzentration Hyperborelium, gesättige Anreicherung von Echolon, etwas Dracolin, kein Orcanol und etwas Fenolin enthält"}
			  {331,false,{"AdrazinConcentration","5"},{"IllidriumConcentration","8"},{"CaprazinConcentration","5"},{"HyperboreliumConcentration","4"},{"EcholonConcentration","1"},{"DracolinConcentration","7"},{"OrcanolConcentration","5"},{"FenolinConcentration","7"}}
			  )
    AddPotion("Cadomyr",		  
			  601,
			  {"a potion for orc language with at least average quality","ein Orksprachtrank von zumindest durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","605"}}
			  )
    AddPotion("Galmair",		  
			  606,
			  {"a stock containing no Adrazin, dominant pronounced Illidrium, no Caprazin, slightly marked Hyperborelium, saturated solution of Echolon, enriched Dracolin, no Orcanol and enriched Fenolin","einen Sud der kein Adrazin, konzentriertes Illidrium, kein Caprazin, schwache Konzentration Hyperborelium, gesättige Anreicherung von Echolon, etwas Dracolin, kein Orcanol und etwas Fenolin enthält"}
			  {331,false,{"AdrazinConcentration","5"},{"IllidriumConcentration","8"},{"CaprazinConcentration","5"},{"HyperboreliumConcentration","4"},{"EcholonConcentration","1"},{"DracolinConcentration","7"},{"OrcanolConcentration","5"},{"FenolinConcentration","7"}}
			  )		
    AddPotion("Galmair",		  
			  602,
			  {"a potion for halfling language with at least average quality","ein Halblingssprachtrank von zumindest durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","606"}}
			  )
    AddPotion("Galmair",		  
			  600,
			  {"a pious berry","eine Frommbeere"}
			  {756,false}
			  )
    AddPotion("Runewick",		  
			  604,
			  {"a stock containing no Adrazin, dominant pronounced Illidrium, no Caprazin, slightly marked Hyperborelium, saturated solution of Echolon, enriched Dracolin, no Orcanol and enriched Fenolin","einen Sud der kein Adrazin, konzentriertes Illidrium, kein Caprazin, schwache Konzentration Hyperborelium, gesättige Anreicherung von Echolon, etwas Dracolin, kein Orcanol und etwas Fenolin enthält"}
			  {331,false,{"AdrazinConcentration","5"},{"IllidriumConcentration","8"},{"CaprazinConcentration","5"},{"HyperboreliumConcentration","4"},{"EcholonConcentration","1"},{"DracolinConcentration","7"},{"OrcanolConcentration","5"},{"FenolinConcentration","7"}}
			  )	
    AddPotion("Runewick",		  
			  603,
			  {"a potion for lizard language with at least average quality","ein Echsensprachtrank von zumindest durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","604"}}
			  )
    AddPotion("Runewick",		  
			  607,
			  {"a potion for the common language with the best quality","einen Trank für die Handelssprache in bester Qualität"}
			  {330,9,{"potionEffectId","600"}}
			  )			  
	AddPotion("Runewick",		  
			  550,
			  {"a potion for the lizard language with at least average quality","ein Trank für die Echsensprache mit mindestens durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","604"}}
			  )
    AddPotion("Runewick",		  
			  501,
			  {"a shape shifter potion male human with at least average quality","einen Verwandlungstrank männlicher Mensch mit zumindest durchschnittlicher Qualität"}
			  {329,5,{"potionEffectId","500"}}
			  )
    AddPotion("Runewick",		  
			  521,
			  {"a potion for the halfling language with at least average quality","einen Trank für die Halblingssprache von mindestens durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","606"}}
			  )
    AddPotion("Runewick",		  
			  530,
			  {"a shape shifter female elf with at least average quality","einen Verwandlungstrank weiblicher Elf von mindestens durchschnittlicher Qualität"}
			  {329,5,{"potionEffectId","531"}}
			  )
	AddPotion("Cadomyr",		  
			  500,
			  {"a potion for the human language with at least average quality","ein Trank für die Menschensprache mit mindestens durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","601"}}
			  )
    AddPotion("Cadomyr",		  
			  540,
			  {"a potion for the orc language with at least average quality","ein Trank für die Orksprache mit zumindest durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","605"}}
			  )
    AddPotion("Cadomyr",		  
			  511,
			  {"a potion for the dwarf language with at least average quality","einen Trank für die Zwergensprache von mindestens durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","602"}}
			  )
    AddPotion("Cadomyr",		  
			  531,
			  {"a potion for the elf language with at least average quality","einen Trank für die Elfensprache von mindestens durchschnittlicher Qualität"}
			  {330,5,{"potionEffectId","603"}}
			  )	  
	AddPotion("Galmair",		  
			  551,
			  {"a shape shifter male lizard with at least average quality","einen Verwandlungstrank männlicher Echsenmensch von mindestens durchschnittlicher Qualität"}
			  {329,5,{"potionEffectId","550"}}
			  )
    AddPotion("Galmair",		  
			  520,
			  {"a shape shifter female halfling with at least average quality","einen Verwandlungstrank weiblicher Halbling von mindestens durchschnittlicher Qualität"}
			  {329,5,{"potionEffectId","521"}}
			  )
    AddPotion("Galmair",		  
			  541,
			  {"a shape shifter male orc with at least average quality","einen Verwandlungstrank männlicher Ork von mindestens durchschnittlicher Qualität"}
			  {329,5,{"potionEffectId","540"}}
			  )
    AddPotion("Galmair",		  
			  510,
			  {"a shape shifter female dwarf with at least average quality","einen Verwandlungstrank weiblicher Zwerg von mindestens durchschnittlicher Qualität"}
			  {329,5,{"potionEffectId","511"}}
			  )		  
end

function AddPotion(town, potionEffectId, taskText, taskItem)
    table.insert(ListEffectId[town],potionEffectId)
	table.insert(ListTask[town],taskText)
	table.insert(ListProperties[town],taskItem)
end

function getTown(SourceItem)

    if SourceItem.pos == position(1,1,0) then
	    return "Runewick"
	elseif SourceItem.pos == position(1,2,0) then
	    return "Cadomyr"
	elseif SourceItem.pos == position(1,3,0) then
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
            if (npcList[i].name "Vallaria Medrota") or (npcList[i].name "Grator Bottlebreak") or (npcList[i].name "Joseph Quatrilla") then 
                myNPC = npcList[i] 
                break
			end	
        end
	end
    return myNPC	
end

function RecipeInform( User, SourceItem, TargetItem, Counter, Param, ltstate )

    if (ListEffectId_Runewick == nil) or (ListEffectId_Runewick == nil) or (ListEffectId_Runewick == nil) then
	    Init()
    end

	-- is the char an alchemist?
	local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Auf dem Schriftstück steht nur dir unverständliches Alchemistengeschwafel.","Only some for you unintelligibly alchemical gibberish is written on the document.")
	if not anAlchemist then
		return
	end
	
	local myListEffectId = ListEffectId[town]
	local myListTaskText = ListTask[town]
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
	
	local callback = function(dialog)
		local success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			local orgPos = originalPos[selected+1] 
			myNPC:talkLanguage(Character.say,Player.english,"If you want me to show you how to create this potion properly, bring me "..myListTaskText[town][orgPos][language]..". Just put it here ony my table so that I can analyse it.")
			myNPC:talkLanguage(Character.say,Player.german,"Wenn Ihr wollt, dass ich Euch zeige, wie dieser Trank richtig hergestellt wird, bringt mir "..myListTaskText[town][orgPos][language]..". Einfach hier auf meinen Tisch tun, damit ich meine Analyse vollziehen kann.")
		end
	end
	local dialog
	if language == 1 then
	    dialog = SelectionDialog("Potion Recipes", "Which recipe are you interested in?", callback)
	else
	    dialog = SelectionDialog("Trankrezepte", "An welchem Rezept bist du interessiert?", callback)
	end	
	local success = nil
	local originalPos = {}
	for i=1,#myListEffectId do
		if User:getQueststatus(myListEffectId[i]+1000) == 0 then
			dialog:addOption(0, alchemy.base.alchemy.potionName[myListEffectId[i]][language])
			table.insert(originalPos,i)
			success = true
		end	
	end
	if success then
	    User:requestSelectionDialog(dialog)
	else	
	    User:inform("Du beherrscht bereits alle Tränke auf dieser Liste.","You alreadxy are able to create all those potions.")
	end

end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
      
    if (TargetItem:getType()~=3) then -- no map item
	    return
	end	

    local town = getTown(SourceItem)
	if town == false then
	    return
	else
	    RecipeInform( User, SourceItem, TargetItem, Counter, Param, ltstate )
	end	
	
end