-- I_61.lua Goldm&uuml;nzen einschmelzen

-- UPDATE common SET com_script='item.id_61_goldcoins' WHERE com_itemid IN (61);

require("base.common")

module("item.id_61_goldcoins", package.seeall)

if not InitTime then
	InitTime=true;
	TimeList = {};
end

function UseItem(User, SourceItem)
	if ( SourceItem.number == 1 ) then  --works only with 1 coin

    	if TimeList[User.id]~=nil then
			if  ( (math.abs(world:getTime("second") - TimeList[User.id]) ) <=3) then  --1 Rl. second delay
				return;
			end
		end
      	TimeList[User.id] = world:getTime("second");
		
		if math.random(2) == 1 then	gValue = "Kopf"; eValue = "head";
		else gValue = "Zahl"; eValue = "tail"; end    
		
		User:talkLanguage(Character.say, Player.german, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt "..gValue..".");
		User:talkLanguage(Character.say, Player.english, "#me throws a coin in the air and catches it again. It shows "..eValue..".");

	end
	
	
	if (User:isAdmin()) then
	
		world:createItemFromId(10, 1 ,position (240,732,0),false, 0, 0);
        world:createItemFromId(10, 1 ,position (240,722,0),false, 0, 0);
        world:createItemFromId(10, 1 ,position (250,732,0),false, 0, 0);
        world:createItemFromId(10, 1 ,position (250,722,0),false, 0, 0);
        
        User:inform("portale stehen nahe 240,732,0 rum");
        
		world:createItemFromId(434, 1 ,position (220,735,0),false, 333, 333);
        world:createItemFromId(434, 1 ,position (220,737,0),false, 333, 333);
        world:createItemFromId(434, 1 ,position (220,739,0),false, 333, 333);
        world:createItemFromId(434, 1 ,position (220,741,0),false, 333, 333);
        world:createItemFromId(434, 1 ,position (220,743,0),false, 333, 333);

		world:createItemFromId(434, 1 ,position (33,20,0),false, 333, 333);    --elevator test
		world:createItemFromId(434, 1 ,position (33,10,0),false, 333, 333);
		
        User:inform("hebel stehen nahe 220,735,0 rum");
        
        
	end
end