module("content.furtunecookies", package.seeall)

function cookie(User)
    local luck=math.random(1,42);
    local germText;
    local englText;
    if (luck==1) then
    	germText="Nutze dein Gehirn bevor es verkï¿½mmert.";
        englText="You will have good luck and overcome many hardships.";
    elseif (luck==2) then
        germText="Man soll sein Licht nicht unter den Scheffel stellen.";
        englText="Your greatest fortune is the friends and family you have.";
    elseif (luck==3) then
        germText="Was kommen soll, das kommt nur dann, wenn man es nicht verhindern kann.";
        englText="Romance comes into your life this year in a very unusual sort of way.";
    elseif (luck==4) then
        germText="Jetzt ist die Zeit gekommen den Verstand zu benutzen.";
        englText="You find beauty in ordinary things. Keep this trait.";
    elseif (luck==5) then
        germText="Strebe nicht an, was Du meinst erreichen zu können, sondern was Du wirklich willst!";
        englText="Anything worth doing can be done.";
    elseif (luck==6) then
        germText="Erfolg hat nur, wer etwas tut, während er auf den Erfolg wartet.";
        englText="Love is like paint,...it makes things beautiful when you spread it,...but it will dry up if you don't use it.";
    elseif (luck==7) then
        germText="Das Schicksal meint es gut mit Dir.";
        englText="Your fortune is as sweet as you.";
    elseif (luck==8) then
        germText="Der Anfang ist die Hï¿½lfte des Ganzen.";
        englText="Bring something up from the back burner.";
    elseif (luck==9) then
        germText="Sei dir selbst dein bester Freund.";
        englText="Be your own best friend.";
    elseif (luck==10) then
        germText="Ehre die Vergangenheit, aber lebe für den Augenblick.";
        englText="Do not be overly judgemental of your loved one's intentions or actions.";
    elseif (luck==11) then
	    germText="Wichtige Dinge nur halb zu tun ist wertlos; denn meistens ist es die andere Hï¿½lfte die zï¿½hlt.";
	    englText="He who hurries can not walk with dignity.";
    elseif (luck==12) then
        germText="Es gehï¿½rt mehr Mut dazu, seine Meinung zu ï¿½ndern, als ihr treu zu bleiben.";
        englText="The smart thing to do is to start trusting your intuition.";
    elseif (luck==13) then
        germText="Es ist schwer verschï¿½ttetes Wasser wieder zu sammeln.";
        englText="The shortest distance between two people is a smile.";
    elseif (luck==14) then
        germText="Die Ruhe ist die natürliche Stimmung eines wohlgeregelten, mit sich einigen Geistes.";
        englText="You can't have everything. Where would you put it?";
    elseif (luck==15) then
        germText="Worï¿½ber du im Zweifel bist, das tue nicht.";
        englText="Be ashamed to die until you have achieved some victory for humanity.";
    elseif (luck==16) then
        germText="Sage niemals nie, denn Du weiï¿½t nie was auf Dich zukommt.";
        englText="Paradise is to believe in it.";
    elseif (luck==17) then
        germText="Der Glï¿½cklichste Mensch ist der, der Trï¿½ume verwirklichen kann.";
        englText="Ideas are funny little things. They won't work unless you do.";
    elseif (luck==18) then
        germText="Wer einen Fehler gemacht hat und ihn nicht korrigiert, begeht einen zweiten.";
        englText="Answers without evidence are useless.";
    elseif (luck==19) then
        germText="Bist Du heute der, der Du einmal sein wolltest, als Du noch jung warst?";
        englText="Are you really the person you want to be as you where young?";
    elseif (luck==21) then
        germText="Sie können herausholen, was in Ihnen steckt.";
        englText="The chief danger in life is that you may take too many precautions.";
    elseif (luck==22) then
        germText="Tu' nichts, woran deine Seele Schaden erleiden kï¿½nnte, auch wenn du die Welt gewinnen könntest.";
        englText="If you don't care where you are, then you ain't lost.";
    elseif (luck==23) then
        germText="Wenn Du die Nacht erwartest, wird auch ein nï¿½chster morgen kommen.";
        englText="You cannot achieve the impossible without attempting the absurd.";
    elseif (luck==24) then
        germText="Eindeutige Zweideutigkeit ist nicht immer zweideutig gemeint, sondern oft nur eindeutig.";
        englText="It is very difficult to prophesy, especially when it pertains to the future.";
    elseif (luck==25) then
        germText="Wer keine Zeit hat wird nicht reif.";
        englText="It has habits, and habits can be broken.";
    elseif (luck==26) then
        germText="Was geschehen ist, ist vorbei und der Weise hat genug mit der Gegenwart und der Zukunft zu tun.";
        englText="Your opinions may have changed, but not the fact that you are right";
    elseif (luck==27) then
        germText="Jede Gabe sei begrï¿½ï¿½t, doch vor allen Dingen: Das, worum man sich bemï¿½ht, mï¿½ge gelingen.";
        englText="An authority is a person who can tell you more about something than you really care to know.";
    elseif (luck==28) then
    	germText="Wandel und Wechsel liebt, wer lebt.";
        englText="Expect nothing; be prepared for anything.";
    elseif (luck==29) then
    	germText="Wer mit dem Finger auf andere zeigt, sollte nicht vergessen, daï¿½ dabei immer drei Finger seiner Hand auf ihn selbst gerichtet sind.";
        englText="Bees are not as busy as we think they are. They just can't buzz any slower.";
    elseif (luck==30) then
    	germText="An kleinen Dingen muï¿½ man sich nicht stoï¿½en, wenn man zu großen Dingen auf dem Weg ist.";
        englText="Nothing is as easy as it looks.";
    elseif (luck==31) then
    	germText="Es steht eine Herausforderung ins Haus. Wappne dich!";
        englText="Remember, even if you win the rat race, you're still a rat.";
    elseif (luck==32) then
    	germText="Suche nicht nach einer Lï¿½sung, wenn sie schon andere gefunden haben.";
        englText="You can't teach people to be lazy - either they have it, or they don't.";
    elseif (luck==33) then
    	germText="Die beim Irrtum verharren, das sind die Narren.";
        englText="What looks like an appealing offer may not be.";
    elseif (luck==34) then
    	germText="Die Liebe allein versteht das Geheimnis, andere zu beschenken und dabei selbst reich zu werden.";
        englText="You are only young once. After that you have to think up some other excuse.";
    elseif (luck==35) then
    	germText="Solange Du selber nicht im Reinen bist, darfst du niemanden verurteilen.";
        englText="Don't take life too seriously.";
    elseif (luck==36) then
        germText="Den Tï¿½chtigen belohnt das Glï¿½ck.";
        englText="Common sense is not so common.";
    elseif (luck==37) then
        germText="Es ist besser, eine kleines Licht zu entzï¿½nden, als ï¿½ber große Dunkelheit zu fluchen.";
        englText="If this fortune didn't exist, somebody would have invented it.";
    elseif (luck==38) then
        germText="Gut ist der Vorsatz, hingegen die Erfï¿½llung schwer.";
        englText="Furious activity is no substitute for understanding.";
    elseif (luck==39) then
        germText="Ein Wort wird eine Brï¿½cke bauen.";
        englText="If you don't stand for something, you'll fall for everything.";
    elseif (luck==40) then
        germText="Dein Sinn für Humor ist dein bester Begleiter, verliere ihn nicht.";
        englText="Stand up to be seen; speak up to be heard; shut up to be appreciated.";
    elseif (luck==41) then
        germText="Hilfe! Ich bin in einer Glï¿½ckkeksbï¿½ckerei eingesperrt!";
        englText="Help! I am a prisoner in a fortune cookie bakery!";
    elseif (luck==42) then
        germText="Fï¿½ttere den Troll nicht.";
        englText="Don't feed the troll.";
    end

    return germText,englText;
end
