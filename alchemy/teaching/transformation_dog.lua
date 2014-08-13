--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]

require("base.common")
require("alchemy.base.alchemy")
require("monster.base.base")
require("triggerfield.potionToTeacher")

module("alchemy.teaching.transformation_dog", package.seeall)

-- This script handles the teaching of the dog transformation potion.

TO_GRAVE = "TO_GRAVE"
GO_BACK = "GO_BACK"

DOG_STATUS = false
DOG_ID = false

function LookAtGrave(User,Item)
	local graveInscription = base.common.GetNLS(User, "~Hier ruht Tavalion. Weiser Druide und größter Freund der Tiere.~", "~Here rests Tavalion. A wise druid and the greatest friend of the dogs.~")
	
	if not alchemy.base.alchemy.CheckIfAlchemist(User) then
		graveInscription = graveInscription .. base.common.GetNLS(User, " Ein seltsames, unkenntliches Symbol befindet sich unter der Inschrift.", " A strange, unrecognizeable symbol can be seen below the inscription.")
	else
		if not CorrectSightingPotion(User) then
			graveInscription = graveInscription .. base.common.GetNLS(User, " Ein seltsames, unkenntliches Symbol befindet sich unter der Inschrift. Während du es betrachtest, nimmt es langsam die Gestalt einer Hand an.", " Below the inscription, you see a strange symbole. As you look at it, it forms into the shape of a hand.")
		else
			graveInscription = graveInscription .. base.common.GetNLS(User, " Ein Pfotenabdruck ist unter der Inschrift zu sehen.", " Below the inscription, one can see a pawprint.")
		end
	end
	
	local lookat = base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
	lookat.description = graveInscription
	return lookat
end

LAST_TIME = 0

function UseGrave(User, SourceItem)
	if not alchemy.base.alchemy.CheckIfAlchemist(User) then
		User:setMagicType(3)
	end
	
	if alchemy.base.alchemy.CheckIfAlchemist(User) then
		if DOG_STATUS ~= false or User:getQuestProgress(862) ~= 0 or world:getTime("unix") - LAST_TIME < 120 then 
			return
		end
		
		if CorrectSightingPotion(User) then
			ApperanceOfDog(User)
		else
			TellSightingPotionRecipe(User)
		end
	end

end

function UseSealedScroll(User, SourceItem)
	
	if not alchemy.base.alchemy.CheckIfAlchemist(User) or tonumber(SourceItem:getData("learnerId")) ~= User.id then
		User:inform("Es gelingt dir nicht, das Siegel zu brechen.","You seem unable to break the seal.")
		return
	end
	
	User:inform("Du brichst das Siegel der Schriftrolle und als du den Inhalt liest, erlangst du die Erkenntnis: Dir ist klar, wie der Verwandlungstrank Hund herzustellen ist.","You break the seal of the scroll and as you read the content, you gain the knowledge: You know how to create the shape shifter potion dog.")
	SourceItem.id = 3109
	world:changeItem(SourceItem)
	User:setQuestProgress(560,1)
	triggerfield.potionToTeacher.TellRecipe(User, 560)
	
end

function CorrectSightingPotion(User)

	local foundEffect, myEffect = User.effects:find(59);
	if foundEffect then
		local findsight, sightpotion = myEffect:findValue("sightpotion")
		if findsight then
			if sightpotion == User:getQuestProgress(861) then
				return true
			end
		end
	end
	
	return false
	
end

function TellSightingPotionRecipe(User)

	local callback = function(dialog) end
	local stockDe, stockEn = GenerateStockDescription(User)
	
	local textDe = "Du glaubst eine Stimme in den Blättern des Naldorbaumes, der hinter dem Grab steht zu hören. Sie flüstert dir zu: 'Willst du auf vier Pfoten gehen lernen, lerne zu erst das Sehen. Ein Sichtungstrank wird dir helfen. So verbinde das folgende: Rubinstaubessenzgebräu, beinhaltend Wutbeere, Wutbeere, Regenkraut, Tagtraum, Fliegenpilz, mit einem Sud, beinhalten "..stockDe.." .' Die Stimme verschwindet und du glaubst in der Ferne ein Bellen zu hören."
	local textEn = "It seems to you that there is a voice coming from the leaves of the tree behind the grave. It whispers to you: 'If you want to learn two walk on four paws, learn to see. A sighting potion will help you. So, combine a ruby essence brew, containing anger berry, anger berry, rain weed, daydream, toadstool, and a stock, containing "..stockEn.." .' The voice disappears and you believe to hear a bark in the distance."
	
	if User:getPlayerLanguage() == 0 then
	    dialog = MessageDialog("Eine Stimme in den Blättern", textDe, callback)
	else
      	dialog = MessageDialog("A voice in the leaves", textEn, callback)
	end
    User:requestMessageDialog(dialog)
	
