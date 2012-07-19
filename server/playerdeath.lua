-- player death

-- deadPlayer - The player (character) whose hitpoints have just been set to zero

module("server.playerdeath", package.seeall)

function playerDeath(deadPlayer)
    deadPlayer:talkLanguage(Character.say, Player.english, "I am dead!")
    deadPlayer:talkLanguage(Character.say, Player.german, "Ich bin tot!")
end
