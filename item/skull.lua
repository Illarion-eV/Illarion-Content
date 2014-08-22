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

-- UPDATE items SET itm_script='item.skull' WHERE itm_id = 2038;
-- UPDATE items SET itm_script='item.skull' WHERE itm_id = 2039;

module("item.skull", package.seeall)


function UseItem(User, SourceItem)
	-- Evilrock skulls
	local skullSourceItemPos={position(989,247,0),position(990,241,0),position(997,226,0)}
	local typoOfFlame={359,360,372}

	for i = 1, #skullSourceItemPos do
		if (SourceItem.pos == skullSourceItemPos[i]) then
			local flame = typoOfFlame[i]
			BlowOutFlames(User,flame)
			if User:getQuestProgress(668) ~= 1 then
				User:inform("Nichts passiert als du die Finger in die Augenhöhlen des Schädels reinsteckst.", "Nothing happens as you put your fingers into the eye holes of the skull.")
			end
			User:setQuestProgress(668,0)
		end
	end

	-- Spidercave skulls, scavenger hunt
	local questStep = User:getQuestProgress(521);

	if questStep == 0 and SourceItem.pos == position(905, 515, -6) then
		User:inform("Du hörst eine Stimme in deinen Gedanken 'Suche und finde mein Zauberauge der Pein! Der nächste Schädel auf dem Pfade mit einem Hinweis ist nahe der bösen Witwe Gorgophone zu finden!'",
					"You hear a voice in your head 'Seek and ye shall find, my Magical Torturous Eye! The next skull on the path with a clue is found near the evil widow, Gorgophone!'");
		User:setQuestProgress(521, 1);

	elseif questStep == 1 and SourceItem.pos == position(849, 498, -6) then
		User:inform("Du hörst eine Stimme in deinen Gedanken 'Das Zauberauge der Pein ist weggekullert und wurde von einer spinne mitgenommen. Alles was ich hörte ist, dass es in einem Schädel weit von hier versteckt wurde, nahe eines roten Brutbündels im Nordosten der Höhle.'",
					"You hear a voice in your head 'The Magical Torturous Eye rolled away from me and was stolen by a spider. Last I heard it was being secreted away in a skull far away from here, near a red egg sac all alone in the North East somewhere.'");
		User:setQuestProgress(521, 2);

	elseif questStep == 2 and SourceItem.pos == position(923, 451, -6) then
		User:inform("Du hörst eine Stimme in deinen Gedanken 'Ich war im Besitz des Zauberauges der Pein für eine kurze Zeit. Die Spinne räumt es immer wieder um. Sie trug es in den Südwesten zu einem großen Tümpel, das habe ich gesehen.'",
					"You hear a voice in your head 'I did have the Magical Torturous Eye for but a short time. The spider keeps moving it around and around. It headed Southwest last I saw to a large lake.'");
		User:setQuestProgress(521, 3);

	elseif questStep == 3 and SourceItem.pos == position(837, 524, -6) then
		User:talk(Character.say, "#me wird davon überrascht, dass bei Berührung mehrere Rubine aus dem Totenschädel kullern, leider ist keiner davon das gesuchte Zauberauge der Pein.",
								"#me becomes surprised, looking into the eyes of the skull several rubies come tumbling out, but, sadly, none is the Magical Torturous Eye.");
		local notCreated = User:createItem(46, 25, 333, nil); -- 25 rubies
		if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
			world:createItemFromId(46, notCreated, User.pos, true, 333, nil);
			base.common.HighInformNLS(User,
				"Du kannst nichts mehr halten.",
				"You can't carry any more.");
		end
		User:inform("Ein Pfeil ist in die Seite des Schädels geritzt der nach Osten zeigt. Darunter ist eine große Pfütze und viele Totenschädel abgebildet.",
					"An arrow can be seen scratched into the side of the skull, pointing east of here. Underneath is a large puddle of water or mud and many skulls on the drawing.");
		User:setQuestProgress(521, 4);

	elseif questStep == 4 and SourceItem.pos == position(928, 536, -6) then
		User:inform("Du hörst eine Stimme in deinen Gedanken 'Es war hier aber jetzt nicht mehr. Schau dort wo du hereingkommen bist, hofentlich ist es immer noch dort.'",
					"You hear a voice in your head 'It's gone. It was here, but no longer. Look back where you came in, hopefully it is still there.'");
		User:setQuestProgress(521, 5);

	elseif questStep == 5 and SourceItem.pos == position(925, 521, -6) then
		User:inform("Jemand hat einen Pfeil in den Schädel geritzt, der nach Norden zeigt. Auch das Bild eines Totenkopfs wurde eingeritzt, der im Wasser liegt.",
					"An arrow has been carved by someone on the side of the skull, pointing to the north. There is a picture of a skull sitting in water.");
		User:setQuestProgress(521, 6);

	elseif questStep == 6 and SourceItem.pos == position(899, 503, -6) then
		User:inform("Als du den Schädel berührst beginnen dessen Augen grün zu glühen und eine Giftwolke steigt auf. Eine körperlose Stimme spricht 'Ein Tarantel hat es mitgenommen und im Nordwesten versteckt. In einem Schädel nahe eines Warnschildes.'",
					"As you touch the skull, the eyes glow green and poison rises from them. A disembodied voice says 'A tarantula has taken it somewhere off in the Northwest. The skull lays near an evil sign.'");
		world:createItemFromId(372, 1, SourceItem.pos, true, 333, nil); -- poison cloud
		User:setQuestProgress(521, 7);

	elseif questStep == 7 and SourceItem.pos == position(839, 455, -6) then
		User:inform("Du hörst eine Stimme in deinen Gedanken 'Ich sah eine Spinne etwas wegtragen, sie kann nicht weit sein! Sie muss in der Nähe sein. Halte Ausschau nach Schlamm, da ihre Beine bedeckt davon waren.'",
					"You hear a voice in your head 'I saw a spider scrabble off with something, it can't have gotten far! Must be near here somewhere. Look where there is mud as its feet were covered in the stuff.'");
		User:setQuestProgress(521, 8);

	elseif questStep == 8 and SourceItem.pos == position(845, 464, -6) then
		User:inform("Eine Spinne huscht aus dem Schädel heraus und greift dich an, nachdem sie einen großen, rot glänzenden Stein in dem Totenschädel versteckt.",
					"A spider scurries out of the skull and attacks you after pushing a bright stone that flashes red back into the skull for safekeeping.");
		local monPos = base.common.getFreePos(SourceItem.pos, 3 ); -- radius 3 around skull
		world:createMonster(223, monPos, 0); -- Giant Enforcer Spider
		world:gfx(41, monPos); -- swirly
		User:setQuestProgress(521, 9);

	elseif questStep == 9 and SourceItem.pos == position(845, 464, -6) then
		User:inform("Du holst einen großen roten Edelstein aus dem Totenschädel hervor. Es ist das Zauberauge der Pein!",
					"You retrieve a large red gem from the skull. It is the Torturous Eye!");
		local notCreated = User:createItem(46, 1, 333, {["gemLevel"] = 1}); -- 1 latent ruby
		if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
			world:createItemFromId(46, notCreated, User.pos, true, 333, {["gemLevel"] = 1});
			base.common.HighInformNLS(User,
				"Du kannst nichts mehr halten.",
				"You can't carry any more.");
		end
		User:setQuestProgress(521, 10);

	elseif questStep == 10 and SourceItem.pos == position(905, 515, -6) then
		User:inform("Du hörst eine Stimme in deinen Gedanken 'Mein Zauberauge der Pein, du hast es gefunden! Behalte und behüte es, ich hab ja noch ein anderes für mich selbst.'",
					"You hear a voice in your head 'My Magical Torturous Eye, you found it! Keep it though, after all I have another one left for myself.'");
		User:setQuestProgress(521, 11);

	end

	-- Spidercave skulls, scavenger hunt
	-- as long as the quest is in progress, spawns some spiders when wrong skull is chosen
	if questStep > 0 and questStep < 10 then
		local skullPos = {
			position(844, 495, -6),
			position(856, 505, -6),
			position(919, 457, -6),
			position(842, 534, -6),
			position(923, 539, -6),
			position(925, 542, -6),
			position(923, 543, -6),
			position(927, 544, -6),
			position(892, 506, -6),
			position(862,451,-6)
		}
		for i = 1, #skullPos do
			if (SourceItem.pos == skullPos[i]) then
				SpawnSpider(User, SourceItem);
				return;
			end
		end
	end