end

function GenerateStockConcentration()

	local stockList = {1,1,1,1,1,1,1,1}
	local add = 42
	if Random.uniform(1,2)==1 then
		add = 22
	end

    while add > 0 do
	    local check = false
		while check == false do
			local rnd = Random.uniform(1,8)
			if stockList[rnd] < 9 then
				stockList[rnd] = stockList[rnd]+1
				add = add - 1
				check = true
			end
		end
	end
	return stockList
end

function GetStockFromQueststatus(User)

	if User:getQuestProgress(861) == 0 then
		local stockList
		stockList = GenerateStockConcentration()
		User:setQuestProgress(861,alchemy.base.alchemy.DataListToNumber(stockList))
	end
	return alchemy.base.alchemy.SplitData(User,User:getQuestProgress(861))
end

function GenerateStockDescription(User)

	local stockList = GetStockFromQueststatus(User)
	local de = ""
	local en = ""
	for i=1,#stockList do
		de = de .. alchemy.base.alchemy.wirkung_de[stockList[i]] .. " "..alchemy.base.alchemy.wirkstoff[i]
		en = en .. alchemy.base.alchemy.wirkung_en[stockList[i]] .. " "..alchemy.base.alchemy.wirkstoff[i]
		if i ~= 8 then
			de = de .. ", "
			en = en .. ", "
		end
	end
	return de, en
end

LEARNER_ID = false

function ApperanceOfDog(User)

	User:inform("Als du die Pfote berührst, hörst du ein Rascheln und Bellen.","As you touch the paw, you hear a rustling and a bark.")
	local theDog = world:createMonster(584,position(931,933,0),0)
	theDog:talk(Character.say, "#me kommt aus dem Unterholz getrottet. In seiner Schnauze hält er ein großes Donfblatt. Langsam tapst her zum Grab herüber.",
	"#me ambles slowly out from the brushwood. It carries a donf blade in its muzzle. Slowly, it walks towards the grave.")
	theDog.movepoints = theDog.movepoints - 50
	theDog.waypoints:addWaypoint(position(925,941,0))
	DOG_STATUS = TO_GRAVE
	DOG_ID = theDog.id
	LEARNER_ID = User.id
	monster.base.base.setUnattackability(theDog,"Du kannst dich nicht überwinden den Hund anzugreifen. Irgendwas lässt deine Hände im letzten Moment erstarren.", "You cannot convince yourself to attack the dog. In the last moment, your hands stop listen to you.")
	monster.base.base.setNoDrop(theDog)
	User:setQuestProgress(862,1)
	theDog:setOnRoute(true)
	
end

function DogTransformationAbortRoute(dog)

	if DOG_STATUS == TO_GRAVE then
		dog:talk(Character.say, "#me legt ein großes Donfblatt vor dem Grab ab. Kurz bellt er, bevor er wieder davon geht.",
		"#me drops a big donf blade infront of the grave. He woofs shortly before he walks back.")
		
		local positionX, positionY
		while not positionX do
			local checkPosition = position(Random.uniform(822,873),Random.uniform(765,799),0)
			if (not world:isItemOnField(checkPosition)) and (not world:isCharacterOnField(checkPosition)) then
				positionX = checkPosition.x
				positionY = checkPosition.y
				break
			end
		end
		
		local donfblade = world:createItemFromId(140, 1, position(924,940,0), true, 333, {teachDogTransformationPotion="true",learnerId=LEARNER_ID, MapPosX=positionX,MapPosY=positionY,MapPosZ=0,nameEn="Big donf blade",nameDe="Großes Donfblatt"})
		donfblade.wear = 200
		world:changeItem(donfblade)
		if dog.pos ~= position(925,941,0) then
			WARP = position(dog.pos.x,dog.pos.y,dog.pos.z)
			dog.waypoints:addWaypoint(position(925,941,0))
			dog:forceWarp(position(925,941,0))
			dog:setOnRoute(true)
		else
			dog.waypoints:addWaypoint(position(931,933,0))
			dog.movepoints = -50
			LEARNER_ID = false
			dog:setOnRoute(true)
		end
		DOG_STATUS = GO_BACK
		
	elseif DOG_STATUS == GO_BACK then
	
		if WARP then
			dog:forceWarp(WARP)
			dog.movepoints = -50
			dog.waypoints:addWaypoint(position(931,933,0))
			LEARNER_ID = false
			dog:setOnRoute(true)
		else
			dog:talk(Character.say, "#me verschwindet im Unterholz.",
			"#me disappears in the brushwood.")
			dog:increaseAttrib("hitpoints", -10000)
			DOG_STATUS = false
			OLD_POSITION = false
			DOG_ID = false
			LAST_TIME = 0
		end
		WARP = nil
	end
	
