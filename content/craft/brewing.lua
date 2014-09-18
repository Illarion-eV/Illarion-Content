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
local crafts = require("item.base.crafts")

module("content.craft.brewing", package.seeall)

brewing = crafts.Craft:new{
                     craftEN = "brewing",
                     craftDE = "Brauen",
                     handTool = 227,
                     leadSkill = Character.cookingAndBaking,
                     defaultFoodConsumption = 100,
                     sfx = 10,
                     sfxDuration = 15,
                   };

brewing:addTool(339) -- barrel

local catId = brewing:addCategory("Light alcohol", "Leichter Alkohol") -- Bierflasche(2501), Leichte Alkoholika

------------------- FLASCHE MIT CIDER - 2499 --------------------------
local product = brewing:addProduct(catId, 2499, 0, 20, 25, 50)
product:addIngredient(2498) -- Schritt 4: leere Flasche(2498) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 3: Eimer mit Wasser(52) 1x
product:addIngredient(15, 3) -- Schritte 1 - 2: Apfel(15) 2x
------------------ FLASCHE MIT CIDER - FERTIG -------------------------

-------------------- FLASCHE MIT MET - 2497 ---------------------------
product = brewing:addProduct(catId, 2497, 15, 30, 45, 90)
product:addIngredient(2498) -- Schritt 5: leere Flasche(2498) 1x
product:addIngredient(2529, 3) -- Schritte 1 - 3: Honigwaben(2529) 2x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 4: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT MET - FERTIG --------------------------

------------------- FLASCHE MIT BIER - 2501 ---------------------------
product = brewing:addProduct(catId, 2501, 32, 50, 60, 120)
product:addIngredient(2498) -- Schritt 7: leere Flasche(2498) 1x
product:addIngredient(259, 2) -- Schritte 1 - 2: Getreide(259) 1x
product:addIngredient(154) -- Schritte 3 - 4: Hopfen(154) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 4: Eimer mit Wasser(52) 1x
------------------ FLASCHE MIT BIER - FERTIG --------------------------

------------------- FLASCHE MIT WEIN - 2500 ---------------------------
product = brewing:addProduct(catId, 2500, 47, 65, 80, 160)
product:addIngredient(2498) -- Schritt 5: leere Flasche(2498) 1x
product:addIngredient(388, 3) -- Schritte 1 - 3: Weinbeeren(388) 2x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 4: Eimer mit Wasser(52) 1x
------------------ FLASCHE MIT WEIN - FERTIG --------------------------


catId = brewing:addCategory("Strong alcohol", "Harter Alkohol") -- Das harte Zeug

