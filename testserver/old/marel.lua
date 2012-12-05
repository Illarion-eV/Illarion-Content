	--position: 236	-220	0
	
	
	--dofile("npc_henning_broomshrub.lua");
	--dofile("npc_mineth.lua");
	--dofile("npc_borold_blabbermouth.lua");
	--dofile("npc_torina_scibrim.lua" );

	--dofile("npc_winfried_birks.lua");

--	dofile("npc_nanginis_nargunpriest.lua");
require("base.common")
require("npc.base.autonpcfunctions") --für die Funktion npc.base.autonpcfunctions.increaseLangSkill
module("npc.marel", package.seeall)

function nextCycle()
end



function receiveText(texttype, message, originator) 

	thisNPC:increaseSkill(1,"common language",100); 
	Face_Direction = originator:getFaceTo() 
	Right_Hand = originator:getItemAt(6) 
	Left_Hand = originator:getItemAt(5) 
	R_Item_Name = world:getItemName(Right_Hand,1) 
	L_item_Name = world:getItemName(Left_Hand,1) 
	NpcTrig={}; 
	NpcAnsw={}; 

	NpcTrig[1]="[Cc]heck [Mm]e";
	 
	NpcAnsw[1]="You are looking"..Face_Direction..". You have a "..R_Item_Name.."in your right hand, and a "..L_item_Name.."in your left hand."; 

	thisNPC:talk(Character.yell, NpcAnsw[1]); 


--[[	if not FirstTime then
		TradStdLang=0;
	    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
	    thisNPC.activeLanguage=TradStdLang;
	    FirstTime=true;
    end
    
   if(string.find(string.lower(Text), "check me") ~= nil or string.find(string.lower(Text), "überprüfe mich") ~= nil) then
      local dir = Originator:getFaceTo();
      if(dir == 0) then
         thisNPC:talkLanguage(Character.yell, Player.german, "Du schaust nach Norden!");
         thisNPC:talkLanguage(Character.yell, Player.english, "You are looking to the north!");
      elseif(dir == 2) then
         thisNPC:talkLanguage(Character.yell, Player.german, "Du schaust nach Osten!");
         thisNPC:talkLanguage(Character.yell, Player.english, "You are looking to the east!");
      elseif(dir == 4) then
         thisNPC:talkLanguage(Character.yell, Player.german, "Du schaust nach Süden!");
         thisNPC:talkLanguage(Character.yell, Player.english, "You are looking to the south!");
      elseif(dir == 6) then
         thisNPC:talkLanguage(Character.yell, Player.german, "Du schaust nach Westen!");
         thisNPC:talkLanguage(Character.yell, Player.english, "You are looking to the west!");
      end
      local handitemr = Originator:getItemAt(Character.right_tool);
      local handiteml = Originator:getItemAt(Character.left_tool);
      if(handitemr ~= nil and handitemr.id ~= 0) then
         base.common.InformNLS(Originator, "Du hältst gerade das Item "..world:getItemName(handitemr.id, Player.german).." in der rechten Hand.", "You are holding the item "..world:getItemName(handitemr.id, Player.english).." in your right hand currently.");
      else
         base.common.InformNLS(Originator, "Du hältst gerade nichts in der rechten Hand.", "You are holding nothing in your right hand currently.");
      end
      if(handiteml ~= nil and handiteml.id ~= 0) then
         base.common.InformNLS(Originator, "Du hältst gerade das Item "..world:getItemName(handiteml.id, Player.german).." in der linken Hand.", "You are holding the item "..world:getItemName(handiteml.id, Player.english).." in your left hand currently.");
      else
         base.common.InformNLS(Originator, "Du hältst gerade nichts in der linken Hand.", "You are holding nothing in your left hand currently.");
      end
   end  --]]
   
   
   
end





