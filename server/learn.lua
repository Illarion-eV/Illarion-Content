require("base.common")

module("server.learn", package.seeall)

-- called by the server when user:learn(...) is issued by a script

function learn( user, skill, skillGroup, actionPoints, opponent, leadAttrib )

user:increaseMentalCapacity(10*actionPoints);

end


-- invoked every 10s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function reduceMC( user )

    if user:idleTime() < 300 then --Has the user has done any action or spoken anything within the last five minutes?
        user:inform("Reduction:"..(user:getMentalCapacity()*0.00025).."!");
     	user:increaseMentalCapacity(-1*math.floor(user:getMentalCapacity()*0.00025+0.5)); --reduce MC-points by 0.025%, rounded correctly.
	end
	
    user:inform("Idle for:"..user:idleTime().." seconds.");
    user:inform("MC:"..user:getMentalCapacity().."!");

end
