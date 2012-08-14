require("base.common")
require("base.factions");
module("base.orders", package.seeall)

--Welches Item ist ein Auftrag (Schriftrolle)
OrderItem = 3110;

--Wie viele minuten wird ein Char gesperrt wenn er zu viele offene Aufträge hat und einen neuen annehmen will
OrderRetentionPeriod = 5*60; --5 rl hours ig time retention period(8 was bit too high!)

--Um welchen Wert wird die Vertrauenswürdigkeit nach ablauf der Sperrfrist erhöht
ThrustworthynessChangeAfterRetentionPeriod = 5;

--Um welchen Wert wird die Vertrauenswürdigkeit nach annehmen eines neuen Auftrags vermindert
ThrustworthynessChangeAfterGetOrder = -5;

--Um welchen Wert wird die Vertrauenswürdigkeit erhöht wenn ein Auftrag innerhalb der normalen Zeit erfüllt wird.
ThrustworthynessChangeAfterSuccessOrder = 10;

--Um welchen Wert wird die Vertrauenswürdigkeit erhöht wenn ein Auftrag erfüllt wird aber zu spät ist oder die Qualitï¿½t nicht stimmt
ThrustworthynessChangeAfterNotSuccessOrder = 5;

--Untergrenze der Vertrauenswürdigkeit, hat ein char weniger vertrauenswürdigkeit wird eine Sperrfrist festegelegt. 
ThrustworthynessBorder = 10;

--Um welchen Wert wird der Wert fï¿½r Gute Aufträge erhöht wenn ein Auftrag innerhalb der normalen Zeit erfüllt wird.
GoodOrderChangeAfterSuccessOrder = 3;
--Um welchen Wert wird der Wert fï¿½r Gute Aufträge erhöht wenn ein Auftrag ï¿½berzogen wurde
GoodOrderChangeAfterNotSuccessOrder = -15;
--Um welchen Wert wird der Wert fï¿½r Gute Aufträge gesenkt nach einer Sperrfrist
GoodOrderChangeAfterRetentionPeriod = -50;




--Erzeugt ein item fï¿½r eine Bestellung
--@param itemid die id des zu liefernden items
--@param amount die anzahl der zu liefernden items
function OrderItemStruct(itemid, amount)
    return {id=itemid,count=amount};
end

function TimeStruct(nday,nmonth,nyear,nhour)
    return {day=nday,month=(nmonth-1),year=nyear,hour=nhour};
end


--gibt an wie stark die belohnung durch die Qualitï¿½t oder Zeit beeinflusst wird
--@param qualmod gibt an bei wieviel punkten eine beeinflussung stattfinden/fï¿½r Zeit bei wieviel Stunden
--@param value gibt den Wert an der zur bestellung hinzugefï¿½gt/subtrahiert wird.
--Bsp fï¿½r Quality: standardquality 300, Gold wï¿½rde es dafï¿½r 100 geben, geliefertes Item hat Quality 400
--     CoinsModStruct(50,20)
--     fï¿½r je 50 Punkte ï¿½ber 300 gibt es +20 mehr Geld
--     am Beispiel wï¿½re das +40 Geld da 400 = 2*50 es gï¿½be gesamt 140 Gold
--Bsp fï¿½r Zeit: auftrag 5 h zu spät, Gold wï¿½rde es 1000 Geben
--     CoinsModStruct(2,100)
--     fï¿½r je 2 Stunden ï¿½ber den Auftrag wï¿½rde 100 abgezogen werden
--     bei 5 Stunden sind das 200 weniger also noch 800 Gold.
function CoinsModStruct(qualmod,mvalue)
    return {mod=qualmod,value=mvalue}; 
end 

--[[
    ï¿½ndert den Vertrausenwürdigkeitsstatus eines Character
    prï¿½ft dabei die einhaltung der Grenzen 
    @param user der nutzer der geprï¿½ft werden soll
    @param ntwn der neue Vertrauenswürdigkeitswert
    @param ngoodorders der neue Wert fï¿½r Gute Aufträge
]]--
function setThrustWorthyness(user,ntwn,ngoodorders)
    local qp = user:getQuestProgress(61);
    --Vertrauenswürdigkeit herausmasken
    twn = LuaAnd(qp,255);
    --Lieferfï¿½higkeit herausmasken
    goodorders = LuaAnd(LuaRShift32(qp,8),255);
    if ( twn == 0 ) then
        twn = 50;
    end
    twn = twn + ntwn;
    twn = math.max(1,twn);
    twn = math.min(100,twn);
    goodorders = goodorders + ngoodorders;
    goodorders = math.max(1,goodorders);
    goodorders = math.min(100,goodorders);
    qp = 0;
    qp = LuaOr(qp,LuaLShift32(goodorders,8));
    qp = LuaOr(qp,twn);
    user:setQuestProgress(61,qp);
end

local function activateRetentionPeriod(user)
    local retentionperiod = LongTimeEffect(31,OrderRetentionPeriod * 600);
	user.effects:addEffect(retentionperiod);
end

local function checkRetentionPeriod(usr)
    local fnd, eff = usr.effects:find(31);
    return fnd;
end

--[[
    ï¿½ndert den Vertrausenwürdigkeitsstatus eines Character
    prï¿½ft dabei die einhaltung der Grenzen 
    @return Vertrauenswürdigkeit, Wert fï¿½r Gute Aufträge
]]--
local function getThrustWorthyness(user)
    local qp = user:getQuestProgress(61);
    --Vertrauenswürdigkeit herausmasken
    local twn = LuaAnd(qp,255);
    --Lieferfï¿½higkeit herausmasken
    local goodorders = LuaAnd(LuaRShift32(qp,8),255);
    if ( qp == 0 ) then
        twn = 50;
        user:setQuestProgress(61,twn);
    end
    return twn, goodorders;
end

OrderState = { NormalOrder = 0};

OrderNPC =
{
    --der NPC
    npc = nil,
    --Text der allgemein ausgegeben wird um zu zeigen das ein NPC einen auftrag hat
    textOrderSay = { ger="",eng=="" },
    --Zeit in der textOrderSay einmal ausgegeben wird.
    timeOrderSay = {min=5,max=15},
    --Aktueller zyklus fï¿½r ausgabe des/der Texte.
    timeOrderCycle = -1,
    --Text der ausgegeben wird falls ein Auftrag erfolgreich angenommen wird
    textGetOrder = {ger = "", eng = ""},
    --Text der ausgegeben wird falls versucht wird ein Auftrag zu verwenden der nicht von diesen NPC ist
    textFalseNPC = {ger = "", eng = ""},
    --Text der ausgegeben wird wenn nicht alle Items vorhanden sind
    textNoItems = {ger = "", eng = ""},
    --Text der ausgegeben wird wenn eine Teillieferung wirklich geliefert wird.
    textGetSomeItems = {ger = "", eng = ""},
    --Text der ausgegeben wird wenn nur ein paar Items vorhanden sind
    textSomeItems = {ger="",eng=""},
    --Text der ausgegeben wird falls nur die Qualitï¿½t unter der geforderten ist
    textQualityLess ={ger = "", eng = ""},
    --Text der ausgegeben wird falls die Zeit ï¿½berschritten wurde.
    textTimeOver = {ger = "", eng = ""},
    --Text der ausgegeben wurde falls beides ï¿½berschritten wurde (Qualitï¿½t und Zeit)
    textBoth = {ger = "", eng = ""},
    --Text wenn alles Ok ist
    textOk = {ger= "", eng = ""},
    --Text wenn auftrag ausgelï¿½st wird aber nicht alles ok war
    textNotOk = { ger = "", eng = ""},
    --Text wenn jemand ein Bonus bekommt
    textBoni = { ger = "", eng = ""},
    --Trigger um Aufträge dieses NPC's an zu schauen
    triggerSeeOrder={},
    triggerGetOrder={},
    --Text der ausgegeben wird wenn der Char eine Sperrfrist hat
    textRetentionPeriod = {ger = "", eng = ""},
    --Text der ausgegeben wird wenn der Char nicht Vertrauenswï¿½rdig ist und eine Sperrfrist bekommen
    textNotThrustworthy = {ger = "", eng = ""},
    --String fï¿½r den letzten Auftrag um zu ermitteln ob wirklich verkauft werden soll oder nur neuer Preis verhandelt wurde
    lastOrderString = "",
    --Aktueller Zyklus
    lastOrderCycle = 0,
    --Liste mit allen aktuell offenen Aufträgen
    openOrders = {},
    --Liste zur erstellung mï¿½glicher Aufträge
    orderPool = {},
    --Maximale Anzahl an offenen Aufträgen (Sofern diese erreicht wird wird der erste Auftrag in openOrders gelï¿½scht um einen neuen zu generieren)
    maxOpenOrders =0,
    --In wievielen Minuten wird ein neuer auftrag generiert
    generationTime = { min = 10, max=20 },
    --Weiviele Zyklen wurde kein Auftrag generiert
    generationCycle = -1,
    --Boniliste Dabei ist jeder Eintrag fï¿½r je 10 Punkte im "Gute Aufträge" Wert. Min, Max ergeben den Bonus im % zum erfüllten Auftrag
    --Boni fï¿½r Wert [0-10]       [10-20]       [20-30]       [30-40]
    bonilist = { {min=0,max=0},{min=0,max=5},{min=5,max=8},{min=6,max=12},{min=8,max=15},{min=10,max=20},{min=14,max=25},{min=18,max=28},{min=20,max=30},{min=20,max=35}},
    curCycle = 0
};





