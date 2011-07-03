function useNPC(user,counter,param)
    --thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talk(Character.say, "Don't you touch me!");
end

module("npc.lagan", package.seeall)

--function checkSurround(playerID)
--    foundHim=false;
--    NpcPosX=thisNPC.pos.x;
--    NpcPosY=thisNPC.pos.y;
--    NpcPosZ=thisNPC.pos.z;
--    for PosX=(NpcPosX-2),(NpcPosX+2) do
--        for PosY=(NpcPosY-2),(NpcPosY+2) do
--            checkPos=position(PosX,PosY,NpcPosZ);
--            if (world:isCharacterOnField(checkPos)==true) then
--                CharOnFld=world:getCharacterOnField(checkPos);
--                if CharOnFld.id=playerID then foundHim=true end
--            end
--        end
--    end
--    return foundHim;
--end

function initializeNpc()
    TraderItemPrice={};
    TraderItemId={};
    TraderItemTrig={};
    TraderItemName={};
    TraderItemNumber={};
    TraderTrig={};
    TraderText={};
    TraderItemSellPrice={};
    TraderItemStandard={};

    --originator:inform("Init()");
    thisNPC:increaseSkill(1,"common language",100);
    TraderFirst=1;
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --         TraderItemPrice[1]=14;          -- if 0 then it is not sold by NPC (standardprice otherwise)
    --         TraderItemId[1]=1;              -- item Id (look up in list!)
    --         TraderItemTrig[1]="[Ss]word";   -- the string to identify the item (here: Sword or sword)
    --         TraderItemName[1]="sword";      -- usual name
    --         TraderItemNumber[1]=25;         -- Number of that item initially
    --         TraderItemSellPrice[1]=6;       -- if 0 then it is not bought by NPC (standardprice otherwise)
    --         TraderItemStandard[1]=25;       -- Standard amount of that ware (used for price calc)


    TraderItemPrice[1]=50;          
    TraderItemId[1]=1;                    
    TraderItemTrig[1]="[Ss]word";            
    TraderItemName[1]="sword";              
    TraderItemNumber[1]=3;                
    TraderItemSellPrice[1]=0;              
    TraderItemStandard[1]=3; 
    
    TraderItemPrice[2]=0;          
    TraderItemId[2]=3                    
    TraderItemTrig[2]="[Ll]ogs of conifer [Ww]ood";            
    TraderItemName[2]="logs of conifer wood";              
    TraderItemNumber[2]=0;                
    TraderItemSellPrice[2]=2;              
    TraderItemStandard[2]=25;
    
    TraderItemPrice[3]=30;          
    TraderItemId[3]=16                    
    TraderItemTrig[3]="[Vv]iking [Hh]elmet";            
    TraderItemName[3]="viking helmet";              
    TraderItemNumber[3]=4;                
    TraderItemSellPrice[3]=0;              
    TraderItemStandard[3]=4;
    
    TraderItemPrice[4]=40;          
    TraderItemId[4]=18                    
    TraderItemTrig[4]="[Mm]etal [Ss]hield";            
    TraderItemName[4]="metal shield";              
    TraderItemNumber[4]=2;                
    TraderItemSellPrice[4]=0;              
    TraderItemStandard[4]=2;
    
    TraderItemPrice[5]=0;          
    TraderItemId[5]=21                    
    TraderItemTrig[5]="[Cc]oal";            
    TraderItemName[5]="coal";              
    TraderItemNumber[5]=5;                
    TraderItemSellPrice[5]=1;              
    TraderItemStandard[5]=5;
    
    TraderItemPrice[6]=0;          
    TraderItemId[6]=22                    
    TraderItemTrig[6]="[Ii]ron [Oo]re";            
    TraderItemName[6]="iron ore";              
    TraderItemNumber[6]=0;                
    TraderItemSellPrice[6]=2;              
    TraderItemStandard[6]=5;
    
    TraderItemPrice[7]=8;          
    TraderItemId[7]=23                    
    TraderItemTrig[7]="[Hh]ammer";            
    TraderItemName[7]="hammer";              
    TraderItemNumber[7]=4;                
    TraderItemSellPrice[7]=0;              
    TraderItemStandard[7]=4;
    
    TraderItemPrice[8]=8;          
    TraderItemId[8]=24                    
    TraderItemTrig[8]="[Ss]hovel";            
    TraderItemName[8]="shovel";              
    TraderItemNumber[8]=3;                
    TraderItemSellPrice[8]=0;              
    TraderItemStandard[8]=3;
    
    TraderItemPrice[9]=20;          
    TraderItemId[9]=27                    
    TraderItemTrig[9]="[Dd]agger";            
    TraderItemName[9]="dagger";              
    TraderItemNumber[9]=4;                
    TraderItemSellPrice[9]=0;              
    TraderItemStandard[9]=4;
    
    TraderItemPrice[10]=0;          
    TraderItemId[10]=28                    
    TraderItemTrig[10]="[Oo]ld [Dd]agger";            
    TraderItemName[10]="old dagger";              
    TraderItemNumber[10]=0;                
    TraderItemSellPrice[10]=2;              
    TraderItemStandard[10]=4;
    
    TraderItemPrice[11]=0;          
    TraderItemId[11]=13;                    
    TraderItemTrig[11]="[Oo]ld [Ss]word";            
    TraderItemName[11]="old sword";              
    TraderItemNumber[11]=0;                
    TraderItemSellPrice[11]=2;              
    TraderItemStandard[11]=4;



    
    TraderCopper=700; 
    
    TraderTrig[1]="[Gg]reetings"; 
    TraderText[1]="Good day. How are you doing?"; 
    
    TraderTrig[2]="[Hh]ello"; 
    TraderText[2]="I wish you a good day. What can I do for you?"; 
    
    TraderTrig[3]="[Yy]ou.+[Tt]rader"; 
    TraderText[3]="Yes, I trade wares." 
    
    TraderTrig[4]="[Ww]hat.+sell"; 
    TraderText[4]="I sell everything you need for smithing."; 
    
    TraderTrig[5]="[Tt]ell.+[Ss]omething"; 
    TraderText[5]="I don't know what to. You might want to talk to the librarian in Troll's Bane. I am sure he can tell you stories."; 
    
    TraderTrig[6]="[Tt]ell.+[Ss]ibanac"; 
    TraderText[6]="Sibanac can be smoked in pipes. I tend to like it. It makes me feel good."; 

    TraderTrig[7]="[Gg]oodbye"; 
    TraderText[7]="Have a good day. Feel welcome to come back any time."; 
    
    TraderTrig[8]="[Bb]ye"; 
    TraderText[8]="Farewell."; 
    
    TraderTrig[9]="[Ff]arewell"; 
    TraderText[9]="Goodbye!"; 
        
    TraderTrig[10]="[Ww]ho.+you?"; 
    TraderText[10]="I'm "..thisNPC.name.."."; 
    
    TraderTrig[11]="I'm"; 
    TraderText[11]="Nice to meet you. Do you want to buy some of my wares. Look at what i have. Or do you want to sell something to me?";
    
    TraderTrig[12]="[hH]elp";
    TraderText[12]="'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'";
