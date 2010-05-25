--[[name="Krudash "
position=-63,-142,0
sex=male 
race=orc
direction=south
radius=0
Task: Guard at the orc embassy
last updated: 15/10/09
by: Juniper Onyx
]]--
-- INSERT INTO npc VALUES (nextval('npc_seq'),4,-63,-142,0,6,false,'Krudash','npc_krudash_orcguard.lua',1);
require("base.common")
require("npcs.base.autonpcfunctions")
require("base.keys")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Nimm Greifer deine weg, sonst du haben gleich keine mehr!"); 
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Nub touch meh, stoopid!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********
	
   	AddTraderTrigger("[Gg]rü[sß]","Ullo."); 
    AddAdditionalTrigger("[Hh]allo"); 
    AddAdditionalTrigger("[Gg]rue[sß]"); 
    AddAdditionalTrigger("[Tt]a[gc].*"); 
    AddAdditionalText("Grubas!"); 
    AddTraderTrigger("[Aa]uf [Bb]ald","Farebas."); 
    AddAdditionalTrigger("[Gg]ötter.+euch"); 
    AddAdditionalTrigger("[Bb]is.+[Bb]ald"); 
    AddAdditionalTrigger("[Aa]uf.+[Bb]ald"); 
    AddAdditionalTrigger("[Ff]ünf.+euch"); 
    AddTraderTrigger("[Ww]er [bs][ie][si][td] [di][uh].*","Mir Gefängniswärter für Orktor! Keine Ratte hier rein kommen ohne dass "..thisNPC.name.." merken!"); 
    AddAdditionalTrigger("[Ww]ie.+[Nn]ame"); 
    AddTraderTrigger("[Hh]ilfe",""..thisNPC.name.." dir nur kann öffnen Tor! Muss bewachen Tor! Frag anderen Bruder oder Schwester für andere Sachen!"); 
    AddTraderTrigger("[Ww]as.+[Mm]ach.*t",""..thisNPC.name.." öffnen und schließen Gefängnis! Du wollen rein oder raus? Dann du mir sagen Losungswort!"); 
    AddTraderTrigger("[Ll]osung.*[Ww]ort","#me grunzt verärgert 'Du denken "..thisNPC.name.." Maden im Kopf haben? Ich dir nicht sagen Wort! Mir nur hören auf Brüder und Schwester, die wissen Wort!'"); 
    AddTraderTrigger("[Hh]eilig.*[Bb]erg","Dies hier sein Heiliger Berg, yubba! Heiliger Berg von 'Vater'!"); 


   	AddTraderTrigger("[Gg]reeting","Greebas!"); 
    AddAdditionalTrigger("[Hh]ello"); 
    AddAdditionalTrigger("Gr.*eebs"); 
    AddAdditionalTrigger("Gr.*eebas"); 
    AddAdditionalText("Greebs"); 
   	AddTraderTrigger("[Gg]oodbye","Farrebas!"); 
    AddAdditionalTrigger("[Bb]ye"); 
    AddAdditionalTrigger("[Ff]ar.*e.*well"); 
    AddAdditionalTrigger("[Ff]ar.*ebas"); 
    AddAdditionalTrigger("[Ff]ive.+you"); 
    AddAdditionalTrigger("[Ff]ive.+yoo"); 
    AddAdditionalText("Goodbyes."); 
  	AddTraderTrigger("[Ww]ho.+yo.+","Meh beh "..thisNPC.name..", nub single rat whub enterr orc embassy witout meh sees it!"); 
  	AddTraderTrigger("[Ww]hat.+[Nn]ame", "Meh "..thisNPC.name.."! Meh guard ob orc embassy!"); 
  	AddTraderTrigger("[Ww]hub.+[Nn]ame", "Meh "..thisNPC.name.."! Meh guard ob orc embassy!"); 
  	AddTraderTrigger("[Hh]elp",""..thisNPC.name.." nub can help yoo muchs! Ask ottur bruddah or sistah! Meh busy beh guardin...hurr, yoo hab seen rat running dere?!"); 
  	AddTraderTrigger("[Ww]hat.+[Yy]o.*do",""..thisNPC.name.." opens and closes embassy! Yoo wunt get in or out? Den tell meh keyword"); 
  	AddTraderTrigger("[Kk]ey.*[Ww]ord","Yoo tink "..thisNPC.name.." stoopid beh? Meh nub tell yoo keyword! Meh just open gate fer bruddahs and sistahs whoo know word!"); 
    AddAdditionalTrigger("[Pp]as.*word");  


    AddTraderTrigger("buy","Tanks, meh hab eberytin' meh need."); 
    AddTraderTrigger("sell","Meh nub sell anyting! Meh looks like merchant? Hurrr, nub!"); 
    AddTraderTrigger("[Ww]hat.+buy","Tanks, meh hab all meh need."); 
    AddTraderTrigger("[Ww]hat.+sell","Meh nub sell anyting! Meh do look like merchant? Hurrr, nub!"); 
    AddTraderTrigger("[Vv]erkaufen","Mir verkaufen nichts. "..thisNPC.name.." aussehen wie Händler?"); 
    AddTraderTrigger("[Kk]aufen","Danks, mir haben alles was Ork brauchen!"); 
    AddTraderTrigger("[Ww]as.+verkaufst","Mir verkaufen nichts. "..thisNPC.name.." aussehen wie Händler?"); 
    AddTraderTrigger("[Ww]as.+kaufst","Danks, mir haben alles was Ork brauchen!"); 


