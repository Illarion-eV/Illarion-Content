module("lte.segen", package.seeall)
function initBlessings()
    Blessings = {};
    Blessings[1001] = {};
    Blessings[1001]["attribs"] = {};
    Blessings[1001]["skills"] = {};
    Blessings[1001]["attribs"]["intelligence"] = 5;
    Blessings[1001]["attribs"]["willpower"] = 3;
    Blessings[1001]["skills"]["library research"] = 50;
    Blessings[1001]["skills"]["magic resistance"] = 50;
    isBlessingsInit = 1;
end

function bless(User, blessEffect)
User:inform("1");
    if isBlessingsInit == nil then
    User:inform("2");
        initBlessings();
    User:inform("3");
    end;
    User:inform("4");
    neckItem = User:getItemAt(2);
    User:inform("5");
    blessed, GodID = blessEffect:findValue("isBlessed");
    User:inform("6: "..GodID);
    if blessed and neckItem.id==222 and neckItem.quality==1000 then
    User:inform("7");
        for attrib, value in Blessings[GodID]["attribs"] do
            User:inform(attrib..": "..User:increaseAttrib( attrib, value ));
        end;
        for skill, value in Blessings[GodID]["skills"] do
            User:inform(skill..": "..User:increaseSkill( 4, skill, value ));
        end;
    end;
end

function addEffect(blessEffect, Blessed)         -- Infection starts
    --base.common.InformNLS(Blessed,
    --"Du bist gesegnet.",
    --"You feel blessed.");
    blessEffect:addValue("blessStr",100);
    bless( Blessed, blessEffect );
end

function callEffect(blessEffect, Blessed)       -- Effect wird ausgefhrt
    found,value=blessEffect:findValue("blessStr");
    if value == 101 then
        bless(Blessed, blessEffect);
    end;
    termVal, dummy = blessEffect:findValue("terminate");
    if value>1 and not termVal then
        blessEffect:addValue("blessStr",value-1);
	Blessed:inform("naechster Aufruf, Bahnsteig 2");
        blessEffect.nextCalled=3; --181440;          -- 21 Tage=18144000
    else
        Blessed:inform("you feel unblessed and stupid, stupid, stupid.");
        return false;
    end
    return true;
end

function removeEffect( blessEffect, Blessed)
    Blessed:inform("weg damit.");
    
end

function loadEffect(blessEffect, Blessed)
    Blessed:inform("load");
    bless( Blessed, blessEffect );
end