------------------- FLASCHE MIT RUM - 517 ---------------------------
product = brewing:addProduct(catId, 517, 52, 70, 102, 204)
product:addIngredient(518) -- Schritt 6: leere Flasche(1317) 1x
product:addIngredient(778, 4) -- Schritte 1 - 4: Zuckerrohr(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT RUM - FERTIG ---------------------------

------------------- FLASCHE MIT BEERENSCHNAPS - 1315 ---------------------------
product = brewing:addProduct(catId, 1315, 54, 75, 114, 228)
product:addIngredient(1317) -- Schritt 6: leere Flasche(1317) 1x
product:addIngredient(81, 2*2) -- Schritt 1 - 2: Beeren(81) 2x
product:addIngredient(147, 2*2) -- Schritt 3 - 4: Brombeeren(147) 2x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT BEERENSCHNAPS - FERTIG ---------------------------

------------------- FLASCHE MIT BÄRENTÖTER - 1316 ---------------------------
product = brewing:addProduct(catId, 1316, 56, 75, 114, 228)
product:addIngredient(1317) -- Schritt 6: leere Flasche(1317) 1x
product:addIngredient(15, 4*2) -- Schritt 1 - 4: Apfel(15) 2x
product:addIngredient(2529, 2) -- Schritt 5: Honig(2529) x2
product:addIngredient(159) -- Schritt 6: Fliegenpilz(159) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT BÄRENTÖTER - FERTIG ---------------------------

------------------- FLASCHE MIT KIRSCHSCHNAPS - 1319 ---------------------------
product = brewing:addProduct(catId, 1319, 77, 95, 144, 288)
product:addIngredient(1317) -- Schritt 6: leere Flasche(1317) 1x
product:addIngredient(302, 4*2) -- Schritt 1 - 4: Kirschen(302) 2x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT KIRSCHSCHNAPS - FERTIG ---------------------------

------------------- FLASCHE MIT ELBENWEIN - 1318 ---------------------------
product = brewing:addProduct(catId, 1318, 87, 100, 135, 270)
product:addIngredient(1317) -- Schritt 1: leere Flasche(1317) 1x
product:addIngredient(759, 2) -- Schritt 2 - 2: Nüsse(759) x1
product:addIngredient(80, 3) -- Schritt 3: Bananen(80) x3
product:addIngredient(2529, 2) -- Schritt 4: Honig(2529) x2
product:addIngredient(52) -- Schritt 5: Eimer mit Wasser(52) 1x
product:addRemnant(51)
------------------- FLASCHE MIT ELBENWEIN - FERTIG ---------------------------


catId = brewing:addCategory("Juices", "Säfte") -- Tee, Smoothies, Saft :p

------------------- FLASCHE MIT JUNGFERNKRAUTTEE - 787 ---------------------------
product = brewing:addProduct(catId, 787, 29, 45, 110, 220)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(144, 3*2) -- Schritt 1 - 3: Jungfernkraut(144) 2x
product:addIngredient(147, 2) -- Schritt 4: Brombeeren(147) 2x
product:addIngredient(2529) -- Schritt 5: Honig(2529) x1
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT TEE - FERTIG ---------------------------

------------------- FLASCHE MIT KOHLSAFT - 786 ---------------------------
product = brewing:addProduct(catId, 786, 33, 50, 72, 144)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(290, 3*2) -- Schritt 1 - 4: Kohl(290) 2x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT KOHLSAFT - FERTIG ---------------------------

------------------- BOTTLE OF ORANGE JUICE- 3611 ---------------------------
product = brewing:addProduct(catId, 3611, 45, 65, 90, 180)
product:addIngredient(790) -- Step 1: Empty bottle(790) 1x
product:addIngredient(1207, 3*2) -- Step 2 -3 Oranges (1207) 2x
product:addIngredient(778) --Step 4: Sugarcane(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 5: Bucket of water (52) 1x
------------------- BOTTLE WITH ORANGE JUICE DONE ---------------------------

------------------- FLASCHE MIT KAROTTENSAFT - 788 ---------------------------
product = brewing:addProduct(catId, 788, 57, 75, 114, 228)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(2493, 3*2) -- Schritt 1 - 3: Karotten(2493) 2x
product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 7: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT KAROTTENSAFT - FERTIG ---------------------------

------------------- FLASCHE MIT BROMBEERSAFT - 783 Dunkelblau ---------------------------
product = brewing:addProduct(catId, 783, 63, 85, 126, 252)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(147, 3*2) -- Schritt 1 - 3: Brombeeren(147) 2x
product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT BROMBEERSAFT - FERTIG ---------------------------

------------------- FLASCHE MIT MANDARINENSAFT - 784 ---------------------------
product = brewing:addProduct(catId, 784, 68, 90, 132, 264)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(199, 3*2) -- Schritt 1 - 3: Mandarinen(199) 2x
product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT MANDARINENSAFT - FERTIG ---------------------------

------------------- FLASCHE MIT ERDBEERSAFT - 789 ---------------------------
product = brewing:addProduct(catId, 789, 73, 95, 144, 288)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(151, 3*2) -- Schritt 1 - 3: Erdbeeren(151) 2x
product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT ERDBEERSAFT - FERTIG ---------------------------

------------------- FLASCHE MIT BANANENSAFT - 785 ---------------------------
product = brewing:addProduct(catId, 785, 78, 100, 150, 300)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(80, 3*2) -- Schritt 1 - 3: Bananen(80) 2x
product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT BANANENSAFT - FERTIG ---------------------------

------------------- FLASCHE MIT TRAUBENSAFT - 791 ---------------------------
product = brewing:addProduct(catId, 791, 83, 100, 150, 300)
product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
product:addIngredient(388, 3*2) -- Schritt 1 - 3: Trauben(388) 2x
product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
product:addIngredient(52)
product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
------------------- FLASCHE MIT TRAUBENSAFT - FERTIG ---------------------------