--TRIGGER FUER LOCATIONS ENGLISCH    
    AddTraderTrigger("[Gg]obaith","Tis whole island beh called Gobaith. Nice place, yubba! Good hunting grounds here beh near holy mountain!"); 
    AddCondition("lang","english"); 
    AddTraderTrigger("[Gg]obiath","Tis whole island beh called Gobaith. Nice place, yubba! Good hunting grounds here beh near holy mountain!"); 
    AddCondition("lang","english"); 
    AddTraderTrigger("[Gg]reenbriar","Greenbriar beh small settlement ob tiny and tasty Halflings. Albays good turr go dere fer snack. *he laughs*"); 
    AddCondition("lang","english"); 
    AddTraderTrigger("[Hh]arbo.*r","Oomie town Troll's Bane and Vanima both hab harbors. The one southwest ob oomie town beh bigger though. Beddur nub go turr smelly elfie island!"); 
    AddTraderTrigger("[Hh]ellbriar","Hellbriar wus place ob sum servants ob our 'father' in past. Buts dere nub any orcs beh in dis Cult anymor', so father left dem alone and dey all got smashed, dey say."); 
    AddCondition("lang","english"); 
    AddTraderTrigger("[Mm]agic [Aa]cademy","Yoo nub wunt go dere! Smelly mages beh dere. Dey nub honorable warriors beh but cowards! Dey whub burrrn yoo... ib yoo lucky beh!"); 
    AddTraderTrigger("[Mm]age [Aa]cademy","Yoo nub wunt go dere! Smelly mages beh dere. Dey nub honorable warriors beh but cowards! Dey whub burn yoo... ib yoo lucky beh!"); 
    AddTraderTrigger("[Nn]orthmark","Dey lib on ottur side ob island far in north. Dey hab strrong warriors meh hab heard! And best beh dat dey nub like magic neithurrr - jus' bit like orcs, hurrr."); 
    AddTraderTrigger("[Ss]ilverbrand","Dis beh stumpie town. Dey hab best smithes on isle, still dey beh hairy stumpies. Meh whub tink twice befor' going into deir halls!"); 
    AddTraderTrigger("[Vv]anima","Tol Vanima ? Dis beh island full ob flowers, trees and elfies. Beddur avoid going dere! Dey nub like visitors!"); 
    AddCondition("lang","english"); 
    AddTraderTrigger("[Tt]roll['s].*[Bb]ane","Oomie town Troll's Bane beh biggest town on Gobaith. Though, orcs ususally get in trouble in here! Beh careful when passing town gates!"); 
    AddCondition("lang","english"); 
    AddTraderTrigger("[Vv]arshikar","Desert town Varshikar beh far abay from here! Orcs hab peace wit dem! Treat dem fair and dey whub treat yoo fair toos! But beh careful ob mages in desert town!"); 
    AddCondition("lang","english"); 
    AddTraderTrigger("[Dd]esert.*town","Desert town Varshikar beh far abay from here! Orcs hab peace wit dem! Treat dem fair and dey whub treat yoo fair toos! But beh careful ob mages in desert town!"); 
    
