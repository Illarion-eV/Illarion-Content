--Name:        Gru'shub
--Race:        Orc
--Town:        Varshikar
--Function:    Public trader
--Position:    x=263 y=-309 z=0
--Facing:      ???
--Last Update: 08/08/2005
--Update by:   Markous

require("npc.base.trader_functions")
module("npc.grushub", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Geh weg!") end
    if (lang==1) then thisNPC:talk(Character.say, "Nhub touch me!") end
end

function initializeNpc()
    TraderItemPrice={};
    TraderItemId={};
    TraderItemNumber={};
    TraderTrig={};
    TraderText={};
    TraderItemSellPrice={};
    TraderItemStandard={};
    TraderItemQuality={};
    TraderItemDura={};

    --originator:inform("Init()");
    thisNPC:increaseSkill(1,"common language",100);
    TraderFirst=1;
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------

    --------------------------------------------- *** THE TRADER SELLS ***-------------------------------------

    --TraderItemPrice[1]=count;              You have to pay (0: the trader does not sell this item)
    --TraderItemId[1]=count;                 ItemID
    --TraderItemNumber[1]=count;              Initial amount in stock
    --TraderItemSellPrice[1]=count;            The trader pays (0: the trader does not buy this item)
    --TraderItemStandard[1]=count;            Standard amount in stock
    --TraderItemQuality[1]={minQual,maxQual};         Quality
    --TraderItemDura[1]={minDura,maxDura};          Durability

    --emerald
    TraderItemPrice[1]=500;
    TraderItemId[1]=45;
    TraderItemNumber[1]=5;
    TraderItemSellPrice[1]=0;
    TraderItemStandard[1]=5;
    TraderItemQuality[1]={4,6};
    TraderItemDura[1]={33,66};
    --ruby
    TraderItemPrice[2]=500;
    TraderItemId[2]=46;
    TraderItemNumber[2]=5;
    TraderItemSellPrice[2]=0;
    TraderItemStandard[2]=5;
    TraderItemQuality[2]={4,6};
    TraderItemDura[2]={33,66};
    --ruby ring
    TraderItemPrice[3]=1200;
    TraderItemId[3]=68;
    TraderItemNumber[3]=5;
    TraderItemSellPrice[3]=0;
    TraderItemStandard[3]=5;
    TraderItemQuality[3]={4,6};
    TraderItemDura[3]={33,66};
    --empty bottle
    TraderItemPrice[4]=10;
    TraderItemId[4]=164;
    TraderItemNumber[4]=10;
    TraderItemSellPrice[4]=0;
    TraderItemStandard[4]=10;
    TraderItemQuality[4]={4,6};
    TraderItemDura[4]={33,66};
    --amethyst
    TraderItemPrice[5]=500;
    TraderItemId[5]=197;
    TraderItemNumber[5]=5;
    TraderItemSellPrice[5]=0;
    TraderItemStandard[5]=5;
    TraderItemQuality[5]={4,6};
    TraderItemDura[5]={33,66};
    --topaz
    TraderItemPrice[6]=500;
    TraderItemId[6]=198;
    TraderItemNumber[6]=5;
    TraderItemSellPrice[6]=0;
    TraderItemStandard[6]=5;
    TraderItemQuality[6]={4,6};
    TraderItemDura[6]={33,66};
    --amulet
    TraderItemPrice[7]=2000;
    TraderItemId[7]=222;
    TraderItemNumber[7]=5;
    TraderItemSellPrice[7]=0;
    TraderItemStandard[7]=5;
    TraderItemQuality[7]={4,6};
    TraderItemDura[7]={33,66};
    --golden goblet
    TraderItemPrice[8]=500;
    TraderItemId[8]=224;
    TraderItemNumber[8]=5;
    TraderItemSellPrice[8]=0;
    TraderItemStandard[8]=5;
    TraderItemQuality[8]={4,6};
    TraderItemDura[8]={33,66};
    --crown
    TraderItemPrice[9]=1000;
    TraderItemId[9]=225;
    TraderItemNumber[9]=5;
    TraderItemSellPrice[9]=0;
    TraderItemStandard[9]=5;
    TraderItemQuality[9]={4,6};
    TraderItemDura[9]={33,66};
    --golden ring
    TraderItemPrice[10]=500;
    TraderItemId[10]=235;
    TraderItemNumber[10]=5;
    TraderItemSellPrice[10]=0;
    TraderItemStandard[10]=5;
    TraderItemQuality[10]={4,6};
    TraderItemDura[10]={33,66};
    --amethyst ring
    TraderItemPrice[11]=1050;
    TraderItemId[11]=277;
    TraderItemNumber[11]=5;
    TraderItemSellPrice[11]=0;
    TraderItemStandard[11]=5;
    TraderItemQuality[11]={4,6};
    TraderItemDura[11]={33,66};
    --blackstone ring
    TraderItemPrice[12]=1100;
    TraderItemId[12]=278;
    TraderItemNumber[12]=5;
    TraderItemSellPrice[12]=0;
    TraderItemStandard[12]=5;
    TraderItemQuality[12]={4,6};
    TraderItemDura[12]={33,66};
    --sapphire ring
    TraderItemPrice[13]=1110;
    TraderItemId[13]=279;
    TraderItemNumber[13]=5;
    TraderItemSellPrice[13]=0;
    TraderItemStandard[13]=5;
    TraderItemQuality[13]={4,6};
    TraderItemDura[13]={33,66};
    --diamond ring
    TraderItemPrice[14]=1250;
    TraderItemId[14]=280;
    TraderItemNumber[14]=5;
    TraderItemSellPrice[14]=0;
    TraderItemStandard[14]=5;
    TraderItemQuality[14]={4,6};
    TraderItemDura[14]={33,66};
    --smaragd ring
    TraderItemPrice[15]=1210;
    TraderItemId[15]=281;
    TraderItemNumber[15]=5;
    TraderItemSellPrice[15]=0;
    TraderItemStandard[15]=5;
    TraderItemQuality[15]={4,6};
    TraderItemDura[15]={33,66};
    --topaz ring
    TraderItemPrice[16]=1600;
    TraderItemId[16]=282;
    TraderItemNumber[16]=5;
    TraderItemSellPrice[16]=0;
    TraderItemStandard[16]=5;
    TraderItemQuality[16]={4,6};
    TraderItemDura[16]={33,66};
    --blackstone
    TraderItemPrice[17]=500;
    TraderItemId[17]=283;
    TraderItemNumber[17]=5;
    TraderItemSellPrice[17]=0;
    TraderItemStandard[17]=5;
    TraderItemQuality[17]={4,6};
    TraderItemDura[17]={33,66};
    --sapphire
    TraderItemPrice[18]=500;
    TraderItemId[18]=284;
    TraderItemNumber[18]=5;
    TraderItemSellPrice[18]=0;
    TraderItemStandard[18]=5;
    TraderItemQuality[18]={4,6};
    TraderItemDura[18]={33,66};
    --diamond
    TraderItemPrice[19]=500;
    TraderItemId[19]=285;
    TraderItemNumber[19]=5;
    TraderItemSellPrice[19]=0;
    TraderItemStandard[19]=5;
    TraderItemQuality[19]={4,6};
    TraderItemDura[19]={33,66};
    --charm of the icebird
    TraderItemPrice[20]=2150;
    TraderItemId[20]=334;
    TraderItemNumber[20]=5;
    TraderItemSellPrice[20]=0;
    TraderItemStandard[20]=5;
    TraderItemQuality[20]={4,6};
    TraderItemDura[20]={33,66};
    --mirror
    TraderItemPrice[21]=1000;
    TraderItemId[21]=336;
    TraderItemNumber[21]=5;
    TraderItemSellPrice[21]=0;
    TraderItemStandard[21]=5;
    TraderItemQuality[21]={4,6};
    TraderItemDura[21]={33,66};
    --salkamaerian armor
    TraderItemPrice[22]=250;
    TraderItemId[22]=2355;
    TraderItemNumber[22]=5;
    TraderItemSellPrice[22]=0;
    TraderItemStandard[22]=5;
    TraderItemQuality[22]={4,6};
    TraderItemDura[22]={33,66};
    --magical ring
    TraderItemPrice[23]=4550;
    TraderItemId[23]=2559;
    TraderItemNumber[23]=5;
    TraderItemSellPrice[23]=0;
    TraderItemStandard[23]=5;
    TraderItemQuality[23]={4,6};
    TraderItemDura[23]={33,66};
    --empty bottle
    TraderItemPrice[24]=20;
    TraderItemId[24]=1317;
    TraderItemNumber[24]=10;
    TraderItemSellPrice[24]=0;
    TraderItemStandard[24]=10;
    TraderItemQuality[24]={4,6};
    TraderItemDura[24]={33,66};
    --clay mug
    TraderItemPrice[25]=30;
    TraderItemId[25]=2183;
    TraderItemNumber[25]=5;
    TraderItemSellPrice[25]=0;
    TraderItemStandard[25]=5;
    TraderItemQuality[25]={4,6};
    TraderItemDura[25]={33,66};
    --clay cup
    TraderItemPrice[26]=30;
    TraderItemId[26]=2184;
    TraderItemNumber[26]=5;
    TraderItemSellPrice[26]=0;
    TraderItemStandard[26]=5;
    TraderItemQuality[26]={4,6};
    TraderItemDura[26]={33,66};
    --wooden cup
    TraderItemPrice[27]=30;
    TraderItemId[27]=2185;
    TraderItemNumber[27]=5;
    TraderItemSellPrice[27]=0;
    TraderItemStandard[27]=5;
    TraderItemQuality[27]={4,6};
    TraderItemDura[27]={33,66};
    --beer mug
    TraderItemPrice[28]=20;
    TraderItemId[28]=1908;
    TraderItemNumber[28]=10;
    TraderItemSellPrice[28]=0;
    TraderItemStandard[28]=10;
    TraderItemQuality[28]={4,6};
    TraderItemDura[28]={33,66};
    --mug with lid
    TraderItemPrice[29]=20;
    TraderItemId[29]=310;
    TraderItemNumber[29]=5;
    TraderItemSellPrice[29]=0;
    TraderItemStandard[29]=5;
    TraderItemQuality[29]={4,6};
    TraderItemDura[29]={33,66};
    --wine glass
    TraderItemPrice[30]=40;
    TraderItemId[30]=2457;
    TraderItemNumber[30]=10;
    TraderItemSellPrice[30]=0;
    TraderItemStandard[30]=10;
    TraderItemQuality[30]={4,6};
    TraderItemDura[30]={33,66};
    --horned helmet
    TraderItemPrice[31]=0;
    TraderItemId[31]=7;
    TraderItemNumber[31]=0;
    TraderItemSellPrice[31]=12;
    TraderItemStandard[31]=5;
    TraderItemQuality[31]={4,6};
    TraderItemDura[31]={33,66};
    --orc helmet
    TraderItemPrice[32]=0;
    TraderItemId[32]=16;
    TraderItemNumber[32]=0;
    TraderItemSellPrice[32]=30;
    TraderItemStandard[32]=5;
    TraderItemQuality[32]={4,6};
    TraderItemDura[32]={33,66};
    --light metal shield
    TraderItemPrice[33]=0;
    TraderItemId[33]=18;
    TraderItemNumber[33]=0;
    TraderItemSellPrice[33]=64;
    TraderItemStandard[33]=5;
    TraderItemQuality[33]={4,6};
    TraderItemDura[33]={33,66};
    --metal shield
    TraderItemPrice[34]=0;
    TraderItemId[34]=19;
    TraderItemNumber[34]=0;
    TraderItemSellPrice[34]=90;
    TraderItemStandard[34]=5;
    TraderItemQuality[34]={4,6};
    TraderItemDura[34]={33,66};
    --large metal shield
    TraderItemPrice[35]=0;
    TraderItemId[35]=20;
    TraderItemNumber[35]=0;
    TraderItemSellPrice[35]=120;
    TraderItemStandard[35]=5;
    TraderItemQuality[35]={4,6};
    TraderItemDura[35]={33,66};
    --black trousers
    TraderItemPrice[36]=0;
    TraderItemId[36]=34;
    TraderItemNumber[36]=0;
    TraderItemSellPrice[36]=12;
    TraderItemStandard[36]=5;
    TraderItemQuality[36]={4,6};
    TraderItemDura[36]={33,66};
    --skull staff
    TraderItemPrice[37]=0;
    TraderItemId[37]=39;
    TraderItemNumber[37]=0;
    TraderItemSellPrice[37]=140;
    TraderItemStandard[37]=5;
    TraderItemQuality[37]={4,6};
    TraderItemDura[37]={33,66};
    --cleric's staff
    TraderItemPrice[38]=0;
    TraderItemId[38]=40;
    TraderItemNumber[38]=0;
    TraderItemSellPrice[38]=80;
    TraderItemStandard[38]=5;
    TraderItemQuality[38]={4,6};
    TraderItemDura[38]={33,66};
    --leather gloves
    TraderItemPrice[39]=0;
    TraderItemId[39]=48;
    TraderItemNumber[39]=0;
    TraderItemSellPrice[39]=2;
    TraderItemStandard[39]=5;
    TraderItemQuality[39]={4,6};
    TraderItemDura[39]={33,66};
    --bread
    TraderItemPrice[40]=0;
    TraderItemId[40]=49;
    TraderItemNumber[40]=0;
    TraderItemSellPrice[40]=10;
    TraderItemStandard[40]=15;
    TraderItemQuality[40]={4,6};
    TraderItemDura[40]={33,66};
    --leather boots
    TraderItemPrice[41]=0;
    TraderItemId[41]=53;
    TraderItemNumber[41]=0;
    TraderItemSellPrice[41]=12;
    TraderItemStandard[41]=5;
    TraderItemQuality[41]={4,6};
    TraderItemDura[41]={33,66};
    --green robe
    TraderItemPrice[42]=0;
    TraderItemId[42]=55;
    TraderItemNumber[42]=0;
    TraderItemSellPrice[42]=12;
    TraderItemStandard[42]=5;
    TraderItemQuality[42]={4,6};
    TraderItemDura[42]={33,66};
    --simple mage's staff
    TraderItemPrice[43]=0;
    TraderItemId[43]=57;
    TraderItemNumber[43]=0;
    TraderItemSellPrice[43]=140;
    TraderItemStandard[43]=5;
    TraderItemQuality[43]={4,6};
    TraderItemDura[43]={33,66};
    --short bow
    TraderItemPrice[44]=0;
    TraderItemId[44]=65;
    TraderItemNumber[44]=0;
    TraderItemSellPrice[44]=20;
    TraderItemStandard[44]=5;
    TraderItemQuality[44]={4,6};
    TraderItemDura[44]={33,66};
    --crossbow
    TraderItemPrice[45]=0;
    TraderItemId[45]=70;
    TraderItemNumber[45]=0;
    TraderItemSellPrice[45]=140;
    TraderItemStandard[45]=5;
    TraderItemQuality[45]={4,6};
    TraderItemDura[45]={33,66};
    --hatchet
    TraderItemPrice[46]=0;
    TraderItemId[46]=74;
    TraderItemNumber[46]=0;
    TraderItemSellPrice[46]=20;
    TraderItemStandard[46]=5;
    TraderItemQuality[46]={4,6};
    TraderItemDura[46]={33,66};
    --mage's staff
    TraderItemPrice[47]=0;
    TraderItemId[47]=76;
    TraderItemNumber[47]=0;
    TraderItemSellPrice[47]=220;
    TraderItemStandard[47]=5;
    TraderItemQuality[47]={4,6};
    TraderItemDura[47]={33,66};
    --halberd
    TraderItemPrice[48]=0;
    TraderItemId[48]=77;
    TraderItemNumber[48]=0;
    TraderItemSellPrice[48]=100;
    TraderItemStandard[48]=5;
    TraderItemQuality[48]={4,6};
    TraderItemDura[48]={33,66};
    --banana
    TraderItemPrice[49]=0;
    TraderItemId[49]=80;
    TraderItemNumber[49]=0;
    TraderItemSellPrice[49]=2;
    TraderItemStandard[49]=15;
    TraderItemQuality[49]={4,6};
    TraderItemDura[49]={33,66};
    --berries
    TraderItemPrice[50]=0;
    TraderItemId[50]=81;
    TraderItemNumber[50]=0;
    TraderItemSellPrice[50]=1;
    TraderItemStandard[50]=15;
    TraderItemQuality[50]={4,6};
    TraderItemDura[50]={33,66};
    --pot helmet
    TraderItemPrice[51]=0;
    TraderItemId[51]=94;
    TraderItemNumber[51]=0;
    TraderItemSellPrice[51]=160;
    TraderItemStandard[51]=5;
    TraderItemQuality[51]={4,6};
    TraderItemDura[51]={33,66};
    --heraldic shield
    TraderItemPrice[52]=0;
    TraderItemId[52]=95;
    TraderItemNumber[52]=0;
    TraderItemSellPrice[52]=160;
    TraderItemStandard[52]=5;
    TraderItemQuality[52]={4,6};
    TraderItemDura[52]={33,66};
    --steel tower shield
    TraderItemPrice[53]=0;
    TraderItemId[53]=96;
    TraderItemNumber[53]=0;
    TraderItemSellPrice[53]=150;
    TraderItemStandard[53]=5;
    TraderItemQuality[53]={4,6};
    TraderItemDura[53]={33,66};
    --fourleafed oneberry
    TraderItemPrice[54]=0;
    TraderItemId[54]=134;
    TraderItemNumber[54]=0;
    TraderItemSellPrice[54]=4;
    TraderItemStandard[54]=10;
    TraderItemQuality[54]={4,6};
    TraderItemDura[54]={33,66};
    --flamegoblet blossom
    TraderItemPrice[55]=0;
    TraderItemId[55]=137;
    TraderItemNumber[55]=0;
    TraderItemSellPrice[55]=4;
    TraderItemStandard[55]=10;
    TraderItemQuality[55]={4,6};
    TraderItemDura[55]={33,66};
    --night angels blossom
    TraderItemPrice[56]=0;
    TraderItemId[56]=138;
    TraderItemNumber[56]=0;
    TraderItemSellPrice[56]=4;
    TraderItemStandard[56]=10;
    TraderItemQuality[56]={4,6};
    TraderItemDura[56]={33,66};
    --donf blade
    TraderItemPrice[57]=0;
    TraderItemId[57]=140;
    TraderItemNumber[57]=0;
    TraderItemSellPrice[57]=4;
    TraderItemStandard[57]=10;
    TraderItemQuality[57]={4,6};
    TraderItemDura[57]={33,66};
    --black thirstel
    TraderItemPrice[58]=0;
    TraderItemId[58]=141;
    TraderItemNumber[58]=0;
    TraderItemSellPrice[58]=4;
    TraderItemStandard[58]=10;
    TraderItemQuality[58]={4,6};
    TraderItemDura[58]={33,66};
    --red elder
    TraderItemPrice[59]=0;
    TraderItemId[59]=143;
    TraderItemNumber[59]=0;
    TraderItemSellPrice[59]=4;
    TraderItemStandard[59]=10;
    TraderItemQuality[59]={4,6};
    TraderItemDura[59]={33,66};
    --heath flower
    TraderItemPrice[60]=0;
    TraderItemId[60]=145;
    TraderItemNumber[60]=0;
    TraderItemSellPrice[60]=4;
    TraderItemStandard[60]=10;
    TraderItemQuality[60]={4,6};
    TraderItemDura[60]={33,66};
    --black berry
    TraderItemPrice[61]=0;
    TraderItemId[61]=147;
    TraderItemNumber[61]=0;
    TraderItemSellPrice[61]=4;
    TraderItemStandard[61]=10;
    TraderItemQuality[61]={4,6};
    TraderItemDura[61]={33,66};
    --strawberry
    TraderItemPrice[62]=0;
    TraderItemId[62]=151;
    TraderItemNumber[62]=0;
    TraderItemSellPrice[62]=4;
    TraderItemStandard[62]=10;
    TraderItemQuality[62]={4,6};
    TraderItemDura[62]={33,66};
    --hop
    TraderItemPrice[63]=0;
    TraderItemId[63]=154;
    TraderItemNumber[63]=0;
    TraderItemSellPrice[63]=4;
    TraderItemStandard[63]=10;
    TraderItemQuality[63]={4,6};
    TraderItemDura[63]={33,66};
    --bulbsponge mushroom
    TraderItemPrice[64]=0;
    TraderItemId[64]=158;
    TraderItemNumber[64]=0;
    TraderItemSellPrice[64]=4;
    TraderItemStandard[64]=10;
    TraderItemQuality[64]={4,6};
    TraderItemDura[64]={33,66};
    --toadstool
    TraderItemPrice[65]=0;
    TraderItemId[65]=159;
    TraderItemNumber[65]=0;
    TraderItemSellPrice[65]=4;
    TraderItemStandard[65]=10;
    TraderItemQuality[65]={4,6};
    TraderItemDura[65]={33,66};
    --red head
    TraderItemPrice[66]=0;
    TraderItemId[66]=160;
    TraderItemNumber[66]=0;
    TraderItemSellPrice[66]=4;
    TraderItemStandard[66]=10;
    TraderItemQuality[66]={4,6};
    TraderItemDura[66]={33,66};
    --herders mushroom
    TraderItemPrice[67]=0;
    TraderItemId[67]=161;
    TraderItemNumber[67]=0;
    TraderItemSellPrice[67]=4;
    TraderItemStandard[67]=10;
    TraderItemQuality[67]={4,6};
    TraderItemDura[67]={33,66};
    --birth mushroom
    TraderItemPrice[68]=0;
    TraderItemId[68]=162;
    TraderItemNumber[68]=0;
    TraderItemSellPrice[68]=4;
    TraderItemStandard[68]=10;
    TraderItemQuality[68]={4,6};
    TraderItemDura[68]={33,66};
    --champignon
    TraderItemPrice[69]=0;
    TraderItemId[69]=163;
    TraderItemNumber[69]=0;
    TraderItemSellPrice[69]=4;
    TraderItemStandard[69]=10;
    TraderItemQuality[69]={4,6};
    TraderItemDura[69]={33,66};
    --red shirt
    TraderItemPrice[70]=0;
    TraderItemId[70]=180;
    TraderItemNumber[70]=0;
    TraderItemSellPrice[70]=2;
    TraderItemStandard[70]=5;
    TraderItemQuality[70]={4,6};
    TraderItemDura[70]={33,66};
    --blue shirt
    TraderItemPrice[71]=0;
    TraderItemId[71]=181;
    TraderItemNumber[71]=0;
    TraderItemSellPrice[71]=2;
    TraderItemStandard[71]=5;
    TraderItemQuality[71]={4,6};
    TraderItemDura[71]={33,66};
    --black shirt
    TraderItemPrice[72]=0;
    TraderItemId[72]=182;
    TraderItemNumber[72]=0;
    TraderItemSellPrice[72]=2;
    TraderItemStandard[72]=5;
    TraderItemQuality[72]={4,6};
    TraderItemDura[72]={33,66};
    --green trousers
    TraderItemPrice[73]=0;
    TraderItemId[73]=183;
    TraderItemNumber[73]=0;
    TraderItemSellPrice[73]=12;
    TraderItemStandard[73]=5;
    TraderItemQuality[73]={4,6};
    TraderItemDura[73]={33,66};
    --visored helmet
    TraderItemPrice[74]=0;
    TraderItemId[74]=184;
    TraderItemNumber[74]=0;
    TraderItemSellPrice[74]=200;
    TraderItemStandard[74]=5;
    TraderItemQuality[74]={4,6};
    TraderItemDura[74]={33,66};
    --black visored helmet
    TraderItemPrice[75]=0;
    TraderItemId[75]=185;
    TraderItemNumber[75]=0;
    TraderItemSellPrice[75]=320;
    TraderItemStandard[75]=5;
    TraderItemQuality[75]={4,6};
    TraderItemDura[75]={33,66};
    --round metal shield
    TraderItemPrice[76]=0;
    TraderItemId[76]=186;
    TraderItemNumber[76]=0;
    TraderItemSellPrice[76]=64;
    TraderItemStandard[76]=5;
    TraderItemQuality[76]={4,6};
    TraderItemDura[76]={33,66};
    --steel hat
    TraderItemPrice[77]=0;
    TraderItemId[77]=187;
    TraderItemNumber[77]=0;
    TraderItemSellPrice[77]=30;
    TraderItemStandard[77]=5;
    TraderItemQuality[77]={4,6};
    TraderItemDura[77]={33,66};
    --bred roll
    TraderItemPrice[78]=0;
    TraderItemId[78]=191;
    TraderItemNumber[78]=0;
    TraderItemSellPrice[78]=10;
    TraderItemStandard[78]=5;
    TraderItemQuality[78]={4,6};
    TraderItemDura[78]={33,66};
    --tangerine
    TraderItemPrice[79]=0;
    TraderItemId[79]=199;
    TraderItemNumber[79]=0;
    TraderItemSellPrice[79]=1;
    TraderItemStandard[79]=15;
    TraderItemQuality[79]={4,6};
    TraderItemDura[79]={33,66};
    --tomato
    TraderItemPrice[80]=0;
    TraderItemId[80]=200;
    TraderItemNumber[80]=0;
    TraderItemSellPrice[80]=1;
    TraderItemStandard[80]=15;
    TraderItemQuality[80]={4,6};
    TraderItemDura[80]={33,66};
    --onion
    TraderItemPrice[81]=0;
    TraderItemId[81]=201;
    TraderItemNumber[81]=0;
    TraderItemSellPrice[81]=1;
    TraderItemStandard[81]=15;
    TraderItemQuality[81]={4,6};
    TraderItemDura[81]={33,66};
    --cabbage
    TraderItemPrice[82]=0;
    TraderItemId[82]=290;
    TraderItemNumber[82]=0;
    TraderItemSellPrice[82]=4;
    TraderItemStandard[82]=10;
    TraderItemQuality[82]={4,6};
    TraderItemDura[82]={33,66};
    --cherry cake
    TraderItemPrice[83]=0;
    TraderItemId[83]=303;
    TraderItemNumber[83]=0;
    TraderItemSellPrice[83]=40;
    TraderItemStandard[83]=15;
    TraderItemQuality[83]={4,6};
    TraderItemDura[83]={33,66};
    --ham
    TraderItemPrice[84]=0;
    TraderItemId[84]=306;
    TraderItemNumber[84]=0;
    TraderItemSellPrice[84]=20;
    TraderItemStandard[84]=15;
    TraderItemQuality[84]={4,6};
    TraderItemDura[84]={33,66};
    --apple pie
    TraderItemPrice[85]=0;
    TraderItemId[85]=353;
    TraderItemNumber[85]=0;
    TraderItemSellPrice[85]=30;
    TraderItemStandard[85]=15;
    TraderItemQuality[85]={4,6};
    TraderItemDura[85]={33,66};
    --strawberry cake
    TraderItemPrice[86]=0;
    TraderItemId[86]=354;
    TraderItemNumber[86]=0;
    TraderItemSellPrice[86]=40;
    TraderItemStandard[86]=15;
    TraderItemQuality[86]={4,6};
    TraderItemDura[86]={33,66};
    --mulligan
    TraderItemPrice[87]=0;
    TraderItemId[87]=2276;
    TraderItemNumber[87]=0;
    TraderItemSellPrice[87]=20;
    TraderItemStandard[87]=15;
    TraderItemQuality[87]={4,6};
    TraderItemDura[87]={33,66};
    --meat dish
    TraderItemPrice[88]=0;
    TraderItemId[88]=2277;
    TraderItemNumber[88]=0;
    TraderItemSellPrice[88]=20;
    TraderItemStandard[88]=15;
    TraderItemQuality[88]={4,6};
    TraderItemDura[88]={33,66};
    --cabbage stew
    TraderItemPrice[89]=0;
    TraderItemId[89]=2278;
    TraderItemNumber[89]=0;
    TraderItemSellPrice[89]=20;
    TraderItemStandard[89]=15;
    TraderItemQuality[89]={4,6};
    TraderItemDura[89]={33,66};
    --mushroom soup
    TraderItemPrice[90]=0;
    TraderItemId[90]=2456;
    TraderItemNumber[90]=0;
    TraderItemSellPrice[90]=30;
    TraderItemStandard[90]=15;
    TraderItemQuality[90]={4,6};
    TraderItemDura[90]={33,66};
    --fish filet dish
    TraderItemPrice[91]=0;
    TraderItemId[91]=2459;
    TraderItemNumber[91]=0;
    TraderItemSellPrice[91]=20;
    TraderItemStandard[91]=15;
    TraderItemQuality[91]={4,6};
    TraderItemDura[91]={33,66};
    --carrots
    TraderItemPrice[92]=0;
    TraderItemId[92]=2493;
    TraderItemNumber[92]=0;
    TraderItemSellPrice[92]=4;
    TraderItemStandard[92]=15;
    TraderItemQuality[92]={4,6};
    TraderItemDura[92]={33,66};
    --sausages dish
    TraderItemPrice[93]=0;
    TraderItemId[93]=2922;
    TraderItemNumber[93]=0;
    TraderItemSellPrice[93]=20;
    TraderItemStandard[93]=15;
    TraderItemQuality[93]={4,6};
    TraderItemDura[93]={33,66};
    --onion soup
    TraderItemPrice[94]=0;
    TraderItemId[94]=2923;
    TraderItemNumber[94]=0;
    TraderItemSellPrice[94]=6;
    TraderItemStandard[94]=15;
    TraderItemQuality[94]={4,6};
    TraderItemDura[94]={33,66};
    --ham
    TraderItemPrice[95]=0;
    TraderItemId[95]=306;
    TraderItemNumber[95]=0;
    TraderItemSellPrice[95]=20;
    TraderItemStandard[95]=15;
    TraderItemQuality[95]={4,6};
    TraderItemDura[95]={33,66};
    --lamb meat
    TraderItemPrice[96]=0;
    TraderItemId[96]=2934;
    TraderItemNumber[96]=0;
    TraderItemSellPrice[96]=0;
    TraderItemStandard[96]=15;
    TraderItemQuality[96]={4,6};
    TraderItemDura[96]={33,66};
    --steak
    TraderItemPrice[97]=0;
    TraderItemId[97]=2940;
    TraderItemNumber[97]=0;
    TraderItemSellPrice[97]=14;
    TraderItemStandard[97]=15;
    TraderItemQuality[97]={4,6};
    TraderItemDura[97]={33,66};
    --sausage
    TraderItemPrice[98]=0;
    TraderItemId[98]=3051;
    TraderItemNumber[98]=0;
    TraderItemSellPrice[98]=10;
    TraderItemStandard[98]=15;
    TraderItemQuality[98]={4,6};
    TraderItemDura[98]={33,66};
    --blue robe
    TraderItemPrice[99]=0;
    TraderItemId[99]=193;
    TraderItemNumber[99]=0;
    TraderItemSellPrice[99]=12;
    TraderItemStandard[99]=5;
    TraderItemQuality[99]={4,6};
    TraderItemDura[99]={33,66};
    --black robe
    TraderItemPrice[100]=0;
    TraderItemId[100]=194;
    TraderItemNumber[100]=0;
    TraderItemSellPrice[100]=12;
    TraderItemStandard[100]=5;
    TraderItemQuality[100]={4,6};
    TraderItemDura[100]={33,66};
    --yellow robe
    TraderItemPrice[101]=0;
    TraderItemId[101]=195;
    TraderItemNumber[101]=0;
    TraderItemSellPrice[101]=12;
    TraderItemStandard[101]=5;
    TraderItemQuality[101]={4,6};
    TraderItemDura[101]={33,66};
    --grey coat
    TraderItemPrice[102]=0;
    TraderItemId[102]=196;
    TraderItemNumber[102]=0;
    TraderItemSellPrice[102]=12;
    TraderItemStandard[102]=5;
    TraderItemQuality[102]={4,6};
    TraderItemDura[102]={33,66};
    --hat
    TraderItemPrice[103]=0;
    TraderItemId[103]=356;
    TraderItemNumber[103]=0;
    TraderItemSellPrice[103]=2;
    TraderItemStandard[103]=5;
    TraderItemQuality[103]={4,6};
    TraderItemDura[103]={33,66};
    --blue wizard hat
    TraderItemPrice[104]=0;
    TraderItemId[104]=357;
    TraderItemNumber[104]=0;
    TraderItemSellPrice[104]=12;
    TraderItemStandard[104]=5;
    TraderItemQuality[104]={4,6};
    TraderItemDura[104]={33,66};
    --red wizard hat
    TraderItemPrice[105]=0;
    TraderItemId[105]=358;
    TraderItemNumber[105]=0;
    TraderItemSellPrice[105]=18;
    TraderItemStandard[105]=5;
    TraderItemQuality[105]={4,6};
    TraderItemDura[105]={33,66};
    --yellow priest robe
    TraderItemPrice[106]=0;
    TraderItemId[106]=368;
    TraderItemNumber[106]=0;
    TraderItemSellPrice[106]=22;
    TraderItemStandard[106]=5;
    TraderItemQuality[106]={4,6};
    TraderItemDura[106]={33,66};
    --colourful wizard hat
    TraderItemPrice[107]=0;
    TraderItemId[107]=370;
    TraderItemNumber[107]=0;
    TraderItemSellPrice[107]=98;
    TraderItemStandard[107]=5;
    TraderItemQuality[107]={4,6};
    TraderItemDura[107]={33,66};
    --expensive wizard hat
    TraderItemPrice[108]=0;
    TraderItemId[108]=371;
    TraderItemNumber[108]=0;
    TraderItemSellPrice[108]=102;
    TraderItemStandard[108]=5;
    TraderItemQuality[108]={4,6};
    TraderItemDura[108]={33,66};
    --blue dress
    TraderItemPrice[109]=0;
    TraderItemId[109]=385;
    TraderItemNumber[109]=0;
    TraderItemSellPrice[109]=6;
    TraderItemStandard[109]=5;
    TraderItemQuality[109]={4,6};
    TraderItemDura[109]={33,66};
    --cloth gloves
    TraderItemPrice[110]=0;
    TraderItemId[110]=2295;
    TraderItemNumber[110]=0;
    TraderItemSellPrice[110]=20;
    TraderItemStandard[110]=5;
    TraderItemQuality[110]={4,6};
    TraderItemDura[110]={33,66};
    --red mage robe
    TraderItemPrice[111]=0;
    TraderItemId[111]=2377;
    TraderItemNumber[111]=0;
    TraderItemSellPrice[111]=22;
    TraderItemStandard[111]=5;
    TraderItemQuality[111]={4,6};
    TraderItemDura[111]={33,66};
    --blue coat
    TraderItemPrice[112]=0;
    TraderItemId[112]=2380;
    TraderItemNumber[112]=0;
    TraderItemSellPrice[112]=22;
    TraderItemStandard[112]=5;
    TraderItemQuality[112]={4,6};
    TraderItemDura[112]={33,66};
    --black coat
    TraderItemPrice[113]=0;
    TraderItemId[113]=2384;
    TraderItemNumber[113]=0;
    TraderItemSellPrice[113]=22;
    TraderItemStandard[113]=5;
    TraderItemQuality[113]={4,6};
    TraderItemDura[113]={33,66};
    --brown priest robe
    TraderItemPrice[114]=0;
    TraderItemId[114]=2416;
    TraderItemNumber[114]=0;
    TraderItemSellPrice[114]=22;
    TraderItemStandard[114]=5;
    TraderItemQuality[114]={4,6};
    TraderItemDura[114]={33,66};
    --grey priest robe
    TraderItemPrice[115]=0;
    TraderItemId[115]=2418;
    TraderItemNumber[115]=0;
    TraderItemSellPrice[115]=22;
    TraderItemStandard[115]=5;
    TraderItemQuality[115]={4,6};
    TraderItemDura[115]={33,66};
    --red priest robe
    TraderItemPrice[116]=0;
    TraderItemId[116]=2419;
    TraderItemNumber[116]=0;
    TraderItemSellPrice[116]=22;
    TraderItemStandard[116]=5;
    TraderItemQuality[116]={4,6};
    TraderItemDura[116]={33,66};
    --white priest robe
    TraderItemPrice[117]=0;
    TraderItemId[117]=2421;
    TraderItemNumber[117]=0;
    TraderItemSellPrice[117]=22;
    TraderItemStandard[117]=5;
    TraderItemQuality[117]={4,6};
    TraderItemDura[117]={33,66};
    --full leatherarmor
    TraderItemPrice[118]=0;
    TraderItemId[118]=362;
    TraderItemNumber[118]=0;
    TraderItemSellPrice[118]=120;
    TraderItemStandard[118]=5;
    TraderItemQuality[118]={4,6};
    TraderItemDura[118]={33,66};
    --leather scale armor
    TraderItemPrice[119]=0;
    TraderItemId[119]=363;
    TraderItemNumber[119]=0;
    TraderItemSellPrice[119]=30;
    TraderItemStandard[119]=5;
    TraderItemQuality[119]={4,6};
    TraderItemDura[119]={33,66};
    --light hunting armor
    TraderItemPrice[120]=0;
    TraderItemId[120]=364;
    TraderItemNumber[120]=0;
    TraderItemSellPrice[120]=64;
    TraderItemStandard[120]=5;
    TraderItemQuality[120]={4,6};
    TraderItemDura[120]={33,66};
    --half leather armor
    TraderItemPrice[121]=0;
    TraderItemId[121]=365;
    TraderItemNumber[121]=0;
    TraderItemSellPrice[121]=80;
    TraderItemStandard[121]=5;
    TraderItemQuality[121]={4,6};
    TraderItemDura[121]={33,66};
    --leather legs
    TraderItemPrice[122]=0;
    TraderItemId[122]=366;
    TraderItemNumber[122]=0;
    TraderItemSellPrice[122]=50;
    TraderItemStandard[122]=5;
    TraderItemQuality[122]={4,6};
    TraderItemDura[122]={33,66};
    --short leather legs
    TraderItemPrice[123]=0;
    TraderItemId[123]=367;
    TraderItemNumber[123]=0;
    TraderItemSellPrice[123]=30;
    TraderItemStandard[123]=5;
    TraderItemQuality[123]={4,6};
    TraderItemDura[123]={33,66};
    --leather shoes
    TraderItemPrice[124]=0;
    TraderItemId[124]=369;
    TraderItemNumber[124]=0;
    TraderItemSellPrice[124]=6;
    TraderItemStandard[124]=5;
    TraderItemQuality[124]={4,6};
    TraderItemDura[124]={33,66};
    --blue steel greaves
    TraderItemPrice[125]=0;
    TraderItemId[125]=2111;
    TraderItemNumber[125]=0;
    TraderItemSellPrice[125]=160;
    TraderItemStandard[125]=5;
    TraderItemQuality[125]={4,6};
    TraderItemDura[125]={33,66};
    --short blue steel greaves
    TraderItemPrice[126]=0;
    TraderItemId[126]=2112;
    TraderItemNumber[126]=0;
    TraderItemSellPrice[126]=90;
    TraderItemStandard[126]=5;
    TraderItemQuality[126]={4,6};
    TraderItemDura[126]={33,66};
    --brass greaves
    TraderItemPrice[127]=0;
    TraderItemId[127]=2113;
    TraderItemNumber[127]=0;
    TraderItemSellPrice[127]=160;
    TraderItemStandard[127]=5;
    TraderItemQuality[127]={4,6};
    TraderItemDura[127]={33,66};
    --short brass greaves
    TraderItemPrice[128]=0;
    TraderItemId[128]=2114;
    TraderItemNumber[128]=0;
    TraderItemSellPrice[128]=90;
    TraderItemStandard[128]=5;
    TraderItemQuality[128]={4,6};
    TraderItemDura[128]={33,66};
    --red steel greaves
    TraderItemPrice[129]=0;
    TraderItemId[129]=2116;
    TraderItemNumber[129]=0;
    TraderItemSellPrice[129]=160;
    TraderItemStandard[129]=5;
    TraderItemQuality[129]={4,6};
    TraderItemDura[129]={33,66};
    --short red steel greaves
    TraderItemPrice[130]=0;
    TraderItemId[130]=2117;
    TraderItemNumber[130]=0;
    TraderItemSellPrice[130]=90;
    TraderItemStandard[130]=5;
    TraderItemQuality[130]={4,6};
    TraderItemDura[130]={33,66};
    --steel cap
    TraderItemPrice[131]=0;
    TraderItemId[131]=202;
    TraderItemNumber[131]=0;
    TraderItemSellPrice[131]=30;
    TraderItemStandard[131]=5;
    TraderItemQuality[131]={4,6};
    TraderItemDura[131]={33,66};
    --chain helmet
    TraderItemPrice[132]=0;
    TraderItemId[132]=324;
    TraderItemNumber[132]=0;
    TraderItemSellPrice[132]=100;
    TraderItemStandard[132]=5;
    TraderItemQuality[132]={4,6};
    TraderItemDura[132]={33,66};
    --flame helmet
    TraderItemPrice[133]=0;
    TraderItemId[133]=2286;
    TraderItemNumber[133]=0;
    TraderItemSellPrice[133]=300;
    TraderItemStandard[133]=5;
    TraderItemQuality[133]={4,6};
    TraderItemDura[133]={33,66};
    --albarian soldier's helmet
    TraderItemPrice[134]=0;
    TraderItemId[134]=2287;
    TraderItemNumber[134]=0;
    TraderItemSellPrice[134]=120;
    TraderItemStandard[134]=5;
    TraderItemQuality[134]={4,6};
    TraderItemDura[134]={33,66};
    --round steel hat
    TraderItemPrice[135]=0;
    TraderItemId[135]=2290;
    TraderItemNumber[135]=0;
    TraderItemSellPrice[135]=50;
    TraderItemStandard[135]=5;
    TraderItemQuality[135]={4,6};
    TraderItemDura[135]={33,66};
    --serinjah helmet
    TraderItemPrice[136]=0;
    TraderItemId[136]=2291;
    TraderItemNumber[136]=0;
    TraderItemSellPrice[136]=40;
    TraderItemStandard[136]=5;
    TraderItemQuality[136]={4,6};
    TraderItemDura[136]={33,66};
    --gynkese mercenarie's helmet
    TraderItemPrice[137]=0;
    TraderItemId[137]=2302;
    TraderItemNumber[137]=0;
    TraderItemSellPrice[137]=30;
    TraderItemStandard[137]=5;
    TraderItemQuality[137]={4,6};
    TraderItemDura[137]={33,66};
    --storm cap
    TraderItemPrice[138]=0;
    TraderItemId[138]=2441;
    TraderItemNumber[138]=0;
    TraderItemSellPrice[138]=40;
    TraderItemStandard[138]=5;
    TraderItemQuality[138]={4,6};
    TraderItemDura[138]={33,66};
    --salkamaerian paladin's helmet
    TraderItemPrice[139]=0;
    TraderItemId[139]=2444;
    TraderItemNumber[139]=0;
    TraderItemSellPrice[139]=80;
    TraderItemStandard[139]=5;
    TraderItemQuality[139]={4,6};
    TraderItemDura[139]={33,66};
    --battle staff
    TraderItemPrice[140]=0;
    TraderItemId[140]=207;
    TraderItemNumber[140]=0;
    TraderItemSellPrice[140]=240;
    TraderItemStandard[140]=5;
    TraderItemQuality[140]={4,6};
    TraderItemDura[140]={33,66};
    --ornate mage's staff
    TraderItemPrice[141]=0;
    TraderItemId[141]=208;
    TraderItemNumber[141]=0;
    TraderItemSellPrice[141]=240;
    TraderItemStandard[141]=5;
    TraderItemQuality[141]={4,6};
    TraderItemDura[141]={33,66};
    --elven mage's staff
    TraderItemPrice[142]=0;
    TraderItemId[142]=209;
    TraderItemNumber[142]=0;
    TraderItemSellPrice[142]=290;
    TraderItemStandard[142]=5;
    TraderItemQuality[142]={4,6};
    TraderItemDura[142]={33,66};
    --rainbowsword-blade
    TraderItemPrice[143]=0;
    TraderItemId[143]=2707;
    TraderItemNumber[143]=0;
    TraderItemSellPrice[143]=90;
    TraderItemStandard[143]=10;
    TraderItemQuality[143]={4,6};
    TraderItemDura[143]={33,66};
    --war hammer
    TraderItemPrice[144]=0;
    TraderItemId[144]=226;
    TraderItemNumber[144]=0;
    TraderItemSellPrice[144]=200;
    TraderItemStandard[144]=5;
    TraderItemQuality[144]={4,6};
    TraderItemDura[144]={33,66};
    --mace
    TraderItemPrice[145]=0;
    TraderItemId[145]=230;
    TraderItemNumber[145]=0;
    TraderItemSellPrice[145]=120;
    TraderItemStandard[145]=5;
    TraderItemQuality[145]={4,6};
    TraderItemDura[145]={33,66};
    --morning star
    TraderItemPrice[146]=0;
    TraderItemId[146]=231;
    TraderItemNumber[146]=0;
    TraderItemSellPrice[146]=240;
    TraderItemStandard[146]=5;
    TraderItemQuality[146]={4,6};
    TraderItemDura[146]={33,66};
    --club
    TraderItemPrice[147]=0;
    TraderItemId[147]=2664;
    TraderItemNumber[147]=0;
    TraderItemSellPrice[147]=16;
    TraderItemStandard[147]=5;
    TraderItemQuality[147]={4,6};
    TraderItemDura[147]={33,66};
    --dull mace
    TraderItemPrice[148]=0;
    TraderItemId[148]=2728;
    TraderItemNumber[148]=0;
    TraderItemSellPrice[148]=120;
    TraderItemStandard[148]=5;
    TraderItemQuality[148]={4,6};
    TraderItemDura[148]={33,66};
    --morning star
    TraderItemPrice[149]=0;
    TraderItemId[149]=2737;
    TraderItemNumber[149]=0;
    TraderItemSellPrice[149]=240;
    TraderItemStandard[149]=5;
    TraderItemQuality[149]={4,6};
    TraderItemDura[149]={33,66};
    --throwing spear
    TraderItemPrice[150]=0;
    TraderItemId[150]=293;
    TraderItemNumber[150]=0;
    TraderItemSellPrice[150]=4;
    TraderItemStandard[150]=5;
    TraderItemQuality[150]={4,6};
    TraderItemDura[150]={33,66};
    --serinjah-rider's bow
    TraderItemPrice[151]=0;
    TraderItemId[151]=2646;
    TraderItemNumber[151]=0;
    TraderItemSellPrice[151]=44;
    TraderItemStandard[151]=5;
    TraderItemQuality[151]={4,6};
    TraderItemDura[151]={33,66};
    --magical elven bow
    TraderItemPrice[152]=0;
    TraderItemId[152]=2685;
    TraderItemNumber[152]=0;
    TraderItemSellPrice[152]=80;
    TraderItemStandard[152]=5;
    TraderItemQuality[152]={4,6};
    TraderItemDura[152]={33,66};
    --long bow
    TraderItemPrice[153]=0;
    TraderItemId[153]=2708;
    TraderItemNumber[153]=0;
    TraderItemSellPrice[153]=74;
    TraderItemStandard[153]=5;
    TraderItemQuality[153]={4,6};
    TraderItemDura[153]={33,66};
    --hunting bow
    TraderItemPrice[154]=0;
    TraderItemId[154]=2714;
    TraderItemNumber[154]=0;
    TraderItemSellPrice[154]=20;
    TraderItemStandard[154]=5;
    TraderItemQuality[154]={4,6};
    TraderItemDura[154]={33,66};
    --elven composite longbow
    TraderItemPrice[155]=0;
    TraderItemId[155]=2718;
    TraderItemNumber[155]=0;
    TraderItemSellPrice[155]=110;
    TraderItemStandard[155]=5;
    TraderItemQuality[155]={4,6};
    TraderItemDura[155]={33,66};
    --rider's bow
    TraderItemPrice[156]=0;
    TraderItemId[156]=2727;
    TraderItemNumber[156]=0;
    TraderItemSellPrice[156]=10;
    TraderItemStandard[156]=5;
    TraderItemQuality[156]={4,6};
    TraderItemDura[156]={33,66};
    --wooden tower shield
    TraderItemPrice[157]=0;
    TraderItemId[157]=498;
    TraderItemNumber[157]=0;
    TraderItemSellPrice[157]=46;
    TraderItemStandard[157]=5;
    TraderItemQuality[157]={4,6};
    TraderItemDura[157]={33,66};
    --ornate tower shield
    TraderItemPrice[158]=0;
    TraderItemId[158]=916;
    TraderItemNumber[158]=0;
    TraderItemSellPrice[158]=150;
    TraderItemStandard[158]=5;
    TraderItemQuality[158]={4,6};
    TraderItemDura[158]={33,66};
    --cursed shield
    TraderItemPrice[159]=0;
    TraderItemId[159]=917;
    TraderItemNumber[159]=0;
    TraderItemSellPrice[159]=130;
    TraderItemStandard[159]=5;
    TraderItemQuality[159]={4,6};
    TraderItemDura[159]={33,66};
    --Shield of the Sky
    TraderItemPrice[160]=0;
    TraderItemId[160]=2284;
    TraderItemNumber[160]=0;
    TraderItemSellPrice[160]=120;
    TraderItemStandard[160]=5;
    TraderItemQuality[160]={4,6};
    TraderItemDura[160]={33,66};
    --red steel shield
    TraderItemPrice[161]=0;
    TraderItemId[161]=2388;
    TraderItemNumber[161]=0;
    TraderItemSellPrice[161]=20;
    TraderItemStandard[161]=5;
    TraderItemQuality[161]={4,6};
    TraderItemDura[161]={33,66};
    --cloud shield
    TraderItemPrice[162]=0;
    TraderItemId[162]=2439;
    TraderItemNumber[162]=0;
    TraderItemSellPrice[162]=80;
    TraderItemStandard[162]=5;
    TraderItemQuality[162]={4,6};
    TraderItemDura[162]={33,66};
    --small wooden shield
    TraderItemPrice[163]=0;
    TraderItemId[163]=2445;
    TraderItemNumber[163]=0;
    TraderItemSellPrice[163]=24;
    TraderItemStandard[163]=5;
    TraderItemQuality[163]={4,6};
    TraderItemDura[163]={33,66};
    --mosaic shield
    TraderItemPrice[164]=0;
    TraderItemId[164]=2447;
    TraderItemNumber[164]=0;
    TraderItemSellPrice[164]=50;
    TraderItemStandard[164]=5;
    TraderItemQuality[164]={4,6};
    TraderItemDura[164]={33,66};
    --legionaire's tower shield
    TraderItemPrice[165]=0;
    TraderItemId[165]=2448;
    TraderItemNumber[165]=0;
    TraderItemSellPrice[165]=12;
    TraderItemStandard[165]=5;
    TraderItemQuality[165]={4,6};
    TraderItemDura[165]={33,66};
    --sheep milk
    TraderItemPrice[166]=0;
    TraderItemId[166]=330;
    TraderItemNumber[166]=0;
    TraderItemSellPrice[166]=6;
    TraderItemStandard[166]=15;
    TraderItemQuality[166]={4,6};
    TraderItemDura[166]={33,66};

    TraderCopper=2000;

    TraderTrig[1]="[Gg]reetings";
    TraderText[1]="Greebas! You want buy from great "..thisNPC.name.."?";
    TraderText[1001]="You buy me stuff!";
    TraderText[2001]="Ahh! People to buy me things! Hullo!";

    TraderTrig[2]="[Hh]ello";
    TraderText[2]="Hullo! Buy me things!";
    TraderText[1002]="Want buy stuff?";

    TraderTrig[3]="[Yy]ou.+[Tt]rader";
    TraderText[3]="Yub, me trader."
    TraderText[1003]="Me is trader wit' many stuff!";

    TraderTrig[4]="[Ww]hat.+sell";
    TraderText[4]="Me sell many shiny things, har har!";
    TraderText[1004]="Shiny stuff 'n things is what me sells.";

    TraderTrig[5]="[Ww]hat.+[Ss]hiny things";
    TraderText[5]="Gems 'n stuff.";

    TraderTrig[6]="[Tt]ell.+[Ss]omething";
    TraderText[6]="Nhub, you buy or go away!";

    TraderTrig[7]="[Gg]oodbye";
    TraderText[7]="Hurr!";
    TraderText[1007]="Go 'way!";

    TraderTrig[8]="[Bb]ye";
    TraderText[8]="Buy Buy!";
    TraderText[1008]="When come back, buy more stuff!";

    TraderTrig[9]="[Ff]arewell";
    TraderText[9]="Fareeba!";
    TraderText[1009]="Hurr! Buy more stuff!";

    TraderTrig[10]="[Ww]hat.+buy";
    TraderText[10]="Lots! Things wit' fight, armor, herbs, clothes 'n eating stuff!";

    TraderTrig[11]="[Ww]ho.+you?";
    TraderText[11]="I'm strong and great "..thisNPC.name.."!";

    TraderTrig[12]="I'm .+";
    TraderText[12]="Me not interested. You buy or go 'way!";

    TraderTrig[13]="[hH]elp";
    TraderText[13]="'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'";

    TraderTrig[14]="[Gg]rü[ßs]e";
    TraderText[14]="Greebas! Will kaufen von "..thisNPC.name.."?";
    TraderText[1014]="Greebas!";

    TraderTrig[15]="[Gg]rüsse";
    TraderText[15]="Hullo! Du kaufen Zeug!";
    TraderText[1015]="Du willst sicher kaufen von "..thisNPC.name.."! Hullo!";

    TraderTrig[16]="[Hh]allo";
    TraderText[16]="#me grunzt";
    TraderText[1016]="Bist du hier, um zu kaufen? Kaufen, kaufen!";

    TraderTrig[17]="[Dd]u.+[Hh]ändler";
    TraderText[17]="Yubba! Du will kaufen?"

    TraderTrig[18]="[Ww]as.+verkauf";
    TraderText[18]="Mir verkaufen alles was glänzt!";

    TraderTrig[19]="[Ee]rzähl.+[Ee]twas";
    TraderText[19]="Kein' Lust! Kauf, oder geh weg!";

    TraderTrig[20]="[Aa]uf.+[Bb]ald";
    TraderText[20]="Hurr!";
    TraderText[1020]="Bleiben hier und kaufen!";
    TraderText[2020]="Geh weg";

    TraderTrig[21]="[Bb]is.+[Bb]ald";
    TraderText[21]="Fareeba!";
    TraderText[1021]="Du gehen? Kaufen mehr Zeug!";
    TraderText[2021]="Wenn du kommen zurück, kaufen mehr! Har Har!";

    TraderTrig[22]="[Ww]as.+%s[Kk]auf";
    TraderText[22]="Har Har! Ich kauf' Krieg Zeugs, Kleidung, Essen und Kräuters!";

    TraderTrig[23]="[Ww]er.+du?";
    TraderText[23]="Ich bin starker "..thisNPC.name.."!";

    TraderTrig[24]="Ich bin .+";
    TraderText[24]="Mir nix interessiert! Du kaufen, oder du gehen weg!";

    TraderTrig[25]="[Hh]ilfe";
    TraderText[25]="'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'";

    TraderLang={"Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};


    TradSpeakLang={0,5};
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
    if (cycCount==nil) then
    	initializeNpc();
        cycCount=1;
        nextDelivery=math.random(10000,40000);
        thisNPC:increaseSkill(1,"common language",100);
        --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery);
    else
        cycCount=cycCount+1;
        --printerr("In Circle "..cycCount.. "With "..nextDelivery);
        if (cycCount+1>nextDelivery+1) then
            --thisNPC:talk(Character.say, "Next");
            nextDelivery=math.random(10000,40000);
            cycCount=1;
            --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery.." CycCount: "..cycCount);
            for itnCnt=1,table.getn(TraderItemNumber) do
                npc.base.trader_functions.refillItems(itnCnt);
            end
        end
    end
