--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
local common require("base.common")
local base = require("monster.base.base")
local messages = require("base.messages")

--Random Messages
local msgs = messages.Messages()
msgs:addMessage("#me schließt die Augen und beginnt wie wahnsinnig zu lachen.", "#me closes the eyes and begins to laugh maniacally.")
msgs:addMessage("#mes Mund ist an den Mundwinkeln zu einem verdrehten Lächeln verzogen.", "#me's mouth curles up into a twisted smile.")
msgs:addMessage("#mes verengte Augen starren geradeaus.", "#me's narrow eyes stare straight ahead.")
msgs:addMessage("Brüder, Schwestern! Lasst uns Jagd auf die Schwachen machen.", "Brothers, sisters! Let us prey upon the weak.")
msgs:addMessage("Dein Unbehagen amüsiert mich.", "Your discomfort amuses me.")
msgs:addMessage("Deine Schmerzen sind meine Freude.", "Your pain my pleasure.")
msgs:addMessage("Deine Schreie werden wie Musik in meinen Ohren klingen.", "Your screams shall be music to my ears.")
msgs:addMessage("Der Blutgott soll heute nacht nicht hungrig bleiben.", "The Blood-God shall not hunger on this night.")
msgs:addMessage("Du hast jahrelang darauf gewartet vom Tod begrüßt zu werden... was machen da ein paar Stunden mehr?", "You have waited years for death to greet you... what is a few more hours?")
msgs:addMessage("Geduld, Sterblicher... Geduld. Du wirst früh genug mit der Gegenwart des Blutgottes gesegnet werden.", "Patience, mortal… patience. You shall be blessed with the Blood-God's company soon enough.")
msgs:addMessage("Ich finde dein Leiden... unterhaltsam.", "I find your suffering... enchanting.")
msgs:addMessage("Langsam und schmerzhaft, so wird dein Tod sein.", "Slow and painful, so your death shall be.")
msgs:addMessage("Moshran! Empfange diesen Sterblichen!", "Moshran! Receive this mortal!")
msgs:addMessage("Schreist du etwa? Das solltest du.", "Do you scream? You shall.")

local M = {}

function M.generateCallbacks()
    local t = base.generateCallbacks(msgs)

    function t.onSpawn(monster)
        -- Drows are just elves with with a very dark skin color and very bright hair
        do
            -- Very dark gray skin
            local darkValue = 0.23 -- Darkest value
            local brightValue = 0.55 -- Brightest value
            monster:setSkinColor(common.HSVtoRGB(0, 0, darkValue + math.random() * (brightValue - darkValue)))
        end
        do
            -- Very bright gray hair
            local darkValue = 0.80 -- Darkest value
            local brightValue = 0.90 -- Brightest value
            monster:setHairColor(common.HSVtoRGB(0, 0, darkValue + math.random() * (brightValue - darkValue)))
        end
    end

    return t
end

return M