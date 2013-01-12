module("npc.wesley", package.seeall)

function useNPC(user)
    --thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talk(Character.say, "Don't you touch me!");
end


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
    TraderItemPrice[1]=60;
    TraderItemId[1]=194;
    TraderItemTrig[1]="[Bb]lack [Rr]obe";
    TraderItemName[1]="black robe ";
    TraderItemNumber[1]=9;
    TraderItemSellPrice[1]=16;
    TraderItemStandard[1]=30;

    TraderItemPrice[2]=60;
    TraderItemId[2]=195;
    TraderItemTrig[2]="[Yy]ellow [Rr]obe";
    TraderItemName[2]="yellow robe";
    TraderItemNumber[2]=9;
    TraderItemSellPrice[2]=16;
    TraderItemStandard[2]=30;

    TraderItemPrice[3]=60;
    TraderItemId[3]=55;
    TraderItemTrig[3]="[Gg]reen [Rr]obe";
    TraderItemName[3]="green robe";
    TraderItemNumber[3]=9;
    TraderItemSellPrice[3]=16;
    TraderItemStandard[3]=30;

    TraderItemPrice[4]=60;
    TraderItemId[4]=2377;
    TraderItemTrig[4]="[Rr]ed [Rr]obe";
    TraderItemName[4]="red robe";
    TraderItemNumber[4]=9;
    TraderItemSellPrice[4]=18;
    TraderItemStandard[4]=30;

    TraderItemPrice[5]=4;
    TraderItemId[5]=2745;
    TraderItemTrig[5]="[Pp]archment";
    TraderItemName[5]="parchment";
    TraderItemNumber[5]=45;
    TraderItemSellPrice[5]=15;
    TraderItemStandard[5]=45;

    TraderItemPrice[6]=30;
    TraderItemId[6]=329;
    TraderItemTrig[6]="[Ii]nk";
    TraderItemName[6]="ink";
    TraderItemNumber[6]=50;
    TraderItemSellPrice[6]=9;
    TraderItemStandard[6]=50;

    TraderItemPrice[7]=40;
    TraderItemId[7]=357;
    TraderItemTrig[7]="[Bb]lue [Ww]izard [Hh]at";
    TraderItemName[7]="blue wizard hat";
    TraderItemNumber[7]=9;
    TraderItemSellPrice[7]=8;
    TraderItemStandard[7]=20;

    TraderItemPrice[8]=40;
    TraderItemId[8]=358;
    TraderItemTrig[8]="[Rr]ed [Ww]izard [Hh]at";
    TraderItemName[8]="red wizard hat";
    TraderItemNumber[8]=9;
    TraderItemSellPrice[8]=8;
    TraderItemStandard[8]=20;

    TraderItemPrice[9]=40;
    TraderItemId[9]=370;
    TraderItemTrig[9]="[Cc]olorful [Hh]at";
    TraderItemName[9]="colorful hat";
    TraderItemNumber[9]=9;
    TraderItemSellPrice[9]=8;
    TraderItemStandard[9]=20;

    TraderItemPrice[10]=80;
    TraderItemId[10]=371;
    TraderItemTrig[10]="[Ee]xpensive [Hh]at";
    TraderItemName[10]="expensive hat";
    TraderItemSellPrice[10]=16;
    TraderItemStandard[10]=20;

    TraderCopper=600;

    TraderTrig[1]="[Hh]ello";
    TraderText[1]="Greetings, stranger!";

    TraderTrig[2]="[Gg]reetings";
    TraderText[2]="Hello, stranger!";

    TraderTrig[3]="I.+no.+stranger";
    TraderText[3]="People are always strangers. I can't read your mind!";

    TraderTrig[4]="[Ww]hat.+do";
    TraderText[4]="I'm a mage. Unfortunately, my spells tend to backfire on my robe.";

    TraderTrig[5]="[Ll]ist.+wares";
    TraderText[5]="I sell and buy parchment, ink, mage robes and wizard hats.";

    TraderTrig[6]="[Ww]hat.+sell";
    TraderText[6]="I sell parchment, ink, black robe, red robe, yellow robe, green robe, blue wizard hat, red wizard hat, colorful hat, and expensive hat.";

    TraderTrig[7]="[Ww]hat.+buy";
    TraderText[7]="I buy black robe, red robe, yellow robe, green robe, blue wizard hat, red wizard hat, colorful hat, expensive hat, parchment and ink.";

    TraderTrig[8]="[Gg]oodbye";
    TraderText[8]="Farewell";

    TraderTrig[9]="[Ff]arewell";
    TraderText[9]="Goodbye";



end

function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        TraderFirst=1;
    end
    if (cycCount==nil) then
        cycCount=1;
        nextDelivery=math.random(40000);
        thisNPC:increaseSkill(1,"common language",100);
        --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery);
    else
        cycCount=cycCount+1;
        --printerr("In Circle "..cycCount.. "With "..nextDelivery);
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
    if TraderCopper<1000 then
        TraderCopper=TraderCopper+math.random(20,150);
    else
        TraderCopper=TraderCopper-math.random(20,150);
    end
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
                    --originator:inform("Ready set true");
                    thisNPC:talk(Character.say,TraderText[i]);
                    ready=true;

                end
                i=i+1;
            until ((i==table.getn(TraderText)+1) or ready)
            if (not ready) then
                --originator:inform("Ready set false");
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
                                        if (originator:createItem(TraderItemId[itnCnt],count,333) ~=0 ) then
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
                                        if (originator:createItem(TraderItemId[itnCnt],1,333) ~=0 ) then
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
                                        if (originator:createItem(3076,ActPrice*count,333) ~=0 ) then
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
                                        if (originator:createItem(3076,ActPrice,333) ~=0 ) then        --give money!
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
                elseif (string.find(message,"[Ll]ist.+wares")~=nil or string.find(message,"[Ww]hat.+wares.+sell")~=nil) then
                    --originator:inform("HIER");
                    wareString="I sell ";
                    for itnCnt=1,table.getn(TraderItemId) do
                        --originator:inform("hier: "..TraderItemPrice[itnCnt]);
                        if (TraderItemPrice[itnCnt]~=0) then
                            --originator:inform("hier: "..TraderItemName[itnCnt]);
                            if string.len(wareString)+string.len(TraderItemName[itnCnt])>240 then    -- line too long
                                thisNPC:talk(Character.say,wareString);                     -- say everything until here
                                wareString="";
                            end
                            --originator:inform("="..TraderItemName[itnCnt]);
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
                    originator:inform("Copper="..TraderCopper..", next delivery: "..nextDelivery.."cycCount:"..cycCount);
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

