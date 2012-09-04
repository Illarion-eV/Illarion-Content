-- remove the resources from the dumping spot in the labour camp

require("base.common")

module("scheduled.labour_camp_Resources", package.seeall)


function RemoveResources(User)
    depositPositions = {position(-492,-489,-40),position(-492,-488,-40),position(-491,-488,-40),position(-491,-489,-40)}
	for i=1,4 do
	    User:inform("feld "..i)
		local myPosition = depositPositions[i] 
	    CheckCharacter(myPosition)
        local myField = world:getField(myPosition)
        local stackNumber = myField:countItems()
        User:inform("stackNumber "..stackNumber)
		local noCounter = 0
		--[[for i=0,3 do
		    local myItem = myField:getStackItem(i+noCounter)
			if myItem ~= 0 then	
				User:inform("debug2 "..myItem.id)
				if myItem.id == 21 or myItem.id == 22 or myItem.id == 2536 or myItem.id == 234 then
					User:inform("debug3 "..myItem.id)
					world:erase(myItem,myItem.number)
				else
				   noCounter = noCounter + 1
				end		
            end				
	        world:gfx(46,myPosition)
		end]]
    end
end 

function CheckCharacter(myPosition)
    
	if world:isCharacterOnField(myPosition) then
	    local myPerson = world:getCharacterOnField(myPosition)
		local myCenter = position(-490,-483,-40)
		local radius = 3
		local warpTo = false
		for i = 1, 10 do
			local loc = position( myCenter.x - radius + math.random( 2*radius ), myCenter.y - radius + math.random( 2*radius ), myCenter.z )
		    if not world:isCharacterOnField( loc ) and not world:isItemOnField( loc ) and (world:getField( loc ):tile()~=6) then
		        warpTo = loc
		        break      
		    end
		end	
		if warpTo == false then -- no free field found, we just warp him to the field he's already standing on
		    warpTo = myPerson.pos
		end
		
		myPerson:talkLanguage(Character.say,Player.german,"#me wird durch die Luft gewirbelt und prallt auf den Boden.")
		myPerson:talkLanguage(Character.say,Player.english,"#me is through through the air and plummets to the ground.")
		myPerson:forceWarp(warpTo)
	end	
end