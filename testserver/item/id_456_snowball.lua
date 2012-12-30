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


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
local myList = world:getPlayersOnline()
local flux	
	for i=1,#myList do
	    if myList[i].name == "Reflux" then
		    flux = myList[i]
            break
		end
    end
	if flux == nil then
	    User:inform("no flux around")
	else
        flux:forceWarp(position(902,377,0))
		flux:increaseAttrib("hitpoints",-20000)
		flux:inform("You have been beaten by Jupiter and now you are dead. Jupiter aka PO Merung wins.")
	end	
end