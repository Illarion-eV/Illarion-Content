-- INSERT INTO npc VALUES (nextval('npc_seq'),1,42, 49, 100,6,false,"Nargon Hammerfaust","npc_nargon_hammerfaust.lua",0);

--Der NPC starts with the QuestID 2 and QuestProgress=20
--name="Nargon Hammerfaust"
--race=dwarf
--position=42, 49, 100
--direction=west
--sex=male
--[[Tasks: -Explains the player how to change the counter value(Progress= 20 - 25)
		   -Explains the player how to fight and the energy bar (Progress= 31 - 33)
		   -Tells the player about the blue swirlies and skills (Progress= 33 - 34)
		   - Lets the player repeat the fight with a monster	 (Progress=35-38)
  ]]--


require("npcs.base.autonpcfunctions")
require("base.common")


function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don\'t you touch me!") end
end


function initializeNpc()
    npcs.base.autonpcfunctions.InitTalkLists();

QuestID= 2

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]allo","Tach, ich bin %NPCNAME, der stärkste Krieger weit und breit. Soll ich dir beibringen wie man kämpft?");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]r[uü][sß]+");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc]+");
npcs.base.autonpcfunctions.AddAdditionalText("Grüß dich, ich bin %NPCNAME, der stärkste Krieger weit und breit. Soll ich dir beibringen wie man kämpft?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);

npcs.base.autonpcfunctions.AddTraderTrigger("[Kk][aä]mpf","Mein Name ist %NPCNAME und ich bin Kämpfer. Soll ich dir das Kämpfen beibringen?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Wenn du wissen willst wie man kämpft biste hier bei mir richtig, falls du nochmal einige Grundfunktionen wie das Reden oder Objekte bewegen wiederholen willst solltest du nochmal zu Henry dem ersten NPC gehen.");
npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]elp","If you want to learn how to fight then I am the right person , if you want to repeat some basic things like talking and moving of objects you should go back to Henry the first NPC.");

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]i","Tach, ich bin %NPCNAME, der stärkste Krieger weit und breit. Soll ich dir beibringen wie man kämpft?");
npcs.base.autonpcfunctions.AddCondition("lang","german");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]i","Greetings, I am %NPCNAME, the strongest fighter in this region. Shall I teach ya\' fighting?");
npcs.base.autonpcfunctions.AddCondition("lang","english");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);

npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ello","Greetings, I am %NPCNAME, the strongest fighter in this region. Shall I teach ya\' fighting?");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]reeting");
npcs.base.autonpcfunctions.AddAdditionalText("Hello, my name is %NPCNAME, I am the strongest fighter in this region. Shall I teach ya\' fighting?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);
npcs.base.autonpcfunctions.AddTraderTrigger("[Ff]ight","My name is %NPCNAME and I am a fighter. Shall I teach ya\' fighting?");
npcs.base.autonpcfunctions.AddConsequence("qpg","=",21);

npcs.base.autonpcfunctions.AddTraderTrigger("[Bb]ye","Bye");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Bis Bald");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]schüss");
npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
npcs.base.autonpcfunctions.AddAdditionalText("Auf bald");
npcs.base.autonpcfunctions.AddTraderTrigger(".+","Tut mir Leid, hab dich gerade nich verstanden. Sag einfach \"Hilfe\", wenn du nicht weißt was zu tun ist.");
npcs.base.autonpcfunctions.AddCondition("lang","german");
npcs.base.autonpcfunctions.AddTraderTrigger(".+","I am sorry, I didn\'t understand you. Say \"help\" if you don\'t know what to do.");
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
_waitVar=0;
--Initialize the Positions
monsterpos=position(31,43,100);   --Position of the Monster
playerArenaPosition=position(31,49,100); --Position of the Player in the Arena
playerNearNpcPosition=position(42,50,100); --Position of the Player near the npc
ArenaCenterPosition=position(31,46,100); --Midpointposition of the Arena(needed for the "world:get...InRangeOf..."
searchRadius=7; --Searchradius from the Midpointposition of the Arena for the "world:get...InRangeOf..."
--Here are the borders of the Arena

if (border==nil) then
	border={}
end
		--border-Xpos-left, border-Xpos-right, border-Ypos-left, border-Ypos-right
border={                27,                34,               41,                51};
end
function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
--------------------checks the Hitpoints of the Newb every second during fighting---------------
    if (mummyCreated==true) then

		if (wait(0.3)==true) then --checks the HP every 1/3 seconds
			newbie_list=world:getPlayersInRangeOf(ArenaCenterPosition, searchRadius);
            thisNPC:increaseSkill(1,"common language",100);
            if (newbie_list[1]~=nil) then

				 for i, newbie in pairs(newbie_list) do --searches for the newb who is in the arena
				    if (IsInArena(newbie_list[i])==true) then
						newbieIndex=i;
					end
				 end
				mummy_list=world:getMonstersInRangeOf(ArenaCenterPosition, searchRadius);
				theHP = newbie_list[newbieIndex]:increaseAttrib("hitpoints",0);
				if (mummy_list[1]~=nil) then            
					if ( (theHP<1800) ) then
					mummy_list[1]:increaseAttrib("hitpoints",-10000);
					world:gfx(7,mummy_list[1].pos);
					world:makeSound(13,mummy_list[1].pos);
					newbie_list[newbieIndex]:warp(playerNearNpcPosition);
					newbie_list[newbieIndex]:increaseAttrib("hitpoints",10000)

						if (NPCStatus[newbie_list[newbieIndex].id]==1) then
							newbie_list[newbieIndex]:setQuestProgress(2,36);
						else
							newbie_list[newbieIndex]:setQuestProgress(2,321);
						end
					mummyCreated=false;
					newbie_list[newbieIndex]:talk(CCharacter.say, "Arghh")  --needed phrase for the Npc to react
					NPCStatus[newbie_list[newbieIndex].id]=0;
					while (world:isItemOnField(mummy_list[1].pos)==true) do
						item=world:getItemOnField(mummy_list[1].pos);
						world:erase(item,1);
					end
					
					end

				else
       			
				   _waitVar=_waitVar+1;
				   if (_waitVar==5) then
					if (NPCStatus[newbie_list[newbieIndex].id]==1) then
						mummyCreated=false;
						newbie_list[newbieIndex]:warp(playerNearNpcPosition);

						thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Glückwunsch "..newbie_list[newbieIndex].name..", du hast die Mumie getötet. Folge der Straße um zu Amelia zu gelangen, wenn ich eine Lektion wiederholen soll, komm näher und sag \"Lektion wiederholen\".");
						thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Congratulations "..newbie_list[newbieIndex].name..", you killed the mummy. Follow the street to meet Amelia , if I shall repeat a lesson just come closer and say \"Repeat lesson\".");
						newbie_list[newbieIndex]:setQuestProgress(2,40);
						NPCStatus[newbie_list[newbieIndex].id]=0;
					else
						mummyCreated=false;
						newbie_list[newbieIndex]:warp(playerNearNpcPosition);

						thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Glückwunsch "..newbie_list[newbieIndex].name..", du hast die Mumie getötet. Komm näher und  sag \"Weiter\" wenn du etwas mehr über das Kämpfen erfahren willst.")
						thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Congratulations "..newbie_list[newbieIndex].name..", you killed the mummy. Come closer and say \"continue\" if you want to get more informations about fighting.")

						newbie_list[newbieIndex]:increaseSkill(5,"concussion weapons",5);
						newbie_list[newbieIndex]:setQuestProgress(2,33);
					end
					_waitVar=0;
					
				   elseif (_waitVar==1) then
				   		base.common.InformNLS( newbie_list[newbieIndex], "*Die Mumie zerfällt zu Staub*", "*The mummy dissolves into dust*"); 
				   end
				end
			else
				mummyCreated=false;
				mummy_list=world:getMonstersInRangeOf(ArenaCenterPosition, searchRadius);
				if (mummy_list[1]~=nil) then
					mummy_position=mummy_list[1].pos;
					mummy_list[1]:increaseAttrib("hitpoints",-10000);
					while (world:isItemOnField(mummy_position)==true) do
						item=world:getItemOnField(mummy_position);
						world:erase(item,1);
					end
					mummy_position=nil;
				end
			end
        end
	end		
	if (mummyCreated~=true) and (math.random(200)==1) then
		 dummyVar = world:getPlayersInRangeOf(thisNPC.pos, 2)
		 if (dummyVar[1]~=nil) then
			return;
		 else
			world:gfx(17,thisNPC.pos);
			world:makeSound(3,position(thisNPC.pos.x-1 ,thisNPC.pos.y, thisNPC.pos.z));
			world:gfx(18,position(thisNPC.pos.x-1, thisNPC.pos.y, thisNPC.pos.z));
			rand= math.random(12);
			if (rand==1) then				
				thisNPC:talkLanguage(CCharacter.say,CPlayer.german,"#me schlägt auf die Strohpuppe ein");
       			thisNPC:talkLanguage(CCharacter.say,CPlayer.english,"#me slashes at the scarecrow");
			elseif (rand==2) then
				thisNPC:talkLanguage(CCharacter.say,CPlayer.german,"#me übt einige Manöver an der Strohpuppe");
       			thisNPC:talkLanguage(CCharacter.say,CPlayer.english,"#me exercises some maneuvers at the scarecrow");
			end
		 end
	 end
