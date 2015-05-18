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
-- UPDATE common SET com_script='gm.items.id_100_trowel' WHERE com_itemid = 100;

local M = {}


-- That list contains nearly all items a player can carry.
itemList = {
306,-- Schinken ham
307 ,--Schweinefleisch pork
354 ,--Erdbeertorte strawberry cake
755 ,--Feuerwurz fire root
756 ,--Frommbeeren pious berry
41 ,--Glasblock glass ingot
227 ,--Kochlöffel cooking spoon
335 ,--Laute lute
353 ,--Apfelkuchen apple pie
355 ,--Lachs salmon
356 ,--Schlapphut hat
357 ,--blauer Zauberhut blue wizard hat
358 ,--roter Zauberhut red wizard hat
363 ,--Lederschuppenrüstung leather scale armour
364 ,--leichte Jagdrüstung light hunting armour
365 ,--halbe Lederrüstung half leather armour
366 ,--Lederbeinschienen leather leggings
367 ,--kurze Lederbeinschienen short leather leggings
400 ,--Kerze candle
534 ,--Zwiebelsamen onion seeds
43 ,--Kerzen candles
1840 ,--Kupferkelch copper goblet
1908 ,--Glaskrug glass mug
1909 ,--Bierkrug beer mug
1910 ,--Bierkrug beer mug
2056 ,--Glas mit Met glass with mead
2057 ,--Glas mit Wein glass with wine
2058 ,--Glas mit Wasser glass with water
2059 ,--Glas mit Cider glass with cider
2112 ,--kurze Kettenhose short chain trousers
2114 ,--kurze Fellhose short fur trousers
2116 ,--eiserne Beinschienen iron greaves
2117 ,--kurze eiserne Beinschienen short iron greaves
766 ,--Trugblüte con blossom
2683 ,--weiße Farbe white dye
3076 ,--Kupferstücke copper coins
17 ,--Holzschild wooden shield
34 ,--schwarze Hose black trousers
78 ,--Kurzschwert short sword
181 ,--blaues Hemd blue shirt
559 ,--Lamm mit Beilage lamb dish
726 ,--grober Sand coarse sand
733 ,--Steinquader stone block
767 ,--Wasserblüte water blossom
734 ,--Ziegelform brick mould
768 ,--Wolfsfarn wolverine fern
769 ,--Wüstenbeere desert berry
735 ,--roher Stein raw stone
736 ,--ungebrannte Ziegel unfired bricks
737 ,--Meißel chisel
738 ,--Drachenei dragon egg
770 ,--Ritterstiefel knight boots
182 ,--schwarzes Hemd black shirt
184 ,--Visierhelm visored helmet
728 ,--Hopfenwurzel hop seeds
765 ,--Tagtraum daydream
916 ,--verzierter Turmschild ornate tower shield
917 ,--verfluchter Schild cursed shield
2678 ,--schwarze Farbe black dye
2680 ,--blaue Farbe blue dye
92 ,--Öllampe oil lamp
118 ,--Nudelholz rolling pin
121 ,--Brotschieber peel
177 ,--gelber Stoff yellow cloth
178 ,--weißer Stoff white cloth
179 ,--blauer Stoff blue cloth
180 ,--rotes Hemd red shirt
155 ,--Sibanacblatt sibanac leaf
156 ,--Steppenfarn steppe fern
158 ,--Knollenschwammpilz bulbsponge mushroom
159 ,--Fliegenpilz toadstool
160 ,--Rotköpfchen red head
161 ,--Hirtenpilz herder's mushroom
162 ,--Geburtspilz birth mushroom
163 ,--Champignon champignon
164 ,--leere Flasche empty bottle
168 ,--Wollknäuel ball of wool
174 ,--roter Stoff red cloth
175 ,--schwarzer Stoff black cloth
176 ,--grauer Stoff grey cloth
772 ,--Tabak tobacco
773 ,--Tabaksamen tobacco seeds
764 ,--Dunkelmoos dark moss
170 ,--Wollballen bale of wool
90 ,--Flöte flute
94 ,--Topfhelm pot helmet
95 ,--Wappenschild heraldic shield
96 ,--Stahlturmschild steel tower shield
97 ,--Ledertasche leather bag
101 ,--Kettenhemd chain mail
104 ,--Silberbarren silver ingot
126 ,--Sichel sickle
135 ,--Gelbkraut yellow weed
136 ,--Wutbeere anger berry
137 ,--Flammkelchblüte flamegoblet blossom
138 ,--Nachtengelsblüte night angels blossom
76 ,--Magierstab mage's staff
88 ,--Langaxt longaxe
89 ,--Schleuder sling
140 ,--Donfblatt donf blade
141 ,--schwarze Distel black thistle
142 ,--Sandbeere sandberry
143 ,--roter Holunder red elder
145 ,--Heideblüte heath flower
146 ,--Wüstenhimmelkapsel desert sky capsule
147 ,--Brombeere blackberry
148 ,--Firnisblüte firnis blossom
149 ,--Tannen-Sproß fir tree sprout
151 ,--Erdbeere strawberry
153 ,--Fussblatt foot leaf
154 ,--Hopfen hop
778 ,--Zuckerrohr sugarcane
779 ,--Zuckerrohrsamen sugarcane seeds
39 ,--Schädelstab skull staff
45 ,--Smaragd emerald
57 ,--einfacher Magierstab simple mage's staff
1317 ,--kleine leere Flasche small empty bottle
223 ,--Eisenkelch iron goblet
224 ,--Goldkelch golden goblet
225 ,--Krone crown
226 ,--Kriegshammer warhammer
230 ,--Streitkolben mace
235 ,--Goldring golden ring
236 ,--Goldbarren gold ingot
251 ,--Roher Amethyst raw amethyst
254 ,--Rohdiamant raw diamond
256 ,--Roher Smaragd raw emerald
258 ,--Dreschflegel flail
784 ,--Flasche mit Mandarinensaft bottle of tangerine juice
786 ,--Flasche mit Kohlsaft bottle of cabbage juice
152 ,--Lebenswurzel life root
788 ,--Flasche mit Karottensaft bottle of carrot juice
789 ,--Flasche mit Erdbeersaft bottle of strawberry juice
91 ,--Malachíndolch Malachín dagger
253 ,--Roher Saphir raw sapphire
252 ,--Roher Obsidian raw obsidian
231 ,--Streitflegel battle flail
787 ,--Flasche mit Jungfernkrauttee  bottle of virgins weed tea
144 ,--Jungfernkraut virgin's weed
271 ,--Sense scythe
277 ,--Amethystring amethyst ring
280 ,--Diamantring diamond ring
281 ,--Smaragdring emerald ring
285 ,--Diamant diamond
293 ,--Wurfspeer javelin
294 ,--Wurfstern throwing star
315 ,--Vase vase
799 ,--Weidenkorb wicker basket
800 ,--blaues Gewand blue dress
801 ,--gelbes Gewand yellow dress
802 ,--graues Gewand grey dress
803 ,--grünes Gewand green dress
804 ,--rotes Gewand red dress
805 ,--schwarzes Gewand black dress
806 ,--weißes Gewand white dress
807 ,--blaues Wams blue doublet
808 ,--gelbes Wams yellow doublet
1318 ,--Flasche Elfenwein bottle of Elven wine
185 ,--schwarzer Visierhelm black visored helmet
189 ,--Dolch dagger
208 ,--verzierter Magierstab ornate mage's staff
249 ,--Getreidebündel bundle of grain
2536 ,--Kupfererz copper ore
2547 ,--Leder leather
2548 ,--Streitkolbengriff mace handle
2549 ,--Morgensterngriff morning star handle
2550 ,--Kupferbarren copper ingot
383 ,--Kriegsaxt waraxe
384 ,--Diebeshandschuhe thief's gloves
385 ,--blaues Kleid blue dress
831 ,--grüner Hut mit Feder green hat with feather
832 ,--roter Hut mit Feder red hat with feather
833 ,--schwarz-blaues Kleid black blue dress
834 ,--schwarz-gelbes Kleid black yellow dress
836 ,--schwarz-grünes Kleid black green dress
837 ,--schwarz-rotes Kleid black red dress
838 ,--schwarz-weißes Kleid black white dress
839 ,--blau-weißer Rock blue white skirt
840 ,--gelb-weißer Rock yellow white skirt
2551 ,--reine Luft pure air
841 ,--grau-weißer Rock grey white skirt
842 ,--grün-weißer Rock green white skirt
843 ,--rot-weißer Rock red white skirt
844 ,--schwarz-weißer Rock black white skirt
845 ,--blau-grünes Wappenkleid blue green heraldic dress
1319 ,--Flasche mit Kirschschnaps bottle of cherry schnapps
283 ,--Obsidian obsidian
284 ,--Saphir sapphire
279 ,--Saphirring sapphire ring
278 ,--Obsidianring obsidian ring
846 ,--blau-rotes Wappenkleid blue red heraldic dress
2552 ,--reine Erde pure earth
2553 ,--reines Feuer pure fire
2554 ,--reines Wasser pure water
2681 ,--rote Farbe red dye
2682 ,--gelbe Farbe yellow dye
2685 ,--Elfen-Kurzbogen elven shortbow
255 ,--Roher Rubin raw ruby
282 ,--Topasring topaz ring
310 ,--Humpen mit Deckel mug with lid
2917 ,--Tomatensamen tomato seeds
3051 ,--Wurst sausage
2493 ,--Karotten carrots
2494 ,--Samen seeds
2640 ,--riesige Feuer-Kriegsaxt large fire-waraxe
2642 ,--Orkaxt orc axe
2645 ,--Wurfbeil throwing axe
2646 ,--Serinjah-Reiterbogen serinjah-rider's bow
2658 ,--Breitschwert broadsword
2659 ,--Nagelbrett nail board
2660 ,--Zwergenaxt dwarven axe
2662 ,--magische Zwergenaxt magical dwarven axe
2664 ,--Keule club
2668 ,--vergifteter einfacher Dolch poisoned simple dagger
2675 ,--Degen rapier
2723 ,--Henkersaxt executioner's axe
2725 ,--vergiftete Henkersaxt poisoned executioner's axe
2727 ,--Feuer-Jagdbogen fire hunter's bow
2731 ,--Zweihänder two-handed sword
2738 ,--Nägel pins
2739 ,--Drowbogen drow bow
2740 ,--roter Dolch red dagger
2742 ,--roter Feuerdolch red fire dagger
2744 ,--Pfeife pipe
2647 ,--Besteck cutlery
2140 ,--Zange tongs
2654 ,--magisches Breitschwert magical broadsword
2655 ,--vergiftetes Breitschwert poisoned broadsword
2031 ,--Teller plate
2172 ,--Stahlbeinschienen steel greaves
2183 ,--Tonkrug clay mug
2184 ,--Tonbecher clay cup
847 ,--gelb-blaues Wappenkleid yellow blue heraldic dress
848 ,--gelb-grünes Wappenkleid yellow green heraldic dress
1858 ,--Kelch goblet
2113 ,--Fellhose fur trousers
2185 ,--Holzbecher wooden cup
2456 ,--Pilzsuppe mushroom soup
2457 ,--Weinglas wine glass
2459 ,--Fischfilet mit Beilage fish filet dish
2656 ,--Feuerbreitschwert fire broadsword
2365 ,--salkamaersche Offiziersrüstung salkamaerian officer's armour
2367 ,--albarische Adeligenrüstung albarian noble's armour
2496 ,--Wasserflasche bottle of water
2369 ,--albarischer Stahlharnisch albarian steel plate
2377 ,--rote Magierrobe red mage robe
2393 ,--schwerer Stahlharnisch heavy plate armour
2395 ,--Zwergenpanzer dwarvenplate
2399 ,--leichte Elfenrüstung light elven armour
2400 ,--Elfen-Prunkrüstung elven state armour
2402 ,--Drowrüstung drow armour
2403 ,--Elfen-Silberstahlrüstung elven silversteel armour
2407 ,--leichte Brustplatte light breastplate
2420 ,--schwarze Priesterrobe black priest robe
2421 ,--weiße Priesterrobe white priest robe
2439 ,--Wolkenschild cloud shield
2441 ,--Sturmhaube storm cap
2378 ,--Schwarzkult-Robe black cult robe
2444 ,--Serinjah-Helm serinjah helmet
2445 ,--kleiner Holzschild small wooden shield
2448 ,--Legionärsturmschild legionnaire's tower shield
2495 ,--Pfanne pan
2498 ,--große leere Flasche large empty bottle
2525 ,--Axtgriff axe handle
2380 ,--blauer Mantel blue coat
2384 ,--schwarzer Mantel black coat
2388 ,--roter Stahlschild red steel shield
2416 ,--braune Priesterrobe brown priest robe
2527 ,--großer, verzierter Griff large ornamented handle
2528 ,--kleiner Griff small handle
2529 ,--Honigwaben honeycomb
2530 ,--Dolchgriff dagger handle
2534 ,--Meriniumerz merinium ore
2535 ,--Eisenbarren iron ingot
2541 ,--Hammergriff hammer handle
2543 ,--Nadelholzbretter conifer wooden boards
2544 ,--großer Griff large handle
850 ,--graues Wappenkleid grey heraldic dress
2193 ,--Hartholzbeinschienen hardwood greaves
2194 ,--kurze Hartholzbeinschienen short hardwood greaves
2276 ,--Eintopf mulligan
2277 ,--Fleischgericht mit Beilage meat dish
2278 ,--Kohlsuppe cabbage stew
2284 ,--Himmelsschild shield of the sky
2286 ,--Flammenhelm flame helmet
2290 ,--runder Stahlhut round steel hat
2291 ,--salkamaerischer Paladinhelm salkamaerian paladin's helmet
2295 ,--Stoffhandschuhe cloth gloves
2303 ,--Drowhelm drow helmet
2357 ,--Schattenharnisch shadowplate
2360 ,--Lor-Angur-Wächterrüstung Lor-Angur guardian's armour
2363 ,--Nachtharnisch nightplate
2364 ,--Stahlharnisch steel plate
2389 ,--salkamaerische Rüstung salkamaerian armour
2390 ,--Zwergen-Prunkrüstung dwarven state armour
2418 ,--graue Priesterrobe grey priest robe
2419 ,--rote Priesterrobe red priest robe
849 ,--rot-gelbes Wappenkleid red yellow heraldic dress
2287 ,--albarischer Soldatenhelm albarian soldier's helmet
2922 ,--Würstchen mit Beilage sausages dish
545 ,--Kirschholzbretter cherry wood boards
546 ,--Naldorholzbretter naldor wood boards
548 ,--Magierrobe mage robe
549 ,--Giftpfeil poisoned arrow
851 ,--schwarz-rotes Wappenkleid black red heraldic dress
852 ,--weißes Wappenkleid white heraldic dress
2497 ,--Metflasche bottle of mead
2499 ,--Ciderflasche bottle of cider
2500 ,--Weinflasche bottle of wine
2501 ,--Bierflasche bottle of beer
40 ,--Priesterstecken cleric's staff
2923 ,--Zwiebelsuppe onion soup
186 ,--Metallrundschild round metal shield
187 ,--Stahlhut steel hat
190 ,--verzierter Dolch ornate dagger
191 ,--Brötchen bread roll
193 ,--blaue Robe blue robe
2934 ,--Lammkeule lamb meat
2935 ,--Suppenschüssel soup bowl
2940 ,--Steak steak
2946 ,--Streitaxt battle axe
2952 ,--Teller plate
3035 ,--Drowschwert drow sword
2 ,--Mehl flour
3 ,--Nadelholz conifer wood
194 ,--schwarze Robe black robe
195 ,--gelbe Robe yellow robe
196 ,--grauer Mantel grey coat
197 ,--Amethyst amethyst
199 ,--Mandarine tangerine
200 ,--Tomate tomato
201 ,--Zwiebel onion
202 ,--Stahlkappe steel cap
543 ,--Kirschholz cherry wood
544 ,--Naldorholz naldor wood
122 ,--Feinschmiedehammer finesmithing hammer
133 ,--Sonnenkraut sun herb
183 ,--grüne Hose green trousers
205 ,--Doppelaxt double axe
3113 ,--versiegelte Pergamentrolle sealed pell
204 ,--Großschwert greatsword
206 ,--Feuer-Langschwert fire longsword
207 ,--Kampfstab battle staff
222 ,--Amulett amulet
311 ,--Glasblasrohr glass blow pipe
388 ,--Weintrauben grapes
1 ,--Serinjahschwert serinjah sword
52 ,--Eimer mit Wasser bucket of water
526 ,--beschlagene Lederhandschuhe studded leather gloves
553 ,--Hasenfleisch rabbit meat
554 ,--Wildgericht mit Beilage venison dish
555 ,--Hasenbraten rabbit dish
556 ,--Lachsgericht mit Beilage salmon dish
2708 ,--Langbogen long bow
2709 ,--Zimmermannshammer carpenter hammer
2710 ,--Gussform mould
2711 ,--Halblingsaxt halfling axe
2714 ,--Jagdbogen hunting bow
2717 ,--Nägel und Keile pins and cotters
2718 ,--Elfen-Kompositlangbogen elven composite longbow
2719 ,--Kamm comb
2745 ,--Pergament parchment
2746 ,--Rasierklinge razor blade
557 ,--Steak mit Beilage steak dish
2701 ,--Langschwert longsword
2704 ,--magisches Langschwert magical longsword
2705 ,--vergiftetes Langschwert poisoned longsword
558 ,--Erzmagierrobe archmage robe
2559 ,--Ring des Erzmagiers ring of the archmage
2586 ,--Fell fur
3112 ,--versiegelte Pergamentrolle sealed pell
70 ,--Armbrust crossbow
79 ,--Amethystkette amethyst amulet
188 ,--große Kriegsaxt large waraxe
552 ,--Rehrücken deer meat
67 ,--Rubinkette ruby amulet
98 ,--versilbertes Langschwert silvered longsword
124 ,--vergoldete Kriegsaxt gilded battle axe
771 ,--albarische Stahlstiefel albarian steel boots
192 ,--verkupferte Kriegsaxt coppered battle axe
209 ,--Elfen-Magierstab elven mage's staff
229 ,--versilberte Kriegsaxt silvered battle axe
296 ,--merinium-beschichtete Axt merinium-plated battle axe
389 ,--versilberter Dolch silvered dagger
398 ,--verkupferter Dolch coppered dagger
399 ,--Kerzenhalter candlestick
444 ,--merinium-beschichteter Dolch merinium-plated dagger
445 ,--Holzschwert wooden sword
447 ,--Rubinstaub ruby powder
448 ,--Smaragdstaub emerald powder
450 ,--Amethyststaub amethyst powder
451 ,--Topasstaub topaz powder
452 ,--Diamantstaub diamond powder
1843 ,--Kelch mit Met goblet with mead
1844 ,--Kelch mit Cider goblet with cider
1853 ,--Kelch mit Met goblet with mead
1854 ,--Kelch mit Wasser goblet with water
1855 ,--Kelch mit Wasser goblet with water
1856 ,--Kelch mit Met goblet with mead
1857 ,--Kelch mit Wein goblet with wine
1859 ,--Kelch mit Cider goblet with cider
1861 ,--Kelch mit Cider goblet with cider
1906 ,--Bierkrug beer mug
1907 ,--Bierkrug beer mug
2186 ,--Becher mit Wasser cup with water
2187 ,--Becher mit Wein cup with wine
446 ,--Saphirstaub sapphire powder
449 ,--Obsidianstaub obsidian powder
2622 ,--Buch der Alchemie Alchemy Book
2188 ,--Becher mit Met cup with mead
2189 ,--Becher mit Cider cup with cider
2447 ,--Mosaikschild mosaic shield
2537 ,--Eisenplatte iron plate
1841 ,--Kelch mit Wasser goblet with water
1842 ,--Kelch mit Wein goblet with wine
2751 ,--Tiegelzange crucible-pincers
2752 ,--Schnitzmesser carving tools
2757 ,--Krummsäbel scimitar
2760 ,--Seil rope
2763 ,--Spitzhacke pick-axe
817 ,--grüne Tunika green tunic
257 ,--Roher Topas raw topaz
753 ,--blaue Vogelbeere blue birdsberry
754 ,--einblättrige Vierbeere oneleaved fourberry
759 ,--Nüsse nuts
761 ,--Regenkraut rain weed
809 ,--graues Wams grey doublet
810 ,--grünes Wams green doublet
811 ,--rotes Wams red doublet
812 ,--schwarzes Wams black doublet
813 ,--weißes Wams white doublet
814 ,--blaue Tunika blue tunic
815 ,--gelbe Tunika yellow tunic
816 ,--graue Tunika grey tunic
818 ,--rote Tunika red tunic
819 ,--schwarze Tunika black tunic
820 ,--weiße Tunika white tunic
821 ,--blaue Hose blue trousers
822 ,--gelbe Hose yellow trousers
823 ,--graue Hose grey trousers
824 ,--grüne Hose green trousers
825 ,--rote Hose red trousers
826 ,--schwarze Hose black trousers
827 ,--weiße Hose white trousers
828 ,--blauer Hut mit Feder blue hat with feather
829 ,--gelber Hut mit Feder yellow hat with feather
1001 ,--Teller plate
1860 ,--goblet with wine goblet with wine
2111 ,--Kettenhose chain pants
2775 ,--Elfen-Regenbogenschwert elven rainbowsword
2776 ,--Kurzschwert short sword
2777 ,--Drow-Klinge drow blade
2778 ,--Elfenschwert elvensword
2784 ,--Stab des Wassers wand of water
2786 ,--Zweig branch
2788 ,--Schlangenschwert snake sword
83 ,--Topaskette topaz amulet
198 ,--Topas topaz
2780 ,--Ebenholzbogen ebony wood bow
2783 ,--Stab des Feuers wand of fire
757 ,--Tybaltstern tybalt star
758 ,--Herzblut heart blood
760 ,--Eisblatt ice leaf
2781 ,--Färberstab dyeing rod
2785 ,--Stab der Luft wand of air
752 ,--Alraune mandrake
547 ,--Novizenrobe novice robe
830 ,--grauer Hut mit Feder grey hat with feather
2359 ,--Söldnerrüstung mercenary armour
2671 ,--magischer Dolch magical dagger
2694 ,--vergiftetes Serinjah-Schwert poisoned serinjah-sword
2696 ,--Metallteile metal pieces
2697 ,--Feile rasp
2782 ,--Stab der Erde wand of earth
3077 ,--Silberstücke silver coins
763 ,--Sumpfblume marsh flower
2679 ,--grüne Farbe green dye
2689 ,--vergifteter verzierter Dolch poisoned ornate dagger
2693 ,--magisches Serinjah-Schwert magical serinjah-sword
18 ,--leichter Schild light shield
19 ,--Metallschild metal shield
123 ,--merinium-beschichtetes Schwert merinium-plated longsword
134 ,--vierblättrige Einbeere fourleafed oneberry
157 ,--Faulbaumrinde rotten tree bark
234 ,--Goldnuggets gold nuggets
291 ,--verblühter Kohl (Saatgut) withered cabbage (seeds)
334 ,--Eisvogelamulett charm of the icebird
362 ,--volle Lederrüstung full leather armour
6 ,--Schere scissors
7 ,--Hörnerhelm horned helmet
9 ,--Säge saw
16 ,--Orkhelm orc helmet
20 ,--Ritterschild knight shield
21 ,--Kohle coal
22 ,--Eisenerz iron ore
23 ,--Hammer hammer
24 ,--Schaufel shovel
25 ,--Säbel sabre
26 ,--Lehm clay
27 ,--einfacher Dolch simple dagger
46 ,--Rubin ruby
47 ,--Nadel needle
48 ,--Lederhandschuhe leather gloves
49 ,--Brot bread
50 ,--Garn thread
51 ,--Eimer bucket
53 ,--Lederstiefel leather boots
54 ,--grüner Stoff green cloth
55 ,--grüne Robe green robe
56 ,--Ast bough
58 ,--Mörser mortar
61 ,--Goldstücke gold coins
62 ,--Smaragdamulett emerald amulet
63 ,--Eingeweide entrails
64 ,--Pfeil arrow
65 ,--Kurzbogen short bow
68 ,--Rubinring ruby ring
69 ,--Rohleder raw leather
237 ,--Armbrustbolzen crossbow bolt
259 ,--Getreide grain
312 ,--Holzkelle wooden shovel
316 ,--Quarzsand quartz sand
322 ,--Windpfeile wind arrows
323 ,--Zauberstab wand
324 ,--Kettenhelm chain helmet
325 ,--Stahlhandschuhe steel gloves
326 ,--Stahlschuhe steel boots
332 ,--Harfe harp
333 ,--Horn horn
336 ,--Spiegel mirror
431 ,--Wachs wax
3109 ,--offene Pergamentrolle open pell
3110 ,--Pergamentrolle pell
3111 ,--versiegelte Pergamentrolle sealed pell
3114 ,--versiegelte Pergamentrolle sealed pell
3115 ,--Schriftrolle scroll
3116 ,--Schriftrolle scroll
4 ,--Plattenpanzer plate armour
72 ,--Angel fishing rod
73 ,--Forelle trout
74 ,--Beil hatchet
77 ,--Hellebarde halberd
80 ,--Banane banana
81 ,--Beeren berries
84 ,--vergoldetes Langschwert gilded longsword
297 ,--vergoldeter Dolch gilded dagger
302 ,--Kirschen cherries
303 ,--Kirschtorte cherry cake
368 ,--gelbe Priesterrobe yellow priest robe
369 ,--Lederschuhe leather shoes
370 ,--bunter Zauberhut colourful wizard hat
371 ,--feiner Zauberhut fine wizard hat
391 ,--Fackel torch
392 ,--Fackel torch
393 ,--Laterne lantern
314 ,--Pottasche potash
453 ,--Kekse cookies
454 ,--Brombeermuffin blackberry muffin
455 ,--geräucherter Fisch smoked fish
456 ,--Schneeball snowball
85 ,--verkupfertes Langschwert coppered longsword
460 ,--gelbe Hose yellow trousers
461 ,--blaue Hose blue trousers
463 ,--Schreibfeder quill
465 ,--Diadem diadem
505 ,--Schatzkarte treasure map
527 ,--Serinjah-Lederhandschuhe serinjah leather gloves
528 ,--salkamaerische Stahlhandschuhe Salkamarian steel gloves
71 ,--Saphirkette sapphire amulet
529 ,--zwergische Metallhandschuhe dwarven metal gloves
530 ,--albarische Stahlhandschuhe Albarian steelgloves
531 ,--Ritterhandschuhe knight gloves
532 ,--Panflöte panpipe
533 ,--Trommel drum
696 ,--Echsenrüstung lizard armour
697 ,--Fellstiefel fur boots
698 ,--Serinjah-Lederstiefel serinjah leather boots
699 ,--salkamarische Stahlschuhe salkamarian steel boots
2561 ,--Sägengriff saw handle
2566 ,--Sensengriff scythe handle
2567 ,--Schaufelgriff shovel handle
2570 ,--Sichelgriff sickle handle
2571 ,--Meriniumbarren merinium ingot
2572 ,--Stabgriff staff handle
2577 ,--gelber Stoff yellow cloth
2579 ,--grüner Stoff green cloth
2584 ,--Schwertgriff sword handle
2585 ,--großer Schwertgriff big sword handle
2588 ,--Ziegelsteine bricks
2626 ,--magische Kriegsaxt magical waraxe
2627 ,--Feuer-Kriegsaxt fire waraxe
2629 ,--leichte Schlachtaxt light battleaxe
2635 ,--vergiftete Halblingsaxt poisoned halfling axe
2636 ,--vergiftete Doppelaxt poisoned longaxe
457 ,--grünes Hemd green shirt
459 ,--rote Hose red trousers
458 ,--gelbes Hemd yellow shirt
2573 ,--langer Stabgriff long staff handle
517 ,--Flasche mit Rum bottle of rum
1315 ,--Flasche mit Beerensaft bottle of berry booze
783 ,--Flasche mit Brombeersaft bottle of blackberry juice
785 ,--Flasche mit Bananensaft bottle of banana juice
791 ,--Flasche mit Traubensaft bottle of grape juice
2715 ,--Hobel plane
1316 ,--Flasche mit Bärentöter bottle of bear slayer
762 ,--Goldbruchkraut gold crak herb
82 ,--Obsidiankette obsidian amulet
2302 ,--gynkesischer Söldnerhelm gynkese mercenary's helmet
2737 ,--Kriegsflegel war flail
1038 ,--Schlangenspeer snake spear
1039 ,--Doppelklingenranseur twinblade ranseur
1040 ,--Ranseur ranseur
1041 ,--Stachelkeule spiked mace
1042 ,--Partisane partisan
1043 ,--Zwergenhammer dwarven hammer
1044 ,--Schlachthammer battle hammer
1045 ,--Holzdolch wooden dagger
1046 ,--Einfacher Speer simple spear
1047 ,--Glefe glaive
1048 ,--Voulge voulge
1049 ,--Vipernspeer viper spear
1051 ,--Partisane des Lichtes partisan of light
1052 ,--Zwergen Sturmhammer dwarven stormhammer
1053 ,--Heilige Voulge divine voulge
1050 ,--Schattenranseur shadow ranseur
835 ,--schwarz-graues Kleid black grey dress
790 ,--Leere Saftflasche empty juice bottle
518 ,--leere bauchige Flasche empty round body bottle
2560 ,--Apfelholz applewood
1062 ,--Silbererz silver ore
1059 ,--Würfelbecher dice cup
1054 ,--verzierte Lederstiefel ornate leatherboots
1055 ,--Zwergenstiefel dwarven boots
1056 ,--Lor-Angur-Wächterstiefel Lor-Angur guardians boots
1057 ,--robuste Fellstiefel robust fur boots
1058 ,--Elfen Silberstahl Stiefel elven silversteel boots
2672 ,--Glasdolch glass dagger
1090 ,--Wanderstab Walking stick
1209 ,--Stachelmakrele horse mackerel
429 ,--Kerzenform candle mould
1151 ,--Hühnchenfleisch chicken meat
1152 ,--Hühnchensuppe chicken soup
1153 ,--Eiercremetorte custard pie
1155 ,--Hühnchen mit Beilage chicken dish
1210 ,--Rotbarsch rose fish
1149 ,--Ei egg
1150 ,--Ei egg
1154 ,--Spiegelei mit Beilage egg dish
2716 ,--Apfelholzbretter apple wood boards
2502 ,--Milchflasche bottle of milk
1207 ,--Orange orange
3607 ,--pure spirit
}