--Charakter-Trigger 
    AddTraderTrigger("[Ff]ather","Yoo nub know father ob orcs? *he snorts* Yoo should talk turr Chief den! He whub make yoo rememburr 'fathurr' fer yoos whole life!"); 
    AddCondition("lang","english"); 
    
--SONSTIGE TRIGGER 
    AddTraderTrigger("[Cc]lan", "Yubba, dis beh embassy ob strong orc clan! Tell meh clan name and meh whub open gate fer yoo!"); 
    AddTraderTrigger("[Dd]eser.*t", "#me snorts 'Da desert ob Kumdah beh in south ob orc lands! Oomies and scorpies beh all yoo whub find dere. Some rich mines beh dere after all.'"); 
    AddTraderTrigger("[Ww][üue]ste", "#me schaubt 'Wüste Kumdah in Süden sein von Orkland! Menschen und Skorpione sein alles du finden da! Die Berge immerhin haben reiche Schätze.'"); 
    AddTraderTrigger("Or.*c.*", "#me hits his chest with his right fist and grunts 'Hurrr, Orc Nation beh strrongest! Praise father and holy mountain!'"); 
    AddTraderTrigger("Or.*k.*", "#me schlägt mit seiner rechten Faust auf seine Brust 'Hurrr, Ork Nation die stärksten sein! Ehre für unseren Vater und heiligen Berg!'");  
    AddTraderTrigger("Tor", "Du wollen dass mir machen Tor auf? Dann du mir sagen Losungswort!"); 
    AddTraderTrigger("Gate", "Yoo wunt meh open da gate? Den tell meh da keyword!"); 
    AddTraderTrigger("Moshran", "#me growls angrily and shouts at you 'Nub tell father's name! Dis whub brring shame on us! Call him father, hurrr... and now leave meh alone!'"); 
    AddTraderTrigger("Moshran", "#grunzt erzürnt auf und schreit dich an 'Nicht nennen Vater bei Namen! Bringt Schande über uns! Vater du ihn nennen, hurrr... und jetzt in Ruhe lassen du mich!'"); 
    AddCondition("lang","german"); 
    
    
    