--------------------------------------------------------------------------------    
    npcs.base.autonpcfunctions.SpeakerCycle();
end




function receiveText(texttype, message, originator)
  Progress=originator:getQuestProgress(2);
  if npcs.base.autonpcfunctions.BasicNPCChecks(originator,3) then
        thisNPC.activeLanguage=originator.activeLanguage;
----------------------Part.1----------------------------------------------------
        if Progress==20 then npcs.base.autonpcfunctions.TellSmallTalk(message, originator); --Triggermessages, Player meets the NPC for the first time

		elseif (Progress==21) then --the player can decide if he wants to learn fighting
                if (standardAnswer(message,1)==true or standardAnswer(message,3)==true  ) then

					    gText="Gut, zuerst solltest du dir mal ne zusätzliche Kampfausrüstung besorgen. Hier hast du 50 Kupferstücke für eine Ausrüstung.";
                        eText="Good, at first you should buy an additional fighting equipment. Here are 50 copper coins for the equipment";
                        createCoins(originator);
                        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                        gText="#me schmeißt einen Geldbeutel auf dem Boden.";
                        eText="#me throws a moneybag on the ground.";
				        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                        gText="Um das Geld aufzuheben musst du zunächst mal den Zähler der sich unten mittig auf dem Bildschirm befindet auf 50 setzen.";
                        eText="To pick up the money you first need to set the counter which you can find at the bottom in the middle of the screen on 50.";
				        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                        gText="Dies erreichst du, indem du den Mauszeiger über das schwarze Kästchen oberhalb der Uhr bringst und dann mit dem Mausrad nach oben scrollst.";         
                        eText="You can do this by bringing the cursor above the black box and scrolling up with the mouse wheel.";
				        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                        gText="Alles soweit verstanden? Ja oder Nein?";
                        eText="Have you understood everything so far? Yes or No?";
						originator:setQuestProgress(2,22);
						
                elseif (standardAnswer(message,2)==true) then
                        gText="Wirklich? Naja is ja schließlich deine Sache. Du kannst jederzeit zu mir kommen falls, du das Kämpfen erlernen willst.";
                        eText="Really? Well, in the end it\'s your thing. You can come any time to me if you want to learn how to fight.";
						originator:setQuestProgress(2,20);

                elseif (standardAnswer(message,4)==true) then
                        gText="Wenn du wissen willst wie man kämpft bist du bei mir richtig. Willst du das Kämpfen lernen, \"Ja\" oder \"Nein\"?";
                        eText="If you want to learn how to fight then I am the right person. Shall I teach ya\' fighting, \"yes\" or \"no\"?";

  				elseif (standardAnswer(message,10)==true) then
        				gText="((Benutze Abkürzungen und Leetspeak höchstens OOC(Out of Character) und niemals IC(In Character). Der erste NPC Henry kann dir den Unterschied zwischen IC und OOC erklären.))";
        				eText="((Use abbreviations and leetspeak only OOC(Out of Character) and never IC(In Character). The first NPC Henry can explain you the difference between IC and OOC.))";

				else
                        gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
                        eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
                end

        elseif Progress==22 then --Did the player understand the first part of the lesson "Changing the counter value"?
                if (standardAnswer(message,1)==true) then
                        gText="Großartig, machen wir weiter! Sag \"Weiter\" wenn ich fortfahren soll.";
                        eText="Great, let\'s go on! Say \"continue\" when you want me to go on.";
                        originator:setQuestProgress(2,23);

                elseif (standardAnswer(message,2)==true) then
                        gText="Nicht? Also nochmal von vorn. Du musst den Mauszeiger über das schwarze Kästchen oberhalb der Uhr bringen und dann mit dem Mausrad nach oben scrollen bis der Zählerwert auf 50 gesetzt wurde. Sag \"Weiter\" zum fortfahren.";
                        eText="No? Okay let\'s start from scratch.You have to bring the cursor above the black box and then to scroll up with the mouse wheel to set the counter value on 50. Say \"continue\" to go on.";
                        originator:setQuestProgress(2,23);

                elseif (standardAnswer(message,4)==true) then
                        gText="Ich hab dir gerade erklärt wie man den Zählerwert ändert. Wenn du alles bis jetzt verstanden hast machen wir weiter, wenn nicht erkläre ich dir nochmal alles. Hast du alles verstanden, \"Ja\" oder \"Nein\"?";
                        eText="I have just explained you how to change the counter value. If you have understood all till now, we will go on, if not I will explain it to you again. Have you understood everything, \"yes\" or \"no\"?";
                        originator:setQuestProgress(2,22);

  				elseif (standardAnswer(message,10)==true) then
        				gText="((Benutze Abkürzungen und Leetspeak höchstens OOC(Out of Character) und niemals IC(In Character). Der erste NPC Henry kann dir den Unterschied zwischen IC und OOC erklären.))";
        				eText="((Use abbreviations and leetspeak only OOC(Out of Character) and never IC(In Character). The first NPC Henry can explain you the difference between IC and OOC.))";

				elseif (standardAnswer(message,5)==true) then
                        gText="Gut, also nochmal von vorn. Du musst den Mauszeiger über das schwarze Kästchen oberhalb der Uhr bringen und dann mit dem Mausrad nach oben scrollen bis der Zählerwert auf 50 gesetzt wurde. Sag \"Weiter\" zum fortfahren.";
                        eText="Okay let\'s start from scratch. You have to bring the cursor above the black box and then to scroll up with the mouse wheel to set the counter value on 50. Say \"continue\" to go on.";
                        originator:setQuestProgress(2,23);

				elseif (string.find(message,"[Ss]croll.+[Ww]heel")~=nil or string.find(message,"[Mm]ouse.+[Ww]heel")~=nil or
				        string.find(message,"[Ss]crollrad")~=nil or string.find(message,"[Mm]ausrad")~=nil) then
                        gText="Wenn du kein Mausrad hast kannst du alternativ auch die beiden [Bild-Tasten] auf der Tastatur verwenden um den Zählerwert zu ändern.";
                        eText="If you don't have a mouse wheel you can also use the [Page up] and [Page down] keys on your keyboard to change the counter value.";
                        originator:setQuestProgress(2,23);
				else
                        gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
                        eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
                        originator:setQuestProgress(2,22);
                end

        elseif Progress==23 then --The second part of the lesson "Changing the counter value"
                        gText="Alternativ kannst du auch die beiden [Bild-Tasten] auf der Tastatur verwenden um den Zählerwert zu ändern.";
                        eText="Alternatively you can also use the [Page up] and [Page down] keys on your keyboard to change the counter value.";
                        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                        thisNPC:talk(CCharacter.say,outText);
                        gText="Wenn der Zähler auf 50 gesetzt wurde kannst du das Geld genauso wie das Brötchen bei Henry in die Tasche ziehen. Sag bescheid, fallst du die Münzen verlierst, dann geb' ich dir neue Münzen.";
                        eText="If the counter is set to 50 you can drag the money just like the bread roll Henry gave you into your bag. If you loose the coins just ask me for new ones and I will give you more.";
                        outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                        thisNPC:talk(CCharacter.say,outText);
                        gText="Wenn du das Geld aufgehoben hast, musst du in das Haus hier rein, um zu meinem Bruder dem Schmied zu gelangen. Er wird dir eine Ausrüstung verkaufen. Alles verstanden?";
                        eText="When you picked up the money, you can enter the house behind me to meet my brother. He's a smith and could sell you fighting equipment. Did you understand everything so far?";
                        originator:setQuestProgress(2,24);

        elseif Progress==24 then --Did the player understand the whole lesson?

                if (standardAnswer(message,1)==true) then
                        gText="Gut, wenn du die Ausrüstung hast komm zu mir und ich zeige dir wie man kämpft.";
                        eText="Good, come back when you have the equipment and I will teach you how to fight.";
                        originator:setQuestProgress(2,25);

                elseif (standardAnswer(message,2)==true) then
                        gText="Nicht? Dann fangen wir nochmal ganz von Anfang an. Sag \"Los\", wenn ich beginnen soll.";
                        eText="No? Okay let\'s start completelely from the beginning. Say \"Go\", if you want me to begin.";
                        originator:setQuestProgress(2,26);

                elseif (standardAnswer(message,4)==true) then
                        gText="Ich hab dir gerade erklärt wie man den Zählerwert ändert.Wenn du alles verstanden hast sag ja und hol die Rüstung bei meinem Bruder ab, wenn nicht erkläre ich dir nochmal alles von Anfang. Hast du alles verstanden, \"Ja\" oder \"Nein\"?";
                        eText="I have just explained you how to change the counter value. If you have understood everything just say yes and go and get an equipment from my brother if not I will explain it to you again. Have you understood everything, \"yes\" or \"no\"?";
                        originator:setQuestProgress(2,24);

                elseif (standardAnswer(message,5)==true) then
                        gText="Gut, also nochmal von vorn. Sag \"Los\" wenn ich beginnen soll.";
                        eText="Okay let\'s start from the beginning. Say \"Go\" if you want me to begin.";
                        originator:setQuestProgress(2,26)
  				elseif (standardAnswer(message,10)==true) then
        				gText="((Benutze Abkürzungen und Leetspeak höchstens OOC(Out of Character) und niemals IC(In Character). Der erste NPC Henry kann dir den Unterschied zwischen IC und OOC erklären.))";
        				eText="((Use abbreviations and leetspeak only OOC(Out of Character) and never IC(In Character). The first NPC Henry can explain you the difference between IC and OOC.))";

                elseif (standardAnswer(message,6)==true) then
                            if createCoins(originator)==true then
					           gText="Du brauchst mehr Münzen? Hier bitte.";
					           eText="You need more coins? Here you are.";
				            else
					           gText="Du willst mehr Münzen? Aber da liegt doch noch etwas Geld, heb erstmal das auf.";
					           eText="You want more coins? But there are still a few coins on the ground, pick up them first.";
				            end
                                
                else
                        gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
                        eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
                        originator:setQuestProgress(2,24);
                end
        elseif (Progress>=25 and Progress<=30) then
               
               if (standardAnswer(message,4)==true) then
                        gText="Geh und kauf eine Ausrüstung von meinem Bruder, das Geld hast du ja bereits. Wenn du neue Münzen brauchst sag bescheid. Wenn ich die Lektion über den Zähler wiederholen soll, sag einfach \"Lektion wiederholen\".";
                        eText="Now where you have the money go and buy a equipment from my brother. If ya\' need more coins just tell me. If ya\' want me to repeat the lesson about the counter value, just say \"Repeat lesson\".";
 
               elseif (string.find(message,"[Rr][üue]stung")~=nil or string.find(message,"[Aa]rmo[ur]")~=nil or string.find(message,"[Ee]quipment")~=nil) then
                        gText="Die Ausrüstung kannst du bei meinem Bruder drinnen kaufen. Komm zu mir wenn du sie hast.Wenn du die Lektion über das Ändern des Zählers wiederholen willst sag einfach \"Lektion wiederholen\".";
                        eText="You can buy the equipment from my brother who is inside. Come back when ya\' have the equipment. If ya\' want me to repeat the lesson how to change the counter value just say \"Repeat lesson\" and I will repeat it.";
               
               elseif (standardAnswer(message,5)==true) then
                        gText="Na gut, dann wiederholen wir die Lektion. Sag \"Los\" wenn ich beginnen soll.";
                        eText="Okay, lets repeat the lesson. Just say \"Go\" when I shall begin.";
                        originator:setQuestProgress(2,21);
               
               elseif (standardAnswer(message,6)==true) then
                            if createCoins(originator)==true then
					           gText="Du brauchst mehr Münzen? Hier bitte.";
					           eText="You need more coins? Here you are.";
				            else
					           gText="Du willst mehr Münzen? Aber da liegt doch noch etwas Geld, heb erstmal das auf.";
					           eText="You want more coins? But there are still a few coins on the ground, pick up them first.";
				            end
               elseif (Progress~=25) then --Progress must be ~=25 to prevent double talking of the NPC
                    gText,eText = SmallTalkDuringQuest(originator,message)


			   else
                        gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
                        eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
			   end
                                                        
        elseif (Progress==31) then
         if string.find(message,".+") then
           gText="Ah, du hast schon die Ausrüstung, ausgezeichnet. Um jemanden anzugreifen kannst du entweder die [Strg-Taste] gedrückt halten und den Gegner linksklicken,";
           eText="As I can see you got the fighting equipment. Now I can teach you how to fight.";
           outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		   npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
           gText="oder auch den Gegner rechtsklicken und im erscheinenden Menü \"Angreifen\" auswählen.";
           eText="Basically it is quite easy, if you want to attack somebody you have to either hold [Ctrl] and left-click your opponent or right-click the opponent and choose \"Attack\" from the appearing menu.";
           outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		   npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		   gText="Das rote Schauglas unter der Minikarte zeigt dir deine Lebensenergie, achte darauf das dieses nicht leer wird, sonst stirbt dein Charakter. Die beiden Schaugläser rechts daneben zeigen den Hunger (gelb) und die Manapunkte (blau) an.";
           eText="The red bar under the minimap shows you your life energy. Take good care of it so that it doesn't reach the bottom, or your character will die. The two bars next to it show you your food (yellow) and mana level (blue).";
           outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		   npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		   gText="Wenn du alles verstanden hast, darfst du an einer Mumie üben. Also, hast du alles verstanden, \"Ja\" oder \"Nein\"?";
		   eText="If you understood everything so far, you can now train on a mummy. So, did you understand everything \"Yes\" or \"No\"?";
           originator:setQuestProgress(2,32);
         end
        elseif (Progress==32) then
            if (standardAnswer(message,1)==true  or standardAnswer(message,7)==true) then
				newbie_list=world:getPlayersInRangeOf(ArenaCenterPosition, searchRadius); --gets a list of all Players in the Fighting Arena ( there should be only 1 or 0 players there)
				if (newbie_list[1]==nil or IsInArena(newbie_list[1])==false) then --if there are no Players in then...
					mummy_list=world:getMonstersInRangeOf(ArenaCenterPosition, searchRadius); -- gets a list of all mummys in the Arena (there should be only 1 or 0 mummys there)
					if (mummy_list[1]~=nil) then -- if there is a mummy in the arena then kill it!
						mummy_position=mummy_list[1].pos;
						mummy_list[1]:increaseAttrib("hitpoints",-10000);
					end
                gText="Gut, dann viel Glück.";
                eText="Well, then good luck.";
				originator:warp(playerArenaPosition);
           		originator:setQuestProgress(2,320); -- -- player is in the arena
				mummyCreated=createMonster();
                else
                gText="Bitte warte noch einen Augenblick, da kämpft gerade jemand in der Arena. Frag mich in einigen Momenten nochmal wegen der Kampflektion.";
                eText="Please wait a bit, there is someone fighting at the moment in the arena. Ask me in a few moments because of the fighting lesson.";
		        end
                
            elseif (standardAnswer(message,2)==true) then
            
                gText="Na gut, ich erklärs dir nochmal.";
                eText="Okay, I will explain it you again.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                gText="Es ist ganz einfach, um jemanden anzugreifen kannst du entweder die [Strg-Taste] gedrückt halten und den Gegner linksklicken, oder auch den Gegner rechtsklicken und im erscheinenden Menü \"Angreifen\" auswählen.";
                eText="It is quite easy, if you want to attack somebody you have to either hold [Ctrl] and leftclick your opponent or right-click the opponent and choose \"Attack\" from the appearing menu.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			    gText="Wenn du alles verstanden hast, darfst du nun an einer Mumie üben. Hast du alles verstanden, \"Ja\" oder \"Nein\"?";
		        eText="If you understood everything so far, you can now train on a mummy. Did you understand everything \"Yes\" or \"No\"?";
                originator:setQuestProgress(2,32);
  			elseif (standardAnswer(message,10)==true) then
        		gText="((Benutze Abkürzungen und Leetspeak höchstens OOC(Out of Character) und niemals IC(In Character). Der erste NPC Henry kann dir den Unterschied zwischen IC und OOC erklären.))";
        		eText="((Use abbreviations and leetspeak only OOC(Out of Character) and never IC(In Character). The first NPC Henry can explain you the difference between IC and OOC.))";

            elseif (standardAnswer(message,4)==true) then
                gText="Ich hab dir gerade erklärt wie man kämpft, hast du alles verstanden, \"Ja\" oder \"Nein\"?";
                eText="I have just explained you how to fight, have you understood everything, \"Yes\" or \"No\"?";
            else
                gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
                eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
                originator:setQuestProgress(2,32);
            end                            

        elseif (Progress==321) then
                if (string.find(message,"Arghh")~=nil) then
				gText="Die Mumie war zu stark für dich, ich musste deine Lebensenergie regenerieren, willst du es nochmal mit der Mumie aufnehmen?";
		        eText="The mummy was too strong for you, I had to regenerate your life energy, shall I let a mummy appear again?";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				end
            if (standardAnswer(message,1)==true or standardAnswer(message,7)==true) then
				newbie_list=world:getPlayersInRangeOf(ArenaCenterPosition, searchRadius);
				if (newbie_list[1]==nil or IsInArena(newbie_list[1])==false) then
					mummy_list=world:getMonstersInRangeOf(ArenaCenterPosition, searchRadius);
					if (mummy_list[1]~=nil) then
						mummy_position=mummy_list[1].pos;
						mummy_list[1]:increaseAttrib("hitpoints",-10000);
					end
                gText="Gut, dann viel Glück.";
                eText="Well, then good luck.";
				originator:warp(playerArenaPosition);
           		originator:setQuestProgress(2,320); -- player is in the arena
				mummyCreated=createMonster();
                else
                gText="Bitte warte noch einen Augenblick, da kämpft gerade jemand in der Arena. Frag mich in einigen Momenten nochmal wegen der Kampflektion.";
                eText="Please wait a bit, there is someone fighting at the moment in the arena. Ask me in a few moments because of the fighting lesson.";
		        end
			elseif (standardAnswer(message,2)==true) then
            
                gText="Na gut, dann erkläre ich dir nochmal wie man kämpft.";
                eText="Okay, then I will explain you again how to fight.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                gText="Es ist ganz einfach, um jemanden anzugreifen kannst du entweder die [Strg-Taste] gedrückt halten und den Gegner linksklicken, oder auch den Gegner rechtsklicken und im erscheinenden Menü \"Angreifen\" auswählen.";
                eText="It is quite easy, if you want to attack somebody you have to either hold [Ctrl] and leftclick your opponent or right-click the opponent and choose \"Attack\" from the appearing menu.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			    gText="Wenn du alles verstanden hast, darfst du nun an einer Mumie üben. Hast du alles verstanden, \"Ja\" oder \"Nein\"?";
		        eText="If you understood everything so far, you can now train on a mummy. Did you understand everything \"Yes\" or \"No\"?";
                originator:setQuestProgress(2,321);
            
            elseif (standardAnswer(message,4)==true) then

                gText="Wenn du alles verstanden hast, darfst du nun an einer Mumie üben. Hast du alles verstanden, \"Ja\" oder \"Nein\"? Wenn du \"Nein\" sagst erkläre ich dir nochmal wie man kämpft!";
                eText="If you understood everything so far, you can now train on a mummy. Did you understand everything \"Yes\" or \"No\"? If you say \"No\" I'll explain ya' again how to fight.";
  			elseif (standardAnswer(message,10)==true) then
        		gText="((Benutze Abkürzungen und Leetspeak höchstens OOC(Out of Character) und niemals IC(In Character). Der erste NPC Henry kann dir den Unterschied zwischen IC und OOC erklären.))";
        		eText="((Use abbreviations and leetspeak only OOC(Out of Character) and never IC(In Character). The first NPC Henry can explain you the difference between IC and OOC.))";

			elseif (string.find(message,"Arghh")~=nil) then
				return;
			else
                gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
                eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
                originator:setQuestProgress(2,321);
            end 
