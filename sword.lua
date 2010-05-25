-- include base.common for additional functions
require("base.common")

function UseItem(User,SourceItem,TargetItem,counter,param)
	if(SourceItem.data == 1) then
		User:inform("UseItem");
		--User:setQuestProgress(735,0);
		User:inform("Bin drin2");
			world:erase(SourceItem,1);
		User:inform("End");
	end
end

function UseItemWithField(User,SourceItem,targetpos,counter,param)
	if(SourceItem.data == 1) then
		User:inform("UseItemWithField");
		--world:changeTile(100,targetpos);
		User:inform("End");
	end
end --function

function MoveItemBeforeMove(User,SourceItem,TargetItem)
	if(SourceItem.data == 1) then
        itemloeschen=false;
		if(User:getQuestProgress(735)~=1) then
			base.common.InformNLS(User,
			"Das Ding ist zu uninteressant um es mitzunehmen.",
			"This thing is boring, I don't want to take it.");
			return false
		else
			base.common.InformNLS(User,
			"Das dürfte Arkils Schwert sein. Ich sollte es ihm bringen.",
			"This could be Arkils sword. I should bring it to him it..");
			links=User:getItemAt(CCharacter.left_tool);
			rechts=User:getItemAt(CCharacter.right_tool);
			if (((links.id==0) or (rechts.id==0)) and (SourceItem:getType()==3)) then
				if (rechts.id==0) then
					User:createAtPos(CCharacter.right_tool,SourceItem.id,1);
					local tempItem=User:getItemAt(CCharacter.right_tool);
					tempItem.quality=333;
					tempItem.data=735;
					world:changeItem(tempItem);
				else
					User:createAtPos(CCharacter.left_tool,SourceItem.id,1);
					local tempItem=User:getItemAt(CCharacter.left_tool);
					tempItem.quality=333;
					tempItem.data=735;
					world:changeItem(tempItem);
				end
				itemloeschen=true;
				return true
			else
				if (SourceItem:getType()~=4) then
										base.common.InformNLS(User,
					"Leider habe ich gerade keine Hand frei.",
					"Unfortuntely I have no free hand to take it.");
				end
			end
			return false
		end
	end
	return true;
end

function MoveItemAfterMove(User,SourceItem,TargetItem)
	if (itemloeschen==true) and (SourceItem.data == 1) then
		User:inform("Bin drin2");
		wegdamit(TargetItem);
		itemloeschen=false;
	end
end

function wegdamit(Item)    
    world:erase(Item,1);
end;

function LookAtItem(User,Item)
	if(Item.data == 1) then
	     base.common.InformNLS(User,
        "Ein faszinierendes Ding",
        "A fascinating thing.");
	end
	
end