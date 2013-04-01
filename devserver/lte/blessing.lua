module("lte.blessing", package.seeall)
-- Long time Script "Blessing" (25) effectid
-- Triggered by donating money to an altar, and increases attributes temporarily
-- Written by Hadrian (The weird llama person)

    
function addEffect(Blessing, Character)       

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)+1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)+2);
		
    end

function callEffect(Blessing, Character)


	return false;
end

function loadEffect(Blessing, Character)

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)+1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)+2);

end

function removeEffect (Blessing, Character)

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)-1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)-2);

end
