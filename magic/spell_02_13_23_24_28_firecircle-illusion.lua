--[[
    Fireflame circle illusion
    Rune 2 & 13 & 23 & 24 & 28
        LHOR RA ANTH DUN SAV

    Item-Spell

    SQL:    INSERT INTO spells VALUES (2^1+2^12+2^22+2^23+2^27,0,'m_02_13_23_24_28_firecircle-illusion.lua');
]]

-- including the main script for item spells
require("magic.base.itemspell");
module("magic.spell_02_13_23_24_28_firecircle-illusion", package.seeall)

-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_02_13_23_24_28_firecircle-illusion.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =              15,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =              30,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "pervestigatio"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "LHOR RA ANTH DUN SAV",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 5,          -- Maximum distance in tiles between the target of the spell and the caster
    ["FirstInLine"] = false  -- Perform a line of flight calculation and hit the first character on this line or the destination the caster pointed at
}

-- Time related effects of the spell
TimeEffects = {
    ["delay"] = 30,         -- Casting delay before the spell is actually casted in 1/10 seconds (while this time the Caster can be interrupted)
    ["gfx"] = {             -- The the graphic effect informations that are used while the casting delay
        ["id"] = 21,        -- The gfx id that is shown while the casting delay
        ["time"] = 10       -- The time in 1/10 seconds that has to pass before the gfx is played a second time
    },
    ["sfx"] = {             -- The sound effect informations that are used while the casting delay
        ["id"] = 0,         -- The id of the sound effect that played while the casting delay
        ["time"] = 0        -- The time in 1/10 seconds that has to pass before the sound effect is played a second time
    },
    ["msg"] = {             -- The messages that are shown before the time delay is started in german and english
        [Player.german ] = "#me beginnt mit einer mystischen Formel und in {PP}n Händen beginnen Flammen zu züngeln.",
        [Player.english] = "#me starts with a mystical formula and in {PP} hands some small flames appear."
    }
}

-- effects on the caster when he castes the spell, the effects are interpolated linear from minSkill to maxSkill
CasterEffects = {
    ["minSkill"] = {                -- effects that are caused in case the caster has to minimum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -20,   -- increase of the action points
        ["manapoints"]   = -5000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {               -- effects that are caused in case the caster has the maximum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -10,   -- increase of the action points
        ["manapoints"]   =  -900,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    }
}

Circle = {
    ["gfx"] = 9,                -- gfx shown in case a item is created on this spot
    ["sfx"] = 7,                -- sfx played in case a item is created on this spot
    ["item"] = {                -- informations about the created item
        ["id"] = 359,           -- id of the item that should be created
        ["minSkill"] = {        -- values of the item at the minimal skill
            ["quality"] = 100,  -- Item quality
            ["data"] = 0,       -- Item data
            ["wear"] = 1,       -- Item wear
            ["number"] = 1,     -- Item number
            ["chance"] = 70     -- Chance that this Item is created
        },           -- id of the item that should be created
        ["maxSkill"] = {        -- values of the item at the maximal skill
            ["quality"] = 100,  -- Item quality
            ["data"] = 0,       -- Item data
            ["wear"] = 4,       -- Item wear
            ["number"] = 1,     -- Item number
            ["chance"] = 150    -- Chance that this Item is created
        }
    }
}

-- Racial bonis
magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values
magic.base.basics.SetRaceBoni( 33, 2.00, 10.00 ); -- dragon ( RaceID 33 - Offensive Boni: *2 - Defensive Value (against this spell): *10

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end
