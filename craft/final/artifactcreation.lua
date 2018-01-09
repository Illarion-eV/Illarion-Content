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
local crafts = require("craft.base.crafts")

module("craft.final.artifactcreation", package.seeall)

artifactcreation = crafts.Craft:new{
                          craftEN = "Artifact Creation",
                          craftDE = "Artefakt Herstellung",
                          handTool = 463,
                          leadSkill = Character.artifactCreation,
                          sfx = 16,
                          sfxDuration = 80,
                        };

artifactcreation:addTool(550) -- mage desk
artifactcreation:addTool(551) -- mage desk

local catId = artifactcreation:addCategory("Ammunition", "Munition")

-- Magic arrow
product = artifactcreation:addProduct(catId, 3500, 10,{magicpower="2"},0,12,0.25)
product:addIngredient(64, 10) -- arrow

local catId = artifactcreation:addCategory("Teleport to the Hemp Necktie Inn", "Teleport zum Gasthof zur Hanfschlinge")

-- Scroll to the Hemp Neckty
product = artifactcreation:addProduct(catId, 3116, 1,{nameDe = "Portal Schriftrolle", nameEn = "Portal Scoll", destCoordsX = "684", destCoordsY = "307", destCoordsZ = "0", descriptionEn = "Portal to the Hemp Necktie Inn for one person", descriptionDe = "Portal zum Gasthof zur Hanfschlinge, nur eine Person", traveller = "1"},10,29,0.45)
product:addIngredient(2745, 1) -- parchment
product:addIngredient(1118, 1) -- ink

-- Book to the Hemp Neckty
product = artifactcreation:addProduct(catId, 1061, 1,{nameDe = "Portalbuch", nameEn = "Portal Book", destCoordsX = "684", destCoordsY = "307", destCoordsZ = "0", descriptionEn = "Portal to the Hemp Necktie Inn for ten persons", descriptionDe = "Portal zum Gasthof zur Hanfschlinge, nutzbar mit zehn Personen", traveller = "10"},60,210,0.45)
product:addIngredient(2547, 1) -- leather
product:addIngredient(2745, 2) -- parchment
product:addIngredient(1118, 1) -- ink

local catId = artifactcreation:addCategory("Teleport to Cadomyr", "Teleport nach Cadomyr")

-- Scroll to Cadomyr
product = artifactcreation:addProduct(catId, 3116, 1,{nameDe = "Portal Schriftrolle", nameEn = "Portal Scoll", destCoordsX = "126", destCoordsY = "647", destCoordsZ = "0", descriptionEn = "Portal to Cadomyr for one person", descriptionDe = "Portal nach Cadomyr, nur eine Person", traveller = "1"},20,45,0.45)
product:addIngredient(2745, 1) -- parchment
product:addIngredient(1118, 1) -- ink

-- Book to Cadomyr
product = artifactcreation:addProduct(catId, 1061, 1,{nameDe = "Portalbuch", nameEn = "Portal Book", destCoordsX = "126", destCoordsY = "647", destCoordsZ = "0", descriptionEn = "Portal to Cadomyr for ten persons", descriptionDe = "Portal nach Cadomyr, nutzbar mit zehn Personen", traveller = "10"},60,280,0.45)
product:addIngredient(2547, 1) -- leather
product:addIngredient(2745, 2) -- parchment
product:addIngredient(1118, 1) -- ink

local catId = artifactcreation:addCategory("Teleport to Galmair", "Teleport nach Galmair")

-- Scroll to Galmair
product = artifactcreation:addProduct(catId, 3116, 1,{nameDe = "Portal Schriftrolle", nameEn = "Portal Scoll", destCoordsX = "423", destCoordsY = "246", destCoordsZ = "0", descriptionEn = "Portal to Galmair for one person", descriptionDe = "Portal nach Galmair, nur eine Person", traveller = "1"},20,45,0.45)
product:addIngredient(2745, 1) -- parchment
product:addIngredient(1118, 1) -- ink

-- Book to Galmair
product = artifactcreation:addProduct(catId, 1061, 1,{nameDe = "Portalbuch", nameEn = "Portal Book", destCoordsX = "423", destCoordsY = "246", destCoordsZ = "0", descriptionEn = "Portal to Galmair for ten persons", descriptionDe = "Portal nach Galmair, nutzbar mit zehn Personen", traveller = "10"},60,280,0.45)
product:addIngredient(2547, 1) -- leather
product:addIngredient(2745, 2) -- parchment
product:addIngredient(1118, 1) -- ink

local catId = artifactcreation:addCategory("Teleport to Runewick", "Teleport nach Runewick")

