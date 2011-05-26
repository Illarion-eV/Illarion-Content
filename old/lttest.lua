function callEffect( effect, target )
    found,value = effect:findValue("testvalue");
    if ( found  ) then --check if we have the testvalue 
        target:inform("lteffect called: " .. value); --inform about the testvalue
    else
        target:inform("first call"); --inform about the first calling        
        effect:addValue("testvalue",10); --add the testvalue
        target:inform("added value");
    end
    found,value = effect:findValue("testvalue2");
    if ( found  ) then --check if we have the testvalue 
        target:inform("value2 called: " .. value); --inform about the testvalue  
    end
    found,value = effect:findValue("testvalue3");
    if ( found  ) then --check if we have the testvalue 
        target:inform("value3 called: " .. value); --inform about the testvalue  
    end    
    effect.nextCalled = 100; --set the calling time
    if ( effect.numberCalled < 10 ) then --insert the script 10 times.
        effect:addValue("testvalue", effect.numberCalled);
        target:inform("return true");
        return true; --return true to insert the script again
    else
        target:inform("return false");
        return false; -- after 10 times return false to delete the script for the char.
    end
end

function addEffect( effect, target)
    target:inform("effect with id 1 added");
end

function removeEffect( effect, target )
    target:inform("effect with id 1 removed");
end

function doubleEffect( effect, target )
    target:inform("effect with id 1 doubled added");
    effect:addValue("testvalue2",200);
    effect:addValue("testvalue3",450);
    target:inform("effect with id 1 doubled added end");
end

function loadEffect(effect, target)
    target:inform("effect with id 1 was loaded");
end


    

