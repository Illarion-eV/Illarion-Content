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

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 105;
    -- NPC by Estralis Seborian
    -- Queststatus Overview
    -- 0: No Quest taken
    -- 1: Quest 1 taken - light the fire in the tomb
    -- 2: Quest 1 solved, reward: random, see below
    -- Debugging
    AddTraderTrigger("set 0","");
    AddConsequence("inform","[Debugging] Quest status set to 0");
    AddConsequence("qpg","=",0);
    AddTraderTrigger(".+","");
    AddCondition("qpg",">",2);
    AddConsequence("inform","[Status error] Something went wrong, please inform a developer.");
    -- Help
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This is NPC is the mortician Gregor Remethar. Keyphrases: Hello, quest, mortician, tomb, value of life.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Leichenbestatter Gregor Remethar. Schlüsselwörter: Hallo, Quest, Leichenbestatter, Gruft, Wert des Lebens.");
    -- General speech
    AddTraderTrigger("Hello","Ah, one of the living visits me. What brought you here - do you want to honour your ancestors in the tomb?");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddTraderTrigger("Grüße","Ah, einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddTraderTrigger("Hiho","Ah, one of the living visits me. What brought you here - do you want to visit your ancestors in the tomb?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddTraderTrigger("Hiho",", einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddTraderTrigger("Farewell","Go with the gods' blessing. And don't return too soon, if you know what I mean.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddTraderTrigger("Tschüß","Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddTraderTrigger("Ciao","Go with the gods' blessing. And don't return too soon, if you know what I mean.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddTraderTrigger("Ciao","Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddTraderTrigger("How are you","I bury those who fell. How do you I think I feel? Assessing one's life's value is not an easy task.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddTraderTrigger("Wie geht","Ich beerdige diejenigen, die starben. Wie meint ihr wohl, fühle ich mich dabei? Den Wert eines Lebens zu schätzen ist fürwahr nicht einfach.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddTraderTrigger("your name","I am called Gregor Remethar, nice to meet you and to be able to - still - talk to you.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddTraderTrigger("dein name","Mein Name ist Gregor Remethar, es freut mich, mit mich euch - noch -unterhalten zu können.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    -- Catching typical NPC phrases
    AddTraderTrigger("what sell","You cannot bribe me. I do not accept any goods nor money. My judgement is neutral.");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Man kann mich nicht bestechen. Ich nehme weder Waren noch Geld an. Mein Urteil ist unabhängig.");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","We could talk about the tomb or my profession as mortician. I also have a task for you.");
    AddTraderTrigger("erzähl was","Wir könnten über die Gruft oder meinen Beruf reden. Ich habe auch eine Aufgabe für euch.");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    AddTraderTrigger("mortician","My job is to bury those who fell - and to assess the value of their life. Depending on that, their fate is sealed.");
    AddAdditionalTrigger("undertaker");
    AddAdditionalTrigger("gravedigger");
    AddAdditionalTrigger("funeral");
    AddTraderTrigger("Bestatter","Meine Aufgabe ist es, diejenigen zu begraben, deren Leben am Ende ist - und den Wert ihres Lebens einzuschätzen. Den der bestimmt, was mit ihnen geschieht.");
    AddAdditionalTrigger("Totengräber");
    AddAdditionalTrigger("Beerdigung");
    AddTraderTrigger("profession","I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
    AddTraderTrigger("beruf","Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
    AddTraderTrigger("job","I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
    AddCondition("lang","english");
    AddTraderTrigger("job","Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
    -- More small talk; add at least five triggers
    AddTraderTrigger("tomb","The tomb of Runewick is a place where the people seperates; urns for the mages, coffins for the apprentices and darkness for the commoners.");
    AddTraderTrigger("value","Depening on the value of one's life, there are three methods to get buried. I could tell you more on these methods...");
    AddAdditionalTrigger("fame");
    AddAdditionalTrigger("fate");
    AddTraderTrigger("assess","Who am I to judge over one's life you might say? I do not judge. One's fame usually arrives here long before one's body.");
    AddAdditionalTrigger("earn");
    AddAdditionalTrigger("judge");
    AddTraderTrigger("method","Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
    AddAdditionalTrigger("urn");
    AddCondition("lang","english");
    AddTraderTrigger("bury","Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
    AddAdditionalTrigger("grave");
    AddAdditionalTrigger("coffin");
    AddTraderTrigger("Gruft","Die Gruft von Runewick ist ein Ort, an dem sich das Volk aufteilt; Urnen für die Magier, Särge für die Lehrlinge und die Dunkelheit für das gemeine Volk.");
    AddAdditionalTrigger("Grab");
    AddTraderTrigger("Wert","Je nachdem, wie hoch der Wert des Lebens war, gibt es drei Methoden, jemanden zu begraben. Ich könnte euch mehr über diese Methoden erzählen...");
    AddAdditionalTrigger("Ansehen");
    AddAdditionalTrigger("Schicksal");
    AddTraderTrigger("verdien","Was ich mir einbilde, den Wert eines Lebens einschätzen zu können? Das muss ich gar nicht; der Ruf eilten einer Leiche zumeist vorraus.");
    AddAdditionalTrigger("schätz");
    AddAdditionalTrigger("Urteil");
    AddTraderTrigger("method","Diejenigen, die ihrem Leben den meisten Wert gegeben haben, werden eingeäschert, so dass ihre Leiche nicht geschändet werden kann. Die, die guter Dinge waren, werden in Särgen begraben - für weitere Verwendung. Die, die versagten, werden in die Dunkelheit geworfen...");
    AddAdditionalTrigger("grab");
    AddAdditionalTrigger("urne");
    AddAdditionalTrigger("Sarg");
    -- Easter egg
    AddTraderTrigger("Calaway","I am not the undertaker! I prefer the term mortician.");
    AddCondition("lang","english");
    AddTraderTrigger("Calaway","Ich bin nicht der Totengräber! Ich ziehe die Bezeichnung Leichenbestatter vor.");
    -- Faction stuff
    AddTraderTrigger("Elvaine",">The archmage is a good man. He knows exactly who's life is valuable for the society and who's isn't.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddTraderTrigger("Elvaine","Der Erzmagier ist ein guter Mann. Er weiß genau, wessen Leben wertvoll für die Gemeinschaft ist; und wessen nicht.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddTraderTrigger("Runewick","In Runewick, everyone is equal; you have equal chances, but if you don't achieve something, your life is wasted.");
    AddCondition("lang","english");
    AddTraderTrigger("Runewick","In Runewick ist Jedermann gleich geboren. Wer nichts zustandebringt, dessen Leben ist allerdings verwirkt.");
    AddTraderTrigger("Valerio","I heard a rumour about the Don; that he makes people dissapear he does not like. No tombstone reminds on them...");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio","Ich habe eine Gerücht über den Don gehört; er lässt Leute einfach so verschwinden, die ihm quer kommen. Kein Grabstein wird jemals an sie erinnern.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddTraderTrigger("Galmair","In Galmair, your fame in afterlife depends a lot on the amount of money you have - or had. Big purse, big grave, small purse, no grave. Horrible!");
    AddCondition("lang","english");
    AddTraderTrigger("Galmair","In Galmair hängt der Ruf eines Verstorbenen offensichtlich stark vom Reichtum ab. Großer Geldbeutel, großes Grab, kleiner Geldbeutel, kein Grab - wie schrecklich!");
    AddTraderTrigger("rosaline","I overheard queen Rosaline wants to have a magnificient grave in the desert. Her royal builder Robertus is in charge; I wonder whether he'll finish the grave before she passes...");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddTraderTrigger("rosaline","Ich habe gehört, dass Königin Rosaline ein glorreiches Grab in der Wüste haben möchte. Ihr königlicher Baumeister Robertus ist damit beauftragt. Ich frage mich nur, ob er damit fertig wird, bevor sie verstirbt...");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddTraderTrigger("Cadomyr","I do respect the people of Cadomyr. Their habits are unlike ours; they assess the value of one's life upon birth, we do upon death. But does this make us so different?");
    AddCondition("lang","english");
    AddTraderTrigger("Cadomyr","Ich schätze das Volk von Cadomyr. Ihre Gebräuche sind etwas anders als unsere; der Wert eines Lebens wird bei ihnen bei der Geburt bestimmt, bei uns nach dem Tode. Aber macht uns das so verschieden?");
    -- Main land factions
    AddTraderTrigger("albar","They are burning the bodies of their deads in Albar. This is, as a matter of fact, an act of honour - for those will never be raised as undeads by foul craft.");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Die Albarier verbrennen ihre Toten. Dies ist fürwahr eine Ehrerweisung, denn wer verbrannt ist, kann nicht durch dunkle Künste ins Leben zurückgerufen werden.");
    AddTraderTrigger("gynk","They have strange habits in Gynk. Word is they just sink their deads in the swamps. What a horrible custom!");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Es gibt merkwürdige Sitten in Gynk. Man sagt, sie werfen ihre Toten einfach in den Sumpf. Was für ein grausamer Brauch!");
    AddAdditionalTrigger("gynk");
    AddTraderTrigger("salkama","The archmage once told me that in Salkamar, only the good are buried in coffins while the evil face an undescribeable fate.");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Einst sagte mir der Erzmagier, dass in Salkamar nur die Rechtschaffenden in Särgen begraben werden während die Niederträchtigen ein unbeschreibliches Schicksal erleiden.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god
    AddTraderTrigger("Cherga","I do not love Cherga. But I honour her. Being the keeper of the afterlife, her deeds deserve our respect. Or would you like to do that job?");
    AddCondition("lang","english");
    AddTraderTrigger("Cherga","Ich liebe Cherga nicht, aber ich ehre sie. Ihre Taten als Hüterin des Jenseits verdienen unseren Respekt. Oder möchtet ihr ihren Job übernehmen?");
    -- Quest 1: Take lamp oil (390) and make sure that the light in the tomb is burning
    -- Give out quest 1
    AddTraderTrigger("quest","Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("item",390,1,333,0);
    AddConsequence("qpg","=",1);
    AddConsequence("talk","end");
    AddTraderTrigger("quest","In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",0);
    AddConsequence("item",390,1,333,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Ein Licht am Ende des Tunnels");
    AddTraderTrigger("task","Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",0);
    AddConsequence("item",390,1,333,0);
    AddConsequence("qpg","=",1);
    AddConsequence("talk","end");
    AddTraderTrigger("Auftrag","In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",0);
    AddConsequence("item",390,1,333,0);
    AddConsequence("qpg","=",1);
    AddConsequence("inform","[Neues Quest] Ein Licht am Ende des Tunnels");
    -- Quest 1 taken but not solved, repeat the instructions
    AddTraderTrigger("quest","Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddTraderTrigger("quest","Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
    AddAdditionalTrigger("mission");
    AddCondition("qpg","=",1);
    AddTraderTrigger("task","Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
    AddAdditionalTrigger("adventure");
    AddCondition("qpg","=",1);
    AddTraderTrigger("Auftrag","Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    AddCondition("qpg","=",1);
    -- Quest 1 solved, reward: random, 2 rankpoints if Runewick. Remind the player that the quest can solved over and over again
    -- 20cp 30%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",30);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("money","+",20);
    AddConsequence("inform","[Quest solved] You are awarded 20 copper coins. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",30);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("money","+",20);
    AddConsequence("inform","[Quest gelöst] Du erhältst 20 Kupfermünzen. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",30);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("money","+",20);
    AddConsequence("inform","[Quest solved] You are awarded 20 copper coins.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",30);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("money","+",20);
    AddConsequence("inform","[Quest gelöst] Du erhältst 20 Kupfermünzen.");
    -- Item 1: More lampoil (390) 10%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/70; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",390,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a bottle of lamp oil. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/70; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("item",390,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Flasche Lampenöl. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/70; end);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",390,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a bottle of lamp oil.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/70; end);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("item",390,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Flasche Lampenöl.");
    -- Item 3: Wax (431) 10%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this piece of wax as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/60; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",431,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a piece of wax. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/60; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("item",431,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Wachs. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this this piece of wax as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/60; end);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",431,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a piece of wax.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/60; end);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("item",431,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Stück Wachs.");
    -- Item 4: Candles (43) 10%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/50; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",43,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a candle. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/50; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("item",43,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Kerze. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/50; end);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",43,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a candle.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/50; end);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("item",43,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Kerze.");
    -- Item 5: Torch (391) 10%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/40; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a torch. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/40; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Fackel. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/40; end);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a torch.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/40; end);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("item",391,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst eine Fackel.");
    -- Item 6: Cookies (453) 10%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/30; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",453,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a cookie. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/30; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("item",453,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen Keks. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/30; end);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",453,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a cookie.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/30; end);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("item",453,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen Keks.");
    -- Item 7: Parchment (2745) 10%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/20; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",2745,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a parchment. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/20; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("item",2745,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Pergament. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/20; end);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",2745,1,333,0);
    AddConsequence("inform","[Quest solved] You are awarded a parchment.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/20; end);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("item",2745,1,333,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst ein Pergament.");
    -- Item 8: Golden ring (235) 10%
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/10; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",235,1,577,0);
    AddConsequence("inform","[Quest solved] You are awarded a golden ring. You advance in archmage Elvaine Morgan's favour.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/10; end);
    AddCondition("qpg","=",2);
    AddCondition("town","=","runewick");
    AddConsequence("qpg","=",1);
    AddConsequence("item",235,1,577,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen Goldring. Dein Ansehen bei Erzmagier Elvaine Morgan steigt.");
    AddConsequence("rankpoints","runewick","+",2);
    AddTraderTrigger(".+","Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
    AddCondition("chance",function( a ) return 1000/10; end);
    AddCondition("qpg","=",2);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddConsequence("item",235,1,577,0);
    AddConsequence("inform","[Quest solved] You are awarded a golden ring.");
    AddTraderTrigger(".+","Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
    AddCondition("chance",function( a ) return 1000/10; end);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",1);
    AddConsequence("item",235,1,577,0);
    AddConsequence("inform","[Quest gelöst] Du erhältst einen Goldring.");
    -- Debugging
    AddTraderTrigger(".+","");
    AddCondition("qpg","=",2);
    AddConsequence("inform","[Chance error] Something went wrong, please inform a developer.");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here.
    AddTraderTrigger("Yes","Really.");
    AddAdditionalText("By Cherga, could you rephrase that?");
    AddAdditionalText("Honour the dead.");
    AddTraderTrigger("Ja","Wirklich.");
    AddAdditionalText("Bei Cherga, könntet ihr das anders ausdrücken?");
    AddAdditionalText("Ehret die Toten.");
    AddTraderTrigger("No","Shall I take your measurements for a coffin now or later?");
    AddAdditionalText("I do not understand. Do I have to?");
    AddAdditionalText("Pardon?");
    AddTraderTrigger("Nein","Soll ich eure Maße für einen Sarg jetzt aufnehmen oder später?");
    AddAdditionalText("Ich verstehe nicht recht. Müßte ich etwa?");
    AddAdditionalText("Pardon?");
    -- Cycletext: Add as many random messages as possible
    AddCycleText("Wie soll jemand seine letzte Ruhe finden, wenn kein Licht brennt?","How can they rest when no light is burning?");
    AddCycleText("Die Dunkelheit wartet... darauf, dass das Licht ausgeht.","Darkness awaits... that the light goes off.");
    AddCycleText("Eine helle Kerze soll dir ein Leuchtfeuer sein.","A candle of light shall be your beacon in the night.");
    AddCycleText("Drei Schicksale und ich bin der Schätzer; was wird wohl euer Schicksal sein?","Three fates and I have to choose; what may be your fate?");
    AddCycleText("Es ist nicht die Zeit, Trübsal zu blasen.","No time to wallow in the mire.");
    AddCycleText("Drei Pfade; welchen werdet ihr beschreiten?.","Three paths - which will you go?");
    AddCycleText("#me rollt bedächtig ein Maßband aus.","#me rolls out a measuring tape.");
    AddCycleText("Soll ich eure Maße jetzt oder später aufnehmen?","Shall I take your measures now or later?");
    AddCycleText("Mein Geschäft ist sicher - gestorben wird immer!","My business is save - people always die.");
    AddCycleText("#me keucht wiederholt auf.","#me coughes over and over again.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if LangOK(originator,TradSpeakLang) then
            TellSmallTalk(message,originator);
        else
            Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end