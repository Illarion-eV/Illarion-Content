module("lte.fighting", package.seeall)
-- Fighting LTE

function addEffect( Effect, Character)
    -- silence
end

function callEffect( Effect, Char )
    found,value = Effect:findValue( "stop" );
    if found then
        Char:inform("Stop for: "..(value-1));
        if ( value <= 1 ) then
            Effect:removeValue( "stop" );
        else
            Effect:addValue( "stop", value-1 );
        end
    else
        found,value = Effect:findValue( "empty" );
        if found then
            if ( value == 15 ) then
                Effect:addValue( "empty", value+1 );
            else
                return false;
            end
        else
            Effect:addValue( "empty", 1 );
        end
    end
    
    Effect.nextCalled = 1;
    return true;
end

function removeEffect( Effect, Character )
    -- silence
end
