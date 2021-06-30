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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(336) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(336, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Umgeben von gestapelten Fässern, sind die Zutaten für den nächsten Ansatz chaotisch über die Tische verteilt. Der verführerische Duft von Vergörenem dringt in den Gasthof ein, während durch fein gewebte Stoffe goldener Met rinnt, um die nächste Flasche zu füllen.","Surrounded by stacked barrels, ingredients chaotically scattered over tables await the next brew. The tantilising aroma of fermentation drifts into the inn, as golden mead strains through finely woven cloth to fill the next bottle.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Handwerk benötigt die Verwendung eines dafür vorgesehenen Handwerkzeugs mit einem speziellen statischen Werkzeug. Die statischen Werkzeuge können ganz einfach in den beiden Reichen gefunden werden, welche sich auf das entsprechende Handwerk spezialisiert haben. Jedes Handwerk hat ein Menü, in dem alle Produkte, welche du derzeit herstellen kannst, in verschiedenen Kategorien aufgeführt sind. Wenn du ein Produkt im Menü durch Anklicken markierst, siehst du ein Bild des Produkts und der zur Herstellung erforderlichen Zutaten sowie die Produktionszeit. Mit zunehmender handwerklicher Fertigkeit werden dem Menü komplexere Produkte hinzugefügt.",
            "Crafting depends on use of a dedicated hand tool with specialist static tools. Static tools are easiest found in the two realms specialising in the relevant craft. Each craft has a menu in which all the products you are currently able to make are listed under various categories. If you highlight a product in the menu by clicking on it you will see a picture of the product and the ingredients required to make the item, along with a production time. As your skill in a craft increases, more complex products will be added to the menu.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
