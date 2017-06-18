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
-- Global Variable Collection
local M = {}

-- Races
-- Application call: user:getRace()
-- Player races: "man","dwarf","halfling", "elf","orc","lizard"
M.raceHUMAN = 0
M.raceDWARF = 1
M.raceHALFLING = 2
M.raceELF = 3
M.raceORC = 4
M.raceLIZARD = 5

-- Graphic effects
-- ID of the gfx effect
M.gfxBLITZ = 2
M.gfxICE = 3
M.gfxELFFIRE = 4
M.gfxDEMFIRE = 5
M.gfxSPELL = 6
M.gfxWIND = 7
M.gfxGIFTWOLKE = 8
M.gfxFIREBALL = 9
M.gfxPLATSCH = 11
M.gfxFIZZLE = 12
M.gfxBLOOD = 13
M.gfxBOW = 15
M.gfxRAIN = 16
M.gfxSWORD = 17
M.gfxSHIELD = 18
M.gfxMACE = 19
M.gfxDAGGER = 20
M.gfxCLAW = 21
M.gfxBOXING = 22
M.gfxGLOWING = 31
M.gfxFALL = 32
M.gfxFLAMESTRIKE = 36
M.gfxLIGHT = 37
M.gfxFIREFIELD = 38
M.gfxSTARS = 41
M.gfxEXPLO = 44
M.gfxSPLASH = 45
M.gfxSUN = 46
M.gfxVIOLETT = 51
M.gfxSPRINKLE = 52
M.gfxSCOTTY = 53

-- Graphic effects
-- Descriptive text of the gfx effect
M.gfxText = {}
M.gfxText[2] = "Lightning"
M.gfxText[3] = "Ice block"
M.gfxText[4] = "Ice ball"
M.gfxText[5] = "Green splash up"
M.gfxText[6] = "Bonding wind"
M.gfxText[7] = "Wind swirl"
M.gfxText[8] = "Poison cloud"
M.gfxText[9] = "Fire ball"
M.gfxText[11] = "Splash"
M.gfxText[12] = "Smoke puff"
M.gfxText[13] = "Blood"
M.gfxText[15] = "Bow fires"
M.gfxText[16] = "Green sparkles"
M.gfxText[17] = "Sword attacks"
M.gfxText[18] = "Shield"
M.gfxText[19] = "Mace attacks"
M.gfxText[20] = "Dagger attacks"
M.gfxText[21] = "Hands"
M.gfxText[22] = "Boxing"
M.gfxText[31] = "Light ball"
M.gfxText[32] = "Red splash down"
M.gfxText[36] = "Flame strike"
M.gfxText[37] = "Light pile"
M.gfxText[38] = "Huge flame"
M.gfxText[41] = "Teleport swirl"
M.gfxText[44] = "Explosion"
M.gfxText[45] = "Red firework"
M.gfxText[46] = "Spotlight"
M.gfxText[51] = "Violett fire"
M.gfxText[52] = "Dispell swirl"
M.gfxText[53] = "White sparkles"

-- Sound effects
-- ID of the sfx effect
M.sfxSCREAM = 1
M.sfxSHEEP = 2
M.sfxHIT = 3
M.sfxTHUNDER = 4
M.sfxBANG = 5
M.sfxCHOPPING = 6
M.sfxFIRE = 7
M.sfxANVIL = 8
M.sfxWATERSPLASH = 9
M.sfxWATERPOUR = 10
M.sfxSAW = 11
M.sfxDRINK = 12
M.sfxSNARING = 13
M.sfxCARVE = 14
M.sfxCOOKING = 15
M.sfxRASP = 16
M.sfxGOLDSMITHING = 17
M.sfxMINING = 18
M.sfxLOCK = 19
M.sfxUNLOCK = 20
M.sfxDOOR = 21
M.sfxCLICK = 22
M.sfxBURP = 23
M.sfxCOINS = 24
M.sfxEVIL_LAUGH = 25
M.sfxROAR = 26
M.sfxWIND = 27
M.sfxWIND2 = 28
M.sfxBOW = 30
M.sfxHIT_ARROW = 31
M.sfxHIT_STAFF_PLATE = 32
M.sfxHIT_SWORD_PLATE = 33
M.sfxPARRY_AXE_SHIELD = 40
M.sfxPARRY_STAFF = 41
M.sfxPARRY_SWORD = 42
M.sfxPARRY_SWORD_SHIELD = 43
M.sfxPARRY_SWORD_STAFF = 44

-- Sound effects
-- Descriptive text of the sfx effect
M.sfxText = {}
M.sfxText[1] = "Screem"
M.sfxText[2] = "Sheep"
M.sfxText[3] = "Hit"
M.sfxText[4] = "Thunder"
M.sfxText[5] = "Boom"
M.sfxText[6] = "Chopping"
M.sfxText[7] = "Camp fire"
M.sfxText[8] = "Anvil"
M.sfxText[9] = "Splash water"
M.sfxText[10] = "Pour water"
M.sfxText[11] = "Sawing"
M.sfxText[12] = "Gulp"
M.sfxText[13] = "Snaring"
M.sfxText[14] = "Carve / Slice"
M.sfxText[15] = "Cooking"
M.sfxText[16] = "Rasping"
M.sfxText[17] = "Goldsmithing"
M.sfxText[18] = "Mining"
M.sfxText[19] = "Lock door"
M.sfxText[20] = "Unlock door"
M.sfxText[21] = "Creaking door"
M.sfxText[22] = "Click"
M.sfxText[23] = "Burp"
M.sfxText[24] = "Coins"
M.sfxText[25] = "Evil laugh"
M.sfxText[26] = "Roar"
M.sfxText[27] = "Wind 1"
M.sfxText[28] = "Wind 2"
M.sfxText[30] = "Bow"
M.sfxText[31] = "Arrow hit"
M.sfxText[32] = "Hit plate with staff"
M.sfxText[33] = "Hit plate with sword"
M.sfxText[40] = "Parry axe with shield"
M.sfxText[41] = "Parry staff"
M.sfxText[42] = "Parry sword"
M.sfxText[43] = "Parry sword with staff"
M.sfxText[44] = "Parry sword with staff"

return M