function OrderNPC:new( onpc )
    onpc = onpc or {};
    setmetatable( onpc, self);
    self.__index = self; --Inherit from nothing only point to my own functions
    onpc.npc = nil;
    onpc.textOrderSay = { {ger="Ich habe einen Auftrag anzubieten.",eng="I have one order."},{ger="Ich habe %d Aufträge anzubieten",eng="I have %d orders!"} };
    onpc.timeOrderSay = {min=5,max=15};
    onpc.timeOrderCycle = -1;
    onpc.textFalseNPC.ger = "Was soll das! Der Ist nicht von mir!";
    onpc.textFalseNPC.eng = "Hey, this contract isn't from me!";
    onpc.textNoItems.ger = "Komm wieder wenn du etwas für mich hast!";
    onpc.textNoItems.eng = "Come again if you have something for me!";
    onpc.textSomeItems.ger = "Wenigstens schon etwas. Du kannst das hier lassen und den Rest holen!";
    onpc.textGetSomeItems.ger = "Danke. Bring mir den Rest so bald wie möglich!";
    onpc.textGetSomeItems.eng = "Thanks. Bring me the remaining wares as soon as possible!";
    onpc.textSomeItems.eng = "At least something. You can leave it here and get the remaining wares!";
   -- onpc.textSomeItems.eng = "Come again if you have something for me!";
    onpc.textQualityLess.ger = "Das ist ja nur minderwertige Ware, dafür bekommst du nur %d Gold %d Silber und %d Kupfer!";
    onpc.textQualityLess.eng = "This isn't the Quality I wanted, you only get %d gold %d silver and %d Copper for it!";
    onpc.textTimeOver.ger = "Du bist zu spät dran, daher zahle ich nur %d Gold %d Silber und %d Kupfer.";
    onpc.textTimeOver.eng = "You are too late. I pay only %d gold %d silver %d copper for that!";
    onpc.textBoth.ger = "Zu spät und auch noch minderwertige Ware, na Warte mehr als %d Gold %d Silber und %d Kupfer kriegst du nicht!";
    onpc.textBoth.eng = "To late and awful quality, you won't get more than %d gold %d silver %d copper!";
    onpc.textNotOk.ger = "Naja... was solls! Hier hast du das Geld!";
    onpc.textNotOk.eng = "Hmm... it's ok, here is the money!";
    onpc.textOk.ger = "Das schaut gut aus, hier ist deine Belohnung!";
    onpc.textOk.eng = "That looks good, here is your reward!";
    onpc.textGetOrder.ger = "Hier ist der Auftrag, pass auf das alles rechtzeitig fertig wird!";
    onpc.textGetOrder.eng = "Here is my order. I hope you deliver it in time!";
    onpc.textRetentionPeriod.ger = "Meine Kollegen haben mir gesagt das du gerne mal Aufträge vergisst oder nicht ordentlich lieferst, von mir kriegst du keinen Auftrag!"
    onpc.textRetentionPeriod.eng = "My partners told me that you forget the orders often, or you delivered shabby wares, you won't get an order from me! ";
    onpc.textNotThrustworthy.ger = "Hmmm... du scheinst dich nicht wirklich um deine Aufträge zu kümmern. Von mir kriegst du nichts!";
    onpc.textNotThrustworthy.eng = "Hmmm... It seems that you aren't interested in fullfilling your orders. You won't get a new one from me!";
    onpc.textBoni.ger = "Hier, hast du was Extra. Da du immer so gute Lieferungen tätigst.";
    onpc.textBoni.eng = "Here, you get something extra, because you did a good job.";
    onpc.lastOrderString="";
    onpc.lastOrderCycle = 0;
    onpc.triggerSeeOrder = { ".*[Aa]uftrag.+(%d+).+[Aa]nsehen.*",".*[Ss]ee.+[Oo]rder.+(%d+).*",".*[Aa]uftrag.+(%d+).+sehen.*",".*[Au]ftr[äa][ge][eg].*","[Oo]rder.*", };
    onpc.triggerGetOrder = { ".*[Aa]uftrag.+(%d+).+[Aa]nnehmen.*",".*[Gg]et.+[Oo]rder.+(%d+).*", ".*[Aa]uftrag.+(%d+).+[Ll]iefern.*",".*[Dd]eliver.+[Oo]rder.+(%d+).*",".*[Aa]uftrag.+(%d+).+[Hh]aben.*",".*[Hh]ave.+[Oo]rder.+(%d+).*",".*[Aa]uftrag.+(%d+).+[Nn]ehmen.*",".*[Tt]ake.+[Oo]rder.+(%d+).*" };
    onpc.openOrders = {};
    onpc.orderPool = OrderPool:new();
    onpc.maxOpenOrders = 5;
    onpc.generationTime = { min = 10, max=20 };
    onpc.generationCycle = -1;
    onpc.bonilist = { {min=0,max=0},{min=0,max=5},{min=5,max=10},{min=8,max=15},{min=10,max=20},{min=15,max=30},{min=20,max=35},{min=25,max=40},{min=30,max=50},{min=40,max=70}};
    return onpc;
end    

--[[
    lï¿½sst den NPC einmal irgend einen text aus textOrderSay sagen
    ]]--
function OrderNPC:talkOrder()
    local count = table.getn(self.openOrders);
    if ( count ~= 1 ) then
        --eine Liste von listen daher einen eintrag aus der liste zufï¿½llig auswï¿½hlen
        local rand = math.random(table.getn(self.textOrderSay)-1);
        local text = self.textOrderSay[rand+1];
        local ger = string.format(text.ger,count);
        local eng = string.format(text.eng,count);
        if ( self.npc ~= nil ) then
            base.common.TalkNLS(self.npc,Character.say,ger,eng);
        end
    else
        local text = self.textOrderSay[1];
        local ger = string.format(text.ger,table.getn(self.openOrders));
        local eng = string.format(text.eng,table.getn(self.openOrders));
        if ( self.npc ~= nil ) then
            base.common.TalkNLS(self.npc,Character.say,text.ger,text.eng);
        end
    end
end

--[[
    listet für den npc alle wichtigen daten auf
    ]]--
function OrderNPC:showStats(who) 
   local text = "Open orders: "..table.getn(self.openOrders).." time min: "..self.generationTime.min.." max: "..self.generationTime.max.." next (1/10s): "..self.generationCycle;
   who:inform(text);
   self.orderPool:inform(who);
end

function getNumberInString(thestring)
    local a,b,value = string.find(thestring,"(%d+)");
    return tonumber(value);
end

