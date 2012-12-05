--Name:        Stalljunge
--Race:        Mensch
--Town:        In einem Stall
--Function:    Lastentiere verkaufen
--Position:    x=44 y=67 z=50
--Facing:      South
--Last Update: 05/26/2007
--Update by:   Kadiya

require("npc.base.functions")
module("npc.stalljunge_ma", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------

    npc.base.functions.AddTraderTrigger("[Hh]ello","Greetings.");
    npc.base.functions.AddAdditionalTrigger("[Gg]reetings");
    npc.base.functions.AddAdditionalTrigger("[Hh]i");
    npc.base.functions.AddTraderTrigger("[Hh]allo","Grüß euch!");
    npc.base.functions.AddAdditionalTrigger("[Gg]r[uü][sß]+");
    npc.base.functions.AddTraderTrigger("[Ww]ho ","I am "..thisNPC.name..", ich bin Magier an dieser Akademie");
    npc.base.functions.AddTraderTrigger("[Ww]er ","Ich bin "..thisNPC.name..", I'm a mage of this academy");
    npc.base.functions.AddTraderTrigger("[Bb]ye ","Be well");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe nichts! Ich beschwöre höhstens etwas.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything! I just summon things.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+beschwör","Ich kann euch einen Golem beschwören, der Eure Sachen für euch trägt...wäre das nicht toll?");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+summon","I can summon a golem for you, which can carry your things...isn't that great?");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything!");
    npc.base.functions.AddTraderTrigger("[Ff]arewell","Farewell");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Bis Bald");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Auf bald");
    npc.base.functions.AddTraderTrigger("[Kk]uh","Ich habe keine Kühe.");
    npc.base.functions.AddTraderTrigger("cow","I have no cows.")

    npc.base.functions.AddCycleText("#me schaut sich um","#me looks around");
    npc.base.functions.AddCycleText("#me niest","#me sneezes");

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
    
    PreisProKuh = 50;
    Kaution = 200;
end

