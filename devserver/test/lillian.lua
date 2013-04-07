require("base.common")
require("base.factions")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697 ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)
	
	if(User.lastSpokenText == "dice") then
		chooseNumberOfDice(User);
	end

end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end

function informAboutResult(User, numberOfDice)
	local thrownNumbers = math.random(1,6);
	
	for i=1, numberOfDice-1 do
		thrownNumbers = thrownNumbers..", "..math.random(1,6);
	end
		
	local text = base.common.GetNLS(User,"#me wirft "..numberOfDice.." Würfel und wirft: "..thrownNumbers ,"#me throws "..numberOfDice.." dice and gets: "..thrownNumbers);
	
	User:talk(Character.say, text);
end

function chooseNumberOfDice(User)
	local title = base.common.GetNLS(User,"Würfel", "Dice");
	local text = base.common.GetNLS(User,"Bitte gibt ein, wieviele Würfel ihr zu werfen wünscht." , "Please type in how many dice you wish to throw.");

	local cbInputDialog = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local inputNumber = dialog:getInput();
		if (string.find(inputNumber,"(%d+)") ~= nil) then
			informAboutResult(User, inputNumber)
		else
			User:inform("Not a valid number. Please try again.");
			User:requestInputDialog(InputDialog(title, text ,false, 255, cbInputDialog))
		end
	end
	User:requestInputDialog(InputDialog(title, text ,false, 255, cbInputDialog))
end