function OrderNPC:receiveText(who,text)
    if ( who:isAdmin() ) then
        if ( text == "generate order" ) then
            self:createOrder();
        elseif ( text == "show stats" ) then
            self:showStats(who);
        elseif ( text == "thrustworthyness" ) then
            twn, go = getThrustWorthyness(who);
            who:inform("twn: "..twn.." go: "..go);
        elseif ( string.find(text,"set twn.+(%d+)") ) then
            local numb = getNumberInString(text);
            setThrustWorthyness(who,numb,0);
            who:inform("twn: "..numb);
        elseif ( string.find(text,"set twn.+-(%d+)") ) then
            local numb = getNumberInString(text);
            setThrustWorthyness(who,0-numb,0);
            who:inform("twn: -"..numb);
        elseif ( string.find(text,"set go.+(%d+)") ) then
            local numb = getNumberInString(text);
            setThrustWorthyness(who,0,numb);
            who:inform("go: "..numb);
        elseif ( string.find(text,"set go.+-(%d+)") ) then
            local numb = getNumberInString(text);
            setThrustWorthyness(who,0,0-numb);
            who:inform("go: "..numb);        
        end
    end
    
    local number = -1;
    for i, ttext in pairs(self.triggerGetOrder) do
        if ( string.find(text,ttext) ) then
            number = getNumberInString(text);
            if ( number ~= nil ) then
                if ( number <= 0 or number > table.getn(self.openOrders) ) then
                    base.common.TalkNLS(self.npc,Character.say,"Ich habe nur "..table.getn(self.openOrders).." Aufträge!","I only have "..table.getn(self.openOrders).." orders!");
                else
                    local twn, go = getThrustWorthyness(who);
                    --schon eine Sperrfrist dann einfach den Text der Sperrfrist ausgeben
                    if ( checkRetentionPeriod(who) ) then
                        base.common.TalkNLS(self.npc,Character.say,self.textRetentionPeriod.ger,self.textRetentionPeriod.eng);
                    --Vertrauenswürdigkeit ausreichend?
                    elseif ( twn < ThrustworthynessBorder ) then
                        base.common.TalkNLS(self.npc,Character.say,self.textNotThrustworthy.ger,self.textNotThrustworthy.eng);
                        activateRetentionPeriod(who);
                    --alles ok, den Auftrag erzeugen
                    else
                        local order = self.openOrders[number];
                        order:setTime();
                        if ( order:createOrderItem(who) ) then
                            base.common.TalkNLS(self.npc,Character.say,self.textGetOrder.ger,self.textGetOrder.eng);
                            setThrustWorthyness(who,ThrustworthynessChangeAfterGetOrder,0);
                            base.common.InformNLS(who, "[Neues Quest] Bringe Ihm die verlangten Waren innerhalb der im Vertrag vorgegebenen Zeit.", "[New quest] Bring him the demanded wares within the given time of the contract.");
                            table.remove(self.openOrders,number);
                        end
                    end
                end
            end
            return;
        end
    end
	for i, ttext in pairs(self.triggerSeeOrder) do
        if ( string.find(text,ttext) ) then
            number = getNumberInString(text);
            local ordercount = table.getn(self.openOrders)
            if ( number ~= nil ) then
                if ( number <= 0 or number > ordercount ) then
                    if ( ordercount == 0 ) then
                        base.common.TalkNLS(self.npc, Character.say,"Ich habe keinen Auftrag!","I don't have any orders!");
                    elseif (ordercount == 1 ) then
                        base.common.TalkNLS(self.npc, Character.say,"Ich habe nur einen Auftrag!","I only have one order!");
                    else
                        base.common.TalkNLS(self.npc, Character.say,"Ich habe nur "..ordercount.." Aufträge!","I only have "..ordercount.." orders!");
                    end
                else
                    local order = self.openOrders[number];
                    order:setTime();
                    base.common.InformNLS(who,"Dieser Auftrag enthält:", "This order contains:");
                    who:inform(order:lookAt(who));
                end
            else
                if ( ordercount == 0 ) then
                    base.common.TalkNLS(self.npc, Character.say,"Ich habe keinen Auftrag!","I don't have any orders!");
                elseif (ordercount == 1 ) then
                    base.common.TalkNLS(self.npc, Character.say,"Ich habe einen Auftrag.","I have one order.");
                    local order = self.openOrders[1];
                    order:setTime();
                    base.common.InformNLS(who,"Dieser Auftrag enthält:", "This order contains:");
                    who:inform(order:lookAt(who));
                else
                    base.common.TalkNLS(self.npc, Character.say,"Welchen der "..table.getn(self.openOrders).." Aufträge möchtest du sehen?","Which one of the "..table.getn(self.openOrders).." orders do you want to see?");
                end
            end
            return;
        end
    end
end

function OrderNPC:addOrder( neworder )
    table.insert(self.openOrders,neworder);
end

function OrderNPC:createOrder()
    local oocount = table.getn(self.openOrders);
    if ( oocount >= self.maxOpenOrders ) then
        --ï¿½ltesten Eintrag lï¿½schen wenn mehr Aufträge als erlaubt da sind 
        table.remove(self.openOrders,1);
    end
    --Auftrag aus liste generieren
    local order = self.orderPool:generateOrder();
    
    --name des NPC's eintragen
    order.npcname = self.npc.name;
    --In liste mit offenen Aufträgen einfï¿½gen
    table.insert(self.openOrders,order);
end

--[[
neuer Zyklus für den NPC (ggf vergessen wann ein Auftrag das letzte mal verwendet wurde)
]]--
function OrderNPC:nextCycle()
    --Prï¿½fen ob ein Auftrag vergesen werden soll
    if ( self.lastOrderString:len() > 0 ) then
        --einen neuen auftrag
        self.lastOrderCycle=self.lastOrderCycle+1;
        if ( self.lastOrderCycle >= 600 ) then
            self.lastOrderString = "";
            self.lastOrderCycle = 0;
        end
    end
    --Prï¿½fen ob ein neuer Auftrag erzeugt werden soll.
    if ( self.generationCycle <= 0 ) then
        self:createOrder();
        self.generationCycle = math.random(self.generationTime.min,self.generationTime.max)*600;
    end
    if ( self.timeOrderCycle <= 0 ) then
        self:talkOrder();
        self.timeOrderCycle = math.random(self.timeOrderSay.min,self.timeOrderSay.max)*600;
    end
    self.generationCycle = self.generationCycle - 1;
    self.timeOrderCycle = self.timeOrderCycle - 1;
end


--[[
    Zahlt einen Bonus aufgrund einer gut ausgefï¿½hrten Bestellung
]]--
function OrderNPC:payBoni(user,order) 
    --user:inform("payBoni");
    local twn,boni = getThrustWorthyness(user);
    --user:inform("twn: "..twn.." bonival: "..boni);
    local pos = math.min(math.floor(boni/10) + 1,9);
    local bon = base.common.NormalRnd2(self.bonilist[pos].min,self.bonilist[pos].max,3);
    --bonus anhand der mï¿½nzen berechnen
    bon = math.floor(order.coins * (bon/100));
    --user:inform("bon: "..bon);
    if ( bon > 0 ) then
        local orderstruct = order:checkOrder(user,self.npc);
        local gold, silver, copper = CoinsToGSC(order:recalcPrice(orderstruct));
        local GoldID=61;
        local SilberID=3077;
        local KupferID=3076;
        user:createItem(KupferID,copper,333,0);
        user:createItem(SilberID,silver,333,0);
        user:createItem(GoldID,gold,333,0);
        base.common.TalkNLS( self.npc, Character.say, self.textBoni.ger, self.textBoni.eng );
    end
   -- give some rankpoints as reward
   if NpcLocation[thisNPC.id] == nil then
   		base.factions.setLocation(thisNPC);
   end
   local Factionvalues = base.factions.get(user);
   
	Factionvalues[ DigitToIndex[NpcLocation[thisNPC.id]+RANKPOINTS_OFFSET] ]= 
		     Factionvalues[ DigitToIndex[NpcLocation[thisNPC.id]+RANKPOINTS_OFFSET] ] +5;--add 5 rankpoints for this town
	
	base.factions.put(user,Factionvalues);
	------------------
    --user:inform("payboni end");
end

