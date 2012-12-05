--Name:        Zathrot
--Race:        Lizard
--Town:        Troll's Bane
--Function:    Public trader
--Position:    x=-124 y=-94 z=0
--Facing:      North
--Last Update: 04/15/2008
--Update by:   Lennier

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.zathrot", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fassst mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    npc.base.trader_functions.InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory

    npc.base.trader_functions.AddTraderItem(10  ,73  ,50,0  ,5 ,{3,3},{33,33},0   ,0       ); -- trout
    npc.base.trader_functions.AddTraderItem(15  ,355 ,50,0  ,15,{3,3},{33,33},0   ,0       ); -- salmon
    npc.base.trader_functions.AddTraderItem(30  ,72  ,20,3  ,10,{4,6},{77,90},0   ,0       ); -- fishing rod/Angel
    npc.base.trader_functions.AddTraderItem(100 ,92  ,5 ,10 ,10,{4,6},{33,66},0   ,0       ); -- oil lamp/Öllampe
    npc.base.trader_functions.AddTraderItem(30  ,2719,5 ,1  ,10,{4,6},{33,66},0   ,0       ); -- comb/Kamm
    npc.base.trader_functions.AddTraderItem(100  ,2760,10,0  ,5 ,{4,6},{33,66},0   ,0      ); -- rope/Seil


    TraderCopper=1000;

    npc.base.functions.AddTraderTrigger("[Gg]reetings","Greetingss. You are interessted on my wares? Look what i have found at the ground of the sea. Ssss.");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Greetss. I found lots of things in the sea. Ssss. You are interested?");
    npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Grüßsse. Ssseid ihr an meine Waren interesssiert? Ssseht wasss ich am Grund desss Meeresss gefunden habe. sss");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Ssseid gegrüßsst. Ich habe viele Sssachen auf den Meeresss Boden gesssammelt. Ssseid ihr interesssiert? Ssss");
    npc.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","Yess! Call me Zathrot. Do you want that i lisst my waresss? I found lots thing in the sea.");
    npc.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ja. Nennet mich Zathrot. Wollt ihr dasss ich euch eine Lissste meiner Waren gebe? sss");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I trade with fishss, toolss and more. Everything i found in zelphiass oceanss.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich handle mit Fissschen, Werkzeugen und mehr. Alless wasss ich in Zelphiasss Ozeanen gefunden habe. sss");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ww]ares","I trade with fishss, tools and more, what i found in the ssea.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]are","Ich handle mit Fissschen, Werkzeugen und mehr, wasss ich im Meer gefunden habe. sss");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ff]ish","I have delicious trouts and salmons.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ff]isch","Ich habe ssschmackhafte Forellen und Lachssse.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Mm]ore","Letss me show you. I have old combss, oils lampss and some old ropess");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Mm]ehr","Lassst esss mich euch zsseigen. Ich habe alte Kämme, Öl Lampen und ein paar alte Ssseile. sss");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Tt]ools","I trade with fishing rodsss. But take a look: I found a nice brush.");
    npc.base.functions.AddTraderTrigger("[Ww]was.+[Ww]erkzeug","Ich habe Angeln. Aber ssschaut auch mal hier: Ich habe eine ssschöne Bürssste gefunden. sss");
    npc.base.functions.AddTraderTrigger("[Gg]oodbye","Zhelphia may blesss you!");
    npc.base.functions.AddAdditionalTrigger("[Bb]ye");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddAdditionalText("Farewell!");
    npc.base.functions.AddAdditionalText("Good day. Zhelphia may be with you!");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Zhelphia mit euch!");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Ssschönen Tag noch. Zhelphia sei mit euch.");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you?","Zathrot! Zathrot iss my name");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*?","Zathrot! Zathrot issst mein Name. sss");
    npc.base.functions.AddTraderTrigger("I'm .+","Nice to meet you.");
    npc.base.functions.AddTraderTrigger("Ich bin .+","Erfreut sssie kennen zu lernen. sss");
    npc.base.functions.AddTraderTrigger("[Tt]ell.+[Ss]omething","Once upon a time, I came here. Now I am here. Isn't that interesting?");
    npc.base.functions.AddTraderTrigger("[Ee]rzähl.+[Ee]twas","Vor langer Zeit kam ich her. Nun bin ich hier. Issst dasss nicht interesssant?");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    npc.base.functions.AddCycleText("#me isst einen Fisch","#me eats a fish");
    npc.base.functions.AddCycleText("#me schaut sich nach Kunden um","#me looks around for customers");
    npc.base.functions.AddCycleText("#me lässt ihren Schwanz hin und her schnalzen","#me flicks her tail");
    npc.base.functions.AddCycleText("#me reibt an einer Öllampe","#me rubs at an oil lamp");

    TraderLang={"Gold","gold","Sssilber", "sssilver","Kupfer","copper","ssstücke","piecesss"};
    TraderMonths={"Elosss","Tanosss","Zhasss","Ushosss","Sssirosss","Ronasss","Brasss","Eldasss","Irmasss","Malasss","Findosss","Olosss","Adrasss","Narasss","Chosss","Masss"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,4};
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
            Status,Values=npc.base.trader_functions.SayPriceSell(originator, message)
            if (Status==0) then Status,Values=npc.base.trader_functions.SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.ShowItemList(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.Selling(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.Buying(originator, message) end
            if (Status==0) then Status,Values=npc.base.functions.TellDate(originator, message, TraderMonths) end
            if (Status==0) then npc.base.functions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // npc.base.trader_functions.Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sssehr, das macht"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makesss"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platzss in Eurem Inventar.";
                eText="Sssorry, you do not have enough ssspacess in your inventory.";
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enougth money to buy the item
                gText="Kommt wieder wenn ihr genug Geld habt!";
                eText="Come back when you have enough money!";
            elseif (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich habe dasss im Moment nicht. Kommt doch bitte ssspäter wieder.";
                eText="I am sssorry, I don't have this currently. Come back later.";
            elseif (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkaufe dasss nicht.";
                eText="Sssorry, I do not sssell that item.";
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Selling of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist esss, was ihr kaufen wollt? Bitte sssehr, das macht"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kossstet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costsss"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sssell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr dasss habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann dasss nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sssorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="Ssso etwasss kaufe ich nicht. Tut mir leid.";
                eText="Sssorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist esss, was ihr verkaufen möchtet? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Fisssche, Werkzeuge und Anderesss. sss";
                eText="I sell fisssh, toolsss and more. sss";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Angeln, Öllampen und Kämme. sss";
                eText="I buy fissshing rodsss, oil lampsss and combsss. sss";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
            elseif (Status==18) then
                gText="Esss issst der "..Values[1]..". Tag des Monatesss "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It'sss day "..Values[1].." of "..Values[2].." of the year "..Values[3]..". sss";
                elseif (seleced==2) then
                    eText="It'sss the "..npc.base.functions.EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..". sss";
                end
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
    end --id
end--function

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Eine hell geschuppte Echse, in einfaches Leinen gekleidet. Er steht neben einigen Eimern mit Fisch und am Boden liegen auf einer Decke Angeln und Öllampen, die er zum Verkauf anbietet.";
        output[1]="A lizard with bright scales, clad in simple linen. He stands next to some buckets filled with fish and spread on the ground is a blanket, on top some fishing rods and oillamps that he is selling.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
