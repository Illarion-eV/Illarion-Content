require("base.keys")
require("base.common")
require("base.lookat")

module("item.keys", package.seeall)

-- UPDATE common SET com_script='item.keys' WHERE com_itemid IN (2121,2122,2123,2124,2141,2144,2145,2161,2556,2558,3054,3055,3056);

function UseItem(User, SourceItem)
    local DoorItem = base.common.GetFrontItem( User );
    
	if SourceItem:getData("townKeyOf") ~= "" then 
	    -- sentence char to forced labour
		SentenceCharacter(User,SourceItem)
	    return
	end	

	if base.keys.CheckKey(SourceItem,DoorItem,User) then	
        if base.keys.LockDoor(DoorItem) then
            base.common.InformNLS(User,"Du sperrst die Tür ab.","You lock the door.");
        elseif base.keys.UnlockDoor(DoorItem) then            
            base.common.InformNLS(User,"Du sperrst die Tür auf.","You unlock the door.");
        end
    else
        base.common.InformNLS(User,"Der Schlüssel passt hier nicht.","The key doesn't fit here.");
    end
end

function SentenceCharacter(User,SourceItem)
	
	if User:isAdmin() == false then
      local charname = User.name;
      	if (charname ~= "Elvaine Morgan" and charname ~= "Valerio Guilianni" and charname ~= "Rosaline Edwards") then
          return; -- for now only GMs are supposed to use the keys
        end;
    end;	
	
	local myTown = SourceItem:getData("townKeyOf")
	if not (myTown == "Cadomyr" or myTown == "Runewick" or myTown == "Galmair" or myTown == "None") then
        User:inform("This prison key does not belong to any town.")
        return
    end

	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex()+1 
			if selected == 1 then
			    LabourCamp(User, SourceItem)
			elseif selected == 2 then
                GuardBehaviourTowardsChar(User, SourceItem)			
		    end
		else
			User:inform("Selection aborted!") 
		end
	end

	local dialog = SelectionDialog("Town key of "..SourceItem:getData("townKeyOf"), "What do you want to do?", callback)
	dialog:setCloseOnMove()
	dialog:addOption(0, "Send someone to the labour camp")
	dialog:addOption(0, "Set behaviour of guards towards a certain person")

	User:requestSelectionDialog(dialog)
	
end

function GuardBehaviourTowardsChar(User, SourceItem)
    
	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex()
			SelectTargetChar(User, SourceItem, selected)
		else
			User:inform("Selection aborted!") 
		end
    end

	local dialog = SelectionDialog("Guard behaviour", "Select the behaviour you want the guards to have towardas a certain person", callback)
	dialog:setCloseOnMove()
	dialog:addOption(0, "None")
	dialog:addOption(0, "Passive")
	dialog:addOption(0, "Hostile")
	dialog:addOption(0, "Aggresive")
	dialog:addOption(0, "Let always pass")

	User:requestSelectionDialog(dialog)
	
end

function SelectTargetChar(User, SourceItem, behaviour)
    
    local callback = function(dialog)
	    if not dialog:getSuccess() then
		    User:inform("Abortion. No one was sentenced to anything.")
			return
		else 
            local myString = dialog:getInput()
			local myCharId
			local myCharName
	        local days
			local allFound = false
			local a, b
			if string.find(myString,"(%d+) (%d+)") then
			    a,b,myCharId,days = string.find(myString,"(%d+) (%d+)")
                myCharId = tonumber(myCharId); days = tonumber(days)
				allFound = true
			elseif string.find(myString,"(%d+)") then
			    a,b,days = string.find(myString,"(%d+)")
                days = tonumber(days)
				if a-2 > 1 then 
					myCharName=string.sub (myString, 1,a-2)
                    allFound = true
                end
			end
            if allFound then
			    local onlineChars = world:getPlayersOnline()
				local theChar
				for i=1,#onlineChars do
					local checkChar = onlineChars[i]
					if myCharId then
					    if checkChar.id == myCharId then
						    theChar = checkChar
				            break
						end	
			        else 
         			    if checkChar.name == myCharName then
		                    theChar = checkChar
				            break
						end
                    end	
                end    
				if not theChar then 
					User:inform("Character has not been found.")
				else
				    local modeList = {}
					local daysList = {}	
					modeList["Cadomyr"]  = 191; daysList["Cadomyr"]  = 192
					modeList["Runewick"] = 193; daysList["Runewick"] = 194
					modeList["Galmair"]  = 195; daysList["Galmair"]  = 196
				
				    local town = SourceItem:getData("townKeyOf")
					theChar:setQuestProgress(modeList[town],behaviour)
					theChar:setQuestProgress(daysList[town],days)
				end
			else
                User:inform("You haven't put in all necessary informations.")
            end
		end	
	end
	local dialog = InputDialog("Set behaviour","Insert: [Name|ID] [days] Example: John Doe 100; Notice: Days are ig days. If it should be permanent, set it to 0",false,255,callback)
	User:requestInputDialog(dialog)