--TRIGGER FÜR LOCATIONS DEUTSCH 
    AddTraderTrigger("[Gg]obiath","Insel genannt wird Gobaith. Gute Gegend für Orks! Gute Jagdgründe hier sind in Nähe von heiligem Berg!"); 
    AddCondition("lang","german"); 
    AddTraderTrigger("[Gg]obaith","Ja, diese Insel genannt wird Gobaith. Gute Gegend für Orks! Gute Jagdgründe hier sind in Nähe von heiligem Berg!"); 
    AddCondition("lang","german"); 
    AddTraderTrigger("[Gg]reenbriar","Greenbriar kleine Siedlung ist, bewohnt von klein und lecker Halblings. Immer gut da hin gehen für Leckerbissen. *er lacht grunzend auf*"); 
    AddCondition("lang","german"); 
    AddTraderTrigger("[Hh]afen","Hafen sein im Süden von Menschenstadt Troll's Bane. Auch stinkende Elfeninsel haben Hafen. Aber Wasser nix für Orkse ist, hurr!"); 
    AddTraderTrigger("[Hh]ellbriar","Hellbriarkult war von Anhängern von unser 'Vater'! Aber alle Orks haben verlassen Kult! Nicht gut er mehr ist. Nur Unheil bringen über orks, wenn du mich fragen."); 
    AddCondition("lang","german"); 
    AddTraderTrigger("[Mm]agierakademie","Du besser nicht gehen besuchen Magier! Sie keine Ehre haben und keinen Spaß verstehen. Sie dich gleich verbrennen oder verwandeln in Kröte mit bloßem Blick!"); 
    AddTraderTrigger("[Nn]ordmark","Die Nordmarkmänner gute Menschen sein! Wie Orks sie nicht mögen Magie! Auch Nordmarkfrauen mit Waffen umgeh'n könn'! Trotzdem sie stinkende Menschen bleiben!"); 
    AddTraderTrigger("[Ss]ilberbrand","Zwergenstadt groß und heiß sein. Schmelzofen laufen ganzen Tag und Hammerschläge erfüllen Hallen immer mit Lärm. Wenn nicht Zerge wären da, schöner Ort es wäre."); 
    AddTraderTrigger("[Vv]anima","Hurr! Fern bleiben du von dieser stinkenden Elfeninsel! Nur Unheil auf Orks dort warten!"); 
    AddCondition("lang","german"); 
    AddTraderTrigger("[Tt]roll['s].*[Bb]ane","Menschenstadt in Mitte der Insel du fragen nach? Groß und hässlich sie sein! Orkse nicht gern gesehen heir! Nim Waffen mit, wenn du in Stadt müssen!"); 
    AddCondition("lang","german"); 
    AddTraderTrigger("[Vv]arshikar","Meisten Wesen dort dumm und stinkig - aber Clanführer, Grrrypus, Ehre haben! Sei gut zu Wüstenvolk, dann sie gut zu Orks sind!"); 
    AddCondition("lang","german"); 


    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,5};
    TradStdLang=0;

    increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

	doorapos=position( -62, -141, 0 );
	doorbpos=position( -62, -140, 0 );

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
 
    if BasicNPCChecks(originator,2) then  --Npc wird aus nächster Nähe angesprochen
		  if (originator.activeLanguage==5) then --If the Character speaks orcisch then...
			if (mainTask(message,originator)~=true) then
			    TellSmallTalk(message,originator);
			end
		  elseif (originator.activeLanguage==0) then --If the Character. speaks Common then
				if (standardAnswer(message,1) or standardAnswer(message,2)) then --true password but wrong language
					gText="Du sprechen orkisch zu mir, wenn ich soll anfassen Orktor!";  --HIER DIE TEXTE SCHREIBEN DIE DER NPC SAGT FALLS DAS LOSUNGSWORT RICHTIG; ABER NICHT AUF ORKISCH IST
					eText="Speak orcish ib yoo wunt meh touch da gate turr orc embassy!";
					outText=base.common.GetNLS(originator,gText,eText);
					NPCTalking(thisNPC,outText);
				else
					TellSmallTalk(message,originator);
				end
		  else --WENN EINE ANDERE SPRACHE GESPROCHEN WURDE DANN(zum Beispiel antik )
				Confused(
				"#me grunzt dich an, als er ob deine Sprache offenbar nicht versteht.",
				"#me grunts at you as he apparently does not understand you language."
				);
		  end
	elseif BasicNPCChecks(originator,8) then --Npc wird aus mehreren Schritten Entfernung angesprochen
		  if (originator.activeLanguage==5) then --If the Character speaks orcisch then...
			mainTask(message, originator);
		  elseif (originator.activeLanguage==0) then --If the Character. speaks Common then
				if (standardAnswer(message,1) or standardAnswer(message,2)) then --true password but wrong language
					gText="Du sprechen orkisch zu mir, wenn ich soll anfassen Orktor zu heiligem Berg!";  --HIER DIE TEXTE SCHREIBEN DIE DER NPC SAGT FALLS DAS LOSUNGSWORT RICHTIG; ABER NICHT AUF ORKISCH IST
					eText="Speak orcish ib yoo wunt meh touch da gate turr holy mountain!";
					outText=base.common.GetNLS(originator,gText,eText);
					NPCTalking(thisNPC,outText);
				end
		  end
	end
end

