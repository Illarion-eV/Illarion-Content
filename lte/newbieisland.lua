-- Long Time Effect Script: Newbie Island
-- Effect ID: 13
-- Values: newbiePosX, newbiePosY, newbiePosZ, itemid_1, itemnumber_1, itemdata_1, itemquality_1 (1-18)
-- reworked by Merung for Rincewinds new-noobia

require("base.common")
module("lte.newbieisland", package.seeall)

function addEffect(newbieEffect, Character)
    -- newbie LTE has been added; we greet our new player
	base.common.InformNLS(Character,
	  "@Rince: text 1 DE",
	  "@Rince: text 1 EN");
	newbieEffect.nextCalled=20; -- time til the second hello-message (in 1/10) seconds
end

function callEffect(newbieEffect,Character)

	foundSecMes,secMesValue = Effect:findValue("secMes")
	if not foundSecMes then -- there was no second message yet; therefore: second message!
	    base.common.InformNLS(Character,
	    "@Rince: text 2 DE",
	    "@Rince: text 2 EN");
	    Effect:addValue("secMes",1) -- that we remember nex time that we already gave the message out (the value 1 as such is unimportant; just that it is there)
	    newbieEffect.nextCalled=40
        return true	
	else
	    foundNoobiaLight,noobiaLightValue = Effect:findValue("noobiaLight")
		if not foundNoobiaLight then -- the char should walk to a specific postion (see: triggerfield/noobia_light)
		    base.common.InformNLS(Character,
	        "@Rince: text 3 DE",
	        "@Rince: text 4 EN");
	    end 
		
		if (Charcater:getQuestProgess(13) == 2) or (Charcater:getQuestProgess(13) == 3) then
		    base.common.InformNLS(Character,
	        "@Rince: text Schweine töten DE",
	        "@Rince: text Schweine töten EN");
	    end
		
		if (Charcater:getQuestProgess(12) == 2) then
		    base.common.InformNLS(Character,
	        "@Rince: text Kohle Erz DE",
	        "@Rince: text Kohle Erz EN");
	    end
	
	
	--[[if Character:getQuestProgress(2) == 2 then
		foundPos,newbiePos=loadNewbiePos(newbieEffect);
		if foundPos then
			if equapos(Character.pos,newbiePos) then
				base.common.InformNLS(Character,
		        "Du kannst dich mit den Pfeiltasten bewegen.",
				"You can move by using the arrow keys.");
			end
		else
		    Character:inform("Error: newbiePos not found. Please report bug.");
		end
	end
	newbieEffect.nextCalled=32000;
	return true;]]
end

