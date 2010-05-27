
--Npc:Frederik Silvereye
--Location: Galmair
--Task: Notary(sells decrees, buys decrees, sells keys, town membership bureau)

-- INSERT INTO npc VALUES (nextval('npc_seq'),0,404,263,201,4,false,'Frederik Silvereye','npc_frederik_silvereye.lua',0);

require("npcs.base.autonpcfunctions")
require("npcs.base.trader_functions");
module("npcs.frederik_silvereye")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Lasst mich in Ruhe!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
    currentNPC=counter;
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********
    npcs.base.autonpcfunctions.AddTraderTrigger("buy","I sell decrees and keys.");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell","Thanks, but I already have everything I need.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","Thanks, but I already have everything I need.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I sell decrees and keys.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Kk]aufen","Ick verkauf nur Dekrete und Schlüssel.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Vv]erkaufen","Danke nein, ich habe bereits alles, was ich brauche.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+kauf","Danke nein, ich habe bereits alles, was ich brauche.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ick verkauf nur Dekrete und Schlüssel.");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]ein.+[Nn]ame.+ist.*","Freut mich %CHARNAME, ich bin die "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ii]c[hk].+bin.*");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Man.+nennt.+mich.*");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ii]c[hk].+hei[sß][se].*");
	npcs.base.autonpcfunctions.AddCondition("lang","german");
	npcs.base.autonpcfunctions.AddConsequence("state","=",1);

	npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]y.+[Nn]ame.+is.*","A pleasure %CHARNAME, I am "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ii].+am.*");
	npcs.base.autonpcfunctions.AddCondition("lang","english");
	npcs.base.autonpcfunctions.AddConsequence("state","=",1);

    npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ötter.+euch");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Uu]ff.+[Bb]ald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ünf.+euch");
    npcs.base.autonpcfunctions.AddConsequence("inform","Der Händler lächelt dich an und winkt zum Abschied.");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ive.+you");
    npcs.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npcs.base.autonpcfunctions.AddConsequence("inform","The trader smiles at you and waves.");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]er [bs][ie][si][td] [di][uh].*","Ich bin die "..thisNPC.name..". Und wer bist du?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ww]ie.+[Nn]ame");

    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you","I am "..thisNPC.name.." and who are you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ww]hat.+[Nn]ame");

	npcs.base.autonpcfunctions.AddTraderTrigger("Where am [Ii]","You are in Cadomyr.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]o bin ich","Du bist in Cadomyr.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");

    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ow.+are.you","I am fine and how are you?.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]ie.+gehts","Eigentlich ganz gut, danke der Nachfrage.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Mir geht es gut und dir?");



    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Ich verkaufe Dekrete und Schlüssel, außerdem könnt ihr bei mir Dekrete einlösen und euch als Bürger eintragen lassen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helfen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npcs.base.autonpcfunctions.AddConsequence("inform","Stichwörter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einlösen\", \" Schlüssel\", \" Bürger werden\"");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]elp"," I sell decrees and keys, furthermore you can exchange decrees and get registered as citizen here.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");


	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]reeting","Be greeted %CHARNAME, nice to see you here again.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]i");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddAdditionalText("Greetings %CHARNAME, nice to see you again");
	npcs.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]reeting","Be greeted, I am "..thisNPC.name..", the notary of this town. You can buy here decrees or exchange them. Also I can register you as citizen or sell you a key.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]i");
    npcs.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");

    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]rü[sß]","Grüße %CHARNAME, schön euch mal wieder hier zu sehen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rue[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc].*");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddAdditionalText("Grüß dich %CHARNAME, schön euch mal wiederzusehen.");
	npcs.base.autonpcfunctions.AddConsequence("inform","Stichwörter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einlösen\", \" Schlüssel\", \" Bürger werden\"");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]rü[sß]","Zum Gruße, ich bin "..thisNPC.name..", die Notarin dieser Stadt, bei mir kannst du Dekrete kaufen und einlösen.Außerdem kannst du hier Schlüssel kaufen und dich als Bürger anmelden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rue[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc].*");
    npcs.base.autonpcfunctions.AddAdditionalText("Grüß dich!");
    npcs.base.autonpcfunctions.AddConsequence("inform","Stichwörter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einlösen\", \" Schlüssel\", \" Bürger werden\"");


    npcs.base.autonpcfunctions.AddTraderTrigger("","Habt ihr ein Dekret für mich oder wollt ihr vielleicht ein Dekret oder Schlüssel kaufen?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
	npcs.base.autonpcfunctions.AddConsequence("inform","Stichwörter auf die der NPC reagiert: \" Dekret kaufen\", \" Dekret einlösen\", \" Schlüssel\", \" Bürger werden\"");
    npcs.base.autonpcfunctions.AddTraderTrigger("","Do you have a decree for me or do you maybe want to buy a decree or a key?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("inform","Keywords on which the NPC reacts:\" Buy decree\", \" Exchange decree\", \" Key\", \" become citizen\".");

	if not InitDone then
    	choiceIndex={}; --value which stands for the decree/key the user wants


		townID = BF_setLocation(thisNPC); --look up where the npc is standing!
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
    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;


end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
	if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then  --Npc wird aus nächster Nähe angesprochen
        if npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
			if not mainTask(texttype,message,originator) then
				npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
			end

		else
        	npcs.base.autonpcfunctions.Confused(
            "#me sieht dich leicht verwirrt an",
            "#me looks at you a little confused"
            );
		end
	end
end


function mainTask(texttype,message,originator)
	Factionvalues = BF_get(originator);

	if 	(string.find(message,"[Dd]ekret.+kaufen.*")~=nil or string.find(message,"[Bb]uy.+decree.*")~=nil or
		 string.find(message,"[Dd]ekret.+erwerben.*")~=nil) then
			if (Factionvalues.rankTown == leaderRank) then --if Character is leader in this town
		 		gText="Was für ein Dekret benötigt ihr? Eines für die Eintragung als 'Anführer', 'vollständiges Mitglied' oder 'Anwärter' einer Gilde oder doch ein 'Entbannungsdekret'?";
				eText="What kind of decree do you need? For a entry as a 'leader', 'full member' or 'aspirant' of a guild or a 'unban decree'?";
			else
				gText="Was für ein Dekret benötigt ihr? Eines für die Eintragung als 'Anführer', 'vollständiges Mitglied' oder 'Anwärter' einer Gilde?";
				eText="What kind of decree do you need? For a entry as a 'leader', 'full member' or 'aspirant' of a guild?";
			end
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;

	elseif string.find(message,"[Aa]nführer.+[Ss]tadt")~=nil or string.find(message,"[Ll]eader.+ [Tt]own")~=nil or
		   string.find(message,"[Aa]nfuehrer.+[Ss]tadt")~=nil or string.find(message,"[Ll]eader.+ [Cc]ity")~=nil or
		   string.find(message,"[Hh]errscher.+[Ss]tadt")~=nil or string.find(message,"[Aa]nführer.+ [Oo]rt")~=nil then
		 	if (originator:isAdmin()) then --only GMs can become faction leaders
				gText="Gut, ich trage euch als neuen Anführer dieser Stadt ein.";
				eText="Good, I will enregister you as new leader of this town.";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				makeCharMemberOfTown(originator,Factionvalues,leaderRank);
			end
			return true;

	elseif (string.find(message,"[Bb]ürger.+werden")~=nil or string.find(message,"[Bb]ecome.+[Cc]itizen")~=nil or
		   string.find(message,"[Bb]uerger.+werden")~=nil or string.find(message,"[Bb]ecome.+[Mm]ember.+[Tt]own")~=nil or
		   string.find(message,"[Mm]itglied.+Stadt")~=nil) then
			if (Factionvalues[NpcLocation[thisNPC.id]+RANK_OFFSET] == outcastRank) then -- the char is outcasted from this town
			 	gText="Ihr seid aus der Stadt verbannt, kommt mit einem Entbannungsdekret des Anführers wieder wenn ihr Bürger werden wollt.";
				eText="You're outcasted from this town, come back with a unban decree from the leader if you want to become a citizen.";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				return true;
			end
			if ((TextRepeatCnt[originator.id]==nil) or (TextRepeatCnt[originator.id] == 0)) then
			 	gText="Diese Eintragung wird "..PriceListForTownChange[Factionvalues.towncnt].." Silberstücke kosten, wenn ihr nach eurem Beitritt zu einer anderen Stadt wechseln wollt verdoppeln sich die Kosten dafür. Seid ihr sicher dass ihr dieser Stadt beitreten wollt?";
				eText="Adding you to the citizenlist will cost "..PriceListForTownChange[Factionvalues.towncnt].." silver coins. If you decide to become a citizen of another town after joining the fee will double. Do you really wish to join this town?";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
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
	elseif string.find(message,"[Aa]nw[äa][re][tr][et][re]")~=nil or string.find(message,"[Aa]spirant")~=nil then

			choiceIndex[originator.id]=1; --aspirant of guild
			gText="Das Dekret für eine Anwärtereintragung wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nur noch bitte den Namen der Gilde.";
			eText="The decree for a aspirant entry will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
	elseif string.find(message,"[Mm]itglied")~=nil or string.find(message,"[Mm]ember")~=nil then
		 	choiceIndex[originator.id]=2; --member of guild
			gText="Das Dekret für eine Mitgliedseintragung wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nur noch bitte den Namen der Gilde.";
			eText="The decree for a member entry will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
	elseif string.find(message,"[Aa]nf[üu][he][rh][er][re]")~=nil or string.find(message,"[Ll]eader")~=nil then
			choiceIndex[originator.id]=3; --leader of guild
		 	gText="Das Dekret für eine Anführereintragung wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nur noch bitte den Namen der Gilde.";
			eText="The decree for a leader entry will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
	elseif string.find(message,"[Hh]auptschlüssel")~=nil or string.find(message,"[Mm]ain.+[Kk]ey")~=nil then
			if  (string.find(message,"[Ss]tadt")~=nil or string.find(message,"[Tt]own")~=nil) and (Factionvalues.rankTown == leaderRank) then
				if (TownMainKey[NpcLocation[thisNPC.id]]==nil) then
		            gText="Für diese Stadt existiert kein Hauptschlüssel!";
					eText="There does no main key exist for this town!";
					outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
					npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				else
		            gText="Bitte sehr, euer Hauptschlüssel.";
					eText="Here is your main key.";
					outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
					npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					originator:createItem(TownMainKey[NpcLocation[thisNPC.id]][1],1,TownMainKey[NpcLocation[thisNPC.id]][2],TownMainKey[NpcLocation[thisNPC.id]][3]); --creates Key
				end
				return true;
			end
			choiceIndex[originator.id] = 4; -- main key
			gText="Der Hauptschlüssel wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nun noch den Namen der Gilde bitte.";
			eText="The main key will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);

			return true;
	elseif string.find(message,"[Kk]erkerschlüssel")~=nil or string.find(message,"[Jj]ail.+[Kk]ey")~=nil then
			if  (string.find(message,"[Ss]tadt")~=nil or string.find(message,"[Tt]own")~=nil) and (Factionvalues.rankTown == leaderRank) then
				if (TownJailKey[NpcLocation[thisNPC.id]]==nil) then
		            gText="Für diese Stadt existiert kein Kerkerschlüssel!";
					eText="There does no jail key exist for this town!";
					outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
					npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				else
		            gText="Bitte sehr, euer Kerkerschlüssel.";
					eText="Here is your jail key.";
					outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
					npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					originator:createItem(TownJailKey[NpcLocation[thisNPC.id]][1],1,TownJailKey[NpcLocation[thisNPC.id]][2],TownJailKey[NpcLocation[thisNPC.id]][3]); --creates Key
				end
				return true;
			end
			choiceIndex[originator.id] = 5; -- jail key
			gText="Der Kerkerschlüssel wird "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." Silber kosten, nennt mir nun noch den Namen der Gilde bitte.";
			eText="The jail key will cost "..PriceListForDecreeAndKey[choiceIndex[originator.id]].." silver coins, now please tell me the name of the guild.";
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);

			return true;
	elseif string.find(message,"[Ee]ntbannungsdekret")~=nil or string.find(message,"[Uu]nban.+[Dd]ecree")~=nil then
			if (Factionvalues.rankTown == leaderRank) then --if Character is leader in this town
				choiceIndex[originator.id]=6;
				gText="Ein Entbannungsdekret, kommt sofort.";
				eText="A unban decree, right away.";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				createChoice(originator,message,choiceIndex,Factionvalues);
			else
				gText="Nur der Anführer dieser Stadt kann ein Entbannungsdekret erwerben!";
				eText="Only the leader of the town can buy a unban decree!";
				outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
				npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			end
			return true;
	elseif string.find(message,"[Ss]chl[üu][se][ss][es][le].*")~=nil or string.find(message,"[Kk]ey")~=nil then
			if (Factionvalues.rankTown == leaderRank) then --if Character is leader in this town
				gText="Was für einen Schlüssel benötigt ihr? Einen 'Kerkerschlüssel' oder 'Hauptschlüssel'? Und benötigt ihr diesen für diese Stadt oder eine Gilde?";
				eText="What kind of key do you need? A 'jail key' or a 'main key'? And do you need it for this town or a guild?";
			else
				gText="Was für einen Schlüssel benötigt ihr? Einen 'Kerkerschlüssel' oder 'Hauptschlüssel'?";
				eText="What kind of key do you need? A 'jail key' or a 'main key'?";
			end
			outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
			npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;

	elseif string.find(message,"[Dd]ekret.+einl[öo][se][es][ne]")~=nil or string.find(message,"[Ee]xchange.+[Dd]ecree")~=nil or
		   string.find(message,"[Dd]ecree.+[Ee]xchange")~=nil then
		gText="Ihr habt ein Dekret für mich...lasst mich mal nachschauen.";
		eText="You have a decree with you...let me have a look at it.";
		outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText);
		npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
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
        output[0]="Er trägt eine dunkle Robe mit einem aufgestickten Wappen Galmairs darauf.(Notar Galmairs)";
        output[1]="He wears a dark robe with an embroidered emblem of Galmair on it.(Notary of Galmair)";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end