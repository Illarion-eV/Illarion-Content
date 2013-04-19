--Name:        Timo
--Race:        Halfling
--Town:        Greenbriar
--Function:    Public trader && AutoQuest 1 (Holy Water Quest)
--Position:    x=-394 y=69 z=0
--Facing:      South
--Last Update: 11/26/2005
--Update by:   Nitram

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.timo", package.seeall)

function useNPC(user)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Hee! Finger weg!") end
    if (lang==1) then thisNPC:talk(Character.say, "Hee! Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    npc.base.trader_functions.InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am  ,SPr,SA ,Qual ,Dura   ,Data,Catagory
    npc.base.trader_functions.AddTraderItem(120 ,356 ,100 ,7  ,50 ,{5,7},{77,90},0   ,0); -- Hut
    npc.base.trader_functions.AddTraderItem(150 ,55  ,100 ,15 ,50 ,{5,7},{77,90},0   ,0); -- Umhang
    npc.base.trader_functions.AddTraderItem(120 ,2295,100 ,12 ,50 ,{5,7},{77,90},0   ,0); -- Handschuhe
    npc.base.trader_functions.AddTraderItem(50  ,97  ,100 ,0  ,80 ,{5,7},{77,90},0   ,0); -- Tasche
    npc.base.trader_functions.AddTraderItem(30  ,312 ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Holz Kelle
    npc.base.trader_functions.AddTraderItem(35  ,24  ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Schaufel
    npc.base.trader_functions.AddTraderItem(25  ,258 ,10  ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Dreschflegel
    npc.base.trader_functions.AddTraderItem(25  ,271 ,10  ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Sense
    npc.base.trader_functions.AddTraderItem(35  ,74  ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Axt
    npc.base.trader_functions.AddTraderItem(20  ,51  ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Eimer
    npc.base.trader_functions.AddTraderItem(20  ,121 ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Ofenschieber
    npc.base.trader_functions.AddTraderItem(20  ,118 ,5   ,0  ,50 ,{5}  ,{77,90},0   ,0); -- Nudelholz
    npc.base.trader_functions.AddTraderItem(2   ,249 ,5   ,0  ,500,{3}  ,{33},0   ,0); -- Getreide
    npc.base.trader_functions.AddTraderItem(5   ,728 ,10  ,0  ,500,{3}  ,{33},0   ,0); -- Hopfen Samen
    npc.base.trader_functions.AddTraderItem(2   ,2917,10  ,0  ,500,{3}  ,{33},0   ,0); -- Tomaten Samen
    npc.base.trader_functions.AddTraderItem(2   ,291 ,10  ,0  ,500,{3}  ,{33},0   ,0); -- Kohl Setzling
    npc.base.trader_functions.AddTraderItem(2   ,2494,10  ,0  ,500,{3}  ,{33},0   ,0); -- Karotten Samen

    TraderCopper=5000;

    npc.base.functions.AddTraderTrigger("[Gg]reetings","Welcome to Greenbriar! Can I help you?");
    npc.base.functions.AddTraderTrigger("[Hh]ello","A good day to you! What do you want to buy?");
    npc.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", once I was one of Greenbriar's traders!");
    --npc.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", one of Greenbriar's traders!");
    npc.base.functions.AddTraderTrigger("[Tt]ell.+[Gg]reenbriar","It was Crosis, leader of the Evergreen halflings, who animated all the other halflings to build the Briary bridge.");
    npc.base.functions.AddTraderTrigger("[Tt]ell.+[Cr]osis","His group of halflings built the Briary bridge.");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+[Cr]osis","Crosis lead the Evergreen halflings to this land.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Gg]reenbriar","Once, Greenbriar was a peacefull little town not far from here. But the peacefull times, in which all live together in harmony are gone.");
    --npc.base.functions.AddTraderTrigger("[Ww]hat.+[Gg]reenbriar","All this nature around you belongs to this beautiful island, Greenbriar. You can enter and leave it through the Briary bridge, just north of here.");
    npc.base.functions.AddTraderTrigger("[Ww]here.+[Gg]reenbriar","Go to the west, over the bridge and follow the path.");
    --npc.base.functions.AddTraderTrigger("[Ww]here.+[Gg]reenbriar","You are already in Greenbriar! Welcome!");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Bb]riary.+bridge","The Briary bridge was built by the Evergreen halflings, the first people around here.");
    npc.base.functions.AddTraderTrigger("[Ww]here.+[Bb]riary.+bridge","Go to the south.");
    --npc.base.functions.AddTraderTrigger("[Ww]here.+[Bb]riary.+bridge","It's north of this beautiful town!");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+[Ee]vergreen.+halflings","The Evergreen halflings are a group of halflings that founded Greenbriar.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","Oh, I sell clothes, tools and seeds Want to see my list?");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Cc]lothe","I have really nice hats, gloves and capes.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Tt]ool","I have axes, scythes, shovels and so on. For more ask for my list of wares");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ss]eed","I have seeds of grain, cabbage, carrots and tomatos.");
    npc.base.functions.AddTraderTrigger("[Tt]ell.+[Ss]omething","We halflings discovered this beautiful island when we walked around in the east. It were the Evergreen halflings who built the Briary bridge.");
    npc.base.functions.AddTraderTrigger("[Gg]oodbye","Have a nice day!");
    npc.base.functions.AddTraderTrigger("[Bb]ye","Good bye!");
    npc.base.functions.AddTraderTrigger("[Ff]arewell","Bye!");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    npc.base.functions.AddTraderTrigger("I'm .+","Nice to meet you!");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Grüß' dich!");
    npc.base.functions.AddTraderTrigger("[Hh]allo","Huhu!");
    npc.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ich bin "..thisNPC.name..", früher war ich einer von Greenbriars Händlern!");
    --npc.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ich bin "..thisNPC.name..", einer von Greenbriars Händlern!");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Oh, ich verkaufe Kleidung, Werkzeuge und Samen. Willst du meine Liste sehen?");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Kk]leidung","Ich hab sehr schöne Hüte, Umhänge und Handschuhe.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]erkzeuge","Ich hab Äxte, Sensen, Schaufeln und so weiter. Frag nach meiner Warenliste wenn du es genau wissen willst.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ss]ame","Ich habe Samen von Getreide, Kohl, Karotten und Tomaten.");
    npc.base.functions.AddTraderTrigger("[Ee]rzähl.+[Ee]twas","Weisst Du, wie wir Halblinge diese Insel entdeckt haben? Das geschah, als wir im Osten herumgewandert sind.");
    npc.base.functions.AddTraderTrigger("[Ee]rzähl.+[Gg]reenbriar","Crosis, der Anführer der Evergreen Halblinge hat den Bau der Briary Brücke veranlasst.");
    npc.base.functions.AddTraderTrigger("[Ee]rzähl.+[Cr]osis","Er hat die Briary Brücke bauen lassen, mit seinen Halblingen.");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[Cr]osis","Crosis hat eine Gruppe von Halblingen angeführt: die Evergreen Halblinge.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Gg]reenbriar","Einst war Greenbriar ein wunderschöne, friedlicher Ort. Aber Missgunst und Unmut hat sich unter den Bewohnern breit gemacht und den Freiden vertrieben.");
    --npc.base.functions.AddTraderTrigger("[Ww]as.+[Gg]reenbriar","Die gesamte Natur um dich herum gehört zur Insel Greenbriar. Du kannst Greenbriar im Norden betreten und wieder verlassen, an der Briary Brücke!");
    npc.base.functions.AddTraderTrigger("[Ww]o.+[Gg]reenbriar","Geh nach Westen, über die Brücke und folge einfach dem Pfad.");
    --npc.base.functions.AddTraderTrigger("[Ww]o.+[Gg]reenbriar","Du bist mitten in Greenbriar! Willkommen!");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Bb]riary.+[Bb]rücke","Die Briary Brücke wurd' damals von den Evergreen Halblingen gebaut.");
    npc.base.functions.AddTraderTrigger("[Ww]o.+[Bb]riary.+[Bb]rücke","Sie liegt genau westlich von hier!");
    --npc.base.functions.AddTraderTrigger("[Ww]o.+[Bb]riary.+[Bb]rücke","Sie liegt genau nördlich von hier!");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[Ee]vergreen.+[Hh]alblinge","Die Evergreen Halblinge haben die Brücke bauen lassen und diese schöne Insel besiedelt.");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Du gehst schon? Ach schade... Na, dann mach's mal gut!");
    npc.base.functions.AddTraderTrigger("[Bb]is.+[Bb]ald","Ich hoffe, du kommst mal wieder vorbei!");
    npc.base.functions.AddTraderTrigger("[Ww]er.+du?","Ich werde "..thisNPC.name.." genannt.");
    npc.base.functions.AddTraderTrigger("Ich bin .+","Huhu! Schön, dich kennenzulernen!");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

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
        npc.base.functions.increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    npc.base.trader_functions.TraderCycle();
    npc.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.functions.BasicNPCChecks(originator,2) then
        if (npc.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            --originator:inform("Ready set false");
            Status,Values=npc.base.trader_functions.SayPriceSell(originator, message)
            if (Status==0) then Status,Values=npc.base.trader_functions.SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.ShowItemList(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.Selling(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.Buying(originator, message) end
            if (Status==0) then Status=QuestSpecial(originator, message) end
            if (Status==0) then Status,Values=npc.base.functions.TellDate(originator, message, TraderMonths) end
            if (Status==0) then npc.base.functions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // npc.base.trader_functions.Selling of multible items succeed
                gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Selling of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was du kaufen willst? Bitte sehr, das macht"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1)..".";
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe dir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Komm wieder wenn du das hast!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich hab' nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was du verkaufen willst? Ich geb' dir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
                    eText="It's the "..npc.base.functions.EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            elseif (Status==19) then
                gText="Irundar...Die Höhle von Irundar. Ich bin da gewesen...langweiliger Ort, hehe. Sie ist einfach leer. Wenn du rein willst, vom Nordende des kleinen Strandes an der Südküste von Gobaith, 40 Schritte nach Norden und 12 Schritte nach Westen.";
                eText="Irundar...The Cave of Irundar. I have been there...a boring place, hehe. It is just empty. If you want to get in, walk from the north end of a little bay at the south coast of Gobaith 40 steps north and then 12 steps west. Hehe.";
            end

            if (Status~=0) then
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
            end

            ---------------------------------- DON'T EDIT BELOW HERE ------------------------------
            if (string.find(message,"[sS]tatus")~=nil and originator:isAdmin()==true) then
                thisNPC:talk(Character.say,"Copper="..TraderCopper ..", next delivery: "..nextDelivery.."cycCount:"..cycCount);
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
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
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
