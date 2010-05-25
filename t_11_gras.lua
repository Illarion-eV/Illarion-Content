require("base.common")
--Schneball herstellen
--Warum Gras(11) und nicht Schnee(10)???

function useTile(User,Position,counter,param)
	if (world:getField(Position):tile()~=11) then
        return
    end
	if world:getTime("month")<13 then
		return
	end

		User:talkLanguage(CCharacter.say, CPlayer.german, "#me formt einen Schneeball.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me makes a snowball.");

		User:createItem(456,1,333,0)
	
end