end

function nextCycle()  -- ~10 times per second
    if (cycCount==nil) then
        cycCount=1;
        nextDelivery=math.random(40000);
        thisNPC:increaseSkill(1,"common language",100);
        --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery);
    else
        cycCount=cycCount+1;
        ---- printerr("In Circle "..cycCount.. "With "..nextDelivery);
        if (cycCount+1>nextDelivery+1) then
            --thisNPC:talk(Character.say, "Next");
            nextDelivery=math.random(40000);
            cycCount=1;
            --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery.." CycCount: "..cycCount);            
            for itnCnt=1,table.getn(TraderItemNumber) do
                refill(itnCnt);
            end
        end
    end
end

function refill(itNumb)
    TraderItemNumber[itNumb]=TraderItemNumber[itNumb]+TraderItemStandard[itNumb];
    --thisNPC:talk(Character.say,"refilled "..TraderItemName[itNumb].." to "..TraderItemNumber[itNumb]);
    if TraderItemNumber[itNumb]>TraderItemStandard[itNumb]*5 then TraderItemNumber[itNumb]=TraderItemStandard[itNumb]*5 end
end

function CalcPrice(stdPrice,actAmount,stdAmount)  -- TraderItemPrice[..]->CalcPrice(TraderItemPrice[..],TraderItemNumber[..],TraderItemStandard);
    diffAmount=stdAmount-actAmount;
    if (actAmount*3<stdAmount) then        --less than 1/3 of standard
        return stdPrice*3;
    elseif (actAmount*2<stdAmount) then    --less than 1/2 of standard
        return stdPrice*2;
    elseif (actAmount<=stdAmount) then      -- 1/2 to standard
        return stdPrice;
    elseif (stdAmount*2<actAmount) then     -- 2 times standard
        return stdPrice;
    else
        return math.ceil(stdPrice/2);
    end
