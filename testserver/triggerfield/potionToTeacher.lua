-- INSERT INTO triggerfields VALUES (952,766,5,'triggerfield.potionToTeacher');
-- INSERT INTO triggerfields VALUES (376,223,0,'triggerfield.potionToTeacher');
-- INSERT INTO triggerfields VALUES (137,543,0,'triggerfield.potionToTeacher');

require("base.common")
require("item.id_3109_open_pell")
require("alchemy.base.alchemy")

module("triggerfield.potionToTeacher", package.seeall)


function getNPC(Item)

    local myNPC = false
    local npcList = world:getNPCSInRangeOf(Item.pos,5)
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

function getTown(Item)

    if Item.pos == position(952,766,5) then
	    return "Runewick"
	elseif Item.pos == position(137,543,0) then
	    return "Cadomyr"
	elseif Item.pos == position(376,223,0) then
        return "Galmair"
    end		
	return false
end

function PutItemOnField(Item,User)
    
	 -- is the char an alchemist?
	local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Mir ist nicht bekannt, dass Ihr ein Alchemist sein sollt. Nehmt Euer Zeug wieder weg.","I haven't heard you being an alchemist. Take your stuff from my table.")
	if not anAlchemist then
		return
	end
	
	local town = getTown(Item)
	if town == false then
	    return
	end	
	local myNPC = getNPC(Item)
	local ListTaskItem = item.id_3109_open_pell.ListTaskItem[town]
	if ListTaskItem == nil then
	    item.id_3109_open_pell.Init()
	end
	ListTaskItem = item.id_3109_open_pell.ListTaskItem[town]
	local success = false
	local myListPos
	for i=1,#ListTaskItem do 
	    if Item.id == ListTaskItem[i][1] then
		    if (ListTaskItem[i][2] == false) or (math.floor(Item.quality/100) >= ListTaskItem[i][2]) then
			    if ListTaskItem[i][3] == nil then
				    success = true
					myListPos = i
					break
				else
                    local dataCheck = true
					for i=3,#ListTaskItem do
                        if not (Item:getData(ListTaskItem[i][1]) == ListTaskItem[i][2]) then
                            dataCheck = false
							break
                        end
                    end
					if dataCheck == true then
					    success = true
                        myListPos = i
					    break
					end	
                end     					
	        end
	    end
	end
    if success == false then
	    myNPC:talkLanguage(Character.say,Player.english,"I won't teach you anything for this. Have a look at my list, show me what you would liek to leran and I will tell you what you have to give me in return.")
		myNPC:talkLanguage(Character.say,Player.german,"Dafür werde ich Euch nichts lehren. Schaut auf meine Liste und zeigt mir, was Euch interessiert und ich sage Euch, was ich dafür verlange.")
	
	else
        local ListEffectId = item.id_3109_open_pell.ListEffectId[town]
		if User:getQuestProgress(ListEffectId[myListPos]+1000) ~= 0 then
		    myNPC:talkLanguage(Character.say,Player.german,"Mhh. Ich würde Euch wohl dafür etwas zeigen, aber Ihr macht den Eindruck, diese Kenntnisse schon zu haben.")
		    myNPC:talkLanguage(Character.say,Player.english,"Mhh. Well, I would teach you something for this, but you seem to already have this knowledge.")
		else
			myNPC:talkLanguage(Character.say,Player.german,"Ah! Sehr gut, sehr gut! Nun denn, Ihr habt es Euch verdient. Schaut genau her.")
			myNPC:talkLanguage(Character.say,Player.english,"Ah! Very good, very good! Well, you've earned your pay. Look closely.")
			world:eraseItem(Item,1)
			myNPC:talkLanguage(Character.say,Player.german,"#me beginnt sorgsam und langsam die einzelnen Zutaten vorzubereiten und dann zu verarbeiten, darauf Acht gebend, dass keine Unbefugten es sehen können. \"So geht das richtig.\"")
			myNPC:talkLanguage(Character.say,Player.english,"#me starts to prepare the ingredients carefully and slowly and then to worken them, while making sure that no unasked eyes have a look at it. \"So geht das richtig.\"")
			User:setQuestProgress(ListEffectId[myListPos]+1000,1)
			User:inform("Du bist jetzt in der Lage den Trank zu fertigen.","You are now able to create this potion.")
		end	
	end					
end