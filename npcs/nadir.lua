--Name:        Nadir
--Race:        Human
--Town:        Varshikar
--Function:    Public trader
--Position:    x=-263 y=-309 z=0
--Facing:      West
--Last Update: 06/03/2008
--Update by:   Lennier

dofile("npc_trader_functions.lua")
require("npcs.base.functions")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.functions.InitTalkLists()
    InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA  ,Qual ,Dura   ,Data,Catagory
    AddTraderItem(100 ,18  ,20,10 ,25  ,{3,4},{44,66},0   ,0       ); -- basic metalshield
    AddTraderItem(300 ,20  ,25,15 ,25  ,{3,4},{44,66},0   ,0       ); -- advanced metalshield
    AddTraderItem(400 ,186 ,15,20 ,15  ,{3,4},{44,66},0   ,0       ); -- round shield
    AddTraderItem(150 ,19  ,19,15 ,25  ,{3,4},{44,66},0   ,0       ); -- (medium) metalshield
    AddTraderItem(250 ,230 ,25,10 ,25  ,{3,4},{44,66},0   ,0       ); -- mace
    AddTraderItem(200 ,78  ,15,20 ,10  ,{3,4},{44,66},0   ,0       ); -- short sword
    AddTraderItem(300 ,2701,25,10 ,25  ,{3,4},{44,66},0   ,0       ); -- longsword
    AddTraderItem(100 ,27  ,25, 5 ,25  ,{3,4},{44,66},0   ,0       ); -- cheap dagger
    AddTraderItem(200 ,190 ,25,10 ,25  ,{3,4},{44,66},0   ,0       ); -- ornate dagger
    AddTraderItem(100 ,202 ,15,10 ,15  ,{3,4},{44,66},0   ,0       ); -- steel cap
    AddTraderItem(150 ,187 ,25,10 ,25  ,{3,4},{44,66},0   ,0       ); -- steel hat
    AddTraderItem(1200,101 ,10,50 ,5   ,{4,6},{44,66},0   ,0       ); -- chain shirt
    AddTraderItem(30  ,312 ,50,0  ,30  ,{5,7},{77,90},0   ,0); -- wooden shovel
    AddTraderItem(30  ,24  ,5 ,0  ,30  ,{5,7},{77,90},0   ,0); -- shovel
    AddTraderItem(30  ,2763,5 ,0  ,30  ,{5,7},{77,90},0   ,0); -- pickaxe
    AddTraderItem(30  ,23  ,3 ,0  ,30  ,{5,7},{77,90},0   ,0); -- hammer
    AddTraderItem(50  ,2751,20,0  ,20  ,{5,7},{77,90},0   ,0); -- crucible pincers
    AddTraderItem(40  ,2140,10,3  ,10  ,{4,5},{77,90},0   ,0); -- tongs
    AddTraderItem(30  ,311 ,3 ,0  ,30  ,{5,7},{77,90},0   ,0); -- glass blow pipe
    


    TraderCopper=2000;

    npcs.base.functions.AddTraderTrigger("[Gg]reetings","Welcome. How can I help you?");
    npcs.base.functions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.functions.AddAdditionalText("Good day. Do you need something? I have cheap wares!");
    npcs.base.functions.AddTraderTrigger("[Gg]rü[sß]+e","Willkommen. Kann ich euch helfen?");
    npcs.base.functions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.functions.AddAdditionalText("Guten Tag? Braucht ihr etwas? Ich habe billige Waren");
    npcs.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","A trader I am, that's right. I trade different kinds of wares.");
    npcs.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ich bin Händler, das ich richtig. Ich handel mit verschiedensten Waren.");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+sell","I sell mostly smithed weapons.");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe geschmiedete Waffen.");
    npcs.base.functions.AddTraderTrigger("[Tt]ell.+[Ss]omething","Once upon a time, I came here. Now I am here. Isn't that interesting?");
    npcs.base.functions.AddTraderTrigger("[Ee]rzähl.+[Ww]as","Vor langer Zeit, kam ich hier her. Jetzt bin ich da. Ist das nicht interessant?");
    npcs.base.functions.AddTraderTrigger("[Gg]oodbye","Have a nice day.");
    npcs.base.functions.AddAdditionalTrigger("[Bb]ye");
    npcs.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.functions.AddAdditionalText("Farewell!");
    npcs.base.functions.AddAdditionalText("Good bye.");
    npcs.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Schönen Tag.");
    npcs.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npcs.base.functions.AddAdditionalText("Auf bald");
    npcs.base.functions.AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    npcs.base.functions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*","Mein Name ist "..thisNPC.name..".");
    npcs.base.functions.AddTraderTrigger("I'm .+","Nice to meet you.");
    npcs.base.functions.AddTraderTrigger("[Ii]ch.+[Bb]in","Freut mich euch kennen zu lernen");
    npcs.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npcs.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

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

end

--------------------------------------------- *** DON'T EDIT BELOW HERE ***--------------------------------------

function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        npcs.base.functions.increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    TraderCycle();
    npcs.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.functions.BasicNPCChecks(originator,2) then
        if (npcs.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status,Values=SayPriceSell(originator, message)
            if (Status==0) then Status,Values=SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=ShowItemList(originator, message) end
            if (Status==0) then Status,Values=Selling(originator, message) end
            if (Status==0) then Status,Values=Buying(originator, message) end
            if (Status==0) then Status,Values=npcs.base.functions.TellDate(originator, message, TraderMonths) end
            if (Status==0) then npcs.base.functions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platz in Eurem Inventar.";
                eText="Sorry, you do not have enough space in your inventory.";
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enougth money to buy the item
                gText="Kommt wieder wenn ihr genug Geld habt!";
                eText="Come back when you have enough money!";
            elseif (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich habe das im Moment nicht. Kommt doch bitte später wieder.";
                eText="I am sorry, I don't have this currently. Come back later.";
            elseif (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkaufe das nicht.";
                eText="Sorry, I do not sell that item.";
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // Selling of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Schau selbst. Ich handle mit verschiedenen Schildern, Waffen und Rüstungen.";
                eText="Take a look. I trade with different things: shields, armor and weapons.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Schau selbst. Ich handle mit verschiedenen Schildern, Waffen und Rüstungen.";
                eText="Take a look. I trade with different things: shields, armor and weapons.";
            elseif(Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
            elseif (Status==18) then
                gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It's day "..Values[1].." of "..Values[2].." of the year "..Values[3]..".";
                elseif (seleced==2) then
                    eText="It's the "..npcs.base.functions.EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            end

            if (Status~=0) then
                outText=npcs.base.functions.GetNLS(originator,gText,eText);
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
                outText=npcs.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein braun gebrannter Mann, der stolz vor einigen Kisten steht, in denen diverse Rüstungsteile und gefiederte Pfeile liegen.";
        output[1]="A tanned man who stands proudly in front of a few chests in which you see certain armour pieces as well as feathered arrows.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end