--[[
fï¿½hrt eine Bestellung zu einem Auftrag aus.
@param user der Charakter der geprï¿½ft werden soll
@return true wenn user ein auftragsitem in den hï¿½nden hat
]]--
function OrderNPC:checkOrder(user)
    local order = Order:getInHandForNPC(user,thisNPC);
    if ( order == nil ) then 
        return false;
    else
        local orderstruct = order:checkOrder(user,self.npc);
        if ( orderstruct.rightnpc == false ) then
            base.common.TalkNLS( self.npc, Character.say, self.textFalseNPC.ger, self.textFalseNPC.eng );
            return true;
        end
        if ( orderstruct.allItems == false ) then
            if ( orderstruct.someItems == false ) then
                base.common.TalkNLS( self.npc, Character.say, self.textNoItems.ger, self.textNoItems.eng );
                return true;
            else
                --einige der Items im Inventar 
                if ( self.lastOrderString ~= order:getDataString() ) then
                    --es ist noch nie versucht worden eine teillieferung zu veranlassen
                    order:partDelivery(user,orderstruct);
					base.common.TalkNLS( self.npc, Character.say, self.textSomeItems.ger, self.textSomeItems.eng );
                    self.lastOrderString = order:getDataString();
                    return true;
                else
                    --wir wollen eine Teillieferung.
                    order:partDelivery(user,orderstruct);
                    base.common.TalkNLS( self.npc, Character.say, self.textGetSomeItems.ger, self.textGetSomeItems.eng );
                    self.lastOrderString = "";
                    return true;
                end
            end
            
        end
        --Korrekt ausgefï¿½hrter Auftrag, diesen ausfï¿½hren  
        if ( orderstruct.intime == true and orderstruct.inquality == true ) then
            --ausfï¿½hren der Bestellung
            order:doOrder(user,orderstruct);
            base.common.TalkNLS( self.npc, Character.say, self.textOk.ger, self.textOk.eng );
            --Da eine gute Bestellung getï¿½tigt wurde, evtl einen Bonus auszahlen.
            self:payBoni(user,order);
            return true;
        end
        --user:inform("doorder time: "..tostring(orderstruct.intime).." qual: "..tostring(orderstruct.inquality));
        --user:inform("doorder timeover: "..tostring(orderstruct.hours).." qualover: "..tostring(orderstruct.quality));
        --user:inform("lastorderstring: "..self.lastOrderString.." orderstring: "..order:getDataString());
        if ( self.lastOrderString == order:getDataString() ) then
            --zweiter versuch einen auftrag ein zu lï¿½sen innerhalb von 60 sekunden, wirklich verkaufen
            order:doOrder(user,orderstruct);
            base.common.TalkNLS( self.npc, Character.say, self.textNotOk.ger, self.textNotOk.eng );
            return true;
        end 
        local ger = "";
        local eng = "";
        local gold = 0;
        local silver = 0;
        local copper = 0;
        --erster versuch auftrag zu lï¿½sen daher nur neuen Preis nennen
        if ( orderstruct.intime == false and orderstruct.inquality == false ) then
            --neuer preis berechnen
            gold, silver, copper = CoinsToGSC(order:recalcPrice(orderstruct));
            ger = string.format(self.textBoth.ger,gold,silver,copper);
            eng = string.format(self.textBoth.eng,gold,silver,copper);
            base.common.TalkNLS( self.npc, Character.say, ger, eng );
            self.lastOrderString = order:getDataString();
            return true;
        end
        if ( orderstruct.intime == false and orderstruct.inquality == true ) then
            --neuer preis berechnen
            gold, silver, copper = CoinsToGSC(order:recalcPrice(orderstruct));
            ger = string.format(self.textTimeOver.ger,gold,silver,copper);
            eng = string.format(self.textTimeOver.eng,gold,silver,copper);
            base.common.TalkNLS( self.npc, Character.say, ger, eng );
            self.lastOrderString = order:getDataString();
            return true;
        end
        if ( orderstruct.intime == true and orderstruct.inquality == false ) then
            --neuer preis berechnen
            gold, silver, copper = CoinsToGSC(order:recalcPrice(orderstruct));
            ger = string.format(self.textQualityLess.ger,gold,silver,copper);
            eng = string.format(self.textQualityLess.eng,gold,silver,copper);
            base.common.TalkNLS( self.npc, Character.say, ger, eng );
            self.lastOrderString = order:getDataString();
            return true;
        end
        return true;
    end
end



--Definition der Werte eines Basisauftrages
Order = 
{
    --der Gegenstand welcher der auftrag ist
    orderitem = nil,
    state = OrderState.NormalOrder,
    --Items die zum auftrag gehï¿½ren (maximal 3)
    --immer aus listen von OrderItems
    items={},
    --in wieviel Stunden relativer Zeit die bestellung getï¿½tigt sein muss
    reltime = {},
    --Wann die Bestellung abgeliefert werden soll als Ordertime
    time = {},
    --Welche Qualitï¿½t wird erwartet bei den Items
    quality = 3,
     --Wieviel mï¿½nzen gibts für den Auftrage
    coins = 0,
    --Wieviele Mï¿½nzen gibts minimal für diesen Auftrag
    mincoins = 0,
    --Wie stark wird der Auftrag durch quality beeinflusst
    --ist ein QualityModCoinsStruct
    qualitymodcoins=CoinsModStruct(0,0),
    --Wie stark wird der Auftrag durch Zeit beeinflusst
    timemodcoins=CoinsModStruct(0,0),
    npcname = "",
    curquality = 0,
}

function Order:addItem( it )
    table.insert(self.items, it);
end
    
function Order:new( bo )
    bo = bo or {};
    setmetatable( bo, self);
    self.__index = self; --Inherit from nothing only point to my own functions
    bo.orderitem = nil;
    bo.state = OrderState.NormalOrder; --Order 3 Bit + 3 Bit wieviel Items enthalten sind
    bo.items = {}; --Item = 16 Bit id und 8 Bit Anzahl
    bo.time = TimeStruct(0,0,0,0); --Order: 17  5 Bit Tag, 4 Bit Monat, 8 Bit Jahr
    bo.quality = 3; --Order: 4 Bit da nur 100 er stelle für Quality wichtig ist 
    bo.qualitymodcoins = CoinsModStruct(0,0); --Modnumber 4 Bit für den qualmod und 10 Bit für den Betragsmod
    bo.timemodcoins = CoinsModStruct(0,0); --Modnumber 8 Bit für den stundenmod und 10 Bit für den Betrag
    bo.coins = 0;
    bo.mincoins = 0;
    bo.npcname = "";
    bo.reltime = 0;
    bo.curquality = 0;
    return bo;
end

--[[ 
    Erzeugt ein auftrag aufgrund eines ï¿½bergebenen items
    @return null wenn der item kein entsprechendes richtige item war ansonsten den auftrag zum item
    ]]--
function Order:fromItem(item)
    local itemval = item:getValue(1);
    if ( string.len(itemval) > 0 ) then
        local order = Order:new();
        order.orderitem = item;
        if ( order:get() ) then
            return order;
        end
    end
    return nil;
end 





function OrderStateStruct()
    return {
        --besitzt der Char einige Items
        someItems = false,
        --besitzt der Character alle Items
        allItems = false,
        --liste aller items
        itemlist = {},
        --Auftrag innerhalb der Zeit
        intime = false,
        --Wieviel Zeit ï¿½berfï¿½llig oder zu zeitig
        hours = 0,
        --Auftrag innerhalb der Qualitï¿½t
        inquality = false,
        --wieviel unter oder ï¿½berhalb der vorgegeben qualitï¿½t sind wir
        quality = 0,
        --ist der NPC der richtige
        rightnpc = false;
    };
    
end

--[[
    Liefert  einen Auftrag aufgrund eines character indem
    geprï¿½ft wird ob der Character irgendwo ein Auftragsitem hat
    und dieses ausgewertet wird.
    @return Item welches ein Auftrag ist oder nil wenn kein Auftrag vorhanden
]]--
function Order:getInHand(Character)
    local item = Character:getItemAt( Character.right_tool );
    local data = "";
    if ( item.id == OrderItem ) then
        data = item:getValue(1);
    end
    if ( item.id ~= OrderItem or data:len()<=0) then
        item = Character:getItemAt( Character.left_tool );
        data = item:getValue(1);
    end
    if ( item.id == OrderItem and data:len()>0 ) then
        local order = Order:new();
        order.orderitem = item;
        if ( order:get() ) then
            return order;
        end
    end
    return nil;
end

--[[
    Liefert  einen Auftrag aufgrund eines character der zu einen bestimmten npc gehï¿½rt
    geprï¿½ft wird ob der Character irgendwo ein Auftragsitem hat
    und dieses ausgewertet wird.
    @return Item welches ein Auftrag ist oder nil wenn kein Auftrag vorhanden
]]--
function Order:getInHandForNPC(Character,npc)
    local item = Character:getItemAt( Character.right_tool );
    if ( item.id == OrderItem ) then
        local data = item:getValue(1);
        if ( data:len() > 0 ) then
            local order = Order:new();
            order.orderitem = item;
            if ( order:get() ) then
                if ( order.npcname == npc.name) then
                    return order;
                end
            end
        end
    end
    local item = Character:getItemAt( Character.left_tool );
    if ( item.id == OrderItem ) then
        local data = item:getValue(1);
        if ( data:len() > 0 ) then
            local order = Order:new();
            order.orderitem = item;
            if ( order:get() ) then
                if ( order.npcname == npc.name) then
                    return order;
                end
            end
        end
    end
    
    for i=12,17 do --checks the whole belt
		local item = Character:getItemAt( i );
	    if ( item.id == OrderItem ) then
	        local data = item:getValue(1);
	        if ( data:len() > 0 ) then
	            local order = Order:new();
	            order.orderitem = item;
	            if ( order:get() ) then
	                if ( order.npcname == npc.name) then
	                    return order;
	                end
	            end
	        end
	    end
    end
    return nil;
