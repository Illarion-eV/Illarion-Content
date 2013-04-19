--INSERT INTO npc VALUES (nextval('npc_seq'),2,126,575,0,4,false,'Darsys Silvershaper','npc_darsys_silvershaper.lua',1);
--Location: Cadomyr workshop outside
--Task: Offers big orders for Tailoring(NOT ALL TAILORABLE ITEMS INCLUDED)
--Skill 0-30 (easy), 30-60(middle hard), 60-100(difficult items)

require("base.orders");
require("npc.base.autonpcfunctions");
module("npc.darsys_silvershaper", package.seeall);


function init()
    darsys_init = true;
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC.activeLanguage = 0;
    initializeNpc(); --initialize talk list
    allok = false;
    myOrderNPC = base.orders.OrderNPC:new();
    myOrderNPC.npc = thisNPC;
    myOrderNPC.generationTime={min=1,max=3}; --every 1-10 minutes a new order gets created
    --npc.base.orders.OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
  
   
   --Pool 1(Tailoring easy items):
    AddItemToPool(1,myOrderNPC, 802,1,15, 1,15);--grey dress
    AddItemToPool(1,myOrderNPC, 806,1,15, 1,15);--white dress
    AddItemToPool(1,myOrderNPC, 805,1,15, 1,15);--black dress
    AddItemToPool(1,myOrderNPC, 385,1,15, 1,15);--blue dress (easy one)  
    AddItemToPool(1,myOrderNPC, 843,1,15, 1,15);--red white skirt
    AddItemToPool(1,myOrderNPC, 809,1,15, 1,15);--grey doublet
    AddItemToPool(1,myOrderNPC, 820,1,15, 1,15);--white tunic
	--chances for qualities of pool 1 
    myOrderNPC.orderPool:setQualityChancesForPool(1,{100,0,0,0,0,0,0,0,0,0}); 
	
   --Pool 2(Tailoring middle hard items):
    AddItemToPool(2,myOrderNPC, 830,2,15, 1,10);--grey hat with feather
    AddItemToPool(2,myOrderNPC, 832,2,15, 1,10);--red hat with feather    
    AddItemToPool(2,myOrderNPC, 828,2,15, 1,10);--blue hat with feather
    AddItemToPool(2,myOrderNPC, 850,2,15, 1,10);--Grey Heraldic Dress
    AddItemToPool(2,myOrderNPC, 848,2,15, 1,10);--Yellow Green Heraldic Dress
    AddItemToPool(2,myOrderNPC, 846,2,15, 1,10);--Blue Red Heraldic Dress
    AddItemToPool(2,myOrderNPC, 815,2,15, 1,10);--yellow tunic

	--chances for qualities of pool 2 
    myOrderNPC.orderPool:setQualityChancesForPool(2,{80,0,0,0,0,0,10,5,3,2}); 
	--myOrderNPC.orderPool:setQualityChancesForPool(4,{5,20,15,15,10,10,10,5,5,5});

   --Pool 3(Tailoring more middle hard items):
    AddItemToPool(3,myOrderNPC, 814,2,15, 1,10);--blue tunic
    AddItemToPool(3,myOrderNPC,  48,2,15, 1,10);--leather gloves
    AddItemToPool(3,myOrderNPC, 526,2,15, 1,10);--Studded Leather Gloves    
    AddItemToPool(3,myOrderNPC, 365,3,15, 1,10);--Half Leather Armour
    AddItemToPool(3,myOrderNPC, 363,3,15, 1,10);--Leather scale Armour
	--chances for qualities of pool 3 
    myOrderNPC.orderPool:setQualityChancesForPool(3,{80,0,0,0,0,0,10,5,3,2});
	
   --Pool 4(Tailoring more easy items):
    AddItemToPool(4,myOrderNPC, 803,1,15, 1,15);--green dress
    AddItemToPool(4,myOrderNPC, 836,1,15, 1,15);--black green dress
    AddItemToPool(4,myOrderNPC, 805,1,15, 1,15);--black dress
    AddItemToPool(4,myOrderNPC, 838,1,15, 1,15);--black white dress
    AddItemToPool(4,myOrderNPC, 835,1,15, 1,15);--black yellow dress(heavy one)
	--chances for qualities of pool 4 
    myOrderNPC.orderPool:setQualityChancesForPool(4,{80,0,0,0,0,0,10,5,3,2});
	
   --Pool 5(Tailoring difficult items):
    AddItemToPool(5,myOrderNPC, 358,1,15, 1,10);--red wizard hat
    AddItemToPool(5,myOrderNPC, 357,1,15, 1,10);--Blue wizard hat
    AddItemToPool(5,myOrderNPC, 370,2,15, 1,10);--Colourful Wizard Hat
    AddItemToPool(5,myOrderNPC, 371,1,15, 1,10);--Expensive Wizard Hat
    AddItemToPool(5,myOrderNPC, 527,2,15, 1,10);--Serinjah Leather Gloves
    AddItemToPool(5,myOrderNPC, 364,3,15, 1,10);--Light Hunting Armour
    AddItemToPool(5,myOrderNPC,2377,2,15, 1,10);--Red Mage Robe
    AddItemToPool(5,myOrderNPC, 195,1,15, 1,10);--Yellow Robe
	myOrderNPC.orderPool:setQualityChancesForPool(5,{80,0,0,0,0,0,10,5,3,2});

   --Pool 6(Tailoring more difficult items):
    AddItemToPool(6,myOrderNPC,2416,2,15, 1,10);--Brown Priest Robe
    AddItemToPool(6,myOrderNPC, 193,2,15, 1,10);--Blue Robe
    AddItemToPool(6,myOrderNPC,2380,2,15, 1,10);--Blue Coat
    AddItemToPool(6,myOrderNPC, 558,4,15, 1,10);--Master Mage Robe
    AddItemToPool(6,myOrderNPC,2113,4,15, 1,10);--Fur Trousers
    AddItemToPool(6,myOrderNPC, 698,4,15, 1,10);--Serinjah Leather Boots
	myOrderNPC.orderPool:setQualityChancesForPool(6,{80,0,0,0,0,0,10,5,3,2});


	--chances for every pool
	myOrderNPC.orderPool.poolchances = {17,17,16,17,17,16};
	
	--chances for the order urgency: NORMAL,HASTY,URGENT,VERY_URGENT,INSTANT
	myOrderNPC.orderPool.timechances = { 40,30,20,5,5 };
	
    --myOrderNPC.orderPool.timemodifikators = { {9,11},{8,9},{7,9},{5,7},{3,5} };
    --myOrderNPC.orderPool.valuelossfortime = { {300,300},{200,400},{150,500},{100,600},{100,800} };
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();
	mainNPC = npc.base.basic.baseNPC();
	local talkingNPC = npc.base.talk.talkNPC(mainNPC);

	
    -- ********* START DYNAMIC PART ********
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reetings","Be greeted!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", one of Cadomyrs order traders!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything, but I have delivery orders at which you could help me.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Be well.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","I don't buy anything, but I have delivery orders at which you could help me.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    npc.base.autonpcfunctions.AddTraderTrigger("I'm .+","I am "..thisNPC.name..". Nice to meet you!");

    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]r[üu][ßs]+","Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalText("Grüße");
    npc.base.autonpcfunctions.AddTraderTrigger("[Dd]u.+[Hh]ändler","Ich bin "..thisNPC.name..", einer der Großauftragshändler Cadomyrs!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe nichts, aber ich habe Lieferaufträge bei denen du mir helfen könntest.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Auf Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Kk]auf","Ich kaufe nichts, aber ich habe Lieferaufträge bei denen du mir helfen könntest.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*?","Ich werde "..thisNPC.name.." genannt.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]ch.+bin","Schön dich kennen zu lernen! Ich bin "..thisNPC.name..".");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;
	mainNPC:setEquipment(3, 852);
	mainNPC:setEquipment(4, 2295);
	mainNPC:setEquipment(9, 843);
	mainNPC:setEquipment(10, 369);


