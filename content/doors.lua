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
require("base.lookat")

module("content.doors", package.seeall)


function initDoors()
    -- AddDoor({x, y, z}, lockId, lookAtEN, lookAtDE) -- description
	-- if you want no lookat, just use false: AddDoor({1, 1, 1}, 343, false, false)
	-- if you just want lookats, but no lock: AddDoor({1, 1, 1}, false, "Door without lock", "Tür ohne Schloss")
	-- if you want a lock, which isn't locked after reload: AddDoor({1, 1, 1}, 343, "Unlocked door", "Unverschlossene Tür", false) 
	
	-- Galmair 1xx
	AddDoor({341, 207, 0}, 100,"Golden Dreams, the private chamber of the Don","Goldträume, die Privatkammer des Dons"); -- Don's private room !create 2122 1 333 lockId=100
	AddDoor({352, 213, 0}, 101,"Treasury","Schatzkammer"); -- Don's treasury !create 2124 1 333 lockId=101
	AddDoor({352, 214, 0}, 101,"Treasury","Schatzkammer"); -- Don's treasury !create 2124 1 333 lockId=101
	AddDoor({352, 215, 0}, 101,"Treasury","Schatzkammer"); -- Don's treasury !create 2124 1 333 lockId=101
	AddDoor({416, 249, 0}, 102,"Galmair Towngate","Galmair Stadttor", false);
	AddDoor({416, 250, 0}, 102,"Galmair Towngate","Galmair Stadttor", false);


	AddDoor({373, 322, 0}, 110,"House of Malachite","Malachite Haus"); -- guild house I !create 2145 1 333 lockId=110
	AddDoor({374, 311, 0}, 110,"House of Malachite-Bathroom","Malachite Haus-Toilette"); -- guild house I !create 2145 1 333 lockId=110
	AddDoor({374, 314, 0}, 110,"House of Malachite-Bathroom","Malachite Haus-Badezimmer"); -- guild house I !create 2145 1 333 lockId=110
	AddDoor({301, 280, 0}, 111,"Villa Goldvein","Villa Goldader"); -- guild house II !create 2145 1 333 lockId=111
	AddDoor({304, 274, 0}, 111,"Villa Goldvein","Villa Goldader"); -- guild house II !create 2145 1 333 lockId=111

	AddDoor({416, 217,-6}, 120,"Flat Irmorom","Wohnung Irmorom"); -- flat room I - 2p !create 2161 1 333 lockId=120
	AddDoor({425, 222,-6}, 121,"Flat Elara","Wohnung Elara"); -- flat room II - 3p !create 2161 1 333 lockId=121
	AddDoor({424, 231,-6}, 122,"Flat Adron","Wohnung Adron"); -- flat room III - 1p !create 2161 1 333 lockId=122
	AddDoor({423, 241,-6}, 123,"Flat Malachin","Wohnung Malachin"); -- flat room IV - 2p !create 2161 1 333 lockId=123
	AddDoor({416, 239,-6}, 124,"Flat Oldra","Wohnung Oldra"); -- flat room V - 4p !create 2161 1 333 lockId=124
	AddDoor({425, 241,-5}, 125,"Flat Nargun","Wohnung Nargun"); -- flat room VI - 2p !create 2161 1 333 lockId=125
	AddDoor({426, 231,-5}, 126,"Flat Ronagan","Wohnung Ronagan"); -- flat room VII - 2p !create 2161 1 333 lockId=126
	AddDoor({427, 221,-5}, 127,"Flat Sirani","Wohnung Sirani"); -- flat room VIII - 3p !create 2161 1 333 lockId=127
	AddDoor({416, 216,-5}, 128,"Flat Zhambra","Wohnung Zhambra"); -- flat room IX - 3p !create 2161 1 333 lockId=128

	AddDoor({342, 238,-6}, 103,"Hog Dens","Schweinebaue", false); -- Scoria Mine
	AddDoor({342, 239,-6}, 103,"Hog Dens","Schweinebaue", false); -- Scoria Mine
	AddDoor({385, 193,-6}, 103,"Hog Dens","Schweinebaue", false); -- Scoria Mine
	AddDoor({386, 193,-6}, 103,"Hog Dens","Schweinebaue", false); -- Scoria Mine
	AddDoor({381, 208,-6}, 103,"Hog Dens-Cameo Pit","Schweinebaue-Gemmenschacht", false); -- Scoria Mine
	AddDoor({381, 209,-6}, 103,"Hog Dens-Cameo Pit","Schweinebaue-Gemmenschacht", false); -- Scoria Mine
	AddDoor({363, 206,-6}, 103,"Hog Dens-Arena","Schweinebaue-Arena", false); -- Scoria Mine
	AddDoor({362, 206,-6}, 103,"Hog Dens-Arena","Schweinebaue-Arena", false); -- Scoria Mine
	AddDoor({344, 244,-6}, 103,"Cameo Pit","Gemmenschacht", false); -- Scoria Mine
	AddDoor({344, 245,-6}, 103,"Cameo Pit","Gemmenschacht", false); -- Scoria Mine
	AddDoor({392, 220,-6}, 103,"Cameo Pit-Hog Dens","Gemmenschacht-Schweinebaue", false); -- Scoria Mine
	AddDoor({393, 220,-6}, 103,"Cameo Pit-Hog Dens","Gemmenschacht-Schweinebaue", false); -- Scoria Mine
	AddDoor({382, 241,-6}, 103,"Cameo Pit-Temple of Ronagan","Gemmenschacht-Tempel des Ronagan", false); -- Scoria Mine
	AddDoor({383, 241,-6}, 103,"Cameo Pit-Temple of Ronagan","Gemmenschacht-Tempel des Ronagan", false); -- Scoria Mine
	AddDoor({343, 250,-6}, 103,"Temple of Ronagan","Tempel des Ronagan", false); -- Scoria Mine
	AddDoor({343, 251,-6}, 103,"Temple of Ronagan","Tempel des Ronagan", false); -- Scoria Mine
	AddDoor({385, 279,-6}, 103,"Temple of Ronagan-Winged Sow Taverne","Tempel des Ronagan-Taverne zur Geflügelten Sau", false); -- Scoria Mine
	AddDoor({386, 279,-6}, 103,"Temple of Ronagan-Winged Sow Taverne","Tempel des Ronagan-Taverne zur Geflügelten Sau", false); -- Scoria Mine
	AddDoor({382, 260,-6}, 103,"Temple of Ronagan-Cameo Pit","Tempel des Ronagan-Gemmenschacht", false); -- Scoria Mine
	AddDoor({383, 260,-6}, 103,"Temple of Ronagan-Cameo Pit","Tempel des Ronagan-Gemmenschacht", false); -- Scoria Mine
	AddDoor({338, 253,-6}, 103,"Winged Sow Taverne","Taverne zur Geflügelten Sau", false); -- Scoria Mine
	AddDoor({339, 253,-6}, 103,"Winged Sow Taverne","Taverne zur Geflügelten Sau", false); -- Scoria Mine
	AddDoor({370, 292,-6}, 103,"Winged Sow Taverne-Temple of Ronagan","Taverne zur Geflügelten Sau-Tempel des Ronagan", false); -- Scoria Mine
	AddDoor({370, 293,-6}, 103,"Winged Sow Taverne-Temple of Ronagan","Taverne zur Geflügelten Sau-Tempel des Ronagan", false); -- Scoria Mine
	AddDoor({380, 325,-6}, 103,"Winged Sow Taverne","Taverne zur Geflügelten Sau", false); -- Scoria Mine
	AddDoor({379, 325,-6}, 103,"Winged Sow Taverne","Taverne zur Geflügelten Sau", false); -- Scoria Mine
	AddDoor({400, 327,-6}, 103,"Winged Sow Taverne - Storeroom","Taverne zur Geflügelten Sau - Lagerraum", false); -- Scoria Mine
	AddDoor({342, 252, 0}, 103,"Winged Sow Taverne","Taverne zur Geflügelten Sau", false); -- Scoria Mine
	AddDoor({332, 253,-6}, 103,"Sewers","Abwasserschächte", false); -- Scoria Mine
	AddDoor({333, 253,-6}, 103,"Sewers","Abwasserschächte", false); -- Scoria Mine
	AddDoor({327, 251,-6}, 103,"Flicker Swale","Schimmersenke", false); -- Scoria Mine
	AddDoor({327, 252,-6}, 103,"Flicker Swale","Schimmersenke", false); -- Scoria Mine
	AddDoor({248, 295,-6}, 103,"Game room","Spielraum", false); -- Scoria Mine
	AddDoor({249, 295,-6}, 103,"Game room","Spielraum", false); -- Scoria Mine
	AddDoor({249, 297,-5}, 103,"Temple of Nargun","Tempel des Nargun", false); -- Scoria Mine
	AddDoor({250, 297,-5}, 103,"Temple of Nargun","Tempel des Nargun", false); -- Scoria Mine
