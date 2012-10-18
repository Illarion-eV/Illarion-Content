
--Npc:Frederik Silvereye
--Location: Galmair
--Task: Notary(sells decrees, buys decrees, sells keys, town membership bureau)

-- INSERT INTO npc VALUES (nextval('npc_seq'),0,404,263,201,4,false,'Frederik Silvereye','npc_frederik_silvereye.lua',0);

require("npc.base.autonpcfunctions")
require("npc.base.trader_functions");
module("npc.frederik_silvereye", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Lasst mich in Ruhe!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
    currentNPC=counter;
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

	if 	(string.find(message,"[Dd]ekret.+kaufen.*")~=nil or string.find(message,"[Bb]uy.+decree.*")~=nil or
		 string.find(message,"[Dd]ekret.+erwerben.*")~=nil) then
			if (Factionvalues.rankTown == leaderRank) then --if Character is leader in this town
		 		gText="Was f�r ein Dekret ben�tigt ihr? Eines f�r die Eintragung als 'Anf�hrer', 'vollst�ndiges Mitglied' oder 'Anw�rter' einer Gilde oder doch ein 'Entbannungsdekret'?";
				eText="What kind of decree do you need? For a entry as a 'leader', 'full member' or 'aspirant' of a guild or a 'unban decree'?";
			else
				gText="Was f�r ein Dekret ben�tigt ihr? Eines f�r die Eintragung als 'Anf�hrer', 'vollst�ndiges Mitglied' oder 'Anw�rter' einer Gilde?";
				eText="What kind of decree do you need? For a entry as a 'leader', 'full member' or 'aspirant' of a guild?";
			end
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;

	elseif string.find(message,"[Aa]nf�hrer.+[Ss]tadt")~=nil or string.find(message,"[Ll]eader.+ [Tt]own")~=nil or
		   string.find(message,"[Aa]nfuehrer.+[Ss]tadt")~=nil or string.find(message,"[Ll]eader.+ [Cc]ity")~=nil or
		   string.find(message,"[Hh]errscher.+[Ss]tadt")~=nil or string.find(message,"[Aa]nf�hrer.+ [Oo]rt")~=nil then
		 	if (originator:isAdmin()) then --only GMs can become faction leaders
				gText="Gut, ich trage euch als neuen Anf�hrer dieser Stadt ein.";
				eText="Good, I will enregister you as new leader of this town.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				makeCharMemberOfTown(originator,Factionvalues,leaderRank);
			end
			return true;

	elseif (string.find(message,"[Bb]�rger.+werden")~=nil or string.find(message,"[Bb]ecome.+[Cc]itizen")~=nil or
		   string.find(message,"[Bb]uerger.+werden")~=nil or string.find(message,"[Bb]ecome.+[Mm]ember.+[Tt]own")~=nil or
		   string.find(message,"[Mm]itglied.+Stadt")~=nil) then
			if (Factionvalues[NpcLocation[thisNPC.id]+RANK_OFFSET] == outcastRank) then -- the char is outcasted from this town
			 	gText="Ihr seid aus der Stadt verbannt, kommt mit einem Entbannungsdekret des Anf�hrers wieder wenn ihr B�rger werden wollt.";
				eText="You're outcasted from this town, come back with a unban decree from the leader if you want to become a citizen.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				return true;
			end
			if ((TextRepeatCnt[originator.id]==nil) or (TextRepeatCnt[originator.id] == 0)) then
			 	gText="Diese Eintragung wird "..PriceListForTownChange[Factionvalues.towncnt].." Silberst�cke kosten, wenn ihr nach eurem Beitritt zu einer anderen Stadt wechseln wollt verdoppeln sich die Kosten daf�r. Seid ihr sicher dass ihr dieser Stadt beitreten wollt?";
				eText="Adding you to the citizenlist will cost "..PriceListForTownChange[Factionvalues.towncnt].." silver coins. If you decide to become a citizen of another town after joining the fee will double. Do you really wish to join this town?";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				TextRepeatCnt[originator.id] = 0;
				return true;
			end
	elseif (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil) and (TextRepeatCnt[originator.id] == 0) then
			makeCharMemberOfTown(originator,Factionvalues,citizenRank);
			TextRepeatCnt[originator.id] = nil;
			return true;
	elseif (string.find(message,"[Nn]ein")~=nil or string.find(message,"[Nn]o")~=nil) and (TextRepeatCnt[originator.id] == 0) then
			TextRepeatCnt[originator.id] = nil;
			return true;
	elseif string.find(message,"[Aa]nw[�a][re][tr][et][re]")~=nil or string.find(message,"[Aa]spirant")~=nil then

			choiceIndex[originator.id]=1; --aspirant of guild
			gText="Das Dekret f�r eine Anw�rtereintragung wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nur noch bitte den Namen der Gilde.";
			eText="The decree for a aspirant entry will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
	elseif string.find(message,"[Mm]itglied")~=nil or string.find(message,"[Mm]ember")~=nil then
		 	choiceIndex[originator.id]=2; --member of guild
			gText="Das Dekret f�r eine Mitgliedseintragung wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nur noch bitte den Namen der Gilde.";
			eText="The decree for a member entry will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
	elseif string.find(message,"[Aa]nf[�u][he][rh][er][re]")~=nil or string.find(message,"[Ll]eader")~=nil then
			choiceIndex[originator.id]=3; --leader of guild
		 	gText="Das Dekret f�r eine Anf�hrereintragung wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nur noch bitte den Namen der Gilde.";
			eText="The decree for a leader entry will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
	elseif string.find(message,"[Hh]auptschl�ssel")~=nil or string.find(message,"[Mm]ain.+[Kk]ey")~=nil then
			if  (string.find(message,"[Ss]tadt")~=nil or string.find(message,"[Tt]own")~=nil) and (Factionvalues.rankTown == leaderRank) then
				if (TownMainKey[NpcLocation[thisNPC.id]]==nil) then
		            gText="F�r diese Stadt existiert kein Hauptschl�ssel!";
					eText="There does no main key exist for this town!";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				else
		            gText="Bitte sehr, euer Hauptschl�ssel.";
					eText="Here is your main key.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					originator:createItem(TownMainKey[NpcLocation[thisNPC.id]][1],1,TownMainKey[NpcLocation[thisNPC.id]][2],TownMainKey[NpcLocation[thisNPC.id]][3]); --creates Key
				end
				return true;
			end
			choiceIndex[originator.id] = 4; -- main key
			gText="Der Hauptschl�ssel wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nun noch den Namen der Gilde bitte.";
			eText="The main key will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);

			return true;
	elseif string.find(message,"[Kk]erkerschl�ssel")~=nil or string.find(message,"[Jj]ail.+[Kk]ey")~=nil then
			if  (string.find(message,"[Ss]tadt")~=nil or string.find(message,"[Tt]own")~=nil) and (Factionvalues.rankTown == leaderRank) then
				if (TownJailKey[NpcLocation[thisNPC.id]]==nil) then
		            gText="F�r diese Stadt existiert kein Kerkerschl�ssel!";
					eText="There does no jail key exist for this town!";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				else
		            gText="Bitte sehr, euer Kerkerschl�ssel.";
					eText="Here is your jail key.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					originator:createItem(TownJailKey[NpcLocation[thisNPC.id]][1],1,TownJailKey[NpcLocation[thisNPC.id]][2],TownJailKey[NpcLocation[thisNPC.id]][3]); --creates Key
				end
				return true;
			end
			choiceIndex[originator.id] = 5; -- jail key
			gText="Der Kerkerschl�ssel wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nun noch den Namen der Gilde bitte.";
			eText="The jail key will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);

			return true;
	elseif string.find(message,"[Ee]ntbannungsdekret")~=nil or string.find(message,"[Uu]nban.+[Dd]ecree")~=nil then
			if (Factionvalues.rankTown == leaderRank) then --if Character is leader in this town
				choiceIndex[originator.id]=6;
				gText="Ein Entbannungsdekret, kommt sofort.";
				eText="A unban decree, right away.";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				createChoice(originator,message,choiceIndex,Factionvalues);
			else
				gText="Nur der Anf�hrer dieser Stadt kann ein Entbannungsdekret erwerben!";
				eText="Only the leader of the town can buy a unban decree!";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			end
			return true;
	elseif string.find(message,"[Ss]chl[�u][se][ss][es][le].*")~=nil or string.find(message,"[Kk]ey")~=nil then
			if (Factionvalues.rankTown == leaderRank) then --if Character is leader in this town
				gText="Was f�r einen Schl�ssel ben�tigt ihr? Einen 'Kerkerschl�ssel' oder 'Hauptschl�ssel'? Und ben�tigt ihr diesen f�r diese Stadt oder eine Gilde?";
				eText="What kind of key do you need? A 'jail key' or a 'main key'? And do you need it for this town or a guild?";
			else
				gText="Was f�r einen Schl�ssel ben�tigt ihr? Einen 'Kerkerschl�ssel' oder 'Hauptschl�ssel'?";
				eText="What kind of key do you need? A 'jail key' or a 'main key'?";
			end
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;

	elseif string.find(message,"[Dd]ekret.+einl[�o][se][es][ne]")~=nil or string.find(message,"[Ee]xchange.+[Dd]ecree")~=nil or
		   string.find(message,"[Dd]ecree.+[Ee]xchange")~=nil then
		gText="Ihr habt ein Dekret f�r mich...lasst mich mal nachschauen.";
		eText="You have a decree with you...let me have a look at it.";
		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
		deleteDecree(originator);
		return true;
	end

	if (choiceIndex[originator.id]~=nil) then
		createChoice(originator,message,choiceIndex,Factionvalues);
		return true;
	end

	return false;
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Er tr�gt eine dunkle Robe mit einem aufgestickten Wappen Galmairs darauf.(Notar Galmairs)";
        output[1]="He wears a dark robe with an embroidered emblem of Galmair on it.(Notary of Galmair)";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
