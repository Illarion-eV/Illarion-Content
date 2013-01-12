--name="Asgrimur"
--race=dwarf
--position=137, -191, -3
--direction= west
--sex=male
--Location: Silverbrand
--Task    : Herold for the King
--Normal: 0 Flüstern: 1, Schreien: 2


-- INSERT INTO npc VALUES (nextval('npc_seq'),1,137,-191,-3,6,false,'Asgrimur','npc_asgrimur.lua',0);

require("npc.base.autonpcfunctions")
require("base.common")
module("npc.asgrimur", package.seeall)

function useNPC(user)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't touch me!") end
end


function initializeNpc()
    npc.base.autonpcfunctions.InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);

    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]rü[ßs]+e","Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[hH]allo");
    npc.base.autonpcfunctions.AddAdditionalText("Guten Tag");
	npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Auf wiedersehen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalText("Auf bald");


    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ho","I am "..thisNPC.name..". I am the herold of the King of Silverbrand.");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er","Ich bin "..thisNPC.name..". Ich bin der Herold des Königs von Silberbrand.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reetings","Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings");
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Farewell.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");

    TradSpeakLang={0,2};
    TradStdLang=0;
    --common language=0
    --human language=1
    --dwarf language=2
    --elf language=3
    --lizard language=4
    --orc language=5
    --halfling language=6
    --fairy language=7
    --gnome language=8
    --goblin language=9
    --ancient language=10

end

function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,1) then

             	local players = world:getPlayersInRangeOf(thisNPC.pos, 10);
                	for i, player in pairs(players) do
                    	player:introduce(thisNPC);
					end

			 if (originator.id==1322717830) then  --only Manron can use the Herold
			 	if (string.find(message,"[Ee]mote")~=nil) then
					a,b=string.find(message,"[Ee]mote"); --where does "emote" start and end?
					
					emote = string.sub (message, b+1); --puts the Text which comes after "emote" in a variable
				
					thisNPC:talk(Character.say,"#me "..emote);   --Lets emote
            	 end
				if (string.find(message,"[Ss]chweig")~=nil) then schweig=true; end --stops speaking

				if (texttype==1 and schweig==false and string.find(message,"[(][(]")==nil  --is the originator whispering and NOT using ooc?
					and string.find(message,"[Ss]prich")==nil and string.find(message,"[Ee]mote")==nil) then
				
				 thisNPC:talk(Character.yell, message);   --Yell the message of player
				end
				

				if(string.find(message,"[Ss]prich")~=nil and schweig==true) then    --starts speaking again
				    schweig=false;
				elseif (schweig==nil) then
				    schweig=true;
				end
			 
			 else
                npc.base.autonpcfunctions.TellSmallTalk(message, originator); --npc.base.autonpcfunctions.TellSmallTalk for everyone beside Manron
			 end

    end
end