end

--setzt die konkrete Zeit damit nicht mit offset werden gearbeitet wird
function Order:setTime()
    --stunden timestmap
    local curtime = world:getTime("illarion")/3600;
	--offset aufaddieren
    curtime = curtime + self.reltime;
    local year,month,day,hour,minute,second = base.common.TimestampToDate(curtime*3600);
    self.time.day = day;
    self.time.month = month-1;
    self.time.year = year;
    self.time.hour = hour;
end

--[[
    Erzeugt ein Auftragitem mit den entsprechenden Werten
    @param Character der Character bei dem der Auftrag erzeugt werden soll
    @return true wenn der Auftrag erzeugt werden konnte
]]--
function Order:createOrderItem(Character)
    
    scriptitem = Character:getItemAt( Character.right_tool );
    if ( scriptitem.id ~= 0 ) then
        scriptitem = Character:getItemAt( Character.left_tool);
    end
    for i=12,17 do --checks the whole belt
		if ( scriptitem.id ~= 0 ) then
		    scriptitem = Character:getItemAt(i);
		end
	end
	if ( scriptitem.id ~= 0 ) then 
        base.common.InformNLS(Character,"Du brauchst eine freie Hand um einen Auftrag anzunehmen.","You need a free hand to get a contract.");
        return false;
    end
   scriptitem.count = 1;
   scriptitem.id = OrderItem;
   scriptitem.quality = 300;
   self.orderitem = scriptitem;
   --self.time = 
   --local data = self:toDataString();
   --scriptitem:setValue(1,data);
   self:set();
   world:changeItem(scriptitem);
   return true;
end

--Prï¿½ft ob ein Char alle Items besitzt welche zum lieferumfang
--des Auftrags gehï¿½ren und liefert den Status des Auftrags zurï¿½ck. 
--@param Character der Character dessen Inventory geprï¿½ft werden soll
--@npc der NPC mit dem der Handel geprï¿½ft werden soll
--@return die durchschnittsabweichung von der Qualitï¿½t, eine Liste mit den Auftragsitems oder null wenn die Items nicht vorhanden waren
function Order:checkOrder(Character,npc)
    ret = OrderStateStruct();
    --items = {}
    --Werte für durchschnittsberechnung
    local allcount = 0;
    local curquali = self.curquality;
    --wenn schon eine qualitï¿½t aus vorhergehenden Werten vorhanden ist dann schon 1 als vorgabewert eingehen lassen
    if ( curquali > 0 ) then 
        allcount = 1;
    end;
    if ( self.npcname == npc.name ) then
        ret.rightnpc = true;
    end
    ret.allItems = true;
    ret.someItems= false;
    for i,item in pairs(self.items) do    
        local itemlist = Character:getItemList(item.id);
		--nach qualitï¿½t sortieren
        table.sort(itemlist, function(itema,itemb) return (itema.quality > itemb.quality); end);
			
        local curcount = 0;
        --durch alle items iterieren
        for y,charitem in pairs(itemlist) do
            --irgend ein eintrag vorhanden also haben wir mindestens ein paar items
            --ret.someItems = true; --DOES NOT WORK BECAUSE getItemList IS BUGGED!!!
            --wenn schon genï¿½gend items geprï¿½ft die Schleife abbrechen
            if ( curcount >= item.count) then
                break;
            end
            --berechnung der durchschnittsqualitï¿½t
            curquali = curquali + math.floor(charitem.quality/100);
            allcount = allcount + 1;
            --Item in rï¿½ckgabemenge einfï¿½gen
            table.insert(ret.itemlist,charitem);
            curcount = curcount + charitem.number;
        end
        if ( curcount < item.count ) then
            ret.allItems = false;
        end
        if Character:countItem(item.id) > 0 then
        	ret.someItems=true;
		end
        
    end
    averquali = math.floor((curquali / allcount) + 0.5);
    --durchschnittsqualitï¿½t vergleichen.
    if ( averquali >= self.quality ) then
        ret.inquality = true;
        ret.quality = averquali - self.quality;
    else
        ret.inquality = false;
        ret.quality = self.quality - averquali;
    end
 --[[
    --Zeit prï¿½fen
    local year = world:getTime("year");
    local month = world:getTime("month");
    local day = world:getTime("day");
    local hour = world:getTime("hour");
    --liefert normalen timestamp daher noch * 3 bevor die stunden abgezogen werden
    local curhours = math.floor(world:getTime("illarion") / 3600);
    --]]
    local curhours = math.floor(base.common.GetCurrentTimestamp() / 3600); --holds the current time as Timestamp
    
    --liefert ig timestamp 
    local orderhours = math.floor(base.common.GetCurrentTimestampForDate(self.time.year,self.time.month+1,self.time.day,self.time.hour,0,0) / 3600);
    if ( curhours > orderhours ) then
        ret.intime = false;
        ret.hours = curhours - orderhours;
    else
        ret.intime = true;
        ret.hours = orderhours - curhours;
    end
    return ret;
end


--konvertiert Preise in Gold,Silber,Kufer
--@return gold,silver,kupfer anteil von coins
function CoinsToGSC(coins)
    local gold = math.floor(coins/10000);
    local rest = coins%10000;
    local silver = math.floor(rest/100);
    local copper = rest%100;
    return gold,silver,copper;
end

local function removeItems(itemid,itemcount,itemlist,char)
    local curcount = 0;
    local cnt = 0;
    --tabelle nach position sortieren, hï¿½chste zuerst damit von hinten nach vorne gelï¿½scht wird
    table.sort(itemlist, function(itema,itemb) return (itema.itempos > itemb.itempos); end);
    for i,listitem in pairs(itemlist) do
        if ( curcount >= itemcount ) then
            return;
        end
        if ( listitem.id == itemid ) then
            cnt = listitem.number;
            if ( cnt > (itemcount-curcount) ) then
                cnt = (itemcount-curcount);
            end
            world:erase(listitem,cnt);
            curcount = curcount + cnt;
        end
    end
    
end


--Teillieferung veranlassen
function Order:partDelivery(character,orderstatestruct)
    --character:inform("teillieferung start");
    local toremove = {};
    local itemdeleted = false;
    --alle Items der Teillieferung lï¿½schen
    --tabelle nach position sortieren, hï¿½chste zuerst damit von hinten nach vorne gelï¿½scht wird
    table.sort(orderstatestruct.itemlist, function(itema,itemb) return (itema.itempos > itemb.itempos); end);
    for i,item in pairs(self.items) do
        --character:inform("teillieferung 1 n:"..table.getn(orderstatestruct.itemlist));
        for y,item2 in pairs(orderstatestruct.itemlist) do
            --character:inform("teillieferung 2 :"..item.id.. "=="..item2.id.."c:"..item.count.." i2 numb: "..item2.number );
            --gleiches item suchen
            if ( item.id == item2.id ) then
                item.count = item.count - item2.number;
                if ( item.count <= 0 ) then
                    --letzten teil lï¿½schen
                    world:erase(item2,item2.number + item.count);
                    table.insert(toremove,i);
                else
                    --gesamten stack lï¿½sche
                    world:erase(item2,item2.number);
                end
                itemdeleted=true;
            end
        end
        if itemdeleted then
			break; -- one item type collected, use npc again for the other items
		end
    end
    --lï¿½schen aller fertigen items
    for i,del in ipairs (toremove) do
        table.remove(self.items,del);
    end
    self:set();
    --character:inform("teillieferung send");
    --schon gelieferte Qualitï¿½t setzen
    self.curquali = orderstatestruct.quality;
end


