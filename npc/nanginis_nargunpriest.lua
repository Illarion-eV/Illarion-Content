-- INSERT INTO npc VALUES (nextval('npc_seq'),0,500,500,200,2,false,'Nanginis the Nargunpriest','npc_nanginis_nargunpriest.lua',0);

require("npc.base.autonpcfunctions")
require("base.common")
module("npc.nanginis_nargunpriest")

function RandomStart(thisNPC)
						              --cadomyr,                                                 (runewick),                     galmair and so on
local PossiblePositions = { position(123,567,0),position(94,573,0),position(127,598,0), position(371,257,0) , position(407,350,0), position(396,304,0) };
local rand=math.random(table.getn(PossiblePositions));

	thisNPC:warp(PossiblePositions[rand]);
	thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Nargun sei gepriesen, da bin ich!");
	thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Praise Nargun, here I am!");

end


function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- Der NPC verwendet 3 Queststatus:
    -- Kein Queststatus: Char ist unbekannt
    -- Queststatus 1: Char ist bekannt, weiß aber noch nichts über die Segnungen
    -- Queststatus 2: Char bekannt, weiß über die Segnungen bescheid
    -- Queststatus 3: Char muss sich entscheiden, Annahme löst Queststatus 4 aus, Ablehnung führt zurück zu 2
	
	
	npc.base.autonpcfunctions.SetRadius(15);
    QuestID = 63;

	--SMALLTALK
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]rüß","%CHARNAME! Ich habe einen Flo gefangen! Wollt ihr ihn sehen, er ist ganz zahm, hihihi. Nein? Wollt ihr nun doch den Segen empfangen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[chg]");
    npc.base.autonpcfunctions.AddCondition("qpg",">",1);
    npc.base.autonpcfunctions.AddConsequence("talk","begin");

	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]rüß","Huaaah! Einen glorreichen Tag wünsche ich dir. Und viel Fisch!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[chg]");
    npc.base.autonpcfunctions.AddConsequence("talk","begin");
	npc.base.autonpcfunctions.AddConsequence("inform","Vielleicht solltest du ihn genauer nach dem Fisch fragen oder zumindest in Erfahrung bringen wie er heißt.");
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Ff]isch","Oh ja! Mein 'Herr' liebt Fisch! Und 'Schneestürme'!");
    npc.base.autonpcfunctions.AddAdditionalText("Fisch ist die Antwort, alles 'Chaos' leitet sich aus dem Fisch ab!");
    npc.base.autonpcfunctions.AddConsequence("inform","Du fragst dich was er wohl damit meint.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]chneest[uü]rm.*","Nichts erfreut meinen Herren 'Nargun' mehr als etwas unvorhersehbare unbändige Zerstörung, nicht wahr? Hihihi.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Cc]haos");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]err","Gepriesen sei mein Herr 'Nargun'! Oder auch nicht, oder anders, oder überhaupt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ott");
    --npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Pp]riester","In der Tat! Ich bin ein Priester meines Gottes, für eine kleine Spende lass ich dich an seinem 'Segen' teilhaben, wie siehts aus?");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er bist","Nanginis! Nennt mich einfach Nanginis! 'Nargun' hat mir diesen Namen in einer Vision geschickt, aber unter uns, eigentlich heiße ich Peter. Hihihi.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]er seid");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]ie hei[ßs]t");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]ie [Nn]ame");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]ision","Ja! Es hat nur 10 Krüge Zwergenbräu gebraucht um 'Nargun' gnädig zu stimmen mit mir zu sprechen. Der bittere Geschmack liegt mir noch immer auf der Zunge!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as mach","Hört die Unke rufen, sie berufen euch und machen auch viel! Hihi nein, berufen bin ich die Worte Narguns zu verkünden und seinen Segen zu verbreiten.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]eruf");
	
	
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Jj]a","Für eine Spende von 5 Silberstücken hast du die Chance auf etwas Besonderes! Also, hast du Interesse?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]rzähl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]egnung");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Jj]a","Aber wir kennen uns doch garnicht! Sag mir zuerst deinen Namen und deine Lieblingsfarbe.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]rzähl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]egnung");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]icher");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Kk]lar");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]ame ist","Sehr schön, sehr schön! Nargun sei neben dir %CHARNAME. Du dachtest doch nicht wirklich dass die Farbe mich interessiert. Aber zurück zum Segen, noch interessiert?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]eiße");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii]ch bin");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]argun","Ahh! Gelobt sei sein Name, wir verstehn uns, er und ich. Bringt das 'Priester' sein so mit sich.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf bald","Pah! Wie langweilig, weiß eure Mutter eigentlich was für ein Feigling ihr seid?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ötter euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ünf euch");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    
	npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf bald","Oh ihr geht schon? Das tut mir aber leid, jedoch nicht weh, hihihi. Passt auf den Fisch auf.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ötter euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ünf euch");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    
	npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Ohh buhuhu! Hat sich der kleine Matz etwa verlaufen? Nun, erwartet keine Hilfe von mir ich habe wichtigeres zu tun.");
	npc.base.autonpcfunctions.AddConsequence("inform","Vielleicht solltest du ihn nach seinem Namen fragen, das wäre zumindest ein Anfang.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]elp","Ohh boohoo! Little child got lost eh? Well don't expect any help from me, I've got more important things to do.");
	npc.base.autonpcfunctions.AddConsequence("inform","Maybe you should ask him after his name, that would be at least a beginning.");
	npc.base.autonpcfunctions.AddTraderTrigger("[Kk]auf[st]","Pah! Seh ich so aus als wäre ich ein Händler? Ich trag genug Trödel mit mir herum, in meinem Kopf!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Vv]erkauf[st]");
    npc.base.autonpcfunctions.AddTraderTrigger("[Bb]uy","Pah! Do I look like a merchant? I carry enough rubbish around with me, in my head!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]ell");
    
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]obaith","Well it's an island, duh! I don't know more.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]obaith","Nun, es ist eine Insel, bäh! Mehr weiß ich nicht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]obiath","Hihihi. Right, I may have found a new follower for Nargun with you. Misspronouncing words is what we do in our freetime. It's called Gobaith you idiot!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]obiath","Hihihi. Klar, in dir hab ich wohl einen neuen Nargun Anhänger gefunden. Wörter falsch aussprechen tun wir in unserer Freizeit. Es heißt Gobaith du Idiot!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    
	npc.base.autonpcfunctions.AddTraderTrigger("[Cc]hance","Ich kann bei Nargun ein gutes Wort für dich einlegen! Meistens zeigt sich der Erfolg sofort nach dem Gebet! Interessiert?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]esonderes");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]pende","Es kostet dich nur 5 Silberstücke die ich zur 'Lobpreisung' Narguns verwenden werde. Ich werde ein 'Gebet' für dich sprechen und dessen 'Erfolg' wird sich sofort zeigen.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ll]obpreisung","Berauschende Substanzen bezahlen sich nicht von selbst, ich muss 5 Silberstücke verlangen für ein Gebet, das dir großen 'Nutzen' bereiten wird!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rfolg","Er könnte dich in ein Schwein verwandeln, oder Blitze vom Himmel schleudern, oder Stinkwolken. Aber am wahrscheinlichsten wird er dir ein 'Geschenk' machen!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ebet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Nn]utzen");
    npc.base.autonpcfunctions.AddCondition("qpg",">",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]eschenk","Nargun mag kleine glitzernde magische 'Steinchen'. Wenn er dich mag teilt er vielleicht mit dir, vielleicht passiert aber auch garnichts, er ist manchmal launisch wisst ihr.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]tein","Ja! Steinchen die ihrem Träger was von ihrer Kraft abgeben wenn er sie lieb behandelt. Du hast sicher schon davon gehört. Also hast du Interesse?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Mm]agi");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Jj]a.*","#me nimmt ein kleines Pergament hervor und liest vor \"Nargun und seine Abgesandten übernehmen keinerlei Haftung für etwaige Schäden an Vermögen, Gesundheit oder anderen Interessensverletzungen die durch die angebotene Dienstleistung beim Auftraggebenden oder einem Dritten entstehen. Akzeptiert ihr diese Vereinbarung?\"");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii]nteress.*");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]icher");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Kk]lar");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2)
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    
	--
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reet","%CHARNAME! I have caught a flea! Want to see it, he's really tame, hihihi. No? Well have you come back for the blessing then?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddCondition("qpg",">",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reet","Huaaah! I bid you a glorious welcome. And a lot of fish!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddConsequence("talk","begin");
    npc.base.autonpcfunctions.AddConsequence("inform","Maybe you should ask him about the fish or atleast after his name.");

	npc.base.autonpcfunctions.AddTraderTrigger("[Ff]ish","Oh yes! My 'lord' adores fish! And 'snowstorms'!");
    npc.base.autonpcfunctions.AddAdditionalText("Fish is the answer, all 'chaos' derrives from the fish!");
    npc.base.autonpcfunctions.AddConsequence("inform","You wonder what he could mean by this.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]nowstorm.*","Nothing pleases my lord 'Nargun' more than a bit of unpredictable, unleashed destruction, right? Hihihi");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Cc]haos");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ll]ord","Bless the name of my lord, 'Nargun'! Or don't, or do it differently, or not at all.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]od");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Dd]eity");
    --npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Pp]riest","Indeed! I am a priest of my god. And for a small donation I will let you have some of his blessing, how about it?");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ho are","Nanginis! Just call me Nanginis! 'Nargun' has granted me this name in a vision, but to be frank my real name is Peter, hihihi.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]hat [Nn]ame");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]ision","Yes! It only took 10 mugs of dwarven ale to please Nargun and make him speak to me. I still got that foul taste on my tongue!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Pp]rofession","Hear the frogs, they are calling you, professional aswell! Hihi no, my profession is to preach the words of 'Nargun' and share his blessing with others.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Bb]lessing","Nothing's for free in this world, much is in vain. Do you want to learn more about Narguns 'benefication'?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Dd]onation");
    npc.base.autonpcfunctions.AddTraderTrigger("[Yy]es","For a small donation of 5 silvercoins you have the chance to receive something very special. Interested?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]ell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]enefication");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("[Yy]es","But we don't even know each other! Tell me your name and your favourite color first.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]ure");
	npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]ell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]enefication");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddTraderTrigger("I am","Very good, very good! Nargun be beside you %CHARNAME. You didn't realy expect your favourite color to matter at all to me. Anyways, back to the blessing. Are you still interrested?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Mm]y name");
    npc.base.autonpcfunctions.AddCondition("qpg","<",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]argun","Ahh! Bless his name, we're close friends, you know. But that's what being a 'priest' is all about anyway.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ff]arewell","Pah! Boring. Does your mother know what a coward you are anyway?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]oodbye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ive you");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ff]arewell","Oh, leaving already? I regret that, but it doesn't trouble me at all, hihihi. Take care and mind the fish.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]oodbye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ive you");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("[Cc]hance","I can sweettalk Nargun for you! The effect of that usually reveals itself immidiately after the prayer! Interested?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]pecial");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]onation","It's only 5 silvercoins which I will spend to 'worship' Nargun. I will chant a 'prayer' for you and it's effect will reveal itself at once.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]orship","Intoxicating substances don't pay for themselves, so I am forced to charge 5 silvercoins for a prayer, which will 'benefit' you greatly.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]ucess","He might turn you into a pig, or throw lightning down from the sky, gasbombs perhaps, or nothing at all might happen. But most likely he will 'gift' you a 'present'!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Pp]rayer");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Cc]hant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]enefit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]ffect");
    npc.base.autonpcfunctions.AddTraderTrigger("[Pp]resent","Nargun likes small glittery magical 'stones'. If he likes you he might share some with you, mayhaps he doesn't, he can be moody at times.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ift");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]tone","Yes! Stones that grant the one carrying them part of their power if you treat them nicely. Of course you've heard about those already. Are you... interrested then?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Mm]agi");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("[Yy]es","#me unfolds a small piece of parchment and starts to read \"Nargun and his representatives do not take any responsibility for damage of property or health or infringement other interests which may occur to you or a third party due to the use of the offered service. Do you accept this agreement?\"");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii]nteres");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]ure");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
	--
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]pende","Nichts ist umsonst auf der Welt, vieles sinnlos. Soll ich dir mehr über Narguns Segnung erzählen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ss]egen");
    
    
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
	startPrayer=false;
	i=0;
    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;
   
    RandomStart(thisNPC);
    --thisNPC:warp(position(737,400,0));
	--thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Nargun sei gepriesen, da bin ich!");
	--thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Praise Nargun, here I am!");

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
	if startPrayer then
		if i==10 then
			gText="#me streckt seine Arme nach links und rechts aus so weit er kann.";
 			eText="#me widens his arms as much as he can.";
 			thisNPC:talkLanguage(CCharacter.say,CPlayer.german,gText);
  			thisNPC:talkLanguage(CCharacter.say,CPlayer.english,eText);
  		elseif i==40 then
		  	gText="Ich hab mal einen Fisch gefangen, der war SO GROß!"	
  			eText="Once I cought a fish THIS BIG!"
			outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
  		elseif i==70 then --some sound and graphic
			thePosition=base.common.GetFrontPosition(thisNPC);
			world:gfx(45,thePosition);
			world:makeSound(5,thePosition);
		elseif i==90 then
			GiveHimSomething();
			base.common.InformNLS( User, "#w Vom Licht geblendet nimmst du verschwommen eine Bewegung neben dir wahr. Irgendetwas liegt nun auf dem Boden was vorher noch nicht da lag.",
								   "#w Blinded by the light you observe a movement next to you with blurred eyes. Something lies on the ground now that has not been there before." );
		elseif i==120 then
			gText="Hihihi. Da, ich hoffe du hast bekommen was du wolltest. Es gibt keinen Ersatz, aber versuchs doch nochmal wenn du nicht zufrieden bist. Willst du nochmal?";
			eText="Hihihi. There, I hope you got what you wanted. Remember, no refunds, but you're welcome to try again if you want. Want to try it again?";
			outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			i=-1;
			User:setQuestProgress(63,3);
			startPrayer=false;
		end
		i=i+1;
	end
		 	
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
		User = getCharForId(originator.id);
		--stops npc.base.autonpcfunctions.walking--
		currentTalk = User.id;
		idle=false;
		-----------------
		
    	if string.find(message,"[qQ]uestprogress")~=nil then
    		User:inform("Questprogress="..User:getQuestProgress(63).."!");
    	elseif string.find(message,"reset")~=nil then
			User:setQuestProgress(63,0);
    		User:inform("Reset done");
		end
        if npc.base.autonpcfunctions.LangOK(User,TradSpeakLang) then
			if (User:getQuestProgress(63)==3) then
				EnoughMoney=npc.base.autonpcfunctions.CheckMoney(User,500);
				if not startPrayer then --already praying?
					if string.find(message,"[Nn]ein")~=nil or string.find(message,"[Aa]kzep.+nicht")~=nil or
					   string.find(message,"[Nn]o"  )~=nil or string.find(message,"I.+not.+accept")~=nil then
			
						gText="Pah! Langweiler, hinfort mit euch. Soll euch der Fisch holen.";
		                eText="Pah! Boring, begone. The fish shall come after you.";
		                outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
				        npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						User:setQuestProgress(63,2);
				        	
					elseif string.find(message,"[Jj]a" )~=nil or string.find(message,"[Aa]kzep" )~=nil or
					   	   string.find(message,"[Yy]es")~=nil or string.find(message,"[Aa]ccept")~=nil then
					   
					    if EnoughMoney then  
							gText="Sehr schön! Ahja, die Summe stimmt. Dann werde ich sofort beginnen.";
			                eText="Very good! Ah yes, the sum is correct. I shall begin immediately.";
			                outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
					        npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
							npc.base.autonpcfunctions.PayTheNPC(User,500);
							startPrayer=true; --starts the prayer
							i=0;
					    elseif not EnoughMoney then
							gText="Möge Nargun dich kreuzbuckeln! Du hast nicht genug Geld, hinfort mit euch!";
			                eText="Nargun shall smite you with angerberries! You don't have enough money, begone!";
			                outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
					        npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
							User:setQuestProgress(63,2);
						end
					else
						npc.base.autonpcfunctions.TellSmallTalk(message,User);
					end
				else
					gText="Seht ihr nicht das ich beschäftigt bin? Wartet ein bisschen!";
	                eText="Can't you see that I'm busy right now? Wait a bit!";
	                outText=base.common.npc.base.npcautofunction.GetNLS(User,gText,eText);
			        npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				end
			else
				npc.base.autonpcfunctions.TellSmallTalk(message,User);
			end 
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

