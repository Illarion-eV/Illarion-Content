--- *** effects by rings and amuletts *** ---
-- could be massively improved but i am too lazy. works though.

-- handXgem=number of the inserted gem
-- handXmod=MODIFIER of the inserted gem (ceil(str/3))
-- data of ring: [gemNr] [str]


require("base.common")
require("content.jewelbonus")
module("lte.gembonus", package.seeall)

function addEffect(gemBonus, User)         -- Infection starts
    --User:inform("effect started");
end

function doRemaining(gemBonus,User)
    -- go through all remaining attributes and lower them
    attList={"intelligence","willpower","perception","essence","dexterity","strength","constitution","agility"};
    for index,attrName in attList do
        foundAttr,remainAttr=gemBonus:findValue("remain"..attrName)
        if foundAttr then
            content.jewelbonus.intelligentRemove(User,attrName,remainAttr)
        end
    end
end

function callEffect(gemBonus, User)                     -- Effect wird ausgeführt
    --User:inform("checking...");
    doRemaining(gemBonus,User);
    fndLeft,gemType=gemBonus:findValue("hand1gem");     -- check if there was something for left hand
    if fndLeft then                                     -- if so...
        leftItem=User:getItemAt(7);                     -- ... get right finger item
        if ((leftItem~=nil) and (leftItem.id~=0)) then
            fndLeft,gemStr=gemBonus:findValue("hand1mod");
            insGem,insStr=content.jewelbonus.getBonus(leftItem);
            insStr=content.jewelbonus.getModifier(insStr);
            if gemType*10+gemStr~=10*insGem+gemStr then     -- compare values from item's data with lte-value 
                content.jewelbonus.removeBonus(User,gemType,gemStr);           -- if it doesn't fit, remove bonus...
                gemBonus:removeValue("hand1mod");           -- ... and corresponding values from LTE
                gemBonus:removeValue("hand1gem");
                --User:inform("not found anymore!");
            end
        else
            --User:inform("nil");
            fn,gemStr=gemBonus:findValue("hand1mod");
            fn,gemType=gemBonus:findValue("hand1gem");
            content.jewelbonus.removeBonus(User,gemType,gemStr);
            --User:inform("nil 2");
            gemBonus:removeValue("hand1mod");
            gemBonus:removeValue("hand1gem");
            --User:inform("not found anymore!");
        end
    end
    --User:inform("now checking right");
    --User:inform("checking 2...");
    fndRight,gemType=gemBonus:findValue("hand2gem");
    if fndRight then
        --User:inform("should have something right");
        rightItem=User:getItemAt(8);
        if ((rightItem~=nil) and (rightItem.id~=0)) then
            --User:inform("not nil "..rightItem.id);
            fndRight,gemStr=gemBonus:findValue("hand2mod");     -- find the modifier of LTE
            insGem,insStr=content.jewelbonus.getBonus(rightItem);                  -- find what's put on the hand
            insStr=content.jewelbonus.getModifier(insStr);                         -- calculate modifier from ring
            --User:inform("here: "..gemType*10+gemStr.. " and from data "..10*insGem+insStr);
            if gemType*10+gemStr~=10*insGem+insStr then
                --User:inform("2");
                content.jewelbonus.removeBonus(User,gemType,gemStr);
                gemBonus:removeValue("hand2mod");
                gemBonus:removeValue("hand2gem");
                --User:inform("not found anymore!");
            end
        else
            --User:inform("nil");
            fn,gemStr=gemBonus:findValue("hand2mod");
            fn,gemType=gemBonus:findValue("hand2gem");
            content.jewelbonus.removeBonus(User,gemType,gemStr);
            --User:inform("nil 2");
            gemBonus:removeValue("hand2mod");
            gemBonus:removeValue("hand2gem");
            --User:inform("not found anymore!");
        end
    end
    gemBonus.nextCalled=60;
    return true;
end

function removeEffect( gemBonus, User ) -- do nothing
    
end

function loadEffect(gemBonus, User)     -- load altered stats by ONLY looking at the rings and giving their boni
                                        -- thus: doing the same as if moved onto fingers.
    leftRing=User:getItemAt(7);
    rightRing=User:getItemAt(8);

    lGem,lStr=content.jewelbonus.getBonus(leftRing);
    rGem,rStr=content.jewelbonus.getBonus(rightRing);
    
    if lGem>0 then
        content.jewelbonus.giveBonus(User,leftRing);
    end
    if rGem>0 then
        content.jewelbonus.giveBonus(User,rightRing);
    end

end
