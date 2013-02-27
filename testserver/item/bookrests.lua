require("base.common")

-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3104;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3105;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3106;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3107;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3108;

module("item.bookrests", package.seeall)

function LookAtItem(User,Item)
	
	local lookAt 
	-- Bookrest for the Salavesh dungeon!
    if (Item.pos == position(741,406,-3)) then
	    lookAt = SalaveshLookAt(User, Item)
	end
	-- Salavesh end
	
	-- what is this? I don't know! I will keep that for now.
	if (tonumber(Item:getData("bookrestData")) == 666) then
		local lookAt = FoobarLookAt(User, Item)
	end
	-- strange stuff end
	
	-- static teleporter
	    if SourceItem:getData("staticTeleporter") ~= "" then
			StaticTeleporterLookAt(User, Item)
		end
	-- teleporter end
	
	if lookAt then
	    world:itemInform(player, item, lookAt)
	else
	    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
	end	
end

function StaticTeleporterLookAt(User, Item)
	
	local lookAt = ItemLookAt();
	lookAt.name = "Teleporter";
	return lookAt
end

function SalaveshLookAt(User, Item)
    
	local lookAt = ItemLookAt();
	lookAt.rareness = ItemLookAt.rareItem;
		
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Tagebuch des Abtes Elzechiel";
		lookAt.description = "Dieses Buch ist von einer schaurigen Schönheit. Du bist versucht, es dennoch zu lesen..."
	else
		lookAt.name = "Journal of Abbot Elzechiel";
		lookAt.description = "This item has an evil presence. You are tempted to read it, though..."
	end
	return lookAt
end

-- strange stuff. no idea
function FoobarLookAt(User, Item)
    
	local lookAt = ItemLookAt();
	
    if (Item.pos.z == -6) then
		if (User:getPlayerLanguage()==0) then
			lookAt.description = "Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der smaragdfarbene Schrift eingelassen ist"
		else
			lookAt.description = "Stone socket decorated with arcane symbols, on which you can see a stony scroll with emerald colored letters"
		end
	elseif (Item.pos.z == 1) then
		if (User:getPlayerLanguage()==0) then
			lookAt.description = "Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der rubinfarbene Schrift eingelassen ist"
		else
			lookAt.description = "Stone socket decorated with arcane symbols, on which you can see a stony scroll with ruby colored letters"
		end
	elseif (Item.pos.z == 3) then
		if (User:getPlayerLanguage()==0) then
			lookAt.description = "Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der amethystfarbene Schrift eingelassen ist"
		else
			lookAt.description = "Stone socket decorated with arcane symbols, on which you can see a stony scroll with amethyst colored letters"
		end
	elseif (Item.pos.z == 0) then
		if (User:getPlayerLanguage()==0) then
			lookAt.description = "Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der saphirfarbene Schrift eingelassen wurde"
		else
			lookAt.description = "Stone socket decorated with arcane symbols, on which you can see a stony scroll with sapphire colored letters"
		end
	end
	return lookAt
end

function UseItem(User, SourceItem)
    -- Bookrest for the Salavesh dungeon!
    if (SourceItem.pos == position(741,406,-3)) then
	    User:sendBook(201);
	end
	-- Salavesh end
	
	-- what is this? I don't know! I will keep that for now.
	if (tonumber(SourceItem:getData("bookrestData")) == 666) then
		Foobar(User, SourceItem)
	end
	-- strange stuff end
	
	if SourceItem:getData("staticTeleporter") ~= "" then
	    StaticTeleporter(User, SourceItem)
	end
end