--	AddDoor({346, 160,-7}, 103,"Arena","Arena", false); -- Scoria Mine
	AddDoor({336, 194,-6}, 103,"Arena-Hog Dens","Arena-Schweinebaue", false); -- Scoria Mine
	AddDoor({336, 195,-6}, 103,"Arena-Hog Dens","Arena-Schweinebaue", false); -- Scoria Mine
	AddDoor({335, 238,-6}, 103,"Arena","Arena", false); -- Scoria Mine
	AddDoor({334, 238,-6}, 103,"Arena","Arena", false); -- Scoria Mine
	AddDoor({389, 225, 0}, 103,"Cameo Pit-Temple of Ronagan","Gemmenschacht-Tempel des Ronagan", false);

	AddDoor({367, 255, 0}, 104,"Galmair's Crest","Galmairs Krone", false); -- Galmair's Crest
	AddDoor({368, 255, 0}, 104,"Galmair's Crest","Galmairs Krone", false); -- Galmair's Crest
	AddDoor({367, 244, 0}, 104,"Galmair's Crest","Galmairs Krone", false); -- Galmair's Crest
	AddDoor({368, 244, 0}, 104,"Galmair's Crest","Galmairs Krone", false); -- Galmair's Crest
	AddDoor({355, 221, 0}, 104,"Library","Bibilothek", false); -- Galmair's Crest
	AddDoor({370, 221, 0}, 104,"Library","Bibilothek", false); -- Galmair's Crest
	AddDoor({370, 232, 0}, 104,"Exchange + Kitchen","Wechselstube + Küche", false); -- Galmair's Crest
	AddDoor({364, 236, 0}, 104,"Council Chamber","Konzil Kammer", false); -- Galmair's Crest
	AddDoor({348, 229, 0}, 104,"Guilianni Residence","Guilianni Residenz", false); -- Galmair's Crest

	AddDoor({308, 238, 1}, 104,"Temple of Irmorom","Tempel des Irmorom", false); 
	AddDoor({309, 238, 1}, 104,"Temple of Irmorom","Tempel des Irmorom", false);
	AddDoor({378, 272, 0}, 104,"Workshop","Werkstatt", false); 
	AddDoor({383, 284, 0}, 104,"Workshop","Werkstatt", false);
	AddDoor({408, 295, 0}, 104,"Sleepy Bujhaar Inn","Gasthaus zum Schlafenden Bujhaar", false); 
	AddDoor({414, 298, 0}, 112,"Bedroom","Schlafraum", false); -- Sleepy Bujhaar Inn
	AddDoor({412, 293, 1}, 113,"Bedroom","Schlafraum", false); -- Sleepy Bujhaar Inn
	AddDoor({419, 296, 1}, 114,"Bedroom","Schlafraum", false); -- Sleepy Bujhaar Inn 
	AddDoor({418, 301, 1}, 114,"Balcony","Balkon", false); -- Sleepy Bujhaar Inn
	AddDoor({421, 290, 1}, 115,"Bedroom","Schlafraum", false); -- Sleepy Bujhaar Inn
	AddDoor({404, 269, 1}, 104,"Census office","Zensusbüro", false);
	AddDoor({401, 263, 0}, 104,"Herbs room","Kräuterkammer", false);
	AddDoor({394, 247, 0}, 104,"Guardroom","Wachstube", false);
	AddDoor({391, 241, 0}, 104,"Guardroom","Wachstube", false);
	AddDoor({387, 246, 0}, 104,"Debt-collector","Schuldeneintreiber", false);

	AddDoor({392, 159, 0}, 105,"Copperhand-Tunnel","Copperhand-Tunnel", false);
	AddDoor({393, 159, 0}, 105,"Copperhand-Tunnel","Copperhand-Tunnel", false);




	-- Galmair end
    
	-- Runewick 2xx
    --Tower of Fire 20x
	AddDoor({901, 763, 2}, 200,"Archmage Elvaine Morgan's rooms", "Die Räumlichkeiten von Erzmagier Elvaine Morgan"); -- Archmage's room
    AddDoor({901, 764, 2}, 200,"Archmage Elvaine Morgan's rooms", "Die Räumlichkeiten von Erzmagier Elvaine Morgan"); -- Archmage's room
 
	AddDoor({902, 770, 4}, 201,"Tower of Fire Apartment 1","Turm des Feuers Appartement 1") -- 2 Persons
    AddDoor({902, 771, 4}, 201,"Tower of Fire Apartment 1","Turm des Feuers Appartement 1") -- 2 Persons

    AddDoor({902, 777, 4}, 202,"Tower of Fire Apartment 1","Turm des Feuers Appartement 2") -- 3 Persons	+ Balcony	
    AddDoor({903, 777, 4}, 202,"Tower of Fire Apartment 1","Turm des Feuers Appartement 2") -- 3 Persons	+ Balcony	
	
	AddDoor({903, 786, 1}, false, "Tower of Fire", "Turm des Feuers")
	AddDoor({902, 786, 1}, false, "Tower of Fire", "Turm des Feuers")

	AddDoor({924, 762, 1}, false, "Tower of Fire", "Turm des Feuers")
	AddDoor({924, 763, 1}, false, "Tower of Fire", "Turm des Feuers")

	AddDoor({922, 764, 1}, false, "Tower of Fire", "Turm des Feuers")
	AddDoor({921, 764, 1}, false, "Tower of Fire", "Turm des Feuers")

	AddDoor({902, 770, 1}, false, "Library of Fire", "Bibliothek des Feuers")
	AddDoor({902, 769, 0}, false, "Library of Fire", "Bibliothek des Feuers")

	AddDoor({903, 768, 2}, false, "Hall of Elara", "Halle der Elara")
	AddDoor({902, 768, 2}, false, "Hall of Elara", "Halle der Elara")

	AddDoor({903, 769, 3}, false, "Brágon´s Stronghold", "Brágons Bollwerk")
	AddDoor({904, 769, 3}, false, "Brágon´s Stronghold", "Brágons Bollwerk")
            
    --Tower of Air 21x
    AddDoor({907, 833, 4}, 210,"Tower of Air Apartment 1","Turm der Luft Appartement 1") -- 2 Persons
    AddDoor({906, 833, 4}, 210,"Tower of Air Apartment 1","Turm der Luft Appartement 1") -- 2 Persons
    
    AddDoor({898, 834, 4}, 211,"Tower of Air Apartment 2","Turm der Luft Appartement 2") -- 3 Persons
    AddDoor({898, 835, 4}, 211,"Tower of Air Apartment 2","Turm der Luft Appartement 2") -- 3 Persons
	
	AddDoor({907, 832, 3}, false, "House of Gods", "Haus der Götter")
	AddDoor({907, 833, 3}, false, "House of Gods", "Haus der Götter")

	AddDoor({905, 832, 2}, false, "Shrine of Elara", "Schrein der Elara")
	AddDoor({904, 832, 2}, false, "Shrine of Elara", "Schrein der Elara")

	AddDoor({904, 833, 1}, false, "Library of Air", "Bibliothek der Luft")
	AddDoor({904, 834, 1}, false, "Library of Air", "Bibliothek der Luft")

	AddDoor({903, 815, 1}, false, "Tower of Air", "Turm der Luft")
	AddDoor({902, 815, 1}, false, "Tower of Air", "Turm der Luft")

	AddDoor({901, 817, 1}, false, "Tower of Air", "Turm der Luft")
	AddDoor({901, 816, 1}, false, "Tower of Air", "Turm der Luft")

	AddDoor({905, 829, 0}, false, "Tree kitchen", "Baumküche")
	AddDoor({905, 830, 0}, false, "Tree kitchen", "Baumküche")

	AddDoor({896, 841, 1}, false, "Room of Spirit", "Raum des Glaubens")
	AddDoor({895, 841, 1}, false, "Room of Spirit", "Raum des Glaubens")

	AddDoor({897, 834, 2}, false, "Dormitory", "Schlafsaal")
	AddDoor({897, 835, 2}, false, "Dormitory", "Schlafsaal")

	AddDoor({918, 832, 1}, 212, "Danger, keep out!", "ACHTUNG! Lebensgefahr!")
	AddDoor({918, 833, 1}, 212, "Danger, keep out!", "ACHTUNG! Lebensgefahr!")

	AddDoor({917, 834, 1}, 213, "Danger, keep out!", "ACHTUNG! Lebensgefahr!")
	AddDoor({916, 834, 1}, 213, "Danger, keep out!", "ACHTUNG! Lebensgefahr!")
    
    --Tower of Earth 22x
    AddDoor({946, 763, 4}, 220,"Tower of Earth Apartment 1","Turm der Erde Appartement 1") -- 3 Persons
    AddDoor({947, 763, 4}, 220,"Tower of Earth Apartment 1","Turm der Erde Appartement 1") -- 3 Persons
            
    AddDoor({946, 759, 4}, 221,"Tower of Earth Apartment 2","Turm der Erde Appartement 2") -- 1 Person
    AddDoor({947, 759, 4}, 221,"Tower of Earth Apartment 2","Turm der Erde Appartement 2") -- 1 Person
    
    AddDoor({944, 764, 2}, 222,"Tower of Earth Apartment 3","Turm der Erde Appartement 3") -- 2 Persons + Balcony
    AddDoor({944, 765, 2}, 222,"Tower of Earth Apartment 3","Turm der Erde Appartement 3") -- 2 Persons + Balcony
	
	AddDoor({939, 762, 1}, false, "Tower of Earth", "Turm der Erde")
	AddDoor({939, 761, 1}, false, "Tower of Earth", "Turm der Erde")

	AddDoor({946, 761, 0}, false, "Chamber of Experiments", "Versuchskammer")
	AddDoor({946, 762, 0}, false, "Chamber of Experiments", "Versuchskammer")

	AddDoor({951, 758, 1}, false, "Library of Earth", "Bibliothek der Erde")
	AddDoor({950, 758, 1}, false, "Library of Earth", "Bibliothek der Erde")

	AddDoor({946, 764, 2}, false, "Root Chamber", "Wurzelkammer")
	AddDoor({946, 765, 2}, false, "Root Chamber", "Wurzelkammer")

	AddDoor({949, 759, 3}, false, "Kettle Chamber", "Kesselkammer")
	AddDoor({949, 760 ,3}, false, "Kettle Chamber", "Kesselkammer")

	AddDoor({945, 769, 1}, 223, "Danger, keep out!", "ACHTUNG! Lebensgefahr!")
	AddDoor({946, 769, 1}, 223, "Danger, keep out!", "ACHTUNG! Lebensgefahr!")
	
	-- Slums
	AddDoor({900, 817, 0}, false, "Pit Latrine", "Scheißhaus")
	
	--Homelands 25x
    AddDoor({749, 802, 0}, 250,"Quadruped Red Bird","Vierbeiniger Roter Vogel")
    AddDoor({748, 802, 0}, 250,"Quadruped Red Bird","Vierbeiniger Roter Vogel")
          
    AddDoor({790, 794, 0}, 251,"Cottage","Landhaus")
    AddDoor({789, 794, 0}, 251,"Cottage","Landhaus")
	-- Runewick end

	-- Cadomyr 3xx
	AddDoor({122, 547, 0}, false,"Palace","Palast");
	AddDoor({121, 547, 0}, false,"Palace","Palast");
	AddDoor({128, 520, 0}, 300,"Royal Chamber","Königliche Kammer");
	AddDoor({128, 519, 0}, 300,"Royal Chamber","Königliche Kammer"); --!create 3054 1 333 lockId=300

	AddDoor({ 96, 615, 1}, false,"Villa Rosaline - Balcony","Villa Rosaline - Balkon"); 
	AddDoor({ 94, 612, 0}, 310,"Villa Rosaline","Villa Rosaline"); --!create 3054 1 333 lockId=310
	AddDoor({ 94, 613, 0}, 310,"Villa Rosaline","Villa Rosaline"); --!create 3054 1 333 lockId=310
	AddDoor({ 88, 600, 1}, false,"Villa Edward - Balcony","Villa Edward - Balkon");
	AddDoor({ 90, 605, 0}, 311,"Villa Edward","Villa Edward"); --!create 3054 1 333 lockId=311
	AddDoor({ 91, 605, 0}, 311,"Villa Edward","Villa Edward"); --!create 3054 1 333 lockId=311
	AddDoor({ 93, 560, 0}, 312,"Villa Reginald","Villa Reginald"); --!create 3054 1 333 lockId=312

	AddDoor({145, 628, 0}, 320,"Flat quarter - Responsibility","Wohnungsquartier - Verantwortung"); --!create 2558 1 333 lockId=320
	AddDoor({138, 604, 0}, 321,"Flat quarter - Faith & Obedience","Wohnungsquartier - Glaube & Gehorsam"); --!create 2558 1 333 lockId=321
	AddDoor({139, 604, 1}, 322,"Flat quarter - Honour & Lineage","Wohnungsquartier - Ehre & Abstammung"); --!create 2558 1 333 lockId=322
	AddDoor({137, 610, 0}, 323,"Flat quarter - Truth & Justice","Wohnungsquartier - Ehrlichkeit & Gerechtigkeit"); --!create 2558 1 333 lockId=323
	AddDoor({138, 610, 1}, 324,"Flat quarter - Courage","Wohnungsquartier - Courage"); --!create 2558 1 333 lockId=324
	AddDoor({136, 615, 0}, 325,"Flat quarter - Patriarchy","Wohnungsquartier - Patriarchat"); --!create 2558 1 333 lockId=325
	AddDoor({137, 615, 1}, 326,"Flat quarter - Property","Wohnungsquartier - Besitz"); --!create 2558 1 333 lockId=326
	AddDoor({144, 627, 1}, 327,"Flat quarter - Alertness","Wohnungsquartier - Wachsamkeit"); --!create 2558 1 333 lockId=327

	AddDoor({116, 633, 0}, false,"Cadomyr Towngate","Cadomyr Stadttor");
	AddDoor({115, 633, 0}, false,"Cadomyr Towngate","Cadomyr Stadttor");	
	AddDoor({113, 633, 0}, false,"Cadomyr Towngate","Cadomyr Stadttor");
	AddDoor({112, 633, 0}, false,"Cadomyr Towngate","Cadomyr Stadttor");	
	AddDoor({129, 633, 0}, false,"Quartermaster Store","Quartiermeisters Laden");
	AddDoor({129, 632, 0}, false,"Quartermaster Store","Quartiermeisters Laden");
	AddDoor({129, 624, 0}, false,"Quartermaster Store","Quartiermeisters Laden");
	AddDoor({129, 623, 0}, false,"Quartermaster Store","Quartiermeisters Laden");
	AddDoor({130, 624, 1}, false,"Civic Hall","Stadtsaal");
	AddDoor({130, 623, 1}, false,"Civic Hall","Stadtsaal");
	AddDoor({129, 633, 1}, false,"Civic Hall","Stadtsaal");
	AddDoor({129, 632, 1}, false,"Civic Hall","Stadtsaal");
	AddDoor({138, 635, 1}, false,"Civic Hall","Stadtsaal");
	AddDoor({137, 635, 1}, false,"Civic Hall","Stadtsaal");
	AddDoor({ 81, 626, 1}, false,"Guard room","Wachstube");
	AddDoor({ 82, 626, 1}, false,"Guard room","Wachstube");
	AddDoor({ 79, 622, 0}, false,"Guard room","Wachstube");
	AddDoor({ 79, 621, 0}, false,"Guard room","Wachstube");

	AddDoor({107, 558, 0}, false,"Census office","Zensusbüro");
	AddDoor({ 86, 577, 1}, false,"Inn Lakeshore","Gasthaus Seeufer");
	AddDoor({ 87, 574, 1}, false,"Inn Lakeshore","Gasthaus Seeufer");
	AddDoor({ 85, 574, 1}, false,"Inn Lakeshore","Gasthaus Seeufer");
	AddDoor({ 83, 581, 1}, false,"Inn Lakeshore - Balcony","Gasthaus Seeufer - Balkon");
	AddDoor({ 84, 578, 0}, false,"Inn Lakeshore","Gasthaus Seeufer");
	AddDoor({ 89, 578, 0}, false,"Inn Lakeshore","Gasthaus Seeufer");
	AddDoor({ 84, 585, 0}, false,"Inn Lakeshore","Gasthaus Seeufer");
	AddDoor({ 89, 585, 0}, false,"Inn Lakeshore","Gasthaus Seeufer");
	AddDoor({100, 576, 0}, false,"Tavern Unicorn Lion","Taverne Einhörniger Löwe");
	AddDoor({113, 586, 0}, false,"Tavern Unicorn Lion","Taverne Einhörniger Löwe");


