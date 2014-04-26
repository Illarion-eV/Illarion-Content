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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (520, 'quest.gorgophone_520_wilderness');

require("base.common")
require("base.factions")
module("quest.gorgophone_520_wilderness", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Nest der Gorgophone"
Title[ENGLISH] = "Gorgophone's Nest"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 25 erledigen."
Description[ENGLISH][1] = "Kill small spiders for Gorgophone.  You still need 25."
Description[GERMAN][2] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 24 erledigen."
Description[ENGLISH][2] = "Kill small spiders for Gorgophone.  You still need 24."
Description[GERMAN][3] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 23 erledigen."
Description[ENGLISH][3] = "Kill small spiders for Gorgophone.  You still need 23."
Description[GERMAN][4] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 22 erledigen."
Description[ENGLISH][4] = "Kill small spiders for Gorgophone.  You still need 22."
Description[GERMAN][5] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 21 erledigen."
Description[ENGLISH][5] = "Kill small spiders for Gorgophone.  You still need 21."
Description[GERMAN][6] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 20 erledigen."
Description[ENGLISH][6] = "Kill small spiders for Gorgophone.  You still need 20."
Description[GERMAN][7] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 19 erledigen."
Description[ENGLISH][7] = "Kill small spiders for Gorgophone.  You still need 19."
Description[GERMAN][8] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 18 erledigen."
Description[ENGLISH][8] = "Kill small spiders for Gorgophone.  You still need 18."
Description[GERMAN][9] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 17 erledigen."
Description[ENGLISH][9] = "Kill small spiders for Gorgophone.  You still need 17."
Description[GERMAN][10] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 16 erledigen."
Description[ENGLISH][10] = "Kill small spiders for Gorgophone.  You still need 16."
Description[GERMAN][11] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 15 erledigen."
Description[ENGLISH][11] = "Kill small spiders for Gorgophone.  You still need 15."
Description[GERMAN][12] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 14 erledigen."
Description[ENGLISH][12] = "Kill small spiders for Gorgophone.  You still need 14."
Description[GERMAN][13] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 13 erledigen."
Description[ENGLISH][13] = "Kill small spiders for Gorgophone.  You still need 13."
Description[GERMAN][14] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 12 erledigen."
Description[ENGLISH][14] = "Kill small spiders for Gorgophone.  You still need 12."
Description[GERMAN][15] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 11 erledigen."
Description[ENGLISH][15] = "Kill small spiders for Gorgophone.  You still need 11."
Description[GERMAN][16] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 10 erledigen."
Description[ENGLISH][16] = "Kill small spiders for Gorgophone.  You still need 10."
Description[GERMAN][17] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 9 erledigen."
Description[ENGLISH][17] = "Kill small spiders for Gorgophone.  You still need 9."
Description[GERMAN][18] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 8 erledigen."
Description[ENGLISH][18] = "Kill small spiders for Gorgophone.  You still need 8."
Description[GERMAN][19] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 7 erledigen."
Description[ENGLISH][19] = "Kill small spiders for Gorgophone.  You still need 7."
Description[GERMAN][20] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 6 erledigen."
Description[ENGLISH][20] = "Kill small spiders for Gorgophone.  You still need 6."
Description[GERMAN][21] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 5 erledigen."
Description[ENGLISH][21] = "Kill small spiders for Gorgophone.  You still need 5."
Description[GERMAN][22] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 4 erledigen."
Description[ENGLISH][22] = "Kill small spiders for Gorgophone.  You still need 4."
Description[GERMAN][23] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 3 erledigen."
Description[ENGLISH][23] = "Kill small spiders for Gorgophone.  You still need 3."
Description[GERMAN][24] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 2 erledigen."
Description[ENGLISH][24] = "Kill small spiders for Gorgophone.  You still need 2."
Description[GERMAN][25] = "Töte Kleine Spinnen für Gorgophone. Du musst noch 1 erledigen."
Description[ENGLISH][25] = "Kill small spiders for Gorgophone.  You still need 1."
Description[GERMAN][26] = "Kehre zu Gorgophone zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][26] = "Return to Gorgophone, you have finished her task."

Description[GERMAN][27] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][27] = "Check with Gorgophone, she may have another task for you."