--------------------------------        
        elseif (Progress==322) then
        	    if (string.find(message,"Arghh")~=nil) then
				gText="Arr, du warst auf einmal weg, also hab ick die Mumie erledigt! Willst du es nochmal gegen die Mumie aufnehmen, \"Ja\" oder \"Nein\"? Wenn du \"Nein\" sagst erkläre ich dir nochmal wie man kämpft!";
		        eText="Arr, you disappeared, so I had to kill the mummy by myself. Do you want to fight against the mummy again, \"Yes\" or \"No\"? If you say \"No\" I'll explain again how to fight.";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				relog=true;
				relogging_newb=originator;
				end
            if (standardAnswer(message,1)==true  or standardAnswer(message,7)==true) then
				newbie_list=world:getPlayersInRangeOf(ArenaCenterPosition, searchRadius);
				if (newbie_list[1]==nil or IsInArena(newbie_list[1])==false) then
					mummy_list=world:getMonstersInRangeOf(ArenaCenterPosition, searchRadius);
					if (mummy_list[1]~=nil) then
						mummy_position=mummy_list[1].pos;
						mummy_list[1]:increaseAttrib("hitpoints",-10000);
					end
                gText="Gut, dann viel Glück.";
                eText="Well, then good luck.";
				originator:warp(playerArenaPosition);
           		originator:setQuestProgress(2,320); -- player is in the arena

				mummyCreated=createMonster();
                else
                gText="Bitte warte noch einen Augenblick, da kämpft gerade jemand in der Arena. Frag mich in einigen Momenten nochmal wegen der Kampflektion.";
                eText="Please wait a bit, there is someone fighting at the moment in the arena. Ask me in a few moments because of the fighting lesson.";
		        end
			elseif (standardAnswer(message,2)==true) then
            
                gText="Na gut, dann erkläre ich dir nochmal wie man kämpft.";
                eText="Okay, then I will explain you again how to fight.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                gText="Es ist ganz einfach, um jemanden anzugreifen kannst du entweder die [Strg-Taste] gedrückt halten und den Gegner linksklicken, oder auch den Gegner rechtsklicken und im erscheinenden Menü \"Angreifen\" auswählen.";
                eText="It is quite easy, if you want to attack somebody you have to either hold [Ctrl] and leftclick your opponent or right-click the opponent and choose \"Attack\" from the appearing menu.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			    gText="Wenn du alles verstanden hast, darfst du nun an einer Mumie üben. Hast du alles verstanden, \"Ja\" oder \"Nein\"?";
		        eText="If you understood everything so far, you can now train on a mummy. Did you understand everything \"Yes\" or \"No\"?";
                originator:setQuestProgress(2,322);
            
            elseif (standardAnswer(message,4)==true) then
                gText="Wenn du alles verstanden hast, darfst du nun an einer Mumie üben. Hast du alles verstanden, \"Ja\" oder \"Nein\"? Wenn du \"Nein\" sagst erkläre ich dir nochmal wie man kämpft!";
                eText="If you understood everything so far, you can now train on a mummy. Did you understand everything \"Yes\" or \"No\"? If you say \"No\" I'll explain ya' again how to fight.";
            elseif (string.find(message,"Arghh")~=nil) then
				return;
			else
                gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
                eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
                originator:setQuestProgress(2,322);
            end	