function nextCycle()  -- ~10 times per second
    if ( TraderInit == nil) then
        TraderInit = {};
    end
    
    if (TraderInit[thisNPC.id] == nil) then
        initializeNpc();
        npc.base.functions.increaseLangSkill(TradSpeakLang);
        thisNPC.activeLanguage=TradStdLang;
        TraderInit[thisNPC.id] = true;
    end
    npc.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.functions.BasicNPCChecks(originator,2) then
        if (npc.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            result = SayPrice(message, originator);
            if not result then result = GetCow(message, originator) end;
            if not result then result = returnCow(message, originator) end;
            if not result then npc.base.functions.TellSmallTalk(message) end;
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                npc.base.functions.NPCTalking(thisNPC,outText);
                verwirrt=true;
            end
        end
    end
end

function SayPrice(message, originator)
    if (string.find(message,"koste")~=nil) or (string.find(message,"costs")~=nil) then
        thisNPC:talkLanguage( Character.say, Player.german, "Wenn ich euch einen Golem beschwören soll kostet das "..PreisProKuh.." Kupferstücke. Außerdem müsst ihr "..(Kaution/100).." Silberstücke als Kaution hinterlegen die ihr aber wieder bekommt, wenn ihr mir den Golem in einem Stück zurück bringt.");
        thisNPC:talkLanguage( Character.say, Player.english, "When I should summon a golem for you it costs "..PreisProKuh.." coppercoins. Furthermore you have to pay "..(Kaution/100).." silvercoins as surety, but you get these coins back in case you bring the golem back to me in one piece.");
        return true
    end
    return false
end

function createCow( player )
    
    posList = { 0, 1, -1, 2, -2 };
    for i, XPos in pairs(posList) do
        for k, YPos in pairs(posList) do
            SettingPos = position(player.pos.x+XPos,player.pos.y+YPos,player.pos.z);
            TileID = world:getField( SettingPos ):tile();
            if not world:isCharacterOnField( SettingPos ) and not world:isItemOnField( SettingPos ) and ( TileID ~= 0 ) and ( TileID ~= 5 ) and ( TileID ~= 6 ) and ( TileID ~= 42 ) then
                if world:createDynamicNPC("Lasttier",30,SettingPos,0,"npc_lasttier_ma.lua") then
                    return SettingPos;
                else
                    return false;
                end
            end
        end
    end
    return false;
end

function GetCow(message, originator)
    message = string.lower( message );
    if (string.find(message,"golem.+leihen")~=nil)
    or (string.find(message,"leihe.+golem")~=nil)
    or (string.find(message,"golem.+beschwör")~=nil)
    or (string.find(message,"beschwör.+golem")~=nil)
    or (string.find(message,"summon.+golem")~=nil)
    or (string.find(message,"rent.+golem"  )~=nil)
    or (string.find(message,"lend.+golem")~=nil)
    or (string.find(message,"hire.+golem" )~=nil) then
        
    
    
        if (originator:getQuestProgress(8) == 0) then
            GCoins,SCoins,CCoins = CalcSilverCopper(PreisProKuh + Kaution);
            if CheckMoney(originator,GCoins,SCoins,CCoins) then
                if false then
                    thisNPC:talkLanguage( Character.say, Player.german, "Ich darf dir im Augenblick keinen Golem beschwören." );
                    thisNPC:talkLanguage( Character.say, Player.english,"I'm not allowed to summon a golem for you currently, sorry." );
                    return true;
                end
                posOfCow = createCow(originator);
                if not posOfCow then
                    thisNPC:talkLanguage( Character.say, Player.german, "Ich kann momentan nicht noch einen Golem beschwören." );
                    thisNPC:talkLanguage( Character.say, Player.english,"I'm not able to summan another golem yet. Please come back later." );
                    return true
                else
                    Transporter = world:getCharacterOnField(posOfCow);
                    transport_effect = LongTimeEffect( 10, 500000 );
                    transport_effect:addValue("owner",originator.id);
                    Transporter.effects:addEffect(transport_effect);
                    
                    Pay(originator,GCoins,SCoins,CCoins);
                    thisNPC:talkLanguage( Character.say, Player.german, "Hier habt ihr einen Golem. Bringt ihn heile wieder dann bekommt ihr die "..(Kaution/100).." Silberstücke Kaution wieder.");
                    thisNPC:talkLanguage( Character.say, Player.english, "There you have a golem. Bring it back safely then you get your "..(Kaution/100).." silvercoins surety back.");
                    thisNPC:talkLanguage( Character.say, Player.german, "Wenn du \"bleib stehen\" sagst, bleibt der Golem stehen und du kannst ihn be- und entladen. Sagst du \"weiter\" folgt er dir wieder. Pass auf dass er dich nicht aus den Augen verliert." );
                    thisNPC:talkLanguage( Character.say, Player.english, "If you say \"stay\", the golem will stay where it is and you can give your things to the golem or take your things from him. If you say \"follow me\" the golem follows you again. Make sure you do not lose the golem." );
                    originator:setQuestProgress(8,1);
                    
                    Depot = originator:getDepot( originator.id );    
                    while Depot:takeItemNr( 0, 250 ) do
                    end;
                    
                end
            else
                thisNPC:talkLanguage( Character.say, Player.german, "Du hast nicht genug Geld. Ein Golem kostet "..PreisProKuh.." Kupferstücke und "..(Kaution/100).." Silberstücke müsst ihr als Kaution hinterlegen." );
                thisNPC:talkLanguage( Character.say, Player.english,"You don't have enough money. A golem costs "..PreisProKuh.." coppercoins and you have to pay "..(Kaution/100).." silvercoins as surety." );
            end
            return true
        else
            thisNPC:talkLanguage( Character.say, Player.german, "Du kontrollierst schon einen Golem. Mehr als einer geht nicht." );
            thisNPC:talkLanguage( Character.say, Player.english, "You allready control a golem. More then one is not possible." );
        end
        return true
    elseif ((string.find(message,"golem.+kaufen")~=nil) and not (string.find(message,"golem.+verkaufen")~=nil))
    or ((string.find(message,"kaufe.+golem")~=nil) and not (string.find(message,"verkaufe.+golem")~=nil))
    or (string.find(message,"buy.+golem"   )~=nil) then
            thisNPC:talkLanguage( Character.say, Player.german, "Ich verkaufe keine Golem. Ich beschwöre sie höchstens zum verleih." );
            thisNPC:talkLanguage( Character.say, Player.english, "I don't sell golem. I just summon them to borrow." );
    end
    return false
end

function returnCow(message, originator)
    message = string.lower( message );
    if (string.find(message,"golem.+zurück")~=nil)
    or (string.find(message,"golem.+verkaufen")~=nil)
    or (string.find(message,"verkaufe.+golem")~=nil)
    or (string.find(message,"sell.+golem")~=nil)
    or (string.find(message,"return.+golem")~=nil) then
        if (originator:getQuestProgress(8) == 0) then
            thisNPC:talkLanguage( Character.say, Player.german, "Du hast gar keinen Golem." );
            thisNPC:talkLanguage( Character.say, Player.english, "You do not even have a golem." );
        else
              npcs = world:getNPCSInRangeOf(thisNPC.pos,8);
            for i, npc in pairs(npcs) do
                find_transporter, effect_transporter = npc.effects:find(10);
                if find_transporter then
                    find_owner,value_owner = effect_transporter:findValue("owner");
                    if find_owner then
                        if (value_owner == originator.id) then
                            if world:deleteNPC( npc.id ) then
								thisNPC:talkLanguage( Character.say, Player.german, "#me wirft ein silbrig leuchtendes Pulver auf den Golem und er zerfällt zu Staub." );
                                thisNPC:talkLanguage( Character.say, Player.german, "Danke für den Golem." );
								thisNPC:talkLanguage( Character.say, Player.english, "#me thosses a silver-grey shimmering powder over the golem and he resolved into stone-dust." );
                                thisNPC:talkLanguage( Character.say, Player.english, "Thanks for the golem." );
                                originator:createItem(3077,math.floor(Kaution/100),333,0);
                                originator:setQuestProgress(8,0);
                                return true;
                            end
                        end
                    end
                end
            end
            thisNPC:talkLanguage( Character.say, Player.german, "Wo ist der Golem denn?" );
            thisNPC:talkLanguage( Character.say, Player.english, "Where is the golem?" );
        end
        return true;
    end
    return false;
end
            

function CheckMoney(User,Gold,Silber,Kupfer)
    local UserGold=User:countItem(61);
    local UserSilber=User:countItem(3077);
    local UserKupfer=User:countItem(3076);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local UserAmount=(UserGold*10000)+(UserSilber*100)+UserKupfer;
    if (Amount<=UserAmount) then
        return true
    else
        return false
    end
end

function Pay(User,Gold,Silber,Kupfer)    
    local GoldID=61;
    local SilberID=3077;
    local KupferID=3076;
    local PayGold=0;
    local PaySilber=0;
    local PayKupfer=0;
    local MissGold=Gold;
    local MissSilber=Silber;
    local MissKupfer=Kupfer;
    local UserGold=User:countItem(GoldID);
    local UserSilber=User:countItem(SilberID);
    local UserKupfer=User:countItem(KupferID);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local GoldAlsKupfer=0;
    local SilberAlsKupfer=0;
    local GoldAlsSilber=0;
    
    GoldAlsKupfer = math.min( MissGold, math.floor( UserKupfer/10000 ) );
    PayKupfer = GoldAlsKupfer * 10000;
    MissGold = MissGold - GoldAlsKupfer;
    UserKupfer = UserKupfer - PayKupfer;
    
    GoldAlsKupfer = math.floor( UserKupfer/100 );
    GoldAlsSilber = 100 - GoldAlsKupfer;
    if ((MissGold > 0) and (GoldAlsKupfer > 0) and (UserSilber >= GoldAlsSilber)) then
        PayKupfer = PayKupfer + 100 * GoldAlsKupfer;
        PaySilber = PaySilber + GoldAlsSilber;
        MissGold = MissGold - 1;
        UserKupfer = UserKupfer - 100 * GoldAlsKupfer;
        UserSilber = UserSilber - GoldAlsSilber;
    end;
    
    SilberAlsKupfer = math.min( MissSilber, math.floor( UserKupfer/100 ) );
    PayKupfer = PayKupfer + SilberAlsKupfer * 100;
    MissSilber = MissSilber - SilberAlsKupfer;
    UserKupfer = UserKupfer - SilberAlsKupfer * 100;
    
    if (UserKupfer >= MissKupfer) then
        PayKupfer = PayKupfer + MissKupfer;
    else
        MissSilber = MissSilber + 1;
        PayKupfer = PayKupfer + MissKupfer - 100;
    end;
    
    GoldAlsSilber = math.min( MissGold, math.floor( UserSilber/100 ) );
    PaySilber = PaySilber + GoldAlsSilber * 100;
    MissGold = MissGold - GoldAlsSilber;
    UserSilber = UserSilber - GoldAlsSilber * 100;
    
    if (UserSilber >= MissSilber) then
        PayGold = MissGold;
        PaySilber = PaySilber + MissSilber;
    else
        PayGold = MissGold + 1;
        PaySilber = PaySilber + MissSilber - 100;
    end;
    
        
    if (PayGold>0) then
        User:eraseItem(GoldID,PayGold);
    end
    if (PaySilber>0) then
        User:eraseItem(SilberID,PaySilber);
    elseif (PaySilber<0) then
        User:createItem(SilberID,PaySilber*(-1),333,0);
    end
    if (PayKupfer>0) then
        User:eraseItem(KupferID,PayKupfer);
    elseif (PayKupfer<0) then
        User:createItem(KupferID,PayKupfer*(-1),333,0);
    end
end

function CalcSilverCopper(CAmount)
    local GAmount=math.floor(CAmount/10000);
    local SAmount=math.floor((CAmount-GAmount*10000)/100);
    local CAmount=CAmount-(SAmount*100+GAmount*10000);
    return GAmount,SAmount,CAmount
end
