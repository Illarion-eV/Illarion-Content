--Script zum testen der Bestellungen für npc
--[[
module("npc.joachim_orderer", package.seeall, package.seeall("npc.base.orders", package.seeall))

function init()
    joachim_init = true;
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC.activeLanguage = 0;
    allok = false;
    myOrderNPC = npc.base.orders.OrderNPC:new();
    myOrderNPC.npc = thisNPC;
    myOrderNPC.generationTime={min=1,max=1};
    --npc.base.orders.OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
    --npc.base.orders.OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount)
    myOrderNPC.orderPool:addItemToPool(1,npc.base.orders.OrderPoolItem(1,1,150,2,10,1,5,40,30));
    myOrderNPC.orderPool:addItemToPool(1,npc.base.orders.OrderPoolItem(2,20,10,1,15,1,10,3,1));
    myOrderNPC.orderPool:addItemToPool(1,npc.base.orders.OrderPoolItem(3,10,100,2,10,1,3,30,12));
    --Qualität für Pool 1 ist immer 0
    myOrderNPC.orderPool:setQualityChancesForPool(1,{100,0,0,0,0,0,0,0,0,0});
    --gegenstände im pool 2
    myOrderNPC.orderPool:addItemToPool(2,npc.base.orders.OrderPoolItem(1,1,150,2,10,1,5,40,30));
    myOrderNPC.orderPool:addItemToPool(2,npc.base.orders.OrderPoolItem(2,20,10,1,15,1,10,3,1));
    myOrderNPC.orderPool:addItemToPool(2,npc.base.orders.OrderPoolItem(3,10,100,2,10,1,3,30,12));
    myOrderNPC.orderPool.poolchances = {90,10};
    --chances für qualitäten des pools 2
    myOrderNPC.orderPool:setQualityChancesForPool(2,{5,20,15,15,10,10,10,5,5,5});
end

function nextCycle()
    if ( joachim_init == nil) then
        init();
    end
    if ( myOrderNPC ~=nil) then
        myOrderNPC:nextCycle();
    end
   
end

function receiveText(texttype, message, originator)
    myOrderNPC:receiveText(originator,message);
    
end

function useNPC(user,counter,param)
    if ( myOrderNPC:checkOrder(user) == true ) then
        
    else
        thisNPC:talk(Character.say,"Lass mich in ruhe wenn du nichts für mich hast");
    end
end
	]]--
	
require("npc.base.orders");
module("npc.joachim_orderer", package.seeall, package.seeall(npc.base.orders))

function init()
    joachim_init = true;
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC.activeLanguage = 0;
    allok = false;
    myOrderNPC = npc.base.orders.OrderNPC:new();
    myOrderNPC.npc = thisNPC;
    myOrderNPC.generationTime={min=1,max=2}; --every 3 minutes a new order list
    --npc.base.orders.OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
    --npc.base.orders.OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount)
    myOrderNPC.orderPool:addItemToPool(1,npc.base.orders.OrderPoolItem(1,1,150,2,10,1,5,40,30));
    myOrderNPC.orderPool:addItemToPool(1,npc.base.orders.OrderPoolItem(2,20,10,1,15,1,10,3,1));
    myOrderNPC.orderPool:addItemToPool(1,npc.base.orders.OrderPoolItem(3,10,100,2,10,1,3,30,12));
    --Qualität für Pool 1 ist immer 0
    myOrderNPC.orderPool:setQualityChancesForPool(1,{100,0,0,0,0,0,0,0,0,0});
    --gegenstände im pool 2
    myOrderNPC.orderPool:addItemToPool(2,npc.base.orders.OrderPoolItem(1,1,150,2,10,1,5,40,30));
    myOrderNPC.orderPool:addItemToPool(2,npc.base.orders.OrderPoolItem(2,20,10,1,15,1,10,3,1));
    myOrderNPC.orderPool:addItemToPool(2,npc.base.orders.OrderPoolItem(3,10,100,2,10,1,3,30,12));
    myOrderNPC.orderPool.poolchances = {90,10};
    --chances für qualitäten des pools 2
    myOrderNPC.orderPool:setQualityChancesForPool(2,{5,20,15,15,10,10,10,5,5,5});
    
    myOrderNPC.orderPool.timemodifikators = { {90,110},{80,90},{65,80},{50,65},{30,50} };
    --myOrderNPC.orderPool.valuelossfortime = { {300,300},{200,400},{150,500},{100,600},{100,800} };
end

function nextCycle()
    if ( joachim_init == nil) then
        init();
    end
    if ( myOrderNPC ~=nil) then
        myOrderNPC:nextCycle();
    end
   
end

function receiveText(texttype, message, originator)
    myOrderNPC:receiveText(originator,message);
    
end

function useNPC(user,counter,param)
    if ( myOrderNPC:checkOrder(user) == true ) then
        
    else
        thisNPC:talk(Character.say,"Lass mich in ruhe wenn du nichts für mich hast");
    end
end
