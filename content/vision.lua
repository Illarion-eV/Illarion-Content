require("base.common")
require("triggerfield.evilrock")

module("content.vision", package.seeall)

VisionTextDE={};
VisionTextDE[1]={};
VisionTextDE[1][1]="test11d.";
VisionTextDE[1][2]="test12d";
VisionTextDE[1][3]="test13d";
VisionTextDE[1][4]="test14d";
VisionTextDE[1][5]="test15d";
VisionTextDE[1][6]="test16d";
VisionTextDE[1][7]="test17d";
VisionTextDE[1][8]="test18d";
VisionTextDE[1][9]="test19d";
VisionTextEN={};
VisionTextEN[1]={};
VisionTextEN[1][1]="~The shades of two men appear next to the shrine. Both are well dressed. Then, a tall man enters the building trough the maindoor, followed by a group of warriors, archers and mages.~";
VisionTextEN[1][2]="~Both men bow to the man, who rushes quickly to them. He asks them: 'What is the state?'~";
VisionTextEN[1][3]="~The left man replies with bowed head: 'We are almost done, master'.~";
VisionTextEN[1][4]="~'Almost?' The man looks around and turns back to both men. 'And the stone-chamber?'~";
VisionTextEN[1][5]="~The right man looks briefly up before he also replies with a bowed head: 'My master, the stone-chamber is ready to host your stones.'~";
VisionTextEN[1][6]="~'I will bring them with me the next time, when I come.' The tall man examines the room again and ask then: 'And the dwarf? Does he accept? Or do I have to convince him?'";
VisionTextEN[1][7]="~The left man replies smirking: 'Greedy as the old dwarf is, he could not resist. We observed his miners running some extra shifts.'~";
VisionTextEN[1][8]="~The tall man pauses before he replies: 'Bring meals and beverages for supper now. We have to leave quickly to Albar early morning.~";
VisionTextEN[1][9]="~As soon as the last words are said, all shades disappear.~";

VisionTextDE[2]={};
VisionTextDE[2][1]="test21d.";
VisionTextDE[2][2]="test22d.";
VisionTextDE[2][3]="test23d.";
VisionTextDE[2][4]="test24d.";
VisionTextDE[2][5]="test25d.";
VisionTextDE[2][6]="test26d.";
VisionTextDE[2][7]="test27d.";
VisionTextDE[2][8]="test28d.";
VisionTextDE[2][9]="test29d.";
VisionTextDE[2][10]="test210d.";
VisionTextDE[2][11]="test211d.";
VisionTextEN[2]={};
VisionTextEN[2][1]="~The shades of two men appear. One stands next to the bookrest, the other one is between the first two black columns.~";
VisionTextEN[2][2]="~He seems to hold six latent glittering gems in three different colours in his left hand.~";
VisionTextEN[2][3]="~It seems as in a response to a question, he nods to the man at the bookrest and takes one of the purple glimmering stones and uses it together with one of the first dark columns, which causes a bright light on the top of the dark column.~";
VisionTextEN[2][4]="~'Really?, I didn't know that.', the other man asks while the one man walks to the other column and repeats his action with the other pink latent glimmering stone.~";
VisionTextEN[2][5]="~'Yes, each time. You use them and they are gone. The column burns them somehow', the one man replies and walks to the two middle black colums, where he uses his blue shining gems on these two black columns.~";
VisionTextEN[2][6]="~The other man asks: 'Do you know where he gets them from? He must have an easy access to them, since he can waste them easily.' 'No idea', the one man anwers before he walks closer and starts using his green glimmering gems with the last two black columns.~";
VisionTextEN[2][7]="'But you have to keep in mind, we don't go down to the stone chamber everyday.', he continues and uses the second green gem. Another bright light appears on the top of this balck column. Suddenly, green flashes run up and down of each black column and some hidden lines of runes are revealed.~";
VisionTextEN[2][8]="~The one man walks back to the northwestern blackcolumn, where he scratches his head. Then, he starts focused muttering some words, obviously a part of a poem: 'It's burning in his heart,...'.~";
VisionTextEN[2][9]="~While he speaks, he selects some of the revealed runes on the black columns and walks between them. A dumb hum intensifies with every selection.~";
VisionTextEN[2][10]="~'Do you have an idea, why he chose this one?', asks the other man. The one man pauses for a second and replies 'I have already told you, haven't I? However, you better press the button and bring us down now!'~";
VisionTextEN[2][11]="~The other man nods and presses a button on the bookrest. The shades of both men fade away immediately.~";

