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
local common = require("base.common")
local evilrock = require("triggerfield.evilrock")
local areas = require("content.areas")

local M = {}

VisionTextDE={};
VisionTextDE[1]={};
VisionTextDE[1][1]="Die Schatten zweier Männer tauchen neben dem Schrein auf. Beide sind gut angezogen. Dann, ein großer Mann betritt das Gebäude durch das Haupttor. Es folgt ihm eine Gruppe von Kriegern, Bogenschützen und Magiern.";
VisionTextDE[1][2]="Beide Männer verbeugen sich gegenüber diesem Mann, welcher rasch auf sie zu eilt. Er fragt sie: 'Wie ist die Lage?'";
VisionTextDE[1][3]="Der linke Mann erwidert mit gebeugtem Kopf: 'Wir sind fast fertig, Meister'.";
VisionTextDE[1][4]="'Fast?' Der Mann blickt sich um und dreht sich dann wieder den beiden Männern zu. 'Und die Steinkammer?'";
VisionTextDE[1][5]="Der rechte Mann blickt kurz auf und erwidert ebenfalls mit gesenktem Kopf: 'Mein Meister, die Steinkammer ist bereit, um eure Steine zu beherbergen.'";
VisionTextDE[1][6]="'Ich werde sie das nächste Mal mit mir mitbringen, wenn ich wieder komme. Der große Mann betrachtet den großen Raum erneut und fragt dann: 'Und der Zwerg in der Gebirgsstadt? Akzeptiert er? Oder muss ich ihn überzeugen?";
VisionTextDE[1][7]="Der linke Mann erwidert grinsend: 'Gierig wie der alt Zwerg ist, konnte er nicht widerstehen. Er ist schlimmer als sein Sohn. Wir haben ihre Hauer dabei beobachten können, wie sie extra Schichten machen.'";
VisionTextDE[1][8]="Der große Mann wartet kurz bevor er antwortet: 'Bringt nun Essen und Getränke für das Abendmahl. Wir müssen morgen früh rasch nach Albar aufbrechen.";
VisionTextDE[1][9]="Sobald die letzten Worte gesprochen sind, verschwinden alle Schatten.";
VisionTextEN={};
VisionTextEN[1]={};
VisionTextEN[1][1]="The shades of two men appear next to the shrine. Both are well dressed. Then, a tall man enters the building through the main door, followed by a group of warriors, archers and mages.";
VisionTextEN[1][2]="Both men bow to this man, who rushes quickly to them. He asks them: 'What is the state?'";
VisionTextEN[1][3]="The left man replies with bowed head: 'We are almost done, Master'.";
VisionTextEN[1][4]="'Almost?' The man looks around and turns back to both men. 'And the stone-chamber?'";
VisionTextEN[1][5]="The right man looks briefly up before he also replies with a bowed head: 'My Master, the stone-chamber is ready to host your stones.'";
VisionTextEN[1][6]="'I will bring them with me the next time, when I come.' The tall man examines the room again and ask then: 'And the dwarf in the mountain town? Does he accept? Or do I have to convince him?'";
VisionTextEN[1][7]="The left man replies smirking: 'Greedy as the old dwarf is, he could not resist. Much worse than his son. We observed their miners running some extra shifts.'";
VisionTextEN[1][8]="The tall man pauses before he replies: 'Bring meals and beverages for supper now. We have to leave soon for Albar, early in the morning.";
VisionTextEN[1][9]="As soon as the last words are said, all the shades disappear.";

