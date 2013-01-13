require("base.common")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697 ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)
	ScriptVars:set("ArenaListCadomyr", "Hans;543;Peter;321;Wolfgang;987;Klaus;111;Holger;222")
	local splitTable = {}
	if (User.lastSpokenText == "list") then
		getRanklist(User, User, true)
	end
end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end

arenaInformations = {{playerPos=position(10,10,0), monsterPos=position(10,0,0), npcName="Alsaya", town="Cadomyr"}, 
					{playerPos=position(10,10,0), monsterPos=position(10,0,0), npcName="Alsaya", town="Runewick"}, 
					{playerPos=position(10,10,0), monsterPos=position(10,0,0), npcName="Alsaya", town="Galmair"}}

function getRanklist(User, NPC, message)
	local arena = getArena(User, NPC);
	local town = arenaInformations[arena].town;
	local found = false;
	local arenaEntry;
	local arenaList = {};
	local list = "";
	
	for i=1, 5 do -- get the top 5
		found, arenaEntry = ScriptVars:find("ArenaList"..town);
		if found then
			arenaList = split(arenaEntry, ";");
		elseif found == false or table.getn(arenaList) ~= 10 then
			User:inform("[ERROR] An error occured please contact a developer.")
		end
	end
	
	if message then
		local mdList = function(dialog)
			if (not dialog:getSuccess()) then
				return;
			end
		end
		if User:getPlayerLanguage() == 0 then
			for i=1,#(arenaEntry),2 do
				list = list.."Platz "..i.." : "..arenaEntry[i].." mit "..arenaEntry[i+1].." Punkten.\n";
			end
			mdList = MessageDialog("Top fünf Kämpfer des Reiches", list, nil);			
		else
			for i=1, #(arenaEntry),2 do
				list = list.."Place "..i.." : "..arenaEntry[i].." with "..arenaEntry[i+1].." points.\n";
			end
			mdList = MessageDialog("Top five fighters of the realm", list, nil);
		end
		User:requestMessageDialog(mdList);
	else
		return arenaList;
	end
end