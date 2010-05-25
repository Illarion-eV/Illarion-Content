--Name:        Sorgan Stonemate
--Race:        Dwarf
--Town:        Trolls Bane
--Function:    Public trader
--Position:    x=-107 y=-112 z=0
--Facing:      South
--Last Update: 04/26/2006
--Update by:   Nitram

dofile("npc_trader_functions.lua")
dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.autonpcfunctions.InitTalkLists()
    InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    --AddTraderItem(0   ,197 ,15,10 ,10,{5,7},{44,66},0   ,0       ); -- amethyst
    --AddTraderItem(0   ,198 ,15,10 ,10,{5,7},{44,66},0   ,0       ); -- topas
    --AddTraderItem(0   ,45  ,15,10 ,10,{5,7},{44,66},0   ,0       ); -- emerald
    --AddTraderItem(0   ,46  ,15,10 ,10,{5,7},{44,66},0   ,0       ); -- ruby
    --AddTraderItem(200 ,2645,10,10 ,5 ,{7,8},{66,88},0   ,0       ); -- throwing axe
    --AddTraderItem(600 ,188 ,5 ,15 ,5 ,{7,8},{66,88},0   ,0       ); -- normal waraxe
    --AddTraderItem(700 ,205 ,5 ,15 ,5 ,{7,8},{66,88},0   ,0       ); -- double axe
    --AddTraderItem(0   ,383 ,5 ,15 ,5 ,{7,8},{66,88},0   ,0       ); -- dwarven axe
    --AddTraderItem(1000,88  ,5 ,12 ,5 ,{7,8},{66,88},0   ,0       ); -- longaxe
    --AddTraderItem(1200,101 ,10,50 ,5 ,{4,6},{33,66},0   ,0       ); -- chain shirt
    --AddTraderItem(1500,4   ,5 ,60 ,5 ,{4,6},{33,66},0   ,0       ); -- plate armor
    --AddTraderItem(0   ,2395,5 ,100,5 ,{4,6},{33,66},0   ,0       ); -- dwarvenplate
    --AddTraderItem(500 ,2112,10,20 ,10,{4,6},{33,66},0   ,0       ); -- short blue steel greave
    --AddTraderItem(15  ,2535,40,3  ,20,{3,3},{33,33},0   ,0       ); -- iron plate
    --AddTraderItem(600 ,2444,20,25 ,5 ,{7,8},{66,88},0   ,0       ); -- salkamaerian paladin's helmet
    --AddTraderItem(400 ,324 ,20,10 ,5 ,{7,8},{66,88},0   ,0       ); -- chain helmet
    --AddTraderItem(200 ,2290,20,10 ,5 ,{7,8},{66,88},0   ,0       ); -- round steel hat
    --AddTraderItem(30  ,23  ,20,0  ,20,{5,7},{77,90},0   ,0       ); -- hammer
    --AddTraderItem(50  ,2751,20,0  ,20,{5,7},{77,90},0   ,0       ); -- crucible pincers
    --AddTraderItem(40  ,2140,10,3  ,10,{4,5},{77,90},0   ,0); -- tongs

    TraderCopper=2000;

    --npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]reetings","Greetings. How can I help you?");
    --npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    --npcs.base.autonpcfunctions.AddAdditionalText("Hello. Do you need some of smithed goods? Best quality!");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]rü[ßs]+e","Tach, wie kann ich dir helfen?");
    --npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]alle");
    --npcs.base.autonpcfunctions.AddAdditionalText("Grüß dich. Brauchst was geschmiedetes? Beste Qualität!");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Yy]ou.+[Tt]rader","Sure, I am trader of my own goods: gems, armors, helmets and more. You are interested on my wares?");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[IiDd][uh]r*.+[Hh]ändler","Sicher, ich verkauf meine eigenen Sachen: Edelsteine, Rüstungen, Helme und mehr. Bist an meinen Waren interessiert?");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I trade with gems, armors, helmets, weapons and more.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ich handel mit Edelsteinen, Rüstungen, Waffen und mehr.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Ww]ares","I have gems, armors, helmets, weapons and more.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Ww]aren","Ich hab Edelsteinen, Rüstungen, Waffen und mehr.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Gg]em","Take a short look. But do not touch them! I trade with amethysts, emeralds, rubies and topaz.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Ee]delstein","Sieh sie dir kurz an. Aber FASS sie nicht an! Ich handel mit Amethysten, Smaragden, Rubinen und Topasen.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Aa]rmor","Do not trust the Lizard in the shop and her waste. My armors are better! I have chain shirts, plate armors, dwarvenplates and short blue steel greaves.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Rr]üstung","Trau der Echsen und ihrem Müll im Laden nicht. Meine Rüstungen sind besser! Sind ja von nem Zwerg! Ich hab Kettenhemden, Plattenpanzer, Zwergenpanzer und kurze blaue Stahlbeinschienen.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Hh]elm","Oh, i have nice helmets. They are made by the smiths of Silverbrand. Look what i have: salkamaerian paladin's helmet, chain helmets and round steel hat");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Hh]elm","Oh, schau dir diese tollen Helme an. Sie wurden von den Schmieden Silberbrands gemacht. Schau welche ist habe: salkamaerischer Paladinhelme, Kettenhelme und runde Stahlhelme.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Ww]eapon","Ah, You are interested on my weapons? A good choice! I have the best sortiment of axes: throwing axes, dwarven axes, waraxes, double axes, large waraxes, longaxes.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Ww]affe","Ah, du bist an meinen Waffen interessiert? Eine gute Wahl! Har. Ich habe das beste sortiment an Äxten: Wauf, Zwergen und Kriegsäxte. Außerdem Doppeläxte und Langäxte.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Mm]ore","You are smith yourself? Look, maybe do you want some iron ignots and iron plates?");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Mm]ehr","Du bist auch ein Schmied? Schau, vielleicht willst du Eisen Barren oder Platten?");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Irmorom with you. Good day.");
    --npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    --npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    --npcs.base.autonpcfunctions.AddAdditionalText("Good day. Irmorom may help you to have good trades.");
    --npcs.base.autonpcfunctions.AddAdditionalText("Farewell!");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Irmorom mit dir, Schönen Tag noch.");
    --npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    --npcs.base.autonpcfunctions.AddAdditionalText("Schönen Tag. Irmorom möge dir helfen ein paar gute Geschäfte zu machen");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you?","I am Sorgan Stonemate, a miner and smith of Silverbrand");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*","Ich bin Sorgan Stonemate, Bergarbeiter und Schmied von Silberbrand");
    --npcs.base.autonpcfunctions.AddTraderTrigger("I'm .+","Ahr! Nice to meet you.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ii]ch.+[Bb]in.+","Arrr, Freut mich!");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Tt]ell.+[Ss]omething","Hrmm, I know where you can find copper ore, iron ore, coal and some gems. But do not tell it around! This knowledge should not be public. Right?");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ee]rzähl.+[Ww]as","Hrm. Ich weis wo du Kupfer und Eisenerz, Kohle und ein paar Edelsteine finden kannst. Aber erzähl es nicht rum. Dieses Wissen sollte nicht jeder haben. Richtig?");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Cc]opper.+[Oo]re","Hrmm. Where i begin? Do you know the Cooper Mountains in front the East Gate at the path to Silverbrand? What do you think why these Mountains are called so? There you can find this ore everywhere at the surface. You only have to collect it!");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Kk]upfer.+[Ee]rz","Hrm. Wo soll ich anfangen? Kennst du die Kupfer Berge außerhalb des Ost Tores auf dem Pfad nach Silverbrand. Warum denkst du heißen diese Berge so? Dort kannst du das Erz überall auf der Oberfläche finden. Musst es nur einsammeln.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ii]ron.+[Oo]re","Hehe, around this town iron ore is rare. Maybe you have some luck in the mine of the Copper Mountains. But the best mines for iron ore are in Silverbrand and in the north of the Fearys Tears River.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ee]isen.+[Ee]rz","Hehe. Das ist um diese Stadt herum ziemlich selten. Villeicht hast du Glück in der Mine in den Kupfer Bergen. Aber die Beste Mine für dieses Erz ist in Silberbrand und im Norden das Fearys Tears Fluss.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Cc]oal","Coal can be found nearly everywhere. You only have to look for the grey rocks in the next mountains.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Kk]ohle","Kohle kann eigentlich überall gefunden werden. Musst dich nur nach diesen grauen Steinen im nächsten Gebirge umsehen.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]em","Oh, hehe. The location of good gems are a big secret. But, i did not tell you, right? Maybe you can find some Smaragds in the center of the Copper Mountains.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Ee]delstein","Oh. Hehe. Die Verstecke von guten Edelsteinen sind ein großes Geheimniss. Das hab ich dir nicht gesagt, ok? Du findest vielleicht ein paar Smaragde in der Mitte der Kupfer Berge.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Cc]opper.+[Mm]ountain","You are new here, right? Pass the eastern or northern gate of this town and went to east. You can not fail these big mountains.");
    --npcs.base.autonpcfunctions.AddTraderTrigger("[Kk]upfer.+[Bb]erge","Du bist neu hier, oder? Geh aus dem Nord oder Ost Tor dieser Stadt und halte dich nach Osten. Du kannst dieses Gebirge nicht verfehlen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]ilverbrand","Aaarr, you want to visit our dwarven town? Fine, take the northern or eastern gate and went to northeast. When you passed the Copper Mountains you can see the Faerys Tears River. Take a brigde to cross the river and you arrive the entrance of Silverbrand.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]ilberbrand","Arr. Du willst die Zwergenstadt sehen. Nimm die Straße durch das Nord oder Osttor und halte dich nach Nordosten. Wenn du die Kupfer Berge passiert hast, siehst du den Raerys Tears Fluss. Überquere die Brücke und die erreichst den Eingang nach Silberbrand.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?', 'Tell <something>'");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    npcs.base.autonpcfunctions.AddCycleText("Arrr...","Arrr...");
    npcs.base.autonpcfunctions.AddCycleText("Arrr!","Arrr!");
    npcs.base.autonpcfunctions.AddCycleText("#me brummt verärgert:'Ich streike!'","#me grumbles in anger:'I am on strike!'");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,2};
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
        npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    TraderCycle();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if (npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status,Values=SayPriceSell(originator, message)
            if (Status==0) then Status,Values=SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=ShowItemList(originator, message) end
            if (Status==0) then Status,Values=Selling(originator, message) end
            if (Status==0) then Status,Values=Buying(originator, message) end
            if (Status==0) then Status,Values=TellDate(originator, message, TraderMonths) end
            if (Status==0) then npcs.base.autonpcfunctions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platz in Eurem Inventar.";
                eText="Sorry, you do not have enough space in your inventory.";
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enough money to buy the item
                gText="Kommt wieder wenn ihr genug Geld habt!";
                eText="Come back when you have enough money!";
            elseif (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich habe das im Moment nicht. Kommt doch bitte später wieder.";
                eText="I am sorry, I don't have this currently. Come back later.";
            elseif (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkaufe das nicht.";
                eText="Sorry, I do not sell that item.";
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // Selling of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enough money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Edelsteine, Rüstungen, Waffen und mehr.";
                eText="I sell gems, armors, weapons and more.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I do not sell anything.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Edelsteine, Rüstungen, Waffen und mehr.";
                eText="I buy gems, armors, weapons and more.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I do not buy anything.";
            elseif (Status==18) then
                gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It's day "..Values[1].." of "..Values[2].." of the year "..Values[3]..".";
                elseif (seleced==2) then
                    eText="It's the "..EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            end

            if (Status~=0) then
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
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
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function
