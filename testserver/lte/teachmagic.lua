require("base.common")
module("lte.teachmagic", package.seeall)

---------------------------
-------- Character lernt eine Rune
---------------------------------
function addEffect(teachEffect, Character)
    Character:inform("AddEffect ausgeführt");

    
    year=world:getTime("year");
    year=(year-1)*31536000;					-- (year-1)*((15*24) + 5)*24*60*60;
    month=world:getTime("month");
    month=(month-1)*2073600;					-- (month-1)*24*24*60*60;
    day=world:getTime("day");
    day=(day-1)*86400;							-- (day-1)*24*60*60;
    hour=world:getTime("hour");
    hour=hour*3600;								-- hour*60*60;
    minute=world:getTime("minute");
    minute=minute*60;
    second=world:getTime("second");
    second=second;
            
    waittime=1814400;
	 
	timestamp=year+month+day+hour+minute+second+waittime;

	
 	teachEffect:addValue("Rune1Index",timestamp);
	teachEffect:addValue("Rune2Index",1);
	--Character:inform("moep->AddEffect erfolgreich");
	

end

-----------------------------------------------
------ Character is affected 
-----------------------------------------------
function callEffect(teachEffect, Character)    -- Effect wird ausgeführt


   	teachEffect.nextCalled =99999999999999;       -- call it again in öhm...never!


    return true;
end




----------------------------------------------
---- Character lost effect
----------------------------------------------

function removeEffect( Effect, Character )
  	-- Character:inform("moep->Und weiter gehts!");
end


function loadEffect(Effect, Character)

end
