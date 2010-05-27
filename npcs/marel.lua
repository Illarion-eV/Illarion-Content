	--position: 236	-220	0
	
	
	--dofile("npc_henning_broomshrub.lua");
	--dofile("npc_mineth.lua");
	--dofile("npc_borold_blabbermouth.lua");
	--dofile("npc_torina_scibrim.lua" );

	--dofile("npc_winfried_birks.lua");

--	dofile("npc_nanginis_nargunpriest.lua");
require("base.common")
require("npcs.base.autonpcfunctions") --für die Funktion npcs.base.autonpcfunctions.increaseLangSkill
module("npcs.marel")

function nextCycle()
end



function receiveText(texttype, message, originator) 

	thisNPC:increaseSkill(1,"common language",100); 
	Face_Direction = originator:get_face_to() 
	Right_Hand = originator:getItemAt(6) 
	Left_Hand = originator:getItemAt(5) 
	R_Item_Name = world:getItemName(Right_Hand,1) 
	L_item_Name = world:getItemName(Left_Hand,1) 
	NpcTrig={}; 
	NpcAnsw={}; 

	NpcTrig[1]="[Cc]heck [Mm]e";
	 
	NpcAnsw[1]="You are looking"..Face_Direction..". You have a "..R_Item_Name.."in your right hand, and a "..L_item_Name.."in your left hand."; 

	thisNPC:talk(CCharacter.yell, NpcAnsw[1]); 


--[[	if not FirstTime then
		TradStdLang=0;
	    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
	    thisNPC.activeLanguage=TradStdLang;
	    FirstTime=true;
    end
    
   if(string.find(string.lower(Text), "check me") ~= nil or string.find(string.lower(Text), "überprüfe mich") ~= nil) then
      local dir = Originator:get_face_to();
      if(dir == 0) then
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.german, "Du schaust nach Norden!");
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.english, "You are looking to the north!");
      elseif(dir == 2) then
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.german, "Du schaust nach Osten!");
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.english, "You are looking to the east!");
      elseif(dir == 4) then
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.german, "Du schaust nach Süden!");
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.english, "You are looking to the south!");
      elseif(dir == 6) then
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.german, "Du schaust nach Westen!");
         thisNPC:talkLanguage(CCharacter.yell, CPlayer.english, "You are looking to the west!");
      end
      local handitemr = Originator:getItemAt(CCharacter.right_tool);
      local handiteml = Originator:getItemAt(CCharacter.left_tool);
      if(handitemr ~= nil and handitemr.id ~= 0) then
         base.common.InformNLS(Originator, "Du hältst gerade das Item "..world:getItemName(handitemr.id, CPlayer.german).." in der rechten Hand.", "You are holding the item "..world:getItemName(handitemr.id, CPlayer.english).." in your right hand currently.");
      else
         base.common.InformNLS(Originator, "Du hältst gerade nichts in der rechten Hand.", "You are holding nothing in your right hand currently.");
      end
      if(handiteml ~= nil and handiteml.id ~= 0) then
         base.common.InformNLS(Originator, "Du hältst gerade das Item "..world:getItemName(handiteml.id, CPlayer.german).." in der linken Hand.", "You are holding the item "..world:getItemName(handiteml.id, CPlayer.english).." in your left hand currently.");
      else
         base.common.InformNLS(Originator, "Du hältst gerade nichts in der linken Hand.", "You are holding nothing in your left hand currently.");
      end
   end  --]]
   
   
   
end





