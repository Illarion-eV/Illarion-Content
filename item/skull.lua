require("base.common")

-- UPDATE common SET com_script='item.skull' WHERE com_itemid = 2038;
-- UPDATE common SET com_script='item.skull' WHERE com_itemid = 2039;

module("item.skull", package.seeall)

skullSourceItemPos={position(989,247,0),position(990,241,0),position(997,226,0)}

--[[
function LookAtItem(User,Item)

	local AmountSkull = table.getn(skullSourceItemPos)
	for i = 1,AmountSkull do	
		if (Item.pos == skullSourceItemPos[i]) then
			lookAt = SkullLookAt(User, Item)
		end
	end
	
	if lookAt then
	    world:itemInform(User, Item, lookAt)
	else
	    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
	end	
end


skullDescriptionDE={}
skullDescriptionEN={}
skullDescriptionDE[1]="Die Augen leuchten merkwürdig rot. Ob es wohl Sinn macht, die Finger in die Augenhöhlen zu stecken?"
skullDescriptionEN[1]="The eyes glow funky red. If it is useful to move your fingers inside of the eyeholes?"
skullDescriptionDE[2]="Die Augen leuchten merkwürdig blau. Ob es wohl Sinn macht, die Finger in die Augenhöhlen zu stecken?"
skullDescriptionEN[2]="The eyes glow funky blue. If it is useful to move your fingers inside of the eyeholes?"
skullDescriptionDE[3]="Die Augen leuchten merkwürdig grün. Ob es wohl Sinn macht, die Finger in die Augenhöhlen zu stecken?"
skullDescriptionEN[3]="The eyes glow funky green. If it is useful to move your fingers inside of the eyeholes?"

function SkullLookAt(User, Item)
	local lookAt = ItemLookAt();
	local AmountDescription = table.getn(skullDescriptionEN)
	for i = 1,AmountDescription do
		if (Item.pos == skullSourceItemPos[i]) then
			if (User:getPlayerLanguage()==0) then
				lookAt.name = "Schädel";
				lookAt.description = skullDescriptionDE[i]
			else
				lookAt.name = "Skull";
				lookAt.description = skullDescriptionDE[i]
			end
		end
	end
	return lookAt
end ]]--


typoOfFlame={359,360,372}

function UseItem(User, SourceItem)
	local AmountSkull = table.getn(skullSourceItemPos)
	for i = 1,AmountSkull do
		if (SourceItem.pos == skullSourceItemPos[i]) then
			local flame = typoOfFlame[i]
			BlowOutFlames(User,flame)
		end
	end
	if User:getQuestProgress(668) ~= 1 then
		User:inform("Nichts passiert als du die Finger in die Augenhöhlen des Schädels reinsteckst.", "Nothing happens as you put your fingers into the eye holes of the skull.")
	end
	User:setQuestProgress(668,0)
end




function BlowOutFlames(User,flame)

--debug("test1: "..User.name)
	local AmountSkull = table.getn(skullSourceItemPos)
	for xx=986,998 do
		for yy=211,235 do
			local positionFlame = position(xx,yy,0)
			local checkFlame = world:getItemOnField(positionFlame)
			if checkFlame.id == flame then
				world:erase(checkFlame,checkFlame.number)
				world:makeSound(13,User.pos)
				if User:getQuestProgress(668) ~= 1 then
					User:setQuestProgress(668,1)
				end
			end
		end
	end

end 

