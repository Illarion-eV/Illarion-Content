-- INSERT INTO npc VALUES (nextval('npc_seq'),0,123,606,0,0,false,'Ioannes Faber','npc_ioannes_faber.lua',0);
--Location: Cadomyr Market
--Task: Offers big orders for Glassblowing and finesmithing
--Skill 0-30 (easy), 30-60(middle hard), 60-100(difficult items)

require("npc.base.orders");
require("npcs.base.autonpcfunctions");
module("npcs.ioannes_faber", package.seeall(npc.base.orders));


function init()
    teran_init = true;
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC.activeLanguage = 0;
    initializeNpc(); --initialize talk list
    allok = false;
    myOrderNPC = OrderNPC:new();
    myOrderNPC.npc = thisNPC;
    myOrderNPC.generationTime={min=1,max=3}; --every 1-10 minutes a new order gets created
    --OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
  
   
   --Pool 1(Glassblowing easy items): --Small Empty Bottle, Empty Bottle, Large Empty Bottle
    AddItemToPool(1,myOrderNPC,1317,1,20, 5,30);--Small Empty Bottle
    AddItemToPool(1,myOrderNPC, 164,1,15, 5,30);--Empty Bottle
    AddItemToPool(1,myOrderNPC,2498,1,10, 1,15);--Large Empty Bottle
	--chances for qualities of pool 1 
    myOrderNPC.orderPool:setQualityChancesForPool(1,{100,0,0,0,0,0,0,0,0,0}); 
	
   --Pool 2(Glassblowing middle hard items): Large Empty Bottle, Glass, Glass Mug
    AddItemToPool(2,myOrderNPC,2498,1,20, 5,30);--Large Empty Bottle
    AddItemToPool(2,myOrderNPC,2055,1,15, 5,30);--Glass
    AddItemToPool(2,myOrderNPC,1908,1,10, 1,15);--Glass Mug
    
	--chances for qualities of pool 2 
    myOrderNPC.orderPool:setQualityChancesForPool(2,{100,0,0,0,0,0,0,0,0,0}); 
	--myOrderNPC.orderPool:setQualityChancesForPool(4,{5,20,15,15,10,10,10,5,5,5});

   --Pool 3(Glassblowing difficult items): Glass, Glass Muge,Vase 
    AddItemToPool(3,myOrderNPC,2055,1,10, 5,20);--Glass
    AddItemToPool(3,myOrderNPC,1908,1,15, 1,15);--Glass Mug
    AddItemToPool(3,myOrderNPC, 315,1,15, 1,15);--vase
	--chances for qualities of pool 3 
    myOrderNPC.orderPool:setQualityChancesForPool(3,{100,0,0,0,0,0,0,0,0,0});
	
   --Pool 4(Finesmithing easy items):
    AddItemToPool(4,myOrderNPC,1858,2,15, 5,50);--goblet
    AddItemToPool(4,myOrderNPC,  92,1,10, 1,30);--oil lamp
    AddItemToPool(4,myOrderNPC, 399,1,15, 1,20);--candlestick
    AddItemToPool(4,myOrderNPC, 393,1,10, 1,15);--lantern
    AddItemToPool(4,myOrderNPC, 222,1,10, 1,30);--amulet
    AddItemToPool(4,myOrderNPC,  79,2,15, 1, 8);--amethyst amulet
    AddItemToPool(4,myOrderNPC, 235,1,10, 1,15);--golden ring
    AddItemToPool(4,myOrderNPC, 277,1,15, 1,10);--amethyst ring
    AddItemToPool(4,myOrderNPC,  68,1,10, 1,10);--ruby ring
	--chances for qualities of pool 4 
    myOrderNPC.orderPool:setQualityChancesForPool(4,{100,0,0,0,0,0,0,0,0,0});
	
   --Pool 5(Finesmithing middle hard items):
    AddItemToPool(5,myOrderNPC,1001,1,15, 5,50);--plate(easy one)
    AddItemToPool(5,myOrderNPC,1840,1,15, 1,20);--copper goblet
	AddItemToPool(5,myOrderNPC, 224,2,10, 1,15);--gold goblet
    AddItemToPool(5,myOrderNPC,  67,2,10, 1, 5);--ruby amulet
	AddItemToPool(5,myOrderNPC,  82,2,10, 1, 5);--blackstone amulet
	AddItemToPool(5,myOrderNPC,  71,2,10, 1, 5);--bluestone amulet
	
    AddItemToPool(5,myOrderNPC, 465,2,10, 1, 5);--Diadem
	AddItemToPool(5,myOrderNPC, 278,2,10, 1, 5);--blackstone ring
	AddItemToPool(5,myOrderNPC, 279,2,10, 1, 5);--bluestone ring
	AddItemToPool(5,myOrderNPC, 281,2,10, 1, 5);--emerald   ring
	myOrderNPC.orderPool:setQualityChancesForPool(5,{80,0,0,0,0,0,10,5,3,2});

   --Pool 6(Finesmithing difficult items):
	AddItemToPool(6,myOrderNPC,2031,1,15, 1,15);--plate(difficult one)
	AddItemToPool(6,myOrderNPC,2647,2,15, 1,10);--cuttlery
	AddItemToPool(6,myOrderNPC, 336,3,10, 1, 5);--mirror

	AddItemToPool(6,myOrderNPC,  62,3,10, 1, 5);--emerald amulet
	AddItemToPool(6,myOrderNPC,  83,3,10, 1, 5);--topaz amulet
	AddItemToPool(6,myOrderNPC, 334,4, 5, 1, 3);--charm of the icebird
	
	AddItemToPool(6,myOrderNPC, 225,2,15, 1,10);--crown
	AddItemToPool(6,myOrderNPC, 282,3,10, 1, 5);--topaz ring
	AddItemToPool(6,myOrderNPC, 280,3,10, 1, 5);--diamond ring
	AddItemToPool(6,myOrderNPC,2559,5, 3, 1, 3);--archmage ring
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

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]reetings","Be greeted!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.autonpcfunctions.AddAdditionalText("A good day to you my friend! You look fine today.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", one of Cadomyrs order traders!");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything, but I have delivery orders at which you could help me.");
    
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","You are going my friend? Take care of yourself.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell. I hope you will come back soon my friend.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","I don't buy anything, but I have delivery orders at which you could help me.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    npcs.base.autonpcfunctions.AddTraderTrigger("I'm .+","That is the name of a good friend. Nice to meet you!");

    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]r[üu][ßs]+","Hallo mein Freund, du siehst heute wieder gut aus.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.autonpcfunctions.AddAdditionalText("Guten Tag mein Freund! Wie geht es dir mein Freund?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Dd]u.+[Hh]ändler","Ich bin "..thisNPC.name..", einer der Großauftragshändler Cadomyrs!");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe nichts, aber ich habe Lieferaufträge bei denen du mir helfen könntest.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Du bist schon auf dem Weg mein Freund? Pass auf dich auf und komm bald wieder!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf bald");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Kk]auf","Ich kaufe nichts, aber ich habe Lieferaufträge bei denen du mir helfen könntest.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*?","Ich werde "..thisNPC.name.." genannt mein Freund.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ii]ch.+bin","Das ist der Name eines guten Freundes. Schön dich kennen zu lernen!");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0};
    TradStdLang=0;

    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;


end


function nextCycle()
    if ( teran_init == nil) then
        init();
    end
    if ( myOrderNPC ~=nil) then
        myOrderNPC:nextCycle();
    end
   
end


function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if string.find(message,"[Gg]egenstände.+liefern")~=nil or string.find(message,"[Dd]eliver.+[Ii]tems")~=nil
		or string.find(message,"[Dd]eliver.+good")~=nil or string.find(message, "[Ww]are.+[Ll]iefer")~=nil
		or string.find(message,"[Ww]are.+abgeben")~=nil or string.find(message,"[Gg]egenstände.+abgeben")~=nil
		or string.find(message,"[Dd]eliver.+[Ww]ares")~=nil then
        	myOrderNPC:checkOrder(originator);	
        else
			myOrderNPC:receiveText(originator,message);
			npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
		end
	end  
end

function useNPC(user,counter,param)
    if ( myOrderNPC:checkOrder(user) == true ) then
        
    --else
   --     thisNPC:talk(CCharacter.say,"Lass mich in ruhe wenn du nichts für mich hast");
    end
end