gfxList = {
1,2,3,4,5,6,7,8,9,16,31,32,36,37,38,44,45,46,52,53
}

eggIds = {
1149,1150
}

function M.createSpecialEgg(user, amount)

	user:createItem(eggIds[Random.uniform(1,#eggIds)],amount,333,{nameDe="Buntes Ei",nameEn="Coloured Egg",descriptionDe="Das Ei ist mir verschiedenen bunten Verzierungen versehen worden.",descriptionEn="There are various colourful decorations on the egg.",rareness=ItemLookAt.uncommonItem,specialEgg="true"})

end

function M.checkSpecialEgg(theItem, user)

	if theItem:getData("specialEgg") == "true" then
		openSpecialEgg(theItem, user)
		return true
	end
	
end

function openSpecialEgg(egg, user)

	user:talk(Character.say, "#me öffnet ein bunt bemaltes Ei.","#me opens a colourfully painted egg.")
	world:erase(egg,1)
	local itemId = itemList[Random.uniform(1,#itemList)]
	local itemQuality = Random.uniform(111,999)
	user:inform("Als du das Ei öffnest, findest du etwas: "..world:getItemName(itemId,Player.german), "You find something in the open egg: "..world:getItemName(itemId,Player.english),Player.mediumPriority)
	local notCreated = user:createItem(itemId,1,itemQuality,nil)
	if notCreated > 0 then
		user:inform("Du kannst nichts mehr halten und der Gegenstand fällt zu Boden", "You can't carry any more and the object drops to the ground.")
		world:createItemFromId(itemId,1,user.pos,true,itemQuality,nil)
	end
	world:gfx(gfxList[Random.uniform(1,#gfxList)],user.pos)
end

return M