end


function nextCycle()
    if ( darsys_init == nil) then
        init();
    end
    if ( myOrderNPC ~=nil) then
--[[
Wed Aug 18 00:33:33 2010: ...usr/share/servers/testserver/scripts/base/orders.lua:1277: bad argument #1 to 'ipairs' (table expected, got nil)
#1 called by: [C]:-1(global ipairs)
#2 called by: ...usr/share/servers/testserver/scripts/base/orders.lua:1277(upvalue chanceToNumber)
#3 called by: ...usr/share/servers/testserver/scripts/base/orders.lua:1330(method generateOrder)
#4 called by: ...usr/share/servers/testserver/scripts/base/orders.lua:382(method createOrder)
#5 called by: ...usr/share/servers/testserver/scripts/base/orders.lua:405(method nextCycle)
#6 called by: ...rvers/testserver/scripts/npc/darsys_silvershaper.lua:145
]]        
        -- myOrderNPC:nextCycle();
    end
   
end


function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
    	myOrderNPC:receiveText(originator,message);
        npc.base.autonpcfunctions.TellSmallTalk(message,originator);
	end  
end

function useNPC(user)
    if ( myOrderNPC:checkOrder(user) == true ) then
        
    else
        thisNPC:talk(Character.say,"Lass mich in ruhe wenn du nichts für mich hast");
    end
end


function Price(id)

	local myitem = world:getItemStatsFromId(id);

	if (myitem.Worth == nil) then
	    return 0;
	else
		return myitem.Worth;
	end

end



function AddItemToPool(pool,myOrderNPC,nid,ntime,nchance,nmincount,nmaxcount)
   --npc.base.orders.OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
	myOrderNPC.orderPool:addItemToPool(pool,base.orders.OrderPoolItem(nid, 1,0.25*Price(nid),ntime,nchance,nmincount,nmaxcount,0.05*Price(nid)));
	return;   
end
