require("base.common")
module("lte.labourcamp", package.seeall)

-- INSERT INTO longtimeeffects VALUES (55, 'labourcamp', 'lte.labourcamp');


function addEffect(Effect, User)
end

function callEffect(Effect,User)

    if User.pos.z ~= -40 then -- security check: char not in labour camp, remove lte
	    return false
	end	
	
	local findCounter,spamProtection_1 = Effect:findValue("spamProtection_1")
    if findCounter then
	   spamProtection_1 = base.common.Limit((spamProtection_1 - 1), 0, 5)
	   Effect:addValue("spamProtection_1",spamProtection_1)
    end
   
    return true
end

function removeEffect(Effect,User)
end

function loadEffect(Effect,User)
end