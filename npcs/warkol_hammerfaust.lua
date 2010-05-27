-- INSERT INTO npc VALUES (nextval('npc_seq'),1,49, 51, 100,4,false,'Warkol Hammerfaust','npc_warkol_hammerfaust.lua',0);

--Der NPC beginnt mit der QuestID 2 mit QuestProgress=25 als Startwert
--name="Warkol Hammerfaust"
--race=dwarf
--position=-115, -107, 0
--direction=south
--sex=male
--[[Tasks: -Sells the player a armor
		   -Shows him how to put the armor on
  ]]--

require("npcs.base.autonpcfunctions")
require("base.common")
module("npcs.warkol_hammerfaust")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end


function initializeNpc()
    npcs.base.autonpcfunctions.InitTalkLists();

QuestID= 2

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]allo","Tach, ich bin %NPCNAME der Bruder von Nargon und Waffenschmied. Hast du vielleicht Interesse an einer Kampfausrüstung?");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]r[ueü][sß]+");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc]+");
npcs.base.autonpcfunctions.AddAdditionalText("Grüß dich, mein Name ist %NPCNAME, ich bin der Bruder von Nargon und Waffenschmied. Hast du vielleicht Interesse an einer Kampfausrüstung?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);

npcs.base.autonpcfunctions.AddTraderTrigger("[Kk][aä]mpf","Du willst kämpfen? Ich könnte dir höchstens eine Ausrüstung verkaufen. Willst du eine Kampfausrüstung kaufen?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);

npcs.base.autonpcfunctions.AddTraderTrigger("[Rr][ueü]stung","Willst du eine meiner Kampfausrüstungen kaufen?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);
npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Wenn du eine Kampfausrüstung kaufen willst dann frag mich einfach danach, falls du allerdings nochmal einige Grundfunktionen wie das Reden oder Objekte bewegen wiederholen willst solltest du nochmal zu 'Henry' dem ersten NPC gehen.");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);
npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]elp","If you want to buy a fighting equipment then I am the right person ,just ask for it, if you want to repeat some basic things like talking and moving of objects you should go back to 'Henry' the first NPC.");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]i","Tach, ich bin %NPCNAME, der Bruder von Nargon und Waffenschmied. Hast du vielleicht Interesse an einer Kampfausrüstung?");
npcs.base.autonpcfunctions.AddCondition("lang","german");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]i","Greetings, I am %NPCNAME, the brother of Nargon and armorer. Are you interested in buying a fighting equipment?");
npcs.base.autonpcfunctions.AddCondition("lang","english");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ello","Greetings, I am %NPCNAME, the brother of Nargon and armorer. Are you interested in buying a fighting equipment?");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]reeting");
npcs.base.autonpcfunctions.AddAdditionalText("Hello, my name is %NPCNAME, I am the brother of Nargon and armorer. Do ya' want to buy a fighting equipment?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);
npcs.base.autonpcfunctions.AddTraderTrigger("[Ff]ight","You want to fight? I could sell ya' at most a fighting equipment. Are you interested in buying a fighting equipment?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);

npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]rmo[ur]","Are you interested in buying one of my fighting equipments?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",27);
npcs.base.autonpcfunctions.AddTraderTrigger("[Bb]ye","Bye");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Bis Bald");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]schüss");
npcs.base.autonpcfunctions.AddAdditionalText("Auf bald");
npcs.base.autonpcfunctions.AddTraderTrigger(".+","Tut mir Leid, hab dich gerade nich verstanden. Sag einfach 'Hilfe', wenn du nicht weißt was zu tun ist.");
npcs.base.autonpcfunctions.AddCondition("lang","german");
npcs.base.autonpcfunctions.AddTraderTrigger(".+","I am sorry, I didn't understand you. Say 'help' if you don't know what to do.");
npcs.base.autonpcfunctions.AddCondition("lang","english");

    TradSpeakLang={0,1,2,3,4,5,6,7,8,9,10};
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

	greeting_list={};
end