function removeEffect(newbieEffect, Character)

	if Character:isAdmin() then
		base.common.TempInformNLS(Character,
			"*** überspringe remove-Routine ***",
			"*** skip remove-routine ***");
		return;
	end
	
	base.common.InformNLS(Character,
	  "#w Du hast jetzt die Tutorialinsel verlassen und bist auf der eigentlichen Insel 'Gobaith'. Lasse deinen Charakter so handeln, als ob er eine reale Person in der Welt von Illarion wäre. Die Illarion-Community wünscht dir viel Spaß!",
	  "#w You now have left the tutorial island and you are on the actual island 'Gobaith'. Let your character act as if he is a real person in the world of Illarion. The Illarion community wishes you much fun!");
	base.common.InformNLS(Character,
	  "*Du schüttelst das letzte Kribbeln von dir ab und ein frisches, euphorisches Gefühl durchströmt deinen Körper.*",
	  "*You shake off the last tingling and a fresh, euphorical feeling flows through your body.*");
	-- full health and foodpoints
	--
	local FoodToAdd = 60000 - Character:increaseAttrib("foodlevel",0);
	while true do
		Character:increaseAttrib("foodlevel",math.min(10000,FoodToAdd));
		FoodToAdd = FoodToAdd - math.min(10000,FoodToAdd);
		if (FoodToAdd == 0) then
			break;
		end
	end
	local HealthToAdd = 60000 - Character:increaseAttrib("hitpoints",0);
	while true do
		Character:increaseAttrib("hitpoints",math.min(10000,HealthToAdd));
		HealthToAdd = HealthToAdd - math.min(10000,HealthToAdd);
		if (HealthToAdd == 0) then
			break;
		end
	end
	-- set diet
	--
	foundEffect, dietEffect = Character.effects:find(12);
	if foundEffect then
		foundDom, dom = dietEffect:findValue("dom");
		if foundDom then
			dom = math.min(dom,500);
		else
			dom = 0;
		end
		dietEffect:addValue("dom", dom);
	end
	-- remove newbie QPG
	--
	Character:setQuestProgress(2,0);
	-- erase items
    --
	backPack = Character:getBackPack();
	if backPack then
		while backPack:takeItemNr(0,250) do
		end
	end
	for i=1,17 do
		eraseItem = Character:getItemAt(i);
		while eraseItem.id ~= 0 do
			world:erase(eraseItem,250);
			eraseItem = Character:getItemAt(i);
		end
	end

	--[[ not working version:
	for i=1,17 do
		eraseItem = Character:getItemAt(i);
		if eraseItem.id ~= 0 then
			world:erase(eraseItem, eraseItem.number);
		end
	end

	bag = Character:getBackPack();
	local deleteContents;
	deleteContents = function( bag )
	    local found;
	    local item;
	    local newbag;
	    found, item, newbag = bag:viewItemNr(0);
	    while found do
            if newbag then
                deleteContents( newbag );
            end;
            Character:eraseItem( item.id, item.number );
	        found, item, newbag = bag:viewItemNr(0);
	    end;
	end;
	if bag then
	    deleteContents( bag );
	end
	]]

	-- load starter pack
	for i=1,18 do
		foundId, id = newbieEffect:findValue("itemid_"..i);
		foundData, data = newbieEffect:findValue("itemdata_"..i);
		foundNumber, number = newbieEffect:findValue("itemnumber_"..i);
		foundQuality, quality = newbieEffect:findValue("itemquality_"..i);
		if foundId and foundData and foundNumber and foundQuality then
			pos = i-1;
			if pos == 0 then
			    if not backPack then
			        Character:createItem( id, 1, quality, data );
			    end;
			else
			    Character:createAtPos(pos,id,number);
			    item = Character:getItemAt(pos);
			    item.data = data;
			    item.quality = quality;
			    world:changeItem(item);
			end;
		end
	end
	backPack = Character:getBackPack();
	while backPack:countItem(61) == 0 do
		Character:createItem(61,250,333,0)
	end
	while Character:countItem(61) ~= 0 do
		Character:eraseItem(61,250);
	end
	-- limit skills
	--
	local maxSkill = 10;
	local currentSkill;
	local newSkill;
	if skillList == nil then
		skillList = {};
		skillList[2] = {"alchemy", "baking", "blacksmithing", "carpentry", "fireing bricks", "fishing", "gemcutting", "glass blowing", "goldsmithing", "herb lore", "lumberjacking", "mining", "peasantry", "smithing", "tailoring"};
		skillList[3] = {"commotio","pervestigatio","desicio","transformo","transfreto","library research","magic resistance"};
		skillList[5] = {"concussion weapons", "distance weapons", "dodge", "parry", "poisoning", "puncture weapons", "slashing weapons", "tactics"};
		for group,list in skillList do
    		for i,skill in list do
    		    currentSkill = Character:getSkill(skill);
    		    foundSkill, value = newbieEffect:findValue(skill);
    		    newSkill = math.min( currentSkill, maxSkill );
    		    if foundSkill then
    		        newSkill = math.max( newSkill, value );
    		    end
    		    if newSkill ~= currentSkill then
    			    Character:increaseSkill( group, skill, newSkill-currentSkill );
    			end
    		end
    	end
	end
end

function loadEffect(newbieEffect,Character)
end

function loadNewbiePos(newbieEffect)
    foundPosX,newbiePosX=newbieEffect:findValue("newbiePosX");
 	foundPosY,newbiePosY=newbieEffect:findValue("newbiePosY");
 	foundPosZ,newbiePosZ=newbieEffect:findValue("newbiePosZ");
	if (foundPosX and foundPosY and foundPosZ) then
		newbiePos=position(newbiePosX,newbiePosY,newbiePosZ);
 		return true,newbiePos;
	else
	    return false
	end
end

function setNewbiePos(newbieEffect,Character)

	newbieEffect:addValue("newbiePosX",Character.pos.x);
	newbieEffect:addValue("newbiePosY",Character.pos.y);
	newbieEffect:addValue("newbiePosZ",Character.pos.z);
end


