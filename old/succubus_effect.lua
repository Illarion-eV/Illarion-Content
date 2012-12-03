require("base.common")
module("lte.succubus_effect", package.seeall)

function createAmulett( Target )
    oldItem = Target:getItemAt(2);
    if ( oldItem.id ~= 0 ) then
        world:createItemFromItem(oldItem, Target.pos, true);
        world:erase(oldItem,255);
        base.common.InformNLS(Target,"dein altes Amulett fällt zu boden","You drop your old Amulett!");
    end
    Target:createAtPos(2,222,1)
    newItem = Target:getItemAt(2);
    newItem.quality = 999;
    newItem.data = 666;
    world:changeItem( newItem );
    base.common.InformNLS(Target,"Die macht des Dämons hält deinen Hals fest im Griff","The power of the Demon holds your neck in a strong grasp");
end

function addEffect( theEffect, Target )
    Target:inform("suceffect");
    createAmulett( Target );
    Target:inform("cA");
    --store the old/new values and change the attribs
    oldVal = Target:increaseAttrib("strength",0);
    theEffect:addValue("oldStr", oldVal );
    theEffect:addValue("Str", (oldVal - (oldVal*0.3)) );
    Target:increaseAttrib("strength",-(oldVal*0.3));

    oldVal = Target:increaseAttrib("willpower",0);
    theEffect:addValue("oldWill", oldVal );
    theEffect:addValue("Will", (oldVal - (oldVal*0.5)) );
    Target:increaseAttrib("willpower",-(oldVal*0.5));    
    
    oldVal = Target:increaseAttrib("intelligence",0);
    theEffect:addValue("oldInt", oldVal );
    theEffect:addValue("Int", (oldVal - (oldVal*0.5)) );
    Target:increaseAttrib("intelligence",-(oldVal*0.5));
    
end

function callEffect( theEffect, Target)
    theEffect.nextCalled = 9999999;
    return true;
end

function doubleEffect( theEffect, Target)

end

function removeEffect( theEffect, Target)
    fnd, val = theEffect:findValue("oldStr");
    if (fnd) then
        Target:setAttrib("strength", val );
    end
    fnd, val = theEffect:findValue("oldWill");
    if (fnd) then
        Target:setAttrib("willpower", val );
    end    
    fnd, val = theEffect:findValue("oldInt");
    if (fnd) then
        Target:setAttrib("intelligence", val );
    end 
    base.common.InformNLS( Target,"Du fühlst dich wieder genauso stark wie vor dem Kuss des Dämons", "You feel as Strong as before the kiss of the Demon");
end

function loadEffect( theEffect, Target)
    fnd, val = theEffect:findValue("Str");
    if (fnd) then
        Target:setAttrib("strength", val );
    end
    fnd, val = theEffect:findValue("Will");
    if (fnd) then
        Target:setAttrib("willpower", val );
    end    
    fnd, val = theEffect:findValue("Int");
    if (fnd) then
        Target:setAttrib("intelligence", val );
    end 
    base.common.InformNLS( Target, "Du fühlst dich schwächer als normal", "You feel weaker than normal");
end