function Price(id)
if not InitPrices then
	price = {};
	InitPrices = true;
	price [   64   ] =    4   ; --    arrow   ,   Ammo   wood 
	price [   237   ] =    4   ; --    crossbow bolt   ,   Ammo   wood 
	price [   322   ] =    6   ; --    wind arrows   ,   Ammo   wood 
	price [   549   ] =    6   ; --    poisoned arrow   ,   Ammo   wood 
	price [   363   ] =    600   ; --    leather scale armor   ,   Armour   leather 
	price [   365   ] =    800   ; --    half leather armor   ,   Armour   leather 
	price [   364   ] =    1200   ; --    light hunting armor   ,   Armour   leather 
	price [   362   ] =    2000   ; --    full leatherarmor   ,   Armour   leather 
	price [   101   ] =    800   ; --    chain shirt   ,   Armour   metal 
	price [   4   ] =    1000   ; --    plate armor   ,   Armour   metal 
	price [   2390   ] =    1000   ; --    dwarven state armor   ,   Armour   metal 
	price [   2364   ] =    1300   ; --    steel plate   ,   Armour   metal 
	price [   2403   ] =    1600   ; --    elven silversteel armor   ,   Armour   metal 
	price [   2369   ] =    2000   ; --    albarian steel plate   ,   Armour   metal 
	price [   696   ] =    2600   ; --    lizard armor   ,   Armour   metal 
	price [   2360   ] =    3000   ; --    Lor-Angur guardian's armor   ,   Armour   metal 
	price [   2407   ] =    3000   ; --    light breastplate   ,   Armour   metal 
	price [   2395   ] =    3300   ; --    dwarvenplate   ,   Armour   metal 
	price [   2389   ] =    4000   ; --    salkamaerian armor   ,   Armour   metal 
	price [   2359   ] =    4400   ; --    mercenary armor   ,   Armour   metal 
	price [   2400   ] =    4400   ; --    elven state armor   ,   Armour   metal 
	price [   2363   ] =    5000   ; --    nightplate   ,   Armour   metal 
	price [   2365   ] =    5800   ; --    salkamaerian officer's armor   ,   Armour   metal 
	price [   2399   ] =    6000   ; --    light elven armor   ,   Armour   metal 
	price [   2402   ] =    6000   ; --    drow armor   ,   Armour   metal 
	price [   2357   ] =    7300   ; --    shadowplate   ,   Armour   metal 
	price [   2367   ] =    8000   ; --    albarian noble's armor   ,   Armour   metal 
	price [   2393   ] =    10000   ; --    heavy plate armor   ,   Armour   metal 
	price [   356   ] =    100   ; --    hat   ,   Clothes   cloth 
	price [   802   ] =    100   ; --    grey dress   ,   Clothes   cloth 
	price [   806   ] =    100   ; --    white dress   ,   Clothes   cloth 
	price [   809   ] =    100   ; --    grey doublet   ,   Clothes   cloth 
	price [   816   ] =    100   ; --    grey tunic   ,   Clothes   cloth 
	price [   823   ] =    100   ; --    grey trousers   ,   Clothes   cloth 
	price [   827   ] =    100   ; --    white trousers   ,   Clothes   cloth 
	price [   841   ] =    100   ; --    grey white skirt   ,   Clothes   cloth 
	price [   803   ] =    120   ; --    green dress   ,   Clothes   cloth 
	price [   820   ] =    120   ; --    white tunic   ,   Clothes   cloth 
	price [   842   ] =    120   ; --    green white skirt   ,   Clothes   cloth 
	price [   180   ] =    140   ; --    red shirt   ,   Clothes   cloth 
	price [   813   ] =    140   ; --    white doublet   ,   Clothes   cloth 
	price [   836   ] =    140   ; --    black green dress   ,   Clothes   cloth 
	price [   824   ] =    160   ; --    green trousers   ,   Clothes   cloth 
	price [   844   ] =    160   ; --    black white skirt   ,   Clothes   cloth 
	price [   457   ] =    180   ; --    green shirt   ,   Clothes   cloth 
	price [   805   ] =    180   ; --    black dress   ,   Clothes   cloth 
	price [   34   ] =    200   ; --    black trousers   ,   Clothes   cloth 
	price [   810   ] =    200   ; --    green doublet   ,   Clothes   cloth 
	price [   804   ] =    220   ; --    red dress   ,   Clothes   cloth 
	price [   838   ] =    220   ; --    black white dress   ,   Clothes   cloth 
	price [   817   ] =    240   ; --    green tunic   ,   Clothes   cloth 
	price [   826   ] =    260   ; --    black trousers   ,   Clothes   cloth 
	price [   837   ] =    260   ; --    black red dress   ,   Clothes   cloth 
	price [   183   ] =    280   ; --    green trousers   ,   Clothes   cloth 
	price [   843   ] =    300   ; --    red white skirt   ,   Clothes   cloth 
	price [   459   ] =    320   ; --    red trousers   ,   Clothes   cloth 
	price [   801   ] =    320   ; --    yellow dress   ,   Clothes   cloth 
	price [   812   ] =    340   ; --    black doublet   ,   Clothes   cloth 
	price [   834   ] =    360   ; --    black yellow dress   ,   Clothes   cloth 
	price [   825   ] =    380   ; --    red trousers   ,   Clothes   cloth 
	price [   819   ] =    420   ; --    black tunic   ,   Clothes   cloth 
	price [   840   ] =    420   ; --    yellow white skirt   ,   Clothes   cloth 
	price [   181   ] =    460   ; --    blue shirt   ,   Clothes   cloth 
	price [   835   ] =    460   ; --    black yellow dress   ,   Clothes   cloth 
	price [   460   ] =    500   ; --    yellow trousers   ,   Clothes   cloth 
	price [   385   ] =    520   ; --    blue dress   ,   Clothes   cloth 
	price [   811   ] =    560   ; --    red doublet   ,   Clothes   cloth 
	price [   839   ] =    560   ; --    blue white skirt   ,   Clothes   cloth 
	price [   822   ] =    580   ; --    yellow trousers   ,   Clothes   cloth 
	price [   833   ] =    620   ; --    black blue dress   ,   Clothes   cloth 
	price [   818   ] =    640   ; --    red tunic   ,   Clothes   cloth 
	price [   461   ] =    680   ; --    blue trousers   ,   Clothes   cloth 
	price [   800   ] =    680   ; --    blue dress   ,   Clothes   cloth 
	price [   458   ] =    720   ; --    yellow shirt   ,   Clothes   cloth 
	price [   850   ] =    740   ; --    grey heraldic dress   ,   Clothes   cloth 
	price [   808   ] =    820   ; --    yellow doublet   ,   Clothes   cloth 
	price [   821   ] =    820   ; --    blue trousers   ,   Clothes   cloth 
	price [   852   ] =    820   ; --    white heraldic dress   ,   Clothes   cloth 
	price [   851   ] =    860   ; --    black red heraldic dress   ,   Clothes   cloth 
	price [   196   ] =    900   ; --    grey coat   ,   Clothes   cloth 
	price [   815   ] =    900   ; --    yellow tunic   ,   Clothes   cloth 
	price [   830   ] =    900   ; --    grey hat with feather   ,   Clothes   cloth 
	price [   849   ] =    940   ; --    red yellow heraldic dress   ,   Clothes   cloth 
	price [   814   ] =    1000   ; --    blue tunic   ,   Clothes   cloth 
	price [   848   ] =    1000   ; --    yellow green heraldic dress   ,   Clothes   cloth 
	price [   2418   ] =    1000   ; --    grey priest robe   ,   Clothes   cloth 
	price [   831   ] =    1100   ; --    green hat with feather   ,   Clothes   cloth 
	price [   847   ] =    1100   ; --    yellow blue heraldic dress   ,   Clothes   cloth 
	price [   182   ] =    1200   ; --    black shirt   ,   Clothes   cloth 
	price [   845   ] =    1200   ; --    blue green heraldic dress   ,   Clothes   cloth 
	price [   2421   ] =    1200   ; --    white priest robe   ,   Clothes   cloth 
	price [   55   ] =    1300   ; --    green robe   ,   Clothes   cloth 
	price [   807   ] =    1300   ; --    blue doublet   ,   Clothes   cloth 
	price [   832   ] =    1300   ; --    red hat with feather   ,   Clothes   cloth 
	price [   846   ] =    1300   ; --    blue red heraldic dress   ,   Clothes   cloth 
	price [   194   ] =    1400   ; --    black robe   ,   Clothes   cloth 
	price [   829   ] =    1500   ; --    yellow hat with feather   ,   Clothes   cloth 
	price [   2378   ] =    1600   ; --    black cult robe   ,   Clothes   cloth 
	price [   2384   ] =    1700   ; --    black coat   ,   Clothes   cloth 
	price [   828   ] =    1800   ; --    blue hat with feather   ,   Clothes   cloth 
	price [   2420   ] =    1800   ; --    black priest robe   ,   Clothes   cloth 
	price [   358   ] =    2000   ; --    red wizard hat   ,   Clothes   cloth 
	price [   547   ] =    2000   ; --    novice mage robe   ,   Clothes   cloth 
	price [   2419   ] =    2200   ; --    red priest robe   ,   Clothes   cloth 
	price [   357   ] =    2300   ; --    blue wizard hat   ,   Clothes   cloth 
	price [   2377   ] =    2400   ; --    red mage robe   ,   Clothes   cloth 
	price [   195   ] =    2600   ; --    yellow robe   ,   Clothes   cloth 
	price [   370   ] =    2600   ; --    colourful wizard hat   ,   Clothes   cloth 
	price [   368   ] =    2800   ; --    yellow priest robe   ,   Clothes   cloth 
	price [   371   ] =    3000   ; --    expensive wizard hat   ,   Clothes   cloth 
	price [   2416   ] =    3000   ; --    brown priest robe   ,   Clothes   cloth 
	price [   193   ] =    3200   ; --    blue robe   ,   Clothes   cloth 
	price [   2380   ] =    3500   ; --    blue coat   ,   Clothes   cloth 
	price [   548   ] =    3600   ; --    mage robe   ,   Clothes   cloth 
	price [   558   ] =    4000   ; --    mage robe   ,   Clothes   cloth 
	price [   230   ] =    220   ; --    mace   ,   Concussion   metal 
	price [   2737   ] =    520   ; --    morning star   ,   Concussion   metal 
	price [   231   ] =    1000   ; --    morning star   ,   Concussion   metal 
	price [   226   ] =    1700   ; --    war hammer   ,   Concussion   metal 
	price [   2664   ] =    160   ; --    club   ,   Concussion   wood 
	price [   39   ] =    180   ; --    skull staff   ,   Concussion   wood 
	price [   40   ] =    220   ; --    cleric's staff   ,   Concussion   wood 
	price [   57   ] =    500   ; --    simple mage's staff   ,   Concussion   wood 
	price [   76   ] =    640   ; --    mage's staff   ,   Concussion   wood 
	price [   209   ] =    1100   ; --    elven mage's staff   ,   Concussion   wood 
	price [   208   ] =    1200   ; --    ornate mage's staff   ,   Concussion   wood 
	price [   207   ] =    1500   ; --    battle staff   ,   Concussion   wood 
	price [   323   ] =    3000   ; --    mage's staff   ,   Concussion   wood 
	price [   249   ] =    4   ; --    bundle of grain   ,   Crop   plants 
	price [   259   ] =    4   ; --    grain   ,   Crop   plants 
	price [   291   ] =    4   ; --    withered cabbage (seeds)   ,   Crop   plants 
	price [   534   ] =    4   ; --    onion seeds   ,   Crop   plants 
	price [   728   ] =    4   ; --    hop seeds   ,   Crop   plants 
	price [   773   ] =    4   ; --    tobacco seeds   ,   Crop   plants 
	price [   779   ] =    4   ; --    sugarcane seeds   ,   Crop   plants 
	price [   2494   ] =    4   ; --    seeds   ,   Crop   plants 
	price [   2917   ] =    4   ; --    tomatoe seeds   ,   Crop   plants 
	price [   154   ] =    8   ; --    hop   ,   Crop   plants 
	price [   200   ] =    8   ; --    tomato   ,   Crop   plants 
	price [   201   ] =    8   ; --    onion   ,   Crop   plants 
	price [   290   ] =    8   ; --    cabbage   ,   Crop   plants 
	price [   772   ] =    8   ; --    tobacco   ,   Crop   plants 
	price [   778   ] =    8   ; --    sugarcane   ,   Crop   plants 
	price [   2493   ] =    8   ; --    carrots   ,   Crop   plants 
	price [   89   ] =    200   ; --    sling   ,   npcs.base.autonpcfunctions.Distance   leather 
	price [   294   ] =    5   ; --    throwing star   ,   npcs.base.autonpcfunctions.Distance   metal 
	price [   2645   ] =    10   ; --    throwing axe   ,   npcs.base.autonpcfunctions.Distance   metal 
	price [   293   ] =    20   ; --    throwing spear   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   65   ] =    220   ; --    short bow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2646   ] =    520   ; --    serinjah-rider's bow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2714   ] =    540   ; --    hunting bow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2727   ] =    880   ; --    fire-hunters bow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2780   ] =    920   ; --    magical poisonbow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2708   ] =    1000   ; --    long bow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2718   ] =    1600   ; --    elven composite longbow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   70   ] =    1700   ; --    crossbow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2685   ] =    3400   ; --    elven shortbow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   2739   ] =    3500   ; --    magical icebow   ,   npcs.base.autonpcfunctions.Distance   wood 
	price [   306   ] =    40   ; --    ham   ,   Food   default 
	price [   453   ] =    40   ; --    cookies   ,   Food   default 
	price [   455   ] =    40   ; --    smoked fish   ,   Food   default 
	price [   3051   ] =    40   ; --    sausage   ,   Food   default 
	price [   191   ] =    50   ; --    bred roll   ,   Food   default 
	price [   2940   ] =    60   ; --    steak   ,   Food   default 
	price [   454   ] =    80   ; --    black-berry-muffin   ,   Food   default 
	price [   49   ] =    100   ; --    bread   ,   Food   default 
	price [   2456   ] =    100   ; --    mushroom soup   ,   Food   default 
	price [   2923   ] =    100   ; --    onion soup   ,   Food   default 
	price [   2278   ] =    120   ; --    cabbage stew   ,   Food   default 
	price [   2459   ] =    120   ; --    fish filet dish   ,   Food   default 
	price [   2276   ] =    160   ; --    mulligan   ,   Food   default 
	price [   556   ] =    180   ; --    salmon dish   ,   Food   default 
	price [   353   ] =    200   ; --    apple pie   ,   Food   default 
	price [   2277   ] =    200   ; --    meat dish   ,   Food   default 
	price [   2922   ] =    240   ; --    sausages dish   ,   Food   default 
	price [   303   ] =    300   ; --    cherry cake   ,   Food   default 
	price [   557   ] =    300   ; --    meat dish   ,   Food   default 
	price [   555   ] =    340   ; --    rabbit dish   ,   Food   default 
	price [   354   ] =    380   ; --    strawberry cake   ,   Food   default 
	price [   559   ] =    400   ; --    lamb dish   ,   Food   default 
	price [   554   ] =    460   ; --    venison dish   ,   Food   default 
	price [   15   ] =    2   ; --    apple   ,   Fruit   plants 
	price [   80   ] =    2   ; --    banana   ,   Fruit   plants 
	price [   81   ] =    2   ; --    berries   ,   Fruit   plants 
	price [   199   ] =    2   ; --    tangerine   ,   Fruit   plants 
	price [   302   ] =    2   ; --    cherries   ,   Fruit   plants 
	price [   388   ] =    2   ; --    grapes   ,   Fruit   plants 
	price [   251   ] =    40   ; --    raw amethysts   ,   Gem   stone 
	price [   255   ] =    40   ; --    raw rubies   ,   Gem   stone 
	price [   252   ] =    60   ; --    raw blackstone   ,   Gem   stone 
	price [   253   ] =    60   ; --    raw bluestone   ,   Gem   stone 
	price [   46   ] =    80   ; --    ruby   ,   Gem   stone 
	price [   197   ] =    80   ; --    amethyst   ,   Gem   stone 
	price [   256   ] =    80   ; --    raw smaragd   ,   Gem   stone 
	price [   257   ] =    80   ; --    raw topaz   ,   Gem   stone 
	price [   254   ] =    100   ; --    raw diamonds   ,   Gem   stone 
	price [   283   ] =    120   ; --    blackstone   ,   Gem   stone 
	price [   284   ] =    120   ; --    bluestone   ,   Gem   stone 
	price [   45   ] =    160   ; --    emerald   ,   Gem   stone 
	price [   198   ] =    160   ; --    topaz   ,   Gem   stone 
	price [   447   ] =    160   ; --    ruby powder   ,   Gem   stone 
	price [   450   ] =    160   ; --    amethyst powder   ,   Gem   stone 
	price [   285   ] =    200   ; --    diamond   ,   Gem   stone 
	price [   446   ] =    240   ; --    bluestone powder   ,   Gem   stone 
	price [   449   ] =    240   ; --    blackstone powder   ,   Gem   stone 
	price [   448   ] =    320   ; --    emerald powder   ,   Gem   stone 
	price [   451   ] =    320   ; --    topaz powder   ,   Gem   stone 
	price [   452   ] =    400   ; --    diamond powder   ,   Gem   stone 
	price [   384   ] =    100   ; --    thieve's gloves   ,   Gloves   cloth 
	price [   2295   ] =    120   ; --    cloth gloves   ,   Gloves   cloth 
	price [   48   ] =    300   ; --    leather gloves   ,   Gloves   leather 
	price [   526   ] =    700   ; --    studded leather gloves   ,   Gloves   leather 
	price [   527   ] =    1500   ; --    serinjah leather gloves   ,   Gloves   leather 
	price [   325   ] =    240   ; --    steel gloves   ,   Gloves   metal 
	price [   528   ] =    500   ; --    salkamarian steel gloves   ,   Gloves   metal 
	price [   529   ] =    800   ; --    dwarfen metal gloves   ,   Gloves   metal 
	price [   530   ] =    1200   ; --    albarian steelgloves   ,   Gloves   metal 
	price [   531   ] =    2400   ; --    knight gloves   ,   Gloves   metal 
	price [   223   ] =    80   ; --    iron goblet   ,   Gold   metal 
	price [   235   ] =    120   ; --    golden ring   ,   Gold   metal 
	price [   1840   ] =    120   ; --    copper goblet   ,   Gold   metal 
	price [   92   ] =    140   ; --    oil lamp   ,   Gold   metal 
	price [   224   ] =    200   ; --    golden goblet   ,   Gold   metal 
	price [   397   ] =    200   ; --    oil lamp   ,   Gold   metal 
	price [   2647   ] =    200   ; --    cutlery   ,   Gold   metal 
	price [   277   ] =    220   ; --    amethyst ring   ,   Gold   metal 
	price [   222   ] =    300   ; --    amulet   ,   Gold   metal 
	price [   68   ] =    420   ; --    ruby ring   ,   Gold   metal 
	price [   79   ] =    560   ; --    amethyst amulet   ,   Gold   metal 
	price [   278   ] =    720   ; --    blackstone ring   ,   Gold   metal 
	price [   67   ] =    900   ; --    ruby amulet   ,   Gold   metal 
	price [   279   ] =    1100   ; --    bluestone ring   ,   Gold   metal 
	price [   82   ] =    1400   ; --    blackstone amulet   ,   Gold   metal 
	price [   465   ] =    1400   ; --    diadem   ,   Gold   metal 
	price [   281   ] =    1600   ; --    smaragd ring   ,   Gold   metal 
	price [   71   ] =    1900   ; --    bluestone amulet   ,   Gold   metal 
	price [   282   ] =    2200   ; --    topaz ring   ,   Gold   metal 
	price [   62   ] =    2600   ; --    emerald amulet   ,   Gold   metal 
	price [   225   ] =    2600   ; --    crown   ,   Gold   metal 
	price [   280   ] =    2900   ; --    diamond ring   ,   Gold   metal 
	price [   83   ] =    3300   ; --    topaz amulet   ,   Gold   metal 
	price [   336   ] =    3400   ; --    mirror   ,   Gold   metal 
	price [   334   ] =    6200   ; --    charm of the icebird   ,   Gold   metal 
	price [   2559   ] =    8200   ; --    ring of the archmage   ,   Gold   metal 
	price [   367   ] =    220   ; --    short leather legs   ,   Greaves   leather 
	price [   366   ] =    500   ; --    leather legs   ,   Greaves   leather 
	price [   2117   ] =    500   ; --    short iron greaves   ,   Greaves   metal 
	price [   2114   ] =    1100   ; --    short brass greaves   ,   Greaves   metal 
	price [   2172   ] =    1200   ; --    heavy steel greaves   ,   Greaves   metal 
	price [   2112   ] =    1500   ; --    short chain pants   ,   Greaves   metal 
	price [   2113   ] =    2300   ; --    brass greaves   ,   Greaves   metal 
	price [   2116   ] =    2700   ; --    iron greaves   ,   Greaves   metal 
	price [   2111   ] =    3000   ; --    chain pants   ,   Greaves   metal 
	price [   2194   ] =    300   ; --    short hardwood greaves   ,   Greaves   wood 
	price [   2193   ] =    600   ; --    hardwood greaves   ,   Greaves   wood 
	price [   324   ] =    160   ; --    chain helmet   ,   Helmet   metal 
	price [   2290   ] =    180   ; --    round steel hat   ,   Helmet   metal 
	price [   7   ] =    220   ; --    horned helmet   ,   Helmet   metal 
	price [   202   ] =    240   ; --    steel cap   ,   Helmet   metal 
	price [   2302   ] =    300   ; --    gynkese mercenarie's helmet   ,   Helmet   metal 
	price [   16   ] =    400   ; --    orc helmet   ,   Helmet   metal 
	price [   187   ] =    400   ; --    steel hat   ,   Helmet   metal 
	price [   2291   ] =    500   ; --    salkamaerian paladin's helmet   ,   Helmet   metal 
	price [   2444   ] =    600   ; --    serinjah helmet   ,   Helmet   metal 
	price [   2287   ] =    800   ; --    albarian soldier's helmet   ,   Helmet   metal 
	price [   94   ] =    900   ; --    pot helmet   ,   Helmet   metal 
	price [   2303   ] =    1100   ; --    drow helmet   ,   Helmet   metal 
	price [   2441   ] =    1100   ; --    storm cap   ,   Helmet   metal 
	price [   184   ] =    1400   ; --    visored helmet   ,   Helmet   metal 
	price [   2286   ] =    1500   ; --    flame helmet   ,   Helmet   metal 
	price [   185   ] =    1900   ; --    black visored helmet   ,   Helmet   metal 
	price [   133   ] =    4   ; --    sun herb   ,   Herb   plants 
	price [   134   ] =    4   ; --    fourleafed oneberry   ,   Herb   plants 
	price [   135   ] =    4   ; --    yellow weed   ,   Herb   plants 
	price [   136   ] =    4   ; --    anger berry   ,   Herb   plants 
	price [   137   ] =    4   ; --    flamegoblet blossom   ,   Herb   plants 
	price [   138   ] =    4   ; --    night angels blossom   ,   Herb   plants 
	price [   140   ] =    4   ; --    donf blade   ,   Herb   plants 
	price [   141   ] =    4   ; --    black thirstel   ,   Herb   plants 
	price [   142   ] =    4   ; --    sand berry   ,   Herb   plants 
	price [   143   ] =    4   ; --    red elder   ,   Herb   plants 
	price [   144   ] =    4   ; --    virgins weed   ,   Herb   plants 
	price [   145   ] =    4   ; --    heath flower   ,   Herb   plants 
	price [   146   ] =    4   ; --    desert sky capsule   ,   Herb   plants 
	price [   147   ] =    4   ; --    black berry   ,   Herb   plants 
	price [   148   ] =    4   ; --    firnis blossom   ,   Herb   plants 
	price [   149   ] =    4   ; --    fir tree sprout   ,   Herb   plants 
	price [   151   ] =    4   ; --    strawberry   ,   Herb   plants 
	price [   152   ] =    4   ; --    life root   ,   Herb   plants 
	price [   153   ] =    4   ; --    foot leaf   ,   Herb   plants 
	price [   155   ] =    4   ; --    sibanac leaf   ,   Herb   plants 
	price [   156   ] =    4   ; --    steppe fern   ,   Herb   plants 
	price [   157   ] =    4   ; --    rotten tree bark   ,   Herb   plants 
	price [   158   ] =    4   ; --    bulbsponge mushroom   ,   Herb   plants 
	price [   159   ] =    4   ; --    toadstool   ,   Herb   plants 
	price [   160   ] =    4   ; --    red head   ,   Herb   plants 
	price [   161   ] =    4   ; --    herders mushroom   ,   Herb   plants 
	price [   162   ] =    4   ; --    birth mushroom   ,   Herb   plants 
	price [   163   ] =    4   ; --    champignon   ,   Herb   plants 
	price [   405   ] =    4   ; --    mushroom   ,   Herb   plants 
	price [   406   ] =    4   ; --    mushroom   ,   Herb   plants 
	price [   407   ] =    4   ; --    mushroom   ,   Herb   plants 
	price [   752   ] =    4   ; --    mandrake   ,   Herb   plants 
	price [   753   ] =    4   ; --    blue birdsberry   ,   Herb   plants 
	price [   754   ] =    4   ; --    oneleaved fourberry   ,   Herb   plants 
	price [   755   ] =    4   ; --    fire root   ,   Herb   plants 
	price [   756   ] =    4   ; --    pious berry   ,   Herb   plants 
	price [   757   ] =    4   ; --    godsflower   ,   Herb   plants 
	price [   758   ] =    4   ; --    lifeblood   ,   Herb   plants 
	price [   759   ] =    4   ; --    nuts   ,   Herb   plants 
	price [   760   ] =    4   ; --    reek leave   ,   Herb   plants 
	price [   761   ] =    4   ; --    rain weed   ,   Herb   plants 
	price [   762   ] =    4   ; --    sulfur weed   ,   Herb   plants 
	price [   763   ] =    4   ; --    mash flower   ,   Herb   plants 
	price [   764   ] =    4   ; --    daydevil   ,   Herb   plants 
	price [   765   ] =    4   ; --    daydream   ,   Herb   plants 
	price [   766   ] =    4   ; --    con blossom   ,   Herb   plants 
	price [   767   ] =    4   ; --    water blossom   ,   Herb   plants 
	price [   768   ] =    4   ; --    wolverine fern   ,   Herb   plants 
	price [   769   ] =    4   ; --    desert berry   ,   Herb   plants 
	price [   333   ] =    20   ; --    horn   ,   Instrument   default 
	price [   90   ] =    200   ; --    flute   ,   Instrument   wood 
	price [   532   ] =    200   ; --    panpipe   ,   Instrument   wood 
	price [   533   ] =    200   ; --    drum   ,   Instrument   wood 
	price [   335   ] =    400   ; --    lute   ,   Instrument   wood 
	price [   332   ] =    600   ; --    harp   ,   Instrument   wood 
	price [   54   ] =    40   ; --    green cloth   ,   Intermediate   cloth 
	price [   174   ] =    40   ; --    red cloth   ,   Intermediate   cloth 
	price [   175   ] =    40   ; --    black cloth   ,   Intermediate   cloth 
	price [   176   ] =    40   ; --    grey cloth   ,   Intermediate   cloth 
	price [   177   ] =    40   ; --    yellow cloth   ,   Intermediate   cloth 
	price [   178   ] =    40   ; --    white cloth   ,   Intermediate   cloth 
	price [   179   ] =    40   ; --    blue cloth   ,   Intermediate   cloth 
	price [   2577   ] =    40   ; --    yellow cloth   ,   Intermediate   cloth 
	price [   2579   ] =    40   ; --    green cloth   ,   Intermediate   cloth 
	price [   5   ] =    40   ; --    dough   ,   Intermediate   default 
	price [   431   ] =    40   ; --    wax   ,   Intermediate   default 
	price [   736   ] =    40   ; --    unfired bricks   ,   Intermediate   default 
	price [   43   ] =    80   ; --    candles   ,   Intermediate   default 
	price [   2588   ] =    80   ; --    bricks   ,   Intermediate   default 
	price [   2678   ] =    240   ; --    black dye   ,   Intermediate   default 
	price [   2679   ] =    240   ; --    green dye   ,   Intermediate   default 
	price [   2680   ] =    240   ; --    blue dye   ,   Intermediate   default 
	price [   2681   ] =    240   ; --    red dye   ,   Intermediate   default 
	price [   2682   ] =    240   ; --    yellow dye   ,   Intermediate   default 
	price [   2683   ] =    240   ; --    white dye   ,   Intermediate   default 
	price [   41   ] =    40   ; --    glass ingot   ,   Intermediate   glass 
	price [   164   ] =    80   ; --    empty bottle   ,   Intermediate   glass 
	price [   1317   ] =    80   ; --    small empty bottle   ,   Intermediate   glass 
	price [   1858   ] =    80   ; --    goblet   ,   Intermediate   glass 
	price [   1908   ] =    80   ; --    glass mug   ,   Intermediate   glass 
	price [   2055   ] =    80   ; --    glass   ,   Intermediate   glass 
	price [   2457   ] =    80   ; --    wine glass   ,   Intermediate   glass 
	price [   2498   ] =    80   ; --    large empty bottle   ,   Intermediate   glass 
	price [   1909   ] =    100   ; --    beer mug   ,   Intermediate   glass 
	price [   104   ] =    40   ; --    silver ingot   ,   Intermediate   metal 
	price [   2535   ] =    40   ; --    iron ingot   ,   Intermediate   metal 
	price [   2550   ] =    40   ; --    copper ingot   ,   Intermediate   metal 
	price [   2738   ] =    40   ; --    pins   ,   Intermediate   metal 
	price [   2526   ] =    80   ; --    axehead   ,   Intermediate   metal 
	price [   2537   ] =    80   ; --    iron plate   ,   Intermediate   metal 
	price [   2542   ] =    80   ; --    hammer head   ,   Intermediate   metal 
	price [   2562   ] =    80   ; --    large sword blade   ,   Intermediate   metal 
	price [   2563   ] =    80   ; --    dagger blade   ,   Intermediate   metal 
	price [   2564   ] =    80   ; --    sword blade   ,   Intermediate   metal 
	price [   2565   ] =    80   ; --    scythe blade   ,   Intermediate   metal 
	price [   2568   ] =    80   ; --    shovel head   ,   Intermediate   metal 
	price [   2569   ] =    80   ; --    sickle blade   ,   Intermediate   metal 
	price [   2571   ] =    80   ; --    merinium ingot   ,   Intermediate   metal 
	price [   2696   ] =    80   ; --    metal pieces   ,   Intermediate   metal 
	price [   236   ] =    120   ; --    gold ingot   ,   Intermediate   metal 
	price [   545   ] =    40   ; --    cherry wood boards   ,   Intermediate   wood 
	price [   546   ] =    40   ; --    naldor wood boards   ,   Intermediate   wood 
	price [   2543   ] =    40   ; --    conifer wooden boards   ,   Intermediate   wood 
	price [   2716   ] =    40   ; --    apple wood boards   ,   Intermediate   wood 
	price [   2717   ] =    40   ; --    pins and cotters   ,   Intermediate   wood 
	price [   1001   ] =    80   ; --    plate   ,   Intermediate   wood 
	price [   2031   ] =    80   ; --    plate   ,   Intermediate   wood 
	price [   2525   ] =    80   ; --    axehandle   ,   Intermediate   wood 
	price [   2527   ] =    80   ; --    large ornated handle   ,   Intermediate   wood 
	price [   2528   ] =    80   ; --    small handle   ,   Intermediate   wood 
	price [   2530   ] =    80   ; --    dagger handle   ,   Intermediate   wood 
	price [   2541   ] =    80   ; --    hammer handle   ,   Intermediate   wood 
	price [   2544   ] =    80   ; --    large handle   ,   Intermediate   wood 
	price [   2548   ] =    80   ; --    mace handle   ,   Intermediate   wood 
	price [   2549   ] =    80   ; --    morning star handle   ,   Intermediate   wood 
	price [   2561   ] =    80   ; --    saw handle   ,   Intermediate   wood 
	price [   2566   ] =    80   ; --    scythe handle   ,   Intermediate   wood 
	price [   2567   ] =    80   ; --    shovel handle   ,   Intermediate   wood 
	price [   2570   ] =    80   ; --    sickle handle   ,   Intermediate   wood 
	price [   2572   ] =    80   ; --    staff handle   ,   Intermediate   wood 
	price [   2573   ] =    80   ; --    long staff handle   ,   Intermediate   wood 
	price [   2584   ] =    80   ; --    sword handle   ,   Intermediate   wood 
	price [   2585   ] =    80   ; --    big sword handle   ,   Intermediate   wood 
	price [   2935   ] =    80   ; --    soup bowl   ,   Intermediate   wood 
	price [   2952   ] =    80   ; --    plate   ,   Intermediate   wood 
	price [   2551   ] =    1000   ; --    pure air   ,   Kewl stuff   default 
	price [   2552   ] =    1000   ; --    pure earth   ,   Kewl stuff   default 
	price [   2553   ] =    1000   ; --    pure fire   ,   Kewl stuff   default 
	price [   2554   ] =    1000   ; --    pure water   ,   Kewl stuff   default 
	price [   310   ] =    80   ; --    mug with lid   ,   Other   default 
	price [   2183   ] =    80   ; --    clay mug   ,   Other   default 
	price [   2184   ] =    80   ; --    clay cup   ,   Other   default 
	price [   399   ] =    100   ; --    candlestick   ,   Other   default 
	price [   463   ] =    100   ; --    quill   ,   Other   default 
	price [   1862   ] =    100   ; --    candlestick   ,   Other   default 
	price [   2760   ] =    200   ; --    rope   ,   Other   default 
	price [   330   ] =    100   ; --    sheep milk   ,   Other   glass 
	price [   390   ] =    100   ; --    lamp oil   ,   Other   glass 
	price [   469   ] =    100   ; --    lamp oil   ,   Other   glass 
	price [   1318   ] =    100   ; --    bottle of elven wine   ,   Other   glass 
	price [   1319   ] =    100   ; --    bottle of rum   ,   Other   glass 
	price [   1841   ] =    100   ; --    goblet with water   ,   Other   glass 
	price [   1842   ] =    100   ; --    goblet with wine   ,   Other   glass 
	price [   1843   ] =    100   ; --    goblet with mead   ,   Other   glass 
	price [   1844   ] =    100   ; --    goblet with cider   ,   Other   glass 
	price [   1853   ] =    100   ; --    goblet with mead   ,   Other   glass 
	price [   1854   ] =    100   ; --    goblet with water   ,   Other   glass 
	price [   1855   ] =    100   ; --    goblet with water   ,   Other   glass 
	price [   1856   ] =    100   ; --    goblet with mead   ,   Other   glass 
	price [   1857   ] =    100   ; --    goblet with wine   ,   Other   glass 
	price [   1859   ] =    100   ; --    goblet with cider   ,   Other   glass 
	price [   1861   ] =    100   ; --    goblet with cider   ,   Other   glass 
	price [   2056   ] =    100   ; --    glass with mead   ,   Other   glass 
	price [   2057   ] =    100   ; --    glass with wine   ,   Other   glass 
	price [   2058   ] =    100   ; --    glass with water   ,   Other   glass 
	price [   2059   ] =    100   ; --    glass with cider   ,   Other   glass 
	price [   97   ] =    100   ; --    leather bag   ,   Other   leather 
	price [   466   ] =    100   ; --    handcuffs   ,   Other   metal 
	price [   1860   ] =    100   ; --    goblet with wine   ,   Other   metal 
	price [   393   ] =    200   ; --    lantern   ,   Other   metal 
	price [   2745   ] =    80   ; --    parchment   ,   Other   paper 
	price [   2185   ] =    80   ; --    wooden cup   ,   Other   wood 
	price [   391   ] =    100   ; --    torch   ,   Other   wood 
	price [   2186   ] =    100   ; --    cup with water   ,   Other   wood 
	price [   2187   ] =    100   ; --    cup with wine   ,   Other   wood 
	price [   2188   ] =    100   ; --    cup with mead   ,   Other   wood 
	price [   2189   ] =    100   ; --    cup with cider   ,   Other   wood 
	price [   2719   ] =    100   ; --    comb   ,   Other   wood 
	price [   2744   ] =    100   ; --    pipe   ,   Other   wood 
	price [   374   ] =    200   ; --    trap set   ,   Other   wood 
	price [   27   ] =    180   ; --    simple dagger   ,   Puncture   metal 
	price [   2668   ] =    180   ; --    poisoned simple dagger   ,   Puncture   metal 
	price [   189   ] =    460   ; --    dagger   ,   Puncture   metal 
	price [   2672   ] =    460   ; --    poisened dagger   ,   Puncture   metal 
	price [   190   ] =    580   ; --    ornate dagger   ,   Puncture   metal 
	price [   297   ] =    580   ; --    gilded dagger   ,   Puncture   metal 
	price [   389   ] =    580   ; --    silvered dagger   ,   Puncture   metal 
	price [   398   ] =    580   ; --    coppered dagger   ,   Puncture   metal 
	price [   444   ] =    580   ; --    merinium-plated dagger   ,   Puncture   metal 
	price [   2689   ] =    580   ; --   poisoned ornate dagger   ,   Puncture   metal 
	price [   2740   ] =    920   ; --    red dagger   ,   Puncture   metal 
	price [   2675   ] =    1100   ; --    rapier   ,   Puncture   metal 
	price [   91   ] =    3400   ; --    malachin dagger   ,   Puncture   metal 
	price [   2742   ] =    3500   ; --    red fire dagger   ,   Puncture   metal 
	price [   2671   ] =    4300   ; --    magical dagger   ,   Puncture   metal 
	price [   50   ] =    20   ; --    thread   ,   Resource   cloth 
	price [   168   ] =    20   ; --    ball of wool   ,   Resource   cloth 
	price [   170   ] =    20   ; --    wool   ,   Resource   cloth 
	price [   26   ] =    20   ; --    clay   ,   Resource   default 
	price [   63   ] =    20   ; --    entrails   ,   Resource   default 
	price [   73   ] =    20   ; --    trout   ,   Resource   default 
	price [   307   ] =    20   ; --    pork   ,   Resource   default 
	price [   314   ] =    20   ; --    pott ash   ,   Resource   default 
	price [   355   ] =    20   ; --    salmon   ,   Resource   default 
	price [   552   ] =    20   ; --    deer meat   ,   Resource   default 
	price [   553   ] =    20   ; --    rabbit meat   ,   Resource   default 
	price [   2529   ] =    20   ; --    honeycomb   ,   Resource   default 
	price [   2934   ] =    20   ; --    lamb meat   ,   Resource   default 
	price [   69   ] =    20   ; --    raw leather   ,   Resource   leather 
	price [   2586   ] =    20   ; --    fur   ,   Resource   leather 
	price [   2547   ] =    40   ; --    leather   ,   Resource   leather 
	price [   22   ] =    20   ; --    iron ore   ,   Resource   metal 
	price [   2536   ] =    20   ; --    copper ore   ,   Resource   metal 
	price [   2534   ] =    40   ; --    ore   ,   Resource   metal 
	price [   234   ] =    60   ; --    gold nuggets   ,   Resource   metal 
	price [   2   ] =    20   ; --    flour   ,   Resource   plants 
	price [   1266   ] =    2   ; --    stone   ,   Resource   stone 
	price [   21   ] =    20   ; --    coal   ,   Resource   stone 
	price [   726   ] =    20   ; --    coarse sand   ,   Resource   stone 
	price [   733   ] =    20   ; --    stone block   ,   Resource   stone 
	price [   735   ] =    20   ; --    raw stone   ,   Resource   stone 
	price [   316   ] =    40   ; --    quartz sand   ,   Resource   stone 
	price [   3   ] =    20   ; --    conifer wood   ,   Resource   wood 
	price [   56   ] =    20   ; --    bough   ,   Resource   wood 
	price [   543   ] =    20   ; --    cherry wood   ,   Resource   wood 
	price [   544   ] =    20   ; --    naldor wood   ,   Resource   wood 
	price [   2560   ] =    20   ; --    deciduous wood   ,   Resource   wood 
	price [   2786   ] =    20   ; --    branch   ,   Resource   wood 
	price [   2445   ] =    100   ; --    small wooden shield   ,   Shield   wood 
	price [   17   ] =    120   ; --    wooden shield   ,   Shield   wood 
	price [   18   ] =    140   ; --    light metal shield   ,   Shield   wood 
	price [   186   ] =    200   ; --    round metal shield   ,   Shield   wood 
	price [   19   ] =    280   ; --    large metal shield   ,   Shield   wood 
	price [   20   ] =    380   ; --    knight shield   ,   Shield   wood 
	price [   917   ] =    500   ; --    cursed shield   ,   Shield   wood 
	price [   2388   ] =    660   ; --    red steel shield   ,   Shield   wood 
	price [   2448   ] =    820   ; --    legionaire's tower shield   ,   Shield   wood 
	price [   95   ] =    1000   ; --    heraldic shield   ,   Shield   wood 
	price [   96   ] =    1200   ; --    steel tower shield   ,   Shield   wood 
	price [   916   ] =    1500   ; --    ornate tower shield   ,   Shield   wood 
	price [   2447   ] =    1700   ; --    mosaic shield   ,   Shield   wood 
	price [   2284   ] =    2000   ; --    Shield of the Sky   ,   Shield   wood 
	price [   2439   ] =    2000   ; --    cloud shield   ,   Shield   wood 
	price [   369   ] =    140   ; --    leather shoes   ,   Shoes   leather 
	price [   53   ] =    280   ; --    leather boots   ,   Shoes   leather 
	price [   697   ] =    700   ; --    fur boots   ,   Shoes   leather 
	price [   698   ] =    1400   ; --    serinjah leather boots   ,   Shoes   leather 
	price [   326   ] =    220   ; --    steel boots   ,   Shoes   metal 
	price [   699   ] =    500   ; --    salkamarian steel boots   ,   Shoes   metal 
	price [   771   ] =    1100   ; --    albarian steel boots   ,   Shoes   metal 
	price [   770   ] =    2300   ; --    knight boots   ,   Shoes   metal 
	price [   2707   ] =    80   ; --    rainbowsword-blade   ,   Slashing   metal 
	price [   2635   ] =    180   ; --    poisoned halfling axe   ,   Slashing   metal 
	price [   2711   ] =    180   ; --    halfling axe   ,   Slashing   metal 
	price [   2723   ] =    200   ; --    executioner's axe   ,   Slashing   metal 
	price [   2725   ] =    200   ; --    poisened executioner's axe   ,   Slashing   metal 
	price [   1   ] =    220   ; --    serinjah-sword   ,   Slashing   metal 
	price [   2694   ] =    220   ; --    poisoned serinjah-sword   ,   Slashing   metal 
	price [   2946   ] =    440   ; --    hatchet   ,   Slashing   metal 
	price [   2642   ] =    480   ; --    orc axe   ,   Slashing   metal 
	price [   88   ] =    560   ; --    longaxe   ,   Slashing   metal 
	price [   2757   ] =    600   ; --    scimitar   ,   Slashing   metal 
	price [   77   ] =    620   ; --    halberd   ,   Slashing   metal 
	price [   204   ] =    660   ; --    bastard sword   ,   Slashing   metal 
	price [   2655   ] =    880   ; --    poisened broadsword   ,   Slashing   metal 
	price [   2658   ] =    880   ; --    broadsword   ,   Slashing   metal 
	price [   383   ] =    960   ; --    waraxe   ,   Slashing   metal 
	price [   84   ] =    1100   ; --    gilded longsword   ,   Slashing   metal 
	price [   85   ] =    1100   ; --    coppered longsword   ,   Slashing   metal 
	price [   98   ] =    1100   ; --    silvered longsword   ,   Slashing   metal 
	price [   123   ] =    1100   ; --    merinium-plated longsword   ,   Slashing   metal 
	price [   2701   ] =    1100   ; --    longsword   ,   Slashing   metal 
	price [   2705   ] =    1100   ; --    poisoned longsword   ,   Slashing   metal 
	price [   124   ] =    1200   ; --    gilded battle axe   ,   Slashing   metal 
	price [   192   ] =    1200   ; --    coppered battle axe   ,   Slashing   metal 
	price [   229   ] =    1200   ; --    silvered battle axe   ,   Slashing   metal 
	price [   296   ] =    1200   ; --    merinium-plated battle axe   ,   Slashing   metal 
	price [   2629   ] =    1200   ; --    light battleaxt   ,   Slashing   metal 
	price [   2731   ] =    1300   ; --    two-handed sword   ,   Slashing   metal 
	price [   2778   ] =    1300   ; --    elvensword   ,   Slashing   metal 
	price [   188   ] =    1400   ; --    large waraxe   ,   Slashing   metal 
	price [   2660   ] =    1600   ; --    dwarven axe   ,   Slashing   metal 
	price [   2788   ] =    1700   ; --    snake sword   ,   Slashing   metal 
	price [   2775   ] =    1900   ; --    elven rainbowsword   ,   Slashing   metal 
	price [   205   ] =    2000   ; --    double axe   ,   Slashing   metal 
	price [   2636   ] =    2000   ; --    poisoned longaxe   ,   Slashing   metal 
	price [   2777   ] =    3100   ; --    drow blade   ,   Slashing   metal 
	price [   3035   ] =    3200   ; --    drow sword   ,   Slashing   metal 
	price [   2656   ] =    3700   ; --    fire broadsword   ,   Slashing   metal 
	price [   206   ] =    3800   ; --    fire longsword   ,   Slashing   metal 
	price [   2627   ] =    4000   ; --    fire waraxe   ,   Slashing   metal 
	price [   2640   ] =    4100   ; --    large fire-waraxe   ,   Slashing   metal 
	price [   2693   ] =    4400   ; --    magical serinjah-sword   ,   Slashing   metal 
	price [   2654   ] =    4600   ; --    magical broadsword   ,   Slashing   metal 
	price [   2704   ] =    4900   ; --    magical longsword   ,   Slashing   metal 
	price [   2626   ] =    5100   ; --    magical waraxe   ,   Slashing   metal 
	price [   2662   ] =    5200   ; --    magical dwarven axe   ,   Slashing   metal 
	price [   445   ] =    80   ; --    wooden sword   ,   Slashing   wood 
	price [   78   ] =    200   ; --    machete   ,   Sword   metal 
	price [   25   ] =    540   ; --    sabre   ,   Sword   metal 
	price [   58   ] =    200   ; --    mortar   ,   Tool   default 
	price [   734   ] =    200   ; --    brick mold   ,   Tool   default 
	price [   799   ] =    200   ; --    wicker basket   ,   Tool   default 
	price [   6   ] =    200   ; --    scissors   ,   Tool   metal 
	price [   9   ] =    200   ; --    saw   ,   Tool   metal 
	price [   23   ] =    200   ; --    hammer   ,   Tool   metal 
	price [   24   ] =    200   ; --    shovel   ,   Tool   metal 
	price [   47   ] =    200   ; --    needle   ,   Tool   metal 
	price [   74   ] =    200   ; --    hatchet   ,   Tool   metal 
	price [   122   ] =    200   ; --    finesmithing hammer   ,   Tool   metal 
	price [   126   ] =    200   ; --    sickle   ,   Tool   metal 
	price [   271   ] =    200   ; --    scythe   ,   Tool   metal 
	price [   311   ] =    200   ; --    glass blow pipe   ,   Tool   metal 
	price [   737   ] =    200   ; --    chisel   ,   Tool   metal 
	price [   739   ] =    200   ; --    Lock picks   ,   Tool   metal 
	price [   1008   ] =    200   ; --    cauldron   ,   Tool   metal 
	price [   2140   ] =    200   ; --    tongs   ,   Tool   metal 
	price [   2495   ] =    200   ; --    pan   ,   Tool   metal 
	price [   2659   ] =    200   ; --    nail board   ,   Tool   metal 
	price [   2697   ] =    200   ; --    rasp   ,   Tool   metal 
	price [   2709   ] =    200   ; --    carpenter hammer   ,   Tool   metal 
	price [   2710   ] =    200   ; --    mould   ,   Tool   metal 
	price [   2715   ] =    200   ; --    slicer   ,   Tool   metal 
	price [   2746   ] =    200   ; --    razor blade   ,   Tool   metal 
	price [   2747   ] =    200   ; --    crucible   ,   Tool   metal 
	price [   2748   ] =    200   ; --    crucible   ,   Tool   metal 
	price [   2751   ] =    200   ; --    crucible-pincers   ,   Tool   metal 
	price [   2752   ] =    200   ; --    carving tools   ,   Tool   metal 
	price [   2763   ] =    200   ; --    pick-axe   ,   Tool   metal 
	price [   51   ] =    200   ; --    bucket   ,   Tool   wood 
	price [   72   ] =    200   ; --    fishing rod   ,   Tool   wood 
	price [   118   ] =    200   ; --    rolling pin   ,   Tool   wood 
	price [   121   ] =    200   ; --    peel   ,   Tool   wood 
	price [   227   ] =    200   ; --    cooking spoon   ,   Tool   wood 
	price [   258   ] =    200   ; --    flail   ,   Tool   wood 
	price [   312   ] =    200   ; --    wooden shovel   ,   Tool   wood 
	price [   429   ] =    200   ; --    candle mold   ,   Tool   wood 
	price [   2781   ] =    200   ; --    dying rod   ,   Tool   wood 
	price [   2782   ] =    6000   ; --    earthwand   ,   Wand   wood 
	price [   2783   ] =    6000   ; --    wand of fire   ,   Wand   wood 
	price [   2784   ] =    6000   ; --    wand of water   ,   Wand   wood 
	price [   2785   ] =    6000   ; --    wand of wind   ,   Wand   wood