VisionTextDE[3]={};
VisionTextDE[3][1]="test31d.";
VisionTextDE[3][2]="test32d.";
VisionTextDE[3][3]="test33d.";
VisionTextDE[3][4]="test34d.";
VisionTextDE[3][5]="test35d.";
VisionTextDE[3][6]="test36d.";
VisionTextDE[3][7]="test37d.";
VisionTextDE[3][8]="test38d.";
VisionTextEN[3]={};
VisionTextEN[3][1]="~The shades of a man and a dwarf appear next to the workbench. Both are working on the same workpiece. The dwarf complains to the man: 'This will never work that way. Let me show you how you have to do it.'~";
VisionTextEN[3][2]="~The man steps back and looks at the dwarf while the dwarf swings his hammer against the workpiece. 'You see? You have to hit as I do', the dwarf says.~";
VisionTextEN[3][3]="~The dwarf continues 'I am wondering why we are here? We could have build this stronghold whereever and not here at this nasty place.~";
VisionTextEN[3][4]="~'You are not paid for asking questions', the man replies. 'Do your work as you are supposed to do.'~";
VisionTextEN[3][5]="~The dwarf hisses: 'And you? What are you doing?' The man replies quietly: 'You will see later'.~";
VisionTextEN[3][6]="~'Arr, so, why? The lumberjack says, you are looking for diamonds. Magical ones, don't you?', the dwarf asks as he shows the man the finished workpiece.~";
VisionTextEN[3][7]="~The man examines the workpiece and nods: 'Very well done. I have to admit, you understand your profession. Unfortunatelly, you talk to much.'~";
VisionTextEN[3][8]="~The man draws a red degger and both fade away.~'";

VisionTextDE[4]={};
VisionTextDE[4][1]="test41d.";
VisionTextDE[4][2]="test42d.";
VisionTextDE[4][3]="test43d.";
VisionTextDE[4][4]="test44d.";
VisionTextDE[4][5]="test45d.";
VisionTextDE[4][6]="test46d.";
VisionTextDE[4][7]="test47d.";
VisionTextDE[4][8]="test48d.";
VisionTextEN[4]={};
VisionTextEN[4][1]="~It seems as two men stand next to a small boad at the shore. One says to the other in a fading voice: 'Who had thought it would end this way. All lost. He was so powerful but nothing his left from his power. All gone.'~";
VisionTextEN[4][2]="~'No one, I guess.' The other man sighs and contiunes: 'He was probably too confident about it. I told him not to split them but he did not want to listen to me. A shame.'~";
VisionTextEN[4][3]="~'Where will you go, my friend?', the man asks as he helps the other to prepare the boad.~";
VisionTextEN[4][4]="~'No idea, really no idea', the other man at the shore replies. 'And you? Do you have an idea?'~";
VisionTextEN[4][5]="~The first man points to the nordeast: 'I heard about a small island northeast from her. I might head there with the next ship, but I haven't decided yet.'~";
VisionTextEN[4][6]="~The other man nods and jumps into the boad. 'Where ever you go, I wish you all the best. Take care. If our gods will, our paths might cross again', he says and pushes his boad into the sea.~";
VisionTextEN[4][7]="~The man nods and waves. 'I hope so. Farewell!~";
VisionTextEN[4][8]="~The vision of both men fades away.~";