------------------------------------------------------------------
        elseif (Progress==33) then
                gText="Hast du den blauen Lichtkreis über deinen Kopf gesehen? Er erscheint immer dann wenn sich dein Charakter in einer Fertigkeit verbessert hast.";
                eText="Did you see the blue swirley above your head? It always appears when your character gets better in a skill.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                gText="Du kannst deine Charakterfertigkeiten durch das Drücken von [F8] anzeigen lassen. Die Schriftfarbe zeigt dir an wie gut du in einer Fertigkeit bist. Der Pfeil unten rechts zeigt an, welche Farbe einen hohen und welche einen niedrigen Skill bedeutet.";
                eText="You can display your skill levely by pressing [F8] button on your keyboard. The font color shows you the level of your skill. The arrow on the right shows you what color the skill will become the better you get.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		        gText="Das war die Lektion übers Kämpfen, folge der Straße um zur Holzfällerin Amelia zu gelangen.";
		        eText="That was the lesson about fighting, follow the street to meet the lumberjack Amelia.";
                originator:setQuestProgress(2,40);
        
		elseif (Progress==36) then
        	    if (string.find(message,"Arghh")~=nil) then
				gText="Arr, nächstes Mal wirst du die Mumie besiegen, einfach weiterüben! Folge der Straße um zur Holzfällerin Amelia zu gelangen, wenn ich eine Lektion wiederholen soll sag einfach  \"Lektion wiederholen\".";
		        eText="Arr, next time you will beat the mummy, you just need more exercise! Follow the street to meet the lumberjack Amelia, if you want me to repeat a lesson just say \"Repeat lesson\".";
				relog=true;
				relogging_newb=originator;
                originator:setQuestProgress(2,40);
				end		
		
		elseif (Progress>36) then
			if (standardAnswer(message,5)==true) then
				gText="Ihr könnt folgende Lektionen wiederholen: Zähler verändern, Kämpfen, Skills(Fähigkeiten). Welche wollt Ihr wiederholen?";
                eText="You can repeat the following lessons: Counter, Fighting, Skills. Which one do you want to repeat?";
		
		elseif (string.find(message,"[Zz][äa][he][lh][el].+")~=nil or string.find(message,"[Cc]ounter")~=nil) then
				gText="Also gut, um dem Zählerwert zu ändern musst du den Mauszeiger über die schwarze Box oberhalb der Uhr bringen und dann mit dem Mausrad nach oben oder unten scrollen.";
		        eText="Okay, you can change the counter value by bringing your cursor above the black box and scrolling up or down with the mouse wheel.";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				gText="Eine andere Möglichkeit um den Zählerwert zu ändern sind die [Bild]-Tasten auf deiner Tastatur, mit ihnen kannst du auch den Zählerwert erhöhen oder senken. Ich hoffe ich konnte dir helfen.";
		        eText="If you have no mouse wheel, you can also use the [Page up] and [Page down] keys on your keyboard to change the counter value. I hope I could help.";
						
			elseif (NPCStatus[originator.id]==1) then 
				 if (standardAnswer(message,1)==true or standardAnswer(message,7)==true) then
					newbie_list=world:getPlayersInRangeOf(ArenaCenterPosition, searchRadius);
					if (newbie_list[1]==nil or IsInArena(newbie_list[1])==false) then
						mummy_list=world:getMonstersInRangeOf(ArenaCenterPosition, searchRadius);
						if (mummy_list[1]~=nil) then
							mummy_position=mummy_list[1].pos;
							mummy_list[1]:increaseAttrib("hitpoints",-10000);
						end
						gText="Gut, dann wünsche ich dir erneut viel Glück!";
						eText="Well, then good luck again!";
						originator:warp(playerArenaPosition);
						originator:setQuestProgress(2,35); -- player is in the arena
						mummyCreated=createMonster();
					else
					gText="Bitte warte noch einen Augenblick, da kämpft gerade jemand in der Arena. Frag mich in einigen Momenten nochmal wegen der Kampflektion.";
					eText="Please wait a bit, there is someone fighting at the moment in the arena. Ask me in a few moments because of the fighting lesson.";
					end

				 elseif (standardAnswer(message,2)==true) then
						gText="In Ordnung, dann nicht. Folge der Straße um zur Holzfällerin Amelia zu gelangen, wenn du bei mir nochmal eie Lektion wiederholen willst sag einfach \"Lektion wiederholen\".";
						eText="Okay, then not. Follow the street to meet the lumberjack Amelia, if you want me to repeat a lesson just say \"Repeat lesson\".";
						NPCStatus[originator.id]=0;
				 
				 elseif (standardAnswer(message,4)==true) then
				 		gText="Ich will wissen ob du nochmal gegen die Mumie in der Arena antreten willst, Ja oder Nein?";
						eText="I want to know whether you want to fight against the mummy, yes or no?";
				 else
						gText="Ich hab dich nicht ganz verstanden, willst du die nochmal gegen die Mumie in der Arena kämpfen oder nicht?";
						eText="I didn't understand you, do you want to fight against the mummy in the arena, yes or no?";
				 end
			
			elseif (standardAnswer(message,7)==true) then
				gText="Also gut, um jemanden anzugreifen kannst du entweder die [Strg-Taste] gedrückt halten, und den Gegner mit der linken Maustaste anklicken.";
				eText="Okay, if you want to attack somebody you have to hold the [Crtl]-Key and click with the left mouse button your opponent.";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				gText="Alternativ kannst du den Gegner auch mit der rechten Maustaste anklicken und anschließend im erscheinenden Menü \"Angreifen\" auswählen.";
				eText="Alternatively you can also click your opponent with the right mouse button and choose \"Attack\" from the appearing menu.";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		   		gText="Das rote Schauglas unter der Minikarte zeigt dir deine Lebensenergie, achte darauf das dieses nicht leer wird, sonst stirbt dein Charakter. Die beiden Schaugläser rechts daneben zeigen den Hunger (gelb) und die Manapunkte (blau) an.";
           		eText="The red bar under the minimap shows you your life energy. Take good care of it so that it doesn't reach the bottom, or your character will die. The two bars next to it show you your food (yellow) and mana level (blue).";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		        gText="Wenn du willst kann ich nochmal eine Mumie erscheinen lassen, willst du nochmal kämpfen?";
		        eText="If you want I can let a mummy appear again, do you want to fight again?";
				NPCStatus[originator.id]=1;
			
			elseif (string.find(message,"[Ff][äa][he][ih][gi][kg][ek][ie][ti].+")~=nil or string.find(message,"[Ss]kill.+")~=nil) then
                gText="Sobald sich dein Charakter in einer Fertigkeit verbessert erscheint ein blauer Lichtkreis über seinen Kopf.";
                eText="As soon as your character gets better in a skill a blue swirlie appears above his head.";
                outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		        npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
                gText="Du kannst deine Charakterfertigkeiten durch das Drücken von [F8] anzeigen lassen. Die Schriftfarbe zeigt dir an wie gut du in einer Fertigkeit bist. Der Pfeil unten rechts zeigt an, welche Farbe einen hohen und welche einen niedrigen Skill bedeutet.";
                eText="You can display your skill levels by pressing the [F8] button on your keyboard. The font colors show you the level of your skills. The arrow on the right side shows which color means a high skill, and which expresses a low one";
			
			elseif (standardAnswer(message,4)==true) then
				gText="Folgt der Straße um zu Amelia zu gelangen. Wenn ihr eine von meinen Lektionen wiederholen wollt sagt einfach \"Lektion wiederholen\".";
                eText="Follow the street to meet Amelia. If you want to repeat one of my lessons just say \"Repeat lesson\"."; 
			elseif (standardAnswer(message,8)==true) then
					if (math.random(2)==1) then
        				gText="Grüß dich "..originator.name..", schön dich wieder zu sehen.";
        				eText="Greetings "..originator.name..", nice to see you again.";
        			else
        				gText="Grüße "..originator.name..", schön dich zu sehen, wie geht es dir heute?";
        				eText="Greetings "..originator.name..",nice to see you, how are you today?";
       				end			
   			elseif (string.find(message,"[Ww]hat.+reach.+bottom.+")~=nil or string.find(message,"[Ww]as.+wenn.+leer.+")~=nil) then
				gText="Wenn das rote Schauglas leer wird stirbt dein Charakter. Das gelbe Schauglas sollte auch immer voll sein, dein Charakter kann auch an Hunger sterben.";
                eText="If the red bar reaches the bottom your character dies. The yellow bar should also not reach the bottom, your character could die on hunger.";
			elseif (standardAnswer(message,9)==true) then
        		gText="Auf bald "..originator.name..".";
        		eText="Farewell "..originator.name..".";
  			elseif (standardAnswer(message,10)==true) then
        		gText="((Benutze Abkürzungen und Leetspeak höchstens OOC(Out of Character) und niemals IC(In Character). Der erste NPC Henry kann dir den Unterschied zwischen IC und OOC erklären.))";
        		eText="((Use abbreviations and leetspeak only OOC(Out of Character) and never IC(In Character). The first NPC Henry can explain you the difference between IC and OOC.))";
			else
				gText="Ich habe dir bereits alles beigebracht, wenn du eine Lektion jedoch wiederholen willst sag einfach \"Lektion wiederholen\".";
                eText="I've taught you already everything , but if you want me to repeat a lesson just say \"Repeat lesson\".";
			end

                
                
                		        
        elseif Progress<20 then --The Char. speaks to the NPC before he has done the first part of Newbieisland(the first NPC "Henry")
                gText="Hallo, mein Name ist Nargon, ich werde dir das Kämpfen beibringen, doch zuerst musst du zum ersten NPC Henry damit er dir einige Grundfunktionen des Spiels erklärt.";
                eText="Hello, my name is Nargon, i will teach you fighting, but first you have to go to the NPC Henry, he will teach you some basic functions of the game.";
        end
        if (Progress~=20) then
        		outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			    npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		end
		
  end