VisionTextDE[2]={};
VisionTextDE[2][1]="Die Schatten zweier Männer erscheinen. Einer steht nahe dem Lesepult, der andere steht zwischen den ersten beiden schwarzen Säulen.";
VisionTextDE[2][2]="Er scheint, sechs latent glitzernde Edelsteine in drei verschiedenen Farben zu halten.";
VisionTextDE[2][3]="Es wirkt als würde er auf eine Frage antwortent zu dem Mann am Lesepult nicken und einen der violett scheinenden Steine nehmen und sie gemeinsam mit einer der ersten schwarzen Säulen verwenden, worauf ein helles Licht auf der Spitze der schwarzen Säule erscheint.";
VisionTextDE[2][4]="'Wirklich? Ich wusste das nicht', fragt der andere Mann, während der eine Mann zu der zweiten der beiden ersten Säulen geht und seine Aktion mit dem anderen violett scheinenden Stein wiederholt.";
VisionTextDE[2][5]="'Ja, jedes Mal. Du verwendest sie und sie sind weg. Die Säulen verbrennen die irgendwie', wirft der eine Mann zurück und geht auf die beiden mittleren schwarzen Säulen zu, wo er seine blau scheinenden Edelsteine mit beiden schwarzen Säulen verwendet.";
VisionTextDE[2][6]="Der andere Mann fragt: 'Weißt du wo er sie her kriegt? Er muss eine Quelle haben, so wie er sie verschwenden kann.' 'Keine Ahnung', antworet der eine Mann während er näher kommt und seine grün leuchtenden Edelsteine mit den beiden letzten schwarzen Säulen verwendet.";
VisionTextDE[2][7]="'Du musst bedenken, dass wir nicht jeden Tag hinunter in die Steinkammer gehen', fügt er hinzu und verwendet den zweiten grünen Edelstein. Ein weiteres hell leuchtendes Lich erscheint an der Spitze dieser schwarzen Säule. Mit einem Schlag brennt ein grünes Licht jede Säulen entlang und versteckte Runen werden auf den Säulen sichtbar";
VisionTextDE[2][8]="Der eine Mann geht zurück zu der nordwestlichen schwarzen Säule, wobei er seinen Kopf kratzt. Dann beginnt er konzentriert einige Wörter zu murmeln, die scheinbar ein Teil eines Gedichts sind: 'Es brennt in seinem Herz,...'.";
VisionTextDE[2][9]="Während er spricht wählt er einige der aufgedeckten Runen an den schwarzen Säulen und geht von einer zur nächsten. Ein dumpfes Summen verstärkt sich mit jeder Auswahl.";
VisionTextDE[2][10]="'Hast du eine Ahnung, warum er dieses Gedicht gewählt hat?', fragt der andere Mann. Der eine Mann hält ein für einen Augenblick und antwortet 'Das habe ich doch schon gesagt, oder? Wie dem auch sei, drück mal besser den Knopf und bring uns hinunter!'";
VisionTextDE[2][11]="Der andere Mann nickt und drückt einen Knopf am Lesepult. Die Schatten der beiden Männer verschwinden sofort.";
VisionTextEN[2]={};
VisionTextEN[2][1]="The shades of two men appear. One stands next to the book rest, the other one is between the first two black columns.";
VisionTextEN[2][2]="He seems to hold six latent glittering gems in three different colours in his left hand.";
VisionTextEN[2][3]="It seems as in a response to a question, he nods to the man at the book rest and takes one of the purple glimmering stones and uses it together with one of the first dark columns, creating a bright light on the top of the dark column.";
VisionTextEN[2][4]="'Really?, I didn't know that', the other man asks while the man walks to the other of the first pair of columns and repeats his action with the other purple latent glimmering stone.";
VisionTextEN[2][5]="'Yes, each time. You use them and they are gone. The column burns them somehow', the man replies and walks to the two middle black columns, where he uses his blue shining gems.";
VisionTextEN[2][6]="The other man asks: 'Do you know where he gets them from? He must have an easy access to them, since he can waste them so easily.' 'No idea', the man answers before he walks closer and starts using his green glimmering gems with the last two black columns.";
VisionTextEN[2][7]="'But you have to keep in mind, we don't go down to the stone chamber everyday', he continues and uses the second green gem. Another bright light appears on the top of this black column. Suddenly, green flashes run up and down of each black columns and some hidden lines of runes are revealed on the columns.";
VisionTextEN[2][8]="The man walks back to the northwestern black column, where he scratches his head. Then, he starts focused muttering of some words, obviously a part of a poem: 'It's burning in his heart,...'.";
VisionTextEN[2][9]="While he speaks, he selects some of the revealed runes on the black columns and walks between them. A dull hum intensifies with every selection.";
VisionTextEN[2][10]="'Do you have any idea, why he chose this poem?', asks the other man. The man pauses for a second and replies 'I have already told you, haven't I? However, you better press the button and bring us down now!'";
VisionTextEN[2][11]="The other man nods and presses a button on the book rest. The shades of both men fade away immediately.";

