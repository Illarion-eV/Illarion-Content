module("lte.diet", package.seeall)
-- Long Time Effect Script: Diet System
-- Effect ID: 12

function addEffect(dietEffect,Character)
end

function callEffect(dietEffect,Character)
	dietEffect.nextCalled=2147483640; -- ( 2^31 - 8 )
	return true;
end

function removeEffect(dietEffect,Character)
    -- something kills out script, lets store everything and reload the effect
    found_constMod,constMod = dietEffect:findValue("constMod");
    found_dom,dom = dietEffect:findValue("dom");

    newEffect = LongTimeEffect(12,2147483640);
    if ( found_constMod ) then
	    newEffect:addValue("constMod",constMod);
	else
	    newEffect:addValue("constMod", 0);
	end

	if ( found_dom ) then
	    newEffect:addValue("dom",dom);
	else
	    newEffect:addValue("dom", 0);
	end
    User.effects:addEffect(newEffect);
end

function loadEffect(dietEffect,Character)
	found,constMod = dietEffect:findValue("constMod");
	if found then
		Character:setAttrib("constitution",Character:increaseAttrib("constitution",0)+constMod);
		if (Character:increaseAttrib("constitution",0)<1) then
			Character:setAttrib("constitution",1);
		end
	end
end
