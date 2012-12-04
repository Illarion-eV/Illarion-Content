--[[
    Teleport self
    Rune 1 & 9 & 15
        JUS TAUR KEL

    Teleport-Spell

    SQL:    INSERT INTO spells VALUES (2^0+2^8+2^14,0,'m_01_09_15_tp-self.lua');
]]

-- including the main script for teleport spells
require("magic.base.teleportspell");
module("magic.spell_01_09_15_tp-self", package.seeall)
-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_01_09_15_tp-self.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =        20,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =       100,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "desicio"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "JUS TAUR KEL",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 8         -- Maximum distance in tiles between the target of the spell and the caster
}

-- Time related effects of the spell
TimeEffects = {
    ["delay"] = 18,          -- Casting delay before the spell is actually casted in 1/10 seconds (while this time the Caster can be interrupted)
    ["gfx"] = {             -- The the graphic effect informations that are used while the casting delay
        ["id"] = 21,        -- The gfx id that is shown while the casting delay
        ["time"] = 10       -- The time in 1/10 seconds that has to pass before the gfx is played a second time
    },
    ["sfx"] = {             -- The sound effect informations that are used while the casting delay
        ["id"] = 0,         -- The id of the sound effect that played while the casting delay
        ["time"] = 0        -- The time in 1/10 seconds that has to pass before the sound effect is played a second time
    },
    ["msg"] = {             -- The messages that are shown before the time delay is started in german and english
        [Player.german ] = "#me beginnt mit einer mystischen Formel und {PP} Hände beginnen zu verschwimmen.",
        [Player.english] = "#me starts with a mystical formula and {PP} hands become indistinct."
    }
}

-- effects on the caster when he castes the spell, the effects are interpolated linear from minSkill to maxSkill
CasterEffects = {
    ["minSkill"] = {                -- effects that are caused in case the caster has to minimum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -20,   -- increase of the action points
        ["manapoints"]   = -1000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {               -- effects that are caused in case the caster has the maximum needed skill
        ["hitpoints"]    =    0,   -- increase of the hitpoints
        ["foodpoints"]   =    0,   -- increase of the foodlevel
        ["actionpoints"] =  -10,   -- increase of the action points
        ["manapoints"]   = -300,   -- increase of the mana
        ["poison"]       =    0,    -- increase of the poison value
        ["posoffset"]    =    0    -- change the position of the character by this value from the caster away
    }
}

-- All values related to the actuall teleport
Teleport = {
    ["Drift"] = {               -- value of the drift of the spell location
        ["minSkill"] = 5,       -- drift of the spell location at minimal skill (radius)
        ["maxSkill"] = -1       -- drift of the spell location at maximal skill (radius)
    },
    ["StartLocation"] = {
        ["gfx"] = 41,           -- gfx shown at the start location of the teleport
        ["sfx"] = 13            -- sound effect played at the start location of the teleport
    },
    ["TargetLocation"] = {
        ["gfx"] = 41,           -- gfx shown at the target location of the teleport
        ["sfx"] = 13            -- sound effect played at the target location of the teleport
    }
}

-- Racial bonis
magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end
