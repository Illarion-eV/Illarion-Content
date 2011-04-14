module("server.learn", package.seeall)

-- called by the server when user:learn(...) is issued by a script

function learn( skill, skillGroup, actionPoints, opponent, leadAttrib )

end


-- invoked every 10s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function reduceMC( user )

end