VisionTextDE[3]={};
VisionTextDE[3][1]="Die Schatten eines Mannes und eines Zwergen erscheinen neben der Werkbank. Beide arbeiten am selben Werkstück. Der Zwerg beschwert sich bei dem Mann: 'So wird das nie etwas. Lass mich dir mal zeigen wie das geht.'";
VisionTextDE[3][2]="Der Mann tritt zurück und sieht dem Zwergen zu, wie dieser seinen Hammer gegen das Werkstück schwingt. 'Siehst du? So musst du das machen', sagt der Zwerg.";
VisionTextDE[3][3]="Der Zwerg setzt fort 'Ich frag mich, wieso wir hier sind? Wir könnten die Festung irgendwo bauen und nicht an diesem schmutzigen Ort.'";
VisionTextDE[3][4]="'Du wirst nicht bezahlt, um Fragen zu stellen', erwidert der Mann. 'Mach deine Arbeit wie es dir angeordnet wurde.'";
VisionTextDE[3][5]="Der Zwerg zischt: 'Und du? Was machst du?' Der Mann antwortet ruhig: 'Das wirst du später sehen.'";
VisionTextDE[3][6]="'Arr, so, warum? Ihr sucht nach magischen Steinen, oder? Und was sollen diese Gravierungen an der Säule dort drüben?' fragt der Zwerg als er dem Mann das fertige Werkstück zeigt. ";
VisionTextDE[3][7]="Der Mann begutachtet das Werkstück und nickt: 'Gute Arbeit. Ich muss gestehen, du verstehst dein Handwerk. Unglücklicherweise, redest du zu viel.'";
VisionTextDE[3][8]="Der Mann zieht einen roten Dolch und beide Schatten verschwinden.";
VisionTextEN[3]={};
VisionTextEN[3][1]="The shades of a man and a dwarf appear next to the workbench. Both are working on the same piece of work. The dwarf complains to the man: 'This will never work that way. Let me show you how you have to do it.'";
VisionTextEN[3][2]="The man steps back and looks at the dwarf while the dwarf swings his hammer against the piece. 'You see? You have to hit as I do', the dwarf says.";
VisionTextEN[3][3]="The dwarf continues 'I am wondering why we are here? We could have built this stronghold wherever and not here at this nasty place.'";
VisionTextEN[3][4]="'You are not paid to ask questions', the man replies. 'Do your work as you are supposed to do.'";
VisionTextEN[3][5]="The dwarf hisses: 'And you? What are you doing?' The man replies quietly: 'You will see later.'";
VisionTextEN[3][6]="'Arr, so, why? You are looking for magical stones, aren't you? And what are those engravings for on the column over there?', the dwarf asks as he shows the man the finished piece of work.";
VisionTextEN[3][7]="The man examines the piece of work and nods: 'Very well done. I have to admit, you understand your profession. Unfortunately, you talk to much.'";
VisionTextEN[3][8]="The man draws a red dagger and both shades fade away.'";

