--[[
    Extinguish poison cloud area
    Rune 4 & 14 & 24
        YEG TAH DUN

    GFX-Spell

    SQL:    INSERT INTO spells VALUES (2^3+2^13+2^23,0,'m_04_14_24_extinguish-poison-area.lua');
]]

-- including the main script for gfx spells
require("magic.base.gfxspell");
module("magic.spell_04_14_24_extinguish-poison-area", package.seeall)
-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_04_14_24_extinguish-poison-area.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =         10,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =         80,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "commotio"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "YEG TAH DUN",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 8,          -- Maximum distance in tiles between the target of the spell and the caster
    ["FirstInLine"] = false  -- Perform a line of flight calculation and hit the first character on this line or the destination the caster pointed at
}

-- Grafik and Sound effects that appear when the spell is casted successfully
SpellEffects = {
    ["line"] = nil,
    ["justAtHit"] = true,   -- only show gfx and sfx if the spell hits anything
    [0] = {                 -- Radius 0 around the target location (so this IS exactly the target location)
        ["gfx"] = 7,        -- Grafic effect that is shown on the position the spell hitted
        ["sfx"] = 9,        -- Sound effect that is placed in the position the spell hitted
        ["removeItem"] = {  -- informations about the item(s) that shall be removed
            ["id"] = 372,            -- id of the item that should be created
            ["minSkill"] = {         -- values of the item at the minimal skill
                ["quality"] = -200,  -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 70      -- Chance that this Item is created
            },
            ["maxSkill"] = {         -- values of the item at the maximal skill
                ["quality"] = -1000, -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 130     -- Chance that this Item is created
            }
        }
    },   -- only show gfx and sfx if the spell hits anything
    [1] = {                 -- Radius 1 around the target location
        ["gfx"] = 7,        -- Grafic effect that is shown on radius 1
        ["sfx"] = 0,        -- Sound effect that is placed on radius 1
        ["removeItem"] = {  -- informations about the item(s) that shall be removed
            ["id"] = 372,            -- id of the item that should be created
            ["minSkill"] = {         -- values of the item at the minimal skill
                ["quality"] = -180,  -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 60      -- Chance that this Item is created
            },
            ["maxSkill"] = {         -- values of the item at the maximal skill
                ["quality"] =  -900, -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 120     -- Chance that this Item is created
            }
        }
    },   -- only show gfx and sfx if the spell hits anything
    [2] = {                 -- Radius 2 around the target location
        ["gfx"] = 7,        -- Grafic effect that is shown on radius 2
        ["sfx"] = 0,        -- Sound effect that is placed on radius 2
        ["removeItem"] = {  -- informations about the item(s) that shall be removed
            ["id"] = 372,            -- id of the item that should be created
            ["minSkill"] = {         -- values of the item at the minimal skill
                ["quality"] = -160,  -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 50      -- Chance that this Item is created
            },
            ["maxSkill"] = {         -- values of the item at the maximal skill
                ["quality"] =  -800, -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 110     -- Chance that this Item is created
            }
        }
    },   -- only show gfx and sfx if the spell hits anything
    [3] = {                 -- Radius 3 around the target location
        ["gfx"] = 7,        -- Grafic effect that is shown on radius 3
        ["sfx"] = 0,        -- Sound effect that is placed on radius 3
        ["removeItem"] = {  -- informations about the item(s) that shall be removed
            ["id"] = 372,            -- id of the item that should be created
            ["minSkill"] = {         -- values of the item at the minimal skill
                ["quality"] = -140,  -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 40      -- Chance that this Item is created
            },
            ["maxSkill"] = {         -- values of the item at the maximal skill
                ["quality"] =  -700, -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 100     -- Chance that this Item is created
            }
        }
    },   -- only show gfx and sfx if the spell hits anything
    [4] = {                 -- Radius 4 around the target location
        ["gfx"] = 7,        -- Grafic effect that is shown on radius 4
        ["sfx"] = 0,        -- Sound effect that is placed on radius 4
        ["removeItem"] = {  -- informations about the item(s) that shall be removed
            ["id"] = 372,            -- id of the item that should be created
            ["minSkill"] = {         -- values of the item at the minimal skill
                ["quality"] = -120,  -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 30      -- Chance that this Item is created
            },
            ["maxSkill"] = {         -- values of the item at the maximal skill
                ["quality"] =  -600, -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 90      -- Chance that this Item is created
            }
        }
    },   -- only show gfx and sfx if the spell hits anything
    [5] = {                 -- Radius 5 around the target location
        ["gfx"] = 7,        -- Grafic effect that is shown on radius 5
        ["sfx"] = 0,        -- Sound effect that is placed on radius 5
        ["removeItem"] = {  -- informations about the item(s) that shall be removed
            ["id"] = 372,            -- id of the item that should be created
            ["minSkill"] = {         -- values of the item at the minimal skill
                ["quality"] = -100,  -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 20      -- Chance that this Item is created
            },
            ["maxSkill"] = {         -- values of the item at the maximal skill
                ["quality"] =  -500, -- Item quality
                ["data"] = 0,        -- Item data
                ["wear"] = 0,        -- Item wear
                ["number"] = 0,      -- Item number
                ["chance"] = 80      -- Chance that this Item is created
            }
        }
    }
}

-- Time related effects of the spell
TimeEffects = {
    ["delay"] = 20,         -- Casting delay before the spell is actually casted in 1/10 seconds (while this time the Caster can be interrupted)
    ["gfx"] = {             -- The the graphic effect informations that are used while the casting delay
        ["id"] = 21,        -- The gfx id that is shown while the casting delay
        ["time"] = 10       -- The time in 1/10 seconds that has to pass before the gfx is played a second time
    },
    ["sfx"] = {             -- The sound effect informations that are used while the casting delay
        ["id"] = 0,         -- The id of the sound effect that played while the casting delay
        ["time"] = 0        -- The time in 1/10 seconds that has to pass before the sound effect is played a second time
    },
    ["msg"] = {             -- The messages that are shown before the time delay is started in german and english
        [Player.german ] = "#me beginnt mit einer mystischen Formel und um {PP} Füße beginnt Dreck und Staub vom Boden zu wirbeln.",
        [Player.english] = "#me starts with a mystical formula and around {PP} feet dirt and dust from the ground start to whirl."
    }
}

-- effects on the caster when he castes the spell, the effects are interpolated linear from minSkill to maxSkill
CasterEffects = {
    ["minSkill"] = {                -- effects that are caused in case the caster has to minimum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -20,   -- increase of the action points
        ["manapoints"]   = -3000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {               -- effects that are caused in case the caster has the maximum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -10,   -- increase of the action points
        ["manapoints"]   = -1300,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    }
}

-- Racial bonis
magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end
