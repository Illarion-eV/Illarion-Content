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

local common = require("base.common")

local M = {}

function M.MoveToField(Character)
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(341) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(341, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Schwer beladene Karren werden vom Hafen her gezogen aber auch hingebracht, und ganz lautstark drängen sich die Händler an den Marktsänden um Angebote feil zu bieten und um Preise zu Feilschen. Das ein oder andere Geschäft wird aber auch fern von den Blick der vielen im Abseits geschlossen, unauffällig und nur leise geflüstert.","Heavily laden carts are hauled back and forth from the harbour as raucous merchants bustle around market stalls, shouting out offers and haggling over prices, oblivious to other negotiations being concluded inconspicuously through hushed whispers.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Auf dem Markt bieten sich an den Ständen zwischen Hafen und Taverne reichlich Möglichkeiten zum Handel. Neben Angeboten für den täglichen Bedarf findest du hier aber auch verschiedene Güter und Dienstleistungen, die in den Reichen sonst nicht so einfach verfügbar sind.\n\nDer Zugriff auf die Menüs zum Handel erfolgt durch Ansprechen des jeweilgen NPC unter Nutzung der Schlüsselworte 'Handel', 'Kaufen' oder 'Verkaufen'. Solche Schlüsselwörter sollten in Sätzen verwendet werden, die der Rolle deines Charakters entsprechen. Durch Doppel-Klick auf einen NPC kannst du auch Basis-Optionen für ein Gespräch nutzen, die für eine angemessene Charakterdarstellung aber nur sehr begrenzt sind.\n\nGegenstände können zu einem Zehntel ihres Wertes in dem Reich mit Primären Handwerk verkauft werden, was durch die Goldmünze im Handelsmenü angezeigt wird. Nur zu einem Zwanzigstel ihres Wertes lassen sie sich im Reich mit im sekundärem Handwerk verkaufen, was durch die Silbermünze im Handelsmenü angezeigt wird. Wenn gleich du hier nicht die besten Preise für den Verkauf von Waren an NPC-Händler erhalten wirst, findest du möglicherweise andere Möglichkeiten mit Spielern zu Handeln, die einen weitaus höheren Preis bieten.",
            "The market offers bountiful trading opportunities with stalls extending from the harbour to the tavern forecourt. Whilst some basic provisions can acquired, you will also find other goods and services on offer that are less readily available in the realms. \n\nRelevant trade menus can be accessed by speaking to an NPC and using a keyword such as 'trade', 'buy', or 'sell'. Such keywords should be used in a sentence in a manner appropriate for your character when speak to a trader to enhance immersion. You can also double click on any NPC to activate basic talk options but remember this will limit portrayal of characterisation.\n\nItems can be sold at a tenth of their value in the primary crafting realm, indicated by the gold coin in the trading menu. They can only be sold at a twentieth of their value in the secondary crafting realm, indicated by the silver coin in the trading menu. Although you will not get the best prices for selling goods to NPC traders here, you may find other trading opportunities with players that offer far greater value.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