end

function LookAtDonfbladeMap(User, Item)

	local dir = base.treasure.getDirection( User, Item )
	local distance = base.treasure.getDistance (User, Item )
	
	if not dir then
		base.lookat.SetSpecialDescription(Item,
		"Das Donfblatt scheint so etwas eine Karte zu sein. Eine Pfotenabdruck markiert eine Stelle, die sich scheinbar ganz in deiner Nähe befindet.",
		"The donblade seems to be some kind of a map. A paw print shows a mark that is somewhere very close to you.")
	else
		base.lookat.SetSpecialDescription(Item,
		"Das Donfblatt scheint so etwas eine Karte zu sein. Eine Pfotenabdruck markiert eine Stelle, die sich von dir aus gesehen "..distance.." im "..dir.." befindet.",
		"The donblade seems to be some kind of a map. A paw print shows a mark that is probably located somewhere "..distance.." in the "..dir.." of your current position.")
	end
	return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
end

function DigForTeachingScroll(User)

	local donfblades = User:getItemList(140)
	local donfblade = false
	for i=1,#donfblades do
		if donfblades[i]:getData("teachDogTransformationPotion") ~= "" then
			donfblade = donfblades[i]
		end
	end
	if not donfblade then
		return false
	end
	
	local frontPosition = base.common.GetFrontPosition(User)
	local scrollPosition = position(tonumber(donfblade:getData("MapPosX")),tonumber(donfblade:getData("MapPosY")),tonumber(donfblade:getData("MapPosZ")))
	if frontPosition ~= scrollPosition then
		return false
	end
	
	if tonumber(donfblade:getData("learnerId")) ~= User.id then
		User:inform("Du findest nichts, doch du glaubst ein Knurren in der Ferne zu vernehmen und eine Stimme flüstert dir zu: 'Nicht deins!'","You find nothing but you belive to hear a snarl in the distance and a voce whispers to you: 'Not yours!'")
		return true
	
	else
		if not alchemy.base.alchemy.CheckIfAlchemist(User) then
			User:inform("Du findest nichts, doch du glaubst ein Knurren in der Ferne zu vernehmen und eine Stimme flüstert dir zu: 'Du hast den Pfad verlassen! Kehre zurück, wenn du ihn wieder betreten hast!'","You find nothing but you belive to hear a snarl in the distance and a voce whispers to you: 'You left our path! Return once you have returned to it!'")
			return true
		end
	
		User:inform("Du entdeckts eine vergrabenen Schriftrolle. Wer sie da wohl verbuddelt hat?","You find a burried scrolls! Who may have hidden it there?")
		User:createItem(3110,1,333,{teachDogTransformationPotion="true",learnerId=User.id,descriptionEn="The scroll is sealed with some kind of sticky mass, having a paw print on it.",descriptionDe="Die Schriftrolle ist meiner Art kelbrigen Masse versiegelt und ein Pfotenabdruck befindet sich darauf."})
		
		donfblade:setData("teachDogTransformationPotion","")
		donfblade:setData("learnerId","")
		donfblade:setData("MapPosX","")
		donfblade:setData("MapPosY","")
		donfblade:setData("MapPosZ","")
		donfblade:setData("descriptionEn","A paw printing is on the blade.")
		donfblade:setData("descriptionDe","Ein Pfotenabdruck befindet sich auf dem Blatt.")
		world:changeItem(donfblade)
		return true
	end
end