VisionTextDE[5]={};
VisionTextDE[5][1]="test51d.";
VisionTextDE[5][2]="test52d.";
VisionTextDE[5][3]="test53d.";
VisionTextDE[5][4]="test54d.";
VisionTextDE[5][5]="test55d.";
VisionTextDE[5][6]="test56d.";
VisionTextDE[5][7]="test57d.";
VisionTextDE[5][8]="test58d.";
VisionTextDE[5][9]="test59d.";
VisionTextDE[5][10]="test510d.";
VisionTextDE[5][11]="test511d.";
VisionTextEN[5]={};
VisionTextEN[5][1]="~A man who seems to sit writing on a table on the table appears while another one enters the room. 'They say you want to talk to me. What happened?'~";
VisionTextEN[5][2]="~The man on the table looks up and turns to the other one. 'We are lost. I do not know how but he lost'.~";
VisionTextEN[5][3]="~The other one looks shocked and asks sharply: 'Are you sure? Where do you have this information from?'~";
VisionTextEN[5][4]="~'My sources are never wrong. Better believe me. We have to prepare everything~, the man on the table replies.~";
VisionTextEN[5][5]="~You mean, they know about us?' 'No, not yet. I, however, think it is only a question of time until they find us here. We have to prepare everything and leave. It is over.~";
VisionTextEN[5][6]="~The other man nods 'Do we stick to the plan or do you have something else in mind?~";
VisionTextEN[5][7]="~The man on the table looks back on the parchment: 'Burning everything might be a bad idea. The smoke will betray us and directly lead them to us.' He pauses a second before he continues: 'It is better to sink as much as possible into the sea.'~";
VisionTextEN[5][8]="~'And those.../keys/?', the other one asks nervously.~";
VisionTextEN[5][9]="~'The man on the table pauses again for a second. 'It would be a shame, wouldn't it?' He looks thoughtful at the parchments and turns to other man finally: 'Hide them seperately somewhere were no one is looking for.'~";
VisionTextEN[5][10]="~The other man looks puzzled until the man on the table says: 'Put them to the death ones. They are not going to look for them there, if they have any decency.'~";
VisionTextEN[5][11]="~The other man replies 'If!', turns and leaves the room quickly. The man on the table also fades away.~";

VisionTextDE[6]={};
VisionTextDE[6][1]="test61d.";
VisionTextDE[6][2]="test62d.";
VisionTextDE[6][3]="test63d.";
VisionTextDE[6][4]="test64d.";
VisionTextDE[6][5]="test65d.";
VisionTextDE[6][6]="test66d.";
VisionTextDE[6][7]="test67d.";
VisionTextDE[6][8]="test68d.";
VisionTextEN[6]={};
VisionTextEN[6][1]="~The shades of two men appear, who clean the chamber. One of them asks the other one: '~And he is not scared one of them would betray him?~";
VisionTextEN[6][2]="~'It does not seam so. On the other hand, there is a reason why they are called the Trusted Ones', the other man replies.~";
VisionTextEN[6][3]="~'Let's assume he can trust them, there is still the question left are they even able to handle them?', the former continues to ask questions.~";
VisionTextEN[6][4]="~The other one shrugs: 'I hope for him so. I hope for us! Imagine his anger if one of them goes lost.' He laughs. 'However, it seams you are scared, are you?'~";
VisionTextEN[6][5]="~The former man shakes his head: 'I am not. I just do not understand his move. I mean... There are seven of them. One should be here if it is true. We... He has three. So, there are three left and no one knows anything about them. What is if someone is just waiting for such a /mistake/ by him. Nothing would be easier then to pick one after the other, now, he has seperated them.'~";
VisionTextEN[6][6]="~'What do you worry about that?', the other one hisses back. 'The others are likly seperated as well and why should we waste time instead of taking what we can possess as quickly as possible? Who should stop us? We beat Albar, we beat Salkamar and we are about beating Lor-Angur. Only one of Nargun's tricks might hinder us but not stop us anymore!'~";
VisionTextEN[6][7]="~'Probably, you are right', the former one replies as he continues cleaning.~";
VisionTextEN[6][8]="~'Probably? Ha! I am always right!' His laughter bangs through the chamber and both fade away.~";

attendants={}
attendants2={}

function vision(char,TypeStory)
--debug("3: "..TypeStory)
	local LineStory = char:getQuestProgress(664)
	attendants[char.name] = world:getPlayersInRangeOf(position(940,200,0), 90)
	if attendants[char.name] ~= nil then
			for k,player in ipairs(attendants[char.name]) do
				if (content.areas.PointInArea(player.pos,triggerfield.evilrock.EvilRockAreaNames[TypeStory])) then
--					player:inform(""..VisionTextDE[TypeStory][LineStory],""..VisionTextEN[TypeStory][LineStory])
					base.common.InformNLS(player,VisionTextDE[TypeStory][LineStory],VisionTextEN[TypeStory][LineStory])
debug("ThereOn0: "..player.name)
				else
debug("NotThereOn0: "..player.name)
				end

			end
	else
