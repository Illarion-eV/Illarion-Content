require("base.common");
module("monster.lte.lte_deathgaze", package.seeall);

-- INSERT INTO longtimeeffects VALUES (500, 'satk_deathgaze', 'monster.lte.lte_deathgaze');

function addEffect (gazeEff,user)

end

function callEffect (gazeEff,user)
	found, effTime = gazeEff:findValue("effTime");
	if found then
		
	end
end