Description[GERMAN][28] = "Bring 5 Wasserflaschen zu Gorgophone."
Description[ENGLISH][28] = "Collect five bottles of water for Gorgophone."
Description[GERMAN][29] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][29] = "Check with Gorgophone, she may have another task for you."

Description[GERMAN][30] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 20 erledigen."
Description[ENGLISH][30] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 20."
Description[GERMAN][31] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 19 erledigen."
Description[ENGLISH][31] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 19."
Description[GERMAN][32] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 18 erledigen."
Description[ENGLISH][32] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 18."
Description[GERMAN][33] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 17 erledigen."
Description[ENGLISH][33] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 17."
Description[GERMAN][34] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 16 erledigen."
Description[ENGLISH][34] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 16."
Description[GERMAN][35] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 15 erledigen."
Description[ENGLISH][35] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 15."
Description[GERMAN][36] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 14 erledigen."
Description[ENGLISH][36] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 14."
Description[GERMAN][37] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 13 erledigen."
Description[ENGLISH][37] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 13."
Description[GERMAN][38] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 12 erledigen."
Description[ENGLISH][38] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 12."
Description[GERMAN][39] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 11 erledigen."
Description[ENGLISH][39] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 11."
Description[GERMAN][40] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 10 erledigen."
Description[ENGLISH][40] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 10."
Description[GERMAN][41] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 9 erledigen."
Description[ENGLISH][41] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 9."
Description[GERMAN][42] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 8 erledigen."
Description[ENGLISH][42] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 8."
Description[GERMAN][43] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 7 erledigen."
Description[ENGLISH][43] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 7."
Description[GERMAN][44] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 6 erledigen."
Description[ENGLISH][44] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 6."
Description[GERMAN][45] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 5 erledigen."
Description[ENGLISH][45] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 5."
Description[GERMAN][46] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 4 erledigen."
Description[ENGLISH][46] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 4."
Description[GERMAN][47] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 3 erledigen."
Description[ENGLISH][47] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 3."
Description[GERMAN][48] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 2 erledigen."
Description[ENGLISH][48] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 2."
Description[GERMAN][49] = "Töte Rekrap Retep Spinnen für Gorgophone. Du musst noch 1 erledigen."
Description[ENGLISH][49] = "Kill Rekrap Retep spiders for Gorgophone.  You still need 1."
Description[GERMAN][50] = "Kehre zu Gorgophone zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][50] = "Return to Gorgophone, you have finished her task."

Description[GERMAN][51] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][51] = "Check with Gorgophone, she may have another task for you."

