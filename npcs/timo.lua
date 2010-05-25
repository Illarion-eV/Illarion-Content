--Name:        Timo
--Race:        Halfling
--Town:        Greenbriar
--Function:    Public trader && AutoQuest 1 (Holy Water Quest)
--Position:    x=-394 y=69 z=0
--Facing:      South
--Last Update: 11/26/2005
--Update by:   Nitram

dofile("npc_trader_functions.lua")
dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Hee! Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Hee! Don't you touch me!") end
end

function initializeNpc()
    InitTalkLists()
    InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am  ,SPr,SA ,Qual ,Dura   ,Data,Catagory
    AddTraderItem(120 ,356 ,100 ,7  ,50 ,{5,7},{77,90},0   ,0); -- Hut
    AddTraderItem(150 ,55  ,100 ,15 ,50 ,{5,7},{77,90},0   ,0); -- Umhang
    AddTraderItem(120 ,2295,100 ,12 ,50 ,{5,7},{77,90},0   ,0); -- Handschuhe
    AddTraderItem(50  ,97  ,100 ,0  ,80 ,{5,7},{77,90},0   ,0); -- Tasche
    AddTraderItem(30  ,312 ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Holz Kelle
    AddTraderItem(35  ,24  ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Schaufel
    AddTraderItem(25  ,258 ,10  ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Dreschflegel
    AddTraderItem(25  ,271 ,10  ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Sense
    AddTraderItem(35  ,74  ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Axt
    AddTraderItem(20  ,51  ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Eimer
    AddTraderItem(20  ,121 ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Ofenschieber
    AddTraderItem(20  ,118 ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Nudelholz
    AddTraderItem(2   ,249 ,5   ,0  ,500,{3}  ,{33},0   ,0); -- Getreide
    AddTraderItem(5   ,728 ,10  ,0  ,500,{3}  ,{33},0   ,0); -- Hopfen Samen
    AddTraderItem(2   ,2917,10  ,0  ,500,{3}  ,{33},0   ,0); -- Tomaten Samen
    AddTraderItem(2   ,291 ,10  ,0  ,500,{3}  ,{33},0   ,0); -- Kohl Setzling
    AddTraderItem(2   ,2494,10  ,0  ,500,{3}  ,{33},0   ,0); -- Karotten Samen

    TraderCopper=5000;

    AddTraderTrigger("[Gg]reetings","Welcome to Greenbriar! Can I help you?");
    AddTraderTrigger("[Hh]ello","A good day to you! What do you want to buy?");
    AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", once I was one of Greenbriar's traders!");
    --AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", one of Greenbriar's traders!");
    AddTraderTrigger("[Tt]ell.+[Gg]reenbriar","It was Crosis, leader of the Evergreen halflings, who animated all the other halflings to build the Briary bridge.");
    AddTraderTrigger("[Tt]ell.+[Cr]osis","His group of halflings built the Briary bridge.");
    AddTraderTrigger("[Ww]ho.+[Cr]osis","Crosis lead the Evergreen halflings to this land.");
    AddTraderTrigger("[Ww]hat.+[Gg]reenbriar","Once, Greenbriar was a peacefull little town not far from here. But the peacefull times, in which all live together in harmony are gone.");
    --AddTraderTrigger("[Ww]hat.+[Gg]reenbriar","All this nature around you belongs to this beautiful island, Greenbriar. You can enter and leave it through the Briary bridge, just north of here.");
    AddTraderTrigger("[Ww]here.+[Gg]reenbriar","Go to the west, over the bridge and follow the path.");
    --AddTraderTrigger("[Ww]here.+[Gg]reenbriar","You are already in Greenbriar! Welcome!");
    AddTraderTrigger("[Ww]hat.+[Bb]riary.+bridge","The Briary bridge was built by the Evergreen halflings, the first people around here.");
    AddTraderTrigger("[Ww]here.+[Bb]riary.+bridge","Go to the south.");
    --AddTraderTrigger("[Ww]here.+[Bb]riary.+bridge","It's north of this beautiful town!");
    AddTraderTrigger("[Ww]ho.+[Ee]vergreen.+halflings","The Evergreen halflings are a group of halflings that founded Greenbriar.");
    AddTraderTrigger("[Ww]hat.+sell","Oh, I sell clothes, tools and seeds Want to see my list?");
    AddTraderTrigger("[Ww]hat.+[Cc]lothe","I have really nice hats, gloves and capes.");
    AddTraderTrigger("[Ww]hat.+[Tt]ool","I have axes, scythes, shovels and so on. For more ask for my list of wares");
    AddTraderTrigger("[Ww]hat.+[Ss]eed","I have seeds of grain, cabbage, carrots and tomatos.");
    AddTraderTrigger("[Tt]ell.+[Ss]omething","We halflings discovered this beautiful island when we walked around in the east. It were the Evergreen halflings who built the Briary bridge.");
    AddTraderTrigger("[Gg]oodbye","Have a nice day!");
    AddTraderTrigger("[Bb]ye","Good bye!");
    AddTraderTrigger("[Ff]arewell","Bye!");
    AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    AddTraderTrigger("I'm .+","Nice to meet you!");
    AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    AddTraderTrigger("[Gg]rü[ßs]+e","Grüß' dich!");
    AddTraderTrigger("[Hh]allo","Huhu!");
    AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ich bin "..thisNPC.name..", früher war ich einer von Greenbriars Händlern!");
    --AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ich bin "..thisNPC.name..", einer von Greenbriars Händlern!");
    AddTraderTrigger("[Ww]as.+verkauf","Oh, ich verkaufe Kleidung, Werkzeuge und Samen. Willst du meine Liste sehen?");
    AddTraderTrigger("[Ww]as.+[Kk]leidung","Ich hab sehr schöne Hüte, Umhänge und Handschuhe.");
    AddTraderTrigger("[Ww]as.+[Ww]erkzeuge","Ich hab Äxte, Sensen, Schaufeln und so weiter. Frag nach meiner Warenliste wenn du es genau wissen willst.");
    AddTraderTrigger("[Ww]as.+[Ss]ame","Ich habe Samen von Getreide, Kohl, Karotten und Tomaten.");
    AddTraderTrigger("[Ee]rzähl.+[Ee]twas","Weisst Du, wie wir Halblinge diese Insel entdeckt haben? Das geschah, als wir im Osten herumgewandert sind.");
    AddTraderTrigger("[Ee]rzähl.+[Gg]reenbriar","Crosis, der Anführer der Evergreen Halblinge hat den Bau der Briary Brücke veranlasst.");
    AddTraderTrigger("[Ee]rzähl.+[Cr]osis","Er hat die Briary Brücke bauen lassen, mit seinen Halblingen.");
    AddTraderTrigger("[Ww]er.+[Cr]osis","Crosis hat eine Gruppe von Halblingen angeführt: die Evergreen Halblinge.");
    AddTraderTrigger("[Ww]as.+[Gg]reenbriar","Einst war Greenbriar ein wunderschöne, friedlicher Ort. Aber Missgunst und Unmut hat sich unter den Bewohnern breit gemacht und den Freiden vertrieben.");
    --AddTraderTrigger("[Ww]as.+[Gg]reenbriar","Die gesamte Natur um dich herum gehört zur Insel Greenbriar. Du kannst Greenbriar im Norden betreten und wieder verlassen, an der Briary Brücke!");
    AddTraderTrigger("[Ww]o.+[Gg]reenbriar","Geh nach Westen, über die Brücke und folge einfach dem Pfad.");
    --AddTraderTrigger("[Ww]o.+[Gg]reenbriar","Du bist mitten in Greenbriar! Willkommen!");
    AddTraderTrigger("[Ww]as.+[Bb]riary.+[Bb]rücke","Die Briary Brücke wurd' damals von den Evergreen Halblingen gebaut.");
    AddTraderTrigger("[Ww]o.+[Bb]riary.+[Bb]rücke","Sie liegt genau westlich von hier!");
    --AddTraderTrigger("[Ww]o.+[Bb]riary.+[Bb]rücke","Sie liegt genau nördlich von hier!");
    AddTraderTrigger("[Ww]er.+[Ee]vergreen.+[Hh]alblinge","Die Evergreen Halblinge haben die Brücke bauen lassen und diese schöne Insel besiedelt.");
    AddTraderTrigger("[Aa]uf.+[Bb]ald","Du gehst schon? Ach schade... Na, dann mach's mal gut!");
    AddTraderTrigger("[Bb]is.+[Bb]ald","Ich hoffe, du kommst mal wieder vorbei!");
    AddTraderTrigger("[Ww]er.+du?","Ich werde "..thisNPC.name.." genannt.");
    AddTraderTrigger("Ich bin .+","Huhu! Schön, dich kennenzulernen!");
    AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,6};
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

end

function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    TraderCycle();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if (LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            --originator:inform("Ready set false");
            Status,Values=SayPriceSell(originator, message)
            if (Status==0) then Status,Values=SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=ShowItemList(originator, message) end
            if (Status==0) then Status,Values=Selling(originator, message) end
            if (Status==0) then Status,Values=Buying(originator, message) end
            if (Status==0) then Status=QuestSpecial(originator, message) end
            if (Status==0) then Status,Values=TellDate(originator, message, TraderMonths) end
            if (Status==0) then TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // Selling of multible items succeed
                gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber du hast nicht genug Platz in deinem Inventar!";
                eText="Sorry, you do not have enough space in your inventory.";
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enougth money to buy the item
                gText="Komm wieder wenn du genug Geld hast!";
                eText="Come back when you have enough money!";
            elseif (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich hab' das im Moment nicht. Komm doch bitte später wieder.";
                eText="I am sorry, I don't have this currently. Come back later.";
            elseif (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkauf' das nicht.";
                eText="Sorry, I do not sell that item.";
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // Selling of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was du kaufen willst? Bitte sehr, das macht"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1)..".";
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // Buying of multible items succeed
                gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe dir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Komm wieder wenn du das hast!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich hab' nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was du verkaufen willst? Ich geb' dir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkauf' Werkzeug, Kleidung und noch so einiges, was man braucht, um glücklich zu werden!";
                eText="I sell tools, clothes and other stuff to be happy with.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Kleidung.";
                eText="I buy clothes.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
            elseif (Status==18) then
                gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It's day "..Values[1].." of "..Values[2].." of the year "..Values[3]..".";
                elseif (seleced==2) then
                    eText="It's the "..EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            elseif (Status==19) then
                gText="Irundar...Die Höhle von Irundar. Ich bin da gewesen...langweiliger Ort, hehe. Sie ist einfach leer. Wenn du rein willst, vom Nordende des kleinen Strandes an der Südküste von Gobaith, 40 Schritte nach Norden und 12 Schritte nach Westen.";
                eText="Irundar...The Cave of Irundar. I have been there...a boring place, hehe. It is just empty. If you want to get in, walk from the north end of a little bay at the south coast of Gobaith 40 steps north and then 12 steps west. Hehe.";
            end

            if (Status~=0) then
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
            end

            ---------------------------------- DON'T EDIT BELOW HERE ------------------------------
            if (string.find(message,"[sS]tatus")~=nil and originator:isAdmin()==true) then
                thisNPC:talk(CCharacter.say,"Copper="..TraderCopper ..", next delivery: "..nextDelivery.."cycCount:"..cycCount);
                statusString="Wares: ";
                for itnCnt=1,table.getn(TraderItemId) do
                    if string.len(statusString)+string.len(world:getItemName(TraderItemId[itnCnt],1))>240 then    -- line too long
                        originator:inform(statusString);                     -- say everything until here
                        statusString="";
                    end
                    statusString=statusString..world:getItemName(TraderItemId[itnCnt],1).."="..TraderItemNumber[itnCnt]..", ";
                end
                originator:inform(statusString);
            end
            if (string.find(message,"[Rr]efill")~=nil and originator:isAdmin()==true) then
                for itnCnt=1,table.getn(TraderItemId) do
                    refill(itnCnt);
                    if (TraderCopper<TraderStdCopper) then TraderCopper=TraderStdCopper end
                end
            end -- string find buy/sell/list...
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end-- range
end--function

function QuestSpecial(originator, message)
    local retVal=0;
    if (string.find(message,"[Ii]rundar")~=nil) then retVal=19 end
    return retVal
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein Halbling, kaum größer als sein Thresen, der eifrig seine Waren, überwiegend Kleidung, ordnet.";
        output[1]="A halfling barely taller than his counter but who is eagerly sorting out his wares, mainly clothes.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
