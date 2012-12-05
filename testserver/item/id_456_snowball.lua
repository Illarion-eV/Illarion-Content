-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")
require("alchemy.base.teacher")
require("alchemy.base.alchemy")
require("alchemy.base.brewing")

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

plnt = {};
grnd = {};

function Init()
    
	local gt = base.common.GroundType
	AddPlant(752,{gt.sand,gt.grass});  -- Alraune
	AddPlant(756,{gt.forest,gt.grass});  -- Frommbeere
	AddPlant(757,{gt.forest,gt.grass});  -- Gottesblume
	AddPlant(758,{gt.forest,gt.grass});  -- Herzblut
	AddPlant(764,{gt.forest,gt.grass});  -- Tagteufel
	AddPlant(765,{gt.forest,gt.grass});  -- Tagtraum
	AddPlant(766,{gt.dirt,gt.grass});  -- Trugblüte
	AddPlant(769,{gt.sand,gt.grass});  -- Wüstenbeere

end
function AddPlant(ItemID,Ground)
    if plnt == nil then
	    plnt = {}
	end
	if grnd == nil then
	    grnd = {}
	end	
 	
	table.insert(plnt,ItemID);
    table.insert(grnd,Ground);
end

function plantdrop(User)
   
   local herbCounter = 0 -- for testing
	for i=1,30 do
	    
		local rndValue = math.random(1,#plnt)
		local myPlant = plnt[rndValue]
	    local myGrndsList = grnd[rndValue]
		local myPos = position( math.random(0,1024), math.random(0,1024), 0 )
		local theTile=world:getField(myPos);
		local groundType = base.common.GetGroundType( theTile:tile() )
		
		local success = false
		for i=1,#myGrndsList do
		    if groundType == myGrndsList[i] then
			    success = true
			end
        end			
		
		if success then
		    world:createItemFromId(myPlant,1,myPos,false,333,nil)
			herbCounter = herbCounter + 1
		end
    end
	ScriptVars:set("gaiatest_var_by_merung", tostring(herbCounter))
	ScriptVars:save()
end


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    if (User.lastSpokenText == "doGaia") then
	    plantdrop(User)
	    return
	end	
	
	if (User.lastSpokenText == "gaiaResult") then
	    local foundGaia, gaia = ScriptVars:find("gaiatest_var_by_merung")
		if not foundGaia then -- security check
			gaia = 0
		else
			gaia = tonumber(gaia)
		end	
		User:inform("gaia: "..gaia)
		return
	end	
	
	if (User.lastSpokenText == "data1") then 
	    SourceItem:setData("msg","hello")
		SourceItem:setData("msg","goodbye")
		return
	end
	if (User.lastSpokenText == "data2") then
	    User:inform(""..SourceItem:getData("msg"))
		return
	end	
	
	if (User.lastSpokenText == "hand") then 
	    local myItem = User:getItemAt(5)
		alchemy.base.brewing.UseItem( User, myItem, TargetItem, Counter, Param, ltstate )
	    return
	end	
	
	if (User.lastSpokenText == "inform datas") then
	    TargetItem = base.common.GetFrontItem(User)
		local wirkstoff = alchemy.base.alchemy.wirkstoff
		local stockConc = ""
		if TargetItem.id == 331 or TargetItem.id == 1012 then	
			for i=1,8 do 
				local currentSubs = TargetItem:getData(wirkstoff[i].."Concentration")
				if currentSubs == "" then
					currentSubs = 5
				end	
				stockConc = stockConc..currentSubs
			end
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
		local potionQuality = ""
		if TargetItem.id < 1008 and TargetItem.id ~= 331 then -- not a cauldron, but a potion
		    potionQuality = TargetItem.quality
		else	
		    if TargetItem:getData("filledWith") == "potion" then 
			    potionQuality = TargetItem:getData("potionQuality")
			end	
		end	
		
		local callback = function(dialog) end
		local dataText = "stockConc: "..stockConc.."\nessenceHerbs: "..essenceHerbs.."\nfilledWith: "..filledWith.."\neffectId: "..potionEffectId.."\npotionQuality: "..potionQuality
		dialog = MessageDialog("datas", dataText, callback)
		User:requestMessageDialog(dialog)
	else
	alchemy.base.teacher.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    end
	
end