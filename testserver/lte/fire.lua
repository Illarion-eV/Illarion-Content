module("lte.fire", package.seeall)
function initBurnList()
    return {2, 3, 5, 8, 9, 11, 14, 15, 17, 21, 23, 24, 34, 36, 40, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 64, 65, 70, 72, 74, 76, 77, 80, 81, 88, 89, 90, 92, 97, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 121, 122, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 168, 169, 170, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 188, 191, 193, 194, 195, 196, 203, 205, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 226, 230, 231, 237, 246, 247, 248, 249, 258, 259, 264, 265, 266, 267, 271, 273, 274, 275, 276, 288, 289, 290, 291, 293, 299, 300, 301, 302, 303, 308, 309, 311, 312, 320, 322, 323, 332, 333, 335, 337, 338, 339, 353, 354, 356, 357, 358, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 383, 384, 385, 386, 387, 388, 432, 433, 498, 505, 506, 507, 512, 513, 514, 515, 516, 522, 523, 524, 525, 534, 535, 536, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 558, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 614, 615, 616, 617, 618, 619, 620, 621, 728, 729, 730, 731, 732, 916, 917, 1001, 1060, 1061, 1089, 1360, 1361, 1362, 1367, 1782, 1783, 1790, 1791, 1804, 1807, 1808, 1809, 1812, 1813, 1817, 1911, 1912, 1914, 1915, 2031, 2046, 2069, 2113, 2114, 2169, 2170, 2185, 2193, 2194, 2295, 2377, 2378, 2380, 2384, 2416, 2418, 2419, 2420, 2421, 2445, 2490, 2491, 2492, 2493, 2494, 2525, 2527, 2528, 2530, 2541, 2543, 2544, 2547, 2548, 2549, 2560, 2561, 2566, 2567, 2570, 2572, 2573, 2577, 2579, 2584, 2585, 2586, 2598, 2602, 2604, 2605, 2606, 2607, 2608, 2609, 2610, 2615, 2616, 2617, 2619, 2620, 2621, 2622, 2646, 2664, 2685, 2708, 2714, 2715, 2716, 2718, 2719, 2727, 2739, 2744, 2745, 2760, 2780, 2781, 2782, 2783, 2784, 2785, 2786, 2850, 2862, 2863, 2875, 2876, 2877, 2878, 2879, 2880, 2885, 2905, 2906, 2906, 2907, 2908, 2913, 2914, 2915, 2916, 2917, 2924, 2925, 2926, 2927, 3075, 3081, 3082, 3083, 3084, 3109, 3110, 3111, 3112, 3113, 3114};
end

function isBurnable( id , lower, upper )
    if lower > upper then
        return false;
    end;
    margin = math.floor((lower+upper)/2);
    if burnList[margin] == id then
        return true;
    elseif burnList[margin] < id then
        return isBurnable( id, margin+1, upper );
    else
        return isBurnable( id, lower, margin-1 );
    end;
end

function isBurnableField( fldPos )
    local fld = world:getField(fldPos);
    local cnt = fld:countItems();
    local i;
    for i=0,cnt-1 do
        if isBurnable( (fld:getStackItem(i)).id, 1, burnLength ) then
            return true;
        end;
    end;
    return false;
end;

function isFireOnField(fldPos)
    field=world:getField(fldPos);
    itnNumber=field:countItems();
    local i;
    for i=0, itnNumber-1 do
        theID=(field:getStackItem(i)).id;
        if theID==12 or theID==359 then
            return true;
        end
    end
    return false;
end

function addEffect(fireEffect, Patient)         -- Infection starts
    --Patient:talk(Character.say, "Ich habs.");
    if burnList == nil then
        burnList = initBurnList();
        burnLength = table.getn(burnList);
        burnRad = 3;
    end;
end

function loadEffect(fireEffect, Patient)         -- Infection starts
    Patient:talk(Character.say, "Ich habs geladen.");
    if burnList == nil then
        burnList = initBurnList();
        burnLength = table.getn(burnList);
        burnRad = 4;
    end;
end

-- checks if fire is under roof or under rain, if so, won't burn
function FireInRain( posX, posY, posZ )
    local potentialRoofPos = position( posX, posY, posZ + 1 );
    local potRoof=world:getField( potentialRoofPos );

    local curWeather = world.weather;
    if ( ( ( curWeather.percipitation_type == 1 ) or ( curWeather.percipitation_type == 2 ) ) and ( curWeather.percipitation_strength > 20 ) and
       ( posZ >= 0 ) and ( potRoof==nil ) ) then
            PlayerList = world:getPlayersOnline();
            for char in PlayerList do
                char:inform( "Fire at " .. tostring( poxX ) .. " " .. tostring( posY ) .. " " .. tostring( posZ ) );
            end;
            --return true;
    end
    return false