VisionTextDE[4]={};
VisionTextDE[4][1]="Es scheint als ob zwei Männer neben einen kleinen Boot am Strand stehen. Einer sagt zu dem anderen in einer vergänglichen Stimme: 'Wer dachte, dass es so enden wird? Alles verloren. Er war so mächtig und nichts ist übrig geblieben von seiner Macht. Alles weg.'";
VisionTextDE[4][2]="'Niemand, schätze ich.' Der andere Mann seufzt und setzt fort: 'Er war sich wahrscheinlich seiner Sache zu sicher. Ich sagte ihm, er soll sie nicht trennen, aber er wollte nicht auf mich hören. Eine Schande.'";
VisionTextDE[4][3]="'Wo wirst du hingehen, mein Freund?', fragt der Mann als dem anderen und hilft, das Boot bereit zu machen.";
VisionTextDE[4][4]="'Keine Ahnung, wirklich, keine Ahnung', erwidert der andere Mann am Strand. 'Und du? Hast du eine Idee?'";
VisionTextDE[4][5]="Der Mann zeigt in den Nordosten: 'Ich habe von einer kleinen Insel im Nordosten gehört. Ich werde wahrscheinlich das nächste Schiff dorthin nehmen, aber ich habe das noch nicht beschlossen.'";
VisionTextDE[4][6]="Der andere Mann nickt und springt in das Boot. 'Wo auch immer du hingehst, ich wünsch dir nur das Beste. Pass auf dich auf. Wenn die Götter wollen, werden wir uns wieder sehen' sagt er und drückt das Boot ins Meer.";
VisionTextDE[4][7]="Der Mann nickt und winkt. 'Ich hoffe es. Eine letzte Frage noch. Hast du je versucht unten auf dem Thron zu sitzen?'";
VisionTextDE[4][8]="'Nein, niemals. Es hätte nicht zweimal geklickt. Ich bin wesentlich schwerer als er es je war.";
VisionTextDE[4][9]="Der Mann grinst. 'Ich verstehe! Leb wohl!'";
VisionTextDE[4][10]="Die Vision der beiden Männer verschwindet.";
VisionTextEN[4]={};
VisionTextEN[4][1]="It seems as though two men stand next to a small boat at the shore. One says to the other in a fading voice: 'Who would have thought it would end this way. All lost. He was so powerful but nothing is left of his power. All gone.'";
VisionTextEN[4][2]="'No one, I guess.' The other man sighs and continues: 'He was probably too confident about it. I told him not to split them but he did not want to listen to me. A shame.'";
VisionTextEN[4][3]="'Where will you go, my friend?', the man asks as he helps the other to prepare the boat.";
VisionTextEN[4][4]="'No idea, really no idea', the other man on the shore replies. 'And you? Do you have any idea?'";
VisionTextEN[4][5]="The first man points to the north east: 'I heard about a small island north east from here. I might head there with the next ship, but I haven't decided yet.'";
VisionTextEN[4][6]="The other man nods and jumps into the boat. 'Wherever you go, I wish you all the best. Take care. If our gods will, our paths might cross again', he says and pushes his boat off into the sea.";
VisionTextEN[4][7]="The man nods and waves. 'I hope so. One last question. Have you ever tried to sit at the throne down there?";
VisionTextEN[4][8]="No, never. It would not have clicked twice. I have much more weight than he had.";
VisionTextEN[4][9]="The man grins. 'I see! Farewell!'";
VisionTextEN[4][10]="The vision of both men fades away.";