--Fï¿½hrt eine Bestellung aus indem beim Character entsprechende Items gelöscht werden 
--und dannach entsprechende Belohnungen generiert werden.
function Order:doOrder(character,orderstatestruct)
    local price = self:recalcPrice(orderstatestruct);
    local gold,silver,copper = CoinsToGSC(price);
    local GoldID=61;
    local SilberID=3077;
    local KupferID=3076;
    character:createItem(KupferID,copper,333,0);
    character:createItem(SilberID,silver,333,0);
    character:createItem(GoldID,gold,333,0);
    --Auftrag selbst löschen
    if ( self.orderitem ~= nil ) then
        world:erase(self.orderitem,1);
    end
    --alle items löschen
    for i,oitem in pairs(self.items) do
        removeItems(oitem.id, oitem.count,orderstatestruct.itemlist,character);
    end
    --Vertrauenswürdigkeit erhï¿½hen
    if ( orderstatestruct.intime and orderstatestruct.inquality ) then
        --Wert für gut erfüllten auftrag.
        setThrustWorthyness(character,ThrustworthynessChangeAfterSuccessOrder,GoodOrderChangeAfterSuccessOrder);
    else
        --Wert für schlecht erfüllten auftrag.
        setThrustWorthyness(character,ThrustworthynessChangeAfterNotSuccessOrder,GoodOrderChangeAfterNotSuccessOrder);
    end
	base.common.InformNLS(character, "[Quest gelöst] Du erhälst "..price.." Kupferstücke.", "[Quest solved] You are awarded "..price.." copper coins.")
end



function Order:recalcPrice(orderstatestruct)
    local fromquali = 0;
    local fromtime = 0;
    if ( orderstatestruct.intime == false ) then
        --nicht innerhalb der geforderten Zeit
        fromtime = math.floor(orderstatestruct.hours/self.timemodcoins.mod)*self.timemodcoins.value;
    end
    if ( orderstatestruct.inquality == false ) then
        --nicht innerhalb der geforderten Qualitï¿½t
        fromquali = math.floor(orderstatestruct.quality/self.qualitymodcoins.mod)*self.qualitymodcoins.value;
    end
    return math.max(self.mincoins,(self.coins - (fromtime + fromquali)));
end



--Codiert alle Daten in einen String welcher die Daten interprï¿½tiert und 
--Speichert diese im item
function Order:set()
--Order ist 32 Bit und enthält, 3 Bit (Type), 3 Bit (anzahl items), 4 Bit (Qualitï¿½t), 5 Bit (Tag), 4 Bit (monat), 8 Bit Jahr.
    if (self.orderitem ~= nil ) then
        self.orderitem:setValue(1,self:getDataString());
        world:changeItem(self.orderitem);
        return true;
    else 
        return false;
    end
end

function Order:getDataString()
    local retstring = "";
    local order = LuaLShift32(LuaAnd(tonumber(self.state),7),29);  --nur 3 Bit stehen lassen und nach links shiften
    if ( self.items ~= nil) then 
        order = LuaOr(order,LuaLShift32(LuaAnd(table.getn(self.items),7),26)); --Anzahl der Items auf 3 Bit beschrï¿½nken und links shiften
    end
    order = LuaOr(order,LuaLShift32(LuaAnd(self.quality,15),22)); --Qualitï¿½t auf 4 Bit beschrï¿½nken und nach links shiften
    order = LuaOr(order, LuaLShift32(LuaAnd(self.time.day,31),17)); --Tag auf 5 Bit beschrï¿½nken und nach links shiften.
    order = LuaOr(order,LuaLShift32(LuaAnd(self.time.month,15),13)); --Tag auf 4 Bit beschrï¿½nken und nach links shiften.
    order = LuaOr(order,LuaLShift32(LuaAnd(self.time.year,255),5)); --Jarh auf 8 Bit beschrï¿½nken und nach links shiften.
    order = LuaOr(order,LuaAnd(self.time.hour,31)); -- Stunde in den letzten 5 Bit codieren
    retstring = tostring(order);
    local coins = self.coins;
    retstring = retstring .. "," .. tostring(coins);
    local coinsmod = 0;
    coinsmod = LuaLShift32(LuaAnd(tonumber(self.qualitymodcoins.mod),15),28);
    coinsmod = LuaOr(coinsmod,LuaLShift32(LuaAnd(self.qualitymodcoins.value,1023),18));
    coinsmod = LuaOr(coinsmod,LuaLShift32(LuaAnd(self.timemodcoins.mod,255),10));
    coinsmod = LuaOr(coinsmod,LuaAnd(self.timemodcoins.value,1023));
    retstring = retstring .. "," ..tostring(coinsmod);
    local npcname = self.npcname;
    retstring = retstring .. "," ..npcname;
    local curquali = self.curquality;
    retstring = retstring .. "," .. curquali;
    for i,item in ipairs(self.items) do    
        local itemnr = 0;
        itemnr = LuaLShift32(item.id, 8);
        itemnr = LuaOr(itemnr,LuaAnd(item.count,255));
        retstring = retstring .. "," .. tostring(itemnr);
    end
    return retstring;
end

function Order:get()
    if ( self.orderitem == nil ) then
        return false;
    else
        local datastring = self.orderitem:getValue(1);
        --split datastring beim ,
        local fields = base.common.split(datastring,",");
        local order = tonumber(fields[1]);
        local coins = tonumber(fields[2]);
        local coinsmod = tonumber(fields[3]);
        local npcname = fields[4];
        local curquali = tonumber(fields[5]);
        table.remove(fields,1);
        table.remove(fields,1);
        table.remove(fields,1);
        table.remove(fields,1);
        table.remove(fields,1);
        --order
        self.type = LuaRShift32(order,29);
        local itemcount = LuaAnd(LuaRShift32(order,26),7); --unnï¿½tige Werte herausshiften und letzten 3 Bit maskieren
        self.quality = LuaAnd(LuaRShift32(order,22),15); --nach rechts shifte und 4 Bit maskieren
        self.time.day = LuaAnd(LuaRShift32(order,17),31); --nach rechts shiften und 5 Bit Maskieren
        self.time.month = LuaAnd(LuaRShift32(order,13),15);--nach rechts shiften und 4 Bit maskieren
        self.time.year = LuaAnd(LuaRShift32(order,5),255);--nach rechts shiften und 8 Bit maskieren
        self.time.hour = LuaAnd(order,31);
        --coins
        self.coins = coins;
        --npc
        self.npcname = npcname;
        --curquali
        self.curquality = curquali;
        --coinsmod
        self.qualitymodcoins.mod = LuaRShift32(coinsmod,28);
        self.qualitymodcoins.value = LuaAnd(LuaRShift32(coinsmod,18),1023);
        self.timemodcoins.mod = LuaAnd(LuaRShift32(coinsmod,10),255);
        self.timemodcoins.value = LuaAnd(coinsmod,1023);
        --items
        self.items = {};
        for i,numberstr in pairs(fields) do
            local number = tonumber(numberstr);
            local itemid = LuaRShift32(number,8);
            local nitemcount = LuaAnd(number,255);
            table.insert(self.items,OrderItemStruct(itemid,nitemcount));
        end
        return true;
    end
end

QualityText = { {ger = "furchtbar",eng = "horrible"}, 
                {ger = "schrecklich",eng = "awful"},
                {ger = "very bad",eng = "very bad"},
                {ger = "schlecht",eng = "bad" },
                {ger = "mäßig", eng = "average"},
                {ger = "normal",eng = "normal"},
                {ger = "gut", eng = "good"},
                {ger = "sehr gut", eng = "very good"},
                {ger = "exzellent", eng = "excellent"},
                {ger = "perfekt",eng = "perfect"}, 
              };

MonthNames = { "Elos", "Zahnos", "Thas", "Ushos", "Siros", "Ronas" , "Bras", "Eldas" , "Irmas", "Malas", "Findas" , "Olos", "Adras", "Naras", "Chos", "Mas"};
                
