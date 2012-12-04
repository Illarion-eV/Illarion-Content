module("lte.irmorom_bless", package.seeall)
-- Long time Script "Irmorom Bless" (25) effectid
-- Triggered by donating money to an altar, and increases perc by 2 and dex by one
-- Written by Hadrian (The weird llama person)

    
function addEffect(IrmoromBlessing, Character)       

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)+1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)+2);
	IrmoromBlessing.nextCalled = 6000;
	
    end

function callEffect(IrmoromBlessing, Character)


	return false;
end

function loadEffect(IrmoromBlessing, Character)

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)+1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)+2);

end

function removeEffect (IrmoromBlessing, Character)

	Character:setAttrib("dexterity",Character:increaseAttrib("dexterity",0)-1);
	Character:setAttrib("perception",Character:increaseAttrib("perception",0)-2);

end
