-- INSERT INTO npc VALUES (nextval('npc_seq'),0,907,804,0,4,false,'Gregor Remethar','npc_gregor_remethar.lua',0);

require("npc.base.autonpcfunctions")
module("npc.gregor_remethar", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 105;
    -- NPC by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - light the fire in the tomb
    -- 2: Quest 1 solved, reward: random, see below
    -- Debugging
    npc.base.autonpcfunctions.AddTraderTrigger("set 0","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Debugging] Quest status set to 0");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","");
    npc.base.autonpcfunctions.AddCondition("qpg",">",2);
    npc.base.autonpcfunctions.AddConsequence("inform","[Status error] Something went wrong, please inform a developer.");
    -- Help
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This is NPC is the mortician Gregor Remethar. Keyphrases: Hello, quest, mortician, tomb, value of life.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Leichenbestatter Gregor Remethar. Schlüsselwörter: Hallo, Quest, Leichenbestatter, Gruft, Wert des Lebens.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, one of the living visits me. What brought you here - do you want to honour your ancestors in the tomb?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Ah, einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Ah, one of the living visits me. What brought you here - do you want to visit your ancestors in the tomb?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho",", einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Go with the gods' blessing. And don't return too soon, if you know what I mean.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Go with the gods' blessing. And don't return too soon, if you know what I mean.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","I bury those who fell. How do you I think I feel? Assessing one's life's value is not an easy task.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Ich beerdige diejenigen, die starben. Wie meint ihr wohl, fühle ich mich dabei? Den Wert eines Lebens zu schätzen ist fürwahr nicht einfach.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","I am called Gregor Remethar, nice to meet you and to be able to - still - talk to you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Mein Name ist Gregor Remethar, es freut mich, mit mich euch - noch -unterhalten zu können.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","You cannot bribe me. I do not accept any goods nor money. My judgement is neutral.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Man kann mich nicht bestechen. Ich nehme weder Waren noch Geld an. Mein Urteil ist unabhängig.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","We could talk about the tomb or my profession as mortician. I also have a task for you.");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Wir könnten über die Gruft oder meinen Beruf reden. Ich habe auch eine Aufgabe für euch.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("mortician","My job is to bury those who fell - and to assess the value of their life. Depending on that, their fate is sealed.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("undertaker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gravedigger");
    npc.base.autonpcfunctions.AddAdditionalTrigger("funeral");
    npc.base.autonpcfunctions.AddTraderTrigger("Bestatter","Meine Aufgabe ist es, diejenigen zu begraben, deren Leben am Ende ist - und den Wert ihres Lebens einzuschätzen. Den der bestimmt, was mit ihnen geschieht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Totengräber");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Beerdigung");
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("tomb","The tomb of Runewick is a place where the people seperates; urns for the mages, coffins for the apprentices and darkness for the commoners.");
    npc.base.autonpcfunctions.AddTraderTrigger("value","Depening on the value of one's life, there are three methods to get buried. I could tell you more on these methods...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("fame");
    npc.base.autonpcfunctions.AddAdditionalTrigger("fate");
    npc.base.autonpcfunctions.AddTraderTrigger("assess","Who am I to judge over one's life you might say? I do not judge. One's fame usually arrives here long before one's body.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("earn");
    npc.base.autonpcfunctions.AddAdditionalTrigger("judge");
    npc.base.autonpcfunctions.AddTraderTrigger("method","Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("urn");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("bury","Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grave");
    npc.base.autonpcfunctions.AddAdditionalTrigger("coffin");
    npc.base.autonpcfunctions.AddTraderTrigger("Gruft","Die Gruft von Runewick ist ein Ort, an dem sich das Volk aufteilt; Urnen für die Magier, Särge für die Lehrlinge und die Dunkelheit für das gemeine Volk.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Grab");
    npc.base.autonpcfunctions.AddTraderTrigger("Wert","Je nachdem, wie hoch der Wert des Lebens war, gibt es drei Methoden, jemanden zu begraben. Ich könnte euch mehr über diese Methoden erzählen...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Ansehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Schicksal");
    npc.base.autonpcfunctions.AddTraderTrigger("verdien","Was ich mir einbilde, den Wert eines Lebens einschätzen zu können? Das muss ich gar nicht; der Ruf eilten einer Leiche zumeist vorraus.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("schätz");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Urteil");
    npc.base.autonpcfunctions.AddTraderTrigger("method","Diejenigen, die ihrem Leben den meisten Wert gegeben haben, werden eingeäschert, so dass ihre Leiche nicht geschändet werden kann. Die, die guter Dinge waren, werden in Särgen begraben - für weitere Verwendung. Die, die versagten, werden in die Dunkelheit geworfen...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grab");
    npc.base.autonpcfunctions.AddAdditionalTrigger("urne");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sarg");
    -- Easter egg
    npc.base.autonpcfunctions.AddTraderTrigger("Calaway","I am not the undertaker! I prefer the term mortician.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Calaway","Ich bin nicht der Totengräber! Ich ziehe die Bezeichnung Leichenbestatter vor.");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine",">The archmage is a good man. He knows exactly who's life is valuable for the society and who's isn't.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Der Erzmagier ist ein guter Mann. Er weiß genau, wessen Leben wertvoll für die Gemeinschaft ist; und wessen nicht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","In Runewick, everyone is equal; you have equal chances, but if you don't achieve something, your life is wasted.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","In Runewick ist Jedermann gleich geboren. Wer nichts zustandebringt, dessen Leben ist allerdings verwirkt.");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","I heard a rumour about the Don; that he makes people dissapear he does not like. No tombstone reminds on them...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Ich habe eine Gerücht über den Don gehört; er lässt Leute einfach so verschwinden, die ihm quer kommen. Kein Grabstein wird jemals an sie erinnern.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","In Galmair, your fame in afterlife depends a lot on the amount of money you have - or had. Big purse, big grave, small purse, no grave. Horrible!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","In Galmair hängt der Ruf eines Verstorbenen offensichtlich stark vom Reichtum ab. Großer Geldbeutel, großes Grab, kleiner Geldbeutel, kein Grab - wie schrecklich!");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","I overheard queen Rosaline wants to have a magnificient grave in the desert. Her royal builder Robertus is in charge; I wonder whether he'll finish the grave before she passes...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Ich habe gehört, dass Königin Rosaline ein glorreiches Grab in der Wüste haben möchte. Ihr königlicher Baumeister Robertus ist damit beauftragt. Ich frage mich nur, ob er damit fertig wird, bevor sie verstirbt...");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","I do respect the people of Cadomyr. Their habits are unlike ours; they assess the value of one's life upon birth, we do upon death. But does this make us so different?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Ich schätze das Volk von Cadomyr. Ihre Gebräuche sind etwas anders als unsere; der Wert eines Lebens wird bei ihnen bei der Geburt bestimmt, bei uns nach dem Tode. Aber macht uns das so verschieden?");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","They are burning the bodies of their deads in Albar. This is, as a matter of fact, an act of honour - for those will never be raised as undeads by foul craft.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Die Albarier verbrennen ihre Toten. Dies ist fürwahr eine Ehrerweisung, denn wer verbrannt ist, kann nicht durch dunkle Künste ins Leben zurückgerufen werden.");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","They have strange habits in Gynk. Word is they just sink their deads in the swamps. What a horrible custom!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Es gibt merkwürdige Sitten in Gynk. Man sagt, sie werfen ihre Toten einfach in den Sumpf. Was für ein grausamer Brauch!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","The archmage once told me that in Salkamar, only the good are buried in coffins while the evil face an undescribeable fate.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Einst sagte mir der Erzmagier, dass in Salkamar nur die Rechtschaffenden in Särgen begraben werden während die Niederträchtigen ein unbeschreibliches Schicksal erleiden.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Cherga","I do not love Cherga. But I honour her. Being the keeper of the afterlife, her deeds deserve our respect. Or would you like to do that job?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Cherga","Ich liebe Cherga nicht, aber ich ehre sie. Ihre Taten als Hüterin des Jenseits verdienen unseren Respekt. Oder möchtet ihr ihren Job übernehmen?");
    -- Quest 1: Take lamp oil (390) and make sure that the light in the tomb is burning
    -- Give out quest 1
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Ein Licht am Ende des Tunnels");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("inform","[Neues Quest] Ein Licht am Ende des Tunnels");
    -- Quest 1 taken but not solved, repeat the instructions
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("task","Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    -- Quest 1 solved, reward: random, 2 rankpoints if Runewick. Remind the player that the quest can solved over and over again
    -- 20cp 30%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",30);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("money","+",20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 20 copper coins. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",30);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("money","+",20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 20 Kupfermünzen. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",30);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("money","+",20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded 20 copper coins.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",30);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("money","+",20);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst 20 Kupfermünzen.");
    -- Item 1: More lampoil (390) 10%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a bottle of lamp oil. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Flasche Lampenöl. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a bottle of lamp oil.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/70; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",390,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Flasche Lampenöl.");
    -- Item 3: Wax (431) 10%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this piece of wax as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a piece of wax. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Wachs. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this this piece of wax as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a piece of wax.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/60; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",431,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Wachs.");
    -- Item 4: Candles (43) 10%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a candle. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Kerze. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a candle.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/50; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",43,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Kerze.");
    -- Item 5: Torch (391) 10%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a torch. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Fackel. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a torch.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/40; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",391,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst eine Fackel.");
    -- Item 6: Cookies (453) 10%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a cookie. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Keks. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a cookie.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/30; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",453,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Keks.");
    -- Item 7: Parchment (2745) 10%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a parchment. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Pergament. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a parchment.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/20; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",2745,1,333,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst ein Pergament.");
    -- Item 8: Golden ring (235) 10%
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a golden ring. You advance in archmage Elvaine Morgan's favour.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("town","=","runewick");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Goldring. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    npc.base.autonpcfunctions.AddConsequence("rankpoints","runewick","+",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest solved] You are awarded a golden ring.");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    npc.base.autonpcfunctions.AddCondition("chance",function( a ) return 1000/10; end);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("item",235,1,577,0);
    npc.base.autonpcfunctions.AddConsequence("inform","[Quest gelöst] Du erhältst einen Goldring.");
    -- Debugging
    npc.base.autonpcfunctions.AddTraderTrigger(".+","");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("inform","[Chance error] Something went wrong, please inform a developer.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","Really.");
    npc.base.autonpcfunctions.AddAdditionalText("By Cherga, could you rephrase that?");
    npc.base.autonpcfunctions.AddAdditionalText("Honour the dead.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Wirklich.");
    npc.base.autonpcfunctions.AddAdditionalText("Bei Cherga, könntet ihr das anders ausdrücken?");
    npc.base.autonpcfunctions.AddAdditionalText("Ehret die Toten.");
    npc.base.autonpcfunctions.AddTraderTrigger("No","Shall I take your measurements for a coffin now or later?");
    npc.base.autonpcfunctions.AddAdditionalText("I do not understand. Do I have to?");
    npc.base.autonpcfunctions.AddAdditionalText("Pardon?");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Soll ich eure Maße für einen Sarg jetzt aufnehmen oder später?");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verstehe nicht recht. Müßte ich etwa?");
    npc.base.autonpcfunctions.AddAdditionalText("Pardon?");
    -- Cycletext: Add as many random messages as possible
    npc.base.autonpcfunctions.AddCycleText("Wie soll jemand seine letzte Ruhe finden, wenn kein Licht brennt?","How can they rest when no light is burning?");
    npc.base.autonpcfunctions.AddCycleText("Die Dunkelheit wartet... darauf, dass das Licht ausgeht.","Darkness awaits... that the light goes off.");
    npc.base.autonpcfunctions.AddCycleText("Eine helle Kerze soll dir ein Leuchtfeuer sein.","A candle of light shall be your beacon in the night.");
    npc.base.autonpcfunctions.AddCycleText("Drei Schicksale und ich bin der Schätzer; was wird wohl euer Schicksal sein?","Three fates and I have to choose; what may be your fate?");
    npc.base.autonpcfunctions.AddCycleText("Es ist nicht die Zeit, Trübsal zu blasen.","No time to wallow in the mire.");
    npc.base.autonpcfunctions.AddCycleText("Drei Pfade; welchen werdet ihr beschreiten?.","Three paths - which will you go?");
    npc.base.autonpcfunctions.AddCycleText("#me rollt bedächtig ein Maßband aus.","#me rolls out a measuring tape.");
    npc.base.autonpcfunctions.AddCycleText("Soll ich eure Maße jetzt oder später aufnehmen?","Shall I take your measures now or later?");
    npc.base.autonpcfunctions.AddCycleText("Mein Geschäft ist sicher - gestorben wird immer!","My business is save - people always die.");
    npc.base.autonpcfunctions.AddCycleText("#me keucht wiederholt auf.","#me coughes over and over again.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end