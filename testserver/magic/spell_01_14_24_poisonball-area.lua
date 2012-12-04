--[[
    Poisonball
    Rune 1 & 14 & 24
        KEL YEG DUN

    GFX-Spell

    SQL:    INSERT INTO spells VALUES (2^0+2^13+2^23,0,'m_01_14_24_poisonball-area.lua');
]]

-- including the main script for gfx spells
require("magic.base.gfxspell");
module("magic.spell_01_14_24_poisonball-area", package.seeall)
-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_01_14_24_poisonball-area.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =         55,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =        100,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "commotio"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "KEL YEG DUN",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 8            -- Maximum distance in tiles between the target of the spell and the caster
}

-- Grafik and Sound effects that appear when the spell is casted successfully
SpellEffects = {
    ["line"] = nil,
    [0] = {                 -- Radius 0 around the target location (so this IS exactly the target location)
        ["gfx"] = 8,        -- Grafic effect that is shown on the position the spell hitted
        ["sfx"] = 1         -- Sound effect that is placed in the position the spell hitted
    },
    [1] = {                 -- Radius 1 around the target locationation)
        ["gfx"] = 8,        -- Graphic effect on this radius
        ["sfx"] = 0         -- Sound effect on this radius
    }
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
        [Player.german ] = "#me beginnt mit einer mystischen Formel und an {PP}n Händen bilden sich Tropfen einer grünliche schimmernden Flüssigkeit.",
        [Player.english] = "#me starts with a mystical formula and on {PP} hands some drops of a greenish shimmering liquid appear."
    }
}

-- effects on the caster when he castes the spell, the effects are interpolated linear from minSkill to maxSkill
CasterEffects = {
    ["minSkill"] = {                -- effects that are caused in case the caster has to minimum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -15,   -- increase of the action points
        ["manapoints"]   = -7000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {                -- effects that are caused in case the caster has the maximum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -10,   -- increase of the action points
        ["manapoints"]   = -2500,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    }
}

-- effects that are caused at the target of the spell, handled in the same way as the CasterEffects
TargetEffects = {
    ["minSkill"] = {             -- effects that are caused in case the caster has the minium needed skill
        ["hitpoints"]    =   0,   -- increase of the hitpoints
        ["foodpoints"]   =   0,   -- increase of the foodlevel
        ["actionpoints"] =   0,   -- increase of the action points
        ["manapoints"]   =   0,   -- increase of the mana
        ["poison"]       = 700,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {             -- effects that are caused in case the caster has the maximum needed skill, however the needed Skill is higher then the the setted value due the magic resistance
        ["hitpoints"]    =    0,   -- increase of the hitpoints
        ["foodpoints"]   =    0,   -- increase of the foodlevel
        ["actionpoints"] =    0,   -- increase of the action points
        ["manapoints"]   =    0,   -- increase of the mana
        ["poison"]       = 1525,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    }
}

-- Racial bonis
magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end
