require("base.common");
module("monster.lte.lte_deathgaze", package.seeall);

-- INSERT INTO longtimeeffects VALUES (550, 'satk_deathgaze', 'monster.lte.lte_deathgaze');

function addEffect (gazeEff,user)

end

function callEffect (gazeEff,user)
	found, effTime = gazeEff:findValue("effTime");
	if found and (effTime>0) then
		local HelmList = {7,16,94,184,185,2286,2287,2291,2302,2303,2444};
		local helmet = user:getItemAt (1);
		for j,k in pairs(HelmList) do
			if not k == helmet.id then
				user:increaseAttrib ("hitpoints",-300);
				gazeEff:addValue("effTime",effTime-1);
				if (math.random(100)<= 10) then
					user:inform ("The terrifying gaze of the monster is piercing your skull, making you feel like your head is about to explode.",Player.mediumPriority);
				end
			else
				return false;
			end
		end
	else 
		return false;
	end
	return true;
end

function loadEffect(gazeEff, user)

end

function removeEffect(gazeEff, user)

end
