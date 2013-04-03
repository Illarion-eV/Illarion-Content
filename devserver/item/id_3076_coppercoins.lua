--UPDATE common SET com_script='item.id_3076_coppercoins' WHERE com_itemid=3076;
require("base.common")

module("item.id_3076_coppercoins", package.seeall)

TimeList = {};

function UseItem(User, SourceItem)
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