--Hemptie Necktie Inn
	AddDoor({699, 311, 1}, 401,"Trolls Bane","Trolls Bane")
	AddDoor({699, 323, 1}, 402,"Silverbrand","Silberbrand")
	AddDoor({709, 315, 1}, 403,"Greenbriar","Greenbriar")
	AddDoor({709, 319, 1}, 404,"Varshikar","Varshikar")

	-- Irundar xxx
    --AddDoor( -42, 193, -9,  X00); -- Irundar Gate
    --AddDoor( -49, 174, -9,  X01); -- Irundar Smith
    --AddDoor( -49, 175, -9,  X01); -- Irundar Smith
    --AddDoor( -35, 195, -9,  X02); -- Irundar Mage Tower
    --AddDoor( -35, 196, -9,  X02); -- Irundar Mage Tower
    --AddDoor( -30, 194, -7,  X03); -- Irundar Mage Tower
    --AddDoor( -53, 159, -9,  X04); -- Irundar General Store
    --AddDoor( -50, 166, -9,  X04); -- Irundar General Store
    --AddDoor( -51, 166, -9,  X04); -- Irundar General Store
    --AddDoor( -47, 147, -9,  X05); -- Irundar Castle - Advisor
    --AddDoor( -45, 149, -9,  X05); -- Irundar Castle - Advisor
    --AddDoor( -44, 150, -8,  X06); -- Irundar Castle - Bedroom
    --AddDoor( -44, 151, -8,  X06); -- Irundar Castle - Bedroom
    --AddDoor( -44, 143, -8,  X07) -- Irundar Castle - Storage Room
    --AddDoor( -49, 142, -8,  X08); -- Irundar Castle - Tower
	
	--Warlocks Well

end

function AddDoor(posList,lockId, lookAtEN, lookAtDE, lockedOnreload)
    local DoorPos=position(posList[1],posList[2],posList[3]);
	if world:isItemOnField(DoorPos) then
        local thisDoor = world:getItemOnField(DoorPos);
        local doorOOK = base.doors.CheckOpenDoor(thisDoor.id);
        local doorCOK = base.doors.CheckClosedDoor(thisDoor.id);
        if (doorOOK or doorCOK) then
            if lockId then
				thisDoor:setData("lockId", lockId);
				if lockedOnreload == false then
					thisDoor:setData("doorLock","unlocked")
				else
					thisDoor:setData("doorLock","locked")
				end
				world:changeItem(thisDoor)
			end
			if lookAtEN and lookAtDE then
			    base.lookat.SetSpecialDescription(thisDoor,lookAtDE,lookAtEN)
				world:changeItem(thisDoor)
			end	
			if (doorOOK) then
                base.doors.CloseDoor(thisDoor);
			end
		end
    end
end	