VisionTextDE[5]={};
VisionTextDE[5][1]="Ein Mann wirkt als würde er schreibend beim Tisch sitzen als er erscheint, während ein anderer den Raum betritt. 'Sie sagten mir, du willst mich sprechen. Was ist passiert?'";
VisionTextDE[5][2]="Der Mann am Tisch blickt auf und dreht sich zu dem anderen. 'Wir haben verloren. Ich weiß nicht wie, aber er hat verloren'.";
VisionTextDE[5][3]="Der andere Mann wirkt geschockt und fragt: 'Bist du dir sicher? Wo hast du diese Information her?'";
VisionTextDE[5][4]="'Meine Quellen liegen nie falsch. Du glaubst mir besser. Wir müssen alles vorbereiten', erwidert der Mann am Tisch.";
VisionTextDE[5][5]="'Du meinst, die wissen über uns Bescheid?' 'Nein, noch nicht. Aber ich denke, es ist nur eine Frage der Zeit bis sie uns hier finden. Wir müssen alles vorbereiten und verschwinden. Es ist vorbei.'";
VisionTextDE[5][6]="Der andere Mann nickt 'Bleiben wir beim Plan oder hast etwas anderes vor?'";
VisionTextDE[5][7]="Der Mann am Tisch blickt auf das Pergament: 'Alles niederzubrennen mag eine schlechte Idee sein. Der Rauch würde uns verraten und sie direkt zu uns führen.' Er hält für einen Augenblick ein bevor er fortfährt: 'Es ist besser, so viel wie möglich im Meer zu versenken.'";
VisionTextDE[5][8]="'Und diese.../Schlüssel/?', fragt der andere nervös.";
VisionTextDE[5][9]="Der Mann am Tisch wartet erneut kurz: 'Es wäre eine Schande, oder?' Er blickt gedankenvoll auf die Pergamente und wendet sich schlußendlich wieder dem anderen Mann zu: 'Versteck sie getrennt irgendwo, wo niemand sie suchen wird.'";
VisionTextDE[5][10]="Der andere Mann blickt verwirrt bis der Mann am Tisch sagt: 'Steck sie zu den Toten. Dort wird sie niemand suchen, falls sie ein wenig Anstand haben.'";
VisionTextDE[5][11]="Der andere Mann erwidert 'Falls!', dreht sich weg und verlässt den Raum schnell. Der Schatten des Mannes am Tisch verschwindet ebenfalls.";
VisionTextEN[5]={};
VisionTextEN[5][1]="A man seems to sit writing at a table whilst another appears to enter the room. 'They say you want to talk to me. What happened?'";
VisionTextEN[5][2]="The man at the table looks up and turns to the other one. 'We are lost. I do not know how but he lost'.";
VisionTextEN[5][3]="The other one looks shocked and asks: 'Are you sure? Where do you have this information from?'";
VisionTextEN[5][4]="'My sources are never wrong. Better believe me. We have to prepare everything', the man on the table replies.";
VisionTextEN[5][5]="'You mean, they know about us?' 'No, not yet. I, however, think it is only a question of time until they find us here. We have to prepare everything and leave. It is over.'";
VisionTextEN[5][6]="The other man nods 'Do we stick to the plan or do you have something else in mind?";
VisionTextEN[5][7]="The man at the table looks back over the parchment: 'Burning everything might be a bad idea. The smoke will betray us and lead them directly to us.' He pauses a second before he continues: 'It is better to sink as much as possible into the sea.'";
VisionTextEN[5][8]="'And those.../keys/?', the other one asks nervously.";
VisionTextEN[5][9]="The man at the table pauses again for a second. 'It would be a shame, wouldn't it?' He looks thoughtfully at the parchments and turns to the other man finally: 'Hide them separately, somewhere where no one is looking for them.'";
VisionTextEN[5][10]="The other man looks puzzled until the man at the table says: 'Put them with the dead ones. They are not going to look for them there, not if they have any decency.'";
VisionTextEN[5][11]="The other man replies 'If!', turns and leaves the room quickly. The shade of the man at the table also fades away.";

