-- I_2744_pfeife.lua
--
require("base.common")
require("item.general.wood")

module("item.id_2744_pipe", package.seeall, package.seeall(item.general.wood))

-- UPDATE common SET com_script='item.id_2744_pipe' WHERE com_itemid = 2744;

--[[This item has been claimed by faladron to do his biding and sate his scripting curiosity.
	It will do anything and everything with the exception of what should be expected from it]]
function UseItem( User, SourceItem, TargetItem, Counter, Param)
	playername = User.lastSpokenText 
	CheckIfOnline
	if found = true then 
	User:inform("Noob found!")
	else
	User:inform("Noob not found!")
	end
	
	--[[ if ( SourceItem.number == 1 ) then  --1 Würfel

		WurfEins = (math.random(6))
		if WurfEins == 1 then	gValue = "ein Auge"; eValue = "one eye";
		elseif WurfEins == 1 then	gValue = "ein Augen"; eValue = "one eye"; 
		elseif WurfEins == 2 then	gValue = "zwei Augen"; eValue = "two eyes";
		elseif WurfEins == 3 then	gValue = "drei Augen"; eValue = "three eyes";
		elseif WurfEins == 4 then	gValue = "vier Augen"; eValue = "four eyes";
		elseif WurfEins == 5 then	gValue = "fünf Augen"; eValue = "five eyes";
		else
		gValue = "sechs Augen"; eValue = "six eyes"; end    
		
		User:talkLanguage(Character.say, Player.german, "#me rollt einen Würfel. Er zeigt "..gValue.." oben.");
		User:talkLanguage(Character.say, Player.english, "#me rolls a dice. It shows "..eValue.." on top.");
		
		
	--elseif ( SourceItem.number >= 10) then --2 Würfel
		WurfEins = (math.random(6))
		if WurfEins == 1 then	gValue = "ein Auge"; eValue = "one eye";
		elseif WurfEins == 1 then	gValue = "ein Augen"; eValue = "one eye"; 
		elseif WurfEins == 2 then	gValue = "zwei Augen"; eValue = "two eyes";
		elseif WurfEins == 3 then	gValue = "drei Augen"; eValue = "three eyes";
		elseif WurfEins == 4 then	gValue = "vier Augen"; eValue = "four eyes";
		elseif WurfEins == 5 then	gValue = "fünf Augen"; eValue = "five eyes";
		else
		gValue = "sechs Augen"; eValue = "six eyes"; end  
		WurfSwai = (math.random(6))
		if WurfSwai == 1 then	gValue = "ein Auge"; eValue = "one eye";
		elseif WurfSwai == 1 then	gValue2 = "ein Augen"; eValue2 = "one eye"; 
		elseif WurfSwai == 2 then	gValue2 = "zwei Augen"; eValue2 = "two eyes";
		elseif WurfSwai == 3 then	gValue2 = "drei Augen"; eValue2 = "three eyes";
		elseif WurfSwai == 4 then	gValue2 = "vier Augen"; eValue2 = "four eyes";
		elseif WurfSwai == 5 then	gValue2 = "fünf Augen"; eValue2 = "five eyes";
		else
		gValue2 = "sechs Augen"; eValue2 = "six eyes"; end  
		
		User:talkLanguage(Character.say, Player.german, "#me rollt 2 Würfel. Sie zeigen "..gValue.." und"..gValue2.." oben.");
		User:talkLanguage(Character.say, Player.english, "#me rolls 2 dice. They show "..eValue.." and"..gValue2.." on top.");
		
	end
end]]
   
	--local ammountSib = User:countItemAt("belt",155);
	--local ammountTob = User:countItemAt("belt",772);
	if (User:countItemAt("belt",155) == 0 and User:countItemAt("belt",772) == 0) then
		base.common.InformNLS( User,
        "Du benötigst Sibanac-Blätter oder Tabak um Pfeife rauchen zu können.",
        "You need sibanac-leaves or tobacco to smoke a pipe." );
		
		
	elseif (User:countItemAt("belt",155) ~= 0) then 
		User:talkLanguage(Character.say,Player.german ,"#me nimmt einen tiefen Zug von der Pfeife.");
		User:talkLanguage(Character.say,Player.english,"#me takes a deep drag from the pipe.");
		User:eraseItem( 155, 1 );
			
	elseif (User:countItemAt("belt",772) ~= 0) then
		User:talkLanguage(Character.say,Player.german ,"#me bläst einen Rauchkringel in die Luft.");
		User:talkLanguage(Character.say,Player.english,"#me puffs a ring of smoke into the air.");
		User:eraseItem( 772, 1 );
	--[[Effekt setzen falls noch nicht vorhanden
	-- LTE to get High, currently not working
			find, stonedEffect = Character.effects:find(19);
			if find then
			found, stonedIndex = stonedEffect:findValue("stonedIndex");
			if found then
			stonedEffect:addValue("stonedIndex",(stonedIndex+1));
			end
			else

			Character.effects:addEffect( LongTimeEffect(19,10) );
			end]]

	end
end

function CheckIfOnline(playername)
   local playerlist = world:getPlayersOnline();
      local idx = 0;   --index
   local playerfound = false;
   
   for i = 1, table.getn(playerlist) do -- check all found players
   
      if string.find(playerlist[i].name, playername) ~= nil then
         found = true;
         idx = i;
      end
   end
   
   return found, playerlist[idx];   
end   	

	
	
function LookAtItem(User, Item)
	
	local customText = base.lookat.GetItemDescription(User,Item,2,false,false);
	if Item.data > 2^30 then
		world:itemInform( User, Item, customText );
	else
		world:itemInform( User, Item, User:getPlayerLanguage()==0 and
			world:getItemName(Item.id,0) or
			world:getItemName(Item.id,1) );
	end
end
