require("base.common")

module("item.id_3077_silvercoins", package.seeall)

-- UPDATE common SET com_script='item.id_3077_silvercoins' WHERE com_itemid IN (3077);

TimeList = {};

function UseItem(User, SourceItem)
local frontItem = base.common.GetFrontItem(User)
	if not frontItem then
	    return
	end	

	if frontItem.id == 2805 and frontItem.pos == position(415, 273, -6) then --if frontItem is questpillar
		if User:getQuestProgress(170) == 0 then
			User:setQuestProgress (170, 1)
			User:inform('Die Münze fällt durch den Schlitz und mit einem metallischen Klicken öffnet sich eine versteckte Klappe in der Säule, aus der ein Schild fällt.', 'The coin falls into the slit and with a metallic click a hidden hatch opens and a shield drops out.')
			world:erase(SourceItem,1)
			local data = {}
			data.descriptionDe="Geweihter Schild Ronagans"
			data.descriptionEn="Blessed Shield of Ronagan"
			User:createItem(17, 1, 799, data)
		else
			User:inform('Die Münze verschwindet im Schlitz, aber nichts passiert.', 'The coin disappears but nothing happens.')
			world:erase(SourceItem,1)
		end
	
	else --works only if frontItem isn't the questpillar
		if ( SourceItem.number == 1 ) then  --works only with 1 coin

			if TimeList[User.id]~=nil then
				if  ( (math.abs(world:getTime("second") - TimeList[User.id]) ) <=3) then  --1 Rl. second delay
					return;
				end
			end

		
			if math.random(2) == 1 then	gValue = "Kopf"; eValue = "head";
			else gValue = "Zahl"; eValue = "tail"; end    
		
			User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt "..gValue..".", "#me throws a coin in the air and catches it again. It shows "..eValue..".")
			TimeList[User.id] = world:getTime("second");
		end
	end
end