function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    
	if (wait(20)==true) then
		if (anvil_status==nil) then
			anvil_status=0;
		end
		
		if (soundCounter==nil) then
			soundCounter=0;
		end
		
		if (soundCounter~=5) then
			soundCounter=soundCounter+1;
		elseif (soundCounter==5) then
			world:makeSound(8,thisNPC.pos);
			soundCounter=0;
		end
		
		anvil=world:getItemOnField(position(thisNPC.pos.x, thisNPC.pos.y+1, thisNPC.pos.z));
		if (anvil.id==13 or anvil.id==172) then --ist an der Position wirklich ein Amboss
			if (anvil_status==0) then
				anvil.id = 13;
				anvil.wear = 255;
				world:changeItem(anvil); --in Glühenden Amboss verwandeln
				anvil_status=1;
			else	
				anvil.id = 172;
				anvil.wear = 255;
				world:changeItem(anvil); --in normalen Amboss verwandeln
				anvil_status=0;
			end
		end
	--begrüßung
		dummyVar = world:getPlayersInRangeOf(thisNPC.pos, 7);
			 if (dummyVar[1]~=nil) then
			 	prg=dummyVar[1]:getQuestProgress(2);
			    if (prg==24 or prg==25) and not greeting_list[dummyVar[1].id] then
					thisNPC:talkLanguage(CCharacter.say,CPlayer.german,"Arr, wieso kommste nicht näher und sagst mal 'Hallo'? Ick könnt dir ne Kampfausrüstung anbieten!");
	       			thisNPC:talkLanguage(CCharacter.say,CPlayer.english,"Arr, why don't you come over ta 'ere and say 'hello'? I could offer ya' an fighting equipment!"); 
					greeting_list[dummyVar[1].id]=true;
				else
					return;
				end
			 end
	end
    
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
  Progress=originator:getQuestProgress(2);
  if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        thisNPC.activeLanguage=originator.activeLanguage;
		
        if (Progress==24 or Progress==25) then npcs.base.autonpcfunctions.TellSmallTalk(message, originator); --Triggermessages,Char. meets the NPC for the first time

        elseif Progress==27 then
                if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil or string.find(message,"[Ss]icher")~=nil or string.find(message,"[Ss]ure")~=nil or
					string.find(message,"[Rr]üstung.+kaufen,*")~=nil or string.find(message,"[Bb]uy.+[Aa]rm[ou]r.*")~=nil) then
                        AmountCoins= originator:countItem(3076);
                        if (AmountCoins>=50) then
                            gText="Dat macht dann "..AmountCoins.." Kupferstücke.";
                            eText="That makes "..AmountCoins.." copper coins.";
                            originator:eraseItem(3076,AmountCoins);
                            originator:createItem(2291,1,688,0);--salk. Paladinhelm
                            originator:createItem(4,1,688,0);--Plattenpanzer
                            originator:createItem(2701,1,688,0);--Langschwert
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Hier deine Ausrüstung und danke für das Geld.";
                            eText="Here your armor and thanks for the money.";
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Soll ick dir zeigen wie man die Ausrüstung anlegt?";
                            eText="Shall I show you how to put on the armor?";
                            originator:setQuestProgress(2,28);
                        else
                            gText="Du hast nich genug Geld dabei. Eine Ausrüstung kostet mindestens 50 Kupferstücke.";
                            eText="You don't have enough money with you. A fighting equipment costs at least 50 copper coins.";
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Komm erst wieder her wenn du mehr Geld von meinem Bruder bekommen hast.";
                            eText="Come only again if you have got more coins from my brother.";
                            originator:setQuestProgress(2,25);
                        end
                elseif (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn][oö]")~=nil) then
                        gText="Du willst wirklich keine Ausrüstung kaufen?Naja, du kannst jederzeit zu mir kommen falls du es dir anders überlegst.";
                        eText="You really don't want a fighting equipment? Well, in the end it's your thing. You can come any time to me when you have changed your mind.";
                        originator:setQuestProgress(2,25);

                elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
                        gText="Ick will wissen ob du ne Ausrüstung kaufen willst, also willst du ne Ausrüstung kaufen 'Ja' oder 'Nein'??";
                        eText="I wanna know if ya' want to buy a fighting equipment,so do you want to buy a equipment, 'yes' or 'no'?";
                        originator:setQuestProgress(2,27);

                else
                        gText="Tut mir leid, ich verstehe nicht, sag einfach 'Hilfe' wenn du nicht weiter weisst.";
                        eText="I am sorry, I don't understand. Just say 'Help' if you don't know what to do.";
                        originator:setQuestProgress(2,27);
                end

        elseif (Progress==28 or (Progress==29 and (string.find(message,"[Ee]rklär")~=nil or string.find(message,"[Ee]xplain")~=nil))) then
                if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil or Progress==29) then
                        gText="Also gut, zunächst mal musst du den Helm den ich dir gegeben habe am schwarzen Feld oben rechts, auf Höhe des Kopfes des Mannes, platzieren.";
                        eText="Fine, at first you have to place the helmet I gave you at the small black box near the head of the man.";
                        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                        gText="Als nächstes musst du den Plattenpanzer am schwarzen Feld auf Höhe der Brust des Mannes platzieren.";
                        eText="At next you have to place the plate armor at the black box which is on a level with the breast of the man.";
                        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				        gText="Als letztes platzierst du das Langschwert in eines der beiden Felder auf Höhe der Hände des Mannes.";
				        eText="At last you have to place the longsword in one of the both black boxes which are on a level with the hands of the man.";
                        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				        gText="Wenn die Felder bereits durch Gegenstände besetzt sind musst du diese vorher entfernen. Sag einfach 'Fertig' wenn ich überprüfen soll ob du alles richtig angelegt hast.";
                        eText="If the fields are already occupied by other items you have to remove them first. Just say 'Done' if you want me to check whether you have put the equipment at the right fields.";
                        originator:setQuestProgress(2,29);

                elseif (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn][oö]")~=nil) then
                        gText="Na gut, sag 'Fertig' wenn du denkst das alles am richtigen Platz ist, dann kontrolliere ich es nochmal.";
                        eText="Okay, just say 'Done' if you want me to check whether you have put the equipment at the right fields.";
                        originator:setQuestProgress(2,29);

                elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
                        gText="Soll ich dir zeigen wo die einzelnen Bestandteile der Kampfausrüstung hinkommen, 'Ja' oder 'Nein'?";
                        eText="Shall I show you where the several parts of the equipment have to get put, 'yes' or 'no'?";
                        originator:setQuestProgress(2,28);


                else
                        gText="Tut mir leid, ich verstehe nicht, sag einfach 'Hilfe' wenn du nicht weiter weisst.";
                        eText="I am sorry, I don't understand. Just say 'Help' if you don't know what to do.";
                        originator:setQuestProgress(2,28);
                end

        elseif Progress==29 then
                if (string.find(message,"[Ff]ertig")~=nil or string.find(message,"[Dd]one")~=nil) then

                        retVarA, retVarB, retVarC, retVarD = checkEquipment(originator); --retVarA=helmet,retVarB=armor,retVarC=sword,retVarD=allItemsAtRightPlace?
                        gText="Lass mal sehen,hmmm...";
                        eText="Let me have a look at it, hmmm...";                        
                        if (retVarA==1) then
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Der Helm ist an der richtigen Stelle.";
                            eText="The helmet is at the right place.";
                        else
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Dein salkamaerscher Paladinhelm ist nicht an der richtigen Stelle (platziere den Helm am schwarzen Feld oben rechts).";
                            eText="Your salkamaerian paladin's helmet is not at the right place (place the helmet in the small black box on top on the right).";
                        end
                        if (retVarB==1) then
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Das Schwert ist an der richtigen Stelle.";
                            eText="The sword is at the right place.";
                        else
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Das Langschwert ist nicht an der richtigen Stelle (platziere das Schwert in eines der beiden schwarzen Felder auf Höhe der Hände).";
                            eText="The longsword is not at the right place (place the sword in one of the both small black boxes on high of the hands).";
                        end
                        if (retVarC==1) then
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Die Rüstung ist an der richtigen Stelle.";
                            eText="The armor is at the right place.";
                        else
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Der Plattenpanzer ist nicht an der richtigen Stelle (platziere die Rüstung am schwarzen Feld auf Höhe der Brust um sie anzuziehen).";
                            eText="The plate armor is not at the right place (place the armor in the small black box on high of the breast).";
                        end
                        if (retVarD==1) then
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Spitze, alles ist an der richtigen Stelle. Nun kannst du zu meinem Bruder Nargon gehen.";
                            eText="Great, everything is at the right place. Now you can go to my brother Nargon.";
                            originator:setQuestProgress(2,31);
                        else
                            outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				            npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                            gText="Einige Ausrüstungsteile waren nicht an der richtigen Stelle, probiers nochmal und sag 'Fertig' wenn ich kontrollieren soll. Wenn ich dir erklären soll wie man die Ausrüstung anlegt sag einfach 'Erklären'.";
                            eText="Some parts of the equipment were not at the right place, try it again and say 'Done' when I shall check again. If you want to know where the several parts of the equipment have to put just say 'Explain'.";
                        end
                elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
                        gText="Wenn du überprüfen willst ob du die Ausrüstung richtig angelegt hast sag einfach 'Fertig', wenn ich dir erklären soll wie man die Rüstung anlegt sag einfach 'Erklären'.";
                        eText="If you want me to check whether you have put the equipment at the right fields just say 'Done', if you want me to explain you where the several parts of the equipment have to put just say 'Explain'.";
                        originator:setQuestProgress(2,29);
                else
                        gText="Tut mir leid, ich verstehe nicht, sag einfach 'Hilfe' wenn du nicht weiter weisst.";
                        eText="I am sorry, I don't understand. Just say 'Help' if you don't know what to do.";
                        originator:setQuestProgress(2,29);
                end
                                                        
        elseif (Progress<24 or Progress==26) then --The Char. speaks to the NPC before he has done the first part of Newbieisland(the first NPC "Henry")
                AmountCoins=originator:countItem(3076); 
				if AmountCoins>=50 and (Progress==22 or Progress==23) then
				gText="Wie ick sehe hast du dat nötige Kleingeld für ne Kampfausrüstung, trifft sich gut dat ick Schmied bin wa *grinst breit*? Willst du ne Kampfausrüstung kaufen, \"Ja\" oder \"Nein\"?";
                eText="As I can see you have enough change for a fighting equipment, What a happy coincidence that I'm smith, isn't it *grins broad*? So do you want to buy a equipment, \"yes\" or \"no\"?";
                originator:setQuestProgress(2,27);
				else
				gText="Hallo, mein Name ist Warkol, ich bin Schmied und kann dir Ausrüstungen verkaufen, doch zuerst musst du zu meinem Bruder Nargon der sich draußen befindet, er wird dir etwas Geld für ne Rüstung geben.";
                eText="Hello, my name is Warkol, I am smith and can sell you armors, but first you have to go to my brother Nargon who is outside, he will give you some money for a armor.";
				end
        elseif (Progress>=31) then
                if (string.find(message,"[Gg]r[üue][ßs]+")~=nil or string.find(message,"[Gg]reet")~=nil or string.find(message,"[Hh][ae]llo")~=nil) then
                gText="Tach "..originator.name..", wie gehts dir?";
                eText="Greetings "..originator.name..", how are you?";

				elseif (string.find(message,"[Aa]uf.+[Bb]ald")~=nil or string.find(message,"[Bb]is.+[Bb]ald")~=nil or string.find(message,"[Bb]ye")~=nil or string.find(message,"[Ff]arewell")~=nil) then
                gText="Auf bald, Irmorom mit dir.";
                eText="Farewell, Irmorom with you.";

			    elseif (string.find(message,"[Gg]ut")~=nil or string.find(message,"[Gg]ood")~=nil) then
                gText="Schön zu hören.";
                eText="Nice to hear.";

				elseif (string.find(message,"[Hh]ilfe")~=nil or string.find(message,"[Hh]elp")~=nil) then
                gText="Wenn ich dir nochmal erzählen soll wie du die Rüstung anlegst sag einfach 'Lektion wiederholen', wenn du noch etwas übers Kämpfen erfahren willst kannst du meinen Bruder Nargon fragen der sich draußen befindet.";
                eText="If you want me to repeat the lesson how to put the armor on just say 'Repeat lesson', if you want to know something more about fighting go back to my brother Nargon who is outside.";

				elseif (string.find(message,"[Ww]iederhol")~=nil or string.find(message,"[Rr]epeat")~=nil or
           				string.find(message,"[Tt]ell.+again")~=nil or string.find(message,"[Ee]rz[äa][he][lh].+nochmal")~=nil or
						string.find(message,"[Ll]ektion")~=nil or string.find(message,"[Ll]esson")~=nil ) then

				gText="Also gut, zunächst mal musst du den Helm den ich dir gab am schwarzen Feld oben rechts, auf Höhe des Kopfes des Mannes, platzieren.";
                eText="Fine, at first you have to place the helmet I gave you at the small black box near the head of the man.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                gText="Als nächstes musst du den Plattenpanzer am schwarzen Feld auf Höhe der Brust des Mannes platzieren.";
                eText="At next you have to place the plate armor at the black box which is on a level with the breast of the man.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				gText="Als letztes platzierst du das Langschwert in eines der beiden Felder auf Höhe der Hände des Mannes.";
				eText="At last you have to place the longsword in one of the both black boxes which are on a level with the hands of the man.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				gText="Wenn die Felder bereits durch Gegenstände besetzt sind musst du diese vorher per Drag&Drop in den Gürtel oder in die Tasche ziehen.";
                eText="If the fields are already occupied by other items you have to drag&drop them first in your bag or belt.";

				elseif (string.find(message,"[Tt]asche")~=nil or string.find(message,"[Bb]ag")~=nil) then

				gText="Die Tasche befindet sich im Inventar neben dem Kopf, sollte sie nicht offen sein so kannst du sie öffnen indem du darauf mit der rechten Maustaste klickst und dann 'Öffnen' auswählst.";
                eText="The bag is in your inventory next to the head, if it's closed you can open it by right-clicking on the bag and choosing 'open'.";

				elseif (string.find(message,"[Gg]ürtel")~=nil or string.find(message,"[Bb]elt")~=nil) then
				gText="Die sechs schwarzen Felder stellen den Gürtel da, dort kannst du unterschiedliche Items platzieren.";
                eText="The six black boxes represent the belt, you can place there different items.";

				else
                gText="Tut mir Leid, ich verstehe nicht, sag einfach 'Hilfe' wenn du nicht weiter weisst.";
                eText="I am sorry, I don't understand. Just say 'Help' if you don't know what to do.";
                end
        end

        if (Progress~=25 and Progress~=24) then
        		outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			    npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		end
  end