function Order:lookAt(Char)
    local text = "";
    local gerhour="";
    local enghour="";
    local ItemAmount;
    local RemainingHours;
	gerhour,enghour = base.common.Hour_To_String(self.time.hour);
    if (Char:getPlayerLanguage() == 0) then --deutsch
        text = "Auftrag von "..self.npcname.." ï¿½ber ";
        for key,item in pairs(self.items) do
            if item.id~=0 and item.count~=0 then --don't include the Item "nothing"
				if item.count<10 then
				    ItemAmount = getDigitName(item.count,0);
				else
					ItemAmount = item.count;
				end
				
				text = text .. ItemAmount .. " " .. world:getItemName(item.id,0) .. ", ";
			end
        end
        if (self.quality+1)>6 then --ask for quality only if the NPC wants good wares or better
			text = text .. " mit mindestens " .. QualityText[self.quality+1].ger.." Qualitï¿½t";
		end
        
		if ( self.orderitem ~= nil ) then
            RemainingHours = ConvertDateToHourOffset(self.time.year, self.time.month+1, self.time.day, self.time.hour);
		    text = text .. " abzuliefern in " ..RemainingHours .. " Stunden";
			--text = text .. ", abzuliefern am " .. self.time.day .. "." .. MonthNames[self.time.month+1] .. "." .. self.time.year .. " " .. gerhour;
        else		
		    text = text .. " abzuliefern in " ..self.reltime .. " Stunden";
        end
        g,s,c = CoinsToGSC(self.coins);
        if g == 0 then
			text = text .. " für " .. s .. " Silber und " .. c .. " Kupfermünzen."; 
		else
			text = text .. " für " .. g .. " Gold " .. s .. " Silber und " .. c .. " Kupfermünzen.";
		end  
        if ( Char:isAdmin() ) then
            text = text .. " Wertverlust Zeit: " .. self.timemodcoins.value .. " Kupfer in " ..self.timemodcoins.mod.." Stunden,"
            text = text .. " Wertverlust Qualität: "..self.qualitymodcoins.value .. " Kupfer pro "..self.qualitymodcoins.mod.." Qualität." 
        end
        return text;
    else --english
        text = "Contract from "..self.npcname.." over ";
        for key,item in pairs(self.items) do
            if item.id~=0 and item.count~=0 then --don't include the Item "nothing"
            	if item.count<10 then
				    ItemAmount = getDigitName(item.count,1);
				else
					ItemAmount = item.count;
				end
            	text = text .. ItemAmount .. " " .. world:getItemName(item.id,1) .. ",";
            end
        end
        if (self.quality+1)>6 then --ask for quality only if the NPC wants good wares or better
        	text = text .. " of at least " .. QualityText[self.quality+1].eng.." quality";
        end
        if ( self.orderitem ~= nil ) then
            RemainingHours = ConvertDateToHourOffset(self.time.year, self.time.month+1, self.time.day, self.time.hour);
			text = text .. " to deliver in " ..RemainingHours.." hours";
		--    text = text .. ", to deliver at " .. self.time.day .. "." .. MonthNames[self.time.month+1] .. "." .. self.time.year .. " " .. enghour;
        else
            text = text .. " to deliver in " ..self.reltime.." hours";
        end    
        g,s,c = CoinsToGSC(self.coins);
        if g == 0 then
			text = text .. " for " .. s .. " silver and " .. c .. " copper coins."; 
		else
        	text = text .. " for " .. g .. " gold " .. s .. " silver and " .. c .. " copper coins."; 
		end  
        if ( Char:isAdmin() ) then
            text = text .. " Valueloss time: " .. self.timemodcoins.value .. " copper in " ..self.timemodcoins.mod.." hours,"
            text = text .. " Valueloss quality: "..self.qualitymodcoins.value .. " copper per "..self.qualitymodcoins.mod.." quality." 
        end
        return text;
    end
end

--[[
    Erzeugt ein Gegenstand in einen Auftragspool
    @param nid id des Gegenstandes
    @param nnumber Menge der gegenstï¿½nde auf der sich der price und die Zeit bezieht
    @param nprice der nosrmale Preis für diesen Gegensant.
    @param ntime die Zeit in der diese Gegenstï¿½nde normalerweise gefertigt werden.
    @param nchance chance das dieser Gegenstand in einen Auftrag aufgenommen wird.
    @param mincount die minimal Anzahl an gegenstï¿½nden 
    @param maxcount die maximale Anzahl an gegenstï¿½nden
    @param mincoins die minimale anzahl an münzen die man für diesen gegenstand bekommt.
    Hinweis: mincount, maxcount bezieht sich auf nnumber d.h. mincount 5 bei nnumber = 10... d.H. minimal 50
             nprice, ntime bezieht sich auf 1 gegenstand der menge nnumber und wird ï¿½ber die tatsï¿½chliche Anzahl
             aufmultipliziert
    ]]--
function OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
    ret =  {
        id = nid,
        number = nnumber,        
        price = nprice,
        time = ntime,
        chance = nchance,
        mincount = nmincount,
        maxcount = nmaxcount,
        mincoins = nmincoins
    };
    if ( ret.id == nil ) then 
        ret.id = 0;
        ret.number = 0;
        ret.price = 0;
        ret.time = 0;
        ret.nchance = 0;
        ret.mincount = 0;
        ret.maxcount = 0;
        ret.mincoins = 0;
    end
    if ( ret.price < 1 ) then ret.price = math.floor (ret.price+0.5) end --round up or down
    if ( ret.mincoins < 1) then ret.mincoins = math.floor (ret.mincoins+0.5) end --round up or down
    return ret;
end
    
-- Ein Auftragspool
OrderPool = 
{
    --pool mit auftragsitems nach schwierigkeitsstufen eingeordnet
    pool = {},
    --chance das ein auftrag aus einen bestimmten pool generiert wird
    poolchances = {},
    --Chance für die Dringlichkeit der Aufträge 
    timechances = {},
    --Chance für die Qualität der Aufträge
    qualitychances = {},
    --Chancen für die Anzahl der Items (0-3)
    countchances = {},
    --Modifkatoren für den Zeitfaktor
    timemodifikators = {},
    --Modifikatoren für die münzen
    coinsmodifikators = {},
    --Modifkatoren für den Werteverlust bei nichteinhaltung der Zeit
    valuelossfortime = {},
    --Modifikatoren für den Werteverlust bei nichteinhaltung der Qualität
    valuelossforquality = {}
};

--Typen der Dringlichkeit eines auftrages
TimeTypes = { NORMAL=0,HASTY=1,URGENT=2,VERY_URGENT=3,INSTANT=4 };

--Zeitmodifkikatoren: linker wert ist min Zeitwert, rechts max: 0.9,1.1 Bedeutet das Die Zeit von 90%-110% der normalen Zeit liegt
--Bei einer Zeit von 10h also zwischen 9-11 h
--                NORMAL    HASTY     URGENT  VERY_URGENT INSTANT              
TimeModTable = { {90,110},{80,90},{65,80},{50,65},{30,50} };
CoinsModTable = { {80,115},{90,115},{100,130},{120,170},{130,200} };
--Wie groï¿½ ist der Werteverlust nach bestimmter Zeit die beiden Zahlen bedeuten
--links: Nach wieviel Prozent der Stunden, rechts: wird welche Wert (in prozent) verloren.
--Bsp.: Auftrag in 10h Wert 100 für die Werte {20,50}->nach 12 h ist der Auftrag nur noch 50 Wert. Nach 14 h gar nichts mehr.
--Dabei ist die kleinste Zeit immer 1 h... d.H. {1,100} wï¿½rde fast immer bedeuten das bei ï¿½berziehung des Auftrags hinterher kein
--Gewinn abgegeben wï¿½rde. Bzw. nur der mindestgewinn.
ValueLossTimeTable = { {30,30},{20,40},{15,50},{10,60},{10,80} };
--Wertverlust je Qualitätspunkt unter dem Geforderten {1,20} Wert wird um 20 % vermindert je 1 Qualitätspunkt weniger. 
--Bei geforderter Qualität von 6 und gelieferter Qualität von 4 = 40 % weniger Geld. 
ValueLossQualityTable = { 1,20 }

--[[
    Erzeugt einen neuen Auftragspool mit items
]]--
function OrderPool:new( op )
    math.randomseed( world:getTime("illarion") );
    op = op or {};
    setmetatable( op, self);
    self.__index = self; --Inherit from nothing only point to my own functions
    --pool[0] mï¿½ssen immer Qualitätslose items sein
    op.pool = {};
    op.poolchances = {};
    --chancen für NORMAL,HASTY,URGENT,VERY_URGENT,INSTANT
    op.timechances = { 35,30,20,10,5 };
    --chancen für dabei benï¿½tigt jeder pool seine eigene liste aus je 10 Werten wobei der gesamtwert der 
    --list immer 100 ergeben muss: {Qualitätslos,Qualität 1, Qualität 2,...,Qualität 9}.
    op.qualitychances = {};
    --chancen Aufträge mit einer bestimmten itemanzahl zu erstellen ( 1 item, 2 items, 3 items)
    op.countchances = {20,50,30};
    --modifkatoren auf standard setzen
    op.timemodifikators = TimeModTable;
    op.coinsmodifikators = CoinsModTable;
    op.valuelossfortime = ValueLossTimeTable;
    op.valuelossforquality = ValueLossQualityTable;
    return op;
