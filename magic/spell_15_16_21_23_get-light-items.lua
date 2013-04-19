--[[
    Get heavy items
    Rune 15 & 16 & 21 & 23
        JUS ANTH FHEN QWAN

    Get-Item-Spell

    SQL:    INSERT INTO spells VALUES (2^14+2^15+2^20+2^22,0,'m_15_16_21_23_get-light-items.lua');
]]

-- including the main script for get-item spells
require("magic.base.itemmovespell");
module("magic.spell_15_16_21_23_get-light-items", package.seeall)
-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_15_16_21_23_get-light-items.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =         20,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =         80,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "transformo"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "JUS ANTH FHEN QWAN",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 8,          -- Maximum distance in tiles between the target of the spell and the caster
    ["FirstInLine"] = true  -- Perform a line of flight calculation and hit the first character on this line or the destination the caster pointed at
}

-- Grafik and Sound effects that appear when the spell is casted successfully
SpellEffects = {
    ["gfx"] = 7,        -- Grafic effect that is shown on the position the spell hitted
    ["sfx"] = 13         -- Sound effect that is placed in the position the spell hitted
}

-- Time related effects of the spell
TimeEffects = {
    ["delay"] = 20,          -- Casting delay before the spell is actually casted in 1/10 seconds (while this time the Caster can be interrupted)
    ["gfx"] = {             -- The the graphic effect informations that are used while the casting delay
        ["id"] = 21,        -- The gfx id that is shown while the casting delay
        ["time"] = 10       -- The time in 1/10 seconds that has to pass before the gfx is played a second time
    },
    ["sfx"] = {             -- The sound effect informations that are used while the casting delay
        ["id"] = 0,         -- The id of the sound effect that played while the casting delay
        ["time"] = 0        -- The time in 1/10 seconds that has to pass before the sound effect is played a second time
    },
    ["msg"] = {             -- The messages that are shown before the time delay is started in german and english
        [Player.german ] = "#me beginnt mit einer mystischen Formel.",
        [Player.english] = "#me starts with a mystical formula."
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
        ["manapoints"]   =  -700,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    }
}

Weight = {
    ["minSkill"] = 120,      -- weight of the item you can move at minimal skill
    ["maxSkill"] = 29999    -- weight of the item you can move at maximal skill
}

-- Racial bonis
magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end