end
	if price[id]~=nil then
		return price[id];
	else
		return 0;
	end
end

function AddItemToPool(pool,myOrderNPC,nid,ntime,nchance,nmincount,nmaxcount)
   --OrderPoolItem(nid,nnumber,nprice,ntime,nchance,nmincount,nmaxcount,nmincoins)
	myOrderNPC.orderPool:addItemToPool(pool,OrderPoolItem(nid, 1,0.25*Price(nid),ntime,nchance,nmincount,nmaxcount,0.05*Price(nid)));
	return;   
end


  --[[
   --Pool 1(Glassblowing ressources): quartz sand, Ash and glass ingot without any quality
    AddItemToPool(1,myOrderNPC,316,1,15,10,50);--quarz sand
    AddItemToPool(1,myOrderNPC,314,1,15,20,50);--pott ash
    AddItemToPool(1,myOrderNPC, 41,1,15,10,50);--glass ingot
	--item quality for pool 1 is always zero and holds in general only raw materials
    myOrderNPC.orderPool:setQualityChancesForPool(1,{100,0,0,0,0,0,0,0,0,0});
   
   --Pool 2(finesmithing ressources): gold ingot, amethyst, ruby, blackstone, bluestone, emerald, topaz, diamond 
    AddItemToPool(2,myOrderNPC,236,2, 5, 1, 5);--gold ingot
    AddItemToPool(2,myOrderNPC,197,1,15, 1,20);--amethyst
    AddItemToPool(2,myOrderNPC, 46,1,15, 1,20);--ruby
    AddItemToPool(2,myOrderNPC,283,1,15, 1,20);--blackstone
    AddItemToPool(2,myOrderNPC,284,1,15, 1,20);--bluestone
    AddItemToPool(2,myOrderNPC, 45,1,15, 1,20);--emerald
    AddItemToPool(2,myOrderNPC,198,1,15, 1,20);--topaz
    AddItemToPool(2,myOrderNPC,285,1,15, 1,20);--diamond 
	myOrderNPC.orderPool:setQualityChancesForPool(2,{100,0,0,0,0,0,0,0,0,0}); --]] 









