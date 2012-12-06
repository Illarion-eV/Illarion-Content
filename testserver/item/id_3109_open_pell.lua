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
	]]                            -- if something doesn't matter e.g. quality, set it to nil. note that every data gets its own list within the the list
	AddPotion("Runewick", 
	          551, 
			  {"a shape shifter potion male human of at least good quality", "einen Verwandlungstrank männlicher Mensch von mindestens guter Qualität"},
			  {329,6,{"potionEffectId","500"}}
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
            if (npcList[i].name "nummer1") or (npcList[i].name "nummer2") or (npcList[i].name "nummer3") then 
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
	if User:getPlayerLanguage() = Player.english then
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