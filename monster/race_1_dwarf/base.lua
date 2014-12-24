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
local base = require("monster.base.base")
local messages = require("base.messages")

--Random Messages
local msgs = messages.Messages()
msgs:addMessage("#me brummt lautstark.", "#me hums clamorously.")
msgs:addMessage("#me grummelt wütend.", "#me grumbles furiously.")
msgs:addMessage("#me schnauft angestrengt.", "#me breathes with some difficulty.")
msgs:addMessage("#me schwingt seine mächtige Axt.", "#me swings his mighty axe.")
msgs:addMessage("#me's Bart erzittert bei jedem Schlag.", "#me's beard shakes with every hit.")
msgs:addMessage("Arrr!?", "Arrr!?")
msgs:addMessage("Arrr, ick brauch' mehr Bier!", "Arrr, I need more beer!")
msgs:addMessage("Aye, dich stutz ick auf meine Größe!", "Aye, I'll trim yer ta my size")
msgs:addMessage("Beim Barte Irmoroms!", "By Irmorom's Beard!")
msgs:addMessage("Dein Kopf un' meine Axt, harr!", "Yer head an' my axe, harr!")
msgs:addMessage("Du kämpfst wie 'ne Schweinenase, aye!", "Ye're fightin' like a piggynose, aye!")
msgs:addMessage("Friss mein Axtblatt, Drecksack!", "Taste my axe blade, scumbag!")
msgs:addMessage("Meine Axt wird dich fäll'n wie 'n Baum!", "My axe will cut ye down like a tree!")
msgs:addMessage("#me wirft einen Krug von sich und wischt den letzten Bierschaum aus seinem Bart, ehe er drohend lallt 'Bei Irmorom, jetzt jibts Saures!'", "#me tosses a beer mug to the ground and wipes off foam from his beard before he babbles: 'By Irmorom! You have something coming!'.")
msgs:addMessage("Irmorom, schärfe meine Axt, wuchte meinen Hammer und kräftige meinen Arm, ich ziehe aus um den Feind niederzuwerfen!", "Irmorom, sharpen my axe, balance my hammer and strengthen my arms, for I set out to smite this fiend.")
msgs:addMessage("#me schnauft und stöhnt unter der Last seiner Rüstung, setzt aber störrisch zum Angriff an.", "#me groans under the weight of his armour, but charges stubbornly.")
msgs:addMessage("#me reckt eine Faust gen Himmel und brüllt ohrenbetäubend seine ganze aufgestaute Rage heraus, ehe er seine Waffe schwingt", "#me raises his fist as he yells loudly, swinging his weapon.")
msgs:addMessage("Ha, nur ein Mann vermochte es bisher, mich zu besiegen und das war beim Armdrücken, du wirst heulen, wenn ich mit dir fertig bin!", "Ha! Only one man could defeat me ever and that was in armwrestling. You'll see when I'm done with you!")
msgs:addMessage("Merke dir meine Worte, es werden die letzten sein, die du zu hören bekommst!", "Remember my words, for they will be the last ones your ears will ever hear.")
msgs:addMessage("Pah! Du stinkst ja wie ein Elf, bist dumm wie ein Ork und schwach wie eine Fee!", "Pah! You stink like an elf, are as stupid as an orc and as weak as a fairy!")
msgs:addMessage("Attacke! Möge Irmorom mir einen Platz in seinen ewigen Hallen frei halten!", "Charge! May Irmorom reserve a seat for me in the Great Hall!")
msgs:addMessage("#me grollt kehlig und schüttelt den Kopf so wild, dass ihm sein Bart um beide Ohren schlackert.", "#me growls and shakes his head so wildly that his beard hits his ears.")
msgs:addMessage("Bah, hast du eine hässliche Fratze… lass sie mich dir zurechtschmieden!", "Bah, your face is so ugly… let me re-forge it for you!")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M