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

--[[ Languages (documentation only - do not activate that part!)
Player.german = 0
Player.english = 1
]]--

--[[ Gender (documentation only - do not activate that part!)
Character.male = 0
Character.female = 1
]]--
-- Races
-- Application call: user:getRace()
-- Player races: "man","dwarf","halfling", "elf","orc","lizard"
M.raceHUMAN = 0
M.raceDWARF = 1
M.raceHALFLING = 2
M.raceELF = 3
M.raceORC = 4
M.raceLIZARD = 5

-- Towns
M.townOUTLAW = 0
M.townCADOMYR = 1
M.townRUNEWICK = 2
M.townGALMAIR = 3

-- Char animations
M.charAnimationWALK = 3
M.charAnimationSLASH = 5
M.charAnimationSTAFF = 6
M.charAnimationBOW = 7
M.charAnimationSHIELD = 9
M.charAnimationSPELL = 11
M.charAnimationHAMMER = 14
M.charAnimationRUN = 19

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
M.gfxText[M.gfxBLITZ] = "Lightning"
M.gfxText[M.gfxICE] = "Ice block"
M.gfxText[M.gfxELFFIRE] = "Ice ball"
M.gfxText[M.gfxDEMFIRE] = "Green splash up"
M.gfxText[M.gfxSPELL] = "Bonding wind"
M.gfxText[M.gfxWIND] = "Wind swirl"
M.gfxText[M.gfxGIFTWOLKE] = "Poison cloud"
M.gfxText[M.gfxFIREBALL] = "Fire ball"
M.gfxText[M.gfxPLATSCH] = "Splash"
M.gfxText[M.gfxFIZZLE] = "Smoke puff"
M.gfxText[M.gfxBLOOD] = "Blood"
M.gfxText[M.gfxBOW] = "Bow fires"
M.gfxText[M.gfxRAIN] = "Green sparkles"
M.gfxText[M.gfxSWORD] = "Sword attacks"
M.gfxText[M.gfxSHIELD] = "Shield"
M.gfxText[M.gfxMACE] = "Mace attacks"
M.gfxText[M.gfxDAGGER] = "Dagger attacks"
M.gfxText[M.gfxCLAW] = "Hands"
M.gfxText[M.gfxBOXING] = "Boxing"
M.gfxText[M.gfxGLOWING] = "Light ball"
M.gfxText[M.gfxFALL] = "Red splash down"
M.gfxText[M.gfxFLAMESTRIKE] = "Flame strike"
M.gfxText[M.gfxLIGHT] = "Light pile"
M.gfxText[M.gfxFIREFIELD] = "Huge flame"
M.gfxText[M.gfxSTARS] = "Teleport swirl"
M.gfxText[M.gfxEXPLO] = "Explosion"
M.gfxText[M.gfxSPLASH] = "Red firework"
M.gfxText[M.gfxSUN] = "Spotlight"
M.gfxText[M.gfxVIOLETT] = "Violett fire"
M.gfxText[M.gfxSPRINKLE] = "Dispell swirl"
M.gfxText[M.gfxSCOTTY] = "White sparkles"

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
