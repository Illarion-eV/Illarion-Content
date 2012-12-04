require("base.common")

-- UPDATE common SET com_script='item.id_3105_bookrest' WHERE com_itemid = 3105;

module("item.id_3105_bookrest", package.seeall)

function LookAtItem(User,Item)
	if (Item.data == 666) then
	    if (Item.pos.z == -6) then
	        if (User:getPlayerLanguage()==0) then
	            world:itemInform(User,Item,"Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der smaragdfarbene Schrift eingelassen ist");
	        else
	            world:itemInform(User,Item,"stone socket decorated with arcane symbols, on which you can see a stony scroll with emerald colored letters");
	        end
		elseif (Item.pos.z == 1) then
	        if (User:getPlayerLanguage()==0) then
	            world:itemInform(User,Item,"Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der rubinfarbene Schrift eingelassen ist");
			else
	            world:itemInform(User,Item,"stone socket decorated with arcane symbols, on which you can see a stony scroll with ruby colored letters");
	        end
		elseif (Item.pos.z == 3) then
	        if (User:getPlayerLanguage()==0) then
	            world:itemInform(User,Item,"Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der amethystfarbene Schrift eingelassen ist");
	        else
	            world:itemInform(User,Item,"stone socket decorated with arcane symbols, on which you can see a stony scroll with amethyst colored letters");
	        end
		elseif (Item.pos.z == 0) then
	        if (User:getPlayerLanguage()==0) then
	            world:itemInform(User,Item,"Mit arkanen Symbolen verzierter Steinsockel, auf dem eine steinernde Schriftrolle liegt, in der saphirfarbene Schrift eingelassen wurde");
	        else
	            world:itemInform(User,Item,"stone socket decorated with arcane symbols, on which you can see a stony scroll with sapphire colored letters");
	        end
	    else
	        world:itemInform(User,Item,world:getItemName(Item.id,User:getPlayerLanguage()));
	    end
	end
end

function UseItem(User,SourceItem,TargetItem,counter,param)
	if (SourceItem.data == 666) then
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
end