-- Scroll to Runewick
product = artifactcreation:addProduct(catId, 3116, 1,{nameDe = "Portal Schriftrolle", nameEn = "Portal Scoll", destCoordsX = "835", destCoordsY = "813", destCoordsZ = "0", descriptionEn = "Portal to Runewick for one person", descriptionDe = "Portal nach Runewick, nur eine Person", traveller = "1"},20,45,0.45)
product:addIngredient(2745, 1) -- parchment
product:addIngredient(1118, 1) -- ink

-- Book to Runewick
product = artifactcreation:addProduct(catId, 1061, 1,{nameDe = "Portalbuch", nameEn = "Portal Book", destCoordsX = "835", destCoordsY = "813", destCoordsZ = "0", descriptionEn = "Portal to Runewick for ten persons", descriptionDe = "Portal nach Runewick, nutzbar mit zehn Personen", traveller = "10"},60,280,0.45)
product:addIngredient(2547, 1) -- leather
product:addIngredient(2745, 2) -- parchment
product:addIngredient(1118, 1) -- ink

local catId = artifactcreation:addCategory("Teleport to free location", "Teleport zu einer beliebigen Stelle")

-- Book to Anywhere
product = artifactcreation:addProduct(catId, 1061, 1,{nameDe = "Portalbuch", nameEn = "Portal Book", freeDestination = "true", descriptionEn = "Portal for six persons not yet activated", descriptionDe = "Nicht aktiviertes Portal, nutzbar mit sechs Personen", traveller = "6"},80,630,0.55)
product:addIngredient(2547, 1) -- leather
product:addIngredient(2745, 4) -- parchment
product:addIngredient(1118, 1) -- ink
product:addIngredient(447, 1) -- ruby powder

local catId = artifactcreation:addCategory("Glass Balls", "Glaskugeln")

-- glass ball for a single person
product = artifactcreation:addProduct(catId, 3501, 1,{nameDe = "Halbblindes Glasauge", nameEn = "Half blind glass eye", person = "0", personMax = "1", descriptionDe = "Anwendbar auf eine Person", descriptionEn = "Applicable for a single person"},40,100,0.45)
product:addIngredient(3499, 1) -- glass ball
product:addIngredient(2738, 1) -- nails
product:addIngredient(46, 1) -- ruby

-- glass ball for a tree person
product = artifactcreation:addProduct(catId, 3501, 1,{nameDe = "Glasauge", nameEn = "Glass eye", person = "0", personMax = "4", descriptionDe = "Anwendbar auf vier Personen", descriptionEn = "Applicable for four person"},70,430,0.45)
product:addIngredient(3499, 1) -- glass ball
product:addIngredient(2738, 1) -- nails
product:addIngredient(285, 1) -- diamond

-- treasure finder
product = artifactcreation:addProduct(catId, 3501, 1,{nameDe = "Finder des verlorenen Schatzes", nameEn = "Finder of the lost treasure", treasureFinder = "true"},30,63,0.45)
product:addIngredient(3499, 1) -- glass ball
product:addIngredient(2738, 1) -- nails

local catId = artifactcreation:addCategory("Messages", "Nachrichten")

-- vision feather
product = artifactcreation:addProduct(catId, 2696, 1,{nameDe = "Feder der Visionen", nameEn = "Vision Feather", vision = "1"},50,180,0.20)
product:addIngredient(2696, 1) -- Federn
product:addIngredient(2745, 1) -- parchment
product:addIngredient(1118, 1) -- ink

local catId = artifactcreation:addCategory("Divine items", "Göttliche Gegenstände")

-- namer
product = artifactcreation:addProduct(catId, 3115, 1,{nameDe = "Schriftrolle der Einzigartigkeit", nameEn = "Scroll of Uniqueness", namer = "true", descriptionDe = "Anwendbar mit einem neuen Gegenstand", descriptionEn = "Applicable for a single new item"},90,880,0.96)
product:addIngredient(2544, 2) -- large handle
product:addIngredient(2745, 2) -- parchment
product:addIngredient(1118, 1) -- ink
product:addIngredient(2552, 1) -- pure earth

-- divine scroll
product = artifactcreation:addProduct(catId, 3115, 1,{nameDe = "Schriftrolle der Auferstehung", nameEn = "Scroll of Resurrection", divinescroll = "true"},100,1200,0.96)
product:addIngredient(2544, 2) -- large handle
product:addIngredient(2745, 4) -- parchment
product:addIngredient(1118, 1) -- ink
product:addIngredient(2551, 1) -- pure air