end

function checkEquipment(originator)
    helmet=originator:getItemAt(CCharacter.head);
    sword=originator:getItemAt(CCharacter.left_tool);
        if (sword.id~=2701) then
            sword=originator:getItemAt(CCharacter.right_tool);
        end
    armor= originator:getItemAt(CCharacter.breast);
        if (helmet.id~=2291) then
            a=0;
            retVarA=0;       
        else
            a=1;
            retVarA=1;
        end
        if (sword.id~=2701) then
            b=0;
            retVarB=0;
        else
            b=1;
            retVarB=1;
        end
        if (armor.id~=4) then
            c=0;
            retVarC=0;
        else
            c=1;
            retVarC=1;
        end

    getItemTrue=a+b+c;
        if (getItemTrue~=3) then
            retVarD=0;
        else
            retVarD=1;
        end
    a=0; b=0; c=0;
    return retVarA, retVarB, retVarC, retVarD;
end

function wait(timeInSeconds)  --Works ONLY in the nextCycle-function!!!
        if (cycleCounter==nil) then
            cycleCounter=0;
			return false;
        elseif(cycleCounter~=nil and cycleCounter~=(timeInSeconds*10)) then
            cycleCounter=cycleCounter+1;
			return false;
        elseif (cycleCounter==(timeInSeconds*10)) then
			cycleCounter=nil;
			return true;
		end
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein junger überaus kräftig gebauter Zwerg. Am Gürtel sind ein Hammer und eine Tiegelzange befestigt.";
        output[1]="A young heavy built dwarf. On his belt are a hammer and a tong attached.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end