-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")
require("alchemy.base.teacher")
require("alchemy.base.alchemy")

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
    
	
	if (User.lastSpokenText == "inform datas") then
	    TargetItem = base.common.GetFrontItem(User)
		local wirkstoff = alchemy.base.alchemy.wirkstoff
		local stockConc = ""
		for i=1,8 do 
		    local currentSubs = TargetItem:getData(wirkstoff[1].."Concentration")
			if currentSubs == "" then
			    currentSubs = 5
			end	
			stockConc = stockConc..currentSubs
		end
		local essenceHerbs = ""
		for i=1,8 do
		    local currentHerb = TargetItem:getData("essenceHerb"..i)
			if currentHerb ~= "" then
			    essenceHerbs = essenceHerbs.." "..currentHerb
			end
        end			
		local filledWith = TargetItem:getData("filledWith")
		local potionEffectId = TargetItem:getData("potionEffectId")
		local potionQuality = TargetItem:getData("potionQuality")
		
		local callback = function(dialog) end
		local dataText = "stockConc: "..stockConc.."\nessenceHerbs: "..essenceHerbs.."\nfilledWith: "..filledWith.."\neffectId: "..potionEffectId.."\npotionQuality: "..potionQuality
		dialog = MessageDialog("datas", dataText, callback)
		User:requestMessageDialog(dialog)
	else
	alchemy.base.teacher.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    end
	
end