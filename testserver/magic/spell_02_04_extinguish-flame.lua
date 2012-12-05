--[[
    Extinguish fireflame
    Rune 2 & 4
        RA TAH

    GFX-Spell

    SQL:    INSERT INTO spells VALUES (2^1+2^3,0,'m_02_04_extinguish-flame.lua');
]]

-- including the main script for gfx spells
require("magic.base.gfxspell");
module("magic.spell_02_04_extinguish-flame", package.seeall)
-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_02_04_extinguish-flame.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =          0,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =         80,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "commotio"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "RA TAH",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 8,          -- Maximum distance in tiles between the target of the spell and the caster
    ["FirstInLine"] = false  -- Perform a line of flight calculation and hit the first character on this line or the destination the caster pointed at
}

-- Grafik and Sound effects that appear when the spell is casted successfully
SpellEffects = {
    ["line"] = nil,
    ["justAtHit"] = true,   -- only show gfx and sfx if the spell hits anything
    [0] = {                 -- Radius 0 around the target location (so this IS exactly the target location)
        ["gfx"] = 4,        -- Grafic effect that is shown on the position the spell hitted
        ["sfx"] = 9,        -- Sound effect that is placed in the position the spell hitted
        ["removeItem"] = {  -- informations about the item(s) that shall be removed
            ["id"] = 359,            -- id of the item that should be created
            ["minSkill"] = {         -- values of the item at the minimal skill
                ["quality"] = -200,  -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 50      -- Chance that this Item is created
            },
            ["maxSkill"] = {         -- values of the item at the maximal skill
                ["quality"] = -1000, -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 100     -- Chance that this Item is created
            }
        }
    }
}

-- Time related effects of the spell
TimeEffects = {
    ["delay"] = 15,          -- Casting delay before the spell is actually casted in 1/10 seconds (while this time the Caster can be interrupted)
    ["gfx"] = {             -- The the graphic effect informations that are used while the casting delay
        ["id"] = 21,        -- The gfx id that is shown while the casting delay
        ["time"] = 10       -- The time in 1/10 seconds that has to pass before the gfx is played a second time
    },
    ["sfx"] = {             -- The sound effect informations that are used while the casting delay
        ["id"] = 0,         -- The id of the sound effect that played while the casting delay
        ["time"] = 0        -- The time in 1/10 seconds that has to pass before the sound effect is played a second time
    },
    ["msg"] = {             -- The messages that are shown before the time delay is started in german and english
        [Player.german ] = "#me beginnt mit einer mystischen Formel und an {PP}n Händen bilden sich glitzernde Eiskristalle.",
        [Player.english] = "#me starts with a mystical formula and on {PP} hands some sparkling ice crystals appear."
    }
}

-- effects on the caster when he castes the spell, the effects are interpolated linear from minSkill to maxSkill
CasterEffects = {
    ["minSkill"] = {                -- effects that are caused in case the caster has to minimum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -20,   -- increase of the action points
        ["manapoints"]   = -2000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {               -- effects that are caused in case the caster has the maximum needed skill
        ["hitpoints"]    =    0,   -- increase of the hitpoints
        ["foodpoints"]   =    0,   -- increase of the foodlevel
        ["actionpoints"] =  -10,   -- increase of the action points
        ["manapoints"]   = -900,   -- increase of the mana
        ["poison"]       =    0,    -- increase of the poison value
        ["posoffset"]    =    0    -- change the position of the character by this value from the caster away
    }
}

-- Racial bonis
magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end