VisionTextDE[6]={};
VisionTextDE[6][1]="Zwei Männer erscheinen und sind dabei, die Kammer zu reinigen. Einer fragt den anderen: 'Und er fürchtet nicht, dass einer ihn betrügen würde?'";
VisionTextDE[6][2]="'Es scheint nicht so. Andererseits, es hat einen Grund warum sie die Vertrauten genannten werden', erwidert der andere Mann.";
VisionTextDE[6][3]="'Lass uns annehmen, er hat ihnen vertraut, dann bleibt immer noch die Frage offen, ob sie überhaupt in der Lage waren, sie zu verwenden?, fährt der erstere fort zu fragen.";
VisionTextDE[6][4]="Der andere Mann zuckt mit den Schultern: 'Ich hoffe es für ihn. Ich hoffe es für uns! Stell dir seinen Ärger vor, falls einer verloren geht.' Er lacht. 'Wie dem auch sei, du scheinst dich nicht zu fürchten, oder?'";
VisionTextDE[6][5]="Der erstere Mann schüttelt den Kopf: 'Nein, ich fürchte mich nicht. Ich versteh nur den Plan nicht. Ich meine... Es gibt sieben von ihnen. Wir... Er hat vier. Somit sind drei übrig und niemand weiß irgendetwas über sie. Was ist, wenn jemand nur auf einen /Fehler/ von ihm wartet. Nichts würde leichter sein, als sich einen nach dem anderen zu schnappen, jetzt, wo er sie getrennt hat. Verstehst du?'";
VisionTextDE[6][6]="'Was zerbrichst du dir da den Kopf darüber?, zischt der andere zurück. 'Die anderen sind wahrscheinlich genauso verteilt und warum sollten wir Zeit verschwenden, anstelle uns zu nehmen, was wir so schnell wie möglich besitzen können? Wer soll uns stoppen? Wir haben Albar geschlagen, wir haben Salkamar geschlagen und wir sind dabei Lor-Angur zu schlagen. Nur einer von Narguns Tricks kann uns dabei behindern, aber nicht mehr stoppen!'.";
VisionTextDE[6][7]="'Vielleicht hast du recht', antwortet der erstere während er mit dem Reinigen weiter macht.";
VisionTextDE[6][8]="'Vielleicht? Ha! Ich habe immer recht!' Sein Lachen schallt durch die Kammer und beide Schatten verschwinden wieder.";
VisionTextEN[6]={};
VisionTextEN[6][1]="The shades of two men appear, who clean the chamber. One of them asks the other one: 'And he is not scared one of them would betray him?'";
VisionTextEN[6][2]="'It does not seem so. On the other hand, there is a reason why they are called the Trusted Ones', the other man replies.";
VisionTextEN[6][3]="'Let's assume he can trust them, there is still the question left, are they even able to handle them?', the former continues to ask questions.";
VisionTextEN[6][4]="The other man shrugs: 'I hope so, for his sake. I hope for us! Imagine his anger if one of them gets lost.' He laughs. 'However, it seems you are scared, are you?'";
VisionTextEN[6][5]="The former man shakes his head: 'No, I am not. I just do not understand his move. I mean... There are seven of them. We... He has four. So, there are three left and no one knows anything about them. What if someone is just waiting for such a /mistake/ by him? Nothing would be easier then to pick up one after the other, now, he has separated them. Do you understand?'";
VisionTextEN[6][6]="'Why do you worry about that?', the other one hisses back. 'The others are likely separated as well and why should we waste time instead of taking what we can possess as quickly as possible? Who should stop us? We beat Albar, we beat Salkamar and we are about to beat Lor-Angur. Only one of Nargun's tricks might hinder us, but it cannot stop us anymore!'";
VisionTextEN[6][7]="'Probably, you are right', the former one replies as he continues cleaning.";
VisionTextEN[6][8]="'Probably? Ha! I am always right!' His laughter rings through the chamber and both shades fade away.";

attendants={}
attendants2={}

function M.vision(char,TypeStory)
--debug("3: "..TypeStory)
	local LineStory = char:getQuestProgress(664)
	attendants[char.name] = world:getPlayersInRangeOf(position(940,200,0), 90)
	if attendants[char.name] ~= nil then
			for k,player in ipairs(attendants[char.name]) do
				if (areas.PointInArea(player.pos,evilrock.EvilRockAreaNames[TypeStory])) then
--					player:inform(""..VisionTextDE[TypeStory][LineStory],""..VisionTextEN[TypeStory][LineStory])
					common.InformNLS(player,VisionTextDE[TypeStory][LineStory],VisionTextEN[TypeStory][LineStory])
--debug("ThereOn0: "..player.name)
				else
--debug("NotThereOn0: "..player.name)
				end

			end
	else
--debug("attendants0:nil ")
	end

	attendants2[char.name] = world:getPlayersInRangeOf(position(940,200,-6), 90)
	if attendants2[char.name] ~= nil then
			for k,player in ipairs(attendants2[char.name]) do
				if (areas.PointInArea(player.pos,evilrock.EvilRockAreaNames[TypeStory])) then
--					player:inform(""..VisionTextDE[TypeStory][LineStory],""..VisionTextEN[TypeStory][LineStory])
					common.InformNLS(player,VisionTextDE[TypeStory][LineStory],VisionTextEN[TypeStory][LineStory])
