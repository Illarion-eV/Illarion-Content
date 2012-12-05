--Npc:Torina Scibrim
--Location: CADOMYR
--Task: Notary(sells decrees, buys decrees, sells keys, town membership bureau)

-- INSERT INTO npc VALUES (nextval('npc_seq'),0,109,550,200,4,false,'Torina Scibrim','npc_torina_scibrim.lua',1);

require("npc.base.autonpcfunctions")
require("npc.base.trader_functions");
require("base.factions")
module("npc.torina_scibrim", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Lasst mich in Ruhe!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********
	
	npc.base.autonpcfunctions.AddTraderTrigger("buy","I sell decrees and keys.");
    npc.base.autonpcfunctions.AddTraderTrigger("sell","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I sell decrees and keys.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Kk]aufen","Ick verkauf nur Dekrete und Schl�ssel.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]erkaufen","Danke nein, ich habe bereits alles, was ich brauche.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+kauf","Danke nein, ich habe bereits alles, was ich brauche.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ick verkauf nur Dekrete und Schl�ssel.");
		
	npc.base.autonpcfunctions.AddTraderTrigger("[Mm]ein.+[Nn]ame.+ist.*","Freut mich %CHARNAME, ich bin die "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii]c[hk].+bin.*");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Man.+nennt.+mich.*");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii]c[hk].+hei[s�][se].*");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddConsequence("state","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Mm]y.+[Nn]ame.+is.*","A pleasure %CHARNAME, I am "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii].+am.*");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddConsequence("state","=",1);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]�tter.+euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Uu]ff.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]�nf.+euch");
    npc.base.autonpcfunctions.AddConsequence("inform","Der H�ndler l�chelt dich an und winkt zum Abschied.");

	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Farewell.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ive.+you");
    npc.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npc.base.autonpcfunctions.AddConsequence("inform","The trader smiles at you and waves.");

	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er [bs][ie][si][td] [di][uh].*","Ich bin die "..thisNPC.name..". Und wer bist du?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]ie.+[Nn]ame");

    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you","I am "..thisNPC.name.." and who are you?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]hat.+[Nn]ame");
    
	npc.base.autonpcfunctions.AddTraderTrigger("Where am [Ii]","You are in Cadomyr.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]o bin ich","Du bist in Cadomyr.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
        
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ow.+are.you","I am fine and how are you?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ie.+gehts","Eigentlich ganz gut, danke der Nachfrage.");
    npc.base.autonpcfunctions.AddCondition("lang","german");  
    npc.base.autonpcfunctions.AddAdditionalText("Mir geht es gut und dir?");
	
	
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Ich verkaufe Dekrete und Schl�ssel, au�erdem k�nnt ihr bei mir Dekrete einl�sen und euch als B�rger eintragen lassen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("helfen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npc.base.autonpcfunctions.AddConsequence("inform","Stichw�rter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einl�sen\", \" Schl�ssel\", \" B�rger werden\"");  
    
	npc.base.autonpcfunctions.AddTraderTrigger("[Hh]elp"," I sell decrees and keys, furthermore you can exchange decrees and get registered as citizen here.");
    npc.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");
    
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reeting","Be greeted %CHARNAME, nice to see you here again.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]i");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddAdditionalText("Greetings %CHARNAME, nice to see you again");
	npc.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reeting","Be greeted, I am "..thisNPC.name..", the notary of this town. You can buy here decrees or exchange them. Also I can register you as citizen or sell you a key.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]i");
    npc.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]r�[s�]","Gr��e %CHARNAME, sch�n euch mal wieder hier zu sehen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rue[s�]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc].*");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddAdditionalText("Gr�� dich %CHARNAME, sch�n euch mal wiederzusehen.");
	npc.base.autonpcfunctions.AddConsequence("inform","Stichw�rter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einl�sen\", \" Schl�ssel\", \" B�rger werden\"");
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]r�[s�]","Zum Gru�e, ich bin "..thisNPC.name..", die Notarin dieser Stadt, bei mir kannst du Dekrete kaufen und einl�sen.Au�erdem kannst du hier Schl�ssel kaufen und dich als B�rger anmelden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rue[s�]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc].*");
    npc.base.autonpcfunctions.AddAdditionalText("Gr�� dich!");
    npc.base.autonpcfunctions.AddConsequence("inform","Stichw�rter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einl�sen\", \" Schl�ssel\", \" B�rger werden\""); 
    

    npc.base.autonpcfunctions.AddTraderTrigger("","Habt ihr ein Dekret f�r mich oder wollt ihr vielleicht ein Dekret oder Schl�ssel kaufen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddConsequence("inform","Stichw�rter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einl�sen\", \" Schl�ssel\", \" B�rger werden\"");
    npc.base.autonpcfunctions.AddTraderTrigger("","Do you have a decree for me or do you maybe want to buy a decree or a key?");
    npc.base.autonpcfunctions.AddCondition("lang","english");  
    npc.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");

	if not InitDone then
    	choiceIndex={}; --value which stands for the decree/key the user wants

        --thisNPC:warp(position(109,550,200));
        --thisNPC:setAttrib("faceto",4);
        --thisNPC:setAttrib("racetyp",30);

		townID = base.factions.setLocation(thisNPC); --look up where the npc is standing!
		InitDone = true;
		
	end

    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
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
    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

    
