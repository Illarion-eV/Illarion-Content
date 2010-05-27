-- I_61.lua Goldm&uuml;nzen einschmelzen

-- UPDATE common SET com_script='items.61_goldcoins' WHERE com_itemid IN (61);

require("base.common")

module("items.61_goldcoins", package.seeall)

if not InitTime then
	InitTime=true;
	TimeList = {};
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	if ( SourceItem.number == 1 ) then  --works only with 1 coin

    	if TimeList[User.id]~=nil then
			if  ( (math.abs(world:getTime("second") - TimeList[User.id]) ) <=3) then  --1 Rl. second delay
				return;
			end
		end
      	TimeList[User.id] = world:getTime("second");
		
		if math.random(2) == 1 then	gValue = "Kopf"; eValue = "head";
		else gValue = "Zahl"; eValue = "tail"; end    
		
		User:talkLanguage(CCharacter.say, CPlayer.german, "#me wirft eine M�nze in die Luft und f�ngt sie wieder auf. Sie zeigt "..gValue..".");
		User:talkLanguage(CCharacter.say, CPlayer.english, "#me throws a coin in the air and catches it again. It shows "..eValue..".");

	end
end