Description[GERMAN][52] = "Töte Taranteln für Gorgophone. Du musst noch 15 erledigen."
Description[ENGLISH][52] = "Kill tarantulas for Gorgophone.  You still need 15."
Description[GERMAN][53] = "Töte Taranteln für Gorgophone. Du musst noch 14 erledigen."
Description[ENGLISH][53] = "Kill tarantulas for Gorgophone.  You still need 14."
Description[GERMAN][54] = "Töte Taranteln für Gorgophone. Du musst noch 13 erledigen."
Description[ENGLISH][54] = "Kill tarantulas for Gorgophone.  You still need 13."
Description[GERMAN][55] = "Töte Taranteln für Gorgophone. Du musst noch 12 erledigen."
Description[ENGLISH][55] = "Kill tarantulas for Gorgophone.  You still need 12."
Description[GERMAN][56] = "Töte Taranteln für Gorgophone. Du musst noch 11 erledigen."
Description[ENGLISH][56] = "Kill tarantulas for Gorgophone.  You still need 11."
Description[GERMAN][57] = "Töte Taranteln für Gorgophone. Du musst noch 10 erledigen."
Description[ENGLISH][57] = "Kill tarantulas for Gorgophone.  You still need 10."
Description[GERMAN][58] = "Töte Taranteln für Gorgophone. Du musst noch 9 erledigen."
Description[ENGLISH][58] = "Kill tarantulas for Gorgophone.  You still need 9."
Description[GERMAN][59] = "Töte Taranteln für Gorgophone. Du musst noch 8 erledigen."
Description[ENGLISH][59] = "Kill tarantulas for Gorgophone.  You still need 8."
Description[GERMAN][60] = "Töte Taranteln für Gorgophone. Du musst noch 7 erledigen."
Description[ENGLISH][60] = "Kill tarantulas for Gorgophone.  You still need 7."
Description[GERMAN][61] = "Töte Taranteln für Gorgophone. Du musst noch 6 erledigen."
Description[ENGLISH][61] = "Kill tarantulas for Gorgophone.  You still need 6."
Description[GERMAN][62] = "Töte Taranteln für Gorgophone. Du musst noch 5 erledigen."
Description[ENGLISH][62] = "Kill tarantulas for Gorgophone.  You still need 5."
Description[GERMAN][63] = "Töte Taranteln für Gorgophone. Du musst noch 4 erledigen."
Description[ENGLISH][63] = "Kill tarantulas for Gorgophone.  You still need 4."
Description[GERMAN][64] = "Töte Taranteln für Gorgophone. Du musst noch 3 erledigen."
Description[ENGLISH][64] = "Kill tarantulas for Gorgophone.  You still need 3."
Description[GERMAN][65] = "Töte Taranteln für Gorgophone. Du musst noch 2 erledigen."
Description[ENGLISH][65] = "Kill tarantulas for Gorgophone.  You still need 2."
Description[GERMAN][66] = "Töte Taranteln für Gorgophone. Du musst noch 1 erledigen."
Description[ENGLISH][66] = "Kill tarantulas for Gorgophone.  You still need 1."
Description[GERMAN][67] = "Kehre zu Gorgophone zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][67] = "Return to Gorgophone, you have finished her task."

Description[GERMAN][68] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][68] = "Check with Gorgophone, she may have another task for you."

Description[GERMAN][69] = "Bringe 60 Getreidebündel zu Gorgophone."
Description[ENGLISH][69] = "Collect sixty grain bundles for Gorgophone."
Description[GERMAN][70] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][70] = "Check with Gorgophone she may have another task for you."

Description[GERMAN][71] = "Gorgophone braucht 250 Spindeln Garn von dir."
Description[ENGLISH][71] = "Collect 250 spools of thread for Gorgophone."
Description[GERMAN][72] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][72] = "Check with Gorgophone she may have another task for you."

Description[GERMAN][73] = "Besorge eine mindestens sehr gute heilige Voulge und bring diese zu Gorgophone."
Description[ENGLISH][73] = "Collect a divine voulge spear, of very good quality or better, for Gorgophone."
Description[GERMAN][74] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][74] = "Check with Gorgophone she may have another task for you."

Description[GERMAN][75] = "Töte Spinnenköniginnen für Gorgophone. Du musst noch 5 erledigen."
Description[ENGLISH][75] = "Kill spider queens for Gorgophone. You still need 5."
Description[GERMAN][76] = "Töte Spinnenköniginnen für Gorgophone. Du musst noch 4 erledigen."
Description[ENGLISH][76] = "Kill spider queens for Gorgophone. You still need 4."
Description[GERMAN][77] = "Töte Spinnenköniginnen für Gorgophone. Du musst noch 3 erledigen."
Description[ENGLISH][77] = "Kill spider queens for Gorgophone. You still need 3."
Description[GERMAN][78] = "Töte Spinnenköniginnen für Gorgophone. Du musst noch 2 erledigen."
Description[ENGLISH][78] = "Kill spider queens for Gorgophone. You still need 2."
Description[GERMAN][79] = "Töte Spinnenköniginnen für Gorgophone. Du musst noch 1 erledigen."
Description[ENGLISH][79] = "Kill spider queens for Gorgophone. You still need 1."
Description[GERMAN][80] = "Kehre zu Gorgophone zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][80] = "Return to Gorgophone, you have finished her task."