end

function receiveText(texttype, message, originator)
    lang=originator:getPlayerLanguage();
    --originator:introduce(thisNPC);
    if (TraderFirst == nil) then
        --------------------------------------------- *** DON'T EDIT BELOW HERE ***--------------------------------------
        initializeNpc();
        TraderFirst=1;
        --TalkToId=originator.id;
        increaseLangSkill(thisNPC,TradSpeakLang)
        TraderStdCopper=TraderCopper;
    end
    if (thisNPC:isInRange(originator,2)) then
        if (originator.id ~= thisNPC.id) then
            originator:introduce(thisNPC);
            if (LangOK(originator,TradSpeakLang)==true) then
                thisNPC.activeLanguage=originator.activeLanguage;
                i=1;
                local ready=false;
                local Texts=0;
                local searchfin=false;
                repeat
                    if (string.find(message,TraderTrig[i]) ~= nil) then
                        --originator:inform("Ready set true");
                        repeat
                            Addi=Texts*1000;
                            if (TraderText[i+Addi]~=nil) then
                                Texts=Texts+1;
                            else
                                searchfin=true
                            end
                        until (searchfin==true);
                        TextSel=math.random(0,Texts);
                        if (TextSel>0) then TextSel=TextSel-1 end
                        thisNPC:talk(Character.say,TraderText[i+(TextSell*1000)]);
                        ready=true;
                    end
                    i=i+1;
                until ((i==table.getn(TraderTrig)+1) or ready)
                if (not ready) then
                    --originator:inform("Ready set false");
                    Status,Values=digBuy(originator, message);
                    --originator:inform("Status: "..Status);
                    if (Status==0) then Status,Values=strBuy(originator, message) end
                    if (Status==0) then Status,Values=npc.base.trader_functions.SayPriceSell(originator, message) end
                    if (Status==0) then Status,Values=npc.base.trader_functions.SayPriceBuy(originator, message) end
                    if (Status==0) then Status,Values=digSell(originator, message) end
                    if (Status==0) then Status,Values=strSell(originator, message) end
                    if (Status==0) then Status,Values=VerkaufList(originator, message) end
                    if (Status==0) then Status,Values=KaufList(originator, message) end
                    if (Status==0) then Status,Values=TellDate(originator, message, TraderMonths) end

                    ----------------------------EDIT BELOW HERE-----------------------------------
                    if (Status==1) then -- Verkauf von mehreren Items erfolgreich // npc.base.trader_functions.Selling of multible items succeed
                        gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Kostet"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],TraderLang).."!";
                        eText="You want buy "..Values[1].." "..world:getItemName(Values[2],1).."? Makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],TraderLang).."!";
                    end
                    if (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                        gText="Du nix Platz in Inventar!";
                        eText="You not have space in inventory!";
                    end
                    if (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enougth money to buy the item
                        gText="Du nix genug Geld, geh weg!";
                        eText="You not enough money, go away!";
                    end
                    if (Status==4) then -- Item ausverkauft // item out of stock
                        gText="Das ausverkauft im Moment!";
                        eText="Me don't has this currently. You come back later!";
                    end
                    if (Status==5) then -- Item wird nicht verkauft // item
                        gText="Hurr? Ich nix verkaufe sowas!";
                        eText="Hurr? Me not sell that!";
                    end
                    if (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Selling of a single item succeed
                        gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." du willst? Da! Kostet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],TraderLang).."!";
                        eText="You want "..world:getItemName(Values[1],1).."? Makes"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],TraderLang).."!";
                    end
                    if (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                        gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],TraderLang).."!";
                        eText="The "..world:getItemName(Values[1],1).." costs"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],TraderLang).."!";
                    end
                    if (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                        gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wär'"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],TraderLang).." wert.";
                        eText="I pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
                    end
                    if (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                        gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich geb'"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],TraderLang).."!";
                        eText="You want sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],TraderLang).."!";
                    end
                    if (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                        gText="Kommt wieder wenn du das hast!";
                        eText="Come back when has that!";
                    end
                    if (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                        gText="Ich nix mehr genug Geld! Kann das nix kaufen!";
                        eText="Me nhub enough money! Me not can buy that!";
                    end
                    if (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                        gText="Ich nix kaufen das!";
                        eText="Me not buy that!";
                    end
                    if (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                        gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." ist, was du verkaufen willst? Ich gebe"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],TraderLang).."!";
                        eText="You want sell "..world:getItemName(Values[1],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],TraderLang)..".";
                    end
                    if (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                        gText="Ich verkauf glänzendes Zeug!";
                        eText="Me sells shiny stuff!";
                    end
                    if (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                        gText="Ich verkauf' nix!";
                        eText="Me sell nothing.";
                    end
                    if (Status==16) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is not empty
                        gText="Ich kauf' Zeug für Krieg, Kräuter, Kleidung und Essen!";
                        eText="Me buy stuff for war, herbs, food and clothes!";
                    end
                    if (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                        gText="Ich kauf' nix!";
                        eText="Me buy nothing!";
                    end
                    if (Status==18) then
                        gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                        local seleced=math.random(1,2)
                        if (seleced==1) then
                            eText="It's day "..Values[1].." of "..Values[2].." of the year "..Values[3]..".";
                        elseif (seleced==2) then
                            eText="It's the "..EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                        end
                    end

                    if (Status~=0) then
                        outText=GetNLS(originator,gText,eText);
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
                end --not ready
            else
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
            end
        end --id
    end-- range
end--function
