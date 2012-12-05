module("lte.the_one_ring", package.seeall)
function addEffect( theEffect, User )
    User.isinvisible = true;
end

function callEffect(theEffect, User )
    theEffect.nextCalled = 10; --erneut in 1 sec
    ringItemL = User:getItemAt( 7 );
    ringItemR = User:getItemAt( 8 );
    --reduce the quality of the cloak
    if ( ringItemL.id == 235 and ringItemL.data == 100) then
        world:changeQuality( ringItemL, -1 );
    elseif ( ringItemR.id == 235 and ringItemR.data == 100) then
        world:changeQuality( ringItemR, -1 );
    end
    
    --check if the cloak is on the right place
    ringItemL = User:getItemAt( 7 );
    ringItemR = User:getItemAt( 8 );
    if ( ringItemL.id == 235  and ringItemL.data == 100) then
        return true;
    elseif ( ringItemR.id == 235  and ringItemR.data == 100) then
        return true;
    else
        return false;
    end
end

function removeEffect( theEffect, User )
    User.isinvisible = false;
end

function loadEffect( theEffect, User)
    User.isinvisible = true;
end
