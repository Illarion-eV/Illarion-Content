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
local M = {}

local function isOnIsle(user) --Is on the twin eyes isle past the second bridge
    if user.pos.x > 900 and user.pos.y > 900 and user.pos.x < 950 and user.pos.y < 950 then
        return true
    end
end

M.isOnIsle = isOnIsle

local function isInMushroomCluster(user) -- Is in the mushroom cluster in dewy swamps
    if user.pos == position(923, 667, 0) then
        return true
    end
end

local function isUnderMevrannonTree(user) --Forest north of Runewick fields, special tree
    if user.pos == position(849, 770, 0) then
        return true
    end
end

local function onTheEldanOakStone(user) --Narguns plain forest, on rock next to eldan oak
    if user.pos == position(524, 223, 0) then
        return true
    end
end

local function inUsharasGarden(user) -- In the underground garden of Ushara
    if user.pos.x > 742 and user.pos.y > 266 and user.pos.x < 808 and user.pos.y < 313 and user.poz.z == -3 then
        return true
    end
end

local function inLibertyQuarry(user) -- in the iron mine of Cadomyr
    if user.pos.x > 150 and user.pos.y > 584 and user.pos.x < 180 and user.pos.y < 617 and user.poz.z == 0 then
        return true
    end
end

M.isUnderMevrannonTree = isUnderMevrannonTree

M.onTheEldanOakStone = onTheEldanOakStone

M.isInMushroomCluster = isInMushroomCluster

M.inUsharasGarden = inUsharasGarden

M.inLibertyQuarry = inLibertyQuarry

function M.addEffect( myEffect, user)
    if isOnIsle(user) then
        user:inform("Das muss es sein die Zwillingsaugen-Inseln, von denen Fianna gesprochen hat. Wenn du hier eine Weile meditierst, solltest du die Antwort finden, die du suchst.", "This must be it, the Twin Eyes Islands that Fianna spoke of. So long as you meditate here for some time, you should find the answer you seek." )
    elseif isInMushroomCluster(user) then
        user:inform("Du scheinst den Pilzkreis gefunden zu haben, von dem Fianna gesprochen hat. Jetzt bleibt nur noch, dich hinzusetzen und zu meditieren.", "You seem to have found the mushroom cluster Fianna spoke of. Now all that's left to do is to sit down and meditate.")
    elseif isUnderMevrannonTree(user) then
        user:inform("Dies müssen die südlichen Äste des goldenen Baumes sein, von dem Fianna gesprochen hat. Jetzt bleibt nur noch, sich hinzusetzen und zu meditieren, bis du die Stimme der Natur zu dir sprechen hörst.", "This must be the southern branches of the golden tree that Fianna spoke of. Now all there's left to do is to sit and meditate until you hear the voice of nature speak to you.")
    elseif inUsharasGarden(user) then
        user:inform("Wenn du Usharas Garten betrittst, ist das Gefühl von Lebenskraft zunächst fast überwältigend. Doch schon bald lässt es dich fühlen, als wärst du zu Hause, im Einklang mit der Natur. Du solltest einen Platz finden, dich hinsetzen und über diese Empfindung in den Tiefen der Erde meditieren.", "As you enter Ushara's garden, the sense of vitality is almost overwhelming at first. Yet soon enough, it makes you feel like you're at home, attuned with nature. You should find a place to sit down and meditate on this sensation in the depths of the earth.")
    elseif inLibertyQuarry(user) then
        user:inform("Der Staub, das Klirren von Spitzhacken, Steinschutt. Wie soll man hier überhaupt meditieren? Dennoch musst du dich arrangieren und einen Ort finden, um dich zu konzentrieren, wenn du weiterkommen willst.", "The dust, the clinking of pickaxes, stone debris. How is one even supposed to meditate in here? Still, you must make do and find a place to concentrate if you want to proceed further.")
    end
end