end

function BlowOutFlames(User,flame)

	for xx=986,998 do
		for yy=211,235 do
			local positionFlame = position(xx,yy,0)
			local checkFlame = world:getItemOnField(positionFlame)
			if checkFlame.id == flame then
				world:erase(checkFlame,checkFlame.number)
				world:makeSound(13,User.pos)
				if User:getQuestProgress(668) ~= 1 then
					User:setQuestProgress(668,1)
				end
			end
		end
	end
end

function SpawnSpider(User, skullItem)

	-- skip if already tripped in the last 5 minutes
	local serverTime = world:getTime("unix");
	local trippingTime = skullItem:getData("tripping_time");

	if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
		User:inform("Du findest nichts in diesem Totenschädel.",
					"You find nothing inside this skull.");
		return;
	end

	local monList = {191, 192, 193, 211, 222, 262} -- Rekrap Retep, Pitservant, Tarantula, Firespider, Juvenile Gynk Spider, Soulpain
	local monID = monList[math.random(1, #monList)];
	for i = 1, math.random(1,2) do -- random count
		local monPos = base.common.getFreePos(skullItem.pos, 2); -- radius 2 around skull
		world:createMonster(monID, monPos, 0);
		world:gfx(41, monPos); -- swirly
	end
	User:inform("Schlechte Wahl, Abenteuerer! Etwas springt aus dem Totenschädel heraus und greift dich an.",
				"Wrong choice traveler! Something hops out of the skull and attacks you.");

	-- safe tripping time
	local serverTime = world:getTime("unix");
	skullItem:setData("tripping_time", serverTime);
	world:changeItem(skullItem);

end
