-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")

module("item.id_456_snowball", package.seeall)

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if Round==nil then
		Round=1;
	end
	if Round==1 then
        User:talkLanguage(Character.say,Player.german,"#me wirft einen Schneeball.");
        User:talkLanguage(Character.say,Player.english,"#me throws a snowball.");
		Round=2;
	else
		Round=nil;
	end
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	-- merung's test land -- 
	local myValue
	local myValue1
	local myValue2
	local myInform = ""
	local myCounter
	local erwart
	local std; local a; local b
	if (string.find(User.lastSpokenText,"vert")~=nil) then
		a,b,erwart,std = string.find(User.lastSpokenText,"(%d+) (%d+)")
		std = tonumber(std)
		erwart = tonumber(erwart)
		for i=1,100 do
		    myValue =Random.normal(erwart,std)
			myValue = math.floor((myValue + 0.5))
			myInform = myInform.." "..myValue
		end	
		User:inform(myInform)
    end
end	