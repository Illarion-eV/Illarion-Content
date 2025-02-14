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

local M = {
    --spirit/attributes.lua
    statText = {
        {stat = "intelligence", germanStat = "Intelligenz", adjective = {english = "intelligent.", german = "intelligent."}},
        {stat = "strength", germanStat = "St�rke", adjective = {english = "strong.", german = "stark."}},
        {stat = "constitution", germanStat = "Ausdauer", adjective = {english = "sturdy.", german = "ausdauernd."}},
        {stat = "dexterity", germanStat = "Geschicklichkeit", adjective = {english = "dexterous.", german = "geschickt."}},
        {stat = "agility", germanStat = "Schnelligkeit", adjective = {english = "nimble.", german = "flink."}},
        {stat = "willpower", germanStat = "Willenskraft", adjective = {english = "strong-minded.", german = "willensstark."}},
        {stat = "perception", germanStat = "Wahrnehmung", adjective = {english = "perceptive.", german = "aufmerksam."}},
        {stat = "essence", germanStat = "Essenz", adjective = {english = "spiritual.", german = "spirituell."}}
        },
    statValuesText = {
        {value = 14, english = "The target is very ", german = "Das Ziel ist sehr "},
        {value = 8, english = "The target is somewhat ", german = "Das Ziel ist einigerma�en "},
        {value = 0, english = "The target is not very ", german = "Das Ziel ist nicht sehr "}
        },
    --spirit/converInfoToDialogue.lua
    infoOptionsText = {
        {english = "Gender/race", german = "Geschlecht/Rasse", identifier = "genderRace", rune = "Fhen"},
        {english = "Mana", german = "Mana", identifier = "MP", rune = "Ira"},
        {english = "Stamina", german = "Ausdauer", identifier = "FP", rune = "Kah"},
        {english = "Location", german = "Standort", identifier = "location", rune = "Mes"},
        {english = "Skill", german = "F�higkeiten", identifier = "skill", rune = "Orl"},
        {english = "Magic Resistance", german = "Magieresistenz", identifier = "MR", rune = "Pherc"},
        {english = "Attributes", german = "Attribute", identifier = "intelligence", rune = "Qwan"},
        {english = "Terrain type", german = "Gel�ndetyp", identifier = "terrain", rune = "PEN"},
        {english = "Health", german = "Gesundheit", identifier = "HP", rune = "Sih"},
        {english = "Speed", german = "Geschwindigkeit", identifier = "spd", rune = "Sul"},
        {english = "Item properties", german = "Gegenstandseigenschaften", identifier = "item", rune = "Anth"},
        {english = "Equipment", german = "Ausr�stung", identifier = "equipment", rune = "Sav"}
        },
    chooseInfoTexts = {
        title = {english = "Target information", german = "Informationen zum Ziel"},
        text = {english = "Choose what information of the target you want to view.", german = "W�hle aus welche Informationen des Ziels du sehen willst."}
        },
    types = {
        {english = "creature", german = "Kreatur"},
        {english = "item", german = "Gegenstand"},
        {english = "position", german = "Position"},
        {english = "player", german = "Spieler"}
        },
    targetSelectionList = {
        title = {english = "Target Selection", german = "Auswahl des Ziels"},
        text1 = {english = "Select which target you want to send the information to.", german = "W�hle welchem Ziel du Informationen �bertragen willst."},
        text2 = {english = "Select which target you want to view the information of.", german = "W�hle vom welchem Ziel du Infomationen sehen willst."},
        target = {english = "Target ", german = "Ziel"}
    },
    --spirit/terrain.lua
    tileDescriptions = {
        {id = 0, english = "Air", german = "Luft"},
        {id = 1, english = "Rocky terrain", german = "Felsen"},
        {id = 2, english = "Rocky terrain", german = "Nat�rlicher Fels"},
        {id = 3, english = "Sandy terrain", german = "Feiner Sand"},
        {id = 4, english = "Muddy terrain", german = "Schlamm"},
        {id = 5, english = "Lava", german = "Lava"},
        {id = 6, english = "Water", german = "Wasser"},
        {id = 7, english = "Rocky terrain", german = "Bearbeiteter Stein"},
        {id = 8, english = "Muddy terrain", german = "Schlamm"},
        {id = 9, english = "Muddy terrain", german = "Schlamm"},
        {id = 10, english = "Snowy terrain", german = "Schnee"},
        {id = 11, english = "Grassy terrain", german = "Wiese"},
        {id = 12, english = "Sandy terrain", german = "Grober Sand"},
        {id = 13, english = "Rocky terrain", german = "Bearbeiteter Stein"},
        {id = 14, english = "Grassy terrain", german = "Gras"},
        {id = 15, english = "Rocky terrain", german = "Fels"},
        {id = 16, english = "Muddy terrain", german = "Schlamm"},
        {id = 17, english = "Rocky terrain", german = "Bearbeiteter Stein"},
        {id = 18, english = "Rocky terrain", german = "Bearbeiteter Stein"},
        {id = 19, english = "Icy terrain", german = "Eis"},
        {id = 20, english = "Icy terrain", german = "Eis"},
        {id = 34, english = "Air", german = "Luft"},
        {id = 40, english = "Wooden ground", german = "Holzdielen"},
        {id = 41, english = "Rocky terrain", german = "Stein"},
        {id = 42, english = "Rocky terrain", german = "Stein"},
        {id = 43, english = "Wooden ground", german = "Holz"},
        {id = 45, english = "Carpet", german = "Teppich"},
        {id = 46, english = "Carpet", german = "Teppich"},
        {id = 47, english = "Carpet", german = "Teppich"},
        {id = 48, english = "Carpet", german = "Teppich"},
        {id = 49, english = "Carpet", german = "Teppich"},
        {id = 50, english = "Carpet", german = "Teppich"},
        {id = 51, english = "Carpet", german = "Teppich"},
        {id = 52, english = "Carpet", german = "Teppich"},
        {id = 53, english = "Carpet", german = "Teppich"},
        {id = 55, english = "Rocky terrain", german = "Glatter Stein"},
        {id = 56, english = "Rocky terrain", german = "Stein"},
        {id = 57, english = "Rocky terrain", german = "Bearbeiteter Stein"},
        {id = 58, english = "Rocky terrain", german = "Grober Stein"},
        {id = 59, english = "Wooden ground", german = "Holz"},
        {id = 60, english = "Layered bricks", german = "Ziegel"},
        {id = 61, english = "Layered bricks", german = "Ziegel"},
        {id = 62, english = "Wooden ground", german = "Holzdielen"},
        {id = 63, english = "Wooden ground", german = "Holzdielen"},
        {id = 64, english = "Wooden ground", german = "Holzdielen"},
        {id = 65, english = "Wooden ground", german = "Holzdielen"},
        {id = 66, english = "Rocky terrain", german = "Holzdielen"},
        {id = 67, english = "Carpet", german = "Teppich"},
        {id = 68, english = "Carpet", german = "Teppich"},
        {id = 69, english = "Carpet", german = "Teppich"},
        {id = 70, english = "Carpet", german = "Teppich"},
        {id = 71, english = "Carpet", german = "Teppich"},
        {id = 72, english = "Carpet", german = "Teppich"},
        {id = 73, english = "Carpet", german = "Teppich"},
        {id = 74, english = "Muddy terrain", german = "Schlamm"},
        {id = 75, english = "Muddy terrain", german = "Schlamm"}
        },
    tilePrefix = {
        english = "Terrain: ", german = "Terrain: "},
    -- spirit/telepathy.lua
    telepathyTexts = {
        failure = {english = "You decided against responding to the telepathic connection.", german = "Du hast dich gegen eine telephatische Verbindung entschieden."},
        success = {english = "You hear the voice of your telepathic partner in your mind: ", german = "Du h�rst die Stimme der Person mit der du eine telephatische Verbindung eingegangen bist: "},
        request = {english = "What do you want to tell your telepathic partner?", german = "Was willst du deinem Telepathiepartner sagen?"},
        established = {english = "You feel a telepathic connection establish between you and someone else.", german = "Du sp�rst wie sich eine telephatische Verbindung zwischen dir und jemand anderem aufbaut."}
        },
    -- createSpell.lua
    createSpellTexts = {
        BHONA = {english = "BHONA spells may only contain up to two runes.", german = "Zauberspr�che mit BHONA d�rfen maximal 2 Runen enthalten."},
        --Example texts for prefix/suffix: The rune Fhen has been added to the spell., The rune RA has been added as the primary rune of the spell.
        prefix = {english = "The rune ", german = "Die Rune "},
        suffix = {english = " has been added to the spell.", german = " wurde dem Zauberspruch hinzugef�gt."},
        suffixPrimary = {english = " has been added as the primary rune of the spell.", german = " wurde als prim�re Rune dem Zauberspruch hinzugef�gt."},
        mana = {english = "Not enough mana.", german = "Nicht genug Mana."},
        minor = {english = "You must first learn how to use any minor rune before you can add it to your spell.", german = "Du musst zuerst lernen wie man eine geringe Rune nutzt bevor du sie zu deinem Zauberspruch hinzuf�gst. " },
        allRunes = {english = "You do not know any more runes that can be added to the spell.", german = "Du kennst keine weiteren Runen die zum Zauberspruch hinzugef�gt werden k�nnen."},
        --example text for slot: You name the spell in spell slot 7: Fire ball
        slot = {english = "You name the spell on page ", german = "Du benennst den Zauberspruch auf Seite  "},
        creation = {english = "Spell Creation", german = "Zauberspruch Erstellung"},
        selectRune = {english = "Select which rune you want to add to your spell.", german = "W�hle welche Rune du dem Zauberspruch hinzuf�gen m�chtest."},
        selectPrimary = {english = "Select a primary rune for your spell.", german = "W�hle eine prim�re Rune f�r deinen Zauberspruch."},
        nameSpell = {english = "Name the spell", german = "Benenne den Zauberspruch."},
        pickOption = {english = "Pick an option.", german = "W�hle eine M�glichkeit."},
        addRune = {english = "Add rune", german = "F�ge eine Rune hinzu."},
        finish = {english = "Finish spell", german = "Finalisiere den Zauber."},
        unfinished = {english = "Unfinished", german = "Unvollendet"},
        quillAndBook = {english = "You must hold a magic book and quill in your hands.", german = "Du musst ein magisches Buch und eine Schreibfeder in deinen H�nden halten."},
        noPrimary = {english = "You must first learn how to use a primary rune before you can create a spell.", german = "Du musst zuerst lernen wie man eine prim�re Rune nutzt bevor du einen Zauberspruch erstellen kannst."},
        create = {english = "Create a spell", german = "Erschaffe einen Zauberspruch."},
        overwrite = {english = "Yes, overwrite it.", german = "Ja, ich �berschreibe ihn."},
        dontOverwrite = {english = "No, select another page.", german = "Nein, ich w�hle eine andere Seite. "},
        quill = {english = "You need a quill to do any work at a desk.", german = "Du brauchst eine Schreibfeder um an diesem Tisch arbeiten zu k�nnen."},
        createBook = {english = "Portal Book Creation", german = "Erschaffung von Portalb�chern"},
        createGrimoire = {english = "Enchant a book into a Grimoire", german = "Verzaubere ein Buch in ein Grimoire"},
        bookNeeded = {english = "You need to hold a blank book in your hand in order to enchant it into a Grimoire.", german = "Du musst einen leeres Buch in deinen H�nden halten, um es in ein Grimoire verzaubern zu k�nnen."},
        enchantSuccess = {english = "You have successfully enchanted the book into a Grimoire.", german = "Du hast erfolgreich ein Buch in ein Grimoire verzaubert."}
        },
    -- targeting.lua
    levText = {
        english = "You realise it's been too long since you last cast this spell with HEPT, as you feel the mana draining from your body finds no target.",
        german = "Du bemerkst, dass es zu lange her ist, das du das letzte Mal einen Zauberspruch mit HEPT genutzt hast, denn du sp�rst wie das Mana aus deinem K�rper flie�t und kein Ziel findet."
        },
    -- reduceMana.lua
    manaReduction = {
        english = "You can feel some of your mana being drained from out of your body.",
        german = "Du sp�rst wie etwas Mana aus deinem K�rper flie�t."
    },
    -- reduceFood.lua
    foodReduction = {
        english = "You can feel some of your stamina being drained out of your body.",
        german = "Du sp�rst wie etwas Ausdauer deinen K�rper verl�sst."
    },
    -- plantRoot.lua, traps.lua
    plantRootTexts = {
        name = {
            english = "Entangling Plant",
            german = "Schlingpflanze"},
        description = {
            english = "Upon closer inspection, you may notice the leaves of the plant having a magical looking glow to them.",
            german = "Bei genauerer Betrachtung stellst du fest, dass die Bl�tter der Pflanze ein magisches Leuchten abgeben."},
        entangled = {
            english = "Stepping onto the plant, yo uare entangled by its vines, slowing you down.",
            german = "Als du auf die Pflanze trittst wirst du von ihren Ranken umschlungen und wirst langsamer."
        }
    },
    earthTrapTexts = {
        name = {english = "Earth Cloud", german = "Erdwolke"},
        description = {english = "A misty green cloud with an earthy scent to it.", german = "Eine nebelige gr�nde Wolke mit erdigem Geruch."},
        cloud = {english = "Stepping into the cloud of earth magic, the gaseous substance flocks towards you in an attempt to enter your body.", german = "Als du die Wolke aus Erdmagie ber�hrst, str�mt das Gas auf dich zu und versucht in deinen K�rper einzudringen."},
        plant = {english = "As you step onto the plant, it releases a gaseous substance that seems to flock towards you in an attempt to enter your body.", german = "Als du die Pflanze ber�hrst, st��t sie ein Gas aus welches versucht in deinen K�rper einzudringen."},
        illusion = {english = "As you step into the cloud of earth magic, nothing happens to you. Was it just an illusion?", german = "Als du die Wolke aus Erdmagieber�hrst pasiert....nichts. War es etwa nur eine Illusion?"}
    },
    -- movement.lua
    movementTexts = {
        flying = {english = "A blast of air magic sends you flying.", german = "Ein Sto� von Luftmagie l�sst dich fliegen."},
        walk = {english = "A strong wind forces you to step aside.", german = "Ein starker Wind zwingt dich zur Seite zu gehen."},
        turn = {english = "A sudden burst of wind turns you around.", german = "Ein pl�tzlicher Windsto� wirbelt dich herum."}
    },
    -- spirit/creatures.lua
    genderTexts = {
        {english = "male", german = "m�nnlich", value = 0},
        {english = "female", german = "weiblich", value = 1},
        {english = "Gender: ", german = "Geschlecht: ", value = 2}
    },

    racePrefixText = {
        english = "Race: ",
        german = "Rasse: "
    },

    raceList = {
        {name = {english = "human", german = "Mensch"}, id = 0},
        {name = {english = "dwarf", german = "Zwerg"}, id = 1},
        {name = {english = "halfling", german = "Halbling"}, id = 2},
        {name = {english = "elf", german = "Elf"}, id = 3},
        {name = {english = "orc", german = "Ork"}, id = 4},
        {name = {english = "lizardman", german = "Echsenmensch"}, id = 5},
        {name = {english = "forest troll", german = "Waldtroll"},  id = 9},
        {name = {english = "mummy", german = "Mumie"},  id = 10},
        {name = {english = "skeleton", german = "Skelett"},  id = 11},
        {name = {english = "beholder", german = "Beholder"},  id = 12},
        {name = {english = "sheep", german = "Schaf"},  id = 18},
        {name = {english = "spider", german = "Spinne"},  id = 19},
        {name = {english = "pig", german = "Schwein"},  id = 24},
        {name = {english = "wasp", german = "Wespe"},  id = 27},
        {name = {english = "stone golem", german = "Steingolem"},  id = 30},
        {name = {english = "cow", german = "Kuh"},  id = 37},
        {name = {english = "wolf", german = "Wold"},  id =39},
        {name = {english = "bear", german = "B�r"},  id = 51},
        {name = {english = "raptor", german = "Schnapper"},  id = 52},
        {name = {english = "zombie", german = "Zombie"},  id = 53},
        {name = {english = "hellhound", german = "H�llenhund"},  id = 54},
        {name = {english = "imp", german = "Kobold"},  id = 55},
        {name = {english = "iron golem", german = "Eisengolem"},  id = 56},
        {name = {english = "ratman", german = "Rattenmensch"},  id = 57},
        {name = {english = "dog", german = "Hund"},  id = 58},
        {name = {english = "beetle", german = "K�fer"},  id = 59},
        {name = {english = "fox", german = "Fuchs"},  id = 60},
        {name = {english = "slime", german = "Schleim"},  id = 61},
        {name = {english = "chicken", german = "Huhn"},  id = 62},
        {name = {english = "bone dragon", german = "Knochendrache"},  id = 63},
        {name = {english = "rat", german = "Ratte"},  id = 111},
        {name = {english = "dragon", german = "Drache"},  id = 112},
        {name = {english = "rabbit", german = "Hase"},  id = 113},
        {name = {english = "demon", german = "D�mon"},  id = 114},
        {name = {english = "fairy", german = "Fee"},  id = 115},
        {name = {english = "deer", german = "Reh"},  id = 116},
        {name = {english = "ettin", german = "Ettin"},  id = 117}
    },
    -- spirit/equipment.lua
    equipmentPrefix = {
        quality = {english = "Equipment quality: ", german = "Qualit�t der Ausr�stung: "},
        durability = {english = "Equipment state: ", german = "Zustand der Ausr�stung: "}
    },
    equipmentNames = {
        {english = "Backpack", german = "Tasche", slot = 0},
        {english = "Head", german = "Kopf", slot = 1},
        {english = "Neck", german = "Hals", slot = 2},
        {english = "Torso", german = "Torso", slot = 3},
        {english = "Hands", german = "H�nde", slot = 4},
        {english = "In Left Hand", german = "In der linken Hand", slot = 5},
        {english = "In Right Hand", german = "In der rechten Hand", slot = 6},
        {english = "Left ring finger", german = "Linker Ringfinger", slot = 7},
        {english = "Right ring finger", german = "Rechter Ringfinger", slot = 8},
        {english = "Legs", german = "Beine", slot = 9},
        {english = "Feet", german = "F��e", slot = 10},
        {english = "Back", german = "R�cken", slot = 11},
    },
    --spirit/speed.lua
    speedTexts = {
        normal = {english = "Target is not under the effect of any hastening or slowing spells.", german = "Dein Ziel steht nicht unter dem Einfluss von beschleunigenden oder verlangsamenden Zaubern. "},
        high = {english = "Target is under the effect of a hastening spell.", german = "Dein Ziel steht unter dem Einfluss eines beschleunigenden Zaubers."},
        low =  {english = "Target is under the effect of a slowing spell.", german = "Dein Ziel steht unter dem Einfluss einen verlangsamenden Zaubers."}
    },
    --lifesteal.lua
    lifestealTexts = {
        health = {english = "You siphon some health from your target.", german = "Du entziehst deinem Ziel Lebensenergie."},
        mana = {english = "You siphon some mana from your target.", german = "Du entziehst deinem Ziel Mana."},
        overTime = {english = "You siphon health from your target, recovering your own over time.", german = "Du entziehst deinem Ziel Lebensenergie, w�hrend sich deine mit der Zeit erholt."}
    },
    --magicDoT.lua
    burn = {english = "You've been inflicted with a magical burn, causing you to suffer fire damage over time.", german = "Dir wurde eine magische Verbrennung zugef�gt, du erleidest mit der Zeit Feuerschaden."},
    poison = {english = "You've been inflicted with a magical poison, causing you to suffer poisonous damage over time.", german = "Dir wurde eine magische Vergiftung zugef�gt, du erleidest mit der Zeit Giftschaden."},
    --spirit/health.lua
    healthTexts = {
        {english = "Target is perfectly healthy.", german = "Dein Ziel ist kerngesund.", health = 10000},
        {english = "Target is slightly wounded.", german = "Dein Ziel ist leicht verletzt.", health = 8000},
        {english = "Target is wounded.", german = "Dein Ziel ist verletzt.", health = 5000},
        {english = "Target is heavily wounded.", german = "Dein Ziel ist schwer verletzt.", health = 2000},
        {english = "Target is near death.", german = "Dein Ziel ist dem Tode nahe.", health = 1},
        {english = "Target is dead.", german = "Dein Ziel ist tot.", health = 0},
        },
    --spirit/items.lua
    itemTexts = {
        durability = {english = "Durability: ", german = "Haltbarkeit: "},
        quality = {english = "Quality: ", german = "Qualit�t: "},
        weight = {english = "Weight: ", german = "Gewicht: "},
        name = {english = "Item name: ", german = "Gegenstandsname: "},
        description = {english = "Details: ", german = "Details: "},
        unit = {singular = {english = "Blackberry", german = "Brombeere"}, plural = {english = "Blackberries", german = "Brombeeren"}}
        },
    --spirit/location.lua
    directionsList = {
        {direction = {english = "east", german = "Osten"}},
        {direction = {english = "west", german = "Westen"}},
        {direction = {english = "north", german = "Norden"}},
        {direction = {english = "south", german = "S�den"}},
        {direction = {english = "southeast", german = "S�dosten"}},
        {direction = {english = "northeast", german = "Nordosten"}},
        {direction = {english = "southwest", german = "S�dwesten"}},
        {direction = {english = "northwest", german = "Nordwesten"}}
        },
    locationTexts = {
        {english = "Target's position is ", german = "Die Position deines Ziels ist "},
        {english = " steps to the ", german = "Schritte in Richtung"},
        },
    --spirit/magicResistance.lua
    MRtexts = {
        low = {english = "The target has low magic resistance.", german = "Dein Ziel hat eine geringe Magieresistenz."},
        average = {english = "The target has average magic resistance.", german = "Dein Ziel hat eine durchschnittliche Magieresistenz."},
        high = {english = "The target has high magic resistance.", german = "Dein Ziel hat eine hohe Magieresistenz."},
       },
    --spirit/skill.lua
    skillTexts= {
        {value = 3200, english = "Target is highly experienced in many professions.", german = "Dein Ziel hat besonders viel Erfahrung in vielen F�higkeiten. "},
        {value = 2200, english = "Target is very experienced in many professions", german = "Dein Ziel hat sehr viel Erfahrung in vielen F�higkeiten."},
        {value = 700, english = "Target is experienced in many professions.", german = "Dein Ziel hat viel Erfahrung in unterschiedlichen F�higkeiten."},
        {value = 450, english = "Target is experienced in some professions.", german = "Dein Ziel ist hat Erfahrung in unterschiedlichen F�higkeiten."},
        {value = 300, english = "Target has some experience in multiple professions.", german = "Dein Ziel hat etwas Erfahrung in unterschiedlichen F�higkeiten."},
        {value = 200, english = "Target has at least some experience in a profession.", german = "Dein Ziel hat zumindest etwas Erfahrung in einer F�higkeit. "},
        {value = 0, english = "Target has little to no experience in a profession.", german = "Dein Ziel hat wenig bis keine Erfahrung in einer F�higkeit."}
       },
    --spirit/mana.lua
    manaTexts = {
        {english = "Target is brimming with mana.", german = "Dein Ziel ist �bervoll mit Mana. ", mana = 10000},
        {english = "Target is nearly satiated with mana.", german = "Dein Ziel ist nahezu voll mit Mana. ", mana = 8000},
        {english = "Target has moderate amount of mana.", german = "Dein Ziel hat eine durchschnittliche Menge an Mana. ", mana = 5000},
        {english = "Target is running low on mana.", german = "Dein Ziel hat nur mehr wenig Mana.", mana = 2000},
        {english = "Target is almost out of mana.", german = "Dein Ziel hat fast kein Mana mehr.", mana = 1},
        {english = "Target only has enough mana to survive.", german = "Dein Ziel hat gerade genug Mana um zu Leben.", mana = 0},
        },
    --spirit/stamina.lua
    staminaTexts = {
        {english = "Target is brimming with energy.", german = "Dein Ziel ist voller Ausdauer.", food = 10000},
        {english = "Target is almost full of energy.", german = "Dein Ziel ist nahezu voller Ausdauer", food = 8000},
        {english = "Target is starting to get tired.", german = "Dein Ziel wird langsam m�de.", food = 5000},
        {english = "Target is tired.", german = "Dein Ziel ist M�de.", food = 2000},
        {english = "Target is nearly exhausted.", german = "Dein Ziel ist der Ersch�pfung nahe.", food = 1},
        {english = "Target is exhausted and starving.", german = "Dein Ziel ist ersch�pft und hungrig.", food = 0},
        },
    --spirit/fakeInfo.lua
    fakeEquipmentText = {
        durability = {name = {english = "Set Durability", german = "Bestimmeung der Haltbarkeit"}, text = {english = "Choose what durability the equipment should be portrayed as having.", german = " Bestimme mit welcher Haltbarkeit Ausr�stung dargestellt werden soll."}},
        quality = {name = {english = "Set Quality", german = "Bestimmung der Qualit�t"}, text = {english = "Choose what quality the equipment should be portrayed as having." ,  german = " Bestimme mit welcher Qualit�t Ausr�stung dargestellt werden soll. "}}
        },
    --castSpell.lua
    castSpellTexts = {
        range = {english = "The target is too far away.", german = "Dein Ziel ist zu weit weg."},
        secret = {english = "You secretly begin casting a wind spell.", german = "Du beginnst heimlich einen Windzauber zu wirken."},
        mana = {english = "You do not have enough mana.", german = "Du hast nicht genug Mana."},
        sight = {english = "Line of sight is not clear.", german = "Du kannst dein Ziel nicht richtig sehen."},
        stats = {english = "As you attempt to cast the spell, you feel an abrupt headache prevent you from proceeding. Did something happen to your ability to cast magic?", german = "Als du versuchst den Zauber zu Sprechen, versp�rst du pl�tzlich heftige Kopfschmerzen die dich daran hindern. Ist etwas mit deiner F�higkeit zu Zaubern passiert? "}
    },
    --magicBook.lua
    magicBookTexts = {
        empty = {english = "The spell list is empty. Perhaps you could fill it in at a desk?", german = "Deine Zauberliste ist leer. Vielleicht kannst du sie an einem Schreibtisch bef�llen?"},
        inane = {english = "All you can see are the inane scribbles made by someone else. They make no sense to you!", german = "Alles was du siehst sind unsinnige Kritzeleinen die jemand anderes gemacht hat. Das ergibt keinen Sinn!"},
        --primed example text: "Wand primed for the spell: Fireball."
        primed = {english = "Wand primed for the spell: ", german = "Der Zauberstab ist vorbereitet f�r den Zauber: "},
        selection = {english = "Spell Selection", german = "Zauberauswahl"},
        select = {english = "Select which spell you want to cast.", german = "W�hle welchen Zauber du sprechen willst."},
        incomplete = {english = "The spellbook has no complete spells in it for you to cast.", german = "Das Zauberbuch beinhaltet keinen vollst�ndigen Zauber die du sprechen kannst."},
        nonsense = {english = "All you can see are nonsensical scribbles. Wait, did that line just move? This may be beyond your ability to understand.", german = "Alles was du sehen kannst sind unsinnige Kritzeleine. Warte...hat sich die Linie etwas bewegt? Das �bersteigt dein Verst�ndnis. "},
        glyphWand = {english = "Wand primed for wand magic & glyph forging.", german = "Der Zauberstab ist vorberiette f�r Stabmagie und Glyphenmagie."},
        priming = {english = "Wand priming", german = "Zauberstab Vorbereitung"},
        type = {english = "Select what you want to do with the grimoire.", german = "W�hle, was du mit dem Grimoire tun m�chtest."}, --Verification of chatGPT GERMAN TRANSLATION needed
        spells = {english = "Spells", german = "Zauberspr�che"},
        wandGlyph = {english = "Wand Magic & Glyph Forging", german = "Stabmagie & Glyphenmagie"},
        spatial = {english = "Spatial Magic", german = "Raummagie"},
        spatialAttune = {english = "Wand attuned to spatial magic", german = " Dein Zauberstab ist f�r Raummagie vorbereitet."}
    },
    --teaching.lua
    teachingTexts = {
        knows = {english = "Target already knows that rune.", german = "Dein Ziel kennt diese Rune bereits."},
        level = {english = "Target is not skilled enough at magic to learn this rune yet.", german = "Dein Ziel versteht noch nicht genug von Magie um diese Rune lernen zu k�nnen. "},
        studentCooldown = {english = "Not enough time has passed yet since the last time the target was taught how to use a magic rune.", german = "Es verging noch nicht genug Zeit seit dein Ziel die letzte Rune gelernt hat."},
        teacherCooldown = {english = "You've been teaching too many people runes recently.", german = "Du hast in letzter Zeit zu vielen Personen Runen gelehrt."},
        stats = {english = "The target does not have the mental faculties to learn this rune.", german = "Dein Ziel besitzt nicht die geistige Leistungsf�higkeit um diese Rune zu lernen."},
        mage = {english = "The target is not attuned to the ways of magic.", german = "Dein Ziel ist nicht mit den Wegen der Magie bewandert."},
        learned = {english = "You have learned how to use the rune ", german = "Du lernst die Rune "}, --followed by the name of the rune
        taught = {english = "You have taught the target how to use the rune ", german = "Du lehrst die Rune "}, --followed by the name of the rune
        mana = {english = "Not enough mana.", german = "Nicht genug Mana."},
        target = {english = "You need a target.", german = "Du brauchst ein Ziel."},
        player = {english = "Target must be a player.", german = "Dein Ziel muss ein Spieler sein."}
    },
    --craft/final/portals.lua
    portalBookTexts = {
        craft = {english = "Portal  Book Creation", german = "Portalbuch Erstellung"},
        category = {english = "Portal Books", german = "Portalb�cher"},
        book = {english = "Portal book", german = "Portalbuch"},
    },
    --spatial.lua
    --plan is to add one portal location per zone (avoiding "dead mana" areas) once Slightly has finalised the zone name list
    portalSpots = {
        { location = position(684, 307, 0),
            english = "Portal to the Hemp Necktie Inn",
            german = "Portal zum Gasthof zur Hanfschlinge",
            level = 0,
            nameEn = "Hemp Necktie Inn",
            nameDe = "Gasthof zur Hanfschlinge"
        },
        { location = position(126, 647, 0),
          english = "Portal to Cadomyr",
          german = "Portal nach Cadomyr",
          level = 0,
          nameEn = "Cadomyr",
          nameDe = "Cadomyr"
        },
        { location = position(423, 246, 0),
          english = "Portal to Galmair",
          german = "Portal nach Galmair",
          level = 0,
          nameEn = "Galmair",
          nameDe = "Galmair"
        },
        { location = position(835, 813, 0),
          english = "Portal to Runewick",
          german = "Portal nach Runewick",
          level = 0,
          nameEn = "Runewick",
          nameDe = "Runewick"
        },
        { location = position(-484,-455,-40),
          english = "Portal to the Prison Mine",
          german = "Portal nach zur Gef�ngnismine",
          level = 0,
          nameEn = "Prison Mine",
          nameDe = "Gef�ngnismine",
          entrance = position(633, 374, 0)
        }
    },

    spatialTexts = {
        portalBookNeeded = {english = "You must have the portal book you wish to evaluate in one of your belt slots.", german = "Du musst das Portalbuch, das du bewerten m�chtest, in einem deiner G�rtelpl�tze haben."}, --Verification of chatGPT GERMAN TRANSLATION needed
        distanceTexts = {
            {value = 600, english = " very far ", german = "sehr fern "},
            {value = 400, english = " far ", german = "fern "},
            {value = 100, english = " somewhere ", german = "in der N�he "},
            {value = 50, english = " close ", german = "nahe "},
            {value = 0, english = " very close ", german = "sehr nahe "},
        },
        binderTexts = {
            english = "to the ",
            german = "in Richtung"
        },
        alreadyAttuned = {
            english  = "You've already attuned your spatial magic to this location.",
            german = "Du hast deine Raummagie bereits auf diesen Ort abgestimmt."
        },
        doneAttuning  = {
            english = "You've attuned to the crossing mana lines in the area. You will now be able to remember the spatial coordinates to teleport, cast portals and even write portal books that lead to this area, should your expertise in spatial magic allow.",
            german = "Du hast deine Raummagie auf die sich kreuzenden Manalinien dieses Gebiets abgestimmt. Du kannst dir nun die r�umlichen Koordinaten merken um dich her zu teleportieren, Portale zu �ffnen oder sogar Portalb�cher schreiben die dich hier her f�hren. Nat�rlich nur wenn es deine Erfahrung in Raummagie erlaubt."
        },
        lackingSkill = {
            english = "You need to attain a higher level of expertise in spatial magic to remember the spatial coordinates for this location.",
            german = "Um dir die r�umlichen Koordinaten f�r diesen Ort merken zu k�nnen, musst du deine F�higkeiten in der Raummagie verbessern."
        },
        noNearby = {
            english = "There are no crossing mana lines nearby for you to attune your spatial magic to. The nearest one is ",
            german = "Hier befinden sich keine kreuzenden Manalinien um deine Raummagie abzustimmen. Die N�heste befindet sich "
        },
        red = {
            english = "Portal colour set to red",
            german = "Die Farbe deiner Portale ist nun rot."
        },
        blue = {
            english = "Portal colour set to blue",
            german = "Die Farbe deiner Portale ist nun blau."
        },
        name = {
            english = "Spatial Magic",
            german = "Raummagie"
        },
        selectColour = {
            english = "Select which colour your portals should have.",
            german = "W�hle welche Farbe deine Portale haben sollen."
        },
        colours = {
            red = { english = "Red", german = "Rot"},
            blue = { english = "Blue", german = "Blau"}
        },
        incantation = {
            portal = "Locus Ianua", -- latin for "space door"
            teleport = "Locus Itinerantur", --latin for "space travel"
            attune = "Locus Memento" --latin, "space remember"
        },
        teleportation = {
            english = "Teleportation",
            german = "Teleportation"
        },
        destination = {
            english = "Select your destination",
            german = "W�hle deinen Zielort"
        },
        castSelect  = {
            english = "What kind of spatial magic do you want to cast?",
            german = "Welche Raummagie m�chtest du sprechen?"
        },
        attuneTo = {
            english = "Attune to location",
            german = "Abstimmung mit einem Ort"
        },
        teleport = {
            english = "Teleport",
            german = "Teleport"
        },
        portal = {
            english = "Create Portal",
            german = "Erschaffe ein Portal"
        },
        portalColour = {
            english = "Portal colour",
            german = "Portalfarbe"
        },
        interruptedCast = {
            english = "Your casting of spatial magic was interrupted.",
            german = "Das wirken deiner Raummagie wurde unterbrochen."
        },
        interruptedBook = {
            english = "Your reading of the portal books incantation was interrupted.",
            german = "Das Lesen der Beschw�rungsformel des Portalbuches wurde unterbrochen. "
        },
        cantFindMore = {
            english = "You don't detect any more crossing mana lines to attune to. Perhaps you've found them all?",
            german = "Du kannst keine sich kreuzenden Manalinien mehr ausmachen. Vielleicht hast du ja schon alle gefunden?"
        },
        differentElevation = {
            english = "You can feel that there are crossed mana lines nearby that you can attune your spatial magic to, however not here. Perhaps you'd had better luck searching at a different elevation?",
            german = "Du kannst sp�ren, dass du dich direkt in der N�he einer sich kreuzenden Manalinie befindest, an der du deine Raummagie abstimmen k�nntest. Es scheint aber als w�rde sich dieser auf einer anderen Ebene befinden."
        },
        badTarget  = {
            english = "Something in the area disrupts your casting. Perhaps this isn't a good spot for spatial magic?",
            german = "Etwas in der N�he unterbericht deinen Zauber. M�glicherweise ist das kein guter Ort f�r Raummagie?"
        },
        locationBlocked = {
            english = "There is not enough free space in front of you for a portal, try again somewhere there is more room.",
            german = "Vor dir ist nicht genug Platz f�r ein Portal. Versuche es erneut an einem Ort, wo mehr Raum zur Verf�gung steht."
        },
        showBookQuality = {
            english = "Portal Book Evaluation",
            german = "Portalbuchbewertung"
        },
        bookQuality = {
            english = "Through your inspection you find that this portal book is of ",
            german = "Durch deine Inspektion stellst du fest, dass dieses Portalbuch von der Qualit�t "
        },
        bookQualityAddendum = {
            english = " quality. The better the quality, the faster it is to summon a portal through the usage of this book.",
            german = " ist. Je besser die Qualit�t, desto schneller l�sst sich ein Portal mithilfe dieses Buches beschw�ren."
        },
        portalBookChant = {
            english = "#me begins chanting the incantation written in a portal book.",
            german = "#me beginnt damit die Beschw�rungsformel des Portalbuches zu lesen."
        }
    },
    --item/wands.lua
    wounded = { english = "Your wounds made it hard for you to concentrate, causing you to make a mistake in your casting.", german = "Deine Verletzungen machen es dir schwer dich zu konzentrieren. Du machst einen Fehler beim Zaubern!"},
    --item/fountain.lua
    forgetfulFountain = {
        name = { english = "Fountain of Forgetfulness", german = "Brunnen des Vergessens"},
        description = { english = "A mysterious fountain covered in vapour. As you near it, you feel foggy minded; Did you just forget something important?", german = "Ein mysteri�ser, in Dampf geh�llter Brunnden. Als du dich ihm n�herst, f�hlst sich dein Kopf benebelt an.; Hast du gerade etwas Wichtiges vergessen? "}
    },
    fountainDialogue = {
        yes = { english = "Yes", german = "Ja"},
        no = { english = "No", german = "Nein"},
        certain = { english = "Are you certain you wish to forget all your existing magical knowledge? This can not be undone once it has been done", german = ""},
        reallyCertain = { english = "Are you really sure?", german = "Bist du dir wirklich sicher?"},
        finalVerification = { english = "Then your magical knowledge will be forgotten... right?", german = "Dein gesamtes magisches Wissen wird vergessen....Bist du dir sicher?"},
        removed = { english = "As you drink from the fountain your eyes grow dazed and your head feels foggy. Why does it suddenly feel like your memory is full of blank spots? What are you doing here? Why is the sky blue? You don't know.", german = "Als du aus dem Brunnen trinkst schweifen deine Augen in die Ferne und dein Kopf f�llt sich mit Nebel. Warum f�hlt es sich pl�tzlich so an als ob dein Ged�chntis voller leerer Stellen ist? Was machst du hier? Wieso ist der Himmel blau? Du wei�t es nicht."},
        kept = { english = "You wisely decided to keep your magical knowledge. What kind of fool would give up such precious wisdom, anyways?", german = "Du entscheidest dich weise und beh�lst dein magisches Wissen. Welcher Narr w�rde etwas so Kostbares auch aufgeben?"},
        offered = {
            english = "Having provided the required offering, you may now drink of the fountains waters.",
            german = "Nachdem du die erforderliche Opfergabe erbracht hast, darfst du jetzt vom Wasser des Brunnens trinken."
        },
        lacking = {
            english = "An offering ceremony is required to make use of the fountain.",
            german = "Um den Brunnen nutzen zu k�nnen, ist eine Opferzeremonie erforderlich."
        },
        whatToDo = {
            english = "It's a fountain. Even if there's something special about it, you wouldn't know what to do.",
            german = "Es ist ein Brunnen. Selbst wenn er etwas Besonderes w�re, w�sstest du nicht, was du tun sollst."
        },
        found = {
            english = "You found the fountain, though now what? It seems to require some kind of offering, perhaps you can find a clue as to what somewhere nearby?",
            german = "Du hast den Brunnen gefunden, aber was nun? Er scheint eine Art von Opfergabe zu verlangen, vielleicht kannst du irgendwo in der N�he einen Hinweis darauf finden, was?"
        }
    },
    --runeHintsBook.lua and magicSphere.lua
    runeHintsBookTexts = {
        CUN =  {rune = "CUN",
            hint = {
                english = "Near the ruins of a mother praised lies the secret of water.",
                german = "In der N�he der Ruinen einer gelobten Mutter liegt das Gehemnis des Wassers."},
            name = {
                english = "Mysterious Blue Sphere",
                german = "Mysteri�se blaue Sph�re"},
            description = {
                english = "A mysterious glass sphere that appears to contain it's own ocean of water.",
                german = "Eine mysteri�se, gl�serne Sph�re. Es scheint als w�rde sie ein ganzes Meer beinhalten."},
            location = position(630,599,0)},
        JUS = {rune = "JUS",
            hint = {
                english = "Up high where wind and ocean meet, with fuzzy creatures at your feet.",
                german = "Hoch oben, wo sich Wind und Meer treffen, mit flauschigen Gesch�pfen zu deinen F��en."},
            name = {
                english = "Windy Mysterious  Sphere",
                german = "Mysteri�se windige Sph�re"},
            description = {
                english = "A mysterious glass sphere that appears to be full of blowing wind.",
                german = "Eine mysteri�se, gl�serne Sph�re. Es scheint als w�re sie voll mit st�rmendem Wind. "},
            location = position(329,156,1)},
        PEN = {rune = "PEN",
            hint = {
                english = "In a place a hermit might call home, you'll find a hidden tome.",
                german = "Am Ort den der Einsiedler sein Zuhause nennt, dort findest du den hellsten Geist."},
            name = {
                english = "Mysterious Spiritual Sphere",
                german = "Mysteri�se strahlende Sph�re"},
            description = {
                english = "A mysterious glass sphere that contains a bright spiritual light.",
                german = "Eine mysteri�se, gl�serne Sp�hre, die ein strahlendes Licht enth�lt. Wie ein strahlender Geist."},
            location = position(786,128,0)},
        RA = {rune = "RA",
            hint = {
                english = "A lone man betwixt the desert dry and forest lush guards the secret of the flame.",
                german = "Ein einsamer Mann zwischen der trockenen W�ste und dem �ppigen Wald h�tet das Gehemnis des Feuers."},
            name = {
                english = "Fiery Mysterious Sphere",
                german = "Mysteri�se feurige Sph�re"},
            description = {
                english = "A mysterious glass sphere that appears to be full of flickering flames. It doesn't appear to give off any heat, though.",
                german = "Eine mysteri�se, gl�serne Sph�re. Es scheint als w�rde sie im Inneren brennen. "},
            location = position(472,765,0)},
        SOLH = {rune = "SOLH",
            hint = {english = "Deep below and long forgotten, a garden lush with guards that are rotten.",
                german = "Tief unten und l�ngst vergessen, ein Garten voller W�chter die schon l�ngst zerfressen."},
            name = {
                english = "Myserious Earthy Sphere",
                german = "Mysteri�se erdige Sph�re"},
            description = {
                english = "A mysterious sphere that appears to contain a deep, dark soil",
                german = " Eine mysteri�se, gl�serne Sph�re. Es scheint als w�rde sie dunkle, schwarze Erde beinhalten."},
            location = position(793,297,-3)},
        BHONA = {rune = "BHONA",
            hint = {
                english = "Back to where you started, after you first departed.",
                german = "Zur�ck dorthin, als du einst gingst."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Within the sphere you spot two vague figures. One stands before the other, appearing to be preaching. The latter appears to be kowtowing in a show of piety towards the former.",
                german = "Im Inneren der Sph�re erkennen Sie zwei vage Gestalten. Die eine steht vor der anderen und scheint zu predigen. Letztere scheint sich vor der ersteren in einem Anflug von Fr�mmigkeit zu verneigen."},
            location = position(469, 869 , -9)},
        Anth = {rune = "Anth",
            hint = {
                english = "An enormous structure, static as can be. Were it not, a flood you would see.",
                german = "Ein gigantisches Bauwerk so unbeweglich. W�re es nicht, die Flut w�rdest du sehen. "},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Within the sphere various objects can be seen, but what they all have in common is that they stand perfectly still. One could even call them static.",
                german = "Innerhalb der Sph�re kannst du die unterschiedlichsten Objekte erkennen. Eines haben sie alle gemeinsam, sie stehen vollkommen still. Man k�nnte sie auch statisch nennen. "},
            location = position(843, 216 , -3)},
        Dun = {rune = "Dun",
            hint = {
                english = "In an area vast and empty, where white hands rule.",
                german = "In einem weiten und leeren Gebiet, in dem die wei�e Hand regiert."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "The sphere reveals the scene of a vast empty land.",
                german = "Die Kugel zeigt das Bild eines weiten, leeren Landes."},
            location = position(354, 454, 0)},
        Fhan = {rune = "Fhan",
            hint = {
                english = "Among a castle of bones, you'll find what you desire.",
                german = "In einem Schloss aus Knochen wirst du findet was du suchst."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "The sphere contains an eerie magical fog that seems to attempt to get away from you.",
                german = "Die Sph�re enth�lt einen unheimlichen magischen Nebel, der zu versuchen scheint, von dir wegzukommen."},
            location = position(595, 319, 3)},
        Fhen = {rune = "Fhen",
            hint = {
                english = "Where trolls seek haven and drink fine wine, out in the garden do we dine.",
                german = "Wo Trolle Zuflucht suchen und besten Wein versuchen, dort im Garten speisen wir."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "The sphere contains an eerie magical fog that seems to attempt to get closer to you.",
                german = "Die Sph�re enth�lt einen unheimlichen magischen Nebel, der zu versuchen scheint, sich dir zu n�hern."},
            location = position(736,317,0)},
        Hept = {rune = "Hept",
            hint = {
                english = "In a cold place oh so high. Watch out, or you'll freeze.",
                german = "Ein Ort so kalt und hoch. Pass auf, dort erfrierst du noch!"},
            name = {
                english = "Mysterious Frosty Sphere",
                german = "Mysteri�se vereiste Sph�re"},
            description = {
                english = "Inside the sphere you see what resembles as snowstorm swirling about with the occasional hail",
                german = "Im Inneren der Sph�re sieht man etwas, das wie ein Schneesturm aussieht, der mit gelegentlichem Hagel umherwirbelt"},
            location = position(266,375,1)},
        Ira = {rune = "Ira",
            hint = {
                english = "Creatures not of nature, how many eyes does this one have?",
                german = "Wieviele Augen hat diese Kreatur, entspringt sicher nicht der Natur!"},
            name = {
                english = "Mysterious Eye-shaped Sphere",
                german = "Mysteri�se augenf�rmige Sph�re"},
            description = {
                english = "As you peer into the sphere you feel like you can see a pupil peering right back at you.",
                german = "Als du in die Sph�re starrst, f�hlt es sich so an als w�rde eine Pupille direkt zur�ckstarren."},
            location = position(475, 746, -3)},
        Kah = {rune = "Kah",
            hint = {
                english = "If a mortal were to require sustenance, much could be found here.",
                german = "Dort wo sterbliche St�rkung suchen, dort findet man viel."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "As you peer into the sphere you see a steaming hot pie, so life-like you can almost smell it.",
                german = "Beim Blick in die Sph�re siehst du einen hei� dampfenden Kuchen, so lebensecht, das du ihn fast riechen kannst."},
            location = position(794 , 804, 0)},
        Kel = {rune = "Kel",
            hint = {
                english = "Where dark creatures of flight reside.",
                german = "Dort wo dunkle gesch�pfe des Himmels hausen."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "As you peer into the sphere you see a feather, though before you can determine what kind of feather it is, you witness it change into a dragon wing.",
                german = "Als du in die Sph�re blickst, siehst du eine Feder. Doch bevor du feststellen kannst, um was f�r eine Feder es sich handelt, wirst du Zeuge, wie sie sich in einen Drachenfl�gel verwandelt"},
            location = position(711,619,-6)},
        Lev = {rune = "Lev",
            hint = {
                english = "Once a glorious combat academy, now left in ruins. Oh the changes of time.",
                german = "Einst eine stolze Kampfakademie, nun nur mehr Ruinen. Wie die Zeit sich �ndert."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "If you peer into the sphere, you would witness an ever-changing scenery. A desert in one moment, the next a tundra, it constantly shows you new, unique sights.",
                german = "Wenn du in die Sph�re blickst wirst du Zeuge einer sich st�ndig ver�ndernden Landschaft. In einem Moment ist es eine W�ste, im n�chsten eine Tundra, sie zeigt dir st�ndig neue, einzigartige Anblicke."},
            location = position(188, 809, -3)},
        Lhor = {rune = "Lhor",
            hint = {
                english = "Trick you, fool you, lead you astray. Who am I?",
                german = "Ich betr�ge, ich t�usche ich f�hre dich in die Irre. Wer bin ich?"},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "An illusory raven is sat inside the sphere, cleaning its wings with its beak.",
                german = "Im Innern der Sph�re sitzt ein fiktiver Rabe, der sich mit seinem Schnabel die Fl�gel putzt."},
            location = position(781, 438, 0)},
        Luk = {rune = "Luk",
            hint = {
                english = "Among hostile elves, down down we go.",
                german = "Unter feindesligen Elfen, tief tief runter m�ssen wir."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "A bloodshot eye appears to be peering back out at you from inside the sphere.",
                german = "Ein blutunterlaufenes Auge scheint dich aus dem Inneren der Kugel heraus anzustarren."},
            location = position(564, 542 , -6)},
        Mes = {rune = "Mes",
            hint = {
                english = "I light up the path for beings made of wood that have lost their way.",
                german = "Ich erleuchte den Weg f�r Wesen aus Holz, die den Weg verloren haben."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "The sphere gives off a warm, radiant light.",
                german = "Die Sph�re gibt ein warmes, strahlendes Licht ab."},
            location = position(537, 612, 1)},
        Orl = {rune = "Orl",
            hint = {
                english = "Created from an egg. Creepy, crawly, eight legged friends.",
                german = "Zuerst ein Ei. Gruselige, krabbelnde, achtbeinige....."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "The sphere appears as if full of tiny little spiders, desperately trying to make their way out to get to you.",
                german = "Die Sph�re sieht aus, als w�re sie voller winziger kleiner Spinnen. Sie versuchen verzweifelt sich einen Weg nach drau�en zu bahnen um dich zu erwischen."},
            location = position(907, 487, -6)},
        Pherc = {rune = "Pherc",
            hint = {
                english = "The pain of the desert heat is nigh as high as the pain of their axes.",
                german = "Der Schmerz der W�stenhitze ist fast so gro� wie der Schmerz der Axt!"},
            name = {
                english = "Mysterious Bloody Sphere",
                german = "Mysteri�se blutverschmierte Sph�re"},
            description = {
                english = "A grotesque scene full of blood and gore meet you as you peer into the sphere.",
                german = "Beim Blick in die Sph�re bietet sich dem Betrachter eine groteske Szene voller Blut und Qualen."},
            location = position(80, 431, -6)},
        Qwan = {rune = "Qwan",
            hint = {
                english = "On a mountain up high, where creatures of stone reside.",
                german = "Hoch in den Bergen, bei Kreaturen aus Stein."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Within the sphere lies a lone, huge-looking boulder... or is it a pebble?",
                german = "In der Sph�re liegt ein einsamer, riesig wirkender Felsbrocken... oder ist es ein Kieselstein?"},
            location = position(241, 776, 1)},
        Sav = {rune = "Sav",
            hint = {
                english = "In a firey castle where dragons reside below.",
                german = "Ein brennendes Schloss in dem die Drachen hausen."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Within the sphere you can see a majestic looking shield.",
                german = "Im Inneren der Sph�re ist ein majest�tisch aussehender Schild zu sehen."},
            location = position(111 , 887, -3)},
        Sih = {rune = "Sih",
            hint = {
                english = "Near water claimed by some to be capable of healing your very soul.",
                german = "In der N�he des Wasser so rein, es k�nne die Seele heilen."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "The sphere gives off a feeling of warmth and wellness.",
                german = "Die Sph�re strahlt ein Gef�hl von W�rme und Wohlbefinden aus."},
            location = position(783 , 262, -8)},
        Sul = {rune = "Sul",
            hint = {
                english = "Rotten, smelly and cursed to be slow. Such is the fate of a civilization that met its demise.",
                german = "Stinkend, verrottet zum Stillstand verflucht. Das Schicksal einer Zivilisation die ihren Untergang fand. "},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Peering into the sphere, you'd see the shadow of figures passing by ever so slowly.",
                german = "Wenn man in die Sph�re hineinschaut, sieht man die Schatten von Gestalten, die ganz langsam vor�berziehen."},
            location = position(937, 391, -3)},
        Tah = {rune = "Tah",
            hint = {
                english = "Steal from the rich, give to the poor... as long as the poor are they themselves.",
                german = "Ich stehle von den Reichen und gebe den Armen...bin doch ich der �rmste."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Peering into the sphere, you see yourself but upside down.",
                german = "Wenn du in die Kugel schaust, siehst du dich selbst, aber auf dem Kopf stehend."},
            location = position(14, 522, 0)},
        Taur = {rune = "Taur",
            hint = {
                english = "This secret is guarded by creatures that dwell in a cave. What do they look like, you ask? Do they have one head? Two? Are they ugly and deranged?",
                german = "Dieses Geheimnis wird von Kreaturen bewacht die tief in H�hlen leben. Wie sehen sie aus fragst du? Haben sie einen Kopf? Zwei? Sind sie h�sslich und verst�rt?"},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Within the sphere you see the silhouette of a humanoid being, though it quickly changes form into that of various other creatures one by one.",
                german = "In der Sph�re sieht man die Silhouette eines humanoiden Wesens, das jedoch schnell die Form verschiedener anderer Kreaturen annimmt."},
            location = position(179, 550, 0)},
        Ura = {rune = "Ura",
            hint = {
                english = "Where the guardians of nature reside",
                german = "Dort wo die H�ter der Natur wohnen."},
            name = {
                english = "Mysterious Mossy Sphere",
                german = "Mysteri�se moosbewachsene Sph�re"},
            description = {
                english = "Within the sphere you can see the picturesque image of nature in its barest, most untouched form.",
                german = "In der Sph�re kann man das malerische Bild der Natur in ihrer urspr�nglichsten, unber�hrten Form sehen."},
            location = position(827 , 156, 0)},
        Yeg = {rune = "Yeg",
            hint = {
                english = "Muddy, grimey and full of despair. This place is not natural, of death beware.",
                german = "Schlammig, schmutzig und voller Verzweiflung. Dieser Ort ist nicht nat�rlich. H�te dich vor dem Tod."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "Peering into the sphere, a vision of death and decay meet you. Are you just imagining it, or can you also hear the terrifying wails of the tortured dead?",
                german = "Wenn du in die Sph�re blickst, bietet sich dir eine Vision von Tod und Verwesung. Bildest du dir das nur ein, oder h�rst du auch die schrecklichen Schreie der gequ�lten Toten?"},
            location = position(793, 576, 0)},
        Pera = {rune = "Pera",
            hint = {
                english = "Found in a place where a competition of speed is famously held.",
                german = "Dort an jenem Ort wo die Wettk�mpfe der Schnellsten ausgetragen werden."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteri�se Sph�re"},
            description = {
                english = "All you can see within the sphere is a figure moving so fast it has become nothing but a blurry shadow.",
                german = "Alles, was du in der Sph�re sehen kannst ist eine Figur, die sich so schnell bewegt, dass sie nur noch ein verschwommener Schatten ist."},
            location = position(391, 137, 0)},
        unlitSphere = {
            english = "Empty glass sphere",
            german = "Leere gl�serne Sph�re"},
        knowAll = {
            english = "There does not appear to be any knowledge in this book that you do not already know.",
            german = "Dieses Buch enth�lt kein Wissen, dass du nicht schon kennst."},
        requirementNotMet = {
            english = "While there's knowledge in this book that you are not knowledgable of, it appears to be beyond your capability to understand right now.",
            german = "Ein Buch voller Wissen. Doch es ist jenseits deiner F�higkeiten es zu verstehen."},
        bookName = {
            english = "Mysterious Book",
            german = "Mysteri�ses Buch"},
        bookDescription = {
            english = "An old, faded looking book full of scribbles only some may understand.",
            german = "Ein altes, verblasstes Buch voller Kritzeleinen die wohl nur die Wenigsten verstehen."},
        selectRune = {
            english = "Select the name of the rune you wish to locate.",
            german = "W�hle den Namen der Rune die du suchen m�chstest."},
        unsolved = {
            english = "The sphere has no reaction to your touch. Perhaps there is something in the area that can change this?",
            german = "Als du die Sph�re ber�hrst passiert...nichts. M�glicherweise befindet sich etwas in der N�he, dass dies �ndern k�nnte."},
        unwise = {
            english = "It hasn't been long enough since you last learned a rune, making it unwise to go searching for a new one.",
            german = "Es ist noch nicht lange her, dass du nach einer Rune gesucht hast. Es w�re nicht klug jetzt schon wieder eine Neue zu suchen."},
        activated = {
            english = "With a sudden glow the sphere lights up, revealing to you the sights within.",
            german = "Mit einem pl�tzlichen Erstrahlen leichtet die Sph�re auf und enh�llt ihre Gehemnisse."},
        learned = {
            english = "You feel a sudden surge of information enter your mind, it appears you just learned how to use the rune ",
            german = "Eine Welle von Informationen durchflutet deinen Geist. Du hast verstanden wie du die Rune nutzen kannst."},
        cooldown = {
            english = "Not enough time has passed since you last learned a rune. You feel a headache just thinking about learning a new one.",
            german = "Es ist noch nicht genug Zeit vergangen seit du die letzte Rune gelernt hast. Allein der Gedanke an eine neue Rune bereitet dir Kopfschmerzen."},
        notMetCriteria = {
            english = "As you touch the sphere, you get the feeling that you are not well versed enough or perhaps even talented enough at magic to learn the rune.",
            german = "Als du die Sph�re ber�hrst f�hlst du dich v�llig �berw�ltigt. Du hast das Gef�hl, dass du noch viel lernen musst bevor du dieses Wissen aufnehmen kannst. Vielleicht bist du auch nicht talentiert genug um es je zu verstehen."},
        notMage = {
            english = "As you touch the sphere, it has no reaction other than returning to its dim state.",
            german = "Als du die Sph�re ber�hrst passiert....nichts. Sie h�rt einfach auf zu Leuchten."},
        alreadyKnows = {
            english = "While the magical information enters your mind, you discover nothing new. You already know how to use this rune.",
            german = "Als die Welle an Informationen auf dich trifft, ist dir das Wissen schon vertraut. Du kennst diese Rune bereits."}
    },
    --item/desk.lua
    magicDesk = {name = {
        english = "Magical Desk",
        german = "Magischer Schreibtisch"},
        description = {
            english = "A desk where mages can create spells, craft portal books and enchant grimoires",
            german = "Ein Schreibtisch welcher von Magiern benutzt wird um Zauberspr�che zu schreiben, Portalb�cher zu erstellen und Grimoires zu verzaubern."}},
    quill = {
        bookNeeded = {
            english = "You need to hold the grimoire you want to label in your hand.",
            german = "Du musst den Grimoire, den du benennen willst, in deinen H�nden halten."}
    },
    --item/id_1001_greenplate.lua
    offeringPlate = {
        name = {
            english = "Offering Plate",
            german = "Opferteller"},
        description = {
            english = "The plate seems to contain something.",
            german = "Der Teller scheint etwas zu enthalten."},
        use = {
            english = "Upon closer examination, you find a piece of paper on the plate.",
            german = "Bei n�herer Betrachtung findest du ein St�ck Papier am Teller."}},
    offeringHints = {
        { location = position(628, 598, 0),
        hint = {
            english = "If you wash me, I will not be clean. If you do not wash me, I will. What am I?",
            german = "Wenn du mich w�schst werde ich nicht sauber, l�sst du es aber, so werde ich es doch. Was bin ich?"}
        }
    },
    windPuzzle = {
        blasted = {
            english = "You're sent flying by a blast of wind magic.",
            german = "Du wirst durch einen magischen Windsto� davongeschleudert."}

    },
    penPuzzle = {
        english = "I am easy to lift but hard to throw. What am I?\nSpeak me out loud and you shall be enlightened.",
        german = "Ich bin leicht zu heben aber schwer zu werfen. Was bin ich?\nRufe mich und werde erleuchtet."
    },
    anthPuzzle = {
        main = {
            english = "Write down the correct four-digit number and you shall be enlightened. The answer can be found by studying the pillars.",
            german = "Schreibe die richtige vierstellige Zahl nieder und werde erleuchtet. Die Antwort findest du durch das Studium der S�ulen" },
        wrong = {
            english = "Wrong answer",
            german = "Falsche Antwort"},
        success = {
            english = "Success",
            german = "Erfolg"},
    },
    dunPuzzle = {
        english = "You snagas get to work now! This room should've been filled up with items yesterday!",
        german = "An die Arbeit ihr Maden. Dieser Raum h�tte schon gestern mit Zeugs voll sein m�ssen",
        orcish = {
            english = "There seems to be something written in orcish on the scroll. You'd need someone to translate it for you.",
            german = "Die Schriftrolle scheint in einem Orkdialekt verfasst zu sein. Du brauchst Hilfe um das zu �bersetzen"}
    },
    fhanPuzzle = {
        english = "We don't have time to honour the dead, they said.\nWe need to fend off Cherass' invading army, they said.\nSending off the dead is a waste of time, they said.\nWell now who's laughing?",
        german = "Wir haben nicht genug Zeit die Toten zu ehren haben sie gesagt.\nWie m�ssen uns gegen Cherass Armee verteidigen haben sie gesagt,\nDie Toten zu vernichten sei Zeitverschwendung haben sie gesagt.\n Doch wer lacht jetzt?",
        coffins = {
            {english = "Here lies Maxwell 'the Pebble' Orson, may he find rest in death.",
            german = "Hier liegt Maxwell 'der Kiesel' Orson, m�ge er in Frieden ruhen.",
            location = position(591,321,3)},
            {english = "Aren Ighys rests here. A devout follower of Bragon, his only wish was to be closer to his god.",
            german = "Hier ruht Aren Ighys. Ein gl�ubiger Anh�nger Bragons. Er wollte n�her zu seinem Gott, das war sein letzter Wunsch.",
            location = position(591,317,3)},
            {english = "Here lies the swordsman Drovan Darksword. Little did people know, he was secretly obsessed with the drow.",
            german = "Hier ruht der Schwertk�mpfer Drovan Dunkelklinge. Wenige wissen, dass er ein heimlicher Verehrer der Drow war.",
            location = position(599, 317, 3)},
            {english = "Jonathan Corn, a man born to a chicken farmer. His last request was a meal from home, though he never got it.",
            german = "Jonathan Korn, geboren als Sohn eines H�hnerz�chters. Sein letzter Wunsch war eine Mahlzeit von Zuhause, die er aber nie bekam.",
            location = position(599,321,3)}
        }
    },
    fhenPuzzle = {
        english = "An elf and a dwarf sit down to drink together. What do they drink? Place both beverages on the offering plate and be enlightened.",
        german = "Ein Zwerg und ein Elf haben zusammen getrunken. Aber was? Platziere beide Getr�nke auf dem Opferteller und werde erleuchtet."
    },
    heptPuzzle = {
        english = "Brr, it's so cold. If only there was a way to make it warmer. There's only snow, stone and all these pesky trees nearby!",
        german = "Brr, es ist so f�rchterlich kalt. Wenn es nur einen Weg geben w�rde es w�rmer zu haben. Hier gibt es nur Schnee, Stein und diese l�stigen B�ume! "
    },
    iraPuzzle = {
        english = "One eye to lift and one to sleep.\nOne to charm and one for beast.\nOne eye to wound and one eye to slow.\nOne to bring fear and one to make stone.\nOne eye makes dust and one eye brings death.\nSpeak my name aloud and you will know.",
        german = "Ein Auge zum Aufstehen und eines zum Schlafen. \nEines zum Bezaubern und eines f�r die Bestien.\nEin Auge zum Verwunden und ein Auge zum Verlangsamen.\nEines um Angst zu verbreiten und eines um Stein zu machen. \nEin Auge macht Staub und ein Auge bringt den Tod.\nSprich meinen Namen und du wirst es wissen."
    },
    kahPuzzle = {
        english = "For breakfast, I want an egg salad sandwich!\nFor dinner, I want a venison dish!\nFor supper... Mushroom soup!",
        german = "Zum Fr�hst�ck will ich Eiersalatsandwich! \n Zum Mittagessen will ich ein Wildgericht mit Beilage! \n Zum Abendessen...Pilzsuppe! "
    },
    kelPuzzle = {
        english = "Together, we can fly up high and soar the skies. However, it is not possible in my current state. Find me, and you shall have the knowledge you seek.",
        german = "Gemeinsam k�nnen wir hoch fliegen und die L�fte erklimmen. Doch in meinem derzeitigen Zustand ist das nicht m�glich. Finde mich und du wirst das Wissen bekommen das du suchst.",
        egg = {
            english = "A dragon egg. Could this be the answer?",
            german = "Ein Drachenei. K�nnte das die Antwort sein?"
        },
        feather = {
            english = "A feather... of the chicken variety. Surely it can't be this, right?",
            german = "Eine Feder....von einem H�hnchen. Also das kann es nicht sein, oder?"
        },
        air = {
            english = "A swirling mass of pure air. You could probably fly with this?",
            german = "Eine wirbelnde Masse reiner Luft. Damit k�nntest du wahrscheinlich davonfliegen?"
        },
        suffix = {
            english = "\nIf you believe this to be the answer, go back to the sphere and find out.",
            german = "\nWenn du glaubst, dass das die Antwort ist, geh zur�ck zur Kugel und finde es heraus."
        },
    },
    mesPuzzle = {
        english = "You call this a lighthouse? Lights! We need more lights! Go get the oil, now!",
        german = "Das soll ein Leuchtturm sein? Lichter! Wir brauchen mehr Lichter! Holt das �l, sofort!"
    },
    orlPuzzle = {
        english = "They may not be your friends, but these foul creatures will be neccessary to obtain the knowledge that you seek. Find as many as they have legs, and just... try to endure.",
        german = "Sie m�gen nicht deine Freunde sein, aber diese �blen Kreaturen werden notwendig sein, um das Wissen zu erlangen, das du suchst. Finde genau so viele, wie sie Beine haben, und... versuche einfach zu �berleben."
    },
    peraPuzzle = {
        english = "It's a race! Pull both levers fast enough and you shall obtain the knowledge you seek!",
        german = "Es ist ein Wettrennen! Ziehe beide Hebel schnell genug und du wirst das Wissen erhalten, das du suchst!",
        slow = {
            english = "Too slow! You can always try again, though.",
            german = "Zu langsam! Du kannst es aber jederzeit wieder versuchen."
        },
        fast = {
            english = "You made it! Now go back to reap your reward!",
            german = "Du hast es geschafft! Jetzt geh zur�ck und hol dir deine Belohnung ab!"
        },
        pulled = {
            english = "You've pulled the lever, starting the timer! Hurry to the other lever!",
            german = "Du hast den Hebel gezogen und damit den Timer gestartet! Beeil dich mit dem anderen Hebel!"
        }
    },
    bhonaPuzzle = {
        success = {
            english = "You did it! You've solved all the riddles to get you this far, and now you've slain Akaltut! All that's left to do is to go reap your reward at the nearby rune shrine!",
            german = "Du hast es geschafft! Du hast alle R�tsel gel�st, die dich so weit gebracht haben, und jetzt hast du Akaltut get�tet! Jetzt musst du nur noch deine Belohnung am nahe gelegenen Runenschrein abholen!"
        },
        gibberish = {
            english = "Whatever is written on this scroll, it doesn't look like much more than gibberish to you right now.",
            german = "Was auch immer auf dieser Schriftrolle steht, es sieht f�r dich im Moment nicht nach viel mehr als Kauderwelsch aus."
        },
        locations = {
            {location = position(471, 765, 0),
            english = "Your journey next, takes you to a place where an exile takes rest, from her evil brethrens monotheistic pest.\n X X A",
            german = "Deine n�chste Reise f�hrt dich an einen Ort, an dem sich eine Verbannte von der monotheistischen Pest ihrer b�sen Geschwister erholt \n X X A.",
            before = 1,
            after = 2},
            {location = position(751, 338, -9),
            english = "Next on the list, an isle of snow. When will you go, if not now?\n X X X X X X X L",
            german = "Als n�chstes steht eine Schneeinsel auf der Liste. Wann wirst du gehen, wenn nicht jetzt?\n X X X X X X X L",
            before = 2,
            after = 3},
            {location = position(425, 65, 0),
            english = "In the fiery depths, where spiders guard. A place where many adventurers have been scarred. \n S",
            german = "In den feurigen Tiefen, wo Spinnen wachen. Ein Ort, an dem schon viele Abenteurer entstellt wurden. \n S",
            before = 3,
            after = 4},
            {location = position(528, 794, -6),
            english = "Back up we go, no time to waste. Better yet return, to where merchants make haste. \n X L",
            german = "Zur�ck nach oben, wir haben keine Zeit zu verlieren. Besser noch, wir kehren zur�ck, dahin, wo die Kaufleute sich tummeln. \n X L",
            before = 4,
            after = 5},
            {location = position(673, 317, 0),
            english = "In the ruins of civilization, ruined by creatures of stone. Now swarmed with the dead, it lies entombed. \n X X X X A",
            german = "In den Ruinen der Zivilisation, zerst�rt von Kreaturen aus Stein. Jetzt wimmelt es von Toten und die Zivilisation liegt begraben. \n X X X X A",
            before = 5,
            after = 6},
            {location = position(926, 415, -3),
            english = "Sleep you with pirates, and you will see. There's nowhere to hide, near Cadomyr's sea. \n X X X Y",
            german = "Wer mit Piraten schl�ft, wird sehen. Es gibt kein Versteck, am Meer von Cadomyr. \n X X X Y",
            before = 7,
            after = 8},
            {location = position(214, 478, -3),
            english = "Next with the thieves, I dare you to be. Near a land full of wonder, this time by the eastern sea. \n X X X X X K",
            german = "Als n�chstes bei den Dieben, das traue ich dir zu. In der N�he eines Landes voller Wunder, dieses Mal am �stlichen Meer. \n X X X X X K",
            before = 8,
            after = 9},
            {location = position(918, 592, -3),
            english = "Into the forests, in the home of a hermit, you will find me. \n X X X X X X X X X U",
            german = "In den W�ldern, im Haus eines Einsiedlers, wirst du mich finden. \n X X X X X X X X X X U",
            before = 10,
            after = 11},
            {location = position(820, 94, 0),
            english = "Your thirst for knowledge is like that of which a man lost in the desert will face. Oddly apt, as you would both find what you seek in the very same place. \n X X X X X X A X X X X",
            german = "Dein Wissensdurst ist wie der eines Mannes, der sich in der W�ste verirrt hat. Seltsam treffend, denn du w�rdest beides was du suchst am selben Ort finden. \n X X X X X X A X X X X",
            before = 12,
            after = 13},
            {location = position(386, 671, 0),
            english = "Give praise to the gods of old, and you will find. It can be rewarding, doing what you're told. \n X X X X X X X X T",
            german = "Lobt die G�tter der Vergangenheit, und du wirst es finden. Es kann lohnend sein, das zu tun, was man dir sagt. \n X X X X X X X X X T",
            before = 14,
            after = 15},
            {location = position(570, 127, 0),
            english = "Now for the final answer, you will have to combine. What you've learned so far, into one mind. \n X X X X X X X X X X T",
            german = "F�r die endg�ltige Antwort musst du nun alles kombinieren. Das was du bisher gelernt hast, zu einem Gedanken zusammenf�gen. \n X X X X X X X X X X X T",
            before = 16,
            after = 17},
        }
    },
    lhorPuzzle = {
        english = "My coat is dark as the night, my home shines like the sun. When Nargun is playing tricks, I'll be there. What am I? Speak my name out loud, and knowledge shall be granted to you.",
        german = "Mein Mantel ist dunkel wie die Nacht, mein Heim funkelt wie die Sonne. Wenn Nargun Streiche spielt, werde ich da sein. Was bin ich? Sprich meinen Namen laut aus, und die Weisheit wird dir gew�hrt werden."
    },
    lukPuzzle = {
        denounce = {
            english = "Will you denounce the fallen god in the name of knowledge?",
            german = "Wirst du den gefallenen Gott im Namen des Wissens verdammen?",
            yes = {
                english = "Denounce Moshran",
                german = "Veruteile Moshran"
            },
            no = {
                english = "Praise Moshran",
                german = "Lobpreise Moshran"
            },
            denounced = {
                english = "You did well by denouncing that evil. Go reap your reward, if you haven't already.",
                german = "Du hast gut daran getan, dieses �bel zu verurteilen. Geh und hol dir deine Belohnung - wenn du es nicht schon getan hast."
            },
            praised = {
                english = "You've already praised Moshran. It is too late to take back this offense now.",
                german = "Du hast Moshran bereits gelobt. Jetzt ist es zu sp�t, diese Tat zur�ckzunehmen."
            }
        },
        denounced = {
            english = "As you touch the orb, an ethereal feeling of good-will seems to reach out from the void, making it light up. Could it be the gods approving of your actions?",
            german = "Als du die Kugel ber�hrst, scheint ein �berirdisches Gef�hl des guten Willens aus der Leere zu kommen und sie zum Leuchten zu bringen. K�nnte es sein, dass die G�tter dein Handeln guthei�en?"
        },
        praised = {
            english = "As you touch the orb, an ethereal entity radiating hostility seems to reach out from the void in an attempt to prevent the orb from lighting up. However, at the same moment, a separate ethereal entity reaches out from the nearby altar, overpowering the first entity and lighting up the sphere.",
            german = "Als du die Kugel ber�hrst, scheint ein feindseliges Wesen aus der Leere zu kommen und zu versuchen, die Kugel am Aufleuchten zu hindern. Doch im selben Moment greift ein anderes �bernat�rliches Wesen aus dem nahegelegenen Altar hervor, �berw�ltigt das erste Wesen und bringt die Kugel zum Leuchten."
        },
        denouncedInform = {
            english = "You denounce Moshran. You feel like the gods look more favourably upon you already.",
            german = "Du verurteilst Moshran. Du hast das Gef�hl, dass die G�tter bereits wohlwollender auf dich schauen."
        },
        praisedInform = {
            english = "You praised Moshran. Oh you anarchist you, what have you done?",
            german = "Du hast Moshran gelobt. Oh, du Anarchist, du, was hast du getan?"
        }
    },
    phercPuzzle = {
        english = "If knowledge you seek, blood you must spill. Come on; give it a try, it might just be an unexpected thrill.",
        german = "Wenn du Wissen suchst, musst du Blut vergie�en. Komm schon, versuch es, es k�nnte ein unerwarteter Nervenkitzel sein."
    },
    qwanPuzzle = {
        fail = {
            english = "The lever refuses to budge. It would seem you may need the aid of someone stronger if you want to proceed.",
            german = "Der Hebel weigert sich sich zu bewegen. Es sieht so aus als br�uchtest du die Hilfe von jemandem, der st�rker ist, wenn du weitermachen willst."
        },
        success = {
            english = "Using all your strength, you barely manage to move the lever.",
            german = "Mit aller Kraft schaffst du es gerade noch, den Hebel zu bewegen."
        }

    },
    savPuzzle = {
        english = "I lost my darling pet Bunbun! She should be across this sea of lava! If you want my knowledge, help me find her and bring her safely here!",
        german = "Ich habe mein liebes Haustier Bunbun verloren! Sie sollte auf der anderen Seite dieses Lavameers sein! Wenn du mein Wissen willst, hilf mir, sie zu finden und sicher hierher zu bringen!",
        noSpider = {
            english = "As you activate the mechanism, you notice a small spider is forced out of its hole. Could this actually be Bunbun?",
            german = "Als du den Mechanismus aktivierst, bemerkst du, dass eine kleine Spinne aus ihrem Loch herauskommt. K�nnte das tats�chlich Bunbun sein?"
        },
        spiderExists = {
            english = "Nothing happened. Bunbun must already be out here somewhere.",
            german = "Es ist nichts passiert. Bunbun muss schon irgendwo hier drau�en sein."
        }
    },
    sihPuzzle = {
        english = "Recipe for holy water:\nTwo parts the mother's water, the purest kind.\nOne part water that heals with utmost efficiency.",
        german = "Rezept f�r Weihwasser:\nZwei Teile Wasser der Mutter, die reinste Art.\nEin Teil Wasser, das mit h�chster Effizienz heilt.",
        lizardish = {
            english = "All you see are clawmarks that form various symbols. Maybe a lizardman could help you decipher it?",
            german = "Alles was du siehst sind Kratzspuren die verschiedene Symbole bilden. Vielleicht kann dir ein Echsenmensch helfen, sie zu entziffern?"
        }
    },
    yegPuzzle = {
        english = "If it is my knowledge you seek, face me while wielding a weapon many might despise as dishonorable. Only a slow, torterous death can satisfy my cravings.",
        german = "Wenn es mein Wissen ist das du suchst, dann stelle dich mir w�hrend du eine Waffe schwingst, die viele als unehrenhaft verachten w�rden. Nur ein langsamer, qualvoller Tod kann meine Begierde stillen."
    },
    tahPuzzle = {
        english = "What word is always pronounced wrong? Though before you answer this riddle, bear in mind that sometimes things are the opposite of what they might seem.",
        german = "Welches Wort wird immer falsch ausgesprochen? Bevor du dieses R�tsel beantwortest, solltest du bedenken, dass die Dinge manchmal das Gegenteil von dem sind, was sie zu sein scheinen."
    },
    sulPuzzle = {
        english = "Look at you! Only skin and bones, no meat! You know those of the family Epphurd buried in these tombs were not buried with just their heavy possessions, but their heavy bodies too! Go put on some weight, one way or the other!",
        german = "Sieh dich an! Nur Haut und Knochen, kein Fleisch! Du wei�t, dass die Angeh�rigen der Familie Epphurd, die in diesen Gr�bern begraben sind, nicht nur mit ihren schweren Besitzt�mern, sondern auch mit ihren schweren K�rpern begraben wurden! Geh und nimm etwas zu, so oder so!"
    },
    taurPuzzle = {
        english = "What kind of creature walks on four legs in the morning, two legs in the afternoon and three in the evening?",
        german = "Welches Lebewesen geht morgens auf vier Beinen, nachmittags auf zwei und abends auf drei Beinen?"
    },
    uraPuzzle = {
        english = "These noble creatures stand TOWERING as they SHIELD the EARTH on which you stand. Bring them an offering with a PURE mind and they might just impart the knowledge of nature of which you seek.",
        german = "Diese edlen Kreaturen stehen T�RMEND da und SCHILDEN die ERDE, auf der du stehst. Bringe ihnen ein Opfer mit einem REINEN Geist und sie k�nnten dir das Wissen �ber die Natur vermitteln, das du suchst."
    },
    --item/books.lua
    grimoire = {
        name = {
            english = "Grimoire",
            german = "Grimoire"},
        description = {
            english = "A grimoire used by mages.",
            german = "Ein Grimoire das Magier verwenden."}
    },
    --magic/magicfighting.lua
    wandTutorial = {
        english = "You've successfully used wand magic! You can now return to Terry Ogg.",
        german = ""
    },
    --item/fountain.lua
    fountainInfo = {
        english = "To drink of me, an offering I pursue. The blessing of the elders, I want from you.",
        german = "Um von mir zu trinken, verlange ich ein Opfer. Den Segen der Alten will ich von dir."
    }

}
M.qListDe = {"f�rchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","gro�artige","hervorragende"}
M.qListEn = {"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"}
return M