--[[
    standardAnswer
    Checks whether a string can be counted to an answertype
    @param message - string
    @param answertype - integer
    
    @return boolean - true in case message can be counted to the answertype else false
]]
function standardAnswer(message,answertype)

	if (answertype==1) then --answertype 1 == standardphrases for "open door"
		     if (string.find(message,"[Bb]roth[ae].+[Oo]pen.+[Gg]ate.*")~=nil or string.find(message,"[Oo]pen.+[Gg]ate.+[Bb]roth[ae].*")~=nil
			 or  string.find(message,"[Bb]rud[ae].+[Tt]or.*[Aa]uf.*")~=nil or string.find(message,"[Tt]or.+[Aa]uf.+[Bb]rud[ae].*")~= nil
			 or  string.find(message,"[Bb]rud[ae].+[öoe]ffne.+[Tt]or.*")~=nil or string.find(message,"[Ööe]ffne.+[Tt]or.+[Bb]rud[ae].*")~=nil) then
			 	return true;
		 	 else
		     	return false;
		 	 end

    elseif (answertype==2) then --answertype 2 == standardphrases for "close door"
			 if (string.find(message,"[Bb]roth[ae].+[Cc]lose.+[Gg]ate.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate.+[Bb]roth[ae].*")~=nil
			 or string.find(message,"[Bb]rud[ae].+[Tt]or.*[Zz]u.*")~=nil or string.find(message,"[Tt]or.+[Zz]u.+[Bb]rud[ae].*")~=nil
			 or string.find(message,"[Bb]rud[ae].+schlie[ßs].+[Tt]or.*")~=nil or string.find(message,"[Ss]chlie[ßs].+[Tt]or.+[Bb]rud[ae].*")~= nil) then
		
		   		return true;
			 else
		   		return false;
			 end
	else
        	 return false;
   	end
	
end

--[[
    mainTask
    This function checks if the Char said the mean triggers(open door, close door,...) and sets all needed variables to open/close door
    @param originator - CharStruct - the Char who talked to the NPC
    @param message - String - The text the Character spoke
    
    @return true in case the NPC said one of the mean triggers else false
]]
function mainTask(message, originator)
	if (standardAnswer(message,1)) then  --Open gate
		doora=world:getItemOnField(doorapos);
		doorb=world:getItemOnField(doorbpos);
		if (doora.id==666 and doorb.id==670) then--door already opened
			gText="Dummer Ork, Tor sein auf!";
			eText="Stoopid orc, da gate alrrready beh open!";
			outText=base.common.GetNLS(originator,gText,eText);
			NPCTalking(thisNPC,outText);
		else
			base.keys.UnlockDoor( doora ); --Tor entriegeln
			base.keys.UnlockDoor( doorb );

			doora=world:getItemOnField(doorapos);
			doorb=world:getItemOnField(doorbpos);
			OpenDoor( doora );  --Tor aufmachen
			OpenDoor( doorb );

			gText="#me öffnet das Tor.";
			eText="#me opens the gate.";
			outText=base.common.GetNLS(originator,gText,eText);
			NPCTalking(thisNPC,outText);
		end
		return true;
	elseif (standardAnswer(message,2)) then --Close gate
		doora=world:getItemOnField(doorapos);
		doorb=world:getItemOnField(doorbpos);	
		if (doora.id==654 and doorb.id==658) then --If both doors are already closed then...
			gText="Du keine Augen in deinem stinkigen Kopf haben? Tor sein schon zu!";
			eText="Yoo nub hab eyes in yoos smelly head? Da gate alrrready beh closed!";
			outText=base.common.GetNLS(originator,gText,eText);
			NPCTalking(thisNPC,outText);
		else
			if ( world:isCharacterOnField(doorapos) or world:isCharacterOnField(doorbpos)) then -- Is a char. on the position of the doors?
				gText="Ich nix können Tor zumachen wenn da jemand rumstehen!";
                eText="Me nub can close dat gate when someone standing there!";
                outText=base.common.GetNLS(originator,gText,eText);
		        NPCTalking(thisNPC,outText);	
			else
				CloseDoor( doora ); --Tore schließen
				CloseDoor( doorb );

				doora=world:getItemOnField(doorapos);
				doorb=world:getItemOnField(doorbpos);
				base.keys.LockDoor( doora ); --Tore verriegeln
				base.keys.LockDoor( doorb );
				gText="#me lässt die Flügel des Tores krachend zufallen und sperrt ab."; --HIER DIE TEXTE REINSCHREIBEN DIE BEIM ZUMACHEN KOMMEN SOLLEN
				eText="#me shuts the gate crashing then locks it.";
				outText=base.common.GetNLS(originator,gText,eText);
				NPCTalking(thisNPC,outText);
			end
		end
		return true;
	end
end
