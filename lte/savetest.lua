module("lte.savetest", package.seeall)
function addEffect( theEffect, User )
    User:inform("Testeffekt added");
	theEffect:addValue("testvalue2",20);
end

function callEffect(theEffect, User )
    theEffect.nextCalled = 5; --erneut in 5 sec
	User:inform("Testeffekt called");
    return true;
end

function removeEffect( theEffect, User )
    User:inform("Testeffekt removed");
end

function loadEffect( theEffect, User)
    User:inform("Testeffekt loaded");
end