end       



function createCoins(originator)
	ItemPos = position(thisNPC.pos.x, thisNPC.pos.y+1, thisNPC.pos.z);

       if world:isCharacterOnField(ItemPos) then
		  ItemPos = position(thisNPC.pos.x, thisNPC.pos.y-1, thisNPC.pos.z);
       end       
    something=world:getItemOnField(ItemPos);    
    if (something.id~=3076) then
        world:createItemFromId(3076,50,ItemPos, true, 333, 0);
        return true;
    else
        return false;
    end
end

function SmallTalkDuringQuest(originator,message) 

   if (standardAnswer(message,8)==true) then
		if (math.random(2)==1) then
        gText="Grüß dich "..originator.name..", schön dich wieder zu sehen.";
        eText="Greetings "..originator.name..", nice to see you again.";
        else
        gText="Grüße "..originator.name..", schön dich zu sehen, wie geht es dir heute?";
        eText="Greetings "..originator.name..",nice to see you, how are you today?";
        end
   elseif (string.find(message,"[Ww]ie.+geht")~=nil or string.find(message,"[Hh]ow.+are.+you")~=nil) then
        gText="Mir gehts gut danke und wie gehts dir?";
        eText="I am fine thanks and how are you?";
   elseif (standardAnswer(message,9)==true) then
        gText="Auf bald "..originator.name..".";
        eText="Farewell "..originator.name..".";
   elseif (standardAnswer(message,10)==true) then
        gText="((Benutze Abkürzungen und Leetspeak höchstens OOC(Out of Character) und niemals IC(In Character). Der erste NPC Henry kann dir den Unterschied zwischen IC und OOC erklären.))";
        eText="((Use abbreviations and leetspeak only OOC(Out of Character) and never IC(In Character). The first NPC Henry can explain you the difference between IC and OOC.))";
   else
        gText="Tut mir leid, ich verstehe nicht, sag einfach \"Hilfe\" wenn du nicht weiter weisst.";
        eText="I am sorry, I don\'t understand. Just say \"Help\" if you don\'t know what to do.";
   end
   return gText,eText;
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