debug("attendants0:nil ")
	end

	attendants2[char.name] = world:getPlayersInRangeOf(position(940,200,-6), 90)
	if attendants2[char.name] ~= nil then
			for k,player in ipairs(attendants2[char.name]) do
				if (content.areas.PointInArea(player.pos,triggerfield.evilrock.EvilRockAreaNames[TypeStory])) then
--					player:inform(""..VisionTextDE[TypeStory][LineStory],""..VisionTextEN[TypeStory][LineStory])
					base.common.InformNLS(player,VisionTextDE[TypeStory][LineStory],VisionTextEN[TypeStory][LineStory])
debug("ThereOn-6: "..player.name)
				else
debug("NotThereOn-6: "..player.name)
				end

			end
	else
debug("attendants-6:nil ")
	end 
end




darkColumnEvilrock={position(967,171,0),position(969,171,0),position(971,171,0),position(967,175,0),position(969,175,0),position(971,175,0)}
darkColumnEvilrockLight={position(967,171,1),position(969,171,1),position(971,171,1),position(967,175,1),position(969,175,1),position(971,175,1)}
darkColumnEvilrockFlame={467,467,467,467,467,467}
CheckLightOnColumnIsThere={}
enabledAttendantsForPuzzle={}


gemsRequired={197,284,45,197,284,45}


function UseDarkColumns(User, SourceItem, ltstate)

	if User:getQuestProgress(667) >= 1 or world:getItemOnField(SourceItem.pos).id == 467 then
		return
	end

	local AmountDarkColumnEvilrock = table.getn(darkColumnEvilrock)	
  	for i = 1,AmountDarkColumnEvilrock do
		if (SourceItem.pos == darkColumnEvilrock[i]) and User:countItemAt("all", gemsRequired[i], {["gemLevel"]="1"}) >= 1 then
--			local howmuchisit = User:countItemAt("all", 284)

			local foundSource
	-- check for dark column
			TargetItem = darkColumnEvilrock[i];
			if (TargetItem ~= nil) then
				if not base.common.IsLookingAt( User, darkColumnEvilrock[i] ) then -- check looking direction
					base.common.TurnTo( User, darkColumnEvilrock[i] ); -- turn if necessary
				end
				foundSource=true
			end

			if ( ltstate == Action.none ) then 
				User:startAction( 20, 21, 5, 28, 55);
--				User:startAction( 20, 21, 5, 13, 25);
				User:talk(Character.say, "#me setzt einen magischen Edelstein in die Säule ein.", "#me sets a magical gem into the column.")
				world:gfx(52,darkColumnEvilrockLight[i])
				world:createItemFromId( darkColumnEvilrockFlame[i], 1, darkColumnEvilrock[i], true, 666, nil)
				User:eraseItem(gemsRequired[i],1, {["gemLevel"]="1"})
			end

			for j = 1,AmountDarkColumnEvilrock do
				local CheckLightOnColumn = world:getItemOnField(darkColumnEvilrock[j])
				if CheckLightOnColumn.id == 467 then
					CheckLightOnColumnIsThere[j] = true
				else
					CheckLightOnColumnIsThere[j] = false
				end
				for k = 1,j do
					if CheckLightOnColumnIsThere[j] ~= true then
						return
					end
				end
			end

			for l = 1,AmountDarkColumnEvilrock do
				world:gfx(5,darkColumnEvilrock[l])
				world:makeSound(27,darkColumnEvilrock[l])
			end


			BlackColumnQuestProgressA(User)
		elseif (SourceItem.pos == darkColumnEvilrock[i]) and (User:countItemAt("all", gemsRequired[i]) >= 1) then
			base.common.InformNLS(User,"Der Edelstein lässt sich rein stecken aber er dürfte scheinbar trotzdem nicht  der richtige sein. Vielleicht versuchst du einen anderen.","Your gem seems to fit but for some reason it does not seem to be the right one.")
		elseif (SourceItem.pos == darkColumnEvilrock[i]) and (User:countItemAt("all", 283) >= 1 or User:countItemAt("all", 46) >= 1 or User:countItemAt("all", 198) >= 1) then
			base.common.InformNLS(User,"Diese Art von Edelstein scheint nicht zu passen. Vielleicht versuchst du einen einer anderen Art.","This kind of gem does not seem to fit. You might try a different one.")
		elseif (SourceItem.pos == darkColumnEvilrock[i]) then
			base.common.InformNLS(User,"Keiner deiner Gegenstände scheint nicht zu passen.","None of your items seems to fit.")
		end
	end
