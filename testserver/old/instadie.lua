require("base.common")

module("triggerfield.instadie", package.seeall)

function MoveToField(User)

	if(Init == nil) then
		RacesAllowed = {};
		table.insert(RacesAllowed, 20); -- demon skeleton
		table.insert(RacesAllowed, 11); -- skeleton
		table.insert(RacesAllowed, 29); -- shadow skeleton
		table.insert(RacesAllowed, 30); -- golem
		--table.insert(RacesAllowed, RACEID); -- Add more races if you want to
		
		Init = 1;
	end
	
	local race = User:getRace();
	for i,v in pairs(RacesAllowed) do
		if(race == RacesAllowed[i]) then
			return;
		end
	end
	User:increaseAttrib("hitpoints",-32767);
	base.common.InformNLS(User, "X GERMAN", "X ENGLISH");
end