function IsInArena(newb)  --checks if the newb is in the Arena and returns either "true" or "false"

	if newb.pos.x>border[1] and newb.pos.x<border[2] then         --checks the x-Coordinates with the borders
	    if newb.pos.y>border[3] and newb.pos.y<border[4] then     --checks the y-Coordinates with the borders
	        return true;
		else
		    return false;
		end
	else
	    return false;
	end
end

function standardAnswer(message,answertype)
	if (answertype==1) then --answertype 1 == standardwords for "yes"
         if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil or
             string.find(message,"[Kk]lar")~=nil or string.find(message,"[Ss]icher")~=nil or
			 string.find(message,"[Ss]ure")~=nil) then
			 return true;
		 else
		     return false;
		 end

	elseif (answertype==2) then --answertype 2 == standardwords for "no"
		 if (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn][oö]")~=nil or
			 string.find(message,"[Nn]ay")~=nil) then
		    return true;
		 else
		    return false;
		 end
		
	elseif (answertype==3) then --answertype 3 == standardwords for "go"
		 if (string.find(message,"[Ll]os")~=nil or string.find(message,"[Gg]o")~=nil) or
		 	 string.find(message,"[Ss]tart")~=nil or string.find(message,"[Cc]ontinue")~=nil or
			 string.find(message,"[Ff]ahr.+fort")~=nil or string.find(message,"[Ww]weiter")~=nil then
		    return true;
		 else
		    return false;
		 end
   elseif (answertype==4) then --answertype 4 == standardwords for "help"
        if (string.find(message,"[Hh]ilf")~=nil or string.find(message,"[Hh]elp")~=nil or
			string.find(message,"[Hh]elf")~=nil or string.find(message,"[Vv]ersteh.+nicht")~=nil or
			string.find(message,"[Dd]on't.+understand") or string.find(message,"[Kk]eine.+[Aa]hnung")~=nil) then
			return true;
		else
		    return false;
		end
   elseif (answertype==5) then --answertype 5 == standardwords for "Repeat lesson"
        if (string.find(message,"[Ww]iederhol")~=nil or string.find(message,"[Rr]epeat")~=nil or
            string.find(message,"[Tt]ell.+again")~=nil or string.find(message,"[Ee]rz[äa][he][lh].+nochmal")~=nil) then
            return true;
		else
		    return false;
		end
   elseif (answertype==6) then --answertype 6 == standardwords for "more money"
        if (string.find(message,"[Mm][üue]nze")~=nil or string.find(message,"[Gg]eld")~=nil or string.find(message,"[Kk]upfer")~=nil or
            string.find(message,"[Mm]oney")~=nil or string.find(message,"[Cc]oin")~=nil or string.find(message,"[Cc]opper")~=nil) then
			return true;
		else
		    return false;
		end
   elseif (answertype==7) then --answertype 7 == standardwords for "fighting/fighting lesson"
		if (string.find(message,"[Kk][aä][me][pm][fp].+")~=nil or string.find(message,"[Ff]ight.+")~=nil) then
			return true;
		else
			return false;
		end
   elseif (answertype==8) then --anwswertype 8 == standardwords for "hello"
   		if (string.find(message,"[Hh][ae]llo")~=nil or string.find(message,"[Hh]i")~=nil or
   			string.find(message,"[Gg]r[uü][sß]+")~=nil or string.find(message,"[Gg]reet+")~=nil or 
   			string.find(message,"[Tt]a[gc]+")~=nil) then
   			return true;
   		else
   			return false;
   		end
   elseif (answertype==9) then --anwswertype 9 == standardwords for "bye"
   		if (string.find(message,"[Bb]ye")~=nil or string.find(message,"[Ff]arewell")~=nil or
   			string.find(message,"[Aa]uf.+[Bb]ald")~=nil or string.find(message,"[Tt]schüss")~=nil) then
   			return true;
   		else
   			return false;
   		end	
  
   elseif (answertype==10) then --answertype 10 == leetspeek (lol, rofl...)
	    if(string.find(message,"[Aa][Ff][Kk]")~=nil or string.find(message,"[Bb][Rr][Bb]")~=nil or 
		   string.find(message,"[Ss][Rr][Yy]")~=nil or string.find(message,"[Ll][Oo][Ll]")~=nil or
		   string.find(message,"[Rr][Oo][Ff][Ll]")~=nil or string.find(message,"[Ss][Tt][Ff][Uu]")~=nil or 
		   string.find(message,"[Nn][Oo0][Oo0][Bb]")~=nil) then
		   return true;
		else
		   return false;
		end
   
   else
        return false;
   end
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein mittelgroßer, muskulöser Zwerg. Sein angegrauter Vollbart ist zu Zöpfen gebunden. In den Händen hält er eine glänzende Zwergenaxt.";
        output[1]="A middletall, muscular dwarf. His greyed fullbeard is bounded into braids. In his hands he holds a shiny dwarfenaxe";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end

function createMonster()
	world:createMonster(101,monsterpos,20);
	world:gfx(7,monsterpos);
    world:makeSound(4,monsterpos);
    ---------Variable for nextCycle----------
    mummyCreated=true;
    ------------------------------------------
	mummy_list=world:getMonstersInRangeOf(ArenaCenterPosition, searchRadius);
	if (mummy_list[1]~=nil) then
		mummy_list[1]:increaseAttrib("hitpoints",-5000); --makes the mummy weaker!
	end

	return mummyCreated;
end