function M.callEffect( myEffect, user)

    local foundCalls, calls = myEffect:findValue("calls")

    if (not foundCalls or calls < 1) then

        if not calls then
            calls = 0
        end

        myEffect:addValue("calls", calls+1)

        if isOnIsle(user) then
            user:inform("Während du auf der Insel bleibst, spürst du, wie du dich allmählich auf die Natur um dich herum einstimmst. Es sollte nicht mehr lange dauern.", "As you stay on the isle you feel yourself gradually attune to the nature around you. It shouldn't be much longer now.")
            myEffect.nextCalled = 600
            return true
        elseif isInMushroomCluster(user) then
            user:inform("Während du im Kreis der Pilze sitzt, spürst du, wie du dich nach und nach auf die Natur um dich herum einstimmst. Es sollte jetzt nicht mehr lange dauern.", "As you sit inside the circle of mushrooms you feel yourself gradually attune to the nature around you. It shouldn't be much longer now.")
            myEffect.nextCalled = 600
            return true
        elseif isUnderMevrannonTree(user) then
            user:inform("Während du unter den goldenen Blättern sitzt, spürst du, wie du dich allmählich mit der Natur um dich herum in Einklang bringst. Es sollte nicht mehr lange dauern.", "As you sit under the golden leaves you feel yourself gradually attune to the nature around you. It shouldn't be much longer now.")
            myEffect.nextCalled = 600
            return true
        elseif inUsharasGarden(user) then
            user:inform("Überall um dich herum spürst du die tiefen, uralten Kräfte der Natur und Usharas Segen. Ein überwältigendes Gefühl von Geborgenheit, Ehrfurcht und tiefem Respekt vor der Natur kann dich erfüllen, während du meditierst. Es sollte nicht mehr lange dauern, bis die Offenbarung über dich hereinbricht.", "All around you, you feel the deep ancient forces of nature and Ushara's blessings. An overwhelming sense of comfort, awe and deep respect of nature might fill you as you meditate. It shouldn't be much longer now, until revalation is upon you.")
            myEffect.nextCalled = 600
            return true
        elseif inLibertyQuarry(user) then
            user:inform("Du kannst spüren, dass es nicht mehr lange dauern sollte. Das Klirren hallt überall um dich herum wider, die Vibration des Bodens unter dir - alles beginnt auf seltsame Weise zu? resonieren.", "You can feel it shouldn't be much longer now. The clinking sounds echoing all around you, the vibration of the ground beneath you, it's all beginning to strangely.. resonate.")
            myEffect.nextCalled = 600
            return true
        end

    end

    if not isOnIsle(user) and not isInMushroomCluster(user) and not isUnderMevrannonTree(user) and not inUsharasGarden(user) and not inLibertyQuarry(user) then
        user:inform("Du hast den Meditationsplatz zu früh verlassen. Du musst zurückkehren und von vorne beginnen, wenn du mit dem Tutorial fortfahren möchtest.", "You left the meditation spot too soon. You must return and start again if you wish to proceed with the tutorial.")
        return false
    end

    if isOnIsle(user) then
        user:setQuestProgress(692, 2)
        user:inform("Nachdem du einige Zeit hier verbracht hast, fühlst du dich in Frieden; eins mit der Natur. Du kannst sie sogar zu dir flüstern hören, und du kannst den Ausdruck \"Cor Valis\" erkennen, der vom Wind getragen wird. Was könnte er bedeuten? Du solltest zu Fianna zurückkehren und sie fragen.", "After spending some time here, you feel yourself at peace; one with nature. You can even hear it whisper to you, and you can make out the phrase \"Cor Valis\" carried on the wind. What could it mean? You should return to Fianna and ask.")
    end

    if isInMushroomCluster(user) then
        user:setQuestProgress(694, 4)
        user:inform("Hat dieser Pilz gerade mit dir gesprochen oder wirst du verrückt? In jedem Fall hast du plötzlich das Gefühl, dass du einige Sumpfblumen mitbringen solltest, bevor du zu Fianna zurückkehrst. Es sollten welche in der Nähe sein, wenn du sie ernten kannst.", "Did that mushroom just speak to you or are you going mad? In either case, you suddenly have the sensation you should bring some marsh flowers back with you before returning to Fianna. There should be some nearby, if you are able to harvest them.")
    end

    if isUnderMevrannonTree(user) then
        user:setQuestProgress(693, 4)
        user:inform("Vom Wind getragen und durch die goldenen Blätter über dir geweht, erreichen dich Worte einer längst verlorenen Sprache. Du stellst fest, dass du die Worte nicht wiederholen kannst, doch ihre Bedeutung ist dir irgendwie klar, und du weißt, was du als Nächstes tun musst. Bevor du zu Fianna zurückkehrst, solltest du einige vierblättrige Einbeere sammeln - gibt es in Yewdale im Westen nicht welche?", "Carried by the wind and blown through the golden leaves above, words of a language long lost make their way to your ears. You find yourself unable to repeat the words, yet their meaning are somehow clear to you and you know what you must do next. Before returning to Fianna, you should gather some fourleafed oneberries- Doesn't Yewdale to the west have some? ")
    end

    if inUsharasGarden(user) then
        user:setQuestProgress(695, 4)
        user:inform("Die Tiefen der Natur rufen nach dir, du kannst es spüren. Der alte Pfad der Natur und ihrer Verflechtungen zeigt dir, wie du die tiefsten Weaves aller Art nutzen kannst. Du wirst einige Bulbsponge-Pilze sammeln müssen, bevor du zu Fianna zurückkehrst.", "The depths of nature call out to you, you can feel it. The old path of nature and its weaves, telling you how to harness the deepest weaves of all. You'll need to gather some bulbsponge mushrooms, before making your way back to Fianna.")
    end

    if inLibertyQuarry(user) then
        user:setQuestProgress(697, 4)
        user:inform("Die Echos des Klangs prallen von Wand zu Wand, Vibrationen umgeben dich. Natur ist nicht nur Pflanzenwelt, sondern auch Stein, Sand und Erde, und diese Wahrheit wird dir klar, während du lernst, die Weaves des Steins zu nutzen. Du brauchst faulige Baumrinde, bevor du zu Fianna zurückkehrst.", "The echoes of sound bounce wall to wall, vibrations all around you. Nature is not only plantlife but also stone, sand, and earth, and that truth becomes clear as you learn to harness the weaves of stone. You will need some rotten tree bark before returning to Fianna.")
    end
    return false
end

return M