end

function receiveText(texttype, message, originator)
 -- printerr("from"..originator.name.."to"..thisNPC.name);
    --originator:introduce(thisNPC);
    if (TraderFirst == nil) then
        --------------------------------------------- *** DON'T EDIT BELOW HERE ***--------------------------------------
        initializeNpc();
        TraderFirst=1;
        --TalkToId=originator.id;
        
    end
    if (thisNPC:isInRange(originator,2)) then
        if (originator.id ~= thisNPC.id) then
            originator:introduce(thisNPC);
            i=1;
            ready=false;
            repeat
                if (string.find(message,TraderTrig[i]) ~= nil) then
                    thisNPC:talk(Character.say,TraderText[i]);
                    ready=true;
--                    for gree=1,table.getn(GreetingTrig) do
--                        if i==GreetingTrig[gree] then
--                            TalkToId=originator.id;
--                        end
--                    end
--                    for fare=1,table.getn(FarewellTrig) do
--                        if i==FarewellTrig[gree] then
--                            TalkToId=0;
--                        end
--                    end
                end
                i=i+1;
            until ((i==table.getn(TraderText)+1) or ready)
            if (not ready) then
                if (string.find(message,"buy.+%d.+s")~=nil) then
                    a,b,countStr,itemname=string.find(message,"buy (%d+) (.+s)");               -- ...want to buy <number> <itemS>
                    count=countStr+1-1;
                    foundItem=false;
                    itnCnt=1;
                    repeat
                        if (string.find(itemname,TraderItemTrig[itnCnt])~=nil) then             -- some item I sell?
                            if (TraderItemPrice[itnCnt]~=0) then                                -- if he sells it
                                ActPrice=CalcPrice(TraderItemPrice[itnCnt],TraderItemNumber[itnCnt],TraderItemStandard[itnCnt]);
                                if(TraderItemNumber[itnCnt]>count) then                         -- if he has enough of it
                                    if (originator:countItem(3076)>=ActPrice*count) then   -- if he has enough money
                                        thisNPC:talk(Character.say, "You want "..count.." "..itemname.."? Here you are, that makes "..ActPrice*count.." copper pieces.");
                                        if (originator:createItem(TraderItemId[itnCnt],count,333,0) ~=0 ) then
                                            thisNPC:talk(Character.say, "Sorry, you do not have enough space in your inventory.");
                                        else
                                            originator:eraseItem(3076,ActPrice*count);
                                            TraderCopper=TraderCopper+ActPrice*count;
                                            TraderItemNumber[itnCnt]=TraderItemNumber[itnCnt]-count;
                                        end
                                    else        -- not enough money
                                        thisNPC:talk(Character.say,"Come back when you have enough money!");
                                    end -- enough money
                                else
                                    thisNPC:talk(Character.say,"I am sorry, I don't have this currently. Come back later.");
                                end
                                foundItem=true;
                            else
                                thisNPC:talk(Character.say,"Sorry, I do not sell that item.");
                            end
                            foundItem=true;
                        end --string find (itemname)
                        itnCnt = itnCnt+1;
                    until ((itnCnt==table.getn(TraderItemTrig)+1) or foundItem)           -- until no more items or we found one
                elseif (string.find(message,"buy%s.+%s.+")~=nil) then               -- ...want to buy a/one item
                    a,b,itemname=string.find(message,"buy%s[a-zA-Z]*%s([a-zA-Z%s]*)");
                    foundItem=false;
                    itnCnt=1;
                    repeat
                        if (string.find(itemname,TraderItemTrig[itnCnt])~=nil) then   -- some item I sell?
                            ActPrice=CalcPrice(TraderItemPrice[itnCnt],TraderItemNumber[itnCnt],TraderItemStandard[itnCnt]);
                            if (TraderItemPrice[itnCnt]~=0) then
                                if(TraderItemNumber[itnCnt]>0) then
                                    if (originator:countItem(3076)>=ActPrice) then -- if he has enough money
                                        thisNPC:talk(Character.say, "You want a "..itemname.."? Here you are, that makes "..ActPrice.." copper pieces.");
                                        if (originator:createItem(TraderItemId[itnCnt],1,333,0) ~=0 ) then
                                            thisNPC:talk(Character.say, "Sorry, you do not have enough space in your inventory.");
                                        else
                                            originator:eraseItem(3076,ActPrice);
                                            TraderCopper=TraderCopper+ActPrice;
                                            TraderItemNumber[itnCnt]=TraderItemNumber[itnCnt]-1;
                                        end
                                    else        -- not enough money
                                        thisNPC:talk(Character.say,"Come back when you have enough money!");
                                    end -- enough money
                                else
                                    thisNPC:talk(Character.say,"I am sorry, I don't have this currently. Come back later.");
                                end
                            else
                                thisNPC:talk(Character.say,"Sorry, I do not sell that item.");
                            end
                            foundItem=true;
                        end --string find (itemname)
                        itnCnt = itnCnt + 1;
                    until ((itnCnt==table.getn(TraderItemTrig)+1) or foundItem)           -- until no more items or we found one

                elseif (string.find(message,"price.+") ~= nil or string.find(message,"[Ww]hat.+cost")~=nil) then     -- if asked for price...
                    for i=1,table.getn(TraderItemTrig) do                           -- run through all triggers
                        if (string.find(message,TraderItemTrig[i])~=nil) then       -- if trigger found in question
                            thisNPC:talk(Character.say, "The "..TraderItemName[i].." costs "..CalcPrice(TraderItemPrice[i],TraderItemNumber[i],TraderItemStandard[i]).." copper pieces."); -- tell the price
                        end
                    end --for
                elseif (string.find(message,"[Yy]ou.+pay.+") ~= nil or string.find(message,"[Hh]ow much.+for.+")~=nil ) then
                    for i=1,table.getn(TraderItemTrig) do                           -- run through all triggers
                        if (string.find(message,TraderItemTrig[i])~=nil) then       -- if trigger found in question
                            if (string.find("aeiou",TraderItemName[i])~=nil) then
                                artic="an ";
                            else
                                artic="a ";
                            end
                            thisNPC:talk(Character.say, "I would pay "..CalcPrice(TraderItemSellPrice[i],TraderItemNumber[i],TraderItemStandard[i]).." copper pieces for "..artic..TraderItemName[i]); -- tell the price
                        end --if
                    end --for
                elseif (string.find(message,"sell.+%d.+s")~=nil) then
                    a,b,countStr,itemname=string.find(message,"sell (%d+) (.+s)");      -- ...want to sell <number> <itemS>
                    count=countStr+1-1;
                    foundItem=false;
                    itnCnt=1;
                    repeat
                        if (string.find(itemname,TraderItemTrig[itnCnt])~=nil) then   -- some item I buy?
                            ActPrice=CalcPrice(TraderItemSellPrice[itnCnt],TraderItemNumber[itnCnt],TraderItemStandard[itnCnt]);
                            if (TraderItemSellPrice[intItn]~=0) then
                                if (TraderCopper>=ActPrice*count) then
                                    if (originator:countItem(TraderItemId[itnCnt])>=count) then -- if he has enough of that
                                        thisNPC:talk(Character.say, "You want to sell "..count.." "..itemname.."? I give you "..ActPrice*count.." copper pieces.");
                                        if (originator:createItem(3076,ActPrice*count,333,0) ~=0 ) then
                                            thisNPC:talk(Character.say, "Sorry, you do not have enough space in your inventory.");
                                        else
                                            originator:eraseItem(TraderItemId[itnCnt],count);
                                            TraderCopper=TraderCopper-ActPrice*count;
                                            TraderItemNumber[itnCnt]=TraderItemNumber[itnCnt]+count;
                                        end
                                    else        -- not enough money
                                        thisNPC:talk(Character.say,"Come back when you have that!");
                                    end -- enough money
                                else
                                    thisNPC:talk(Character.say, "Sorry, I cannot buy that. I do not have enough money.");
                                end
                            else
                                thisNPC:talk(Character.say,"Sorry, I do not buy that item.");
                            end
                            foundItem=true;
                        end --string find (itemname)
                        itnCnt = itnCnt + 1;
                    until ((itnCnt==table.getn(TraderItemTrig)+1) or foundItem)           -- until no more items or we found one
                elseif (string.find(message,"sell%s.+%s.+")~=nil) then
                    a,b,itemname=string.find(message,"sell%s[a-zA-Z]*%s([a-zA-Z%s]*)");      -- ...want to sell a/an/one <itemS>
                    foundItem=false;
                    itnCnt=1;
                    repeat
                        if (string.find(itemname,TraderItemTrig[itnCnt])~=nil) then   -- some item I buy?
                            ActPrice=CalcPrice(TraderItemSellPrice[itnCnt],TraderItemNumber[itnCnt],TraderItemStandard[itnCnt]);
                            if (TraderItemSellPrice[itnCnt]~=0) then
                                if (TraderCopper>=ActPrice) then
                                    if (originator:countItem(TraderItemId[itnCnt])>=1) then -- if he has enough of that
                                        thisNPC:talk(Character.say, "You want to sell a "..itemname.."? I give you "..ActPrice.." copper pieces.");
                                        if (originator:createItem(3076,ActPrice,333,0) ~=0 ) then        --give money!
                                            thisNPC:talk(Character.say, "Sorry, you do not have enough space in your inventory.");
                                        else
                                            originator:eraseItem(TraderItemId[itnCnt],1);
                                            TraderCopper=TraderCopper-ActPrice;
                                            TraderItemNumber[itnCnt]=TraderItemNumber[itnCnt]+1;
                                        end
                                    else        -- not enough money
                                        thisNPC:talk(Character.say,"Come back when you have that!");
                                    end -- enough money
                                else
                                    thisNPC:talk(Character.say, "Sorry, I cannot buy that. I do not have enough money.");
                                end
                            else
                                thisNPC:talk(Character.say,"Sorry, I do not buy that item.");
                            end
                            foundItem=true;
                        end --string find (itemname)
                        itnCnt = itnCnt + 1;
                    until ((itnCnt==table.getn(TraderItemTrig)+1) or foundItem)           -- until no more items or we found one
                elseif (string.find(message,"[Ll]ist.+wares")~=nil or string.find(message,"[Ww]hat.+sell")~=nil) then                -- asked for a list of his wares
                    wareString="I sell ";
                    for itnCnt=1,table.getn(TraderItemId) do
                        if (TraderItemPrice[itnCnt]~=0) then
                            if string.len(wareString)+string.len(TraderItemName[itnCnt])>240 then    -- line too long
                                thisNPC:talk(Character.say,wareString);                     -- say everything until here
                                wareString="";
                            end
                            wareString=wareString..TraderItemName[itnCnt]..", ";
                        end
                    end
                    thisNPC:talk(Character.say,wareString);
                elseif (string.find(message,"[Ww]hat.+buy")~=nil) then                -- asked for a list of wares he buys
                    wareString="I buy ";
                    for itnCnt=1,table.getn(TraderItemId) do
                        if (TraderItemSellPrice[itnCnt]~=0) then
                            if string.len(wareString)+string.len(TraderItemName[itnCnt])>240 then    -- line too long
                                thisNPC:talk(Character.say,wareString);                     -- say everything until here
                                wareString="";
                            end
                            wareString=wareString..TraderItemName[itnCnt]..", ";
                        end
                    end
                    thisNPC:talk(Character.say,wareString);
                elseif (string.find(message,"[sS]tatus")~=nil and originator:isAdmin()==true) then
                    originator:inform("Copper="..TraderCopper.. ", next delivery: "..nextDelivery.."cycCount:"..cycCount);
                    statusString="Wares: ";
                    for itnCnt=1,table.getn(TraderItemId) do
                        if string.len(statusString)+string.len(TraderItemName[itnCnt])>240 then    -- line too long
                            originator:inform(statusString);                     -- say everything until here
                            statusString="";
                        end
                        statusString=statusString..TraderItemName[itnCnt].."="..TraderItemNumber[itnCnt]..", ";
                    end
                    originator:inform(statusString);
                elseif (string.find(message,"[Rr]efill")~=nil and originator:isAdmin()==true) then
                    for itnCnt=1,table.getn(TraderItemId) do
                        refill(itnCnt);
                    end
                end -- string find buy/sell/list...
            end --not ready
        end --id
    end-- range
end--function