--debug("ThereOn-6: "..player.name)
				else
--debug("NotThereOn-6: "..player.name)
				end

			end
	else
--debug("attendants-6:nil ")
	end
end




M.darkColumnEvilrock={position(967,171,0),position(969,171,0),position(971,171,0),position(967,175,0),position(969,175,0),position(971,175,0)}
M.darkColumnEvilrockLight={position(967,171,1),position(969,171,1),position(971,171,1),position(967,175,1),position(969,175,1),position(971,175,1)}
M.darkColumnEvilrockFlame={467,467,467,467,467,467}
CheckLightOnColumnIsThere={}
enabledAttendantsForPuzzle={}


gemsRequired={197,284,45,197,284,45}


function M.UseDarkColumns(User, SourceItem, ltstate)

	if User:getQuestProgress(667) >= 1 or world:getItemOnField(SourceItem.pos).id == 467 then
		return
	end

	local AmountDarkColumnEvilrock = #M.darkColumnEvilrock
  	for i = 1,AmountDarkColumnEvilrock do
		if (SourceItem.pos == M.darkColumnEvilrock[i]) and User:countItemAt("all", gemsRequired[i], {["gemLevel"]="1"}) >= 1 then
--			local howmuchisit = User:countItemAt("all", 284)

			local foundSource
	-- check for dark column
			TargetItem = M.darkColumnEvilrock[i];
			if (TargetItem ~= nil) then
				common.TurnTo( User, M.darkColumnEvilrock[i] ); -- turn if necessary
				foundSource=true
			end

			if ( ltstate == Action.none ) then
				User:startAction( 20, 21, 5, 28, 55);
--				User:startAction( 20, 21, 5, 13, 25);
				User:talk(Character.say, "#me setzt einen magischen Edelstein in die Säule ein.", "#me sets a magical gem into the column.")
				world:gfx(52,M.darkColumnEvilrockLight[i])
				world:createItemFromId( M.darkColumnEvilrockFlame[i], 1, M.darkColumnEvilrock[i], true, 666, nil)
				User:eraseItem(gemsRequired[i],1, {["gemLevel"]="1"})
			end

			for j = 1,AmountDarkColumnEvilrock do
				local CheckLightOnColumn = world:getItemOnField(M.darkColumnEvilrock[j])
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
				world:gfx(5,M.darkColumnEvilrock[l])
				world:makeSound(27,M.darkColumnEvilrock[l])
			end

			BlackColumnQuestProgressA(User)

		elseif SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", gemsRequired[i]) >= 1 then
			common.InformNLS(User,"Der Edelstein lässt sich einsetzen, aber er scheint nicht der Richtige zu sein. Vielleicht versuchst du einen Anderen.","Your gem seems to fit but for some reason it does not seem to be the right one.")
		elseif SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", 285) >= 1 or SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", 285) >= 1 or SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", 283) >= 1 or SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", 45) >= 1 or SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", 46) >= 1 or SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", 197) >= 1 or SourceItem.pos == M.darkColumnEvilrock[i] and User:countItemAt("all", 198) >= 1 then
			common.InformNLS(User,"Diese Art von Edelstein scheint nicht zu passen. Vielleicht versuchst du eine andere Art.","This kind of gem does not seem to fit. You might want to try a different one.")
		elseif SourceItem.pos == M.darkColumnEvilrock[i] then
			common.InformNLS(User,"Keiner deiner Gegenstände scheint zu passen.","None of your items seem to fit.")
		end
	end
end


function BlackColumnQuestProgressA(User)
	enabledAttendantsForPuzzle[User.name] = world:getPlayersInRangeOf(position(969,172,0), 10)
	for m,player in ipairs(enabledAttendantsForPuzzle[User.name]) do
		if (areas.PointInArea(player.pos,evilrock.EvilRockAreaNames[2])) then
			player:setQuestProgress(667,1)
			common.InformNLS(player,"Eine Stimme sagt: 'Flammen, die Welt steht in Flammen!' Anschließend ist ein Summen zu hören und selektierbare Runen erscheinen an den schwarzen Säulen.","A voice says: 'Fire, the world is on fire!' A hum can be heard afterwards and selectable runes appear on the black columns.")
		else
		end
	end