Description[GERMAN][81] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
Description[ENGLISH][81] = "Check with Gorgophone, she may have another task for you."

Description[GERMAN][82] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 50 erledigen."
Description[ENGLISH][82] = "Kill Soulpain for Gorgophone. You still need 50."
Description[GERMAN][83] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 49 erledigen."
Description[ENGLISH][83] = "Kill Soulpain for Gorgophone. You still need 49."
Description[GERMAN][84] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 48 erledigen."
Description[ENGLISH][84] = "Kill Soulpain for Gorgophone. You still need 48."
Description[GERMAN][85] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 47 erledigen."
Description[ENGLISH][85] = "Kill Soulpain for Gorgophone. You still need 47."
Description[GERMAN][86] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 46 erledigen."
Description[ENGLISH][86] = "Kill Soulpain for Gorgophone. You still need 46."
Description[GERMAN][87] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 45 erledigen."
Description[ENGLISH][87] = "Kill Soulpain for Gorgophone. You still need 45."
Description[GERMAN][88] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 44 erledigen."
Description[ENGLISH][88] = "Kill Soulpain for Gorgophone. You still need 44."
Description[GERMAN][89] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 43 erledigen."
Description[ENGLISH][89] = "Kill Soulpain for Gorgophone. You still need 43."
Description[GERMAN][90] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 42 erledigen."
Description[ENGLISH][90] = "Kill Soulpain for Gorgophone. You still need 42."
Description[GERMAN][91] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 41 erledigen."
Description[ENGLISH][91] = "Kill Soulpain for Gorgophone. You still need 41."
Description[GERMAN][92] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 40 erledigen."
Description[ENGLISH][92] = "Kill Soulpain for Gorgophone. You still need 40."
Description[GERMAN][93] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 39 erledigen."
Description[ENGLISH][93] = "Kill Soulpain for Gorgophone. You still need 39."
Description[GERMAN][94] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 38 erledigen."
Description[ENGLISH][94] = "Kill Soulpain for Gorgophone. You still need 38."
Description[GERMAN][95] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 37 erledigen."
Description[ENGLISH][95] = "Kill Soulpain for Gorgophone. You still need 37."
Description[GERMAN][96] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 36 erledigen."
Description[ENGLISH][96] = "Kill Soulpain for Gorgophone. You still need 36."
Description[GERMAN][97] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 35 erledigen."
Description[ENGLISH][97] = "Kill Soulpain for Gorgophone. You still need 35."
Description[GERMAN][98] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 34 erledigen."
Description[ENGLISH][98] = "Kill Soulpain for Gorgophone. You still need 34."
Description[GERMAN][99] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 33 erledigen."
Description[ENGLISH][99] = "Kill Soulpain for Gorgophone. You still need 33."
Description[GERMAN][100] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 32 erledigen."
Description[ENGLISH][100] = "Kill Soulpain for Gorgophone. You still need 32."
Description[GERMAN][101] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 31 erledigen."
Description[ENGLISH][101] = "Kill Soulpain for Gorgophone. You still need 31."
Description[GERMAN][102] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 30 erledigen."
Description[ENGLISH][102] = "Kill Soulpain for Gorgophone. You still need 30."
Description[GERMAN][103] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 29 erledigen."
Description[ENGLISH][103] = "Kill Soulpain for Gorgophone. You still need 29."
Description[GERMAN][104] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 28 erledigen."
Description[ENGLISH][104] = "Kill Soulpain for Gorgophone. You still need 28."
Description[GERMAN][105] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 27 erledigen."
Description[ENGLISH][105] = "Kill Soulpain for Gorgophone. You still need 27."
Description[GERMAN][106] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 26 erledigen."
Description[ENGLISH][106] = "Kill Soulpain for Gorgophone. You still need 26."
Description[GERMAN][107] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 25 erledigen."
Description[ENGLISH][107] = "Kill Soulpain for Gorgophone. You still need 25."
Description[GERMAN][108] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 24 erledigen."
Description[ENGLISH][108] = "Kill Soulpain for Gorgophone. You still need 24."
Description[GERMAN][109] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 23 erledigen."
Description[ENGLISH][109] = "Kill Soulpain for Gorgophone. You still need 23."
Description[GERMAN][110] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 22 erledigen."
Description[ENGLISH][110] = "Kill Soulpain for Gorgophone. You still need 22."
Description[GERMAN][111] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 21 erledigen."
Description[ENGLISH][111] = "Kill Soulpain for Gorgophone. You still need 21."
Description[GERMAN][112] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 20 erledigen."
Description[ENGLISH][112] = "Kill Soulpain for Gorgophone. You still need 20."
Description[GERMAN][113] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 19 erledigen."
Description[ENGLISH][113] = "Kill Soulpain for Gorgophone. You still need 19."
Description[GERMAN][114] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 18 erledigen."
Description[ENGLISH][114] = "Kill Soulpain for Gorgophone. You still need 18."
Description[GERMAN][115] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 17 erledigen."
Description[ENGLISH][115] = "Kill Soulpain for Gorgophone. You still need 17."
Description[GERMAN][116] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 16 erledigen."
Description[ENGLISH][116] = "Kill Soulpain for Gorgophone. You still need 16."
Description[GERMAN][117] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 15 erledigen."
Description[ENGLISH][117] = "Kill Soulpain for Gorgophone. You still need 15."
Description[GERMAN][118] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 14 erledigen."
Description[ENGLISH][118] = "Kill Soulpain for Gorgophone. You still need 14."
Description[GERMAN][119] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 13 erledigen."
Description[ENGLISH][119] = "Kill Soulpain for Gorgophone. You still need 13."
Description[GERMAN][120] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 12 erledigen."
Description[ENGLISH][120] = "Kill Soulpain for Gorgophone. You still need 12."
Description[GERMAN][121] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 11 erledigen."
Description[ENGLISH][121] = "Kill Soulpain for Gorgophone. You still need 11."
Description[GERMAN][122] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 10 erledigen."
Description[ENGLISH][122] = "Kill Soulpain for Gorgophone. You still need 10."
Description[GERMAN][123] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 9 erledigen."
Description[ENGLISH][123] = "Kill Soulpain for Gorgophone. You still need 9."
Description[GERMAN][124] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 8 erledigen."
Description[ENGLISH][124] = "Kill Soulpain for Gorgophone. You still need 8."
Description[GERMAN][125] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 7 erledigen."
Description[ENGLISH][125] = "Kill Soulpain for Gorgophone. You still need 7."
Description[GERMAN][126] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 6 erledigen."
Description[ENGLISH][126] = "Kill Soulpain for Gorgophone. You still need 6."
Description[GERMAN][127] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 5 erledigen."
Description[ENGLISH][127] = "Kill Soulpain for Gorgophone. You still need 5."
Description[GERMAN][128] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 4 erledigen."
Description[ENGLISH][128] = "Kill Soulpain for Gorgophone. You still need 4."
Description[GERMAN][129] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 3 erledigen."
Description[ENGLISH][129] = "Kill Soulpain for Gorgophone. You still need 3."
Description[GERMAN][130] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 2 erledigen."
Description[ENGLISH][130] = "Kill Soulpain for Gorgophone. You still need 2."
Description[GERMAN][131] = "Töte Seelenpein Spinnen für Gorgophone. Du musst noch 1 erledigen."
Description[ENGLISH][131] = "Kill Soulpain for Gorgophone. You still need 1."
Description[GERMAN][132] = "Kehre zu Gorgophone zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][132] = "Return to Gorgophone, you have completed her task."
Description[GERMAN][133] = "Du hast alle Aufgaben der Gorgophone erledigt."
Description[ENGLISH][133] = "You have completed all tasks of Gorgophone."

npcPos = position(852, 497, -6);

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = npcPos;

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
for i = 1, 132 do
  QuestTarget[i] = {npcPos};
end

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 133


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
    if status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
