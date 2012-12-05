module("lte.effect2", package.seeall)
function callEffect( effect, target )
    effect.nextCalled = 5; --set the calling time
    if ( effect.numberCalled < 20 ) then --insert the script 10 times.
        target:inform("effect2 return true");
        return true; --return true to insert the script again
    else
        target:inform("effect2 return false");
        return false; -- after 10 times return false to delete the script for the char.
    end
end