end


function BlackColumnQuestProgressA(User)
	enabledAttendantsForPuzzle[User.name] = world:getPlayersInRangeOf(position(969,172,0), 10)
	for m,player in ipairs(enabledAttendantsForPuzzle[User.name]) do
		if (content.areas.PointInArea(player.pos,triggerfield.evilrock.EvilRockAreaNames[2])) then
			player:setQuestProgress(667,1)
			base.common.InformNLS(player,"~Eine Stimme sagt: 'Flammen, die Welt steht in Flammen!' Anschließend ist ein Summen zu hören und selektierbare Runen erscheinen an den schwarzen Säulen.~","~A voice says: 'Fire, the world is fire!' A hum can be heard afterwards and selectable runes appear on the black columns.~")
		else
		end
	end
end


function BlackColumnQuestProgressB(User,QuestStatusBlackColumn)
	enabledAttendantsForPuzzle[User.name] = world:getPlayersInRangeOf(position(969,172,0), 10)
	for m,player in ipairs(enabledAttendantsForPuzzle[User.name]) do
		if (content.areas.PointInArea(player.pos,triggerfield.evilrock.EvilRockAreaNames[2])) then
			if QuestStatusBlackColumn == 16 then
				base.common.InformNLS(player,"~Eine Stimme ruft: 'Flammen, die Welt steht in Flammen!'. Das Summen verstärkt sich anschließend.~", "~A voice shouts: 'Fire, the world is fire!' The hum intensifies afterwards.~")
			else
				base.common.InformNLS(player,"~Das Summen verstärkt sich als du den magischen Edelstein einsetzt.~", "~The hum intensifies as you put in the magical gem.~")
			end
			player:setQuestProgress(667,QuestStatusBlackColumn+1)
		else
		end
	end
	if QuestStatusBlackColumn == 24 then
		world:makeSound(27,position(975,173,0))
		world:gfx(46,position(975,173,0))
	end
end

function BlackColumnQuestProgressC(User,QuestStatusBlackColumn)
	enabledAttendantsForPuzzle[User.name] = world:getPlayersInRangeOf(position(969,172,0), 10)
	for m,player in ipairs(enabledAttendantsForPuzzle[User.name]) do
		if (content.areas.PointInArea(player.pos,triggerfield.evilrock.EvilRockAreaNames[2])) then
			player:setQuestProgress(667,0)
			base.common.InformNLS(player,"~Das Summen bricht ab, die Lichter erlöschen und die Runen an den schwarzen Säulen verschwinden.~", "~The hum breaks up, lights go out and the runes disappear on the black column.~")
			world:makeSound(27,player.pos)
			local AmountDarkColumnEvilrock = table.getn(darkColumnEvilrock)	
			for i=1,AmountDarkColumnEvilrock do
				local DarkColumnEvilrockLightErase = world:getItemOnField(darkColumnEvilrock[i])
				if DarkColumnEvilrockLightErase.id == 467 then
					world:erase(DarkColumnEvilrockLightErase,DarkColumnEvilrockLightErase.number)
					world:gfx(45,darkColumnEvilrockLight[i])
				end
			end
		else
		end
	end
end


function UseDarkColumnsPuzzle(User, SourceItem, ltstate)

	local AmountDarkColumnEvilrock = table.getn(darkColumnEvilrock)	
  	for i = 1,AmountDarkColumnEvilrock do
		if (SourceItem.pos == darkColumnEvilrock[i]) and User:getQuestProgress(667) >= 1 and world:getItemOnField(SourceItem.pos).id == 467 then

			local foundSource
	-- check for dark column
			TargetItem = darkColumnEvilrock[i];
			if (TargetItem ~= nil) then
				if not base.common.IsLookingAt( User, darkColumnEvilrock[i] ) then -- check looking direction
					base.common.TurnTo( User, darkColumnEvilrock[i] ); -- turn if necessary
				end
				foundSource=true
			end

			if ( ltstate == Action.none ) then 
				Puzzle(User,SourceItem)
--				return
			end
		end
	end
