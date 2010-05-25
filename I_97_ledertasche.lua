function LookAtItem(User,Item)
    local txt;
    local low32 = Item.data;
    local high16  = Item.quality-333;
        
    -- high24 contains the highest 24 bits, thus the highest 5 chars
    local high24 = high16 + math.mod( low32, 256 )*65536;
    -- low24 contains the lowest 24 bits, thus the lowest 5 chars
    local low24  = math.floor( low32 / 256 );
    
    if User:getPlayerLanguage() == 0 then
        txt = "Du siehst Ledertasche";
    else
        txt = "You see leather bag";
    end;
    
    if high24 == 0 then
        world:itemInform( User, Item, txt );
    else
    	local aval = string.byte("a") - 1;
        local lbl = "";
        a = low24;
        while a > 0 do
            lbl = string.char( math.mod( a, 27 ) + aval )..lbl;
            a = math.floor( a / 27 );
        end;
        a = high24 - 1;
        while a > 0 do
            lbl = string.char( math.mod( a, 27 ) + aval )..lbl;
            a = math.floor( a / 27 );
        end;
        world:itemInform( User, Item, txt.." ("..lbl..")");
    end;
    --User:inform("Quality: _"..Item.quality.."_");
    --User:inform("Data: _"..Item.data.."_");
end

function UseItem( User, Item, TargetItem, Counter, Param )
    if ( Item:getType() == 3 ) or ( Item:getType() == 4 ) then
		    local txt = User.lastSpokenText;
		    if txt == "!bag" then
		        Item.data = 0;
		        Item.quality = 333;
		        world:changeItem(Item);
		        if User:getPlayerLanguage() == 0 then
		            User:inform("Du entfernst die Beschriftung von der Ledertasche.");
		        else
		            User:inform("You remove the label from the leather bag.");
		        end;
		    else
		        local n = string.len(txt);
		        if (string.sub(txt, 1, 5) == "!bag ") and (n >= 6) then
		            local lbl = string.lower( string.sub(txt, 6, math.min(n, 15)) );
		            local i;
		            local isCorrect = true;
		            local c;
		            n = string.len(lbl);
		            for i=1,n do
		                c = string.sub(lbl, i, i);
		                isCorrect = isCorrect and ( c >= "a" ) and ( c <= "z" );
		            end;
		            if isCorrect then
		                local a = 0;
		                local aval = string.byte("a") - 1;
		                if n <= 3 then
    		                for i=1,n do
    		                    a = a*27 + string.byte(lbl, i) - aval;
    		                end;
    		                Item.quality = a + 1 + 333;
    		                Item.data = 0;
		                else
		                    for i=1,4 do
    		                    a = a*27 + string.byte(lbl, i) - aval;
    		                end;
    		                if n >= 5 then
    		                    a = a*27 + string.byte(lbl, 5) - aval;
    		                end;
    		                b = math.floor( a / 65536 );
    		                a = math.mod( a, 65536 ) + 1;
    		                if a >= 32768 then
    		                    a = a - 65536;
    		                end;
    		                Item.quality = a+333;
    		                a = 0;
    		                for i=6,n do
    		                    a = a*27 + string.byte(lbl, i) - aval;
    		                end;
    		                a = a*256 + b;
    		                if a >= 2147483648 then
    		                    a = a - 4294967296;
    		                end; 
    		                Item.data = a;
		                end;
		                world:changeItem(Item);
		                if User:getPlayerLanguage() == 0 then
		                    User:inform("Du beschriftest die Ledertasche mit "..lbl..".");
		                else
		                    User:inform("You label the leather bag with "..lbl..".");
		                end;                
		            end;
		        end;
		    end;
		end;        
end