function StaticTeleporter(User, SourceItem)

    local names
	if  User:getPlayerLanguage() == Player.german then
		names = {"Runewick","Galmair","Cadomyr","Hanfschlinge"}
	else
		names = {"Runewick","Galmair","Cadomyr","Necktie"}
	end
	local items = {105,61,2701,1909}
	local targetPos = {position(788,826,0), position(424,245,0),position(127,647,0),position(684,307,0)}
	
	local callback = function(dialog)
	
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,1000) then
				
				if (targetPos[selected+1].x - SourceItem.pos.x) * (targetPos[selected+1].x - SourceItem.pos.x) < 10 then
					User:inform("Ihr befindet euch bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else
				
					User:inform("Ihr habt euch dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
					base.money.TakeMoneyFromChar(User,1000)
					world:gfx(45,User.pos)
					world:makeSound(13,User.pos);
						
						
					User:warp(targetPos[selected+1])
					world:gfx(46,User.pos)
					world:makeSound(4,User.pos);
				end
			else
				User:inform("Ihr habt nicht genug Geld für diese Reise. Die Reise kostet zehn Silberstücke.", "You don't have enough money for this journey. The journey costs ten silver coins.")
			end
		
		end
	end
		
	local dialog
	if User:getPlayerLanguage() == Player.german then
			dialog = SelectionDialog("Teleporter", "Eine Reise kostet zehn Silberstücke. Wähle eine Ziel aus.", callback)
	else
		dialog = SelectionDialog("Teleporter", "A journey costs ten silver coins. Choose a destination.", callback)
	end
	
	for i=1,#items do
		dialog:addOption(items[i], names[i])
	end
	User:requestSelectionDialog(dialog)
end

-- no idea where that is used.
function Foobar(User, SourceItem) 
    if (User:getSkill(Character.ancientLanguage) > 59) then
		if (SourceItem.pos.z == -6) then
			if (User:getPlayerLanguage()==0) then
				User:inform("In deinen Händen, Suchender, hälst du die erste Weisheit. Fest und beständig wie die Erde ist auch die Weisheit. Alles Leben entspringt ihr und alles Leben kehrt zu ihr zurück.");
				User:inform("Um die zweite Weisheit zu finden sucht sie beim alten Heiligtum Bragons und ihr werdet ihn finden am Fuße seiner hellsten Flamme.");
			else
				User:inform("In your hands, seeker, you hold the first wisdom. Solid and steady like the earth the wisdom is. All life arises from it and all life ends in it.");
				User:inform("To search the second truth, search by the old sanctuary of Bragon and you will find it at the foot of his brightest flame.");
			end
		elseif (SourceItem.pos.z == 1) then
			if (User:getPlayerLanguage()==0) then
				User:inform("In deinen Händen, Suchender, hälst du die zweite Weisheit. Unerbittlich und reinigend wie das Feuer ist auch die Weisheit. Wahre Weisheit brennt sich in unser Herz und schenkt uns Licht an dunklen Orten.");
				User:inform("Die dritte Weisheit findet ihr in Findaris Umarmung über der tanzenden Ebene wo die Winde singen und die Berge uralte Geschichten flüstern.");
			else
				User:inform("In your hands, seeker, you hold the second wisdom. Inexorable and cleaning like the fire the wisdom is. True wisoms burns his way into our hearts and gives us light on dark places.");
				User:inform("The third wisdom you can find in Firanis hug over the dancing plane, where the winds sings and the mountains whispers ancient tales.");
			end
		elseif (SourceItem.pos.z == 3) then
			if (User:getPlayerLanguage()==0) then
				User:inform("In deinen Händen, Suchender, hälst du die dritte Weisheit. Wie wir die Luft zum Atmen brauchen, so ist auch die Weisheit ein unersetzliches Gut. Endlos singt sie uns ihr Lied.");
				User:inform("Um die vierte Weisheit zu finden folgt den schmalen Pfaden durch Tanoras Reich. Ihr werdet sie finden umgeben von dem ewigen Lauf des Wassers.");
			else
				User:inform("In your hands, seeker, you hold the third wisdom. Like the air, we need to breath the wisdom is a irreplaceable thing in our life. Endless they sing us their song.");
				User:inform("To find the fourth wisdom follow the narrow paths through Tanoras realm. You will find it surrounded by the eternal flow of water.");
			end
		elseif (SourceItem.pos.z == 0) then
			if (User:getPlayerLanguage()==0) then
				User:inform("In deinen Händen, Suchender, hälst du die vierte Wahrheit. Rein und klar wie auch das Wasser ist sie für jene, die es wagen hineinzublicken. Ruhe bringt sie dem aufgewühlten Geist.");
				User:inform("Die fünfte Weiheit kann nur finden, wer sie in sich selbst findet. Wer geschickt die vier in Wort verbindet, dem wird sich der Weg zu wahrer Weisheit öffnen.");
			else
				User:inform("In your hands, seeker, you hold the fourth wisdom. Pure and clear like the water is the wisdom for those, who have the bravery to see through the fog. Calmness for the troubled mind.");
				User:inform("The fifth truth can only be find who finds it in themself. Who connects cleverly the four in word, to that the way will open the real truth.");
			end
		end
	else
		if (User:getPlayerLanguage()==0) then
			User:inform("#w Du kannst die arkanen Schriftzeichen auf der Rolle nicht entziffern.");
		else
			User:inform("#w You are not able to encrypt the arcane letters on the scroll.");
		end
	end
end