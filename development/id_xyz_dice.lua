-- UPDATE common SET com_script = 'item.id_xyz_dice' WHERE com_itemid = xyz ;

require("base.common")

module("item.id_xyz_dice", package.seeall);

function UseItem(User, SourceItem, ltstate)
	local typeOfDice = chooseTypeOfDice(User)
	chooseNumberOfDice(User, typeOfDice);
end

function informAboutResult(User, typeOfDice, numberOfDice)
	local thrownNumbers = math.random(1,typeOfDice);
	
	for i=1, numberOfDice-1 do
		thrownNumbers = thrownNumbers..", "..math.random(1,typeOfDice);
	end
	
	local playerInRange = world:getPlayersInRangeOf(User.pos, 3);
	for _,player in pairs(playerInRange) do 
		player:inform(User.name.." wirft "..numberOfDice.." Würfel und bekommt: "..thrownNumbers ,User.name.." throws "..numberOfDice.." dice and gets: "..thrownNumbers);		
	end
		
end

function chooseNumberOfDice(User, typeOfDice)
	local title = base.common.GetNLS(User,"Würfel", "Dice");
	local text = base.common.GetNLS(User,"Bitte gib ein, wieviele Würfel du werfen möchtest." , "Please type in how many dice you wish to throw.");

	local cbInputDialog = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local inputNumber = dialog:getInput();
		if (string.find(inputNumber,"(%d+)") ~= nil) then
			if inputNumber < 7 then 
				informAboutResult(User, typeOfDice, inputNumber)
			else
				User:inform("Du kannst nur bis zu 6 Würfel werfen.", "You can only trow up to 6 dice.")
				User:requestInputDialog(InputDialog(title, text ,false, 255, cbInputDialog))
			end
		else
			User:inform("Not a valid number. Please try again.");
			User:requestInputDialog(InputDialog(title, text ,false, 255, cbInputDialog))
		end
	end
	User:requestInputDialog(InputDialog(title, text ,false, 255, cbInputDialog))
end

function chooseTypeOfDice(User)
	local title = base.common.GetNLS(User,"Würfel", "Dice");
	local text = base.common.GetNLS(User,"Bitte wähle aus, welche Art Würfel du werfen möchtest." , "Please choose what type of dice you wish to throw.");
	
	local sdDice = function(dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local selected = dialog:getSelectedIndex();
		if selected == 0 then
			return 6;
		else
			return 20;
		end
	end
	local dialog = SelectionDialog(title, text, sdDice)

	dialog:addOption(0, base.common.GetNLS(User, "W6 - Sechskantiger Würfel", "D6 - Sixsided dice"))
	dialog:addOption(0, base.common.GetNLS(User, "W20 - Zwanzigkantiger Würfel", "D20 - Twentysided dice"))
	
	User:requestSelectionDialog(dialog)
end