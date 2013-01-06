-- General Testscript
require("handler.sendmessage")
require("base.common")
require("base.money")
require("base.factions")

-- UPDATE common SET com_script='test.martin' WHERE com_itemid = ID;

module("test.martin", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
	if User.lastSpokenText=="pay" then
		base.townTreasure.ChangeTownTreasure("Cadomyr",10000)
	end
	receiveGems(User)
end;



function receiveGems(gemRecipient)
	local yr=world:getTime("hour");
	local mon=world:getTime("minute"); --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
	local timeStmp=yr*1000+mon;
	gemRecipient:inform("time stmp = "..timeStmp);
	local town = base.factions.getMembershipByName(gemRecipient)
	town="Cadomyr";	 --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
	if town == "" then
		return;
	end	-- LASTSWITCH >> TIMESTAMP??
	-- first check if there was a switch already: 
	local fnd, lastSwitch = ScriptVars:find("SwitchedToPayment"..town)
	--fnd=1
	--lastSwitch=1
	if fnd then gemRecipient:inform("lastSwitch: = "..lastSwitch) end
	if fnd and tonumber(lastSwitch)<timeStmp then
		gemRecipient:inform("now switching!")
		base.townTreasure.NewMonthSwitch(town,timeStmp)
	end
	-- now check if last payment was before actual month and actual month is the one to pay out.
	lastGem=gemRecipient:getQuestProgress(124);
	if (lastGem~=nil) then
		gemRecipient:inform("last gem: "..lastGem)
		gemRecipient:inform("ts="..timeStmp.." lastSwitch="..lastSwitch.." lastGem="..lastGem)
		if timeStmp>=tonumber(lastSwitch) and tonumber(lastGem)<timeStmp then
			gemRecipient:setQuestProgress(124,timeStmp);
			gemRecipient:inform("Paying NOW! ")
			--payNow(gemRecipient)
		end
	else
		gemRecipient:setQuestProgress(124,timeStmp);
	end
end

function UseItemMartin( User, SourceItem, TargetItem, counter, Param, ltstate )
    taxFound,taxTotal=ScriptVars:find("taxTotal");
    payFound,payerCount=ScriptVars:find("payerCount");
    
    if taxFound then
        User:inform("Taxes paid so far: "..taxTotal)
    else
        taxTotal=0;
    end
    
    if payFound then
        User:inform("Taxpayers so far: "..payerCount)
    else
        return
    end
    
    ratio=taxTotal/payerCount;
    
end


function UseItemMartin2( User, SourceItem, TargetItem, counter, Param, ltstate )

--cadomyr = 101
--runewick = 102 
--galmair = 103
--gasthof = 104 (der ist aber unwichtig, da das keine stadt ist)
    
    taxHeight=0.1;  -- 10% taxes for testing purposes
    -- *** DEPOT-LIST HAS TO BE CHANGED ACCORDING TO FACTION MEMBERSHIP! ***
    depNr={101,104};
    valDepot={0,0};
    for i=1,2 do
        valDepot[i]=base.money.DepotCoinsToMoney(User,depNr[i]);
    end

    valBody=base.money.CharCoinsToMoney(User);
    val=valBody+valDepot[1]+valDepot[2];
    tax=math.floor(val*taxHeight);
    totTax=tax;
    
    -- try to get it from homedepot:
    if tax<=valDepot[1] then
        base.money.TakeMoneyFromDepot(User,tax,depNr[1]);
    elseif tax<=valDepot[2] then    -- if not possible, just take it from the pub-depot:
        base.money.TakeMoneyFromDepot(User,tax,depNr[2]);
    elseif tax<=valDepot[1]+valDepot[2] then    -- try both, for god's sake!
        base.money.TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        base.money.TakeMoneyFromDepot(User,tax,depNr[2]);
    else    -- last, but not least, get it from wherever you can!
        base.money.TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        base.money.TakeMoneyFromDepot(User,valDepot[2],depNr[2]);
        tax=tax-valDepot[2];
        base.money.TakeMoneyFromChar(User,tax);
    end
        
    gp,sp,cp=base.money.MoneyToCoins(totTax)
    infText="You have thereby paid your monthly tribut. This month, it were "..gp.." gold, "..sp.." silver and "..cp.." copper, which result from a tribute rate of "..(taxHeight*100).."%";

    local closeTrib=function(onClose)
    -- do nothing
    end

    local dialog=MessageDialog("Tribute information",infText,closeTrib);

    User:requestMessageDialog(dialog);

    -- *** TAX-VARIABLE HAS TO BE CHANGED ACCORDING TO FACTION MEMBERSHIP! ***
    taxFound,taxTotal=ScriptVars:find("taxTotal");
    payFound,payerCount=ScriptVars:find("payerCount");
    if taxFound then
        taxTotal=taxTotal+tax;
        ScriptVars:set("taxTotal",taxTotal);
    else
        ScriptVars:set("taxTotal",tax);
    end
    
    if payFound then
        ScriptVars:set("payerCount",payerCount+1);
    else
        ScriptVars:set("payerCount",1);
    end
    

end