end

--[[
    kalkuliert einen Wert aus einer Liste von chance
    @param chancelist liste aus chancen die ï¿½bergeben wird
    @param lmax der Wert aller chancen aufaddiert
    @return ein konkreter aus der liste ausgewï¿½hlter wert, anhand der chancen kalukuliert
    ]]--

local function chanceToNumber(chancelist,lmax,notreuse)
    --printerr("chanceToNumber:"..lmax);
    if ( notreuse ) then
        for pos,_ in pairs(notreuse) do
            --printerr("   "..pos.." not reuse";
            lmax = lmax - chancelist[pos];
        end
    end
    --printerr("lmax: "..lmax);
    local curval = math.random(lmax);
    for i,cval in ipairs(chancelist) do
        --wenn wir einen wert finden der nicht wiederverwendet werden soll diesen ignorieren
        if ( notreuse and notreuse[i] ) then
        --normaler wert der verwendet werden kann
        else
            curval = curval - cval;
            if ( curval <= 0 ) then
                return i; 
            end
        end
    end
    return nil;
end


--[[
    Fï¿½gt ein item an einen Auftragspool hinzu
    @param pool die Id des pools zu dem der auftrag hinzu gefï¿½gt werden soll
           dabei ist 0 ein Pool der nur Items enthält die keine Qualität benï¿½tigen
           1 sehr leichte Items die jeder noob herstellen kï¿½nnte. 2 Schwerere gegenstï¿½nde ....
    @param orderpoolitem der gegenstand der den pool hinzu gefï¿½gt werden soll
]]--    
function OrderPool:addItemToPool(tpool,orderpoolitem)
    if ( self.pool[tpool] == nil ) then
        self.pool[tpool] = {};
    end
    table.insert(self.pool[tpool],orderpoolitem);
end

function OrderPool:setQualityChancesForPool(tpool,chanceslist)
    self.qualitychances[tpool] = chanceslist;
end

function OrderPool:inform(who)
    who:inform("chances for times: "..self.timechances[1].."%,"..self.timechances[2].."%,"..self.timechances[3].."%,"..self.timechances[4].."%,"..self.timechances[5].."%");
    who:inform("chances for itemcount 1:"..self.countchances[1].."% 2:"..self.countchances[2].."% 3: "..self.countchances[3].."%");
    for i,pool in pairs(self.pool) do
        who:inform("Information for pool("..i..") chance:"..self.poolchances[i].." qualitychances: "..self.qualitychances[i][1].."% ,"..self.qualitychances[i][2].."% ,"..self.qualitychances[i][3].."% ,"..self.qualitychances[i][4].."% ,"..self.qualitychances[i][5].."% ,"..self.qualitychances[i][6].."% ,"..self.qualitychances[i][7].."% ,"..self.qualitychances[i][8].."% ,"..self.qualitychances[i][9].."% ,"..self.qualitychances[i][10].."%");
        for y, item in pairs(self.pool[i]) do
            who:inform("    Item("..item.id.." basicnumber: "..item.number.." price: "..item.price.." minprice: "..item.mincoins.." chance: "..item.chance.." min: "..item.mincount.." max: "..item.maxcount);
        end
    end
end

--[[
    Erzeugt einen Auftrag aufgrund der chancen
]]--
function OrderPool:generateOrder()
    --Position des pools
    local tpool = chanceToNumber(self.poolchances,100);
    --anzahl der items
    local itemcount = chanceToNumber(self.countchances,100);
    --Qualität (-1 da listen mit 1 anfangen aber keine Qualität = 0 bedeutet)
    local quality = chanceToNumber(self.qualitychances[tpool],100) - 1;
    local timechances = chanceToNumber(self.timechances,100);
    --Der konkrete Pool
    local poolForItem = self.pool[tpool];
    --kalkulieren der chancen für items
    local itemchances = {};
    local maxchance = 0;
    if ( poolForItem ~= nil ) then
        for i,poolitem in pairs(poolForItem) do
            table.insert(itemchances,poolitem.chance);        
            maxchance = maxchance + poolitem.chance;
        end
    end
    local timefororder = 0;
    local payfororder = 0;
    local itemsfororder = {};
    local notreuselist = {};
    if ( poolForItem ~= nil ) then
        for i = 1,itemcount do
            --Prï¿½fen ob ï¿½berhaupt noch ein item erzeugt werden kann
            if ( itemchances[1] ~= nil ) then
                --eine id aus der liste wï¿½hlen
                local poolitem = chanceToNumber(itemchances,maxchance,notreuselist);
                --reine Fehlerkorrektur fals wirklich mal nil gezogen wird.
                --if ( poolitem == nil ) then 
                --    poolitem = 1;
                --end
                --verhindern das das gleiche item erneut gezogen wird. indem es in die "nicht nochmal benutzen" liste eingefï¿½gt wird
                notreuselist[poolitem] = true;
                --hinzufï¿½gen des gezogenen items zum auftrag
                table.insert(itemsfororder, poolForItem[poolitem]);
            else
                break;
            end
        end
    end
    --in itemsfororder sind nun 1-3 items daraus jetzt einen auftrag generieren.
    --gesamtzeit des auftrags, gesamtwert des auftrags
    local ordertime=0;
    local ordercoins=0;
    local ordermincoins=0;
    for i,item in pairs(itemsfororder) do
        item.concretenumber = math.random(item.mincount,item.maxcount);
        
		if item.concretenumber>5 and item.concretenumber<50 then --modification part of the item number to get only orders for 1,2,3,4,5,10,15,...
			item.concretenumber = item.concretenumber/5;
			item.concretenumber = 5* math.floor(item.concretenumber+0.5);
		elseif item.concretenumber>50 and item.concretenumber<100 then
			item.concretenumber = item.concretenumber/10;
			item.concretenumber = 10* math.floor(item.concretenumber+0.5);
		elseif item.concretenumber>100 then
			item.concretenumber = item.concretenumber/50;
			item.concretenumber = 50* math.floor(item.concretenumber+0.5);
		end	
        
        ordertime = ordertime + (item.time * item.concretenumber);
        ordercoins = ordercoins + (item.price * item.concretenumber);
        ordermincoins = ordermincoins + (item.mincoins * item.concretenumber);
    end
    ordertime = base.common.Round(ordertime * (base.common.NormalRnd2(self.timemodifikators[timechances][1],self.timemodifikators[timechances][2],3)/100));
    ordercoins = base.common.Round(ordercoins * (base.common.NormalRnd2(self.coinsmodifikators[timechances][1],self.coinsmodifikators[timechances][2],3)/100));
    --Neuen Auftrag generieren
    local order = Order:new();
    --gegenstï¿½nde einfï¿½gen
    for i,item in pairs(itemsfororder) do
        table.insert(order.items,OrderItemStruct(item.id,item.concretenumber*item.number));
    end
    order.reltime = ordertime;
    --eintrag aus der tabelle für Wertverlust durch zeit holen
    local timeloss = self.valuelossfortime[timechances];
    order.coins = ordercoins;
    order.timemodcoins = CoinsModStruct(math.ceil(ordertime*(timeloss[1]/100)),math.ceil(ordercoins*(timeloss[2]/100)));
    if ( tpool == 1 or concretequality == 0) then 
        order.quality = 0;
    else
        order.quality = quality;
        order.qualitymodcoins = CoinsModStruct(self.valuelossforquality[1],math.ceil(ordercoins*(self.valuelossforquality[2]/100)));
    end
    order.mincoins = ordermincoins;
    return order;
end

function getDigitName(number,lang) --returns a digit from 0-9 as text

if number<10 then
	if not InitDigitNames then
		InitDigitNames = true;
		digit_de = {"eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun"};
		digit_de[0] = "null";
		digit_eng ={"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
		digit_eng[0] = "zero";
	end
	
	if lang == 0 then
		return digit_de[number];
	else
		return digit_eng[number];
	end
end

end

function ConvertDateToHourOffset(year, month, day, hour)
	DeliverTimestamp = (year*365+(month-1)*24+day)*24+hour;
	curHourTimestamp = (world:getTime("year")*365+(world:getTime("month")-1)*24+world:getTime("day"))*24+world:getTime("hour");
	HoursTillInvalidOrder = DeliverTimestamp - curHourTimestamp;  
	return HoursTillInvalidOrder;
end		
		
