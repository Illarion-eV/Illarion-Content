require("base.common");
module("monster.lte.vampirism_desease", package.seeall);

-- INSERT INTO longtimeeffects VALUES (501, 'satk_vampirism_desease', 'monster.lte.vampirism_desease');

function addEffect(VampEffect, User)
    return true;
end

function loadEffect(VampEffect, User)

end

function callEffect(VampEffect, User)
	
	local hourTime = world:getTime("hour");
	if (hourTime < 6) and (hourTime > 20) then
		return true;
	end
	
	if (User.pos.z < 0) then
		return true;
	end
	
	local HealthPoints = User:increaseAttrib("hitpoints", -50);	
	if(HealthPoints <= 0) then
		return false;
	end
	
    return true;
end

function removeEffect(VampEffect, User)

end