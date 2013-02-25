require("base.keys")
require("base.common")
require("base.lookat")

module("item.keys", package.seeall)

-- UPDATE common SET com_script='item.keys' WHERE com_itemid IN (2121,2122,2123,2124,2141,2144,2145,2161,2556,2558,3054,3055,3056);

function UseItem(User, SourceItem)
    local DoorItem = base.common.GetFrontItem( User );
    
	if SourceItem:getData("prisonKeyOf") ~= "" then 
	    -- sentence char to forced labour
		SentenceCharacter(User,SourceItem)
	    return
	end	

	if base.keys.CheckKey(SourceItem,DoorItem) then	
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
      	if not charname == "Elvaine Morgan" and not charname == "Valerio Guilianni" and not charname == "Rosaline Edwards" and not charname == "ReFlux" then
          return; -- for now only GMs are supposed to use the keys
        end;
    end;	
	
	local myTown = SourceItem:getData("prisonKeyOf")
	local townId
	if myTown == "Cadomyr" then
	    townId = 1
	elseif myTown == "Runewick" then
        townId = 2
    elseif myTown == "Galmair" then
        townId = 3
    else
        User:inform("This prison key does not belong to any town.")
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
				    User:createItem(2763,1,777,nil)
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
   world:itemInform( User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.NONE) )
end

function MoveItemBeforeMove(User, SourceItem, TargetItem)
    if ((TargetItem.data~=3001) and (TargetItem.data~=3002)) then
        return true;
    end

    if (User:getRace() == 1) then
        return true;
    end

    if User:isAdmin() then
        return true;
    end

    if (TargetItem:getType()~=3) then
        base.common.InformNLS(User,
        "Der Schlüssel rutscht dir seltsamerweise aus der Hand.",
        "The key slips out of your hand for a strange reason.");
        return false;
    end
    return true;
end

function MoveItemAfterMove( User, SourceItem, TargetItem )
    return true;
end
