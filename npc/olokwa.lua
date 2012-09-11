--------------------------------------------------------------------------------
-- NPC Name: Olokwa                                                   Galmair --
-- NPC Job:  Seer                                                             --
--                                                                            --
-- NPC Race: orc                        NPC Position:  392, 178, -6           --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: September 11, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 392, 178, -6, 4, 'Olokwa', 'npc.olokwa', 0, 2, 3, 244, 244, 234, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.state")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.money")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.olokwa", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "=>", 1, ));
talkEntry:addCondition(npc.base.condition.item.item(314, "all", "=>", 1, ));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "=>", 1, ));
talkEntry:addTrigger("seek advice");
talkEntry:addConsequence(npc.base.consequence.inform.inform("The old orc takes the items from you, now he seems ready to answer you any question."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(314, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1, nil));
talkEntry:addResponse("Hurr. Giv me the stuff... and now ask your question to tha ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("He grabs the entrails and tears them apart. He starts to shiver in a very weird way. Then he speaks to you, with a very strange voice..."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("The ancestors prophesy! The one with fire in head will need your help.");
talkEntry:addResponse("Don't trust tha bearer of fur! Your ancintors advice...");
talkEntry:addResponse("They shout! Tha forefathers yell... 'Don't open! Never...'");
talkEntry:addResponse("Your ancestors  say: 'Don't catch a cold and put some warm on!'");
talkEntry:addResponse("Hurr, all easy going today. Nub worry!");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of Axe! Be careful.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of black hound! Stay with your friends and brothers.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of broken Bone...sharpening your blade!");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of bloody skull. You should gather food. Yubba.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of rolling Stone. That means this will be a good day for you!");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of white wolf. Good time for hunting.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of big tooth. Hold eye open, watch up! Especially during sleeping.");
talkEntry:addResponse("Uh! There is lot of Trouble, waiting for your green butt...");
talkEntry:addResponse("Follow the rabbit. Knock-Knock...");
talkEntry:addResponse("Shiny armory! Youbba be in the middle! Carefull now.");
talkEntry:addResponse("Deep drums in the deep. Mes hearing drums!");
talkEntry:addResponse("Don't get stabbed by those horns...!!");
talkEntry:addResponse("Follow youbba nose! Is good.");
talkEntry:addResponse("There one will be! Leading this Tribe! Glorious day come! Honorable Battle! ...maybes you...maybee.");
talkEntry:addResponse("Olokwa saw youbba die!... be brave and it 'll be heroic. Yes!");
talkEntry:addResponse("Blood! ebbrywere Blood. it's yopurs! A true friend shall save you.");
talkEntry:addResponse("Beware tha giant club!");
talkEntry:addResponse("#me chukles. 'Youbba 'll see!'");
talkEntry:addResponse("#me grunts. 'Thuus one it better, if you don't know!'");
talkEntry:addResponse("Har, har! Youbba in deep, deep mudd this time!");
talkEntry:addResponse("Better take a axe with you... when youbba leavin.");
talkEntry:addResponse("The one, close to you, need youb adivce.");
talkEntry:addResponse("Praise your father! Hurry up.");
talkEntry:addResponse("Your future is foggy!Olokwa can't see... only father knows tha true answer!");
talkEntry:addResponse("You forgot something importent.");
talkEntry:addResponse("Your keys in youbba bag, ib you should search those again....");
talkEntry:addResponse("There undone things to finnish, before make further steps.");
talkEntry:addResponse("There two ways. You have tho choose... take the stoney one.");
talkEntry:addResponse("Tha ancestors just dinning. Ask lather again.");
talkEntry:addResponse("Tha ancestors busy with importent ancestor-stuff. Nub interupt with your foolish questions!");
talkEntry:addResponse("Tha big claw be smarter than you think.");
talkEntry:addResponse("Tha pointed teeth became rusty.");
talkEntry:addResponse("One will come and change youbba live! Is good is bad? Who knows...");
talkEntry:addResponse("Schut tha damn gate ib youb walking trough!");
talkEntry:addResponse("Tha raw meat isn't well done yet.");
talkEntry:addResponse("Stone 'll break. Wood'll root. Bone 'll slpash.");
talkEntry:addResponse("Sum litte need your eye just a sekond. And youbba nub see it.");
talkEntry:addResponse("Tha migthy horn ob battle sounds over the mountain!");
talkEntry:addResponse("Ib youbba wanna be successful, put youbba shoes down.");
talkEntry:addResponse("Don't care about the Oomie's words.");
talkEntry:addResponse("In general an' whole in whole... tha answer for all your questions is fourtytwo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seek advice");
talkEntry:addResponse("Indee! But the advice of mine and tha ancestors 'll need two coppercoins! Entrails and ashes from a campfire... uhm 'nd yes, yes a sousage also be needed, he he!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "=>", 1, ));
talkEntry:addCondition(npc.base.condition.item.item(314, "all", "=>", 1, ));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "=>", 1, ));
talkEntry:addTrigger("suche rat");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Der alte Ork nimmt die Gegenstände von dir und scheint nun bereit dir eine beliebige Frage zu beantworten."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(314, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1, nil));
talkEntry:addResponse("Hurr. Gibb mir das Zeug... und stellen jetzt deine Frage an Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Er grabscht die Gedärme und reißt sie auseinander. Sofort beginnt er seltsam zu zittern, dann spricht er mit einer fremdartigen Stimme zu dir..."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Die Ahnen Prophezeien... 'Jener mit Feuer am Haupte, wird deine Hilfe brauchen!'");
talkEntry:addResponse("Nicht Vertraue, dem Träger von Fellen. Die Vorfahren raten es dir...");
talkEntry:addResponse("Sie schreien! Die Vorfahren rufen... 'Nicht öffnen! Niemals...'");
talkEntry:addResponse("Hurr, alles gutt. Heute geht leicht und mühelos!");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von Axt! Sei vorsichtig.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von scharzen Hound! Bleib bei dein Freunde und unter Brüdern.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von gebrochen Knochen! Schleifen dein Klingen scharf, jetzt.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von blutig Schädel. Du solltest sammeln Vorräte, yubba.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von rollende Steine. Das bedeuten, es wird guter Tag für dirr.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von weißer Wolf. Gute Zeit zu Jagen ist jetzt.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von großen Zahn. Halte Auge offen, aufpassen! Gerade wenn du schläfst.");
talkEntry:addResponse("Uh! Mirr sehe viel Ärger.. warten auf dein grünen Hintern.");
talkEntry:addResponse("Folge dem Hasen. Knock-Knock...");
talkEntry:addResponse("Glänzig Rüstung! DU bist mittig drinnen. Vorsicht jetzt!");
talkEntry:addResponse("Trommeln... Trommeln in der Tiefe. Olokwa kann sie höhren.");
talkEntry:addResponse("Stossen dir nix dein Kopf an Decke von Tunnel.");
talkEntry:addResponse("Folgen dein Nase. Das gut.");
talkEntry:addResponse("Einer wird kommen! Diesen Stamm führen. Glorreich Tag kommt. Ehrenreiche Schlacht!... vieleicht du jener bist...vielleicht.");
talkEntry:addResponse("Olokwa hat gesehen, %CHARNAME's Tot. Mut, wenn du bist mutig, es werden heldenhaft. Ja.");
talkEntry:addResponse("Blut! Blut überall. Deines es ist. Ein waherer Freund soll dich retten.");
talkEntry:addResponse("Pass auf die große Keule auf!");
talkEntry:addResponse("#me lacht heißer. 'Du schon sehen wirst!'");
talkEntry:addResponse("#me grunzt. 'Dieses jene du besser niemals wissen wirst.'");
talkEntry:addResponse("Besser du nimmst mit, Axt. Wenn du gehst.");
talkEntry:addResponse("Jener, dir Nahe ist. Brauchen dein Begleitung.");
talkEntry:addResponse("Ehre den Vater! Eilen du dich sollst!");
talkEntry:addResponse("Dein Zukunft in Nebel versunken ist. Olokwa nicht sieht, nur Vater kennt wahre Antwort.");
talkEntry:addResponse("Du vergessen, etwas von Wichtigkeit hast!");
talkEntry:addResponse("Dein Schlüssel in dein Tasche sind, falls du sie suchen solltest wieder...");
talkEntry:addResponse("Es unvollbrachte Taten gibt. Es an dir sie zu gehen, bevor machen neue Schritte.");
talkEntry:addResponse("Dort sind zwei Wege. Du wählen musst... nehme den Steinigen.");
talkEntry:addResponse("Die Ahnen gerade Essen, du fragst später wieder.");
talkEntry:addResponse("Die Ahnen beschäftigt mit wichtig Ahnen-Sache. Du nicht unterbrichst mit deine dumme Fragen!");
talkEntry:addResponse("Die große Kralle klüger ist als du glauben.");
talkEntry:addResponse("Der spitze Zahn wird rostitg.");
talkEntry:addResponse("Jemand kommen wird und ändern dein Leben. Ist gut,  ist schlecht? Wer weiß...");
talkEntry:addResponse("Schmeißen das verdammte Tor zu! Wenn gehen durch!!");
talkEntry:addResponse("Stein brechen wird. Holz morschen wird. Knochn splittern wird.");
talkEntry:addResponse("Etwas, sehr klein. Deinen Blick braucht, nur einen Moment. Aber du nicht siehst.");
talkEntry:addResponse("Mächtiges Horn von Schlacht dröhnt über Berg!");
talkEntry:addResponse("Wenn du Erfolg willst, du ausziehst dein Schuhe aus.");
talkEntry:addResponse("Du nicht hörst auf die Worte von Oomie.");
talkEntry:addResponse("Im Allgemein und überhaupt... alles in alle die Antwort auf alle dein Frage ist Zweiundvierzig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("suche rat");
talkEntry:addResponse("Türlich! Aber Rat von Ahnen und mirr braucht Kupfermünzen... zwei! Gedärm und Asche von Lagerfeuer... uhm 'nd ja, ja ne Wurst brauchen wir auch, he he!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Olokwa the Seer. Keywords: ancestor, seek advice, blindfold, Bragg-Thu, Kroch'Gurak, Norbuk Plateau."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Ask Olokwa for tale about 'ancestor', or 'seek advice'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Olokwa der Seher. Schlüsselwörter: Ahnen, suche Rat, Augenbinde, Bragg-Thu, Kroch'Gurak, Norbuk Plateau."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Frage Olokwa nach Geschichte von 'Ahnen' oder 'suche Rat'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("stop");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Hrm, mes should tell anoter tale?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stop");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("Hrm, mirr soll erzählen etwas anderes?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addTrigger("continue");
talkEntry:addResponse("Wich tale mes should tell?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addTrigger("weiter");
talkEntry:addResponse("Welche Geschichte Olokwa, soll erzählen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addTrigger("ancestor");
talkEntry:addTrigger("ancestry");
talkEntry:addTrigger("forefather");
talkEntry:addTrigger("tale");
talkEntry:addResponse("Should mes tell tale about- Cherga, Chief Veralion, Kaja Wolfagen, Gabon Corad, Kurga Wolfbane, Warlord Retlak, General Grivijak, Borgrud or Chief Rugh'toh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addTrigger("ahnen");
talkEntry:addTrigger("vorfahren");
talkEntry:addTrigger("Erzählung");
talkEntry:addTrigger("Geschichte");
talkEntry:addResponse("Olokwa soll berichten die Erzählung von - Cherga, Chief Veralion, Kaja Wolfagen, Gabon Corad, Kurga Wolfbane, Warlord Retlak, General Grivijak, Borgrud oder Chief Rugh'toh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("veralion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkEntry:addResponse("Chief Veralion was one of the first chiefs and founding fathers of the original clan. Under his reign, the clan saw it's most prosperous and productive years...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...His efforts helped keep the clan together in times both thick and thin. In life, he was honorable, well respected by fellow clansmen, and revered as a great savior of our kin. Rest in peace, old friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("veralion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkEntry:addResponse("Chief  Veralion einer der Ersten war. Gründervater von erste Klan, Stamm von Orks.  Unter  seiner Herrschaft, Stamm erlebt gedeihende und großartige Jahre...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Er hielt Brüder und Schwester zusammen, stehen gemeinsam durch dick und dünn Dunkelste Zeit über Gobaith kam, doch Veralion gegangen gloreichste Pfade. Sein Leben ehernhaftest war, doch nun er schon lange ruht in Land der Ahnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Kaja");
talkEntry:addTrigger("Wolfagen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkEntry:addResponse("Kaja Wolfagen was one of the greatest Shamans to ever live on the island of Gobaith. His teachings of our father installed great knowledge...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addResponse("...into the clansmen of the time. Many looked up to this orc with great respect. He had seen much in his days of life, which clearly showed in his ragged old form...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...During the Northerot wars, his magics helped create a lasting impression of power and glory for the clan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kaja");
talkEntry:addTrigger("Wolfagen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkEntry:addResponse("Kaja Wolfagen einer von größte Schamanen war, welcher je gelebt auf Insel Gobaith. Er gelehrt sein Brüder und Schwestern großes Wissen über unser aller Vater...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Ungezählte sahen auf zu diesem mächtigen Ork, mit größtem Respekt. Im  Northerot-Krieg, seine überlegenen Zauber kreieren einen bleibenden Abdruck von Kraft und Ruhm unseres Stammes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gabon");
talkEntry:addTrigger("Corad");
talkEntry:addResponse("Gabon Corad maintained the Clan until Warrior Queen Kurga Wolfbane assumed control of the Clan as it's first 'chiefess'. He currently serves as Red Skull as the eldest and most respected Bloodskull.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gabon");
talkEntry:addTrigger("Corad");
talkEntry:addResponse("Gabon Corad beaufsichtigte den Klan als Kriegerkönigin Kurga Wolfbane als erstes Weib Stammesanführerin wurde. Nun er hat den Rank eines Rotschädels! Er älteste und meißt respektierter Bloodskull!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Kurga");
talkEntry:addTrigger("Wolfbane");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 8));
talkEntry:addResponse("Warrior Queen Kurga Wolfbane, murdered by a clanman known as Zub. She was betraid and ambushed by Zub and several humans and elves...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 8));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Under her short term leadership, the Orc Cave was expanded and Orcs recruited. May she rest well with the greatest honor an orc can recieve.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kurga");
talkEntry:addTrigger("Wolfbane");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 8));
talkEntry:addResponse("Kriegerkönigin Kurga Wolfbane, ermordet wurde von Klanbruder 'Zub'. Er verraten hat Kurga, and Menschen und Elfen, in Hinterhalt...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 8));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Auch wenn Herrschaft nur kurz, sie gegraben neue Kammern in Höhle und aufgenommen viele junge Orks. Ihre Knochen sollen erfahren größte Ehre, einem Ork möglich ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Warlord");
talkEntry:addTrigger("Retlak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkEntry:addResponse("Warlord Retlak! His name stood for the strength and superiority of the Orcs. His name was mentioned with respect by Orcs and spoken with fear by others...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 10));
talkEntry:addResponse("...All beings of the human town as well as the desert town hold their breath when the Warlord entered the gates. The warlord lived for many, many years on the island...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...He fought side on side with Gabon Corad and Gort called 'Crunk'. Even today many people will remember the warlord's name, even many years after his death. The Orcs honor Retlak during his live.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Warlord");
talkEntry:addTrigger("Retlak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkEntry:addResponse("Kriegsherr Retlak! Dieser Name steht für Stärke und Überlegenheit von Orks. Dieser Name ausgesprochen in Respekt von Orks und in Angst von anderen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 10));
talkEntry:addResponse("...Jeder, in Menzchen-Stadt und Wüsten-Stadt angehalten Atem, wenn Retlak treten durch Tore. Viele Jahre er gelebt auf Insel Gobaith...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 11));
talkEntry:addResponse("...Kämpfen Seite an Seite mit Gabon Corad, und Gort - genannt 'Crunk'. Auch zu Tage heutig noch, viele Leute erinnern an Name von dem Kriegsherren...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 11));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Auch wenn viel Zeit vergangen seit sein Tod. Alle Orks ehren sollen Retlak für sein Leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("General");
talkEntry:addTrigger("Grivijak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 12));
talkEntry:addResponse("General Grivijak! Compared to the warlord Retlak, General Grivijak lived on Gobaith for a quite short time only. However, in his given time...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 12));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 13));
talkEntry:addResponse("...he became the strongest warrior of the whole island. He used his strength and wisdom to unite the Orcs with help of Gabon Corad. There are rumors about his disappearnce...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 13));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Some say he just left the island. Others say a horde of mighty demon beasts were able to strike him down with help of magic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("General");
talkEntry:addTrigger("Grivijak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 12));
talkEntry:addResponse("General Grivijak! Verglichen mit Kriegsherr Retlak, Grivijak gelebt für kruze Zeit auf Gobaith. Falls-jeden er war...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 12));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 13));
talkEntry:addResponse("...stärkster Krieger auf ganze Insel. Mit sein Stärke und Klugheit er geeint und gesammelt den Stamm der Orks, gemeinsam mit Gabon Corad. Über sein verschwinden Gerüchte wild...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 13));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Einer sagt er gereist auf großer Kontinent. Anderer sagt, mächtige dämonische Bestien ihn umgebracht mit magische Hilfe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Borgrud");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 14));
talkEntry:addResponse("Borgrud, called Bor, was a loyal warrior of great strength, who was surrounded and attacked by the cowardly humans of Trollsbane...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 14));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkEntry:addResponse("...They bound him with ropes, but he broke free, and shouting his last word 'FREE!' charged into them. He was killed that day, infront of his own daughter Krebla's eyes...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 15));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...His example shows that the orcs cannot be held down, and after the horde spilled the blood of his murderers on the city streets we gained the respect and fear that the orcs deserve.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgrud");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 14));
talkEntry:addResponse("Borgrud, genannt Bor, loyaler mächtiger Krieger war. Er eingekreist von feige Menzchen von Trollsbane, versklaven sie wollten ihn...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 14));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkEntry:addResponse("...Sie fesselten ihn mit Seilen, doch er zerriß sie! Er brüllt 'Freiheit!', und dann ermordet wird vor Augen seine Tochter Krebla. Sein Heldenmut zeigen daß Orks dienen niemand...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 15));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...besonders nach dem der Klan das Blut seiner Mörder über die Straßen der Stadt verteilt getan hat. Hurr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rugh'toh");
talkEntry:addTrigger("Rugh");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 16));
talkEntry:addResponse("Chief Rugh'toh is a true Orcen Hero. Warrior, Lokh'um and brother...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 16));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 17));
talkEntry:addResponse("...In failure and Victory, he was a true Orc. He fought against the Grey Refuge and spent a year in jail due to human betrayal...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 17));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkEntry:addResponse("...He reformed the Orc Clan up from the ashes of the bloodskulls and created the largest clan known, the Dark'rest Clan. He expanded the cave defenses with the building of the Gates...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 18));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...And the Hall of Ancestors was built under his reign as well as the Jail. Then the Klan was able to fought a stunning victory against the dwarves of Silverbrandt after a year long war, under his leadership.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rugh'toh");
talkEntry:addTrigger("Rugh");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 16));
talkEntry:addResponse("Chief Rugh'toh ein wahrer Held ist. Krieger, Lokh'um und Bruder...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 16));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 17));
talkEntry:addResponse("...Im Fehl und Sieg, er wahrer Ork war. Er kämpfte Graue Brug, verbracht ein Jahr in Gefangenschaft. Dann  er erneuern Klan aus Asche der Bloodskulls...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 17));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkEntry:addResponse("...Es der größte Klan war, man weiß von! Der Klan vom Berg Dark'rest. Rugh gebaut mächtige Tore von Orkhöhle, Halle der Ahnen und Kerker!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 18));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...Dann der Klan errungen glorreicher Sieg über Zwerge von Silberbrandt, nach Jahre langen Krieg unter seinem Befehl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ice witch");
talkEntry:addTrigger("icy witch");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Cherga, the icy witch! Escorts the dead through the nothing, the eternal rift between the worlds, into the land of the ancestors. If an orc has defeated many enemies in battle and was strong in his lifetime...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addResponse("...his reputation there will be vast, and his ancestors will honor him. He will have many servants and slaves, and the woman will love him....");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("continue");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...If he was weak and cowardly, he will spend his time there as a servant, perhaps even as a servant of a human, halfling, or dwarf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Cherga, the icy witch! Escorts the dead through the nothing, the eternal rift between the worlds, into the land of the ancestors. If an orc has defeated many enemies in battle and was strong in his lifetime...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eis Hex");
talkEntry:addTrigger("eisige Hexe");
talkEntry:addTrigger("eishex");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Cherga, die eisige Hexe! Führt die Toten durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf besiegt hat und in seinem Leben stark war...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Cherga, die eisige Hexe! Führt die Toten durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf besiegt hat und in seinem Leben stark war...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkEntry:addResponse("...ist sein Ansehen dort groß, und seine Ahnen werden ihn ehren. Er bekommt viele Diener und Sklaven, und die Weiber werden ihn lieben...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addTrigger("weiter");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addResponse("...War er schwach und feige, so wird er dort ein Dasein als Diener fristen müssen, wohlmöglich gar als Diener eines Menschen, Halblings oder Zwergen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addTrigger("Good night");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. seeking advice, do you?");
talkEntry:addResponse("#me wears a blindfold. Altough he truns his head to you. '%CHARNAME...'");
talkEntry:addResponse("I knew you would come here...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. suchst du Rat? Tust du?");
talkEntry:addResponse("#me's Augen sind verbunden, dennoch dreht er den Kopf in deine Richtung. '%CHARNAME...'");
talkEntry:addResponse("Ich wusste du herkommst, hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. seeking advice, do you?");
talkEntry:addResponse("#me wears a blindfold. Altough he truns his head to you. '%CHARNAME...'");
talkEntry:addResponse("I knew you would come here...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. suchst du Rat? Tust du?");
talkEntry:addResponse("#me's Augen sind verbunden, dennoch dreht er den Kopf in deine Richtung. '%CHARNAME...'");
talkEntry:addResponse("Ich wusste du herkommst, hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farebas.");
talkEntry:addResponse("May the ancestors guide your steps.");
talkEntry:addResponse("Hurr... mes keep n' dull eye on you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Farebas.");
talkEntry:addResponse("Solln die Ahnen deine Schritte lenkn.");
talkEntry:addResponse("Hurr, ich werf n' trübes Auge auf dich. Wannimma ich's entbehrn kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farebas.");
talkEntry:addResponse("May the ancestors guide your steps.");
talkEntry:addResponse("Hurr... mes keep n' dull eye on you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farebas.");
talkEntry:addResponse("Solln die Ahnen deine Schritte lenkn.");
talkEntry:addResponse("Hurr, ich werf n' trübes Auge auf dich. Wannimma ich's entbehrn kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Nott important! Better think ob you ancestors. Did you do your sacrifices today?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Nicht, gar wichtig. Besser denke an deine Ahnen. Hasst du Ihnen heute schon geopfert?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name, Olokwa is! My Eye only see black and murk, although Olokwa see more than every other.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name, Olokwa ist! Mein Auge nur Düsterniss und Schwärze sieht, trozdem Olokwa sieht mehr, als alle Anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Honor your ancestors. It's a task, which will takes you your whole live.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ehre deine Ahnen. Dies Aufgabe ist, welche dauert dein Leben lang.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Honor your ancestors. It's a task, which will takes you your whole live.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ehre deine Ahnen. Dies Aufgabe ist, welche dauert dein Leben lang.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I Olokwa the seer is! My Eye only see black and murk, although Olokwa see more than every other.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich Olokwa der Seher binn! Mein Auge nur Düsterniss und Schwärze sieht, trozdem Olokwa sieht mehr, als alle Anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I Olokwa the seer is! My Eye only see black and murk, although Olokwa see more than every other.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich Olokwa der Seher binn! Mein Auge nur Düsterniss und Schwärze sieht, trozdem Olokwa sieht mehr, als alle Anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I see water! - And sand. Everywhere. It's the sea...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich sehe Wasser - und Sand! Es ist überall... es ist das Meer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Olokwa know! Mes know you true Name! Mes saw... your ancientors told me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Olokwa weiß! Mirr wissen dein wahre Name. Gesehn... dein Ahnen gesagt mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aug");
talkEntry:addTrigger("auge");
talkEntry:addTrigger("augenbinde");
talkEntry:addResponse("Olokwa's Augen sind tot... Aber er hört die Stimmen der Ahnen. Er befragt die Knochen! Er sieht die eisige Hexe in seinen Träumen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("blind");
talkEntry:addResponse("Olokwa's eyes dead... But he hear tha voice of ancestors. He quizes the bones. He see tha icy witch in his dreams!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blind");
talkEntry:addResponse("Olokwa's Augen sind tot... Aber er hört die Stimmen der Ahnen. Er befragt die Knochen! Er sieht die eisige Hexe in seinen Träumen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eye");
talkEntry:addTrigger("blindfold");
talkEntry:addResponse("Olokwa's eyes dead... But he hear tha voice of ancestors. He quizes the bones. He see tha icy witch in his dreams!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("jag");
talkEntry:addResponse("Hurr! Jag berreh mighte beh! He be a big warrior is.");
talkEntry:addResponse("Hurr... Jag be mighte Red Skull and Drillmasta ob dha Clan! Ib yoo want learn smashing stuff, ask Jag!");
talkEntry:addResponse("Jag smashed all dah Ommies in dah big tournamant, dhus Jag beh First Smasha!");
talkEntry:addResponse("Broddha Jag? Hurr... Meh get dah Day ob Green Growl in mind. Dhat beh slaughta beh! Hurr! Dha Faddha like dhat! Yoo should celebrate dhat day!");
talkEntry:addResponse("#me holds his head: 'Avoid to feel Jag's maces at yoor head!'");
talkEntry:addResponse("Jag hub berreh nice collection, hurr!");
talkEntry:addResponse("Look for meat and bring dhat Jag! Jag beh alwaehs hungreh.");
talkEntry:addResponse("Jag beh proud and honorfull redskull, hurr!");
talkEntry:addResponse("Jag beh fast and strong warrior for dah Fadha and dha Clan!");
talkEntry:addResponse("Jag? Hurr! Mee thinks Jag beh looking for nuw Longears!");
talkEntry:addResponse("Jag? Hurr! Nub speak bad about dah Lok'uhm Murgo in front ob Jag. Jag smash yoor fais odhawise!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jag");
talkEntry:addResponse("Hurr! Jag mächtig ist viel! Er sein wahrrlich ein großer Krieger.");
talkEntry:addResponse("Hurr... Jag seine mächtige Redskull! Und Kampfmeista von derr Klan. Wenn du lerne wolle, zerhauen Zeug? Gehe zu Jag!");
talkEntry:addResponse("Jag zermatscht alle Oomies bei große Turnier, wie Würma. hehe!");
talkEntry:addResponse("Bruddha Jag? Hurr... Mirr erinnere Tag von Green-Growl! Uh! Vatha gemocht das hat! Wirr sollte feiern diese Tag.");
talkEntry:addResponse("#me hält sich den Kopf: ' Du nix hammern dein Schädl gegen Jags Keule!'");
talkEntry:addResponse("Jag hart lustig Sammlung. Har-har! DU fragst Jag.");
talkEntry:addResponse("Jag mag Fleisch. Er imma hunger. hehe!");
talkEntry:addResponse("Jag schnelle, strak Kriega! Für Vatha, für Klan!");
talkEntry:addResponse("Jag? Hurr! Mir denkt er suchen neue Spitzohren tut.");
talkEntry:addResponse("Jag? Hurr! Du nix spreche schlecht uber Murgo, wenn er hört. Sonst er zermatsch dein Fresse! Har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("krazen");
talkEntry:addResponse("Hurr, Krazen nub da smartest orc meh see...'e was kick'd frum his own tribe-set the chiefess clothes on fire!");
talkEntry:addResponse("Krazen? He beh dat stoopid firestarter, yubba?");
talkEntry:addResponse("Hur hur...y'hear? Krazen nub allowed in Borgate's tavern no more...");
talkEntry:addResponse("Yubba, Krazen hab a friend named Grimghor. Meh fink it's his only one.");
talkEntry:addResponse("Yub! You shuld ask Krazen to do a dance fer ya! Funny as hell!");
talkEntry:addResponse("Yub...he's tall, wears dis damn awful metal hat, dirty green robe...Yar, dat's right, he smells too.");
talkEntry:addResponse("Krazen neber be gud warrior...always getting his head stuck in beehives...");
talkEntry:addResponse("Krazen friendly enough, meh fink. Jus' don't make eye contact.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krazen");
talkEntry:addResponse("Hurr, Krazen nix klügster Ork ist. 'r geschmissn aus alte Stamm, alsgezündet Mantel von Chief, mit Feua!");
talkEntry:addResponse("Krazen? Er diese dumme Feua-macha, yubba?");
talkEntry:addResponse("Hur hur... du gehört? Krazen nix darf in Borgates Taverne mehr gehn. Er Verbot.");
talkEntry:addResponse("Yubba, Krazen EIN Freund hat. Ist Grimghor.");
talkEntry:addResponse("Du sollten Fragn, Krazen tanzt furr dirr. Ist große Spass, sehen dars!");
talkEntry:addResponse("Yub.. er gross, tragen verdammtes gutt Helm, schmutzig grün Robe. Uh? yubba.. er stinken.");
talkEntry:addResponse("Krazen nie gewesen gutte Kriega. Aba Kopf imma stecken überall drin...");
talkEntry:addResponse("Krazen gutte Ork ist, mir galubt. Du nur nix blicken in seine Augen. NIx starren ihn an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("murgo");
talkEntry:addResponse("Yes, Murgo. He is honorfull warrior. Important for Orcs. Lot of great doings. Lot of.");
talkEntry:addResponse("Hurr, Murgo hired mes. Like most ob tha othas 'ere. All way from Kroch'gurak!");
talkEntry:addResponse("Murgo, hurr hurr! 'eh honrorables Orc is. Was first played drum. Yubba.");
talkEntry:addResponse(" Murgo 's damn ace is! Ebbry orc wanna like he be.");
talkEntry:addResponse("Yubba. Murgo very proud ob 'is doughtas is... Er'hja 'nd Ol'hja. Be stong 'n smart females are.");
talkEntry:addResponse("Murgo be with Krudash. She 'is female. She be mum ob Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Uh, me guess Murgo hab sumtime hard, with 'is three females. Krudash. 'nd tha doughtas Er'hja 'nd Ol'hja. But all three pretty, yubba!");
talkEntry:addResponse("Murgo best friend be Jag.");
talkEntry:addResponse("Sum Orc joke Murgo, be Flower. Maybe was. But nuw 'eh stump all flowas!");
talkEntry:addResponse(" Murrrgo - dis beh name ob great warriar with great axe! But mes think he nub well in thinking. He be flowery flower orc was! Hurr! But nuw he stomps ob flowry! Harr, harrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addResponse("Jaa, Murgo. Er ehrenvoll Krieger. Einfluss groß, auf Orks. Getahn viele große Taten. Viele.");
talkEntry:addResponse("Yubba, Murgo viel Stolz auf seine Töchta ist. Er'hja 'nd Ol'hja. Stark klugg Weibs sind.");
talkEntry:addResponse(" Murgo mit Krudash ist. Sie sein Weibs sein. Sie Mama von Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Uh, mir glauben Murgo schwer hatt manch mal. Mit drei Weibs! Krudash. 'nd da Töchta Er'hja 'nd Ol'hja. Aba alle drei hübsche Weibs sind. Yubba.");
talkEntry:addResponse("Murgo beste freund ist Jag.");
talkEntry:addResponse("Mancha Orks witzig, sagen Murgo sein Blumens. Vleicht war. Aber jetzt er stampft zer alle Blumens!");
talkEntry:addResponse("Murrgo - dar Name von grosse Kriega, mit grosse Axt. Aber er nix bester in denken. er Blumenork war. Aber jetzt er zerstampfen all Blumens! Harr, harrrr!");
talkEntry:addResponse("Hurr, Murgo gehohlt mirr. Sagen mirr, kommen nach hirr. Wie meiste andere Orks hirr. Ganze lange Weg von Kroch'gurak!");
talkEntry:addResponse("Murgo, hurr hurr! Er Ork mit meißte Ehre ist. erster gewesen, der Trommel hatt.");
talkEntry:addResponse("Murgo verdammte Ass ist. Jede orc wolle sein wie er sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addTrigger("er hja");
talkEntry:addResponse("Er'hja could lucky be. Got tha smart ob 'er mom 'nd ace ob papy. Krudash 'nd Murgo are.");
talkEntry:addResponse("Er'hja was trained by Mo'rurt. And Jag. Brave girl. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkEntry:addResponse("Each Male hope to get Er'hja or Ol'hja as'n female! They good females! Yubba.");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Whelps like Er'hja 'nd Ol'hja cuase musch trouble for tha mum and papy.'");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Mes know 'er since she was such puny, mes could hol'er with un hand!");
talkEntry:addResponse("Funny tale... Er'hjas papy Murgo breeds hounds. But she fear those like rabbitz!");
talkEntry:addResponse("Uh, nub ask mes. Er'hja, she love corbie! Mean they smart. Whubebba, mes say. Corbie be bird. Bird stupid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addTrigger("er hja");
talkEntry:addResponse("Er'hja glücklich sich schätzen kann. Hatt ihre klugg von Mama. Ihre Stil von Papa. Krudash 'nd Murgo sind.");
talkEntry:addResponse("Er'hja gelernt hat bei Mo'rurt. Und Jag. Tapfere, mutig Mädchen. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwesta sind. Yubba, auseehn beinahe wie gleich.");
talkEntry:addResponse("Jede Mann hoffen bekomm Er'hja oda Ol'hja zu Weibs. Sie gutte Weibs sind! Yubba.");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Welpen wie Er'hja 'nd Ol'hja machen vieles Sorge für Mama 'nd Papa.'");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Mirr kenne sie seit sie war winzig kleinig. Mirr konnte halten in eine Hand!'");
talkEntry:addResponse("Lustig geschicht... Er'hjas Papa Murgo züchtn Hounds. Aba Er'hja fürchten diese wie Hasal!");
talkEntry:addResponse("Uh, nix mirr frag. Er'hja, sie lieben Rabe! Sagen sie klugg sind. wasimma, mir sagt. Rabn Vogl sind. Vogl dummig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("ali[czs]");
talkEntry:addResponse("Alize, Gnarh. This bis thus weepy girl at forge. She be Krudash slave is. She hav to smelt you ore.");
talkEntry:addResponse("Nub be weak with those weepy slave. She hab to learn, be strong! Bring tha owner honor! Yubba.");
talkEntry:addResponse("Har! Krudash sacked her 'n sum harbour. Now she be her slave is. But weak weepy one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addResponse("Alize, Gnarh. Sie jammernd Kind bei Schmieda. Sie Krudashs Sklave ist. Sie schmelzn Erz, muss.");
talkEntry:addResponse("Du nix sein schwuach mit diesa jammernde Slkave. Sie lernen muss, zu sein STARK! Machen den Besitza Ehre. Yubba.");
talkEntry:addResponse("Har! Krudash gefangen auf eine Harfen. jetzt Alize, Sklave ist. Aber Jammern viel tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hack sack");
talkEntry:addResponse("Krudash, hurr! She be smart. Got many coin. Got many slave. Got good male. Got brave doughters.");
talkEntry:addResponse(" Hurr. She hold Alize 'nd thos dastardly halfer 's slave. Slave good! Bring 'onor!");
talkEntry:addResponse("She be female ob Murgo. Hurr. He could lucky be about that. Krudash pretty 'nd smart is.");
talkEntry:addResponse("Hurr. Me like 'er nose! Is damn cute. He-he. But nub tell Murgo!");
talkEntry:addResponse("Krudash sell all stuff you need to hack'nd sack. Wellwell. She be owner ob tha Hack'n Sack Shop.");
talkEntry:addResponse("Former she was guard at Embassy to Troll's Bane. She became Murgos female 'nd found Shop - Hack'n Sack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hack sack");
talkEntry:addResponse("Krudash, hurr! Sie klugg. Hat vieles Münz. Hat vieles Sklave. Hat gute Mann. Hat tapfere Tochtas.");
talkEntry:addResponse("Hurr, sie hatt Alize 'nd diese tükke Halbling als Skalve. Sklaven gutt! Machen viel Ehre.");
talkEntry:addResponse("Sie Weibs von Murgo ist. Hurr. Er glucklich sein kann. Krudash hübsch 'nd klugg!");
talkEntry:addResponse("Hurr, mirr mag ihre Nase! Sein süß. He-he. Aber nix  sagst Murgo!");
talkEntry:addResponse("Krudash verkauft alle sachn, du brauchst zum raubn 'nd plündarn. Guttgutt. Sie Besitza von  Hack'n Sack Laden.");
talkEntry:addResponse("Fruha, sie gewesen Wache furr Bootschaft. In Trolls'Bane. Wie sie geworden Murgos Weibs, sie erbaut hat Laden. - Hack'n Sack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("morurt");
talkEntry:addResponse("Mo'rurt. Hurr he be best archer of Clan be. He allway out ob cave huntin!");
talkEntry:addResponse("Mo'rurt shoot 'is arrow fast like wind. Strong like Sea.");
talkEntry:addResponse("Mo'rurt be owner ob Stout. Stout be honorable slave is. Yubba. Got crossbow and joins Mo'rurt on hunting.");
talkEntry:addResponse("Har-ar. Mo'rurt is mulish. But 'e say he's just right. But all'nall he fair master is.");
talkEntry:addResponse("Mo'rurt come frome sum lonly lands. Nub much lived there. Was picked up by Murgo, wehn he walked to Kroch'gurak for winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addResponse("Mo'rurt. Er bester Jäga von Klan ist. erimma draußn ist. Jagt.");
talkEntry:addResponse("Mo'rurt schießt Pfeile, schnell wie wind. Stark wie Meer.");
talkEntry:addResponse("Mo'rurt Besitza von Stout ist. Stout sehr ehrenhaftiga Sklave ist. Yubba. Hat bekommen Armbrust und geht jagen mit Mo'rurt.");
talkEntry:addResponse("Har-ar. Mo'rurt stur wie Esel. Abar mirr sagt, is gutt. Alle in alles, er gerechter Meister ist.");
talkEntry:addResponse("Mo'rurt kommen von einsam Land. Wenig gelebt dort. Murgo ihn gefunden hatt als Mo' nach Kroch'gurak gekommen für den Winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("sogg");
talkEntry:addTrigger("Beermug");
talkEntry:addResponse("Sogg Beermug! Wellwell. He be ace orc is. Allway pay a round ob booze. Allway give Bear for brave warrior.");
talkEntry:addResponse("#me laughs: 'Sogg be tha barrel guard. But most ob time he drink tha guarded booze by him own! Har-har!'");
talkEntry:addResponse("Sogg name also be Beermug. Sogg Beermug!  Make a guess, why for...");
talkEntry:addResponse("Mes hered Murgo picked Sogg up, in some scummy tavern, filled up with beans booze. As he waked up... he was us new barrelguard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sogg");
talkEntry:addTrigger("Beermug");
talkEntry:addResponse("Sogg Beermug! Guttgutt. Er guter Ork ist. Imma geben aus, runde von Booze. Imma gibt Bier zu tapfere Kriegas.");
talkEntry:addResponse("#me lacht: 'Sogg, Fässawächta is. Aba meißte Zeit er saufn alles bewachte Booze allein aus! Har-har!'");
talkEntry:addResponse("Sogg auch heißt Beermug. Sogg Beermug! Du ratest, warum...");
talkEntry:addResponse("Mirr gehört Murgo gefundn Sogg in eine dreckig Taverne. Abgefüllt mit Bohnen-Booze. Als er aufgewacht... er unser neue Fässawächta war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("stout");
talkEntry:addTrigger("Jack");
talkEntry:addResponse("Stout be slave ob Mo'rurt. He good slave. Make tha owner much honor.");
talkEntry:addResponse("Altough he Oomie is, he be allrighty. Stout brave slave. Mo'rurt be proud ob 'hm.");
talkEntry:addResponse("Hurr, Stout strong slave. Nub like thus weepy girl 'nd tha dastardly halfer. Stout 'll earn great honor. Tha otha both earn punsihment.");
talkEntry:addResponse("Stout arrived togetha with Mo'rurt. Me guess Stout be slave since long time.");
talkEntry:addResponse("Me sur Mo'rurt be more to Stout than Masta. Sure both be weird kind ob friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stout");
talkEntry:addTrigger("Jack");
talkEntry:addResponse("Stout Sklave ist von Mo'rurt. Er gutte Sklave. Bringt besitza viele Ehre.");
talkEntry:addResponse("Auch wenn Stout ist OOmie,er allrichtig ist. Er tapfere Sklave. Mo'rurt sehr stolz issigt.");
talkEntry:addResponse("Hurr, Stout stark Sklave ist. Nix wie diese jammernde Mädchen 'nd diese listig Halbling. Stout bekommen Ehre. Die andere Zwei, bekomme Strafe.");
talkEntry:addResponse("Stout gekommn mit Mo'rurt zusamme. Mir denken, er seit lange Zeit Sklave ist.");
talkEntry:addResponse("Mirr sicha sein, Mo'rurt mehr ist, als Meister von Stout. Sucha beide sowas wie Freunde sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addTrigger("thom");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to mix cullet with Krudash's food.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to escape tha mountains. But us hounds hunt 'hm down. Now 'e hab to batter stones.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Watch 'hs tiny fists. He like to smash you beetween legs.");
talkEntry:addResponse("They say, Thoma' Berryar'. He be reason, Murgo'n Krudash nub got more whelps. Whubabba thut mean.");
talkEntry:addResponse("Murgo sacked thus Halfer sumwhere close tha Briar hamlet. Seems it wasn't tha first time for Thoma' Berryar'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addTrigger("thom");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er vermischt Glasscherbn mit Krudashs fressen.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er geflohen durch Berge. Aber unsre Hunde ihn erlegt danieder! Jezt er muss kloppen Steins.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Du im Auge hast sein kleine Fäuste. Er gerne haut dirr zwischen Beine!");
talkEntry:addResponse(" Sie gesagt, Thoma' Berryar'. er Grund ist, Murgo 'nd Krudas nix haben mehr Welpen. Wassimma das heißen.");
talkEntry:addResponse("Murgo geschnappt diese Halbling irgendwohig nahe von Briar Dorf. Scheint es nix erstemal, für Thoma' war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("thud");
talkEntry:addResponse("Hurr hurr. Thud collect trophy. Altough some clumsy. He good Orc.");
talkEntry:addResponse("Thud, is named Thud. *chukles* Cause 'e like to thud people.");
talkEntry:addResponse("Hurr. Thud be dump like mudd. Bud who need brainmuscle, ib you hab huge muscle anyway? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addResponse("Hurr hurr. Thud sammeln Trophäe. Auch wenn er ist nix klügsta, er gutte Ork!");
talkEntry:addResponse("Thud genannt Thud. *lacht kichernd* Weil er mag verkloppen Leutz.");
talkEntry:addResponse("Hurr, Thud dumm wie Dreck ist. Aber wer braucht Denkmuskel, wenn hatt  rießig Muskels sowieso? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addResponse("Bute Booze! Is name ob most famous orc adventurer! He big Travela. Hunta ob several cruel biests!");
talkEntry:addResponse("Brute Booze, drunk Booze in each tavern ob Illarion, he promise! He slay tha giant Snake ob Gynk twice. An' took tha princess ob Khensarra as female!");
talkEntry:addResponse(" 'llrigthy. Brute 's one ob old heros. With feeling for tradition. An' dramatic ob tale!");
talkEntry:addResponse("Uh, I wish I cuold be like Brute Booze. Ib mes wanna 'ere tale ob strange land, mes allways ask 'hm.");
talkEntry:addResponse("They say Brute Booze know lot about strange lands. Surely he traveled trough all ob them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addResponse("Brute Booze! Ist name von meißt berühmte Orkabenteura! er großße REisenda. Jäga von viels schrecklich Bestien!");
talkEntry:addResponse("Brute Booze, gesoffen Booze in jeda taverne von Illarion, er versprechen! Her erschlagen gigantisch Schlange von Gynk zwei malig. Un' genommen Prinzess von Khensarra zu Weibs!");
talkEntry:addResponse("'llgutt. Brute sein eine von alte Helden. Mit Respekt furr Tradition. Und dramatische Geschichte.");
talkEntry:addResponse("Uh, mirr wünschen mirr könnte sein wie Brute Booze. Wenn mir wollen hören Geschicht von fremde Land, mir frägt Brute.");
talkEntry:addResponse("Sie gesagt, Brute Booze wissen viels über fremde Lända. Sicha er gezogen durch alle von ihnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("grimlug");
talkEntry:addResponse("Grimlug be Shaman is. Know many bout gods. Many bout rite.");
talkEntry:addResponse("Hurr. Murgo picked thus shaman up sumwhere 'n Kroch'gurak. Is good 'e here now.");
talkEntry:addResponse("Grimlug talk much. Long tale. Know much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("grimlug");
talkEntry:addResponse("grumlug sein Schamane ist. Wissen viel üba Götta. Viel üba Ritus.");
talkEntry:addResponse("Murgo getrofffen Grimlug, in Kroch'gruak. ist gutt, er jetzt hier ist.");
talkEntry:addResponse("Grimlug erzählen lange. Reden Viel. Weiß viel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("olhja");
talkEntry:addResponse("Ol'hja's tha doughta ob Murgo. She be scout in tha ogretoe-camp. Hurr Hurr.");
talkEntry:addResponse("Ol'hja s one ob most skilled scouts under Captain viggos soldiers.");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olhja");
talkEntry:addResponse("Ol'hja ist Tochta von Murgo. Sie Kundschafta in laga von Ogretoe. Hurr Hurr.");
talkEntry:addResponse("Ol'hja ist eine von beste Kundschafta von Captain Viggos Kriegas.");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwestas sind. Yubba, sie gleich aussehen. Nahezu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("He's a mighty elf. Yubba, his ancestors - I can't find them. There's jus silence... Tja-ha. Weird... like all elfs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er ein mächtiger Elf ist. Yubba, seine Ahnen - ich kann sie nicht finden. Sie schweigen... Tja-ha. Sehr seltsam... wie es alle Elfen sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("He's a mighty elf. Yubba, his ancestors - I can't find them. There's jus silence... Tja-ha. Weird... like all elfs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Er ein mächtiger Elf ist. Yubba, seine Ahnen - ich kann sie nicht finden. Sie schweigen... Tja-ha. Sehr seltsam... wie es alle Elfen sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("In Runewick, the spirits are not calm. Weird things happened there, yes. Hurr, you better stay away from there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("In Runewick, die Geister sind unruhig. Dort seltsame Dinge geschehen sind, ja. Hurr, du dich besser fern hältst von dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Gôsch, I saw the future of the Don... his desteny! It's placed in the middle of a river like a stone, nothing will pull it away.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Gôsch, ich hab die Zukunft des Don's gesehn... Sein Schicksal! Es liegt wie ein Stein im Fluss, und lässt sich nicht mehr verrücken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("This is Galmair! The town inside of mountain and the spirits are strong here. The runes of the dwarvesh are glammerous to the ancestors, yes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Dies issigt Galmair! Die Stadt im Berge und die Geister sind hier stark. Die Runen der Zwerge, sie gefallen den Ahnen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("The ancestors of the human kings are furious! Mes can feel tha shivering of the desert land from far away. Thier tombs are cursed and their corpses are restless.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Die Ahnen der Menschenkönige wutendbrannt sind! Ich spüren das Wüstenland erzittern, schon aus der Ferne. Ihre Gräber verflucht und ihre Leichen ruheloß sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("The ancestors of the human kings are furious! Mes can feel tha shivering of the desert land from far away. Thier tombs are cursed and their corpses are restless.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Die Ahnen der Menschenkönige wutendbrannt sind! Ich spüren das Wüstenland erzittern, schon aus der Ferne. Ihre Gräber verflucht und ihre Leichen ruheloß sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("In the sand of the desert town, there's lurking the dead and the foul. Deep, deep there, be bad spirits, cursing you with illness and pestilence. Grukthâ.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Im Sand der Wüstenstadt, es lauern Tod und Verderben dort. Tief unten, böse Geister graben sich durch die Dünen. Wenn du dort bist, du hohlst dir nur Krankheit und Seuche. Grukthâ.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("This is land of Oomies... -humanz. Orcs don't have to care about such stuff. Better ask mes about Kroch'Gurak! Where Orcs come frome!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Das is Menschnzland... Orks sich nicht kümmern darum. Du besser fragst nach Kroch'Gurak! Wo Orks herkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Scheschnacks! They say there are Orks in Gynk as well! But mes say those monkeys arn't orcs when they never seen the Norbuk Plateau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Scheschnacks! S' heißt dort sind Orkse in Gynk. Aber ich sag, diese Affen sind keine echten Orks, solang sie nichtmal das Norbuk Plateau gesehn habn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("This is land of Oomies... -humanz. Orcs don't have to care about such stuff. Better ask mes about Kroch'Gurak! Where Orcs come frome!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Das is Menschnzland... Orks sich nicht kümmern darum. Du besser fragst nach Kroch'Gurak! Wo Orks herkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("wo her");
talkEntry:addTrigger("kroch gurak");
talkEntry:addTrigger("Kroch'Gurak");
talkEntry:addResponse("Kroch'gurak! Is where most ob us orcs come from. This be the big wintercamp at Norbuk Plateau be!");
talkEntry:addResponse("Kroch'Gurak is located in the West of the Plateau and in winter a lot of tribes gather there to camp. It's a big town of natural and diged caves, filled with many flocks and ressources.");
talkEntry:addResponse("The winter's good time for the young orclings. They do pigshunt and wrestling and choose females! He-he!");
talkEntry:addResponse("Kroch'Gurak! This is THE Ork twon! Filled with orcs and orcs and goats and pigs and much more orcs! You should here the 'Bragg-Thu' And the drums!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("kroch gurak");
talkEntry:addTrigger("Kroch'Gurak");
talkEntry:addResponse("Kroch'gruak! Ist, wo meißte Orks von uns komme her von. Es das große Winterlager vom Norbuk Plateau ist!");
talkEntry:addResponse("Kroch'Gurak ist im Westen von der Hochebene und im Winter viele Stämme versammeln sich dort. Es ist ne große Stadt aus gegrabenen Höhln und natürlichn, befüllt mit vieln Vorätn.");
talkEntry:addResponse("D'Winter is ne gute Zeit für junge Orklinge. Sie machn Scheinshatz und Ringkampf und suchn sich Weiber! Hä-hä!");
talkEntry:addResponse("Kroch'Gurak! Das's DIE Orkstadt! Überfüllt mit Orksen und Orkse und Ziegn und Schweine und noch viel mehr Orks! Du solltest hören wie die Trommln zum 'Bragg-Thu' schlagn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Norbuk");
talkEntry:addResponse("Hurr, long time gone, orcs traveling to Norbuk, the 'Strong Land'. It's big Plateau, splitted by the Black Current. - Cause his water is black in spring.");
talkEntry:addResponse("Once a falcon appeard and led Grubuk Thunderhand, seer of the Bloody Skull Clan down the path to a the 'Strong Land'. Since these days, this land is orc land.");
talkEntry:addResponse("After spans of life of crusader, the old orc tribes found a big strong land. It's surrounded by Armon's Mountains. There's Kroch'Gurak the big winter camp.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Norbuk");
talkEntry:addResponse("Hurr, es lange her gewesen, da Ork wandern nach Norbuk das 'Starke Land'. Es ein große Ebene ist, und es durschnitten vom Schwarzstrom. - Weil seine Wasser sind schwarz im Frühjahr.");
talkEntry:addResponse("Einst ein Falke ist erschienen und er wieß Grubuk Donnerhand, Seher des Bloody-Skull-Clans den Weg, hurr. Den Weg zum Starken Land. Seit diesen Tagen, das Land ein Orkland ist.");
talkEntry:addResponse("Nach Lebensspannen auf Wanderschaft, die alten Orkstämme gefunden haben ein großes strakes Land. Es umkreist ist von Armon's Bergen. Dort liegt Kroch'Gurak, das große Winterlager.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragg-Thu");
talkEntry:addTrigger("Bragg Thu");
talkEntry:addResponse("In winter orks do the poetry! Growling tales about their ancestors! In rythm to drums, the poet, following plenty of comlipcated rules. This be called the Bragg-Thuu!");
talkEntry:addResponse("Bragg-Thuu is about rythm of words, not about melody or rhyme. It's done according to heavy slow drums and tells about tales and legends of the ancestors.");
talkEntry:addResponse("Bragg-Thuu sounds easy to you. But mes never saw a non-ork doin it right. There's plenty of rules you have to follow. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragg-Thu");
talkEntry:addTrigger("Bragg Thu");
talkEntry:addResponse("Im Winter Orks, widemen sich der Dichtung! Sie Lobgesänge gröhlen auf ihre Vorfahren. Im Rythmus von Trommeln, d' Dichter folgt viele komplizierte Regeln. Das ist das Bragg-Thuu!");
talkEntry:addResponse("Bragg-Thuu, es geht um Rythmus von Wörter, nicht um Melodie und Reim. Es wird begeleited von großen schweren Trommeln und erzählt von Legenden und Taten der Ahnen.");
talkEntry:addResponse("Bragg-Thuu leicht aussehn mag, aber es gibt ungezählt viele regeln die man foglen muss. Yubba, hab noch nie nen nicht-Ork gesehn der's richtig hingekriegt hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Orks honor their Ancestors and the gods of his tribe. You go over there and talk to Grumlug! He's Schamane and knows everything about our gods. Tagtha.");
talkEntry:addResponse("Mes seer, so Cherga, the icy witch speaks... and mes listening.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ein Ork ehrt seine Ahnen und die Götter von seinem Stamm. Du gehst rüber und sprichst mit Grimlug! Er's Schamane und weiß alles über unsere Götter. Tagtha.");
talkEntry:addResponse("Ich bin Seher, also hör ich Cherga zu... der eisigen Hexe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I sell the advice of your ancestors... Just 'seek advice' and bring some coppercoins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkauf die Bootschaft deiner Ahnen... 'suche Rat' und vergiss die Kupfermünzn nich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("olokwa");
talkEntry:addResponse("#me hisses: 'Youbba ask tha old orc?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addResponse("#me zischt: 'Du frägst den alt, blind Ork?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me bohrt einen Finger ins Ohr. 'Is gut - is gut.");
talkEntry:addResponse("Bist du sicher, junge Kerl?");
talkEntry:addResponse("Ich wusste, du sagen das. - Weil ich Seher binne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me jingles with his empty lantern. 'Your desteny predestinated is.");
talkEntry:addResponse("Much to learn you have, young orcling.");
talkEntry:addResponse("The icy witch! She call ebberything by the true nam! She do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me drills a finger into his ear. 'Is good- is good.'");
talkEntry:addResponse("Are you sure, young fella?");
talkEntry:addResponse("I knew you would say that. - Cause I'm a seer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Viel zu lernen du hast, junger Orkling.");
talkEntry:addResponse("#me klimpert mit der erloschenen Laterne in seinen Händen. 'Dein Schicksal vorherbestimmt ist.'");
talkEntry:addResponse("Die eisige Hexe! Sie nennt alles beim wahren Namen! Nennt sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I know, I know...");
talkEntry:addResponse("I saw that comming.");
talkEntry:addResponse("Your bones are jingling... better you sacrifice somtehing to your gods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich weiß, ich weiß...");
talkEntry:addResponse("Das hab ich kommen sehn...");
talkEntry:addResponse("Ich könne hören deine Knochen klimpern... besser du Opfern etwas deinen Göttern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me klimpert mit der erloschenen Laterne in seinen Händen.", "#me jingles with his empty lantern.");
talkingNPC:addCycleText("#me schiebt seine Augenbinde zurecht.", "#me adjusts his blindfold.");
talkingNPC:addCycleText("Olokwa hört die Stimmen der Ahnen! Er befragt die Knochen! Er sieht die eisige Hexe in seinen Träumen.", "Olokwa hear tha voice of ancestors. He quizes the bones. He see tha icy witch in his dreams! ");
talkingNPC:addCycleText("Ich sehe tote Menschen!", "I see dead People!");
talkingNPC:addCycleText("#me nuckelt, breit grinsend an einer Wurst.", "#me slurps with a broad grin a sausage.");
talkingNPC:addCycleText("Die eisige Hexe! Sie nennt alles beim wahren Namen! Nennt sie.", "The icy witch! She call ebberything by the true nam! She do.");
talkingNPC:addCycleText("Dieh Ahnen ruhen nicht! Nein...", "The ancestors are fitful. Yes...");
talkingNPC:addCycleText("Stein brechen wird. Holz morschen wird. Knochn splittern wird.", "Stone 'll break. Wood'll root. Bone 'll slpash.");
talkingNPC:addCycleText("#me bohrt einen Finger ins Ohr.", "#me drills a finger into his ear.");
talkingNPC:addCycleText("#me steckt sich einen Finger nach den anderen in den Mund und lutscht den Dreck unter den Fingernägeln aus.", "#me slurps at one finger after another, to get the dirt under the fingernails.");
talkingNPC:addCycleText("#me nimmt einen Schluck aus einer kleinen schmuddeligen Flasche. Scharfer alkoholischer Dunst steigt in die Luft.", "#me takes a gulp from a grubby little bottle. A strong stench of alcohol fills the air.");
talkingNPC:addCycleText("#me schwankt plötzlich für einige Sekunden beunruhigend ohne ein Wort von sich zu geben. Dann schnarcht er mit einem Mal laut auf und erwacht daraufhin wieder mit verwirrtem Gesichtsausdruck.", "#me swings some seconds ominously at his stand without a noise, then gives a loud snore and wake up again, grimazing a puzzled face.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein uralter knochendürrer Ork. Ein schmutziger Lumpen verbindet seine Augen, er scheint blind zu sein. Er hält eine erloschene Laterne in der Hand.", "An immemorial bony Orc. A scruffy rag is bound over his eyes, he seems to be blind. He holds a empty lantern in his hand.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(3, 813);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 823);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END