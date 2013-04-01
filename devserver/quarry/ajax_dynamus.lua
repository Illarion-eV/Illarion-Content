-- INSERT INTO npc VALUES (nextval('npc_seq'),1,119,590,0,2,false,'Ajax Dynamus','npc_ajax_dynamus.lua',0);
--Location: Cadomyr market place
--Task: Offers big orders for blacksmithing(NOT ALL SMITHABLE ITEMS INCLUDED)
--Skill 0-30 (easy), 30-60(middle hard), 60-100(difficult items)

require("base.orders");
require("npc.base.autonpcfunctions");
module("npc.ajax_dynamus", package.seeall);


function init()
    rigi_init = true;
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC.activeLanguage = 0;
    initializeNpc(); --initialize talk list
    allok = false;
    myOrderNPC = base.orders.OrderNPC:new();
    myOrderNPC.npc = thisNPC;
    myOrderNPC.generationTime={min=1,max=3}; --every 1-10 minutes a new order gets created
    --npc.base.orders.OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
  
   
   --Pool 1(Smithing easy items):
    AddItemToPool(1,myOrderNPC,  23,2,15, 5,25);--hammer
    AddItemToPool(1,myOrderNPC, 737,1,15, 1,15);--chisel
    AddItemToPool(1,myOrderNPC,2140,1,15, 1,15);--tongs
    AddItemToPool(1,myOrderNPC, 271,1,15, 1,10);--scythe  
    AddItemToPool(1,myOrderNPC,   9,1,15, 1,10);--saw
    AddItemToPool(1,myOrderNPC,  74,2,15, 1,10);--hatchet
    AddItemToPool(1,myOrderNPC,   6,1,15, 1,15);--scissors
	--chances for qualities of pool 1 
    myOrderNPC.orderPool:setQualityChancesForPool(1,{100,0,0,0,0,0,0,0,0,0}); 
	
   --Pool 2(Smithing more easy items):
    AddItemToPool(2,myOrderNPC,  16,2,15, 1,10);--orc helmet
    AddItemToPool(2,myOrderNPC,2291,2,15, 1,10);--Salkmaerian Paladin Helmet    
    AddItemToPool(2,myOrderNPC, 202,2,15, 1,10);--steel cap
    AddItemToPool(2,myOrderNPC, 187,2,15, 1,10);--steel hat
    AddItemToPool(2,myOrderNPC, 325,2,15, 1,10);--steel gloves
    AddItemToPool(2,myOrderNPC, 230,1,15, 1,10);--mace
    AddItemToPool(2,myOrderNPC,   1,1,15, 1,10);--serinjah sword
    AddItemToPool(2,myOrderNPC,2946,2,15, 1,10);--battle axe
    AddItemToPool(2,myOrderNPC,2757,2,15, 1,10);--Scimitar    
    AddItemToPool(2,myOrderNPC, 189,1,15, 1,10);--Dagger
    AddItemToPool(2,myOrderNPC,  88,2,15, 1,10);--long axe
	--chances for qualities of pool 2 
    myOrderNPC.orderPool:setQualityChancesForPool(2,{80,0,0,0,0,0,10,5,3,2}); 
	--myOrderNPC.orderPool:setQualityChancesForPool(4,{5,20,15,15,10,10,10,5,5,5});

   --Pool 3(Smithing middle hard items):
    AddItemToPool(3,myOrderNPC,2444,2,15, 1,10);--Serinjah Helm
    AddItemToPool(3,myOrderNPC,2441,2,15, 1,10);--Storm cap
    AddItemToPool(3,myOrderNPC,2286,4,10, 1,10);--Flame Helmet    
    AddItemToPool(3,myOrderNPC,  94,2,15, 1,10);--Pot Helmet
    AddItemToPool(3,myOrderNPC, 185,3,10, 1,10);--Black Visored Helm
    AddItemToPool(3,myOrderNPC,2403,4,10, 1, 5);--Elven Silversteel
    AddItemToPool(3,myOrderNPC, 101,3,15, 1,10);--Chain Shirt
	--chances for qualities of pool 3 
    myOrderNPC.orderPool:setQualityChancesForPool(3,{80,0,0,0,0,0,10,5,3,2});
	
   --Pool 4(Smithing more middle hard items):
    AddItemToPool(4,myOrderNPC,   4,3,15, 1, 5);--Plate Armour
    AddItemToPool(4,myOrderNPC,2364,3,15, 1, 5);--steel plate
    AddItemToPool(4,myOrderNPC, 529,3,10, 1, 5);--Dwarven Metal Gloves
    AddItemToPool(4,myOrderNPC,2172,4,10, 1, 5);--Steel Greaves
    AddItemToPool(4,myOrderNPC, 231,3,15, 1,10);--Morning Star
    AddItemToPool(4,myOrderNPC,2701,3,15, 1,10);--longsword
    AddItemToPool(4,myOrderNPC,  85,4,15, 1,10);--Coppered Longsword
    AddItemToPool(4,myOrderNPC,2629,3,15, 1, 5);--Heavy Battleaxe
    AddItemToPool(4,myOrderNPC, 383,3,15, 1, 5);--Waraxe
    AddItemToPool(4,myOrderNPC, 204,3,15, 1,10);--Bastard sword
    AddItemToPool(4,myOrderNPC, 190,2,20, 1,15);--Ornate Dagger
	--chances for qualities of pool 4 
    myOrderNPC.orderPool:setQualityChancesForPool(4,{80,0,0,0,0,0,10,5,3,2});
	
   --Pool 5(Smithing difficult items):
    AddItemToPool(5,myOrderNPC,2407,1, 5, 1, 4);--Light Blue Breastplate
    AddItemToPool(5,myOrderNPC,2399,6, 5, 1, 4);--Light Elven Armour
    AddItemToPool(5,myOrderNPC, 696,5,10, 1, 4);--Lizard Armour
    AddItemToPool(5,myOrderNPC,2395,1,10, 1, 4);--Dwarvenplate
    AddItemToPool(5,myOrderNPC,2400,8, 5, 1, 4);--Magical Elven Armour
    AddItemToPool(6,myOrderNPC,2111,5,10, 1, 5);--Chain Pants
    AddItemToPool(6,myOrderNPC,2116,5,10, 1, 5);--Iron Greaves
    AddItemToPool(6,myOrderNPC, 771,5,10, 1,10);--Albarian Steel Boots
    AddItemToPool(6,myOrderNPC,2629,4,15, 1,15);--Heavy Battleaxe
    AddItemToPool(6,myOrderNPC,2778,4,15, 1,10);--Elvensword
	myOrderNPC.orderPool:setQualityChancesForPool(5,{80,0,0,0,0,0,10,5,3,2});

   --Pool 6(Smithing more difficult items):
    AddItemToPool(6,myOrderNPC,2111,5,10, 1, 5);--Chain Pants
    AddItemToPool(6,myOrderNPC,2116,5,10, 1, 5);--Iron Greaves
    AddItemToPool(6,myOrderNPC, 771,5,10, 1,10);--Albarian Steel Boots
    AddItemToPool(6,myOrderNPC,2629,4,15, 1,15);--Heavy Battleaxe
    AddItemToPool(6,myOrderNPC,2778,4,15, 1,10);--Elvensword
    AddItemToPool(6,myOrderNPC,2660,4,15, 1, 8);--Dwarven Axe
	AddItemToPool(6,myOrderNPC,2656,6, 5, 1, 3);--Fire Broadsword
    AddItemToPool(6,myOrderNPC,2740,4,10, 1,10);--Red Dagger
    AddItemToPool(6,myOrderNPC, 205,4,15, 1,15);--Double Axe
	myOrderNPC.orderPool:setQualityChancesForPool(6,{80,0,0,0,0,0,10,5,3,2});


	--chances for every pool
	myOrderNPC.orderPool.poolchances = {17,17,16,17,17,16};
	
	--chances for the order urgency: NORMAL,HASTY,URGENT,VERY_URGENT,INSTANT
	myOrderNPC.orderPool.timechances = { 40,30,20,5,5 };
	
    --myOrderNPC.orderPool.timemodifikators = { {9,11},{8,9},{7,9},{5,7},{3,5} };
    --myOrderNPC.orderPool.valuelossfortime = { {300,300},{200,400},{150,500},{100,600},{100,800} };
	
	--myOrderNPC:setEquipment(3, 4);
	--myOrderNPC:setEquipment(5, 23);
	--myOrderNPC:setEquipment(9, 326);
	--myOrderNPC:setEquipment(11, 2377);
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

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


end


function nextCycle()
    if ( rigi_init == nil) then
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
#6 called by: ...hare/servers/testserver/scripts/npc/ajax_dynamus.lua:161
]] --
        myOrderNPC:nextCycle();
    end
   
end


function receiveText(texttype, message, originator)

	if (string.find(message, "hammertime")) then
		    Price(23); --lookup price of hammer
		    thisNPC:talk(Character.say,"Can't touch this!");
	end
	
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

	myitem = world:getItemStatsFromId(id);

	--thisNPC:talk(Character.say,"item verlangt "..id);
	--thisNPC:talk(Character.say,"item wert "..myitem.Worth);

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
