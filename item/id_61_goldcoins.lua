-- I_61.lua Goldm&uuml;nzen einschmelzen

-- UPDATE common SET com_script='item.id_61_goldcoins' WHERE com_itemid IN (61);

require("base.common")

module("item.id_61_goldcoins", package.seeall)

if not InitTime then
	InitTime=true;
	TimeList = {};
end

function UseItem(User, SourceItem)

   	if TimeList[User.id]~=nil then
		if  ( (math.abs(world:getTime("second") - TimeList[User.id]) ) <=3) then  --1 Rl. second delay
			return;
		end
	end
   	TimeList[User.id] = world:getTime("second");
		
	if math.random(2) == 1 then	gValue = "Kopf"; eValue = "head";
	else gValue = "Zahl"; eValue = "tail"; end    
	
	User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt "..gValue..".", "#me throws a coin in the air and catches it again. It shows "..eValue..".")

end