--[[

   --Pool 1(Glassblowing ressources): quartz sand, Ash and glass ingot without any quality
 
    myOrderNPC.orderPool:addItemToPool(1,OrderPoolItem(316, 1,0.25*Price(316),1,15,10,50,0.05*Price(316)));--quarz sand
    myOrderNPC.orderPool:addItemToPool(1,OrderPoolItem(314, 1,0.25*Price(314),1,15,20,50,0.05*Price(314)));--pott ash
    myOrderNPC.orderPool:addItemToPool(1,OrderPoolItem(41 , 1,0.25*Price(41) ,1,15,20,50,0.05*Price(41))); --glass ingot
	--item quality for pool 1 is always zero and holds in general only raw materials
    myOrderNPC.orderPool:setQualityChancesForPool(1,{100,0,0,0,0,0,0,0,0,0});
   
   --Pool 2(finesmithing ressources): gold ingot, amethyst, ruby, blackstone, bluestone, emerald, topaz, diamond 
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(236, 1,0.25*Price(236), 1,5,1,5, 0.05*Price(236))); --gold ingot
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(197, 1,0.25*Price(197),1,15,1,20,0.05*Price(197))); --amethyst
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem( 46, 1,0.25*Price(46),1,15,1,20, 0.05*Price(46)));  --ruby
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(283, 1,0.25*Price(283),1,15,1,20,0.05*Price(283))); --blackstone
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(284, 1,0.25*Price(284),1,15,1,20,0.05*Price(284))); --bluestone
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(45,  1,0.25*Price(45),1,15,1,20, 0.05*Price(45)));  --emerald
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(108, 1,0.25*Price(108),1,15,1,20,0.05*Price(108))); --topaz
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(285, 1,0.25*Price(285),1,15,1,20,0.05*Price(285))); --diamond
 
	myOrderNPC.orderPool:setQualityChancesForPool(2,{100,0,0,0,0,0,0,0,0,0}); 
   
 ]]--   
 --[[  
   --Pool 2(Carpentry ressources): boughs, conifer wooden boards, Apple Wooden Boards
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(56,  1,0.25*Price(56),  1,15,10,50,0.05*Price(56)));   --bough
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(2543,1,0.25*Price(2543),1,15,20,50,0.05*Price(2543))); --conifer wooden boards
    myOrderNPC.orderPool:addItemToPool(2,OrderPoolItem(2716,1,0.25*Price(2716),1,15,20,50,0.05*Price(2716)));--apple wooden boards
    
	myOrderNPC.orderPool:setQualityChancesForPool(2,{100,0,0,0,0,0,0,0,0,0});  
	]]--
	
