--Written by Llama as initiator of love letter quest - 

-- INSERT INTO triggerfields VALUES(-469,241,0,'loveLetter.lua');

module("triggerfield.loveLetter",package.seal)

function MoveToField(User)

if ((User:getQuestProgress(135) == 1) and (User:increaseAttrib("Perception",0 < 10))) then
	-- The character is perceptive enough to notice the love letters, and has not yet noticed them

	
	setQuestProgess(135,2);
	if (User:getPlayerLanguage()==0) then
	User.inform("[GERMAN]");
	else
	User.inform("You notice love letters hidden underneath the pillow, they are addressed to ''S'' from Karlson");
	end
	--User may now speak to Karlson to continue the quest
elseif (User:increaseAttrib("Perception",0 < 10)) then
	-- Character has seen the letters already 
	
	if (User:getPlayerLanguage()==0) then
	User.inform("[German]");
	else
	User.inform("You see Karlson's love letters still hidden underneath the pillow");
	end
end

end
