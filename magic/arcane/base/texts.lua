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
        {stat = "intelligence", germanStat = "", adjective = {english = "intelligent.", german = ""}},
        {stat = "strength", germanStat = "", adjective = {english = "strong.", german = ""}},
        {stat = "constitution", germanStat = "", adjective = {english = "sturdy.", german = ""}},
        {stat = "dexterity", germanStat = "", adjective = {english = "dexterous.", german = ""}},
        {stat = "agility", germanStat = "", adjective = {english = "nimble.", german = ""}},
        {stat = "willpower", germanStat = "", adjective = {english = "strong-minded.", german = ""}},
        {stat = "perception", germanStat = "", adjective = {english = "perceptive.", german = ""}},
        {stat = "essence", germanStat = "", adjective = {english = "spiritual.", german = ""}}
        },
    statValuesText = {
        {value = 14, english = "The target is very ", german = ""},
        {value = 8, english = "The target is somewhat ", german = ""},
        {value = 0, english = "The target is not very ", german = ""}
        },
    --spirit/converInfoToDialogue.lua
    infoOptionsText = {
        {english = "Gender/race", german = "", identifier = "genderRace", rune = "Fhen"},
        {english = "Mana", german = "", identifier = "MP", rune = "Ira"},
        {english = "Stamina", german = "", identifier = "FP", rune = "Kah"},
        {english = "Location", german = "", identifier = "location", rune = "Mes"},
        {english = "Skill", german = "", identifier = "skill", rune = "Orl"},
        {english = "Magic Resistance", german = "", identifier = "MR", rune = "Pherc"},
        {english = "Attributes", german = "", identifier = "intelligence", rune = "Qwan"},
        {english = "Terrain type", german = "", identifier = "terrain", rune = "PEN"},
        {english = "Health", german = "", identifier = "HP", rune = "Sih"},
        {english = "Speed", german = "", identifier = "spd", rune = "Sul"},
        {english = "Item properties", german = "", identifier = "item", rune = "Anth"},
        {english = "Equipment", german = "", identifier = "equipment", rune = "Sav"}
        },
    chooseInfoTexts = {
        title = {english = "Target information", german = ""},
        text = {english = "Choose what information of the target you want to view.", german = ""}
        },
    types = {
        {english = "creature", german = ""},
        {english = "item", german = ""},
        {english = "position", german = ""},
        {english = "player", german = ""}
        },
    targetSelectionList = {
        title = {english = "Target Selection", german = ""},
        text1 = {english = "Select which target you want to send the information to.", german = ""},
        text2 = {english = "Select which target you want to view the information of.", german = ""},
        target = {english = "Target ", german = ""}
    },
    --spirit/terrain.lua
    tileDescriptions = {
        {id = 0, english = "Air", german = ""},
        {id = 1, english = "Rocky terrain", german = ""},
        {id = 2, english = "Rocky terrain", german = ""},
        {id = 3, english = "Sandy terrain", german = ""},
        {id = 4, english = "Muddy terrain", german = ""},
        {id = 5, english = "Lava", german = ""},
        {id = 6, english = "Water", german = ""},
        {id = 7, english = "Rocky terrain", german = ""},
        {id = 8, english = "Muddy terrain", german = ""},
        {id = 9, english = "Muddy terrain", german = ""},
        {id = 10, english = "Snowy terrain", german = ""},
        {id = 11, english = "Grassy terrain", german = ""},
        {id = 12, english = "Sandy terrain", german = ""},
        {id = 13, english = "Rocky terrain", german = ""},
        {id = 14, english = "Grassy terrain", german = ""},
        {id = 15, english = "Rocky terrain", german = ""},
        {id = 16, english = "Muddy terrain", german = ""},
        {id = 17, english = "Rocky terrain", german = ""},
        {id = 18, english = "Rocky terrain", german = ""},
        {id = 19, english = "Icy terrain", german = ""},
        {id = 20, english = "Icy terrain", german = ""},
        {id = 34, english = "Air", german = ""},
        {id = 40, english = "Wooden ground", german = ""},
        {id = 41, english = "Rocky terrain", german = ""},
        {id = 42, english = "Rocky terrain", german = ""},
        {id = 43, english = "Wooden ground", german = ""},
        {id = 45, english = "Carpet", german = ""},
        {id = 46, english = "Carpet", german = ""},
        {id = 47, english = "Carpet", german = ""},
        {id = 48, english = "Carpet", german = ""},
        {id = 49, english = "Carpet", german = ""},
        {id = 50, english = "Carpet", german = ""},
        {id = 51, english = "Carpet", german = ""},
        {id = 52, english = "Carpet", german = ""},
        {id = 53, english = "Carpet", german = ""},
        {id = 55, english = "Rocky terrain", german = ""},
        {id = 56, english = "Rocky terrain", german = ""},
        {id = 57, english = "Rocky terrain", german = ""},
        {id = 58, english = "Rocky terrain", german = ""},
        {id = 59, english = "Wooden ground", german = ""},
        {id = 60, english = "Layered bricks", german = ""},
        {id = 61, english = "Layered bricks", german = ""},
        {id = 62, english = "Wooden ground", german = ""},
        {id = 63, english = "Wooden ground", german = ""},
        {id = 64, english = "Wooden ground", german = ""},
        {id = 65, english = "Wooden ground", german = ""},
        {id = 66, english = "Rocky terrain", german = ""},
        {id = 67, english = "Carpet", german = ""},
        {id = 68, english = "Carpet", german = ""},
        {id = 69, english = "Carpet", german = ""},
        {id = 70, english = "Carpet", german = ""},
        {id = 71, english = "Carpet", german = ""},
        {id = 72, english = "Carpet", german = ""},
        {id = 73, english = "Carpet", german = ""},
        {id = 74, english = "Muddy terrain", german = ""},
        {id = 75, english = "Muddy terrain", german = ""}
        },
    tilePrefix = {
        english = "Terrain: ", german = ""},
    -- spirit/telepathy.lua
    telepathyTexts = {
        failure = {english = "You decided against responding to the telepathic connection.", german = ""},
        success = {english = "You hear the voice of your telepathic partner in your mind: ", german = ""},
        request = {english = "What do you want to tell your telepathic partner?", german = ""},
        established = {emglish = "You feel a telepathic connection establish between you and someone else.", german = ""}
        },
    -- createSpell.lua
    createSpellTexts = {
        BHONA = {english = "BHONA spells may only contain up to two runes.", german = ""},
        --Example texts for prefix/suffix: The rune Fhen has been added to the spell., The rune RA has been added as the primary rune of the spell.
        prefix = {english = "The rune ", german = ""},
        suffix = {english = " has been added to the spell.", german = ""},
        suffixPrimary = {english = " has been added as the primary rune of the spell.", german = ""},
        mana = {english = "Not enough mana.", german = ""},
        minor = {english = "You must first learn how to use any minor rune before you can add it to your spell."},
        allRunes = {english = "You do not know any more runes that can be added to the spell.", german = ""},
        --example text for slot: You name the spell in spell slot 7: Fire ball
        slot = {english = "You name the spell in spell slot ", german = ""},
        creation = {english = "Spell Creation", german = ""},
        selectRune = {english = "Select which rune you want to add to your spell.", german = ""},
        selectPrimary = {english = "Select a primary rune for your spell.", german = ""},
        nameSpell = {english = "Name the spell", german = ""},
        pickOption = {english = "Pick an option.", german = ""},
        addRune = {english = "Add rune", german = ""},
        finish = {english = "Finish spell", german = ""},
        unfinished = {english = "Unfinished", german = ""},
        quillAndBook = {english = "You must hold a magic book and quill in your hands.", german = ""},
        noPrimary = {english = "You must first learn how to use a primary rune before you can create a spell.", german = ""},
        create = {english = "Create a spell", german = ""},
        overwrite = {english = "Yes, overwrite it.", german = ""},
        dontOverwrite = {english = "No, select another slot.", german = ""},
        quill = {english = "You need a quill to do any work at a desk.", german = ""},
        createBook = {english = "Portal Book Creation", german = ""},
        createGrimoire = {english = "Enchant a book into a Grimoire", german = ""},
        bookNeeded = {english = "You need to hold a blank book in your hand in order to enchant it into a Grimoire.", german = ""},
        enchantSuccess = {english = "You have successfully enchanted the book into a Grimoire.", german = ""}
        },
    -- targeting.lua
    levText = {
        english = "You realise it's been too long since you last cast this spell with Hept, as you feel the mana draining from your body finds no target.",
        german = ""
        },
    -- reduceMana.lua
    manaReduction = {
        english = "You can feel some of your mana being drained from out of your body.",
        german = ""
    },
    -- reduceFood.lua
    foodReduction = {
        english = "You can feel some of your stamina being drained out of your body.",
        german = ""
    },
    -- plantRoot.lua, traps.lua
    plantRootTexts = {
        name = {english = "Entangling Plant", german = ""},
        description = {english = "Upon closer inspection, you may notice the leaves of the plant having a magical looking glow to them.", german = ""}
    },
    earthTrapTexts = {
        name = {english = "Earth Cloud", german = ""},
        description = {english = "A misty green cloud with an earthy scent to it.", german = ""},
        cloud = {english = "Stepping into the cloud of earth magic, the gaseous substance flocks towards you in an attempt to enter your body.", german = ""},
        plant = {english = "As you step onto the plant, it releases a gaseous substance that seems to flock towards you in an attempt to enter your body.", german = ""},
        illusion = {english = "As you step into the cloud of earth magic, nothing happens to you. Was it just an illusion?", german = ""}
    },
    -- movement.lua
    movementTexts = {
        flying = {english = "A blast of air magic sends you flying.", german = ""},
        walk = {english = "A strong wind forces you to step aside.", german = ""},
        turn = {english = "A sudden burst of wind turns you around.", german = ""}
    },
    -- spirit/creatures.lua
    genderTexts = {
        {english = "male", german = "", value = 0},
        {english = "female", german = "", value = 1},
        {english = "Gender: ", german = "", value = 2}
    },

    racePrefixText = {
        english = "Race: ",
        german = ""
    },

    raceList = {
        {name = {english = "human", german = ""}, id = 0},
        {name = {english = "dwarf", german = ""}, id = 1},
        {name = {english = "halfling", german = ""}, id = 2},
        {name = {english = "elf", german = ""}, id = 3},
        {name = {english = "orc", german = ""}, id = 4},
        {name = {english = "lizardman", german = ""}, id = 5},
        {name = {english = "forest troll", german = ""},  id = 9},
        {name = {english = "mummy", german = ""},  id = 10},
        {name = {english = "skeleton", german = ""},  id = 11},
        {name = {english = "beholder", german = ""},  id = 12},
        {name = {english = "sheep", german = ""},  id = 18},
        {name = {english = "spider", german = ""},  id = 19},
        {name = {english = "pig", german = ""},  id = 24},
        {name = {english = "wasp", german = ""},  id = 27},
        {name = {english = "stone golem", german = ""},  id = 30},
        {name = {english = "cow", german = ""},  id = 37},
        {name = {english = "wolf", german = ""},  id =39},
        {name = {english = "bear", german = ""},  id = 51},
        {name = {english = "raptor", german = ""},  id = 52},
        {name = {english = "zombie", german = ""},  id = 53},
        {name = {english = "hellhound", german = ""},  id = 54},
        {name = {english = "imp", german = ""},  id = 55},
        {name = {english = "iron golem", german = ""},  id = 56},
        {name = {english = "ratman", german = ""},  id = 57},
        {name = {english = "dog", german = ""},  id = 58},
        {name = {english = "beetle", german = ""},  id = 59},
        {name = {english = "fox", german = ""},  id = 60},
        {name = {english = "slime", german = ""},  id = 61},
        {name = {english = "chicken", german = ""},  id = 62},
        {name = {english = "bone dragon", german = ""},  id = 63},
        {name = {english = "rat", german = ""},  id = 111},
        {name = {english = "dragon", german = ""},  id = 112},
        {name = {english = "rabbit", german = ""},  id = 113},
        {name = {english = "demon", german = ""},  id = 114},
        {name = {english = "fairy", german = ""},  id = 115},
        {name = {english = "deer", german = ""},  id = 116},
        {name = {english = "ettin", german = ""},  id = 117}
    },
    -- spirit/equipment.lua
    equipmentPrefix = {
        quality = {english = "Equipment quality: ", german = ""},
        durability = {english = "Equipment state: ", german = ""}
    },
    equipmentNames = {
        {english = "Backpack", german = "", slot = 0},
        {english = "Head", german = "", slot = 1},
        {english = "Neck", german = "", slot = 2},
        {english = "Torso", german = "", slot = 3},
        {english = "Hands", german = "", slot = 4},
        {english = "In Left Hand", german = "", slot = 5},
        {english = "In Right Hand", german = "", slot = 6},
        {english = "Left ring finger", german = "", slot = 7},
        {english = "Right ring finger", german = "", slot = 8},
        {english = "Legs", german = "", slot = 9},
        {english = "Feet", german = "", slot = 10},
        {english = "Back", german = "", slot = 11},
    },
    --spirit/speed.lua
    speedTexts = {
        normal = {english = "Target is not under the effect of any hastening or slowing spells.", german = ""},
        high = {english = "Target is under the effect of a hastening spell.", german = ""},
        low =  {english = "Target is under the effect of a slowing spell.", german = ""}
    },
    --lifesteal.lua
    lifestealTexts = {
        health = {english = "You siphon some health from your target.", german = ""},
        mana = {english = "You siphon some mana from your target.", german = ""},
        overTime = {english = "You siphon health from your target, recovering your own over time.", german = ""}
    },
    --magicDoT.lua
    burn = {english = "You've been inflicted with a magical burn, causing you to suffer fire damage over time.", german = ""},
    poison = {english = "You've been inflicted with a magical poison, causing you to suffer poisonous damage over time.", german = ""},
    --spirit/health.lua
    healthTexts = {
        {english = "Target is perfectly healthy.", german = "", health = 10000},
        {english = "Target is slightly wounded.", german = "", health = 8000},
        {english = "Target is wounded.", german = "", health = 5000},
        {english = "Target is heavily wounded.", german = "", health = 2000},
        {english = "Target is near death.", german = "", health = 1},
        {english = "Target is dead.", german = "", health = 0},
        },
    --spirit/items.lua
    itemTexts = {
        durability = {english = "Durability: ", german = ""},
        quality = {english = "Quality: ", german = ""},
        weight = {english = "Weight: ", german = ""},
        name = {english = "Item name: ", german = ""},
        description = {english = "Details: ", german = ""},
        unit = {singular = {english = "Blackberry", german = ""}, plural = {english = "Blackberries", german = ""}}
        },
    --spirit/location.lua
    directionsList = {
        {direction = {english = "east", german = ""}},
        {direction = {english = "west", german = ""}},
        {direction = {english = "north", german = ""}},
        {direction = {english = "south", german = ""}},
        {direction = {english = "southeast", german = ""}},
        {direction = {english = "northeast", german = ""}},
        {direction = {english = "southwest", german = ""}},
        {direction = {english = "northwest", german = ""}}
        },
    locationTexts = {
        {english = "Target's position is ", german = ""},
        {english = " tiles to the ", german = ""},
        },
    --spirit/magicResistance.lua
    MRtexts = {
        low = {english = "The target has low magic resistance.", german = ""},
        average = {english = "The target has average magic resistance.", german = ""},
        high = {english = "The target has high magic resistance.", german = ""},
       },
    --spirit/skill.lua
    skillTexts= {
        {value = 3200, english = "Target is highly experienced in many professions.", german = ""},
        {value = 2200, english = "Target is very experienced in many professions", german = ""},
        {value = 700, english = "Target is experienced in many professions.", german = ""},
        {value = 450, english = "Target is experienced in some professions.", german = ""},
        {value = 300, english = "Target has some experience in multiple professions.", german = ""},
        {value = 200, english = "Target has at least some experience in a profession.", german = ""},
        {value = 0, english = "Target has little to no experience in a profession.", german = ""}
       },
    --spirit/mana.lua
    manaTexts = {
        {english = "Target is brimming with mana.", german = "", mana = 10000},
        {english = "Target is nearly satiated with mana.", german = "", mana = 8000},
        {english = "Target has moderate amount of mana.", german = "", mana = 5000},
        {english = "Target is running low on mana.", german = "", mana = 2000},
        {english = "Target is almost out of mana.", german = "", mana = 1},
        {english = "Target only has enough mana to survive.", german = "", mana = 0},
        },
    --spirit/stamina.lua
    staminaTexts = {
        {english = "Target is brimming with energy.", german = "", food = 10000},
        {english = "Target is almost full of energy.", german = "", food = 8000},
        {english = "Target is starting to get tired.", german = "", food = 5000},
        {english = "Target is tired.", german = "", food = 2000},
        {english = "Target is nearly exhausted.", german = "", food = 1},
        {english = "Target is exhausted and starving.", german = "", food = 0},
        },
    --spirit/fakeInfo.lua
    fakeEquipmentText = {
        durability = {name = {english = "Set Durability", german = ""}, text = {english = "Choose what durability the equipment should be portrayed as having."}},
        quality = {name = {english = "Set Quality", german = ""}, text = {english = "Choose what quality the equipment should be portrayed as having."}}
        },
    --castSpell.lua
    castSpellTexts = {
        range = {english = "The target is too far away.", german = ""},
        secret = {english = "You secretly begin casting a wind spell.", german = ""},
        mana = {english = "You do not have enough mana.", german = ""},
        sight = {english = "Line of sight is not clear.", german = ""},
        stats = {english = "As you attempt to cast the spell, you feel an abrupt headache prevent you from proceeding. Did something happen to your ability to cast magic?", german = ""}
    },
    --magicBook.lua
    magicBookTexts = {
        empty = {english = "The spell list is empty. Perhaps you could fill it in at a desk?", german = ""},
        inane = {english = "All you can see are the inane scribbles made by someone else. They make no sense to you!", german = ""},
        --primed example text: "Wand primed for the spell: Fireball."
        primed = {english = "Wand primed for the spell: ", german = ""},
        selection = {english = "Spell Selection", german = ""},
        select = {english = "Select which spell you want to cast.", german = ""},
        incomplete = {english = "The spellbook has no complete spells in it for you to cast.", german = ""},
        nonsense = {english = "All you can see are nonsensical scribbles. Wait, did that line just move? This may be beyond your ability to understand.", german = ""},
        glyphWand = {english = "Wand primed for wand magic & glyph forging.", german = ""},
        priming = {english = "Wand priming", german = ""},
        type = {english = "Select what type of magic you want your wand primed to.", german = ""},
        spells = {english = "Spells", german = ""},
        wandGlyph = {english = "Wand Magic & Glyph Forging", german = ""},
        spatial = {english = "Spatial Magic", german = ""},
        spatialAttune = {english = "Wand attuned to spatial magic", german = ""},
        portalBookNeeded = {english = "You must hold the portal book you wish to evaluate in your hand.", german = ""}

    },
    --teaching.lua
    teachingTexts = {
        knows = {english = "Target already knows that rune.", german = ""},
        level = {english = "Target is not skilled enough at magic to learn this rune yet.", german = ""},
        studentCooldown = {english = "Not enough time has passed yet since the last time the target was taught how to use a magic rune.", german = ""},
        teacherCooldown = {english = "You've been teaching too many people runes recently.", german = ""},
        stats = {english = "The target does not have the mental faculties to learn this rune.", german = ""},
        mage = {english = "The target is not attuned to the ways of magic.", german = ""},
        learned = {english = "You have learned how to use the rune ", german = ""}, --followed by the name of the rune
        taught = {english = "You have taught the target how to use the rune ", german = ""}, --followed by the name of the rune
        mana = {english = "Not enough mana.", german = ""},
        target = {english = "You need a target.", german = ""},
        player = {english = "Target must be a player.", german = ""}
    },
    --craft/final/portals.lua
    portalBookTexts = {
        craft = {english = "Portal  Book Creation", german = ""},
        category = {english = "Portal Books", german = ""},
        book = {english = "Portal book: ", german = ""},
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
            {value = 600, english = " very far ", german = ""},
            {value = 400, english = " far ", german = ""},
            {value = 100, english = " somewhere ", german = ""},
            {value = 50, english = " close ", german = ""},
            {value = 0, english = " very close ", german = ""},
        },
        binderTexts = {
            english = "to the ",
            german = ""
        },
        alreadyAttuned = {
            english  = "You've already attuned your spatial magic to this location.",
            german = ""
        },
        doneAttuning  = {
            english = "You've attuned to the crossing mana lines in the area. You will now be able to remember the spatial coordinates to teleport, cast portals and even write portal books that lead to this area, should your expertise in spatial magic allow.",
            german = ""
        },
        lackingSkill = {
            english = "You need to attain a higher level of expertise in spatial magic to remember the spatial coordinates for this location.",
            german = ""
        },
        noNearby = {
            english = "There are no crossing mana lines nearby for you to attune your spatial magic to. The nearest one is ",
            german = ""
        },
        red = {
            english = "Portal colour set to red",
            german = ""
        },
        blue = {
            english = "Portal colour set to blue",
            german = ""
        },
        name = {
            english = "Spatial Magic",
            german = ""
        },
        selectColour = {
            english = "Select which colour your portals should have",
            german = ""
        },
        colours = {
            red = { english = "Red", german = ""},
            blue = { english = "Blue", german = ""}
        },
        incantation = {
            portal = "Locus Ianua", -- latin for "space door"
            teleport = "Locus Itinerantur" --latin for "space travel"
        },
        teleportation = {
            english = "Teleportation",
            german = ""
        },
        destination = {
            english = "Select your destination",
            german = ""
        },
        castSelect  = {
            english = "What kind of spatial magic do you want to cast?",
            german = ""
        },
        attuneTo = {
            english = "Attune to location",
            german = ""
        },
        teleport = {
            english = "Teleport",
            german = ""
        },
        portal = {
            english = "Create Portal",
            german = ""
        },
        portalColour = {
            english = "Portal colour",
            german = ""
        },
        interruptedCast = {
            english = "Your casting of spatial magic was interrupted.",
            german = ""
        },
        interruptedBook = {
            english = "Your reading of the portal books incantation was interrupted.",
            german = ""
        },
        cantFindMore = {
            english = "You don't detect any more crossing mana lines to attune to. Perhaps you've found them all?",
            german = ""
        },
        differentElevation = {
            english = "You can feel that there are crossed mana lines nearby that you can attune your spatial magic to, however not here. Perhaps you'd had better luck searching at a different elevation?",
            german = ""
        },
        vanish = {
            english = "#me finishes the incantation, vanishing in a flash of bright magical light.",
            german = ""
        },
        appear = {
            english = "#me appears in a flash of bright magical light.",
            german = ""
        },
        badTarget  = {
            english = "Something in the area disrupts your casting in the final moment. Perhaps this isn't a good spot for spatial magic?",
            german = ""
        },
        showBookQuality = {
            english = "Portal Book Evaluation",
            german = ""
        },
        bookQuality = {
            english = "Portal book quality:\n",
            german = ""
        },
        portalBookChant = {
            english = "#me begins chanting the incantation written in a portal book.",
            german = ""
        }
    },
    --item/wands.lua
    wounded = { english = "Your wounds made it hard for you to concentrate, causing you to make a mistake in your casting.", german = ""},
    --item/fountain.lua
    forgetfulFountain = {
        name = { english = "Fountain of Forgetfulness", german = ""},
        description = { english = "A mysterious fountain covered in vapour. As you near it, you feel foggy minded; Did you just forget something important?", german = ""}
    },
    fountainDialogue = {
        yes = { english = "Yes", german = "Ja"},
        no = { english = "No", german = "Nein"},
        certain = { english = "Are you certain you wish to forget all your existing magical knowledge? This can not be undone once it has been done", german = ""},
        reallyCertain = { english = "Are you really sure?", german = ""},
        finalVerification = { english = "Then your magical knowledge will be forgotten... right?", german = ""},
        removed = { english = "As you drink from the fountain your eyes grow dazed and your head feels foggy. Why does it suddenly feel like your memory is full of blank spots? What are you doing here? Why is the sky blue? You don't know.", german = ""},
        kept = { english = "You wisely decided to keep your magical knowledge. What kind of fool would give up such precious wisdom, anyways?", german = ""}
    },
    --runeHintsBook.lua and magicSphere.lua
    runeHintsBookTexts = {
        CUN =  {rune = "CUN", hint = {english = "Near the ruins of a mother praised lies the secret of water.", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        JUS = {rune = "JUS", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        PEN = {rune = "PEN", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        RA = {rune = "RA", hint = {english = "A lone man betwixt the desert dry and forest lush guards the secret of the flame.", german = ""}, name = { english = "Fiery Mysterious Sphere", german = ""}, description = { english = "A mysterious glass sphere that appears to be full of flickering flames. It doesn't appear to give off any heat, though.", german = ""}, location = position(472,765,0)},
        SOLH = {rune = "SOLH", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        BHONA = {rune = "BHONA", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Anth = {rune = "Anth", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Dun = {rune = "Dun", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Fhan = {rune = "Fhan", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Fhen = {rune = "Fhen", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Hept = {rune = "Hept", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Ira = {rune = "Ira", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Kah = {rune = "Kah", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Kel = {rune = "Kel", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Lev = {rune = "Lev", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Lhor = {rune = "Lhor", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Luk = {rune = "Luk", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Mes = {rune = "Mes", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Orl = {rune = "Orl", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Pherc = {rune = "Pherc", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Qwan = {rune = "Qwan", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Sav = {rune = "Sav", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Sih = {rune = "Sih", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Sul = {rune = "Sul", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Tah = {rune = "Tah", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Taur = {rune = "Taur", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Ura = {rune = "Ura", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Yeg = {rune = "Yeg", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        Pera = {rune = "Pera", hint = {english = "", german = ""}, name = { english = "", german = ""}, description = { english = "", german = ""}, location = position(0,0,0)},
        unlitSphere = {english = "Empty glass sphere", german = ""},
        knowAll = {english = "There does not appear to be any knowledge in this book that you do not already know.", german = ""},
        requirementNotMet = {english = "While there's knowledge in this book that you are not knowledgable of, it appears to be beyond your capability to understand right now.", german = ""},
        bookName = {english = "Mysterious Book", german = ""},
        bookDescription = {english = "An old, faded looking book full of scribbles only some may understand.", german = ""},
        selectRune = {english = "Select the name of the rune you wish to locate.", german = ""},
        unsolved = {english = "The sphere has no reaction to your touch. Perhaps there is something in the area that can change this?", german = ""},
        activated = {english = "With a sudden glow the sphere lights up, revealing to you the sights within.", german = ""},
        learned = {english = "You feel a sudden surge of information enter your mind, it appears you just learned how to use the rune ", german = ""},
        cooldown = {english = "Not enough time has passed since you last learned a rune. You feel a headache just thinking about learning a new one.", german = ""},
        notMetCriteria = {english = "As you touch the sphere, you get the feeling that you are not well versed enough or perhaps even talented enough at magic to learn the rune.", german = ""},
        notMage = { english = "As you touch the sphere, it has no reaction other than returning to its dim state.", german = ""},
        alreadyKnows = { english = "While the magical information enters your mind, you discover nothing new. You already know how to use this rune.", german = ""}
    },
    --item/desk.lua
    magicDesk = {name = {english = "Magical Desk", german = ""}, description = {english = "A desk where mages can create spells, craft portal books and enchant grimoires", german = ""}}
}
M.qListDe = {"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"}
M.qListEn = {"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"}
return M