--[[	

   --Pool 3(Glassblowing easy items): --Small Empty Bottle, Empty Bottle, Large Empty Bottle
    myOrderNPC.orderPool:addItemToPool(3,OrderPoolItem(1317,  1,0.25*Price(1317),1,20,5,30,0.05*Price(1317))); --Small Empty Bottle
    myOrderNPC.orderPool:addItemToPool(3,OrderPoolItem(164,   1,0.25*Price(164), 1,15,5,30,0.05*Price(164))); --Empty Bottle
    myOrderNPC.orderPool:addItemToPool(3,OrderPoolItem(2498,  1,0.25*Price(2498),1,10,1,15,0.05*Price(2498))); --Large Empty Bottle
	--chances for qualities of pool 3 
    myOrderNPC.orderPool:setQualityChancesForPool(3,{100,0,0,0,0,0,0,0,0,0}); 
	
   --Pool 4(Glassblowing middle hard items): Large Empty Bottle, Glass, Glass Mug
    myOrderNPC.orderPool:addItemToPool(4,OrderPoolItem(2498,  1,0.25*Price(2498),1,20,5,30,0.05*Price(2498))); --Large Empty Bottle	
	myOrderNPC.orderPool:addItemToPool(4,OrderPoolItem(2055,  1,0.25*Price(2055),1,15,5,30,0.05*Price(2055))); --Glass
    myOrderNPC.orderPool:addItemToPool(4,OrderPoolItem(1908,  1,0.25*Price(1908),1,10,1,15,0.05*Price(1908))); --Glass Mug
	--chances for qualities of pool 4 
    myOrderNPC.orderPool:setQualityChancesForPool(4,{100,0,0,0,0,0,0,0,0,0}); 
	--myOrderNPC.orderPool:setQualityChancesForPool(4,{5,20,15,15,10,10,10,5,5,5});

   --Pool 5(Glassblowing difficult items): Glass, Glass Muge,Vase 
	myOrderNPC.orderPool:addItemToPool(5,OrderPoolItem(2055,  1,0.25*Price(2055),1,15,5,20,0.05*Price(2055))); --Glass
    myOrderNPC.orderPool:addItemToPool(5,OrderPoolItem(1908,  1,0.25*Price(1908),1,10,1,15,0.05*Price(1908))); --Glass Mug
    myOrderNPC.orderPool:addItemToPool(5,OrderPoolItem(315,   1,0.25*Price(315), 2,10,1,15,0.05*Price(315))); --Vase
	--chances for qualities of pool 5 
    myOrderNPC.orderPool:setQualityChancesForPool(5,{100,0,0,0,0,0,0,0,0,0});
	
   --Pool 6(Finesmithing easy items): 
	myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(1858,  1,0.25*Price(1858),2,15,5,50,0.05*Price(1858))); --goblet
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(92,    1,0.25*Price(92),1,10,1,30,  0.05*Price(92))); --oil lamp
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(399,   1,0.25*Price(399),1,15,1,20,  0.05*Price(399))); --Candlestick
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(393,   1,0.25*Price(393),  1,10,1,15,0.05*Price(393))); --lantern
    
	myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(1001,  1,0.25*Price(1001),2,15,5,50,0.05*Price(1001))); --plate
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(222,    1,0.25*Price(222),1,10,1,30,  0.05*Price(222)));--amulet
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(79,   1,0.25*Price(79),1,15,1,10,  0.05*Price(79))); --amethyst amulet
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(235,   1,0.25*Price(235),  1,10,1,15,0.05*Price(235))); --Golden Ring
	--chances for qualities of pool 6 
    myOrderNPC.orderPool:setQualityChancesForPool(6,{100,0,0,0,0,0,0,0,0,0});
    ]]--
    
	--[[
   --Pool 6(Carpentry easy items):Pins and Cotters, Pipe, Dyeing Rod,Fishing rod
	myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(2717,  1,0.25*Price(2717),2,15,5,50,0.05*Price(2717))); --Pins and Cotters
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(2744,  1,0.25*Price(2744),1,10,1,30,0.05*Price(2744))); --Pipe
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(2781,  1,0.25*Price(2781),1,15,1,15,0.05*Price(2781))); --Dyeing Rod
    myOrderNPC.orderPool:addItemToPool(6,OrderPoolItem(  72,  1,0.25*Price(72),  1,15,1,15,0.05*Price(72))); --Fishing rod
	
	--chances for qualities of pool 6 
    myOrderNPC.orderPool:setQualityChancesForPool(6,{100,0,0,0,0,0,0,0,0,0});
    

   --Pool 7(Carpentry easy items):Plate, Bowl, Wooden Cup, Comb 
	myOrderNPC.orderPool:addItemToPool(7,OrderPoolItem(2952,  1,0.25*Price(2952),1,15,1,50,0.05*Price(2952))); --Plate 
    myOrderNPC.orderPool:addItemToPool(7,OrderPoolItem(2935,  1,0.25*Price(2935),1,10,1,50,0.05*Price(2935))); --Bowl
    myOrderNPC.orderPool:addItemToPool(7,OrderPoolItem(2185,  1,0.25*Price(2185),1,15,1,50,0.05*Price(2185))); --Wooden Cup
    myOrderNPC.orderPool:addItemToPool(7,OrderPoolItem(  72,  1,0.25*Price(72),  1,15,1,15,0.05*Price(72)));   --Comb
    
	--chances for qualities of pool 7 
    myOrderNPC.orderPool:setQualityChancesForPool(7,{100,0,0,0,0,0,0,0,0,0});

   --Pool 8(Carpentry easy items):Slicer, Cooking Spoon, Wooden Shovel, Candle Mold, Bucket, Peel
	myOrderNPC.orderPool:addItemToPool(8,OrderPoolItem(2715,  1,0.25*Price(2715),1,15,1,15,0.05*Price(2715))); --Slicer
    myOrderNPC.orderPool:addItemToPool(8,OrderPoolItem(227,   1,0.25*Price(227),1,10,1,30, 0.05*Price(227)));  --Cooking Spoon
    myOrderNPC.orderPool:addItemToPool(8,OrderPoolItem(312,   1,0.25*Price(312),1,15,1,15, 0.05*Price(312)));  --Wooden Shovel
    myOrderNPC.orderPool:addItemToPool(8,OrderPoolItem(429,   1,0.25*Price(429),1,15,1,15, 0.05*Price(429)));  --Candle Mold
    myOrderNPC.orderPool:addItemToPool(8,OrderPoolItem(51,    1,0.25*Price(51),1,15,1,15, 0.05*Price(51)));    --Bucket
    myOrderNPC.orderPool:addItemToPool(8,OrderPoolItem(121,   1,0.25*Price(121),1,15,1,15, 0.05*Price(121)));  --Peel
	--chances for qualities of pool 8 
    myOrderNPC.orderPool:setQualityChancesForPool(8,{100,0,0,0,0,0,0,0,0,0});
	--]]
	
--[[	
	--chances for every pool
	myOrderNPC.orderPool.poolchances = {13,13,12,13,12,12,12,13};
	
	--chances for the order urgency: NORMAL,HASTY,URGENT,VERY_URGENT,INSTANT
	myOrderNPC.orderPool.timechances = { 40,30,20,5,5 };

	]]--