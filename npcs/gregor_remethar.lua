-- INSERT INTO npc VALUES (nextval('npc_seq'),0,907,804,0,4,false,'Gregor Remethar','npc_gregor_remethar.lua',0);

require("npcs.base.autonpcfunctions")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 105;
    -- NPC by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - light the fire in the tomb
    -- 2: Quest 1 solved, reward: random, see below
    -- Debugging
    npcs.base.autonpcfunctions.AddTraderTrigger("set 0","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Debugging] Quest status set to 0");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","");
    npcs.base.autonpcfunctions.AddCondition("qpg",">",2);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Status error] Something went wrong, please inform a developer.");
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This is NPC is the mortician Gregor Remethar. Keyphrases: Hello, quest, mortician, tomb, value of life.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Leichenbestatter Gregor Remethar. Schlüsselwörter: Hallo, Quest, Leichenbestatter, Gruft, Wert des Lebens.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, one of the living visits me. What brought you here - do you want to honour your ancestors in the tomb?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ah, einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Ah, one of the living visits me. What brought you here - do you want to visit your ancestors in the tomb?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho",", einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Go with the gods' blessing. And don't return too soon, if you know what I mean.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Go with the gods' blessing. And don't return too soon, if you know what I mean.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","I bury those who fell. How do you I think I feel? Assessing one's life's value is not an easy task.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich beerdige diejenigen, die starben. Wie meint ihr wohl, fühle ich mich dabei? Den Wert eines Lebens zu schätzen ist fürwahr nicht einfach.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","I am called Gregor Remethar, nice to meet you and to be able to - still - talk to you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Mein Name ist Gregor Remethar, es freut mich, mit mich euch - noch -unterhalten zu können.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","You cannot bribe me. I do not accept any goods nor money. My judgement is neutral.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Man kann mich nicht bestechen. Ich nehme weder Waren noch Geld an. Mein Urteil ist unabhängig.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","We could talk about the tomb or my profession as mortician. I also have a task for you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Wir könnten über die Gruft oder meinen Beruf reden. Ich habe auch eine Aufgabe für euch.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("mortician","My job is to bury those who fell - and to assess the value of their life. Depending on that, their fate is sealed.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("undertaker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gravedigger");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("funeral");
    npcs.base.autonpcfunctions.AddTraderTrigger("Bestatter","Meine Aufgabe ist es, diejenigen zu begraben, deren Leben am Ende ist - und den Wert ihres Lebens einzuschätzen. Den der bestimmt, was mit ihnen geschieht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Totengräber");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Beerdigung");
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("tomb","The tomb of Runewick is a place where the people seperates; urns for the mages, coffins for the apprentices and darkness for the commoners.");
    npcs.base.autonpcfunctions.AddTraderTrigger("value","Depening on the value of one's life, there are three methods to get buried. I could tell you more on these methods...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("fame");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("fate");
    npcs.base.autonpcfunctions.AddTraderTrigger("assess","Who am I to judge over one's life you might say? I do not judge. One's fame usually arrives here long before one's body.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("earn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("judge");
    npcs.base.autonpcfunctions.AddTraderTrigger("method","Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("urn");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("bury","Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grave");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("coffin");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gruft","Die Gruft von Runewick ist ein Ort, an dem sich das Volk aufteilt; Urnen für die Magier, Särge für die Lehrlinge und die Dunkelheit für das gemeine Volk.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Grab");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wert","Je nachdem, wie hoch der Wert des Lebens war, gibt es drei Methoden, jemanden zu begraben. Ich könnte euch mehr über diese Methoden erzählen...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Ansehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Schicksal");
    npcs.base.autonpcfunctions.AddTraderTrigger("verdien","Was ich mir einbilde, den Wert eines Lebens einschätzen zu können? Das muss ich gar nicht; der Ruf eilten einer Leiche zumeist vorraus.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("schätz");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Urteil");
    npcs.base.autonpcfunctions.AddTraderTrigger("method","Diejenigen, die ihrem Leben den meisten Wert gegeben haben, werden eingeäschert, so dass ihre Leiche nicht geschändet werden kann. Die, die guter Dinge waren, werden in Särgen begraben - für weitere Verwendung. Die, die versagten, werden in die Dunkelheit geworfen...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grab");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("urne");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Sarg");
    -- Easter egg
    npcs.base.autonpcfunctions.AddTraderTrigger("Calaway","I am not the undertaker! I prefer the term mortician.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Calaway","Ich bin nicht der Totengräber! Ich ziehe die Bezeichnung Leichenbestatter vor.");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine",">The archmage is a good man. He knows exactly who's life is valuable for the society and who's isn't.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Der Erzmagier ist ein guter Mann. Er weiß genau, wessen Leben wertvoll für die Gemeinschaft ist; und wessen nicht.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","In Runewick, everyone is equal; you have equal chances, but if you don't achieve something, your life is wasted.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","In Runewick ist Jedermann gleich geboren. Wer nichts zustandebringt, dessen Leben ist allerdings verwirkt.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","I heard a rumour about the Don; that he makes people dissapear he does not like. No tombstone reminds on them...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich habe eine Gerücht über den Don gehört; er lässt Leute einfach so verschwinden, die ihm quer kommen. Kein Grabstein wird jemals an sie erinnern.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","In Galmair, your fame in afterlife depends a lot on the amount of money you have - or had. Big purse, big grave, small purse, no grave. Horrible!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","In Galmair hängt der Ruf eines Verstorbenen offensichtlich stark vom Reichtum ab. Großer Geldbeutel, großes Grab, kleiner Geldbeutel, kein Grab - wie schrecklich!");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","I overheard queen Rosaline wants to have a magnificient grave in the desert. Her royal builder Robertus is in charge; I wonder whether he'll finish the grave before she passes...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Ich habe gehört, dass Königin Rosaline ein glorreiches Grab in der Wüste haben möchte. Ihr königlicher Baumeister Robertus ist damit beauftragt. Ich frage mich nur, ob er damit fertig wird, bevor sie verstirbt...");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","I do respect the people of Cadomyr. Their habits are unlike ours; they assess the value of one's life upon birth, we do upon death. But does this make us so different?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Ich schätze das Volk von Cadomyr. Ihre Gebräuche sind etwas anders als unsere; der Wert eines Lebens wird bei ihnen bei der Geburt bestimmt, bei uns nach dem Tode. Aber macht uns das so verschieden?");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","They are burning the bodies of their deads in Albar. This is, as a matter of fact, an act of honour - for those will never be raised as undeads by foul craft.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Die Albarier verbrennen ihre Toten. Dies ist fürwahr eine Ehrerweisung, denn wer verbrannt ist, kann nicht durch dunkle Künste ins Leben zurückgerufen werden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","They have strange habits in Gynk. Word is they just sink their deads in the swamps. What a horrible custom!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Es gibt merkwürdige Sitten in Gynk. Man sagt, sie werfen ihre Toten einfach in den Sumpf. Was für ein grausamer Brauch!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","The archmage once told me that in Salkamar, only the good are buried in coffins while the evil face an undescribeable fate.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Einst sagte mir der Erzmagier, dass in Salkamar nur die Rechtschaffenden in Särgen begraben werden während die Niederträchtigen ein unbeschreibliches Schicksal erleiden.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Cherga","I do not love Cherga. But I honour her. Being the keeper of the afterlife, her deeds deserve our respect. Or would you like to do that job?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cherga","Ich liebe Cherga nicht, aber ich ehre sie. Ihre Taten als Hüterin des Jenseits verdienen unseren Respekt. Oder möchtet ihr ihren Job übernehmen?");
    -- Quest 1: Take lamp oil (390) and make sure that the light in the tomb is burning
    -- Give out quest 1
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Ein Licht am Ende des Tunnels");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("talk","end");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Ein Licht am Ende des Tunnels");
    -- Quest 1 taken but not solved, repeat the instructions
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    -- Quest 1 solved, reward: random, 2 rankpoints if Runewick. Remind the player that the quest can solved over and over again
    -- 20cp 30%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",30);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 20 copper coins. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",30);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 20 Kupfermünzen. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",30);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 20 copper coins.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",30);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("money","+",20);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 20 Kupfermünzen.");
    -- Item 1: More lampoil (390) 10%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a bottle of lamp oil. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Flasche Lampenöl. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a bottle of lamp oil.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Flasche Lampenöl.");
    -- Item 3: Wax (431) 10%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this piece of wax as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a piece of wax. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Wachs. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this this piece of wax as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a piece of wax.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Wachs.");
    -- Item 4: Candles (43) 10%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a candle. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Kerze. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a candle.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Kerze.");
    -- Item 5: Torch (391) 10%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a torch. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Fackel. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a torch.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Fackel.");
    -- Item 6: Cookies (453) 10%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a cookie. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Keks. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a cookie.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Keks.");
    -- Item 7: Parchment (2745) 10%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a parchment. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Pergament. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a parchment.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Pergament.");
    -- Item 8: Golden ring (235) 10%
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a golden ring. You advance in archmage Elvaine Morgan's favour.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("town","=","runewick");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Goldring. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npcs.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a golden ring.");
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npcs.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Goldring.");
    -- Debugging
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("inform","[Chance error] Something went wrong, please inform a developer.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","Really.");
    npcs.base.autonpcfunctions.AddAdditionalText("By Cherga, could you rephrase that?");
    npcs.base.autonpcfunctions.AddAdditionalText("Honour the dead.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Wirklich.");
    npcs.base.autonpcfunctions.AddAdditionalText("Bei Cherga, könntet ihr das anders ausdrücken?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ehret die Toten.");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","Shall I take your measurements for a coffin now or later?");
    npcs.base.autonpcfunctions.AddAdditionalText("I do not understand. Do I have to?");
    npcs.base.autonpcfunctions.AddAdditionalText("Pardon?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Soll ich eure Maße für einen Sarg jetzt aufnehmen oder später?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich verstehe nicht recht. Müßte ich etwa?");
    npcs.base.autonpcfunctions.AddAdditionalText("Pardon?");
    -- Cycletext: Add as many random messages as possible
    npcs.base.autonpcfunctions.AddCycleText("Wie soll jemand seine letzte Ruhe finden, wenn kein Licht brennt?","How can they rest when no light is burning?");
    npcs.base.autonpcfunctions.AddCycleText("Die Dunkelheit wartet... darauf, dass das Licht ausgeht.","Darkness awaits... that the light goes off.");
    npcs.base.autonpcfunctions.AddCycleText("Eine helle Kerze soll dir ein Leuchtfeuer sein.","A candle of light shall be your beacon in the night.");
    npcs.base.autonpcfunctions.AddCycleText("Drei Schicksale und ich bin der Schätzer; was wird wohl euer Schicksal sein?","Three fates and I have to choose; what may be your fate?");
    npcs.base.autonpcfunctions.AddCycleText("Es ist nicht die Zeit, Trübsal zu blasen.","No time to wallow in the mire.");
    npcs.base.autonpcfunctions.AddCycleText("Drei Pfade; welchen werdet ihr beschreiten?.","Three paths - which will you go?");
    npcs.base.autonpcfunctions.AddCycleText("#me rollt bedächtig ein Maßband aus.","#me rolls out a measuring tape.");
    npcs.base.autonpcfunctions.AddCycleText("Soll ich eure Maße jetzt oder später aufnehmen?","Shall I take your measures now or later?");
    npcs.base.autonpcfunctions.AddCycleText("Mein Geschäft ist sicher - gestorben wird immer!","My business is save - people always die.");
    npcs.base.autonpcfunctions.AddCycleText("#me keucht wiederholt auf.","#me coughes over and over again.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npcs.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end