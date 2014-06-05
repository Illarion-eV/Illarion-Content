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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (184, 'quest.maelyrra_umrielyth_184_runewick');

require("base.common")
module("quest.maelyrra_umrielyth_184_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Forscher"
Title[ENGLISH] = "The Researcher"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

Description[GERMAN][1] = "Töte vier Schleime, du  brauchst noch vier weitere."
Description[GERMAN][2] = "Töte vier Schleime, du  brauchst noch drei weitere."
Description[GERMAN][3] = "Töte vier Schleime, du  brauchst noch zwei weitere."
Description[GERMAN][4] = "Töte vier Schleime, du  brauchst noch ein weitere."
Description[GERMAN][5] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][6] = "Töte acht Schleime, du  brauchst noch acht weitere."
Description[GERMAN][7] = "Töte acht Schleime, du  brauchst noch sieben weitere."
Description[GERMAN][8] = "Töte acht Schleime, du  brauchst noch sechs weitere."
Description[GERMAN][9] = "Töte acht Schleime, du  brauchst noch fünf weitere."
Description[GERMAN][10] = "Töte acht Schleime, du  brauchst noch vier weitere."
Description[GERMAN][11] = "Töte acht Schleime, du  brauchst noch drei weitere."
Description[GERMAN][12] = "Töte acht Schleime, du  brauchst noch zwei weitere."
Description[GERMAN][13] = "Töte acht Schleime, du  brauchst noch ein weitere."
Description[GERMAN][14] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][15] = "Töte zwölf Schleime, du  brauchst noch zwölf weitere."
Description[GERMAN][16] = "Töte zwölf Schleime, du  brauchst noch elf weitere."
Description[GERMAN][17] = "Töte zwölf Schleime, du  brauchst noch zehn weitere."
Description[GERMAN][18] = "Töte zwölf Schleime, du  brauchst noch neun weitere."
Description[GERMAN][19] = "Töte zwölf Schleime, du  brauchst noch acht weitere."
Description[GERMAN][20] = "Töte zwölf Schleime, du  brauchst noch sieben weitere."
Description[GERMAN][21] = "Töte zwölf Schleime, du  brauchst noch sechs weitere."
Description[GERMAN][22] = "Töte zwölf Schleime, du  brauchst noch fünf weitere."
Description[GERMAN][23] = "Töte zwölf Schleime, du  brauchst noch vier weitere."
Description[GERMAN][24] = "Töte zwölf Schleime, du  brauchst noch drei weitere."
Description[GERMAN][25] = "Töte zwölf Schleime, du  brauchst noch zwei weitere."
Description[GERMAN][26] = "Töte zwölf Schleime, du  brauchst noch ein weitere."
Description[GERMAN][27] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][28] = "Töte vier Hunde, du  brauchst noch vier weitere."
Description[GERMAN][29] = "Töte vier Hunde, du  brauchst noch drei weitere."
Description[GERMAN][30] = "Töte vier Hunde, du  brauchst noch zwei weitere."
Description[GERMAN][31] = "Töte vier Hunde, du  brauchst noch ein weitere."
Description[GERMAN][32] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][33] = "Töte acht Hunde, du  brauchst noch acht weitere."
Description[GERMAN][34] = "Töte acht Hunde, du  brauchst noch sieben weitere."
Description[GERMAN][35] = "Töte acht Hunde, du  brauchst noch sechs weitere."
Description[GERMAN][36] = "Töte acht Hunde, du  brauchst noch fünf weitere."
Description[GERMAN][37] = "Töte acht Hunde, du  brauchst noch vier weitere."
Description[GERMAN][38] = "Töte acht Hunde, du  brauchst noch drei weitere."
Description[GERMAN][39] = "Töte acht Hunde, du  brauchst noch zwei weitere."
Description[GERMAN][40] = "Töte acht Hunde, du  brauchst noch ein weitere."
Description[GERMAN][41] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][42] = "Töte zwölf Hunde, du  brauchst noch zwölf weitere."
Description[GERMAN][43] = "Töte zwölf Hunde, du  brauchst noch elf weitere."
Description[GERMAN][44] = "Töte zwölf Hunde, du  brauchst noch zehn weitere."
Description[GERMAN][45] = "Töte zwölf Hunde, du  brauchst noch neun weitere."
Description[GERMAN][46] = "Töte zwölf Hunde, du  brauchst noch acht weitere."
Description[GERMAN][47] = "Töte zwölf Hunde, du  brauchst noch sieben weitere."
Description[GERMAN][48] = "Töte zwölf Hunde, du  brauchst noch sechs weitere."
Description[GERMAN][49] = "Töte zwölf Hunde, du  brauchst noch fünf weitere."
Description[GERMAN][50] = "Töte zwölf Hunde, du  brauchst noch vier weitere."
Description[GERMAN][51] = "Töte zwölf Hunde, du  brauchst noch drei weitere."
Description[GERMAN][52] = "Töte zwölf Hunde, du  brauchst noch zwei weitere."
Description[GERMAN][53] = "Töte zwölf Hunde, du  brauchst noch ein weitere."
Description[GERMAN][54] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][55] = "Töte vier Wölfe, du  brauchst noch vier weitere."
Description[GERMAN][56] = "Töte vier Wölfe, du  brauchst noch drei weitere."
Description[GERMAN][57] = "Töte vier Wölfe, du  brauchst noch zwei weitere."
Description[GERMAN][58] = "Töte vier Wölfe, du  brauchst noch ein weitere."
Description[GERMAN][59] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][60] = "Töte acht Wölfe, du  brauchst noch acht weitere."
Description[GERMAN][61] = "Töte acht Wölfe, du  brauchst noch sieben weitere."
Description[GERMAN][62] = "Töte acht Wölfe, du  brauchst noch sechs weitere."
Description[GERMAN][63] = "Töte acht Wölfe, du  brauchst noch fünf weitere."
Description[GERMAN][64] = "Töte acht Wölfe, du  brauchst noch vier weitere."
Description[GERMAN][65] = "Töte acht Wölfe, du  brauchst noch drei weitere."
Description[GERMAN][66] = "Töte acht Wölfe, du  brauchst noch zwei weitere."
Description[GERMAN][67] = "Töte acht Wölfe, du  brauchst noch ein weitere."
Description[GERMAN][68] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][69] = "Töte zwölf Wölfe, du  brauchst noch zwölf weitere."
Description[GERMAN][70] = "Töte zwölf Wölfe, du  brauchst noch elf weitere."
Description[GERMAN][71] = "Töte zwölf Wölfe, du  brauchst noch zehn weitere."
Description[GERMAN][72] = "Töte zwölf Wölfe, du  brauchst noch neun weitere."
Description[GERMAN][73] = "Töte zwölf Wölfe, du  brauchst noch acht weitere."
Description[GERMAN][74] = "Töte zwölf Wölfe, du  brauchst noch sieben weitere."
Description[GERMAN][75] = "Töte zwölf Wölfe, du  brauchst noch sechs weitere."
Description[GERMAN][76] = "Töte zwölf Wölfe, du  brauchst noch fünf weitere."
Description[GERMAN][77] = "Töte zwölf Wölfe, du  brauchst noch vier weitere."
Description[GERMAN][78] = "Töte zwölf Wölfe, du  brauchst noch drei weitere."
Description[GERMAN][79] = "Töte zwölf Wölfe, du  brauchst noch zwei weitere."
Description[GERMAN][80] = "Töte zwölf Wölfe, du  brauchst noch ein weitere."
Description[GERMAN][81] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][82] = "Töte vier Füchse, du  brauchst noch vier weitere."
Description[GERMAN][83] = "Töte vier Füchse, du  brauchst noch drei weitere."
Description[GERMAN][84] = "Töte vier Füchse, du  brauchst noch zwei weitere."
Description[GERMAN][85] = "Töte vier Füchse, du  brauchst noch ein weitere."
Description[GERMAN][86] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][87] = "Töte acht Füchse, du  brauchst noch acht weitere."
Description[GERMAN][88] = "Töte acht Füchse, du  brauchst noch sieben weitere."
Description[GERMAN][89] = "Töte acht Füchse, du  brauchst noch sechs weitere."
Description[GERMAN][90] = "Töte acht Füchse, du  brauchst noch fünf weitere."
Description[GERMAN][91] = "Töte acht Füchse, du  brauchst noch vier weitere."
Description[GERMAN][92] = "Töte acht Füchse, du  brauchst noch drei weitere."
Description[GERMAN][93] = "Töte acht Füchse, du  brauchst noch zwei weitere."
Description[GERMAN][94] = "Töte acht Füchse, du  brauchst noch ein weitere."
Description[GERMAN][95] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][96] = "Töte zwölf Füchse, du  brauchst noch zwölf weitere."
Description[GERMAN][97] = "Töte zwölf Füchse, du  brauchst noch elf weitere."
Description[GERMAN][98] = "Töte zwölf Füchse, du  brauchst noch zehn weitere."
Description[GERMAN][99] = "Töte zwölf Füchse, du  brauchst noch neun weitere."
Description[GERMAN][100] = "Töte zwölf Füchse, du  brauchst noch acht weitere."
Description[GERMAN][101] = "Töte zwölf Füchse, du  brauchst noch sieben weitere."
Description[GERMAN][102] = "Töte zwölf Füchse, du  brauchst noch sechs weitere."
Description[GERMAN][103] = "Töte zwölf Füchse, du  brauchst noch fünf weitere."
Description[GERMAN][104] = "Töte zwölf Füchse, du  brauchst noch vier weitere."
Description[GERMAN][105] = "Töte zwölf Füchse, du  brauchst noch drei weitere."
Description[GERMAN][106] = "Töte zwölf Füchse, du  brauchst noch zwei weitere."
Description[GERMAN][107] = "Töte zwölf Füchse, du  brauchst noch ein weitere."
Description[GERMAN][108] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][109] = "Töte vier Menschen, du  brauchst noch vier weitere."
Description[GERMAN][110] = "Töte vier Menschen, du  brauchst noch drei weitere."
Description[GERMAN][111] = "Töte vier Menschen, du  brauchst noch zwei weitere."
Description[GERMAN][112] = "Töte vier Menschen, du  brauchst noch ein weitere."
Description[GERMAN][113] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][114] = "Töte acht Menschen, du  brauchst noch acht weitere."
Description[GERMAN][115] = "Töte acht Menschen, du  brauchst noch sieben weitere."
Description[GERMAN][116] = "Töte acht Menschen, du  brauchst noch sechs weitere."
Description[GERMAN][117] = "Töte acht Menschen, du  brauchst noch fünf weitere."
Description[GERMAN][118] = "Töte acht Menschen, du  brauchst noch vier weitere."
Description[GERMAN][119] = "Töte acht Menschen, du  brauchst noch drei weitere."
Description[GERMAN][120] = "Töte acht Menschen, du  brauchst noch zwei weitere."
Description[GERMAN][121] = "Töte acht Menschen, du  brauchst noch ein weitere."
Description[GERMAN][122] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][123] = "Töte zwölf Menschen, du  brauchst noch zwölf weitere."
Description[GERMAN][124] = "Töte zwölf Menschen, du  brauchst noch elf weitere."
Description[GERMAN][125] = "Töte zwölf Menschen, du  brauchst noch zehn weitere."
Description[GERMAN][126] = "Töte zwölf Menschen, du  brauchst noch neun weitere."
Description[GERMAN][127] = "Töte zwölf Menschen, du  brauchst noch acht weitere."
Description[GERMAN][128] = "Töte zwölf Menschen, du  brauchst noch sieben weitere."
Description[GERMAN][129] = "Töte zwölf Menschen, du  brauchst noch sechs weitere."
Description[GERMAN][130] = "Töte zwölf Menschen, du  brauchst noch fünf weitere."
Description[GERMAN][131] = "Töte zwölf Menschen, du  brauchst noch vier weitere."
Description[GERMAN][132] = "Töte zwölf Menschen, du  brauchst noch drei weitere."
Description[GERMAN][133] = "Töte zwölf Menschen, du  brauchst noch zwei weitere."
Description[GERMAN][134] = "Töte zwölf Menschen, du  brauchst noch ein weitere."
Description[GERMAN][135] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][136] = "Töte vier Diebe, du  brauchst noch vier weitere."
Description[GERMAN][137] = "Töte vier Diebe, du  brauchst noch drei weitere."
Description[GERMAN][138] = "Töte vier Diebe, du  brauchst noch zwei weitere."
Description[GERMAN][139] = "Töte vier Diebe, du  brauchst noch ein weitere."
Description[GERMAN][140] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][141] = "Töte acht Diebe, du  brauchst noch acht weitere."
Description[GERMAN][142] = "Töte acht Diebe, du  brauchst noch sieben weitere."
Description[GERMAN][143] = "Töte acht Diebe, du  brauchst noch sechs weitere."
Description[GERMAN][144] = "Töte acht Diebe, du  brauchst noch fünf weitere."
Description[GERMAN][145] = "Töte acht Diebe, du  brauchst noch vier weitere."
Description[GERMAN][146] = "Töte acht Diebe, du  brauchst noch drei weitere."
Description[GERMAN][147] = "Töte acht Diebe, du  brauchst noch zwei weitere."
Description[GERMAN][148] = "Töte acht Diebe, du  brauchst noch ein weitere."
Description[GERMAN][149] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][150] = "Töte zwölf Diebe, du  brauchst noch zwölf weitere."
Description[GERMAN][151] = "Töte zwölf Diebe, du  brauchst noch elf weitere."
Description[GERMAN][152] = "Töte zwölf Diebe, du  brauchst noch zehn weitere."
Description[GERMAN][153] = "Töte zwölf Diebe, du  brauchst noch neun weitere."
Description[GERMAN][154] = "Töte zwölf Diebe, du  brauchst noch acht weitere."
Description[GERMAN][155] = "Töte zwölf Diebe, du  brauchst noch sieben weitere."
Description[GERMAN][156] = "Töte zwölf Diebe, du  brauchst noch sechs weitere."
Description[GERMAN][157] = "Töte zwölf Diebe, du  brauchst noch fünf weitere."
Description[GERMAN][158] = "Töte zwölf Diebe, du  brauchst noch vier weitere."
Description[GERMAN][159] = "Töte zwölf Diebe, du  brauchst noch drei weitere."
Description[GERMAN][160] = "Töte zwölf Diebe, du  brauchst noch zwei weitere."
Description[GERMAN][161] = "Töte zwölf Diebe, du  brauchst noch ein weitere."
Description[GERMAN][162] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][163] = "Töte vier Zombies, du  brauchst noch vier weitere."
Description[GERMAN][164] = "Töte vier Zombies, du  brauchst noch drei weitere."
Description[GERMAN][165] = "Töte vier Zombies, du  brauchst noch zwei weitere."
Description[GERMAN][166] = "Töte vier Zombies, du  brauchst noch ein weitere."
Description[GERMAN][167] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][168] = "Töte acht Zombies, du  brauchst noch acht weitere."
Description[GERMAN][169] = "Töte acht Zombies, du  brauchst noch sieben weitere."
Description[GERMAN][170] = "Töte acht Zombies, du  brauchst noch sechs weitere."
Description[GERMAN][171] = "Töte acht Zombies, du  brauchst noch fünf weitere."
Description[GERMAN][172] = "Töte acht Zombies, du  brauchst noch vier weitere."
Description[GERMAN][173] = "Töte acht Zombies, du  brauchst noch drei weitere."
Description[GERMAN][174] = "Töte acht Zombies, du  brauchst noch zwei weitere."
Description[GERMAN][175] = "Töte acht Zombies, du  brauchst noch ein weitere."
Description[GERMAN][176] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."
Description[GERMAN][177] = "Töte zwölf Zombies, du  brauchst noch zwölf weitere."
Description[GERMAN][178] = "Töte zwölf Zombies, du  brauchst noch elf weitere."
Description[GERMAN][179] = "Töte zwölf Zombies, du  brauchst noch zehn weitere."
Description[GERMAN][180] = "Töte zwölf Zombies, du  brauchst noch neun weitere."
Description[GERMAN][181] = "Töte zwölf Zombies, du  brauchst noch acht weitere."
Description[GERMAN][182] = "Töte zwölf Zombies, du  brauchst noch sieben weitere."
Description[GERMAN][183] = "Töte zwölf Zombies, du  brauchst noch sechs weitere."
Description[GERMAN][184] = "Töte zwölf Zombies, du  brauchst noch fünf weitere."
Description[GERMAN][185] = "Töte zwölf Zombies, du  brauchst noch vier weitere."
Description[GERMAN][186] = "Töte zwölf Zombies, du  brauchst noch drei weitere."
Description[GERMAN][187] = "Töte zwölf Zombies, du  brauchst noch zwei weitere."
Description[GERMAN][188] = "Töte zwölf Zombies, du  brauchst noch ein weitere."
Description[GERMAN][189] = "Kehre zu Maelyrra Umrielyth zurück, um deine Belohnung zu erhalten."