function GiveHimSomething()
	
	winvar=math.random(10); -- decides whether the Char wins a magic gem or not
	data = 0;  --initialize data value
	thePosition=choosePosition();
	if (winvar==5 or winvar==6) then --the player wins a gem, lets create Quality and ID
		StoneList={285,45,46,283,284,197,198};
		stonevar=math.random(7);
		ItemID=StoneList[stonevar]; --the player gets the stone with the ItemID...

		datavar=math.random(57);  --chooses the data(~quality of the magical gem)
		if (datavar>=1 and datavar <=8) then
			data=1;
		elseif (datavar>=9 and datavar <=17) then
			data=2;
		elseif (datavar>=18 and datavar <=27) then
			data=3;
		elseif (datavar>=28 and datavar <=36) then
			data=4;
		elseif (datavar>=37 and datavar <=42) then
			data=5;
		elseif (datavar>=43 and datavar <=47) then
			data=6;
		elseif (datavar>=48 and datavar <=51) then
			data=7;
		elseif (datavar>=52 and datavar <=54) then
			data=8;
		elseif (datavar>=55 and datavar <=56) then
			data=9;
		elseif (datavar==57) then
			data=10;
		end
		theItem=world:createItemFromId(ItemID,1,thePosition,true,333,data);
		theItem.wear = 6;
		world:changeItem(theItem);
		
	else
		if winvar==4 then    --pigs,wasps,sheeps,cows, deers and rabbits
				MonsterList={292,122,124,291,293,294,295,296};
				monsterID=MonsterList[math.random(8)];
				world:createMonster(monsterID,thePosition,2)
				--create Tier
		else
			ItemList={2,5,6,9,15,16,21,23,26,34,35,49,50,51,53,73,74,75,80,86,95,96,101,118,119,155,159,168,172,201,202,220,224,225,
					  227,236,266,276,290,292,206,315,319,325,333,335,337,353,355,356,372,385,506,516,559,694,735,1844,1853,1857,
					  2278,2295,2588,2664,2744,2745,2746,2760,2850,2863,2916,3100};     --72 items
			ItemID=ItemList[math.random(72)];
			theItem=world:createItemFromId(ItemID,1,thePosition,true,222,data);
			theItem.wear = 1; --lets the item rot really fast (2 server rot cycles needed)
			world:changeItem(theItem);
			
		end	

	end
end

function choosePosition()   --checks whether a character or item is on a field and looks for a new free field else chooses a field by random
	FrontPos=base.common.GetFrontPosition(thisNPC); thePosition=FrontPos; z=thisNPC.pos.z;
	if (world:isCharacterOnField(thePosition) or world:isItemOnField(thePosition)) then thePosition=position(FrontPos.x-1,FrontPos.y,z); end
	if (world:isCharacterOnField(thePosition) or world:isItemOnField(thePosition)) then thePosition=position(FrontPos.x+1,FrontPos.y,z); end
	if (world:isCharacterOnField(thePosition) or world:isItemOnField(thePosition)) then thePosition=position(thisNPC.pos.x+1,thisNPC.pos.y,z); end
	if (world:isCharacterOnField(thePosition) or world:isItemOnField(thePosition)) then thePosition=position(thisNPC.pos.x-1,thisNPC.pos.y,z); end	
	return thePosition;
end


function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein dünner, unrasierter und kleiner Mann. Er trägt eine zerzauste Priesterrobe.";
        output[1]="A slim, unshaved and small man. He wears a disheveled priest robe.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end