end

function LabourCamp(User, SourceItem)

    local townId 
    if SourceItem:getData("townKeyOf") == "Cadomyr" then
        townId = 1
	elseif SourceItem:getData("townKeyOf") == "Runewick" then 
	    townId = 2
	elseif SourceItem:getData("townKeyOf") == "Galmair" then
	    townId = 3
	elseif SourceItem:getData("townKeyOf") == "None" then
	    townId = 0
	else 
        return
    end		
	
	local callback = function(dialog)
	    if not dialog:getSuccess() then
		    User:inform("Abortion. No one was sentenced to anything.")
			return
		else 
            local myString = dialog:getInput()
			local myPrisonerId
			local myPrisonerName
	        local workLoad
			local allFound = false
			local a; local b
			if string.find(myString,"(%d+) (%d+)") then
			    a,b,myPrisonerId,workLoad = string.find(myString,"(%d+) (%d+)")
                myPrisonerId = tonumber(myPrisonerId); workLoad = tonumber(workLoad)
				allFound = true
			elseif string.find(myString,"(%d+)") then
			    a,b,workLoad = string.find(myString,"(%d+)")
                workLoad = tonumber(workLoad)
				if a-2 > 1 then 
					myPrisonerName=string.sub (myString, 1,a-2)
                    allFound = true
                end
			end
            if allFound then
			    local onlineChars = world:getPlayersOnline()
				local thePrisoner
				for i=1,#onlineChars do
					local checkChar = onlineChars[i]
					if myPrisonerId then
					    if checkChar.id == myPrisonerId then
						    thePrisoner = checkChar
				            break
						end	
			        else 
         			    if checkChar.name == myPrisonerName then
		                    thePrisoner = checkChar
				            break
						end
                    end	
                end    
				if not thePrisoner then 
					User:inform("Character has not been found.")
				else
					thePrisoner:setQuestProgress(25,workLoad)
					thePrisoner:setQuestProgress(26,townId)
					world:gfx(41,thePrisoner.pos); 
					world:makeSound(1,thePrisoner.pos); 
					thePrisoner:warp( position(-495,-484,-40) )
					world:gfx(41,thePrisoner.pos)
				    
					local callbackLabour = function(dialogLabour) end
		            if thePrisoner:getPlayerLanguage() == 0 then		
			            dialogLabour = MessageDialog("Arbeitslager","Du wurdest verurteilt "..workLoad.." Rohstoffe aus der Mine abzubauen. Erfülle deine Strafe und du darfst wieder gehen. Spitzhacke und Essen bekommst du beim Aufseher.", callbackLabour)
		            else		
			            dialogLabour = MessageDialog("Labour camp" ,"You have been sentenced to collect "..workLoad.." resources in the mine. If you have served your sentence, you are free to go. You can get a pick-axe and food from the guard.", callbackLabour)
		            end	
		            thePrisoner:requestMessageDialog(dialogLabour)
				    thePrisoner:createItem(2763,1,777,nil)
				end
			else
                User:inform("You haven't put in all necessary informations.")
            end
		end	
	end
	local dialog = InputDialog("Sentence to forced labour","Insert: [Name|ID] [workload] Example: John Doe 300",false,255,callback)
	User:requestInputDialog(dialog)

end



function LookAtItem(User,Item)
	local data = Item:getData("lockId");
	
	if tonumber(data) == 666 and User:isAdmin() then
		base.lookat.SetSpecialDescription(Item, "Generalschlüssel", "Masterkey")
	end

   world:itemInform( User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.NONE) )
end