Description[ENGLISH][1] = "Kill four slimes you still need four."
Description[ENGLISH][2] = "Kill four slimes you still need three."
Description[ENGLISH][3] = "Kill four slimes you still need two."
Description[ENGLISH][4] = "Kill four slimes you still need one."
Description[ENGLISH][5] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][6] = "Kill eight slimes you still need eight."
Description[ENGLISH][7] = "Kill eight slimes you still need seven."
Description[ENGLISH][8] = "Kill eight slimes you still need six."
Description[ENGLISH][9] = "Kill eight slimes you still need five."
Description[ENGLISH][10] = "Kill eight slimes you still need four."
Description[ENGLISH][11] = "Kill eight slimes you still need three."
Description[ENGLISH][12] = "Kill eight slimes you still need two."
Description[ENGLISH][13] = "Kill eight slimes you still need one."
Description[ENGLISH][14] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][15] = "Kill twelve slimes you still need twelve."
Description[ENGLISH][16] = "Kill twelve slimes you still need eleven."
Description[ENGLISH][17] = "Kill twelve slimes you still need ten."
Description[ENGLISH][18] = "Kill twelve slimes you still need nine."
Description[ENGLISH][19] = "Kill twelve slimes you still need eight."
Description[ENGLISH][20] = "Kill twelve slimes you still need seven."
Description[ENGLISH][21] = "Kill twelve slimes you still need six."
Description[ENGLISH][22] = "Kill twelve slimes you still need five."
Description[ENGLISH][23] = "Kill twelve slimes you still need four."
Description[ENGLISH][24] = "Kill twelve slimes you still need three."
Description[ENGLISH][25] = "Kill twelve slimes you still need two."
Description[ENGLISH][26] = "Kill twelve slimes you still need one."
Description[ENGLISH][27] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][28] = "Kill four dogs you still need four."
Description[ENGLISH][29] = "Kill four dogs you still need three."
Description[ENGLISH][30] = "Kill four dogs you still need two."
Description[ENGLISH][31] = "Kill four dogs you still need one."
Description[ENGLISH][32] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][33] = "Kill eight dogs you still need eight."
Description[ENGLISH][34] = "Kill eight dogs you still need seven."
Description[ENGLISH][35] = "Kill eight dogs you still need six."
Description[ENGLISH][36] = "Kill eight dogs you still need five."
Description[ENGLISH][37] = "Kill eight dogs you still need four."
Description[ENGLISH][38] = "Kill eight dogs you still need three."
Description[ENGLISH][39] = "Kill eight dogs you still need two."
Description[ENGLISH][40] = "Kill eight dogs you still need one."
Description[ENGLISH][41] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][42] = "Kill twelve dogs you still need twelve."
Description[ENGLISH][43] = "Kill twelve dogs you still need eleven."
Description[ENGLISH][44] = "Kill twelve dogs you still need ten."
Description[ENGLISH][45] = "Kill twelve dogs you still need nine."
Description[ENGLISH][46] = "Kill twelve dogs you still need eight."
Description[ENGLISH][47] = "Kill twelve dogs you still need seven."
Description[ENGLISH][48] = "Kill twelve dogs you still need six."
Description[ENGLISH][49] = "Kill twelve dogs you still need five."
Description[ENGLISH][50] = "Kill twelve dogs you still need four."
Description[ENGLISH][51] = "Kill twelve dogs you still need three."
Description[ENGLISH][52] = "Kill twelve dogs you still need two."
Description[ENGLISH][53] = "Kill twelve dogs you still need one."
Description[ENGLISH][54] = "Return to  Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][55] = "Kill four wolves you still need four."
Description[ENGLISH][56] = "Kill four wolves you still need three."
Description[ENGLISH][57] = "Kill four wolves you still need two."
Description[ENGLISH][58] = "Kill four wolves you still need one."
Description[ENGLISH][59] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][60] = "Kill eight wolves you still need eight."
Description[ENGLISH][61] = "Kill eight wolves you still need seven."
Description[ENGLISH][62] = "Kill eight wolves you still need six."
Description[ENGLISH][63] = "Kill eight wolves you still need five."
Description[ENGLISH][64] = "Kill eight wolves you still need four."
Description[ENGLISH][65] = "Kill eight wolves you still need three."
Description[ENGLISH][66] = "Kill eight wolves you still need two."
Description[ENGLISH][67] = "Kill eight wolves you still need one."
Description[ENGLISH][68] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][69] = "Kill twelve wolves you still need twelve."
Description[ENGLISH][70] = "Kill twelve wolves you still need eleven."
Description[ENGLISH][71] = "Kill twelve wolves you still need ten."
Description[ENGLISH][72] = "Kill twelve wolves you still need nine."
Description[ENGLISH][73] = "Kill twelve wolves you still need eight."
Description[ENGLISH][74] = "Kill twelve wolves you still need seven."
Description[ENGLISH][75] = "Kill twelve wolves you still need six."
Description[ENGLISH][76] = "Kill twelve wolves you still need five."
Description[ENGLISH][77] = "Kill twelve wolves you still need four."
Description[ENGLISH][78] = "Kill twelve wolves you still need three."
Description[ENGLISH][79] = "Kill twelve wolves you still need two."
Description[ENGLISH][80] = "Kill twelve wolves you still need one."
Description[ENGLISH][81] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][82] = "Kill four foxes you still need four."
Description[ENGLISH][83] = "Kill four foxes you still need three."
Description[ENGLISH][84] = "Kill four foxes you still need two."
Description[ENGLISH][85] = "Kill four foxes you still need one."
Description[ENGLISH][86] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][87] = "Kill eight foxes you still need eight."
Description[ENGLISH][88] = "Kill eight foxes you still need seven."
Description[ENGLISH][89] = "Kill eight foxes you still need six"
Description[ENGLISH][90] = "Kill eight foxes you still need five."
Description[ENGLISH][91] = "Kill eight foxes you still need four."
Description[ENGLISH][92] = "Kill eight foxes you still need three."
Description[ENGLISH][93] = "Kill eight foxes you still need two."
Description[ENGLISH][94] = "Kill eight foxes you still need one."
Description[ENGLISH][95] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][96] = "Kill twelve foxes you still need twelve."
Description[ENGLISH][97] = "Kill twelve foxes you still need eleven."
Description[ENGLISH][98] = "Kill twelve foxes you still need ten."
Description[ENGLISH][99] = "Kill twelve foxes you still need nine."
Description[ENGLISH][100] = "Kill twelve foxes you still need eight."
Description[ENGLISH][101] = "Kill twelve foxes you still need seven."
Description[ENGLISH][102] = "Kill twelve foxes you still need six."
Description[ENGLISH][103] = "Kill twelve foxes you still need five."
Description[ENGLISH][104] = "Kill twelve foxes you still need four."
Description[ENGLISH][105] = "Kill twelve foxes you still need three."
Description[ENGLISH][106] = "Kill twelve foxes you still need two."
Description[ENGLISH][107] = "Kill twelve foxes you still need one."
Description[ENGLISH][108] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][109] = "Kill four humans you still need four."
Description[ENGLISH][110] = "Kill four humans you still need three."
Description[ENGLISH][111] = "Kill four humans you still need two."
Description[ENGLISH][112] = "Kill four humans you still need one."
Description[ENGLISH][113] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][114] = "Kill eight humans you still need eight."
Description[ENGLISH][115] = "Kill eight humans you still need seven."
Description[ENGLISH][116] = "Kill eight humans you still need six."
Description[ENGLISH][117] = "Kill eight humans you still need five."
Description[ENGLISH][118] = "Kill eight humans you still need four."
Description[ENGLISH][119] = "Kill eight humans you still need three."
Description[ENGLISH][120] = "Kill eight humans you still need two."
Description[ENGLISH][121] = "Kill eight humans you still need one."
Description[ENGLISH][122] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][123] = "Kill twelve humans you still need twelve."
Description[ENGLISH][124] = "Kill twelve humans you still need eleven."
Description[ENGLISH][125] = "Kill twelve humans you still need ten."
Description[ENGLISH][126] = "Kill twelve humans you still need nine."
Description[ENGLISH][127] = "Kill twelve humans you still need eight."
Description[ENGLISH][128] = "Kill twelve humans you still need seven."
Description[ENGLISH][129] = "Kill twelve humans you still need six."
Description[ENGLISH][130] = "Kill twelve humans you still need five."
Description[ENGLISH][131] = "Kill twelve humans you still need four."
Description[ENGLISH][132] = "Kill twelve humans you still need three."
Description[ENGLISH][133] = "Kill twelve humans you still need two."
Description[ENGLISH][134] = "Kill twelve humans you still need one."
Description[ENGLISH][135] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][136] = "Kill four thieves you still need four."
Description[ENGLISH][137] = "Kill four thieves you still need three."
Description[ENGLISH][138] = "Kill four thieves you still need two."
Description[ENGLISH][139] = "Kill four thieves you still need one."
Description[ENGLISH][140] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][141] = "Kill eight thieves you still need eight."
Description[ENGLISH][142] = "Kill eight thieves you still need seven."
Description[ENGLISH][143] = "Kill eight thieves you still need six."
Description[ENGLISH][144] = "Kill eight thieves you still need five."
Description[ENGLISH][145] = "Kill eight thieves you still need four."
Description[ENGLISH][146] = "Kill eight thieves you still need three."
Description[ENGLISH][147] = "Kill eight thieves you still need two."
Description[ENGLISH][148] = "Kill eight thieves you still need one."
Description[ENGLISH][149] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][150] = "Kill twelve thieves you still need twelve."
Description[ENGLISH][151] = "Kill twelve thieves you still need eleven."
Description[ENGLISH][152] = "Kill twelve thieves you still need ten."
Description[ENGLISH][153] = "Kill twelve thieves you still need nine."
Description[ENGLISH][154] = "Kill twelve thieves you still need eight."
Description[ENGLISH][155] = "Kill twelve thieves you still need seven."
Description[ENGLISH][156] = "Kill twelve thieves you still need six."
Description[ENGLISH][157] = "Kill twelve thieves you still need five."
Description[ENGLISH][158] = "Kill twelve thieves you still need four."
Description[ENGLISH][159] = "Kill twelve thieves you still need three."
Description[ENGLISH][160] = "Kill twelve thieves you still need two."
Description[ENGLISH][161] = "Kill twelve thieves you still need one."
Description[ENGLISH][162] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][163] = "Kill four zombies you still need four."
Description[ENGLISH][164] = "Kill four zombies you still need three."
Description[ENGLISH][165] = "Kill four zombies you still need two."
Description[ENGLISH][166] = "Kill four zombies you still need one."
Description[ENGLISH][167] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][168] = "Kill eight zombies you still need eight."
Description[ENGLISH][169] = "Kill eight zombies you still need seven."
Description[ENGLISH][170] = "Kill eight zombies you still need six."
Description[ENGLISH][171] = "Kill eight zombies you still need five."
Description[ENGLISH][172] = "Kill eight zombies you still need four."
Description[ENGLISH][173] = "Kill eight zombies you still need three."
Description[ENGLISH][174] = "Kill eight zombies you still need two."
Description[ENGLISH][175] = "Kill eight zombies you still need one."
Description[ENGLISH][176] = "Return to Maelyrra Umrielyth to claim your reward."
Description[ENGLISH][177] = "Kill twelve zombies you still need twelve."
Description[ENGLISH][178] = "Kill twelve zombies you still need eleven."
Description[ENGLISH][179] = "Kill twelve zombies you still need ten."
Description[ENGLISH][180] = "Kill twelve zombies you still need nine."
Description[ENGLISH][181] = "Kill twelve zombies you still need eight."
Description[ENGLISH][182] = "Kill twelve zombies you still need seven."
Description[ENGLISH][183] = "Kill twelve zombies you still need six."
Description[ENGLISH][184] = "Kill twelve zombies you still need five."
Description[ENGLISH][185] = "Kill twelve zombies you still need four."
Description[ENGLISH][186] = "Kill twelve zombies you still need three."
Description[ENGLISH][187] = "Kill twelve zombies you still need two."
Description[ENGLISH][188] = "Kill twelve zombies you still need one."
Description[ENGLISH][189] = "Return to Maelyrra Umrielyth to claim your reward."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {861, 809, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[2] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[3] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[4] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[5] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[6] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[7] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[8] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[9] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[10] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[11] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[12] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[13] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[14] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[15] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[16] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[17] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[18] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[19] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[20] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[21] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[22] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[23] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[24] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[25] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[26] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[27] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[28] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[29] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[30] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[31] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[32] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[33] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[34] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[35] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[36] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[37] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[38] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[39] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[40] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[41] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[42] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[43] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[44] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[45] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[46] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[47] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[48] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[49] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[50] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[51] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[52] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[53] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[54] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[55] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[56] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[57] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[58] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[59] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[60] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[61] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[62] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[63] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[64] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[65] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[66] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[67] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[68] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[69] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[70] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[71] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[72] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[73] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[74] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[75] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[76] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[77] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[78] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[79] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[80] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[81] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[82] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[83] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[84] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[85] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[86] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[87] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[88] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[89] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[90] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[91] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[92] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[93] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[94] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[95] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[96] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[97] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[98] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[99] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[100] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[101] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[102] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[103] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[104] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[105] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[106] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[107] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[108] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[109] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[110] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[111] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[112] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[113] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[114] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[115] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[116] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[117] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[118] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[119] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[120] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[121] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[122] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[123] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[124] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[125] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[126] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[127] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[128] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[129] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[130] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[131] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[132] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[133] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[134] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[135] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[136] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[137] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[138] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[139] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[140] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[141] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[142] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[143] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[144] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[145] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[146] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[147] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[148] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[149] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[150] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[151] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[152] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[153] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[154] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[155] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[156] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[157] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[158] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[159] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[160] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[161] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[162] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[163] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[164] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[165] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[166] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[167] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[168] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[169] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[170] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[171] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[172] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[173] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[174] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[175] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[176] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[177] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[178] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[179] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[180] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[181] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[182] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[183] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[184] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[185] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[186] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[187] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[188] = {position(861, 809, 0)} -- Maelyrra
QuestTarget[189] = {position(861, 809, 0)} -- Maelyrra

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 0


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestStart()
    return Start
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function QuestAvailability(user, status)
	-- only available if cooldown
    if status == 0 and user:getQuestProgress(186) == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
