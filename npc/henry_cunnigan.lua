-- NPC for tutorial island

require("npc.base.autonpcfunctions")
require("base.common")
module("npc.henry_cunningan", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end
	QuestID=2;

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- small talk
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello my friend. If you don't know where we were or what to do next, just say 'help'.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","<",20);
    npc.base.autonpcfunctions.AddAdditionalText("Be greeted. If you don't know where we were or what to do next, just say 'help'.");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo mein Freund. Wenn Ihr nicht wisst, wo wir waren oder was Ihr als nächstes tun sollt, sagt einfach 'Hilfe'.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][ßs]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","<",20);
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt. Wenn Ihr nicht wisst, wo wir waren oder was Ihr als nächstes tun sollt, sagt einfach 'Hilfe'.");
	npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello my friend.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo mein Freund.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][ßs]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt.");
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","I'm fine, thanks. And you?");
    npc.base.autonpcfunctions.AddTraderTrigger("wie geht dir","Mir geht es gut, danke. Und Euch?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie geht euch");
    npc.base.autonpcfunctions.AddTraderTrigger("who","I am "..thisNPC.name..". I help all people who are new to Illarion.");
    npc.base.autonpcfunctions.AddTraderTrigger("wer","Ich bin "..thisNPC.name..". Ich helfe allen Leuten, die neu in Illarion sind.");
    npc.base.autonpcfunctions.AddTraderTrigger("my name","Nice to meet you. My name is "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("I am");
    npc.base.autonpcfunctions.AddAdditionalTrigger("I'm");
    npc.base.autonpcfunctions.AddTraderTrigger("mein name","Schön Euch zu treffen. Mein Name ist "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ich bin");
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I am not a trader.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddTraderTrigger("was kauf","Ich bin kein Händler.");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Farewell.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npc.base.autonpcfunctions.AddAdditionalText("Be well.");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Auf bald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leb wohl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tschue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tsch[uü][sß]");
    npc.base.autonpcfunctions.AddAdditionalText("Bis bald.");
    npc.base.autonpcfunctions.AddAdditionalText("Macht's gut.");
    npc.base.autonpcfunctions.AddAdditionalText("Lebt wohl.");
    -- explanations
    npc.base.autonpcfunctions.AddTraderTrigger("tasche","Ihr habt ja gar keine Tasche mehr! Ich gebe Euch eine. Ihr seht sie auf der rechten Seite in Eurem Inventar, links oben neben dem Kopf. Ein Rechtsklick auf sie öffnet das Kontextmenü, wählt dann 'öffnen', um die Tasche zu öffnen.");
    npc.base.autonpcfunctions.AddCondition("item",97,"body","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",97,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("bag","Oh you don't have a bag anymore! I give you one. You can see it on the right side in your inventory, top left next to the head. A right click on it opens a context menu, then choose 'open' to open the bag.");
    npc.base.autonpcfunctions.AddCondition("item",97,"body","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",97,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("tasche","Ihr seht die Tasche auf der rechten Seite, in Eurem Inventar links oben neben dem Kopf. Ein Rechtsklick auf sie öffnet das Kontextmenü, wählt dann 'öffnen', um die Tasche zu öffnen.");
    npc.base.autonpcfunctions.AddTraderTrigger("bag","You can see the bag on the right side, in your inventory top left next to the head. A right click on it opens a context menu, then choose 'open' to open the bag.");
	-- help?
	npc.base.autonpcfunctions.AddTraderTrigger(".+","Hey, was macht Ihr denn hier? Ihr seid nicht neu. Geht den Weg entlang zum Schloss und nehmt die Portale am Ende der Halle. Sie führen nach Gobaith.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","<",4);
	npc.base.autonpcfunctions.AddTraderTrigger(".+","Hey, what are you doing here? You are not new. Follow this way to the castle and take the portals at the other end of the hall. They lead to Gobaith.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","<",4);
	npc.base.autonpcfunctions.AddTraderTrigger(".+","Tut mir Leid, ich habe Euch nicht verstanden. Sagt einfach 'Hilfe', wenn Ihr nicht wisst, was zu tun ist oder wie Ihr etwas tun sollt.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger(".+","I am sorry, I didn't understand you. Say 'help' if you don't know what to do or how to do it.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1,2,3,4,5,6,7,8,9,10};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
	if (npc.base.autonpcfunctions.BasicNPCChecks(originator,2)) then
		Progress=originator:getQuestProgress(2);
		if (NPCStatus[originator.id]==nil) then
			if Progress>=20 then
				NPCStatus[originator.id]=1
			else
				NPCStatus[originator.id]=0
			end
		end
		State=NPCStatus[originator.id]
		revise=false;
		if (State>1) then
			Progress=State;
		elseif State==1 then
			if (string.find(message,"[Nn][Pp][Cc]")~=nil) then
				Progress=5;
				revise=true;
			elseif (string.find(message,"[Ss]prechfunktionen")~=nil or string.find(message,"[Tt]alking.+[Ff]unctions")~=nil) then
				Progress=6;
				revise=true;
			elseif (string.find(message,"[Oo][Oo][Cc]")~=nil) then
				Progress=8;
				revise=true;
			elseif (string.find(message,"[Gg]egenst[äa]nde")~=nil or string.find(message,"[Oo]bjects")~=nil) then
				Progress=11;
				revise=true;
			end
		end
		thisNPC.activeLanguage=originator.activeLanguage;
		gText="nothing";

		--* Newbie Text below *--
		if Progress<=4 then
			gText="Herzlich willkommen in Illarion, "..originator.name..". Mein Name ist "..thisNPC.name..". Ich bin ein NPC und meine Aufgabe ist es, Euch mit ein paar Grundfunktionen vertraut zu machen. Sagt einfach 'weiter' um fortzufahren.";
			eText="Welcome to Illarion, "..originator.name..". My name is "..thisNPC.name..". I am a NPC and my job is to make you become familiar with some basic functions. Just say 'continue' to go on.";
			originator:setQuestProgress(2,5);
		elseif (Progress==5) then
			if (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil or
			string.find(message,"[Nn][Pp][Cc]")~=nil or revise or string.find(message,"[Ww]eiter") or
			string.find(message,"[Cc]ontinue") ) then
				gText="Ich bin ein NPC (Non-Player-Character), also computergesteuert. Jeder NPC reagiert auf bestimmte Schlüsselwörter, welche er oder sie meist schon selbst nannte und somit für Euch weiterführend sind.";
				eText="I am a NPC (Non-Player-Character), thus computer controlled. Every NPC reacts on certain keywords, which he or she often already mentioned him- or herself. Therefore you can carry on by using them.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				gText="Bildet deshalb immer Sätze mit diesen Schlüsselwörtern. Viele NPCs reagieren auf 'Hallo' oder gerade die Händler reagieren auch - wie ich - auf 'Hilfe'. Vorsicht mit Groß- und Kleinschreibung! Gut, das hätten wir. Bereit für die nächste Lektion?";
				eText="Hence phrase your sentences always with these keywords. Many NPCs react on 'Hello' or especially traders react aswell on 'Help' - like I do. Beware, it's mostly case-sensitive! Good, that's it. Ready for the next lesson?";
				if State~=0 then
					NPCStatus[originator.id]=6;
				else
					originator:setQuestProgress(2,6);
				end
			end
		elseif (Progress==6 or Progress==9) then
			if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil or Progress==9 or revise) then
				gText="#me schenkt dir ein freundliches Lächeln.";
				eText="#me offers you a friendly smile.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				gText="Dies war gerade ein sogenanntes 'Emote', damit beschreibt man das Äußere seines Charakters. Einfach ein '#me' vor die Nachricht setzen, z.B.: #me ist ein gut aussehender Mann.  -Probiert doch auch mal!";
				eText="This was a so called 'emote', use it to describe the physical appearance of your character. Just put a '#me' infront of your message, e.g.: #me is a handsome man.  -Try it!";
				if State~=0 then
					NPCStatus[originator.id]=7;
				else
					originator:setQuestProgress(2,7);
				end
			elseif (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn]o")~=nil) then
				gText="Nein? Dann eben nochmal von vorne. Tun wir so, als wäret ihr gerade neu angekommen.";
				eText="No? Well, let's start from scratch. Let's act if you had been just arrived.";
				if State~=0 then
					NPCStatus[originator.id]=20;
				else
					originator:setQuestProgress(2,4);
				end
			elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
				gText="Dies war eine kleine Einführung, was NPCs sind. Bereit für die nächste Lektion? Sagt einfach 'Ja' oder 'Nein'.";
				eText="This was a short introduction what NPCs are. Ready for the next lesson? Just say 'Yes' or 'No'.";
			end
		elseif Progress==7 then
			if (string.find(message,"#me.+")~=nil) then
				a,b=string.find(message,"#me");
				if a==1 then
					gText="Sehr gut! Es gibt noch andere Sprechfunktionen, die auf die gleiche Weise funktionieren, zum Beispiel:";
					eText="Very good! There are also other talking functions, which work in the same way, for example:";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					gText="Man kann mit einem '#s' am Anfang der Nachricht schreien.";
					eText="One can shout with a '#s' at the beginning of the message.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					thisNPC:talk(CCharacter.yell,outText);
					gText="Flüstern kann man mit einem '#f'. Allerdings hören das nur Personen im Umkreis von 2 Feldern. Bereit für die nächste Lektion?";
					eText="One can also whisper with a '#w'. But only persons within a radius of 2 tiles can hear it. Ready for the next lesson?";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					thisNPC:talk(CCharacter.whisper,outText);
					if State~=0 then
						NPCStatus[originator.id]=8;
					else
						originator:setQuestProgress(2,8);
					end
					return
				else
					gText="Der Befehl '#me' muss ganz am Anfang stehen, natürlich ohne Hochkommata. Probiert nochmal!";
					eText="The command '#me' has to be put at the very beginning, of course without quotion marks. Try again!";
				end
			elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
				gText="Probiert ein Emote aus! Dazu muss ein '#me' ganz am Anfang stehen. Also müsst Ihr z.B. nur folgendes 'sagen': #me lächelt.";
				eText="Try an emote! Therefore put a '#me' at the very beginning. So you have to 'say' e.g.: #me smiles.";
			end
		elseif (Progress==8 or Progress==12) then
			if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil or Progress==12 or revise) then
				gText="Ihr müsst immer darauf achten, dass Ihr Euren Charakter (IC=In Character) und Euch selbst als Spieler (OOC=Out Of Character) unterscheidet: die Persönlichkeit, das Wissen, einfach alles.";
				eText="You always have to take care to discriminate your character (IC=In Character) and yourself as player (OOC=Out Of Character): the personality, the knowledge, just everything.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				if (originator:increaseAttrib("sex",0)==0) then
					gSex="er";
					eSex="he";
				else
					gSex="sie";
					eSex="she";
				end
				gText="Reduziert OOC Gespräche im Spiel auf ein Minimum, verhaltet Euch genau so, wie Euer Charakter es tun würde, denn "..gSex.." 'weiß' ja nicht, dass alles nur ein Spiel ist. Falls es mal nötig ist, benutzt '#o' für OOC Gespräche. Versucht mal!";
				eText="Reduce OOC talks in-game to a minimum, act exactly like your character would, because "..eSex.." does not 'know' that everything is just a game. If it is really necessary, use '#o' for OOC talks. Try it!";
				if State~=0 then
					NPCStatus[originator.id]=10;
				else
					originator:setQuestProgress(2,10);
				end
			elseif (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn]o")~=nil) then
				gText="Nein? Dann wiederholen wir die Sprechfunktionen nochmal. Sprecht mich an, sobald Ihr bereit seid.";
				eText="No? Well, let's repeat the talking funktions. Speak to me when you are ready.";
				if State~=0 then
					NPCStatus[originator.id]=20;
				else
					originator:setQuestProgress(2,9);
				end
			elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
				gText="Dies war eine kurze Anleitung für die normalen Sprechfunktionen. Bereit für die nächste Lektion? Sagt einfach 'Ja' oder 'Nein'.";
				eText="This was a short tutorial for the normal talking functions. Ready for the next lesson? Just say 'Yes' or 'No'.";
			end
		elseif Progress==10 then
			if (string.find(message,"[(][(].+[)][)]")~=nil) then
				a,b=string.find(message,"[(][(].+[)][)]");
				if (a==1 and b==string.len(message) and texttype == CCharacter.whisper) then
					gText="Sehr gut! Wie Ihr seht, steht OOC in Doppelklammern und sollte geflüstert werden, um andere nicht zu stören. '#o' macht das alles automatisch. Ihr könnt auch alle Sprechfunktionen außer Emotes durchschalten.";
					eText="Very good! As you can see, OOC is in double brackets and should be whispered in order to not disturb others. '#o' does everything automatically. You can also toggle all talking functions except emotes.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					thisNPC:talk(CCharacter.say,outText);
					gText="Dazu müsst Ihr nur entweder auf die Taste [Einfügen] drücken oder einfach auf das kleine Feld neben dem Nachrichtenfenster klicken. Dann muss kein Befehl mehr am Anfang stehen. Bereit für die nächste Lektion?";
					eText="You can do that by either pressing the button [Insert] or just clicking on the small field next to the message window. Then you don't need to put a command at the beginning. Ready for the next lesson?";
					if State~=0 then
						NPCStatus[originator.id]=11;
					else
						originator:setQuestProgress(2,11);
					end
				else
					gText="Der Befehl '#o' muss ganz am Anfang stehen, natürlich ohne Hochkommata. Probiert nochmal!";
					eText="The command '#o' has to be put at the very beginning, of course without quotion marks. Try again!";
				end
			elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
				gText="Versucht OOC zu sprechen! Dazu muss ein '#o' ganz am Anfang stehen. Also müsst Ihr z.B. nur folgendes 'sagen': #o Telefon klingelt...bin gleich zurück";
				eText="Try to talk OOC! Therefore put a '#o' at the very beginning. So you have to 'say' e.g.: #o phone is ringing...be right back";
			end
		elseif (Progress==11 or Progress==15) then
			if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil or revise) then
				if (originator:countItem(97)>0) then
					gText="Gut, gut. Jetzt üben wir das Umgehen mit Gegenständen. Falls Ihr noch nicht Eure Tasche geöffnet habt - sie befindet sich im Inventar neben dem Kopf -, tut dies per Rechtsklick und wählt dann 'Öffnen'.";
					eText="Good, good. Now we make you familiar with objects. If you haven't already opened your bag - it is in your inventory next to the head - do it by right-clicking on it and choose 'open'.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					thisNPC:talk(CCharacter.say,outText);
					retVal=createBreadRoll(originator);
					gText="Ich habe neben mich ein Brötchen gelegt. Klickt und haltet mit der linken Maustaste darauf und zieht es in Eure Tasche und lasst dann die Taste wieder los. Sagt, wenn Ihr fertig seid oder ein neues Brötchen braucht.";
					eText="I have placed a bread roll beside me. Click and hold the left mouse button on it and drag it into your bag, then release the button. Tell me if you are done or you need a new bread roll.";
					if State~=0 then
						NPCStatus[originator.id]=13;
					else
						originator:setQuestProgress(2,13);
					end
				else
					gText="Oh, ich sehe, dass Ihr gar keine Tasche habt. Hier habt Ihr eine. Seid Ihr jetzt bereit?";
					eText="Oh I see you don't have a bag. Here you have one. Are you ready now?";
					originator:createItem(97,1,333,0);
				end
			elseif ((string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn]o")~=nil) and Progress==11) then
				gText="Nein? Dann wiederholen wir das. Sprecht mich an, sobald Ihr bereit seid.";
				eText="No? Then we repeat that. Speak to me when you are ready.";
				if State~=0 then
					NPCStatus[originator.id]=20;
				else
					originator:setQuestProgress(2,12);
				end
			elseif ((string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) and Progress==11)  then
				gText="Dies war eine kurze Erklärung zum Punkt OOC. Seid Ihr bereit für die nächste Lektion? Sagt einfach 'Ja' oder 'Nein'.";
				eText="This was a short explanation about OOC. Are you ready for the next lesson? Just say 'Yes' or 'No'.";
			end
		elseif Progress==13 then
			if (string.find(message,"[Nn]eues.+[Bb]r[öo]tchen")~=nil or string.find(message,"[Nn]ochmal.+[Bb]r[öo]tchen")~=nil or
			string.find(message,"[Ww]eiteres.+[Bb]r[öo]tchen")~=nil or string.find(message,"[Aa]dditional.+[Bb]read.+[Rr]oll")~=nil or
			string.find(message,"[Nn]ew.+[Bb]read.+[Rr]oll")~=nil or string.find(message,"[Aa]nother.+[Bb]read.+[Rr]oll")~=nil) then
				if createBreadRoll(originator) then
					gText="Ein neues Brötchen? Gerne. Übt einfach weiter. Sagt, wenn Ihr fertig seid.";
					eText="A new bread roll? With pleasure. Just keep on practising. Tell me if you are done.";
				else
					gText="Aber da liegt doch noch ein Brötchen! Versucht es erstmal mit diesem.";
					eText="But there is still a bread roll! Take this for now.";
				end
			elseif (string.find(message,"[Ff]ertig")~=nil or string.find(message,"[Ww]eiter")~=nil or
			string.find(message,"[Ff]inished")~=nil or string.find(message,"[Dd]one")~=nil) then
				if originator:countItemAt("backpack",191) == 0 then
					gText="Ihr habt gar kein Brötchen in Eurer Tasche. Geht zum Brötchen und zieht es mit Eurer Maus in Eure Tasche. Dann können wir weiter machen.";
					eText="You don't have a bread roll in your bag. Go to the bread roll and drag it with your mouse in your bag. Then we can continue.";
				else
					gText="Dann üben wir das Benutzen von Gegenständen. Seht Ihr die Kirschbäume dort drüben? Geht zu einem, drückt und haltet [Shift], klickt auf den Baum und lasst dann [Shift] los. Kommt wieder, wenn Ihr 5 Kirschen geerntet habt und sagt mir 'Ich habe die Kirschen'.";
					eText="So let's practise how to use objects. Do you see the cherry trees over there? Go there, press and hold [Shift], click on one tree and then release [Shift]. Come back when you have harvested 5 cherries and say to me 'I have the cherries'.";
					if State~=0 then
						NPCStatus[originator.id]=14;
					else
						originator:setQuestProgress(2,14);
					end
				end
			elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
				gText="Geht zum Brötchen und zieht es mit Eurer Maus in Eure Tasche. Wenn Ihr nochmal eins braucht, sagt 'Ein neues Brötchen bitte'. Um weiter zu machen sagt 'Ich bin fertig'.";
				eText="Go to the bread roll and drag it with your mouse in your bag. If you need another one say 'A new bread roll please'. To continue say 'I am done'.";
			end
		elseif Progress==14 then
			if (string.find(message,"[Kk]irschen")~=nil or string.find(message,"[Cc]herries")~=nil or
			string.find(message,"[Ff]ertig")~=nil or string.find(message,"[Dd]one")~=nil) then
				retVal=originator:countItem(302)
				if (retVal>=5) then
					gText="Sehr gut! Die Kirschen könnt Ihr behalten. Ihr könnt sie essen, indem Ihr sie 'benutzt', wie Ihr den Baum 'benutzt' habt.";
					eText="Very good! You can keep the cherries. You can eat them by 'using' them, the same way like you 'used' the tree.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					thisNPC:talk(CCharacter.say,outText);
					gText="Wollt ihr die Lektion über die Gegenstände wiederholen?";
					eText="Do you want to repeat the lesson about objects?";
					if State~=0 then
						NPCStatus[originator.id]=15;
					else
						originator:setQuestProgress(2,15);
					end
				else
					retVal=5-retVal;
					gText="Ihr habt zu wenig Kirschen dabei. Geht und erntet noch mindestens "..retVal.." Kirschen.";
					eText="You have not enough cherries with you. Go and harvest at least "..retVal.." more cherries.";
				end
			elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
				gText="Geht zu den Kirschbäumen, drückt und haltet [Shift], klickt auf einen Baum und lasst dann [Shift] los. Kommt wieder, wenn Ihr 5 Kirschen geerntet habt und sagt 'Ich habe alle Kirschen'.";
				eText="Go to the cherry trees, press and hold [Shift], click on one tree and then release [Shift]. Come back when you have harvested 5 cherries and say 'I have all cherries'.";
			end
		end
		if Progress==15 then
			if (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn]o")~=nil) then
				gText="Nun gut, ich habe Euch alles beigebracht, was ich weiß. Geht die Straße entlang bis Ihr zum Haus der Gebrüder Hammerfaust kommt. Sie werden Euch weiterhelfen.";
				eText="Well then, I have taught you everything I know. Follow this street until you reach the house of the brothers Hammerfaust. They can help you along.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				thisNPC:talk(CCharacter.say,outText);
				gText="Ihr könnt jederzeit wiederkommen und meine Lektionen wiederholen, sprecht mich einfach darauf an. Ich wünsche Euch noch viel Spaß und viel Glück auf Eurer weiteren Reise!";
				eText="You can always come back and repeat my lessons, just ask for it. Now I wish you much fun and good luck on your further journey!";
				if originator:getQuestProgress(2)<20 then
					originator:setQuestProgress(2,20);
				end
				NPCStatus[originator.id]=1;
			elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
				gText="Ihr habt die Lektion über die Gegenstände beendet. Wollt Ihr sie wiederholen? Sagt einfach 'Ja' oder 'Nein'.";
				eText="You have completed the lesson about objects. Do you want to repeat it? Just say 'Yes' or 'No'.";
			end
		end
		if originator:getQuestProgress(2)>=20 then
			if NPCStatus[originator.id]==1 then
				if (string.find(message,"[Ll]ektion")~=nil or string.find(message,"[Ll]esson")~=nil or
				string.find(message,"[Ww]iederholen")~=nil or string.find(message,"[Rr]epeat")~=nil) then
					gText="Ihr könnt folgende Lektionen wiederholen: NPC, Sprechfunktionen, OOC, Gegenstände. Welche wollt Ihr wiederholen? Sagt mir dazu einfach den Namen der Lektion.";
					eTest="You can repeat the following lessons: NPC, talking functions, OOC, objects. Which one do you want to repeat? To do this, just tell me the name of the lesson.";
				elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
					gText="Geht die Straße entlang bis Ihr zum Haus der Gebrüder Hammerfaust kommt. Sie werden Euch weiterhelfen. Ihr könnt auch meine Lektionen wiederholen. Sagt dazu einfach 'Lektion wiederholen' und sucht Euch dann eine aus.";
					eText="Follow this street until you reach the house of the brothers Hammerfaust. They can help you along. You can also repeat my lessons. To do this, just say 'repeat lesson' and then you can choose one.";
				end
			elseif (NPCStatus[originator.id]==20 and (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn]o")~=nil)) then
				gText="Wie Ihr wünscht. Geht die Straße entlang bis Ihr zum Haus der Gebrüder Hammerfaust kommt. Sie werden Euch weiterhelfen. Ihr könnt auch meine Lektionen wiederholen.";
				eText="As you wish. Follow this street until you reach the house of the brothers Hammerfaust. They can help you along. You can also repeat my lessons.";
				NPCStatus[originator.id]=1;
			end
		end
		if (gText=="nothing") then
			npc.base.autonpcfunctions.TellSmallTalk(message, originator);
		else
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		end
	elseif HenryCheck(originator) then
		Progress=originator:getQuestProgress(2);
		thisNPC.activeLanguage=originator.activeLanguage;
		gText="nothing";
		
		if (Progress==1 and (message=="Endlich wieder festen Boden unter den Füßen." or
			message=="Finally standing again on firm ground.") ) then
			gText="Ah, seid gegrüßt, "..originator.name..". Wie ich sehe, seid Ihr neu in Illarion. Kommt doch bitte etwas näher und sprecht mit mir. Ich werde Euch gerne helfen."
			eText="Ah, be greeted, "..originator.name..". I see you are new to Illarion. Please come a bit closer and talk to me. I will gladly help you."
			originator:setQuestProgress(2,2);
		elseif (0<Progress and Progress<20) then
			gText=originator.name..", Ihr müsst schon näher kommen, wenn Ihr mit mir reden wollt."
			eText=originator.name..", you have to come closer if you want to talk to me."
			originator:setQuestProgress(2,math.max(3,Progress));
		end
		if not (gText=="nothing") then
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		end
	end
end--function

function createBreadRoll(newb)
	ItemPos = position(thisNPC.pos.x, thisNPC.pos.y+1, thisNPC.pos.z);
	if world:isCharacterOnField(ItemPos) then
		ItemPos = position(thisNPC.pos.x, thisNPC.pos.y-1, thisNPC.pos.z);
	end
	something=world:getItemOnField(ItemPos);
	if (something.id~=191) then
		world:createItemFromId(191,1,ItemPos, true, 333, 0);
		return true
	else
		return false
	end
end

function HenryCheck(originator)
	
	if not originator:isInRangeToPosition(position(33,22,100),5) then
		return false;
	end
	
	if (originator.id == thisNPC.id) then
        return false;
    end
    
    if ( originator:get_type() ~= 0 ) then
        return false;
    end
	
    originator:introduce(thisNPC);
    return true;
end
