require("base.common");

module("triggerfield.base.triggerfield", package.seeall)

-- Messages in an array of things that can happen. Each thing is an array: {function, odds}.
function getEvent(messages)
	-- Sum up all odds values in the messages array to figure out the maximum value of the random range
	maxv = base.common.fold(events, function(val, el) return val + el[2]; end, 0);
	ran = math.random(maxv);

	-- Choose which of the messages from the array to output.
	for i,v in ipairs(messages) do
		ran = ran - v[2];
		if ran <= 0 then
			return v[1];
		end
	end
	-- Should never happen though, as the max value of ran is the sum of all odds
	return {function() end, 0}
end

