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
        {stat = "strength", germanStat = "Stärke", adjective = {english = "strong.", german = "stark."}},
        {stat = "constitution", germanStat = "Ausdauer", adjective = {english = "sturdy.", german = "ausdauernd."}},
        {stat = "dexterity", germanStat = "Geschicklichkeit", adjective = {english = "dexterous.", german = "geschickt."}},
        {stat = "agility", germanStat = "Schnelligkeit", adjective = {english = "nimble.", german = "flink."}},
        {stat = "willpower", germanStat = "Willenskraft", adjective = {english = "strong-minded.", german = "willensstark."}},
        {stat = "perception", germanStat = "Wahrnehmung", adjective = {english = "perceptive.", german = "aufmerksam."}},
        {stat = "essence", germanStat = "Essenz", adjective = {english = "spiritual.", german = "spirituell."}}
        },
    statValuesText = {
        {value = 14, english = "The target is very ", german = "Das Ziel ist sehr "},
        {value = 8, english = "The target is somewhat ", german = "Das Ziel ist einigermaßen "},
        {value = 0, english = "The target is not very ", german = "Das Ziel ist nicht sehr "}
        },
    --spirit/converInfoToDialogue.lua
    infoOptionsText = {
        {english = "Gender/race", german = "Geschlecht/Rasse", identifier = "genderRace", rune = "Fhen"},
        {english = "Mana", german = "Mana", identifier = "MP", rune = "Ira"},
        {english = "Stamina", german = "Ausdauer", identifier = "FP", rune = "Kah"},
        {english = "Location", german = "Standort", identifier = "location", rune = "Mes"},
        {english = "Skill", german = "Fähigkeiten", identifier = "skill", rune = "Orl"},
        {english = "Magic Resistance", german = "Magieresistenz", identifier = "MR", rune = "Pherc"},
        {english = "Attributes", german = "Attribute", identifier = "intelligence", rune = "Qwan"},
        {english = "Terrain type", german = "Geländetyp", identifier = "terrain", rune = "PEN"},
        {english = "Health", german = "Gesundheit", identifier = "HP", rune = "Sih"},
        {english = "Speed", german = "Geschwindigkeit", identifier = "spd", rune = "Sul"},
        {english = "Item properties", german = "Gegenstandseigenschaften", identifier = "item", rune = "Anth"},
        {english = "Equipment", german = "Ausrüstung", identifier = "equipment", rune = "Sav"}
        },
    chooseInfoTexts = {
        title = {english = "Target information", german = "Informationen zum Ziel"},
        text = {english = "Choose what information of the target you want to view.", german = "Wähle aus welche Informationen des Ziels du sehen willst."}
        },
    types = {
        {english = "creature", german = "Kreatur"},
        {english = "item", german = "Gegenstand"},
        {english = "position", german = "Position"},
        {english = "player", german = "Spieler"}
        },
    targetSelectionList = {
        title = {english = "Target Selection", german = "Auswahl des Ziels"},
        text1 = {english = "Select which target you want to send the information to.", german = "Wähle welchem Ziel du Informationen übertragen willst."},
        text2 = {english = "Select which target you want to view the information of.", german = "Wähle vom welchem Ziel du Infomationen sehen willst."},
        target = {english = "Target ", german = "Ziel"}
    },
    --spirit/terrain.lua
    tileDescriptions = {
        {id = 0, english = "Air", german = "Luft"},
        {id = 1, english = "Rocky terrain", german = "Felsen"},
        {id = 2, english = "Rocky terrain", german = "Natürlicher Fels"},
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
        success = {english = "You hear the voice of your telepathic partner in your mind: ", german = "Du hörst die Stimme der Person mit der du eine telephatische Verbindung eingegangen bist: "},
        request = {english = "What do you want to tell your telepathic partner?", german = "Was willst du deinem Telepathiepartner sagen?"},
        established = {english = "You feel a telepathic connection establish between you and someone else.", german = "Du spürst wie sich eine telephatische Verbindung zwischen dir und jemand anderem aufbaut."}
        },
    -- createSpell.lua
    createSpellTexts = {
        BHONA = {english = "BHONA spells may only contain up to two runes.", german = "Zaubersprüche mit BHONA dürfen maximal 2 Runen enthalten."},
        --Example texts for prefix/suffix: The rune Fhen has been added to the spell., The rune RA has been added as the primary rune of the spell.
        prefix = {english = "The rune ", german = "Die Rune "},
        suffix = {english = " has been added to the spell.", german = " wurde dem Zauberspruch hinzugefügt."},
        suffixPrimary = {english = " has been added as the primary rune of the spell.", german = " wurde als primäre Rune dem Zauberspruch hinzugefügt."},
        mana = {english = "Not enough mana.", german = "Nicht genug Mana."},
        minor = {english = "You must first learn how to use any minor rune before you can add it to your spell.", german = "Du musst zuerst lernen wie man eine geringe Rune nutzt bevor du sie zu deinem Zauberspruch hinzufügst. " },
        allRunes = {english = "You do not know any more runes that can be added to the spell.", german = "Du kennst keine weiteren Runen die zum Zauberspruch hinzugefügt werden können."},
        --example text for slot: You name the spell in spell slot 7: Fire ball
        slot = {english = "You name the spell on page ", german = "Du benennst den Zauberspruch auf Seite  "},
        creation = {english = "Spell Creation", german = "Zauberspruch Erstellung"},
        selectRune = {english = "Select which rune you want to add to your spell.", german = "Wähle welche Rune du dem Zauberspruch hinzufügen möchtest."},
        selectPrimary = {english = "Select a primary rune for your spell.", german = "Wähle eine primäre Rune für deinen Zauberspruch."},
        nameSpell = {english = "Name the spell", german = "Benenne den Zauberspruch."},
        pickOption = {english = "Pick an option.", german = "Wähle eine Möglichkeit."},
        addRune = {english = "Add rune", german = "Füge eine Rune hinzu."},
        finish = {english = "Finish spell", german = "Finalisiere den Zauber."},
        unfinished = {english = "Unfinished", german = "Unvollendet"},
        quillAndBook = {english = "You must hold a magic book and quill in your hands.", german = "Du musst ein magisches Buch und eine Schreibfeder in deinen Händen halten."},
        noPrimary = {english = "You must first learn how to use a primary rune before you can create a spell.", german = "Du musst zuerst lernen wie man eine primäre Rune nutzt bevor du einen Zauberspruch erstellen kannst."},
        create = {english = "Create a spell", german = "Erschaffe einen Zauberspruch."},
        overwrite = {english = "Yes, overwrite it.", german = "Ja, ich überschreibe ihn."},
        dontOverwrite = {english = "No, select another page.", german = "Nein, ich wähle eine andere Seite. "},
        quill = {english = "You need a quill to do any work at a desk.", german = "Du brauchst eine Schreibfeder um an diesem Tisch arbeiten zu können."},
        createBook = {english = "Portal Book Creation", german = "Erschaffung von Portalbüchern"},
        createGrimoire = {english = "Enchant a book into a Grimoire", german = "Verzaubere ein Buch in ein Grimoire"},
        bookNeeded = {english = "You need to hold a blank book in your hand in order to enchant it into a Grimoire.", german = "Du musst einen leeres Buch in deinen Händen halten, um es in ein Grimoire verzaubern zu können."},
        enchantSuccess = {english = "You have successfully enchanted the book into a Grimoire.", german = "Du hast erfolgreich ein Buch in ein Grimoire verzaubert."}
        },
    -- targeting.lua
    levText = {
        english = "You realise it's been too long since you last cast this spell with HEPT, as you feel the mana draining from your body finds no target.",
        german = "Du bemerkst, dass es zu lange her ist, das du das letzte Mal einen Zauberspruch mit HEPT genutzt hast, denn du spürst wie das Mana aus deinem Körper fließt und kein Ziel findet."
        },
    -- reduceMana.lua
    manaReduction = {
        english = "You can feel some of your mana being drained from out of your body.",
        german = "Du spürst wie etwas Mana aus deinem Körper fließt."
    },
    -- reduceFood.lua
    foodReduction = {
        english = "You can feel some of your stamina being drained out of your body.",
        german = "Du spürst wie etwas Ausdauer deinen Körper verlässt."
    },
    -- plantRoot.lua, traps.lua
    plantRootTexts = {
        name = {
            english = "Entangling Plant",
            german = "Schlingpflanze"},
        description = {
            english = "Upon closer inspection, you may notice the leaves of the plant having a magical looking glow to them.",
            german = "Bei genauerer Betrachtung stellst du fest, dass die Blätter der Pflanze ein magisches Leuchten abgeben."},
        entangled = {
            english = "Stepping onto the plant, yo uare entangled by its vines, slowing you down.",
            german = ""
        }
    },
    earthTrapTexts = {
        name = {english = "Earth Cloud", german = "Erdwolke"},
        description = {english = "A misty green cloud with an earthy scent to it.", german = "Eine nebelige gründe Wolke mit erdigem Geruch."},
        cloud = {english = "Stepping into the cloud of earth magic, the gaseous substance flocks towards you in an attempt to enter your body.", german = "Als du die Wolke aus Erdmagie berührst, strömt das Gas auf dich zu und versucht in deinen Körper einzudringen."},
        plant = {english = "As you step onto the plant, it releases a gaseous substance that seems to flock towards you in an attempt to enter your body.", german = "Als du die Pflanze berührst, stößt sie ein Gas aus welches versucht in deinen Körper einzudringen."},
        illusion = {english = "As you step into the cloud of earth magic, nothing happens to you. Was it just an illusion?", german = "Als du die Wolke aus Erdmagieberührst pasiert....nichts. War es etwa nur eine Illusion?"}
    },
    -- movement.lua
    movementTexts = {
        flying = {english = "A blast of air magic sends you flying.", german = "Ein Stoß von Luftmagie lässt dich fliegen."},
        walk = {english = "A strong wind forces you to step aside.", german = "Ein starker Wind zwingt dich zur Seite zu gehen."},
        turn = {english = "A sudden burst of wind turns you around.", german = "Ein plötzlicher Windstoß wirbelt dich herum."}
    },
    -- spirit/creatures.lua
    genderTexts = {
        {english = "male", german = "männlich", value = 0},
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
        {name = {english = "bear", german = "Bär"},  id = 51},
        {name = {english = "raptor", german = "Schnapper"},  id = 52},
        {name = {english = "zombie", german = "Zombie"},  id = 53},
        {name = {english = "hellhound", german = "Höllenhund"},  id = 54},
        {name = {english = "imp", german = "Kobold"},  id = 55},
        {name = {english = "iron golem", german = "Eisengolem"},  id = 56},
        {name = {english = "ratman", german = "Rattenmensch"},  id = 57},
        {name = {english = "dog", german = "Hund"},  id = 58},
        {name = {english = "beetle", german = "Käfer"},  id = 59},
        {name = {english = "fox", german = "Fuchs"},  id = 60},
        {name = {english = "slime", german = "Schleim"},  id = 61},
        {name = {english = "chicken", german = "Huhn"},  id = 62},
        {name = {english = "bone dragon", german = "Knochendrache"},  id = 63},
        {name = {english = "rat", german = "Ratte"},  id = 111},
        {name = {english = "dragon", german = "Drache"},  id = 112},
        {name = {english = "rabbit", german = "Hase"},  id = 113},
        {name = {english = "demon", german = "Dämon"},  id = 114},
        {name = {english = "fairy", german = "Fee"},  id = 115},
        {name = {english = "deer", german = "Reh"},  id = 116},
        {name = {english = "ettin", german = "Ettin"},  id = 117}
    },
    -- spirit/equipment.lua
    equipmentPrefix = {
        quality = {english = "Equipment quality: ", german = "Qualität der Ausrüstung: "},
        durability = {english = "Equipment state: ", german = "Zustand der Ausrüstung: "}
    },
    equipmentNames = {
        {english = "Backpack", german = "Tasche", slot = 0},
        {english = "Head", german = "Kopf", slot = 1},
        {english = "Neck", german = "Hals", slot = 2},
        {english = "Torso", german = "Torso", slot = 3},
        {english = "Hands", german = "Hände", slot = 4},
        {english = "In Left Hand", german = "In der linken Hand", slot = 5},
        {english = "In Right Hand", german = "In der rechten Hand", slot = 6},
        {english = "Left ring finger", german = "Linker Ringfinger", slot = 7},
        {english = "Right ring finger", german = "Rechter Ringfinger", slot = 8},
        {english = "Legs", german = "Beine", slot = 9},
        {english = "Feet", german = "Füße", slot = 10},
        {english = "Back", german = "Rücken", slot = 11},
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
        overTime = {english = "You siphon health from your target, recovering your own over time.", german = "Du entziehst deinem Ziel Lebensenergie, während sich deine mit der Zeit erholt."}
    },
    --magicDoT.lua
    burn = {english = "You've been inflicted with a magical burn, causing you to suffer fire damage over time.", german = "Dir wurde eine magische Verbrennung zugefügt, du erleidest mit der Zeit Feuerschaden."},
    poison = {english = "You've been inflicted with a magical poison, causing you to suffer poisonous damage over time.", german = "Dir wurde eine magische Vergiftung zugefügt, du erleidest mit der Zeit Giftschaden."},
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
        quality = {english = "Quality: ", german = "Qualität: "},
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
        {direction = {english = "south", german = "Süden"}},
        {direction = {english = "southeast", german = "Südosten"}},
        {direction = {english = "northeast", german = "Nordosten"}},
        {direction = {english = "southwest", german = "Südwesten"}},
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
        {value = 3200, english = "Target is highly experienced in many professions.", german = "Dein Ziel hat besonders viel Erfahrung in vielen Fähigkeiten. "},
        {value = 2200, english = "Target is very experienced in many professions", german = "Dein Ziel hat sehr viel Erfahrung in vielen Fähigkeiten."},
        {value = 700, english = "Target is experienced in many professions.", german = "Dein Ziel hat viel Erfahrung in unterschiedlichen Fähigkeiten."},
        {value = 450, english = "Target is experienced in some professions.", german = "Dein Ziel ist hat Erfahrung in unterschiedlichen Fähigkeiten."},
        {value = 300, english = "Target has some experience in multiple professions.", german = "Dein Ziel hat etwas Erfahrung in unterschiedlichen Fähigkeiten."},
        {value = 200, english = "Target has at least some experience in a profession.", german = "Dein Ziel hat zumindest etwas Erfahrung in einer Fähigkeit. "},
        {value = 0, english = "Target has little to no experience in a profession.", german = "Dein Ziel hat wenig bis keine Erfahrung in einer Fähigkeit."}
       },
    --spirit/mana.lua
    manaTexts = {
        {english = "Target is brimming with mana.", german = "Dein Ziel ist übervoll mit Mana. ", mana = 10000},
        {english = "Target is nearly satiated with mana.", german = "Dein Ziel ist nahezu voll mit Mana. ", mana = 8000},
        {english = "Target has moderate amount of mana.", german = "Dein Ziel hat eine durchschnittliche Menge an Mana. ", mana = 5000},
        {english = "Target is running low on mana.", german = "Dein Ziel hat nur mehr wenig Mana.", mana = 2000},
        {english = "Target is almost out of mana.", german = "Dein Ziel hat fast kein Mana mehr.", mana = 1},
        {english = "Target only has enough mana to survive.", german = "Dein Ziel hat genug Mana um zu Leben.", mana = 0},
        },
    --spirit/stamina.lua
    staminaTexts = {
        {english = "Target is brimming with energy.", german = "Dein Ziel ist voller Ausdauer.", food = 10000},
        {english = "Target is almost full of energy.", german = "Dein Ziel ist nahezu voller Ausdauer", food = 8000},
        {english = "Target is starting to get tired.", german = "Dein Ziel wird langsam müde.", food = 5000},
        {english = "Target is tired.", german = "Dein Ziel ist Müde.", food = 2000},
        {english = "Target is nearly exhausted.", german = "Dein Ziel ist der Erschöpfung nahe.", food = 1},
        {english = "Target is exhausted and starving.", german = "Dein Ziel ist erschöpft und hungrig.", food = 0},
        },
    --spirit/fakeInfo.lua
    fakeEquipmentText = {
        durability = {name = {english = "Set Durability", german = "Bestimmeung der Haltbarkeit"}, text = {english = "Choose what durability the equipment should be portrayed as having.", german = " Bestimme mit welcher Haltbarkeit der Gegenstand dargestellt werden soll."}},
        quality = {name = {english = "Set Quality", german = "Bestimmung der Qualität"}, text = {english = "Choose what quality the equipment should be portrayed as having." ,  german = " Bestimme mit welcher Qualität der Gegenstand dargestellt werden soll. "}}
        },
    --castSpell.lua
    castSpellTexts = {
        range = {english = "The target is too far away.", german = "Dein Ziel ist zu weit weg."},
        secret = {english = "You secretly begin casting a wind spell.", german = "Du beginnst heimlich einen Windzauber zu wirken."},
        mana = {english = "You do not have enough mana.", german = "Du hast nicht genug Mana."},
        sight = {english = "Line of sight is not clear.", german = "Du kannst dein Ziel nicht richtig sehen."},
        stats = {english = "As you attempt to cast the spell, you feel an abrupt headache prevent you from proceeding. Did something happen to your ability to cast magic?", german = "Als du versuchst den Zauber zu Sprechen, verspürst du plötzlich heftige Kopfschmerzen die dich daran hindern. Ist etwas mit deiner Fähigkeit zu Zaubern passiert? "}
    },
    --magicBook.lua
    magicBookTexts = {
        empty = {english = "The spell list is empty. Perhaps you could fill it in at a desk?", german = "Deine Zauberliste ist leer. Vielleicht kannst du sie an einem Schreibtisch befüllen?"},
        inane = {english = "All you can see are the inane scribbles made by someone else. They make no sense to you!", german = "Alles was du siehst sind unsinnige Kritzeleinen die jemand anderes gemacht hat. Das ergibt keinen Sinn!"},
        --primed example text: "Wand primed for the spell: Fireball."
        primed = {english = "Wand primed for the spell: ", german = "Der Zauberstab ist vorbereitet für den Zauber:"},
        selection = {english = "Spell Selection", german = "Zauberauswahl"},
        select = {english = "Select which spell you want to cast.", german = "Wähle welchen Zauber du sprechen willst."},
        incomplete = {english = "The spellbook has no complete spells in it for you to cast.", german = "Das Zauberbuch beinhaltet keinen vollständigen Zauber die du sprechen kannst."},
        nonsense = {english = "All you can see are nonsensical scribbles. Wait, did that line just move? This may be beyond your ability to understand.", german = "Alles was du sehen kannst sind unsinnige Kritzeleine. Warte...hat sich die Linie etwas bewegt? Das übersteigt dein Verständnis. "},
        glyphWand = {english = "Wand primed for wand magic & glyph forging.", german = "Der Zauberstab ist vorberiette für Stabmagie und Glyphenmagie"},
        priming = {english = "Wand priming", german = "Zauberstab Vorbereitung"},
        type = {english = "Select what type of magic you want your wand primed to.", german = "Wähle auf welche Magie du deinen Zauberstab vorbereiten willst."},
        spells = {english = "Spells", german = "Zaubersprüche"},
        wandGlyph = {english = "Wand Magic & Glyph Forging", german = "Stabmagie & Glyphenmagie"},
        spatial = {english = "Spatial Magic", german = "Raummagie"},
        spatialAttune = {english = "Wand attuned to spatial magic", german = " Dein Zauberstab ist für Raummagie vorbereitet."},
        portalBookNeeded = {english = "You must hold the portal book you wish to evaluate in your hand.", german = "Du musst das Portalbuch, dass du bewerten willst, in deinen Händen halten."}

    },
    --teaching.lua
    teachingTexts = {
        knows = {english = "Target already knows that rune.", german = "Dein Ziel kennt diese Rune bereits."},
        level = {english = "Target is not skilled enough at magic to learn this rune yet.", german = "Dein Ziel versteht noch nicht genug von Magie um diese Rune lernen zu können. "},
        studentCooldown = {english = "Not enough time has passed yet since the last time the target was taught how to use a magic rune.", german = "Es verging noch nicht genug Zeit seit dein Ziel die letzte Rune gelernt hat."},
        teacherCooldown = {english = "You've been teaching too many people runes recently.", german = "Du hast in letzter Zeit zu vielen Personen Runen gelehrt."},
        stats = {english = "The target does not have the mental faculties to learn this rune.", german = "Dein Ziel besitzt nicht die geistige Leistungsfähigkeit um diese Rune zu lernen."},
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
        category = {english = "Portal Books", german = "Portalbücher"},
        book = {english = "Portal book: ", german = "Portalbuch: "},
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
    },
    spatialTexts = {
        distanceTexts = {
            {value = 600, english = " very far ", german = "sehr fern "},
            {value = 400, english = " far ", german = "fern "},
            {value = 100, english = " somewhere ", german = "in der Nähe "},
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
            german = "Du hast deine Raummagie auf die sich kreuzenden Manalinien dieses Gebiets abgestimmt. Du kannst dir nun die räumlichen Koordinaten merken um dich her zu teleportieren, Portale zu öffnen oder sogar Portalbücher schreiben die dich hier her führen. Natürlich nur wenn es deine Erfahrung in Raummagie erlaubt."
        },
        lackingSkill = {
            english = "You need to attain a higher level of expertise in spatial magic to remember the spatial coordinates for this location.",
            german = "Um dir die räumlichen Koordinaten für diesen Ort merken zu können, musst du deine Fähigkeiten in der Raummagie verbessern."
        },
        noNearby = {
            english = "There are no crossing mana lines nearby for you to attune your spatial magic to. The nearest one is ",
            german = "Hier befinden sich keine kreuzenden Manalinien um deine Raummagie abzustimmen. Die Näheste befindet sich "
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
            english = "Select which colour your portals should have",
            german = "Wähle welche Farbe deine Portale haben sollen."
        },
        colours = {
            red = { english = "Red", german = "Rot"},
            blue = { english = "Blue", german = "Blau"}
        },
        incantation = {
            portal = "Locus Ianua", -- latin for "space door"
            teleport = "Locus Itinerantur" --latin for "space travel"
        },
        teleportation = {
            english = "Teleportation",
            german = "Teleportation"
        },
        destination = {
            english = "Select your destination",
            german = "Wähle deinen Zielort"
        },
        castSelect  = {
            english = "What kind of spatial magic do you want to cast?",
            german = "Welche Raummagie möchtest du sprechen?"
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
            german = "Das sprechen deiner Raummagie wurde unterbrochen."
        },
        interruptedBook = {
            english = "Your reading of the portal books incantation was interrupted.",
            german = "Das Lesen der Beschwörungsformel des Portalbuches wurde unterbrochen. "
        },
        cantFindMore = {
            english = "You don't detect any more crossing mana lines to attune to. Perhaps you've found them all?",
            german = "Du kannst keine sich kreuzenden Manalinien mehr ausmachen. Vielleicht hast du ja schon alle gefunden?"
        },
        differentElevation = {
            english = "You can feel that there are crossed mana lines nearby that you can attune your spatial magic to, however not here. Perhaps you'd had better luck searching at a different elevation?",
            german = "Du kannst spüren, dass du dich direkt in der Nähe einer sich kreuzenden Manalinie befindest, an der du deine Raummagie abstimmen könntest. Es scheint aber als würde sich dieser auf einer anderen Ebene befinden."
        },
        vanish = {
            english = "#me finishes the incantation, vanishing in a flash of bright magical light.",
            german = "#me beendet seine Beschwörungsformel und verschwindet in einem magisch leuchtendem Lichtblitz."
        },
        appear = {
            english = "#me appears in a flash of bright magical light.",
            german = "#me erscheint in einem magisch leuchtendem Licht."
        },
        badTarget  = {
            english = "Something in the area disrupts your casting in the final moment. Perhaps this isn't a good spot for spatial magic?",
            german = "Etwas in der Nähe unterbericht deinen Zauber im letzten Moment. Möglicherweise ist das kein guter Ort für Raummagie?"
        },
        showBookQuality = {
            english = "Portal Book Evaluation",
            german = "Portalbuchbewertung"
        },
        bookQuality = {
            english = "Portal book quality:\n",
            german = "Qualität des Portalbuches:\n "
        },
        portalBookChant = {
            english = "#me begins chanting the incantation written in a portal book.",
            german = "#me beginnt damit die Beschwörungsformel des Portalbuches zu lesen."
        }
    },
    --item/wands.lua
    wounded = { english = "Your wounds made it hard for you to concentrate, causing you to make a mistake in your casting.", german = "Deine Verletzungen machen es dir schwer dich zu konzentrieren. Du machst einen Fehler beim Zaubern!"},
    --item/fountain.lua
    forgetfulFountain = {
        name = { english = "Fountain of Forgetfulness", german = "Brunnen des Vergessens"},
        description = { english = "A mysterious fountain covered in vapour. As you near it, you feel foggy minded; Did you just forget something important?", german = "Ein mysteriöser, in Dampf gehüllter Brunnden. Als du dich ihm näherst, fühlst sich dein Kopf benebelt an.; Hast du gerade etwas Wichtiges vergessen? "}
    },
    fountainDialogue = {
        yes = { english = "Yes", german = "Ja"},
        no = { english = "No", german = "Nein"},
        certain = { english = "Are you certain you wish to forget all your existing magical knowledge? This can not be undone once it has been done", german = ""},
        reallyCertain = { english = "Are you really sure?", german = "Bist du dir wirklich sicher?"},
        finalVerification = { english = "Then your magical knowledge will be forgotten... right?", german = "Dein gesamtes magisches Wissen wird vergessen....Bist du dir sicher?"},
        removed = { english = "As you drink from the fountain your eyes grow dazed and your head feels foggy. Why does it suddenly feel like your memory is full of blank spots? What are you doing here? Why is the sky blue? You don't know.", german = "Als du aus dem Brunnen trinkst schweifen deine Augen in die Ferne und dein Kopf füllt sich mit Nebel. Warum fühlt es sich plötzlich so an als ob dein Gedächntis voller leerer Stellen ist? Was machst du hier? Wieso ist der Himmel blau? Du weißt es nicht."},
        kept = { english = "You wisely decided to keep your magical knowledge. What kind of fool would give up such precious wisdom, anyways?", german = "Du entscheidest dich weise und behälst dein magisches Wissen. Welcher Narr würde etwas so Kostbares auch aufgeben?"}
    },
    --runeHintsBook.lua and magicSphere.lua
    runeHintsBookTexts = {
        CUN =  {rune = "CUN",
            hint = {
                english = "Near the ruins of a mother praised lies the secret of water.",
                german = "In der Nähe der Ruinen einer gelobten Mutter liegt das Gehemnis des Wassers."},
            name = {
                english = "Mysterious Blue Sphere",
                german = "Mysteriöse blaue Sphäre"},
            description = {
                english = "A mysterious glass sphere that appears to contain it's own ocean of water.",
                german = "Eine mysteriöse, gläserne Sphäre. Es scheint als würde sie ein ganzes Meer beinhalten."},
            location = position(630,599,0)},
        JUS = {rune = "JUS",
            hint = {
                english = "Up high where wind and ocean meet, with fuzzy creatures at your feet.",
                german = "Hoch oben, wo sich Wind und Meer treffen, mit flauschigen Geschöpfen zu deinen Füßen."},
            name = {
                english = "Windy Mysterious  Sphere",
                german = "Mysteriöse windige Sphäre"},
            description = {
                english = "A mysterious glass sphere that appears to be full of blowing wind.",
                german = "Eine mysteriöse, gläserne Sphäre. Es scheint als wäre sie voll mit stürmendem Wind. "},
            location = position(329,156,1)},
        PEN = {rune = "PEN",
            hint = {
                english = "In a place a hermit might call home, you'll find a hidden tome.",
                german = "Am Ort den der Einsiedler sein Zuhause nennt, dort findest du den hellsten Geist."},
            name = {
                english = "Mysterious Spiritual Sphere",
                german = "Mysteriöse strahlende Sphäre"},
            description = {
                english = "A mysterious glass sphere that contains a bright spiritual light.",
                german = "Eine mysteriöse, gläserne Spähre, die ein strahlendes Licht enthält. Wie ein strahlender Geist."},
            location = position(786,128,0)},
        RA = {rune = "RA",
            hint = {
                english = "A lone man betwixt the desert dry and forest lush guards the secret of the flame.",
                german = "Ein einsamer Mann zwischen der trockenen Wüste und dem üppigen Wald hütet das Gehemnis des Feuers."},
            name = {
                english = "Fiery Mysterious Sphere",
                german = "Mysteriöse feurige Sphäre"},
            description = {
                english = "A mysterious glass sphere that appears to be full of flickering flames. It doesn't appear to give off any heat, though.",
                german = "Eine mysteriöse, gläserne Sphäre. Es scheint als würde sie im Inneren brennen. "},
            location = position(472,765,0)},
        SOLH = {rune = "SOLH",
            hint = {english = "Deep below and long forgotten, a garden lush with guards that are rotten.",
                german = "Tief unten und längst vergessen, ein Garten voller Wächter die schon längst zerfressen."},
            name = {
                english = "Myserious Earthy Sphere",
                german = "Mysteriöse erdige Sphäre"},
            description = {
                english = "A mysterious sphere that appears to contain a deep, dark soil",
                german = " Eine mysteriöse, gläserne Sphäre. Es scheint als würde sie dunkle, schwarze Erde beinhalten."},
            location = position(793,297,-3)},
        BHONA = {rune = "BHONA",
            hint = {
                english = "Back to where you started, after you first departed.",
                german = "Zurück dorthin, als du einst gingst."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "Within the sphere you spot two vague figures. One stands before the other, appearing to be preaching. The latter appears to be kowtowing in a show of piety towards the former.",
                german = ""},
            location = position(469, 869 , -9)},
        Anth = {rune = "Anth",
            hint = {
                english = "An enormous structure, static as can be. Were it not, a flood you would see.",
                german = "Ein gigantisches Bauwerk so unbeweglich. Wäre es nicht, die Flut würdest du sehen. "},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "Within the sphere various objects can be seen, but what they all have in common is that they stand perfectly still. One could even call them static.",
                german = "Innerhalb der Sphäre kannst du die unterschiedlichsten Objekte erkennen. Eines haben sie alle gemeinsam, sie stehen vollkommen still. Man könnte sie auch statisch nennen. "},
            location = position(843, 216 , -3)},
        Dun = {rune = "Dun",
            hint = {
                english = "In an area vast and empty, where white hands rule.",
                german = "MIn einem weiten und leeren Gebiet, in dem die weiße Hände regiert."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
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
                german = "Mysteriöse Sphäre"},
            description = {
                english = "The sphere contains an eerie magical fog that seems to attempt to get away from you.",
                german = "Die Sphäre enthält einen unheimlichen magischen Nebel, der zu versuchen scheint, von dir wegzukommen."},
            location = position(595, 319, 3)},
        Fhen = {rune = "Fhen",
            hint = {
                english = "Where trolls seek haven and drink fine wine, out in the garden do we dine.",
                german = "Wo Trolle Zuflucht suchen und besten Wein versuchen, dort im Garten speisen wir."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "The sphere contains an eerie magical fog that seems to attempt to get closer to you.",
                german = "Die Sphäre enthält einen unheimlichen magischen Nebel, der zu versuchen scheint, sich dir zu nähern."},
            location = position(736,317,0)},
        Hept = {rune = "Hept",
            hint = {
                english = "In a cold place oh so high. Watch out, or you'll freeze.",
                german = "Ein Ort so kalt und hoch. Pass auf, dort erfrierst du noch!"},
            name = {
                english = "Mysterious Frosty Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "Inside the sphere you see what resembles as snowstorm swirling about with the occasional hail",
                german = "Im Inneren der Sphäre sieht man etwas, das wie ein Schneesturm aussieht, der mit gelegentlichem Hagel umherwirbelt"},
            location = position(266,375,1)},
        Ira = {rune = "Ira",
            hint = {
                english = "Creatures not of nature, how many eyes does this one have?",
                german = "Wieviele Augen hat diese Kreatur, entspringt sicher nicht der Natur!"},
            name = {
                english = "Mysterious Eye-shaped Sphere",
                german = "Mysteriöse augenförmige Sphäre"},
            description = {
                english = "As you peer into the sphere you feel like you can see a pupil peering right back at you.",
                german = "Als du in die Sphäre starrst, fühlt es sich so an als würde eine Pupille direkt zurückstarren."},
            location = position(475, 746, -3)},
        Kah = {rune = "Kah",
            hint = {
                english = "If a mortal were to require sustenance, much could be found here.",
                german = "Dort wo sterbliche Stärkung suchen, dort findet man viel."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "As you peer into the sphere you see a steaming hot pie, so life-like you can almost smell it.",
                german = "Beim Blick in die Sphäre siehst du einen heiß dampfenden Kuchen, so lebensecht, das du ihn fast riechen kannst."},
            location = position(794 , 804, 0)},
        Kel = {rune = "Kel",
            hint = {
                english = "Where dark creatures of flight reside.",
                german = "Dort wo dunkle geschöpfe des Himmels hausen."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "As you peer into the sphere you see a feather, though before you can determine what kind of feather it is, you witness it change into a dragon wing.",
                german = "Als du in die Sphäre blickst, siehst du eine Feder. Doch bevor du feststellen kannst, um was für eine Feder es sich handelt, wirst du Zeuge, wie sie sich in einen Drachenflügel verwandelt"},
            location = position(711,619,-6)},
        Lev = {rune = "Lev",
            hint = {
                english = "Once a glorious combat academy, now left in ruins. Oh the changes of time.",
                german = "Einst eine stolze Kampfakademie, nun nur mehr Ruinen. Wie die Zeit sich ändert."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "If you peer into the sphere, you would witness an ever-changing scenery. A desert in one moment, the next a tundra, it constantly shows you new, unique sights.",
                german = ""},
            location = position(188, 809, -3)},
        Lhor = {rune = "Lhor",
            hint = {
                english = "Trick you, fool you, lead you astray. Who am I?",
                german = "Ich betrüge, ich täusche ich führe dich in die Irre. Wer bin ich?"},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "An illusory raven is sat inside the sphere, cleaning its wings with its beak.",
                german = ""},
            location = position(781, 438, 0)},
        Luk = {rune = "Luk",
            hint = {
                english = "Among hostile elves, down down we go.",
                german = "Unter feindesligen Elfen, tief tief runter müssen wir."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "A bloodshot eye appears to be peering back out at you from inside the sphere.",
                german = ""},
            location = position(564, 542 , -6)},
        Mes = {rune = "Mes",
            hint = {
                english = "I light up the path for beings made of wood that have lost their way.",
                german = "Ich erleuchte den Weg für Wesen aus Holz, die den Weg verloren haben."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "The sphere gives off a warm, radiant light.",
                german = ""},
            location = position(537, 612, 1)},
        Orl = {rune = "Orl",
            hint = {
                english = "Created from an egg. Creepy, crawly, eight legged friends.",
                german = "Zuerst ein Ei. Gruselige, krabbelnde, achtbeinige....."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "The sphere appears as if full of tiny little spiders, desperately trying to make their way out to get to you.",
                german = ""},
            location = position(907, 487, -6)},
        Pherc = {rune = "Pherc",
            hint = {
                english = "The pain of the desert heat is nigh as high as the pain of their axes.",
                german = "Der Schmerz der Wüstenhitze ist fast so groß wie der Schmerz der Axt!"},
            name = {
                english = "Mysterious Bloody Sphere",
                german = ""},
            description = {
                english = "A grotesque scene full of blood and gore meet you as you peer into the sphere.",
                german = ""},
            location = position(80, 431, -6)},
        Qwan = {rune = "Qwan",
            hint = {
                english = "On a mountain up high, where creatures of stone reside.",
                german = "Hoch in den Bergen, bei Kreaturen aus Stein."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "Within the sphere lies a lone, huge-looking boulder... or is it a pebble?",
                german = ""},
            location = position(241, 776, 1)},
        Sav = {rune = "Sav",
            hint = {
                english = "In a firey castle where dragons reside below.",
                german = "Ein brennendes Schloss in dem die Drachen hausen."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "Within the orb you can see a majestic looking shield.",
                german = ""},
            location = position(111 , 887, -3)},
        Sih = {rune = "Sih",
            hint = {
                english = "Near water claimed by some to be capable of healing your very soul.",
                german = "In der Nähe des Wasser so rein, es könne die Seele heilen."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "The sphere gives off a feeling of warmth and wellness.",
                german = ""},
            location = position(783 , 262, -8)},
        Sul = {rune = "Sul",
            hint = {
                english = "Rotten, smelly and cursed to be slow. Such is the fate of a civilization that met its demise.",
                german = "Stinkend, verrottet zum Stillstand verflucht. Das Schicksal einer Zivilisation die ihren Untergang fand. "},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "",
                german = ""},
            location = position(0,0,0)},
        Tah = {rune = "Tah",
            hint = {
                english = "Steal from the rich, give to the poor... as long as the poor are they themselves.",
                german = "Ich stehle von den Reichen und gebe den Armen...bin doch ich der Ärmste."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "",
                german = ""},
            location = position(0,0,0)},
        Taur = {rune = "Taur",
            hint = {
                english = "This secret is guarded by creatures that dwell in a cave. What do they look like, you ask? Do they have one head? Two? Are they ugly and deranged?",
                german = "Dieses Geheimnis wird von Kreaturen bewacht die tief in Höhlen leben. Wie sehen sie aus fragst du? Haben sie einen Kopf? Zwei? Sind sie hässlich und verstört?"},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "",
                german = ""},
            location = position(0,0,0)},
        Ura = {rune = "Ura",
            hint = {
                english = "Where the guardians of nature reside",
                german = "Dort wo die Hüter der Natur wohnen."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "",
                german = ""},
            location = position(0,0,0)},
        Yeg = {rune = "Yeg",
            hint = {
                english = "Muddy, grimey and full of despair. This place is not natural, of death beware.",
                german = "Schlammig, schmutzig und voller Verzweiflung. Dieser Ort ist nicht natürlich. Hüte dich vor dem Tod."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "",
                german = ""},
            location = position(0,0,0)},
        Pera = {rune = "Pera",
            hint = {
                english = "Found in a place where a competition of speed is famously held.",
                german = "Dort an jenem Ort wo die Wettkämpfe der Schnellsten ausgetragen werden."},
            name = {
                english = "Mysterious Sphere",
                german = "Mysteriöse Sphäre"},
            description = {
                english = "All you can see within the sphere is a figure moving so fast it has become nothing but a blurry shadow.",
                german = ""},
            location = position(391, 137, 0)},
        unlitSphere = {
            english = "Empty glass sphere",
            german = "Leere gläserne Sphäre"},
        knowAll = {
            english = "There does not appear to be any knowledge in this book that you do not already know.",
            german = "Dieses Buch enthält kein Wissen, dass du nicht schon kennst."},
        requirementNotMet = {
            english = "While there's knowledge in this book that you are not knowledgable of, it appears to be beyond your capability to understand right now.",
            german = "Ein Buch voller Wissen. Doch es ist jenseits deiner Fähigkeiten es zu verstehen."},
        bookName = {
            english = "Mysterious Book",
            german = "Mysteriöses Buch"},
        bookDescription = {
            english = "An old, faded looking book full of scribbles only some may understand.",
            german = "Ein altes, verblasstes Buch voller Kritzeleinen die wohl nur die Wenigsten verstehen."},
        selectRune = {
            english = "Select the name of the rune you wish to locate.",
            german = "Wähle den Namen der Rune die du suchen möchstest."},
        unsolved = {
            english = "The sphere has no reaction to your touch. Perhaps there is something in the area that can change this?",
            german = "Als du die Sphäre berührst passiert...nichts. Möglicherweise befindet sich etwas in der Nähe, dass dies ändern könnte."},
        unwise = {
            english = "It hasn't been long enough since you last learned a rune, making it unwise to go searching for a new one.",
            german = "Es ist noch nicht lange her, dass du nach einer Rune gesucht hast. Es wäre nicht klug jetzt schon wieder eine Neue zu suchen."},
        activated = {
            english = "With a sudden glow the sphere lights up, revealing to you the sights within.",
            german = "Mit einem plötzlichen Erstrahlen leichtet die Sphäre auf und enhüllt ihre Gehemnisse."},
        learned = {
            english = "You feel a sudden surge of information enter your mind, it appears you just learned how to use the rune ",
            german = "Eine Welle von Informationen durchflutet deinen Geist. Du hast verstanden wie du die Rune nutzen kannst."},
        cooldown = {
            english = "Not enough time has passed since you last learned a rune. You feel a headache just thinking about learning a new one.",
            german = "Es ist noch nicht genug Zeit vergangen seit du die letzte Rune gelernt hast. Allein der Gedanke an eine neue Rune bereitet dir Kopfschmerzen."},
        notMetCriteria = {
            english = "As you touch the sphere, you get the feeling that you are not well versed enough or perhaps even talented enough at magic to learn the rune.",
            german = "Als du die Sphäre berührst fühlst du dich völlig überwältigt. Du hast das Gefühl, dass du noch viel lernen musst bevor du dieses Wissen aufnehmen kannst. Vielleicht bist du auch nicht talentiert genug um es je zu verstehen."},
        notMage = {
            english = "As you touch the sphere, it has no reaction other than returning to its dim state.",
            german = "Als du die Sphäre berührst passiert....nichts. Sie hört einfach auf zu Leuchten."},
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
            german = "Ein Schreibtisch welcher von Magiern benutzt wird um Zaubersprüche zu schreiben, Portalbücher zu erstellen und Grimoires zu verzaubern."}},
    quill = {
        bookNeeded = {
            english = "You need to hold the grimoire you want to label in your hand.",
            german = "Du musst den Grimoire, den du benennen willst, in deinen Händen halten."}
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
            german = "Bei näherer Betrachtung findest du ein Stück Papier am Teller."}},
    offeringHints = {
        { location = position(628, 598, 0),
        hint = {
            english = "If you wash me, I will not be clean. If you do not wash me, I will. What am I?",
            german = "Wenn du mich wäschst werde ich nicht sauber, lässt du es aber, so werde ich es doch. Was bin ich?"}
        }
    },
    windPuzzle = {
        blasted = {
            english = "You're sent flying by a blast of wind magic.",
            german = "Du wirst durch einen magischen Windstoß davongeschleudert."}

    },
    penPuzzle = {
        english = "I am easy to lift but hard to throw. What am I?\nSpeak me out loud and you shall be enlightened.",
        german = "Ich bin leicht zu heben aber schwer zu werfen. Was bin ich?\nRufe mich und werde erleuchtet."
    },
    anthPuzzle = {
        main = {
            english = "Write down the correct four-digit number and you shall be enlightened. The answer can be found by studying the pillars.",
            german = "Schreibe die richtige vierstellige Zahl nieder und werde erleuchtet. Die Antwort findest du durch das Studium der Säulen" },
        wrong = {
            english = "Wrong answer",
            german = "Falsche Antwort"},
        success = {
            english = "Success",
            german = "Erfolg"},
    },
    dunPuzzle = {
        english = "You snagas get to work now! This room should've been filled up with items yesterday!",
        german = "An die Arbeit ihr Maden. Dieser Raum hätte schon gestern mit Zeugs voll sein müssen",
        orcish = {
            english = "There seems to be something written in orcish on the scroll. You'd need someone to translate it for you.",
            german = "Die Schriftrolle scheint in einem Orkdialekt verfasst zu sein. Du brauchst Hilfe um das zu übersetzen"}
    },
    fhanPuzzle = {
        english = "We don't have time to honour the dead, they said.\nWe need to fend off Cherass' invading army, they said.\nSending off the dead is a waste of time, they said.\nWell now who's laughing?",
        german = "Wir haben nicht genug Zeit die Toten zu ehren haben sie gesagt.\nWie müssen uns gegen Cherass Armee verteidigen haben sie gesagt,\nDie Toten zu vernichten sei Zeitverschwendung haben sie gesagt.\n Doch wer lacht jetzt?",
        coffins = {
            {english = "Here lies Maxwell 'the Pebble' Orson, may he find rest in death.",
            german = "Hier liegt Maxwell 'der Kiesel' Orson, möge er in Frieden ruhen.",
            location = position(591,321,3)},
            {english = "Aren Ighys rests here. A devout follower of Bragon, his only wish was to be closer to his god.",
            german = "Hier ruht Aren Ighys. Ein gläubiger Anhänger Bragons. Er wollte näher zu seinem Gott, das war sein letzter Wunsch.",
            location = position(591,317,3)},
            {english = "Here lies the swordsman Drovan Darksword. Little did people know, he was secretly obsessed with the drow.",
            german = "Hier ruht der Schwertkämpfer Drovan Dunkelklinge. Wenige wissen, dass er ein heimlicher Verehrer der Drow war.",
            location = position(599, 317, 3)},
            {english = "Jonathan Corn, a man born to a chicken farmer. His last request was a meal from home, though he never got it.",
            german = "Jonathan Korn, geboren als Sohn eines Hühnerzüchters. Sein letzter Wunsch war eine Mahlzeit von Zuhause, die er aber nie bekam.",
            location = position(599,321,3)}
        }
    },
    fhenPuzzle = {
        english = "An elf and a dwarf sit down to drink together. What do they drink? Place both beverages on the offering plate and be enlightened.",
        german = "Ein Zwerg und ein Elf haben zusammen getrunken. Aber was? Platziere beide Getränke auf dem Opferteller und werde erleuchtet."
    },
    heptPuzzle = {
        english = "Brr, it's so cold. If only there was a way to make it warmer. There's only snow, stone and all these pesky trees nearby!",
        german = "Brr, es ist so fürchterlich kalt. Wenn es nur einen Weg geben würde es wärmer zu haben. Hier gibt es nur Schnee, Stein und diese lästigen Bäume! "
    },
    iraPuzzle = {
        english = "One eye to lift and one to sleep.\nOne to charm and one for beast.\nOne eye to wound and one eye to slow.\nOne to bring fear and one to make stone.\nOne eye makes dust and one eye brings death.\nSpeak my name aloud and you will know.",
        german = "Ein Auge zum Aufstehen und eines zum Schlafen. \nEines zum Bezaubern und eines für die Bestien.\nEin Auge zum Verwunden und ein Auge zum Verlangsamen.\nEines um Angst zu verbreiten und eines um Stein zu machen. \nEin Auge macht Staub und ein Auge bringt den Tod.\nSprich meinen Namen und du wirst es wissen."
    },
    kahPuzzle = {
        english = "For breakfast, I want an egg salad sandwich!\nFor dinner, I want a venison dish!\nFor supper... Mushroom soup!",
        german = "Zum Frühstück will ich Eiersalatsandwich! \n Zum Mittagessen will ich ein Wildgericht mit Beilage! \n Zum Abendessen...Pilzsuppe! "
    },
    kelPuzzle = {
        english = "Together, we can fly up high and soar the skies. However, it is not possible in my current state. Find me, and you shall have the knowledge you seek.",
        german = "Gemeinsam können wir hoch fliegen und die Lüfte erklimmen. Doch in meinem derzeitigen Zustand ist das nicht möglich. Finde mich und du wirst das Wissen bekommen das du suchst.",
        egg = {
            english = "A dragon egg. Could this be the answer?",
            german = "Ein Drachenei. Könnte das die Antwort sein?"
        },
        feather = {
            english = "A feather... of the chicken variety. Surely it can't be this, right?",
            german = "Eine Feder....von einem Hähnchen. Also das kann es nicht sein, oder?"
        },
        air = {
            english = "A swirling mass of pure air. You could probably fly with this?",
            german = "Eine wirbelnde Masse reiner Luft. Damit könntest du wahrscheinlich davonfliegen?"
        },
        suffix = {
            english = "\nIf you believe this to be the answer, go back to the sphere and find out.",
            german = ""
        },
    },
    mesPuzzle = {
        english = "You call this a lighthouse? Lights! We need more lights! Go get the oil, now!",
        german = ""
    },
    orlPuzzle = {
        english = "They may not be your friends, but these foul creatures will be neccessary to obtain the knowledge that you seek. Find as many as they have legs, and just... try to endure.",
        german = ""
    },
    peraPuzzle = {
        english = "It's a race! Pull both levers fast enough and you shall obtain the knowledge you seek!",
        german = "",
        slow = {
            english = "Too slow! You can always try again, though.",
            german = ""
        },
        fast = {
            english = "You made it! Now go back to reap your reward!",
            german = ""
        },
        pulled = {
            english = "You've pulled the lever, starting the timer! Hurry to the other lever!",
            german = ""
        }
    },
    bhonaPuzzle = {
        success = {
            english = "You did it! You've solved all the riddles to get you this far, and now you've slain Akaltut! All that's left to do is to go reap your reward at the nearby rune shrine!",
            german = ""
        },
        gibberish = {
            english = "Whatever is written on this scroll, it doesn't look like much more than gibberish to you right now.",
            german = ""
        },
        locations = {
            {location = position(471, 765, 0),
            english = "Your journey next, takes you to a place where an exile takes rest, from her evil brethrens monotheistic pest.\n X X A",
            german = "",
            before = 1,
            after = 2},
            {location = position(751, 338, -9),
            english = "Next on the list, an isle of snow. When will you go, if not now?\n X X X X X X X L",
            german = "",
            before = 2,
            after = 3},
            {location = position(425, 65, 0),
            english = "In the fiery depths, where spiders guard. A place where many adventurers have been scarred. \n S",
            german = "",
            before = 3,
            after = 4},
            {location = position(528, 794, -6),
            english = "Back up we go, no time to waste. Better yet return, to where merchants make haste. \n X L",
            german = "",
            before = 4,
            after = 5},
            {location = position(673, 317, 0),
            english = "In the ruins of civilization, ruined by creatures of stone. Now swarmed with the dead, it lies entombed. \n X X X X A",
            german = "",
            before = 5,
            after = 6},
            {location = position(926, 415, -3),
            english = "Sleep you with pirates, and you will see. There's nowhere to hide, near Cadomyr's sea. \n X X X Y",
            german = "",
            before = 7,
            after = 8},
            {location = position(214, 478, -3),
            english = "Next with the thieves, I dare you to be. Near a land full of wonder, this time by the eastern sea. \n X X X X X K",
            german = "",
            before = 8,
            after = 9},
            {location = position(918, 592, -3),
            english = "Into the forests, in the home of a hermit, you will find me. \n X X X X X X X X X U",
            german = "",
            before = 10,
            after = 11},
            {location = position(820, 94, 0),
            english = "Your thirst for knowledge is like that of which a man lost in the desert will face. Oddly apt, as you would both find what you seek in the very same place. \n X X X X X X A X X X X",
            german = "",
            before = 12,
            after = 13},
            {location = position(386, 671, 0),
            english = "Give praise to the gods of old, and you will find. It can be rewarding, doing what you're told. \n X X X X X X X X T",
            german = "",
            before = 14,
            after = 15},
            {location = position(570, 127, 0),
            english = "Now for the final answer, you will have to combine. What you've learned so far, into one mind. \n X X X X X X X X X X T",
            german = "",
            before = 16,
            after = 17},
        }
    },
    lhorPuzzle = {
        english = "My coat is dark as the night, my home shines like the sun. When Nargun is playing tricks, I'll be there. What am I? Speak my name out loud, and knowledge shall be granted to you.",
        german = ""
    },
    lukPuzzle = {
        denounce = {
            english = "Will you denounce the fallen god in the name of knowledge?",
            german = "",
            yes = {
                english = "Denounce Moshran",
                german = ""
            },
            no = {
                english = "Praise Moshran",
                german = ""
            },
            denounced = {
                english = "You did well by denouncing that evil. Go reap your reward, if you haven't already.",
                german = ""
            },
            praised = {
                english = "You've already praised Moshran. It is too late to take back this offense now.",
                german = ""
            }
        },
        denounced = {
            english = "As you touch the orb, an ethereal feeling of good-will seems to reach out from the void, making it light up. Could it be the gods approving of your actions?",
            german = ""
        },
        praised = {
            english = "As you touch the orb, an ethereal entity radiating hostility seems to reach out from the void in an attempt to prevent the orb from lighting up. However, at the same moment, a separate ethereal entity reaches out from the nearby altar, overpowering the first entity and lighting up the sphere.",
            german = ""
        },
        denouncedInform = {
            english = "You denounce Moshran. You feel like the gods look more favourably upon you already.",
            german = ""
        },
        praisedInform = {
            english = "You praised Moshran. Oh you anarchist you, what have you done?",
            german = ""
        }
    },
    phercPuzzle = {
        english = "If knowledge you seek, blood you must spill. Come on; give it a try, it might just be an unexpected thrill.",
        german = ""
    },
    qwanPuzzle = {
        fail = {
            english = "The lever refuses to budge. It would seem you may need the aid of someone stronger if you want to proceed.",
            german = ""
        },
        success = {
            english = "Using all your strength, you barely manage to move the lever.",
            german = ""
        }

    },
    savPuzzle = {
        english = "I lost my darling pet Bunbun! She should be across this sea of lava! If you want my knowledge, help me find her and bring her safely here!",
        german = "",
        noSpider = {
            english = "As you activate the mechanism, you notice a small spider is forced out of its hole. Could this actually be Bunbun?",
            german = ""
        },
        spiderExists = {
            english = "Nothing happened. Bunbun must already be out here somewhere.",
            german = ""
        }
    },
    sihPuzzle = {
        english = "Recipe for holy water:\nTwo parts the mother's water, the purest kind.\nOne part water that heals with utmost efficiency.",
        german = "",
        lizardish = {
            english = "All you see are clawmarks that form various symbols. Maybe a lizardman could help you decipher it?",
            german = ""
        }
    },
    --item/books.lua
    grimoire = {
        name = {
            english = "Grimoire",
            german = "Grimoire"},
        description = {
            english = "A grimoire used by mages.",
            german = "Ein Grimoire das Magier verwenden."}
    }

}
M.qListDe = {"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"}
M.qListEn = {"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"}
return M
