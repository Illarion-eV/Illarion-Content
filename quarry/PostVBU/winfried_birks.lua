--Name:        Magister Winfried Birks
--Race:        Male Human
--Town:        Free University of Varshikar (Library)
--Function:    Knowlege teacher
--Position:    x=261 y=-317 z=-3
--Facing:      East
--Create       1.1.2009 by Dronrul


require("npc.base.autonpcfunctions")
require("base.common")
module("npc.winfried_birks", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Ich würde es bevorzugen, wenn ihr mich nicht anfasst!");
    thisNPC:talkLanguage(Character.say, Player.english, "Ich would prefer, that you don't touch me!!");
	
end
                
function initializeNpc()
    if TraderFirst then
        return true;
    end
    npc.base.autonpcfunctions.InitTalkLists()

    QuestID=2111;
    -- Begrüßungen
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]elp","I can tell you something about the different runes and runeschools if you are interested.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reetings","Be greeted - take a seat next to me.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]eho","Be greeted - take a seat next to me.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ello","Hush! This is a library, not a tavern.");
    
	npc.base.autonpcfunctions.AddTraderTrigger("[Hh]elf","Ich kann euch einiges über die verschiedenen Runen und Runenschulen erzählen wenn ihr Interesse daran habt.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ilf","Ich kann euch einiges über die verschiedenen Runen und Runenschulen erzählen wenn ihr Interesse daran habt.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]rüß","Ich Grüße euch, setzt euch doch zu mir.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]eho","Ich Grüße euch, setzt euch doch zu mir.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]allo","Scht! Dies ist eine Bibliothek, keine Taverne.");


    -- Charakter verkauft nichts!
    npc.base.autonpcfunctions.AddTraderTrigger("[Bb]uy","The only thing i would buy is a mana energy stabilizer");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]nergy","Yes I would buy that. But i think, that you don't have one with you so I'll order one from Lor Angur");
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]eed","That's a very complex apparat, I'll explain you that one day. But I could tell you something about runelore if you're interested");
	npc.base.autonpcfunctions.AddTraderTrigger("[Rr]equir","That's a very complex apparat, I'll explain you that one day. But I could tell you something about runelore if you're interested");
	npc.base.autonpcfunctions.AddTraderTrigger("[Pp]rice","Let me think about it...I would say around 120 gold coins.");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ss]ell","I'm a teacher for rune lore not a trader.");
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Kk]auf","Das einzige was ich euch abkaufen würde, ist ein Manaenergiestabilisator.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]anaenergiestabilisator","Manaenergiestabilisator, ja das würde ich euch abkaufen. Ich denke das ihr keinen dabei habt also werde ich ihn irgendwann einmal aus Lor Angur bestellen.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Bb]enötigt","Da so ein Apparat höchst komplex ist, verzichten wir lieber auf eine Erklärung. Wenn ihr aber etwas über die Runenkunde  beigebracht haben wollt, stehe ich euch zur Verfügung.");  
    npc.base.autonpcfunctions.AddTraderTrigger("[Kk]ost","So ein Manaenergiestabilisator, lasst mich einmal nachdenken. Er würde 120 Goldmünzen kosten und das in einer nicht transportablen Größe.");
	npc.base.autonpcfunctions.AddTraderTrigger("[Tt]ransport","Nur das fünffache. Ich würde nun gerne weiter an meiner Ausarbeitung arbeiten oder soll ich euch noch etwas über die Runenkunde beibringen?");
	npc.base.autonpcfunctions.AddTraderTrigger("[Vv]erkauf","Ich bin ein Lehrmeister der Runenkunde und kein Händler.");

	

	
    -- Smaltalk
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]ein","Ich möchte euch bitten mich nicht so unformell anzusprechen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]ir","Ich möchte euch bitten mich nicht so unformell anzusprechen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]ich","Ich möchte euch bitten mich nicht so unformell anzusprechen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]ntschuld","Schon in Ordnung. Kann ich euch irgendwie weiterhelfen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[W]ho are you?","I am Windfried Birks and I am from Lor-Angur. Well, I am the Magister for runelore. I teach new students the meaning of the runes and the runeschools.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er seid ihr?","Ich bin Winfried Birks und stamme aus Lor Angur. Nun bin ich hier Spektabilität für Runenkunde. Ich lehre neuen Studenten die Bedeutung der Runen und der Runenschulen.");                               
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat's your name?","I am Windfried Birks and I am from Lor-Angur. Well, I am the Magister for runelore. I teach new students the meaning of the runes and the runeschools.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ie ist euer [Nn]ame?","Ich bin Winfried Birks und stamme aus Lor Angur. Nun bin ich hier Magister für Runenkunde. Ich lehre neuen Studenten die Bedeutung der Runen und der Runenschulen.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat are you doing","I am Windfried Birks and I am from Lor-Angur. Well, I am the Magister for runelore. I teach new students the meaning of the runes and the runeschools.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as macht?","Ich bin Winfried Birks und stamme aus Lor Angur. Nun bin ich hier Magister für Runenkunde. Ich lehre neuen Studenten die Bedeutung der Runen und der Runenschulen.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as tut ihr hier?","Ich bin Winfried Birks und stamme aus Lor Angur. Nun bin ich hier Magister für Runenkunde. Ich lehre neuen Studenten die Bedeutung der Runen und der Runenschulen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat is your profession","I am Windfried Birks and I am from Lor-Angur. Well, I am the Magister for runelore. I teach new students the meaning of the runes and the runeschools.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as ist [Aa]ufgabe?","Ich bin Winfried Birks und stamme aus Lor Angur. Nun bin ich hier Magister für Runenkunde. Ich lehre neuen Studenten die Bedeutung der Runen und der Runenschulen.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]here are you from","I am Windfried Birks and I am from Lor-Angur. Well, I am the Magister for runelore. I teach new students the meaning of the runes and the runeschools.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]oher kommt?","Ich bin Winfried Birks und stamme aus Lor Angur. Nun bin ich hier Magister für Runenkunde. Ich lehre neuen Studenten die Bedeutung der Runen und der Runenschulen.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ow are you","There is absolutely no reason for me to complain about. This place is way more peaceful than Lor-Angur.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ie geht","Es läge mir völlig fern zu klagen. Hier ist es viel ruhiger als in Lor Angur.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ow do you feel","There is absolutely no reason for me to complain about. This place is way more peaceful than Lor-Angur.");
	npc.base.autonpcfunctions.AddCondition("lang","english")
	npc.base.autonpcfunctions.AddTraderTrigger("[Bb]efinden","Es läge mir völlig fern zu klagen. Hier ist es viel ruhiger als in Lor Angur. ");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ll]or [Aa]ngur","Ja die Stadt der Magie Lor Angur. Eine prachtvolle Stadt ist das. Ich habe dort gelehrt bevor ich die Stelle hier angenommen habe.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Aa]ngenommen","Mich reizte es eine andere Lehranstallt kennen zu lernen. Außerdem habe ich hier mehr Zeit für meine Studien und werde genauso gut bezahlt.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Bb]ezahlt","Kost und Logis das ist meine Bezahlung. Wenn ihr keine Fragen über Runen oder die Runenkunde habt, würde ich mich nun gerne wieder diesem interessanten Buch widmen.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ss]tudien","Ich studiere die Runen. Wie man sie richtig ausspricht. Wie man sie optimal anwendet und noch vieles mehr. Ihr werdet noch merken was man alles beachten muß.");
	npc.base.autonpcfunctions.AddCondition("lang","german");
 	npc.base.autonpcfunctions.AddTraderTrigger("I am","It's a pleasure to meet you.");
	npc.base.autonpcfunctions.AddCondition("lang","english")
	npc.base.autonpcfunctions.AddTraderTrigger("I'm","It's a pleasure to meet you.");
	npc.base.autonpcfunctions.AddCondition("lang","english")
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]y name","It's a pleasure to meet you.");
    npc.base.autonpcfunctions.AddCondition("lang","english")
    npc.base.autonpcfunctions.AddTraderTrigger("Ich bin","Es freut mich euch kennenzulernen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]ein Name","Es freut mich euch kennenzulernen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]usarbeitung","Ich arbeite an einer Zusammenfassung der Bedeutung aller Runen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Pp]aper","I write on a elaboration about the meaning of all runes.");
    npc.base.autonpcfunctions.AddCondition("lang","english")
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]nteressant","Ja, das ist es in der Tat.");    
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]nteresting","Indeed.");
    npc.base.autonpcfunctions.AddCondition("lang","english")

    
	--  Beibringen
	npc.base.autonpcfunctions.AddTraderTrigger("[Tt]each","Of course, do you want to know something about the meaning of the runes or the runeschools?");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",1);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as beibringen","Aber selbstverständlich, wollt ihr etwas über die Bedeutung der Runen oder die Schulen der Runen Wissen? ");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",1);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	npc.base.autonpcfunctions.AddTraderTrigger("[Tt]ell","Of course, do you want to know something about the meaning of the runes or the runeschools?");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",1);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);	
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as erzählen","Aber selbstverständlich, wollt ich etwas über die Bedeutung der Runen oder die Schulen der Runen Wissen? ");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",1);	
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as lehren","Aber selbstverständlich, wollt ich etwas über die Bedeutung der Runen oder die Schulen der Runen Wissen? ");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",1);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]xplain","Of course, do you want to know something about the meaning of the runes or the runeschools?");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",1);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as erklären","Aber selbstverständlich, wollt ich etwas über die Bedeutung der Runen oder die Schulen der Runen Wissen? ");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("qpg","!=",1);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
  	-- Runenkunde
    npc.base.autonpcfunctions.AddTraderTrigger("HEPT","HEPT is the rune of ice and refreezing.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("HEPT","HEPT ist Rune des Eises und des Einfrierens.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("PEN","The elementrune of the spirit. It is used in the magic of healing.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("PEN","Die Elementarrune des Geistes. Sie findet bei Heilmagie Verwendung.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("MES","This rune is used for healing spells, too. It is often associated with a welfare, warm light. But the correct translation is 'light'.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("MES","Die Rune MES benutzt man auch für Heilsprüche, man bring sie oft mit Licht wohliger Wärme in Verbindung, die genaue Übersetzung heißt aber 'Licht'. ");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("ORL","ORL stands for Creation and is used for example to create food into your own stomach or to create earth walls.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("ORL","ORL steht für Erschaffung und wird Beispielsweise zum erschaffen von Nahrung im eigenen Magen oder zur Beschwörung von Erdwällen gebraucht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("CUN","The elementrune of the water is CUN.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("CUN","Die Elementarrune des Wassers ist CUN. ");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("SAV","SAV is the ancient word for protection. You can cast with it for example a circle of stones around yourself.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("SAV","SAV heißt Schut auf Antik. Mann kann damit zum Beispiel Steinkreise um sich zaubern.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("SOLH","The elementrune of the earth is SOLH.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("SOLH","Die Elemntarrune der Erde heißt SOLH.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("FHEN","FHEN is he opposite of FHAN and means 'to get' or 'to take'.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("FHEN","FHEN ist das Gegenteil von FHAN und heißt holen beziehungsweise nehmen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("KAH","A mage needs this rune to satiate. It means food.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("KAH","Diese Runen braucht ein Magier zum Sättigen, sie bedeutet Nahrung oder auch Essen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("LHOR","This rune creates illusions. You can translate it with 'illusion' or 'to cheat'");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("LHOR","Die Rune LHOR erschafft Trugbilder. Man kann sie mit Illusion oder täuschen übersetzen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("KEL","KEL means bird or movement. This rune is a part of many spells which deals with moving of something or someone. For example throwing a fireball or creating a portal.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("KEL","KEL bedeutet Vogel oder bewegen. Diese Rune kommt in vielen Sprüchen vor, bei denen den Etwas oder Jemand bewegt wird. Beispielsweise das Werfen eines Feuerballs oder die Erschaffung eines Portals.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("TAH","This rune stands for inverting or banning. Every spell, which destroys other kind of magic, contains TAH.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("TAH","Diese Rune steht für umkehren oder auch bannen. Alle Runensprüche, die eine andere Form von Magie zerstören, werden mit TAH gesprochen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("TAUR","This rune stands for being and creature. You need it to summon.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("TAUR","Für Wesen oder Kreatur steht diese Rune. Man benötigt sie für Beschwörungen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("URA","You can translate it with natural or alive. With its help you can summon wild animals, brute, insects or even oger.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("URA","Kann man mit natürlich, beziehungsweise lebendig übersetzen. Mit ihrer Hilfe lassen sich Wild, Vieh, Insekten aber auch Oger beschwören.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("IRA","IRA means unnatural, dead or undead. With this rune you can summon skeletons, ghosts or mummies.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("IRA","IRA bedeutet so viel wie unnatürlich, tot oder auch untot. Mit dieser Rune kann man Skelette, Geister und Mumien herbei rufen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("YEG","YEG is translated with poison. With the help of this rune you can cast for example poison clouds.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("YEG","Gift, die ist die übersetzung von YEG, mit Hilfe dieser Rune kann man unter anderem Giftwolken erschaffen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("JUS","JUS is the elementrune of the wind.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("JUS","JUS ist die Elementarrune des Windes.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("SIH","SIH stands for healing, for example if someone is venomed.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("SIH","SIH steht für Heilen, zum Beispiel von Gift.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("ANTH","ANTH describes a static, immobile object.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("ANTH","ANTH beschreibt ein statisches, unbewegliches Objekt.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("SUL","SUL is uses to cripple and means as much as 'to stand' or 'to hold'.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("SUL","SUL wird zum Lähmen verwendet und bedeutet soviel wie stehen oder auch festhalten.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("QWAN","To boost a spell you need QWAN. QWAN means something like 'big'.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("QWAN","Um Runensprüche zu verstärken braucht man QWAN. Übersetzt bedeutet QWAN soviel wie 'groß'.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("DUN","DUN is needed to extend spells. The translation is plane.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("DUN","Um Sprüche auszubreiten braucht man DUN, die Übersetzung lautet 'flächig'.");

    npc.base.autonpcfunctions.AddTraderTrigger("PHERC","PHERC is the baneful rune of the pain.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("PHERC","PHERC ist die unheilvolle Rune des Schmerzes.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("FHAN","FHAN is a rune of direction. It can be translated with 'to bring along' or to 'give'.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("FHAN","FHAN ist eine Richtungsrune und kann mit bringen oder geben übersetzt werden.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("LUK","With LUK you can summon aggressive creatures. The translation is 'evil'.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("LUK","Mit Hilfe von LUK kann man aggressive Kreaturen beschwören, ihre Übersetzung lautet 'Böses'.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("LEV","The meaning of LEV is unknown, but can be translated with 'to alter'.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("LEV","Die Bedeutung von LEV ist unklar, kann aber mit 'verändern' übersetzt werden.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("BHONA","This is the rune of teaching. It is needed to give a rune from one mage to another one. BHONA decorates a teacher.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("BHONA","Dies ist die Lehrrune, die benötigt wird, um eine Rune von einen Magier auf einen anderen zu übertragen. BHONA zeichnet einen Lehrer aus.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]lementrune","The elementrunes stands for the five elements. RA for fire, CUN for water, SOLH for earth, JUS for air, PEN for spirit.");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]lementarrune","Die Elementarrunen stehen für die fünf Elemente. RA für Feuer, CUN für Wasser, SOLH für Erde, JUS für Luft und PEN für den Geist.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

	
	--Runenschulen
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]chool.*","There are five kinds of schools of runes, which result from the observance that you, if you cast different kinds of spells, become better in similar spells, too. The runeschools are Commotio, Transfreto, Pervestigatio, Desicio and Transformo. About which one shall I tell you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ss]chule.*","Es gibt fünf Runenschulen die sich aus der Beobachtung ergeben, das man durch häufige Anwendung bestimmter Sprüche sich gleichzeitig in der Verwendung ähnlicher verbessert. Die Runenschulen heißen Commotio, Transfreto, Pervestigatio, Desicio und Transformo. Sagt mir von welcher ich euch mehr erzählen soll?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	
	
	--Runenaufzählung
	npc.base.autonpcfunctions.AddTraderTrigger("[Rr]une","There are 28 runes. Every rune has a name, the ancient word of its meaning. The names are KEL, RA, HEPT, TAH, PEN, LUK, MES, ORL, TAUR, URA, IRA, CUN, SAV, YEG, JUS, QWAN, SOLH, SIH, FHAN, LEV, FHEN, KAH, ANTH and DUN. About which rune do you want to learn more?");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddTraderTrigger("[Rr]une","Es gibt 28 Runen. Jede Rune hat einen Namen, das Antike Wort für ihre Bedeutung. Die Namen der Runen sind KEL, RA, HEPT, TAH, PEN, LUK, MES, ORL, TAUR, URA, IRA, CUN, SAV, YEG, JUS, QWAN, SOLH, SIH, FHAN, LEV, FHEN, KAH, ANTH und DUN. Über welche Rune möchtet ihr mehr erfahren?");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.AddTraderTrigger("[Cc]ommotio","Commotio means destruction and includes most of the attacking spells, for example the classic fireball. The ban-spells belong to Commotio, too. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Cc]ommotio","Commotio bedeutet Zerstörung und umfasst die meisten Angriffszauber, wie beispielsweise den klassischen Feuerball. Auch die Bannsprüche zählen zu Commotio. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]ransfreto","This school of runes means 'converse' and deals for example with the healing - the inverting of poison in a creature. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Tt]ransfreto","Diese Runenschule bedeutet 'Umkehrung' und beschäftigt sich zum Beispiel mit dem Heil dem Umkehren von Gift in einem Wesen. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Pp]ervestigatio","The best translation for Pervestigatio is 'Creating'. After the classical healing, the creation of flames and earth walls belong to it. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Pp]ervestigatio","Pervestigatio lässt sich am besten mit 'Erschaffung' übersetzen. Neben den klassischen Heilzaubern zählen hier vor allen das erschaffen von Flammen und Erdwällen dazu. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]esicio","In this case we talk about summoning. It includes spells which are used to summon creatures or you summon yourself to another place, like the teleportation of your own. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Dd]esicio","Bei Desicio sprechen wir von Herbeirufung. Sie umfasst Sprüche bei der man Kreaturen zu sich ruft oder aber sich selbst zu einem anderen Ort ruft, wie die Eigenteleportation. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[T]ransformo","All spells of paralysis belong to Transformo, but also spells which are used to move things to you or away from you. This school can be translated in general with movement. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[T]ransformo","Zu Transformo zählen vor allem Lähmungszauber, aber auch Sprüche bei denen man Dinge zu oder von sich bewegt. Die Schule kann ganz allgemein mit Bewegung übersetzt werden. Soll ich dir darüber mehr erzählen?");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	npc.base.autonpcfunctions.AddCondition("qpg","!=",3);
	npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
	
	------------------------------------------RUNESCHOOLS AFTER QUEST
    npc.base.autonpcfunctions.AddTraderTrigger("[Cc]ommotio","Commotio means destruction and includes most of the attacking spells, for example the classic fireball. The ban-spells belong to Commotio, too. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Cc]ommotio","Commotio bedeutet Zerstörung und umfasst die meisten Angriffszauber, wie beispielsweise den klassischen Feuerball. Auch die Bannsprüche zählen zu Commotio. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]ransfreto","This school of runes means 'converse' and deals for example with the healing - the inverting of poison in a creature. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Tt]ransfreto","Diese Runenschule bedeutet 'Umkehrung' und beschäftigt sich zum Beispiel mit dem Heil dem Umkehren von Gift in einem Wesen. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Pp]ervestigatio","The best translation for Pervestigatio is 'Creating'. After the classical healing, the creation of flames and earth walls belong to it. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Pp]ervestigatio","Pervestigatio lässt sich am besten mit 'Erschaffung' übersetzen. Neben den klassischen Heilzaubern zählen hier vor allen das erschaffen von Flammen und Erdwällen dazu. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]esicio","In this case we talk about summoning. It includes spells which are used to summon creatures or you summon yourself to another place, like the teleportation of your own. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);

	npc.base.autonpcfunctions.AddTraderTrigger("[Dd]esicio","Bei Desicio sprechen wir von Herbeirufung. Sie umfasst Sprüche bei der man Kreaturen zu sich ruft oder aber sich selbst zu einem anderen Ort ruft, wie die Eigenteleportation. Soll ich dir darüber mehr erzählen?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[T]ransformo","All spells of paralysis belong to Transformo, but also spells which are used to move things to you or away from you. This school can be translated in general with movement. Shall I teach you more?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[T]ransformo","Zu Transformo zählen vor allem Lähmungszauber, aber auch Sprüche bei denen man Dinge zu oder von sich bewegt. Die Schule kann ganz allgemein mit Bewegung übersetzt werden. Soll ich dir darüber mehr erzählen?");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddCondition("qpg","!=",2);


	npc.base.autonpcfunctions.AddTraderTrigger("RA","This is the elementrune of the fire.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("RA","RA ist die Rune des Feuers und eine Elementarrune. Sie kann für offensive Feuerzauber genutzt werden, sowie zum Entfachen und Auslöschen von Feuerflammen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	
     npc.base.autonpcfunctions.AddCycleText("hmmmmm?","hmmmmm?");
     npc.base.autonpcfunctions.AddCycleText("*räusper*?","*harrumph*");
	 npc.base.autonpcfunctions.AddCycleText("KEL RI? KEL RE? KEL RA? *knall* aua!*?","KEL RI? KEL RE? KEL RA? *bang* aua!");
     npc.base.autonpcfunctions.AddCycleText("#me murmelt \"SIM -SALA- BIM? Was ist das denn für eine alberne Runenfolge?\"","#me mumbles \"SIM -SALA - BIM? What  silly rune combination is that?\"");
     npc.base.autonpcfunctions.AddCycleText("#me blättert eine Seite weiter?","#me pages a side forward"); 
     npc.base.autonpcfunctions.AddCycleText("#me kritzelt etwas an den Rand des Buches.","#me scrawls something on the edge of the book");
	
    TradSpeakLang={0,1,10};
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
    
    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
    thisNPC.activeLanguage=TradStdLang;
    
    --thisNPC:warp(position(-10,0,0));
    --thisNPC:setAttrib("faceto",6);
    --thisNPC:setAttrib("racetyp",24);


end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
	Progress=originator:getQuestProgress(2111);			
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
        thisNPC.activeLanguage=originator.activeLanguage;
		
			if string.find(message,"[Bb]ring.+[Bb]ei.*")~=nil or string.find(message,"[Mm]ehr.*")~=nil or
			   string.find(message,"[Tt]each.*")~=nil or string.find(message,"[Mm]ore.*")~=nil then
					if Progress==1 then
                        gText="Über welche der fünf Schulen wollt ihr mehr erfahren?";
                        eText="Which school do you want to know more about?";
				        outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				        npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						originator:setQuestProgress(2111,2);
					elseif Progress==3 then
                        gText="Ich hab euch bereits etwas beigebracht, den Rest müsst ihr euch selber beibringen wenn ihr ein richtiger Magier werden wollt.";
                        eText="I taught you already something, you have to learn the rest by yourself if you want to become a real mage.";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						
					end
				return;
			end
			
			if Progress==2 then 
				gText="In Ordnung, hört mir nun bitte genau zu...";
                eText="Alright, please listen to me carefully now...";
				if string.find(message,"[Cc]ommotio")~=nil then
					TheSkill="commotio";
				elseif string.find(message,"[Tt]ransformo")~=nil then
					TheSkill="transformo";
				elseif string.find(message,"[Tt]ransfreto")~=nil then
					TheSkill="transfreto";
				elseif string.find(message,"[Pp]ervestigatio")~=nil then
					TheSkill="pervestigatio";
				elseif string.find(message,"[Dd]esicio")~=nil then
					TheSkill="desicio";
				else
					originator:setQuestProgress(2111,1);
					return;
				end
				
				if (originator:increaseSkill(3,TheSkill,0)<=10) then --teach school of rune				
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				    npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					base.common.InformNLS(originator,
					    "Es scheint als wären dir nun einige Grundlagen dieser Runenschule klarer.",
					    "It seems that you understand some basics of this school of rune now better.");										
					originator:increaseSkill(3,TheSkill,1);
					originator:setQuestProgress(2111,3);
				else
					gText="Ihr scheint die Grundlagen dieser Runenschule bereits zu kennen, mehr als das kann ich euch nicht beibringen.";
	                eText="You already seem to know the basics of this runeschool, I can't teach you more than that.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				    npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				end
				return;
			end
				npc.base.autonpcfunctions.TellSmallTalk(message,originator);

        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