end


puzzleOptionsDE={}
puzzleOptionsDE[1]="Es brennt in seinem Herz,"
puzzleOptionsDE[2]="erfüllt ihn mit Schmerz."
puzzleOptionsDE[3]="Es gibt ihm"
puzzleOptionsDE[4]="die Wärme einer Schreckensherrschaft."
puzzleOptionsDE[5]="Atmet die sterbliche Hitze,"
puzzleOptionsDE[6]="trinkt von der sterblichen Seele."
puzzleOptionsDE[7]="Um sich an der Wärme zu laben"
puzzleOptionsDE[8]="sein Leben vollkommen zu machen!"
puzzleOptionsDE[9]="Er trinkt das warme Blut,"
puzzleOptionsDE[10]="ein wichtiger Geschmack des Lebens."
puzzleOptionsDE[11]="Es fliesst durch seine Venen,"
puzzleOptionsDE[12]="gibt ihm den Wahnsinn."
puzzleOptionsDE[13]="Kriecht in lebendes Fleisch,"
puzzleOptionsDE[14]="schlängelt sich ins Hirn."
puzzleOptionsDE[15]="Spielt mit neuen Gedanken, Willen und saugt auf,"
puzzleOptionsDE[16]="was er bekommt."
puzzleOptionsDE[17]="Er wandert durch die Flammen,"
puzzleOptionsDE[18]="sie grüßen ihn in Vorfreude."
puzzleOptionsDE[19]="Erwarten von ihm,"
puzzleOptionsDE[20]="seine dunkle Kreatur zu vollenden."
puzzleOptionsDE[21]="Zerstörung wird er säen,"
puzzleOptionsDE[22]="alte Schätze suchend,"
puzzleOptionsDE[23]="Der Schmerz, den dieser neue Arm brennt,"
puzzleOptionsDE[24]="wird unvorstellbar sein."

puzzleOptionsEN={}
puzzleOptionsEN[1]="It's burning in his heart,"
puzzleOptionsEN[2]="and filling him with pain."
puzzleOptionsEN[3]="It's giving him"
puzzleOptionsEN[4]="the warmth of terror in reign."
puzzleOptionsEN[5]="Breathing the mortals heat,"
puzzleOptionsEN[6]="draining from mortal soul."
puzzleOptionsEN[7]="To fill him with their warmth"
puzzleOptionsEN[8]="and make his life be whole."
puzzleOptionsEN[9]="He drinks the heated blood,"
puzzleOptionsEN[10]="essential taste of life."
puzzleOptionsEN[11]="It rushes in his veins,"
puzzleOptionsEN[12]="gives him the madman's drive."
puzzleOptionsEN[13]="Slipping into living flesh,"
puzzleOptionsEN[14]="gliding into the brain."
puzzleOptionsEN[15]="Playing there with thoughts and will,"
puzzleOptionsEN[16]="to keep a steady drain."
puzzleOptionsEN[17]="He's walking through the flames,"
puzzleOptionsEN[18]="they greet him in anticipation."
puzzleOptionsEN[19]="Expecting him to build,"
puzzleOptionsEN[20]="his own dark doomed creation."
puzzleOptionsEN[21]="Destruction he will spread,"
puzzleOptionsEN[22]="in seeking his old treasure."
puzzleOptionsEN[23]="The pain his arm will bring,"
puzzleOptionsEN[24]="will be without a measure."

puzzleItem={0}
OptionToSelect={}

puzzleDarkColumnOrder={1,5,3,6,2,4,1,2,3,6,5,4,1,2,6,3,5,4,1,5,6,3,2,4}