end


function BlackColumnQuestProgressB(User,QuestStatusBlackColumn)
	enabledAttendantsForPuzzle[User.name] = world:getPlayersInRangeOf(position(969,172,0), 10)
	for m,player in ipairs(enabledAttendantsForPuzzle[User.name]) do
		if (areas.PointInArea(player.pos,evilrock.EvilRockAreaNames[2])) then
			if QuestStatusBlackColumn == 16 then
				common.InformNLS(player,"Eine Stimme ruft: 'Flammen, die Welt steht in Flammen!'. Das Summen verstärkt sich anschließend.", "A voice shouts: 'Fire, the world is on fire!' The hum intensifies afterwards.")
			else
				common.InformNLS(player,"Das Summen verstärkt sich als du den magischen Edelstein einsetzt.", "The hum intensifies as you put in the magical gem.")
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
		if (areas.PointInArea(player.pos,evilrock.EvilRockAreaNames[2])) then
			player:setQuestProgress(667,0)
			common.InformNLS(player,"Das Summen bricht ab, die Lichter erlöschen und die Runen an den schwarzen Säulen verschwinden.", "The hum breaks up, lights go out and the runes disappear on the black column.")
			world:makeSound(27,player.pos)
			local AmountDarkColumnEvilrock = #M.darkColumnEvilrock
			for i=1,AmountDarkColumnEvilrock do
				local DarkColumnEvilrockLightErase = world:getItemOnField(M.darkColumnEvilrock[i])
				if DarkColumnEvilrockLightErase.id == 467 then
					world:erase(DarkColumnEvilrockLightErase,DarkColumnEvilrockLightErase.number)
					world:gfx(45,M.darkColumnEvilrockLight[i])
				end
			end
		else
		end
	end
end


function M.UseDarkColumnsPuzzle(User, SourceItem, ltstate)

	local AmountDarkColumnEvilrock = #M.darkColumnEvilrock
  	for i = 1,AmountDarkColumnEvilrock do
		if (SourceItem.pos == M.darkColumnEvilrock[i]) and User:getQuestProgress(667) >= 1 and world:getItemOnField(SourceItem.pos).id == 467 then

			local foundSource
	-- check for dark column
			TargetItem = M.darkColumnEvilrock[i];
			if (TargetItem ~= nil) then
				common.TurnTo( User, M.darkColumnEvilrock[i] ); -- turn if necessary
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
puzzleOptionsEN[5]="Breathing the mortal's heat,"
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
	local Amountoptions = #puzzleOptionsDE
	local QuestStatusBlackColumn = User:getQuestProgress(667)
	local TrueOption = math.random(1,3)

	if (SourceItem.pos == M.darkColumnEvilrock[puzzleDarkColumnOrder[QuestStatusBlackColumn]]) then
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
		dialog = SelectionDialog("Schwarze Säulen Rätsel", "Triff deine Wahl, aber sei vorsichtig. Bei einer flaschen Antwort musst du wieder von vorne beginnen.", callback)
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

function M.beamMeDown(User, SourceItem)
	world:makeSound(22,position(975,173,0))
	world:gfx(46,position(975,173,0))
	findPossiblePlayersForBeamMeDown[User.name] = world:getPlayersInRangeOf(position(970,173,0), 8)
	for m,player in ipairs(findPossiblePlayersForBeamMeDown[User.name]) do
		if areas.PointInArea(player.pos,"evilrock6") then
			world:makeSound(13,player.pos)
			world:gfx(37,player.pos)
		end
		if areas.PointInArea(player.pos,"evilrock6") then
			player:warp(position(973,173,-6))
			player:setQuestProgress(667,0)
			common.InformNLS(player,"Das Summen bricht ab und ein Lichtermantel, der dich an einen anderen Ort zieht, umschließt dich.", "The hum breaks up and a coat of light encloses you and pulls you to a different place.")
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

return M
