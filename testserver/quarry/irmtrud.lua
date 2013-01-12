--[[name="Irmtrud"
position=136,-161,-9
sex=female 
race=dwarf
direction=south
radius=0
Task: Townguard at the mine in Silverbrand
last updated: 17/04/08
]]--
-- INSERT INTO npc VALUES (nextval('npc_seq'),1,136,-161,-9,4,false,'Irmtrud','npc_irmtrud.lua',1);
require("base.common")
require("npc.base.autonpcfunctions")
require("base.keys")
module("npc.irmtrud", package.seeall)

function useNPC(user)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger wech oder du bist ein Kopf kürzer!");
    thisNPC:talkLanguage(Character.say, Player.english, "Dont ya' touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********


    npc.base.autonpcfunctions.AddCycleText("#me lehnt sich auf ihre Axt und lässt einen prüfenden Blick durch die Mine schweifen.","#me leans on her axe and looks vetting through the mine.");
    npc.base.autonpcfunctions.AddCycleText("#me geht vor die Tore und rüttelt an ihnen \"Aye, is zu!\"","#me steps infront of the gate and juggles it \"Aye, it's closed!\"");
    npc.base.autonpcfunctions.AddCycleText("#me zieht eine Flasche Bier aus der Tasche und nimmt einen großzügigen Schluck.","#me pulls a bottle of beer out of her bag and takes a generous sip.");

	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]rü[sß]","Tach du.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc].*");
    npc.base.autonpcfunctions.AddAdditionalText("Grüß dich!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald. Irmorom mit dir.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ötter.+euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Uu]ff.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ünf.+euch");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er [bs][ie][si][td] [di][uh].*","Ick bin die "..thisNPC.name.." von der Bürgerwehr Silberbrands, jau! Ick bewache die Tore.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]ie.+[Nn]ame");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Ick schätze ick kann dir nich' viel helfen, hab hier Wache zu halten. Frach am besten nen anderen Zwerchen nach Hilfe.");


	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reeting","Be greeted!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings");
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Farewell. Irmorom with you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ive.+you");
    npc.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you","I am "..thisNPC.name..", from the Militia of Silverbrand, aye! I guard the gates.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]hat.+[Nn]ame");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]elp"," I don't think that I can help ya much, I have to keep watching here. The best is if ya' ask another dwarf for help.");


    npc.base.autonpcfunctions.AddTraderTrigger("buy","I don't sell anything. Do I look like a merchant?");
    npc.base.autonpcfunctions.AddTraderTrigger("sell","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything. Do I look like a merchant?");
    npc.base.autonpcfunctions.AddTraderTrigger("[Kk]aufen","Ick verkauf nichts. Sehe ich etwa aus wie ein Händler ?");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]erkaufen","Danke nein, ich habe bereits alles, wat ick brauche.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+kaufst","Danke nein, ich habe bereits alles, wat ick brauche.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkaufst","Ick verkauf nichts. Sehe ich etwa aus wie ein Händler?");
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]obaith","This whole island group is called Gobiath. Nice place, the weather usually does not get too rough or too hot, I like it.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reenbriar","Greenbriar is a settlement of the Halflings.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]arbo[u]+r","Troll's Bane and Vanima both have Harbors. The one southwest from Troll's Bane is bigger though.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ellbriar","That was an evil dungeon near Greenbriar ! The evil Cultists there sacrificed most of the Halflings of Greenbriar.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]agic [Aa]cademy","You don't want to go THERE ! It can only be reached by a mage, they say. They turn people into pigs or cows or worse things there!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]age [Aa]cademy","You don't want to go THERE ! It can only be reached by a mage, they say. They turn people into pigs or cows or worse things there!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]orthmark","it's not cooler there than elsewhere on Gobiath, except for the north wind in winter. Some Norodaj-Barbarians have settled there.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]ilverbrand","Silverbrand is the name of this town, its the town of the dwarfes.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]anima","Tol Vanima ? That's a whole small island full of trees and elves.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Well, that's the biggest town on Gobiath.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]arshikar","You find it past the small sand desert in the far northwest. I would use the Teleporter, the desert is full of scorpions.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    --  
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]obiath","Diese ganze Inselgruppe wird Gobiath genannt. Nette Gegend, dat Wetter wird nich zu rauh oder zu heiß, ick mag es.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reenbriar","Greenbriar is ne Halblingssiedlung.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]afen","Troll's Bane und Vanima haben Häfen. Der Hafen südwestlich von Troll's Bane ist aber größer.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ellbriar","Das war ein von einem barbarischen Kult besetzter Dungeon nahe bei Greenbriar. Die bösartigen Kultisten dort haben die meisten der Halblinge geopfert.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]agierakademie","Ihr wollt nicht wirklich DA hin ! Es wird gesagt, den Ort kann nur ein Magier erreichen. Die verwandeln dort Leute in Schweine, Kühe oder schlimmeres !");
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]ordmark","Es ist da nicht kälter als anderswo auf Gobiath, abgesehen vom Nordwind im Winter. Dort haben sich einige Norodaj-Barbaren angesiedelt.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]ilberbrand","Silberbrand ist der Name dieser Stadt hier, es ist die Stadt der Zwerge.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]anima","Tol Vanima ? Das ist eine ganze kleine Insel voller Bäume und Elfen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Tja, das ist die grösste Stadt auf Gobiath.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]arshikar","Das findet man weit im Nordwesten hinter der kleinen Sandwüste. Ich würde den Teleporter benutzen, die Wüste ist voller Skorpione.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]rmorom","The Lord of trade and craftsmenship ! He is the main god of the dwarves.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]rmorom","Der Herr des Handels und des Handwerks ! Er ist der Hauptgott des Zwergenvolkes.");
    npc.base.autonpcfunctions.AddCondition("lang","german");



    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,2};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then  --Npc wird aus nächster Nähe angesprochen
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then		
		  if (originator.activeLanguage==2) then --If the Character speaks dwarfish then...	
		  		
             if (string.find(message,"[Ii]rmtrud.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ii]rmtrud.+[Oo]pen.+[Gg]ate.*")~=nil
			 or string.find(message,"[Cc]lose.+[Gg]ate.+[Ii]rmtrud.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate.+[Ss]ister.*")~= nil
			 or string.find(message,"[Tt]or.+[Aa]uf.+[Ii]rmtrud.*")~=nil or string.find(message,"[Tt]or.+[Aa]uf.+[Ss]chwester.*")~=nil
			 or string.find(message,"[Ss]chwester.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ss]ister.+[Oo]pen.+[Gg]ate.*")~=nil) then  
				if (math.random(0,200)==1) then --Chance of 1 to 199 not to open the door
					if (math.random(0,10)==1) then
                        gText="#me hält ihren Kopf \"Nay, bin heut nich im Stimmung, hab Kopfweh! Beweg deinen Hintern selber!\".";
		        	    eText="#me holds her head \"Nay, today I'm in a foul mood, I've headache! Mov' yer behind yerself!\".";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		        	else
					    gText="#me grummelt \"Mach doch selber auf!\".";
                		eText="#me grumbles \"I don't feel like it today. Do it yourself!\".";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		        	end
		        	
		        else

		        	doora=world:getItemOnField(position( 137, -163, -9));
		        	doorb=world:getItemOnField(position( 138, -163, -9 ));
		        	if (doora.id==684 or doorb.id==668) then --If one of the doors is already opened then...
						gText="Dat Tor steht doch schon offen.";
                		eText="The gate is already opened.";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					else
        			base.keys.UnlockDoor( doora );
					base.keys.UnlockDoor( doorb );

		        	doora=world:getItemOnField(position( 137, -163, -9));
		        	doorb=world:getItemOnField(position( 138, -163, -9 ));
		        	OpenDoor( doora );
					OpenDoor( doorb );
					gText="#me öffnet das Tor.";
					eText="#me opens the gate.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					if (originator.id~=867463423 and originator.id~=2082906332) then
						last_User= originator.name;
					end
					 if (originator.pos.y>-162) then --The char. has to stand outside of the doors to get greeted  
						if (originator:increaseAttrib( "sex",0) == 0) then --Char. is male
							gText="Willkommen zurück Bruder.";
							eText="Welcome back brother.";
                			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						else
						    gText="Willkommen zurück Schwester.";
                			eText="Welcome back sister";
                			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						end
					 end
				    end
				end				
			elseif ( string.find(message,"[Tt]or.+[Zz]u.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate.*")~=nil) then
			
				if ( world:isCharacterOnField(position( 137, -163, -9)) == true or world:isCharacterOnField(position( 138, -163, -9)) == true ) then -- Is a char. on the position of the doors?
					gText="Ich kann dat Tor nich zumachen wenn da jemand steht.";
                	eText="I can't close the gate during someone stands there.";
                	outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        	npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				else
				
				doora=world:getItemOnField(position( 137, -163, -9));
		        doorb=world:getItemOnField(position( 138, -163, -9 ));
					if (doora.id==652 and doorb.id==656) then --If both doors are already closed then...
						gText="Dat Tor ist bereits zu.";
                		eText="The gate is already closed.";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					else
						CloseDoor( doora );
						CloseDoor( doorb );
						doora=world:getItemOnField(position( 137, -163, -9));
		        		doorb=world:getItemOnField(position( 138, -163, -9 ));
						base.keys.LockDoor( doora );
						base.keys.LockDoor( doorb );
						gText="#me lässt die Flügel des Tores krachend zufallen und sperrt ab.";
						eText="#me shuts the gate crashing then locks it.";
						outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
						npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					end
				end
			elseif (string.find(message,"[Ww]em.+hast.+du.+zuletzt.+aufgemacht.*")~=nil or string.find(message,"[Ww]ho.+did.+you.+open.+last.+time.+the.+gate.*")~=nil) then
					if (originator.id==867463423 or originator.id==2082906332) then
						if (last_User~=nil) then
							gText="Dem dem ick zuletzt aufjemacht hab war '"..last_User.."', jau!";
							eText="The one who I opened last time the door was '"..last_User.."', aye!";
							outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
							npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						else
							gText="Tut mir leid, hab ick schon vergessen.";
							eText="I am sorry, I have forgot who I opened last time the gate.";
							outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
							npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						end
					else
						gText="Dat verrate ick dir doch nich!";
						eText="I don't tell that to you!";
						outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
						npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					end	
			elseif (string.find(message,"[Tt]or.+[Aa]uf")~=nil or string.find(message,"[Oo]pen.+[Gg]ate")~=nil) then
			      
				   	gText="Ick bin deine Schwester, also behandle mich och so!";
					eText="I'm yer sister, so ye better treat me lik' this!";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);

			else
			
			    npc.base.autonpcfunctions.TellSmallTalk(message,originator);
			end 

		  elseif (originator.activeLanguage==0) then --If the Character. speaks Common 
		  	
		  	if (string.find(message,"[Ii]rmtrud.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ii]rmtrud.+[Oo]pen.+[Gg]ate.*")~=nil
			 	or string.find(message,"[Cc]lose.+[Gg]ate.+[Ii]rmtrud.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate.+[Ss]ister.*")~= nil
			 	or string.find(message,"[Tt]or.+[Aa]uf.+[Ii]rmtrud.*")~=nil or string.find(message,"[Tt]or.+[Aa]uf.+[Ss]chwester.*")~=nil
			 	or string.find(message,"[Ss]chwester.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ss]ister.+[Oo]pen.+[Gg]ate.*")~=nil
			 	or string.find(message,"[Tt]or.+[Aa]uf")~=nil or string.find(message,"[Oo]pen.+[Gg]ate")~=nil
			 	or string.find(message,"[Tt]or.+[Zz]u.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate")~=nil) then  
		     	
					gText="Sprich wie'n Zwerch mit mir oder such das weite!";
					eText="Talk lik' a dwarf wit' me or leave!";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		  	else
		  		
				npc.base.autonpcfunctions.TellSmallTalk(message,originator);
			end 
		  end --(Schleife: if activeLanguage...)
		  

		else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
	    end
	elseif npc.base.autonpcfunctions.BasicNPCChecks(originator,10) then --Npc wird aus mehreren Schritten Entfernung angesprochen
		
		if (originator.activeLanguage==2) then --If the Character speaks dwarfish then...
		     if (string.find(message,"[Ii]rmtrud.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ii]rmtrud.+[Oo]pen.+[Gg]ate.*")~=nil
			 or string.find(message,"[Cc]lose.+[Gg]ate.+[Ii]rmtrud.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate.+[Ss]ister.*")~= nil
			 or string.find(message,"[Tt]or.+[Aa]uf.+[Ii]rmtrud.*")~=nil or string.find(message,"[Tt]or.+[Aa]uf.+[Ss]chwester.*")~=nil
			 or string.find(message,"[Ss]chwester.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ss]ister.+[Oo]pen.+[Gg]ate.*")~=nil) then  
				if (math.random(0,200)==1) then --Chance of 1 to 199 not to open the door
					if (math.random(0,10)==1) then
                        gText="#me hält ihren Kopf \"Nay, bin heut nich im Stimmung, hab Kopfweh! Beweg deinen Hintern selber!\".";
		        	    eText="#me holds her head \"Nay, today I'm in a foul mood, I've headache! Mov' yer behind yerself!\".";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		        	else
					    gText="#me grummelt \"Mach doch selber auf!\".";
                		eText="#me grumbles \"I don't feel like it today. Do it yourself!\".";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		        	end
		        	
		        else

					doora=world:getItemOnField(position( 137, -163, -9));
		        	doorb=world:getItemOnField(position( 138, -163, -9 ));
		        	if (doora.id==684 or doorb.id==668) then --If one of the doors is already opened then...
						gText="Dat Tor steht doch schon offen.";
                		eText="The gate is already opened.";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					else
        			base.keys.UnlockDoor( doora );
					base.keys.UnlockDoor( doorb );

					doora=world:getItemOnField(position( 137, -163, -9));
		        	doorb=world:getItemOnField(position( 138, -163, -9 ));
		        	OpenDoor( doora );
					OpenDoor( doorb );
					gText="#me öffnet das Tor.";
					eText="#me opens the gate.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					if (originator.id~=867463423 and originator.id~=2082906332) then
						last_User= originator.name;
					end
				     if (originator.pos.y>-162) then --The char. has to stand outside of the doors to get greeted  

						if (originator:increaseAttrib( "sex",0) == 0) then --Char. is male
							gText="Willkommen zurück Bruder.";
							eText="Welcome back brother.";
                			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						else
						    gText="Willkommen zurück Schwester.";
                			eText="Welcome back sister";
                			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					 	end
				    end
					end
				end
				    
			 elseif ( string.find(message,"[Tt]or.+[Zz]u.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate")~=nil) then
				if ( world:isCharacterOnField(position( 137, -163, -9)) == true or world:isCharacterOnField(position( 138, -163, -9)) == true ) then -- Is a char. on the position of the doors?
					gText="Ich kann dat Tor nich zumachen wenn da jemand steht.";
                	eText="I can't close the gate during someone stands there.";
                	outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        	npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				else
				
					doora=world:getItemOnField(position( 137, -163, -9));
		        	doorb=world:getItemOnField(position( 138, -163, -9 ));
					if (doora.id==652 and doorb.id==656) then --If both doors are already closed then...
						gText="Dat Tor ist bereits zu.";
                		eText="The gate is already closed.";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					else
						CloseDoor( doora );
						CloseDoor( doorb );
						doora=world:getItemOnField(position( 137, -163, -9));
		        		doorb=world:getItemOnField(position( 138, -163, -9 ));
						base.keys.LockDoor( doora );
						base.keys.LockDoor( doorb );
						gText="#me lässt die Flügel des Tores krachend zufallen und sperrt ab.";
						eText="#me shuts the gate crashing then locks it.";
						outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
						npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					end
				end
			 elseif (string.find(message,"[Tt]or.+[Aa]uf")~=nil or string.find(message,"[Oo]pen.+[Gg]ate")~=nil) then
			       	gText="Ick bin deine Schwester, also behandle mich och so!";
					eText="I'm yer sister, so ye better treat me lik' this!";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
             end --Wenn nicht "Tor auf Irmtrud" oder "Tur zu" dann ende
		elseif (originator.activeLanguage==0) then
				if (string.find(message,"[Ii]rmtrud.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ii]rmtrud.+[Oo]pen.+[Gg]ate.*")~=nil
			 	or string.find(message,"[Cc]lose.+[Gg]ate.+[Ii]rmtrud.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate.+[Ss]ister.*")~= nil
			 	or string.find(message,"[Tt]or.+[Aa]uf.+[Ii]rmtrud.*")~=nil or string.find(message,"[Tt]or.+[Aa]uf.+[Ss]chwester.*")~=nil
			 	or string.find(message,"[Ss]chwester.+[Tt]or.+[Aa]uf.*")~=nil or string.find(message,"[Ss]ister.+[Oo]pen.+[Gg]ate.*")~=nil
			 	or string.find(message,"[Tt]or.+[Zz]u.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate")~=nil) then  
		     	
					gText="Sprich wie'n Zwerch mit mir oder such das weite!";
					eText="Talk lik' a dwarf wit' me or leave!";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				end		
				
		end
	end
end