function Puzzle(User,SourceItem)
	local options
	local Amountoptions = table.getn(puzzleOptionsDE)
	local QuestStatusBlackColumn = User:getQuestProgress(667)
	local TrueOption = math.random(1,3)

	if (SourceItem.pos == darkColumnEvilrock[puzzleDarkColumnOrder[QuestStatusBlackColumn]]) then
		OptionToSelect[TrueOption] = QuestStatusBlackColumn
		if TrueOption == 1 then
			repeat
				OptionToSelect[2] = math.random(1,24)
				OptionToSelect[3] = math.random(1,24)
			until OptionToSelect[1] ~= OptionToSelect[2] and OptionToSelect[1] ~= OptionToSelect[3] and OptionToSelect[2] ~= OptionToSelect[3]
		elseif TrueOption == 2 then
			repeat
				OptionToSelect[1] = math.random(1,24)
				OptionToSelect[3] = math.random(1,24)
			until OptionToSelect[1] ~= OptionToSelect[2] and OptionToSelect[1] ~= OptionToSelect[3] and OptionToSelect[2] ~= OptionToSelect[3]
		elseif TrueOption == 3 then
			repeat
				OptionToSelect[1] = math.random(1,24)
				OptionToSelect[2] = math.random(1,24)
			until OptionToSelect[1] ~= OptionToSelect[2] and OptionToSelect[1] ~= OptionToSelect[3] and OptionToSelect[2] ~= OptionToSelect[3]
		end
	else
		repeat
			OptionToSelect[1] = math.random(1,24)
			OptionToSelect[2] = math.random(1,24)
			OptionToSelect[3] = math.random(1,24)
		until OptionToSelect[1] ~= OptionToSelect[2] and OptionToSelect[1] ~= OptionToSelect[3] and OptionToSelect[2] ~= OptionToSelect[3]
	end

	
	for j = 1,Amountoptions do
	   	if  User:getPlayerLanguage() == Player.german then
			puzzleOptions = puzzleOptionsDE
		else
			puzzleOptions = puzzleOptionsEN
		end
	end


	local callback = function(dialog)
		success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex() 
			if (selected == 0) then
				checkRightChoice(User,QuestStatusBlackColumn,selected)
			elseif (selected == 1) then
				checkRightChoice(User,QuestStatusBlackColumn,selected)
			elseif (selected == 2) then
				checkRightChoice(User,QuestStatusBlackColumn,selected)
			end
		end
	end
	local dialog

	if  User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Schwarze Säulen Rätsel", "Treffe deine Wahl, aber sei vorsichtig. Bei einer flaschen Antwort musst du wieder von vorne beginnen.", callback)
	else
		dialog = SelectionDialog("Black Column Puzzle", "Select your choice but be careful. If you select the wrong answer, you move back to the beginning.", callback)
	end
	dialog:setCloseOnMove()
	

	for i = 1,3 do
		dialog:addOption(2805,puzzleOptions[(OptionToSelect[i])])

	end


	User:requestSelectionDialog(dialog)
end


function checkRightChoice(User,QuestStatusBlackColumn,selected)
	User:startAction( 10, 0, 0, 22, 55);
	User:talk(Character.say, "#me wählt eine der Runen an der schwarzen Säule aus.", "#me selects one of the runes on the black column.")
	if OptionToSelect[selected+1] == QuestStatusBlackColumn then
		BlackColumnQuestProgressB(User,QuestStatusBlackColumn)
	else
		BlackColumnQuestProgressC(User,QuestStatusBlackColumn)
	end
end


findPossiblePlayersForBeamMeDown={}

function beamMeDown(User, SourceItem)
	world:makeSound(22,position(975,173,0))
	world:gfx(46,position(975,173,0))
	findPossiblePlayersForBeamMeDown[User.name] = world:getPlayersInRangeOf(position(970,173,0), 8)
	for m,player in ipairs(findPossiblePlayersForBeamMeDown[User.name]) do
		if content.areas.PointInArea(player.pos,"evilrock6") then
			world:makeSound(13,player.pos)
			world:gfx(37,player.pos)
		end
		if content.areas.PointInArea(player.pos,"evilrock6") then
			player:warp(position(973,173,-6))
			player:setQuestProgress(667,0)
			base.common.InformNLS(player,"~Das Summen bricht ab und ein Lichtermantel umschließt dich, der dich an einen anderen Ort zieht.~", "~The hum breaks up and a coat of light encloses you and pulls you at a different place.~")
			world:makeSound(13,player.pos)
			world:gfx(37,player.pos)
		end
	end
end

function EvilRockPortal(User)
	portalEvilRock = world:createItemFromId(10,1,position(977,173,-6),true,666, nil)
	portalEvilRock:setData("destinationCoordsX",975)
	portalEvilRock:setData("destinationCoordsY",173)
	portalEvilRock:setData("destinationCoordsZ",-6)
	world:changeItem(portalEvilRock)
	world:makeSound( 4, position(977,173,-6))
end