end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
	if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then  --Npc wird aus n�chster N�he angesprochen
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then			
			if not mainTask(texttype,message,originator) then
				npc.base.autonpcfunctions.TellSmallTalk(message,originator);
			end
			
		else
        	npc.base.autonpcfunctions.Confused(
            "#me sieht dich leicht verwirrt an",
            "#me looks at you a little confused"
            );
		end
	end
end


function mainTask(texttype,message,originator)
	Factionvalues = base.factions.get(originator);		

	if (string.find(message,"[Bb]�rger.+werden")~=nil or string.find(message,"[Bb]ecome.+[Cc]itizen")~=nil or
		   string.find(message,"[Bb]uerger.+werden")~=nil or string.find(message,"[Bb]ecome.+[Mm]ember.+[Tt]own")~=nil or
		   string.find(message,"[Mm]itglied.+Stadt")~=nil) then

			if (Factionvalues[NpcLocation[thisNPC.id]+RANK_OFFSET] == outcastRank) then
			--OUTCASTED CHAR CHECK
			 	gText="Ihr seid aus der Stadt verbannt, ihr m�sst mir erst ein unterschriebenes Entbannungsdekret der K�nigin vorzeigen damit ich Euch in die B�rgerliste eintragen kann.";
				eText="You're outcasted from this town, you need to show me first a signed unban decree of the queen to sign you in in the citizen list.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				return true;
			end


			--if ((TextRepeatCnt[originator.id]==nil) or (TextRepeatCnt[originator.id] == 0)) then
			if ((flag[originator.id]==nil) or (flag[originator.id] == 0)) then
			 	gText="Diese Eintragung wird "..PriceListForTownChange[Factionvalues.towncnt].." Silberst�cke kosten, wenn ihr nach eurem Beitritt zu einer anderen Stadt wechseln wollt verdoppeln sich die Kosten daf�r. Seid ihr sicher dass ihr dieser Stadt beitreten wollt?";
				eText="Adding you to the citizenlist will cost "..PriceListForTownChange[Factionvalues.towncnt].." silver coins. If you decide to become a citizen of another town after joining the fee will double. Do you really wish to join this town?";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				flag[originator.id] = 0;
				return true;
			end
	elseif (string.find(message,"[Jj]a")~=nil or string.find(message,"[Ss]icher")~=nil or
			string.find(message,"[Yy]es")~=nil or string.find(message,"[Ss]ure")~=nil) and (flag[originator.id] == 0) then

				makeCharMemberOfTown(originator,Factionvalues,citizenRank);
				flag[originator.id] = nil;
				return true;
				
	elseif (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn]o")~=nil) and (flag[originator.id] == 0) then

				flag[originator.id] = nil;
				return true;

	elseif string.find(message,"[Dd]ekret.+einl[�o][se][es][ne]")~=nil or string.find(message,"[Ee]xchange.+[Dd]ecree")~=nil or
		   string.find(message,"[Dd]ecree.+[Ee]xchange")~=nil then

				gText="Ihr habt ein Dekret f�r mich...lasst mich mal nachschauen.";
				eText="You have a decree with you...let me have a look at it.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				deleteDecree(originator);
				return true;

	elseif string.find(message,"[Ee]ntbannungsdekret")~=nil or string.find(message,"[Uu]nban.+[Dd]ecree")~=nil then
			if (Factionvalues.rankTown == leaderRank) then --if Character is leader in this town

				originator:createItem(3110,1,751,Factionvalues.tid);	--town id stored in the data
				
				gText="Ein Entbannungsdekret, kommt sofort.";
				eText="A unban decree, right away.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				
				
			else	
				gText="Nur der Anf�hrer dieser Stadt kann ein Entbannungsdekret erwerben!";
				eText="Only the leader of the town can buy a unban decree!";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			end
			return true;
	end
	return false;
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Sie tr�gt eine prunkvolle Robe mit einem aufgestickten Wappen Cadomyrs darauf.(Notarin Cadomyrs)";
        output[1]="She wears a quite new-looking robe with an embroidered emblem of Cadomyr on it.(Notary of Cadomyr)";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