end

function callEffect(fireEffect, NPC)
    fireEffect.nextCalled=300;
    
    --NPC:talk(Character.say,"callEffect:");
    fnd, lstNo = fireEffect:findValue("lastNumber");
    fnd, fstNo = fireEffect:findValue("firstNumber");
    i = fstNo;
    oldLstNo = lstNo;
    --NPC:talk(Character.say,"fstNo: "..fstNo);
    --NPC:talk(Character.say,"lstNo: "..lstNo);
    while (i <= oldLstNo) and (i ~= 0) do
        --NPC:talk(Character.say,"Feuer: "..i..":");
        fnd,posX=fireEffect:findValue("fireX"..i);
        posX = posX - 100000;
        fnd,posY=fireEffect:findValue("fireY"..i);
        posY = posY - 100000;
        fnd,posZ=fireEffect:findValue("fireZ"..i);
        posZ = posZ - 100000;
        fnd,next=fireEffect:findValue("fireN"..i);
        
        --NPC:talk(Character.say,"Position: "..posX..", "..posY..", "..posZ);
        --NPC:talk(Character.say,"Next: "..next);
        flamePos = position(posX, posY, posZ);
        if isFireOnField( flamePos ) then
            --NPC:talk(Character.say,"Brennt!");
            prvNo = i;
            ---[[

            -- VERBRENNEN DEAKTIVIERT
            --while world:isItemOnField( flamePos ) do
                --world:erase( world:getItemOnField( flamePos ), 1 );
            --end;
            flame = world:createItemFromId( 359, 1, flamePos, true, 999, 0);
            flame.wear = 1;
            world:changeItem( flame );

            -- AUSBREITUNG DES FEUERS AN posX, posY, posZ STARTEN
            --NPC:talk(Character.say,"Ausbreitung:");
            for x=posX-burnRad,posX+burnRad do
                for y=posY-burnRad,posY+burnRad do
                    for z=posZ-1,posZ+1 do
                        if (math.random(1,4)==2) then
                            if ( not( FireInRain( x, y, z ) ) ) then -- Edit by abcfantasy: If fire not under the rain
                                burnPos = position(x,y,z);
                                if (world:isItemOnField( burnPos ) and not isFireOnField( burnPos )) and isBurnableField( burnPos ) then
                                    -- NPC:talk(Character.say,"Neues Feuer!");
                                    world:createItemFromId( 359, 1, burnPos, true, 999, 0);
                                    nextFree = lstNo + 1;
                                    fireEffect:addValue("fireX"..nextFree,x+100000);
                                    fireEffect:addValue("fireY"..nextFree,y+100000);
                                    fireEffect:addValue("fireZ"..nextFree,z+100000);
                                    fireEffect:addValue("fireN"..lstNo,nextFree);
                                    fireEffect:addValue("fireN"..nextFree,0);                 -- next flame index
                                    fireEffect:addValue("lastNumber",nextFree);               -- last flame number
                                    lstNo = nextFree;
                                end;
                            end;    -- End Edit (abcfantasy)
                        end;
                    end;
                end;
            end;
            --]]
            
            
        end;
        
        fnd,next=fireEffect:findValue("fireN"..i);
        if fstNo == lstNo then
            --NPC:talk(Character.say,"Entferne alles!");
            NPC.effects:removeEffect( 8 );
            return false;
        else
            if i == fstNo then
                --NPC:talk(Character.say,"Entferne erstes! Next: "..next);
                fireEffect:addValue("firstNumber", next);
                fstNo = next;
            elseif i == lstNo then
                --NPC:talk(Character.say,"Entferne letztes!");
                fireEffect:addValue("lastNumber", prvNo);
                lstNo = prvNo;
                fireEffect:addValue("fireN"..prvNo, 0);
            else
                --NPC:talk(Character.say,"Entferne aus der Mitte!");
                fireEffect:addValue("fireN"..prvNo, next);
            end;
            fireEffect:removeValue("fireX"..i);
            fireEffect:removeValue("fireY"..i);
            fireEffect:removeValue("fireZ"..i);
            fireEffect:removeValue("fireN"..i);
        end;
        
        i = next;
    end;

    return true;
end

function removeEffect( Effect, Character )
    Character:talk(Character.say, "Feuer gelöscht!");
end
