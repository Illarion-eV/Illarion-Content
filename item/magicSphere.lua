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
local lookat = require("base.lookat")
local teaching = require("magic.arcane.teaching")
local runes = require("magic.arcane.runes")
local increaseArea = require("magic.arcane.harvestFruit")
local monsterHooks = require("monster.base.hooks")
local characterLoad = require("triggerfield.zelphiasStream")
local hints = require("magic.arcane.runeHintsBook")
local bottles = require("item.bottles")

local runeHints = hints.runeHintsBookTexts

local lightSphere

local puzzles = {
    phercPuzzle = {
        english = "If knowledge you seek, blood you must spill. Come on; give it a try, it might just be an unexpected thrill.",
        german = "Wenn du Wissen suchst, musst du Blut vergießen. Komm schon, versuch es, es könnte ein unerwarteter Nervenkitzel sein."
    },
    qwanPuzzle = {
        fail = {
            english = "The lever refuses to budge. It would seem you may need the aid of someone stronger if you want to proceed.",
            german = "Der Hebel weigert sich sich zu bewegen. Es sieht so aus als bräuchtest du die Hilfe von jemandem, der stärker ist, wenn du weitermachen willst."
        },
        success = {
            english = "Using all your strength, you barely manage to move the lever.",
            german = "Mit aller Kraft schaffst du es gerade noch, den Hebel zu bewegen."
        }

    },
    savPuzzle = {
        english = "I lost my darling pet Bunbun! She should be across this sea of lava! If you want my knowledge, help me find her and bring her safely here!",
        german = "Ich habe mein liebes Haustier Bunbun verloren! Sie sollte auf der anderen Seite dieses Lavameers sein! Wenn du mein Wissen willst, hilf mir, sie zu finden und sicher hierher zu bringen!",
        noSpider = {
            english = "As you activate the mechanism, you notice a small spider is forced out of its hole. Could this actually be Bunbun?",
            german = "Als du den Mechanismus aktivierst, bemerkst du, dass eine kleine Spinne aus ihrem Loch herauskommt. Könnte das tatsächlich Bunbun sein?"
        },
        spiderExists = {
            english = "Nothing happened. Bunbun must already be out here somewhere.",
            german = "Es ist nichts passiert. Bunbun muss schon irgendwo hier draußen sein."
        }
    },
    sihPuzzle = {
        english = "Recipe for holy water:\nTwo parts the mother's water, the purest kind.\nOne part water that heals with utmost efficiency.",
        german = "Rezept für Weihwasser:\nZwei Teile Wasser der Mutter, die reinste Art.\nEin Teil Wasser, das mit höchster Effizienz heilt.",
        lizardish = {
            english = "All you see are clawmarks that form various symbols. Maybe a lizardman could help you decipher it?",
            german = "Alles was du siehst sind Kratzspuren die verschiedene Symbole bilden. Vielleicht kann dir ein Echsenmensch helfen, sie zu entziffern?"
        }
    },
    yegPuzzle = {
        english = "If it is my knowledge you seek, face me while wielding a weapon many might despise as dishonorable. Only a slow, torterous death can satisfy my cravings.",
        german = "Wenn es mein Wissen ist das du suchst, dann stelle dich mir während du eine Waffe schwingst, die viele als unehrenhaft verachten würden. Nur ein langsamer, qualvoller Tod kann meine Begierde stillen."
    },
    tahPuzzle = {
        english = "What word is always pronounced wrong? Though before you answer this riddle, bear in mind that sometimes things are the opposite of what they might seem.",
        german = "Welches Wort wird immer falsch ausgesprochen? Bevor du dieses Rätsel beantwortest, solltest du bedenken, dass die Dinge manchmal das Gegenteil von dem sind, was sie zu sein scheinen."
    },
    sulPuzzle = {
        english = "Look at you! Only skin and bones, no meat! You know those of the family Epphurd buried in these tombs were not buried with just their heavy possessions, but their heavy bodies too! Go put on some weight, one way or the other!",
        german = "Sieh dich an! Nur Haut und Knochen, kein Fleisch! Du weißt, dass die Angehörigen der Familie Epphurd, die in diesen Gräbern begraben sind, nicht nur mit ihren schweren Besitztümern, sondern auch mit ihren schweren Körpern begraben wurden! Geh und nimm etwas zu, so oder so!"
    },
    taurPuzzle = {
        english = "What kind of creature walks on four legs in the morning, two legs in the afternoon and three in the evening?",
        german = "Welches Lebewesen geht morgens auf vier Beinen, nachmittags auf zwei und abends auf drei Beinen?"
    },
    uraPuzzle = {
        english = "These noble creatures stand TOWERING as they SHIELD the EARTH on which you stand. Bring them an offering with a PURE mind and they might just impart the knowledge of nature of which you seek.",
        german = "Diese edlen Kreaturen stehen TÜRMEND da und SCHILDEN die ERDE, auf der du stehst. Bringe ihnen ein Opfer mit einem REINEN Geist und sie könnten dir das Wissen über die Natur vermitteln, das du suchst."
    },
    lhorPuzzle = {
        english = "My coat is dark as the night, my home shines like the sun. When Nargun is playing tricks, I'll be there. What am I? Speak my name out loud, and knowledge shall be granted to you.",
        german = "Mein Mantel ist dunkel wie die Nacht, mein Heim funkelt wie die Sonne. Wenn Nargun Streiche spielt, werde ich da sein. Was bin ich? Sprich meinen Namen laut aus, und die Weisheit wird dir gewährt werden."
    },
    lukPuzzle = {
        denounce = {
            english = "Will you denounce the fallen god in the name of knowledge?",
            german = "Wirst du den gefallenen Gott im Namen des Wissens verdammen?",
            yes = {
                english = "Denounce Moshran",
                german = "Veruteile Moshran"
            },
            no = {
                english = "Praise Moshran",
                german = "Lobpreise Moshran"
            },
            denounced = {
                english = "You did well by denouncing that evil. Go reap your reward, if you haven't already.",
                german = "Du hast gut daran getan, dieses Übel zu verurteilen. Geh und hol dir deine Belohnung - wenn du es nicht schon getan hast."
            },
            praised = {
                english = "You've already praised Moshran. It is too late to take back this offense now.",
                german = "Du hast Moshran bereits gelobt. Jetzt ist es zu spät, diese Tat zurückzunehmen."
            }
        },
        denounced = {
            english = "As you touch the orb, an ethereal feeling of good-will seems to reach out from the void, making it light up. Could it be the gods approving of your actions?",
            german = "Als du die Kugel berührst, scheint ein überirdisches Gefühl des guten Willens aus der Leere zu kommen und sie zum Leuchten zu bringen. Könnte es sein, dass die Götter dein Handeln gutheißen?"
        },
        praised = {
            english = "As you touch the orb, an ethereal entity radiating hostility seems to reach out from the void in an attempt to prevent the orb from lighting up. However, at the same moment, a separate ethereal entity reaches out from the nearby altar, overpowering the first entity and lighting up the sphere.",
            german = "Als du die Kugel berührst, scheint ein feindseliges Wesen aus der Leere zu kommen und zu versuchen, die Kugel am Aufleuchten zu hindern. Doch im selben Moment greift ein anderes übernatürliches Wesen aus dem nahegelegenen Altar hervor, überwältigt das erste Wesen und bringt die Kugel zum Leuchten."
        },
        denouncedInform = {
            english = "You denounce Moshran. You feel like the gods look more favourably upon you already.",
            german = "Du verurteilst Moshran. Du hast das Gefühl, dass die Götter bereits wohlwollender auf dich schauen."
        },
        praisedInform = {
            english = "You praised Moshran. Oh you anarchist you, what have you done?",
            german = "Du hast Moshran gelobt. Oh, du Anarchist, du, was hast du getan?"
        }
    },
    bhonaPuzzle = {

        gibberish = {
            english = "Whatever is written on this scroll, it doesn't look like much more than gibberish to you right now.",
            german = "Was auch immer auf dieser Schriftrolle steht, es sieht für dich im Moment nicht nach viel mehr als Kauderwelsch aus."
        },
        locations = {
            {location = position(471, 765, 0),
            english = "Your journey next, takes you to a place where an exile takes rest, from her evil brethrens monotheistic pest.\n X X A",
            german = "Deine nächste Reise führt dich an einen Ort, an dem sich eine Verbannte von der monotheistischen Pest ihrer bösen Geschwister erholt \n X X A.",
            before = 1,
            after = 2},
            {location = position(751, 338, -9),
            english = "Next on the list, an isle of snow. When will you go, if not now?\n X X X X X X X L",
            german = "Als nächstes steht eine Schneeinsel auf der Liste. Wann wirst du gehen, wenn nicht jetzt?\n X X X X X X X L",
            before = 2,
            after = 3},
            {location = position(425, 65, 0),
            english = "In the fiery depths, where spiders guard. A place where many adventurers have been scarred. \n S",
            german = "In den feurigen Tiefen, wo Spinnen wachen. Ein Ort, an dem schon viele Abenteurer entstellt wurden. \n S",
            before = 3,
            after = 4},
            {location = position(528, 794, -6),
            english = "Back up we go, no time to waste. Better yet return, to where merchants make haste. \n X L",
            german = "Zurück nach oben, wir haben keine Zeit zu verlieren. Besser noch, wir kehren zurück, dahin, wo die Kaufleute sich tummeln. \n X L",
            before = 4,
            after = 5},
            {location = position(673, 317, 0),
            english = "In the ruins of civilization, ruined by creatures of stone. Now swarmed with the dead, it lies entombed. \n X X X X A",
            german = "In den Ruinen der Zivilisation, zerstört von Kreaturen aus Stein. Jetzt wimmelt es von Toten und die Zivilisation liegt begraben. \n X X X X A",
            before = 5,
            after = 6},
            {location = position(926, 415, -3),
            english = "Sleep you with pirates, and you will see. There's nowhere to hide, near Cadomyr's sea. \n X X X Y",
            german = "Wer mit Piraten schläft, wird sehen. Es gibt kein Versteck, am Meer von Cadomyr. \n X X X Y",
            before = 7,
            after = 8},
            {location = position(214, 478, -3),
            english = "Next with the thieves, I dare you to be. Near a land full of wonder, this time by the eastern sea. \n X X X X X K",
            german = "Als nächstes bei den Dieben, das traue ich dir zu. In der Nähe eines Landes voller Wunder, dieses Mal am östlichen Meer. \n X X X X X K",
            before = 8,
            after = 9},
            {location = position(918, 592, -3),
            english = "Into the forests, in the home of a hermit, you will find me. \n X X X X X X X X X U",
            german = "In den Wäldern, im Haus eines Einsiedlers, wirst du mich finden. \n X X X X X X X X X X U",
            before = 10,
            after = 11},
            {location = position(820, 94, 0),
            english = "Your thirst for knowledge is like that of which a man lost in the desert will face. Oddly apt, as you would both find what you seek in the very same place. \n X X X X X X A X X X X",
            german = "Dein Wissensdurst ist wie der eines Mannes, der sich in der Wüste verirrt hat. Seltsam treffend, denn du würdest beides was du suchst am selben Ort finden. \n X X X X X X A X X X X",
            before = 12,
            after = 13},
            {location = position(386, 671, 0),
            english = "Give praise to the gods of old, and you will find. It can be rewarding, doing what you're told. \n X X X X X X X X T",
            german = "Lobt die Götter der Vergangenheit, und du wirst es finden. Es kann lohnend sein, das zu tun, was man dir sagt. \n X X X X X X X X X T",
            before = 14,
            after = 15},
            {location = position(570, 127, 0),
            english = "Now for the final answer, you will have to combine. What you've learned so far, into one mind. \n X X X X X X X X X X T",
            german = "Für die endgültige Antwort musst du nun alles kombinieren. Das was du bisher gelernt hast, zu einem Gedanken zusammenfügen. \n X X X X X X X X X X X T",
            before = 16,
            after = 17},
        }
    },
    penPuzzle = {
        english = "I am easy to lift but hard to throw. What am I?\nSpeak me out loud and you shall be enlightened.",
        german = "Ich bin leicht zu heben aber schwer zu werfen. Was bin ich?\nRufe mich und werde erleuchtet."
    },
    anthPuzzle = {
        main = {
            english = "Write down the correct four-digit number and you shall be enlightened. The answer can be found by studying the pillars.",
            german = "Schreibe die richtige vierstellige Zahl nieder und werde erleuchtet. Die Antwort findest du durch das Studium der Säulen" },
        wrong = {
            english = "Wrong answer",
            german = "Falsche Antwort"},
        success = {
            english = "Success",
            german = "Erfolg"},
    },
    dunPuzzle = {
        english = "You snagas get to work now! This room should've been filled up with items yesterday!",
        german = "An die Arbeit ihr Maden. Dieser Raum hätte schon gestern mit Zeugs voll sein müssen",
        orcish = {
            english = "There seems to be something written in orcish on the scroll. You'd need someone to translate it for you.",
            german = "Die Schriftrolle scheint in einem Orkdialekt verfasst zu sein. Du brauchst Hilfe um das zu übersetzen"}
    },
    fhanPuzzle = {
        english = "We don't have time to honour the dead, they said.\nWe need to fend off Cherass' invading army, they said.\nSending off the dead is a waste of time, they said.\nWell now who's laughing?",
        german = "Wir haben nicht genug Zeit die Toten zu ehren haben sie gesagt.\nWie müssen uns gegen Cherass Armee verteidigen haben sie gesagt,\nDie Toten zu vernichten sei Zeitverschwendung haben sie gesagt.\n Doch wer lacht jetzt?",
        coffins = {
            {english = "Here lies Maxwell 'the Pebble' Orson, may he find rest in death.",
            german = "Hier liegt Maxwell 'der Kiesel' Orson, möge er in Frieden ruhen.",
            location = position(591,321,3)},
            {english = "Aren Ighys rests here. A devout follower of Bragon, his only wish was to be closer to his god.",
            german = "Hier ruht Aren Ighys. Ein gläubiger Anhänger Bragons. Er wollte näher zu seinem Gott, das war sein letzter Wunsch.",
            location = position(591,317,3)},
            {english = "Here lies the swordsman Drovan Darksword. Little did people know, he was secretly obsessed with the drow.",
            german = "Hier ruht der Schwertkämpfer Drovan Dunkelklinge. Wenige wissen, dass er ein heimlicher Verehrer der Drow war.",
            location = position(599, 317, 3)},
            {english = "Jonathan Corn, a man born to a chicken farmer. His last request was a meal from home, though he never got it.",
            german = "Jonathan Korn, geboren als Sohn eines Hühnerzüchters. Sein letzter Wunsch war eine Mahlzeit von Zuhause, die er aber nie bekam.",
            location = position(599,321,3)}
        }
    },
    fhenPuzzle = {
        english = "An elf and a dwarf sit down to drink together. What do they drink? Place both beverages on the offering plate and be enlightened.",
        german = "Ein Zwerg und ein Elf haben zusammen getrunken. Aber was? Platziere beide Getränke auf dem Opferteller und werde erleuchtet."
    },
    heptPuzzle = {
        english = "Brr, it's so cold. If only there was a way to make it warmer. There's only snow, stone and all these pesky trees nearby!",
        german = "Brr, es ist so fürchterlich kalt. Wenn es nur einen Weg geben würde es wärmer zu haben. Hier gibt es nur Schnee, Stein und diese lästigen Bäume! "
    },
    iraPuzzle = {
        english = "One eye to lift and one to sleep.\nOne to charm and one for beast.\nOne eye to wound and one eye to slow.\nOne to bring fear and one to make stone.\nOne eye makes dust and one eye brings death.\nSpeak my name aloud and you will know.",
        german = "Ein Auge zum Aufstehen und eines zum Schlafen. \nEines zum Bezaubern und eines für die Bestien.\nEin Auge zum Verwunden und ein Auge zum Verlangsamen.\nEines um Angst zu verbreiten und eines um Stein zu machen. \nEin Auge macht Staub und ein Auge bringt den Tod.\nSprich meinen Namen und du wirst es wissen."
    },
    kahPuzzle = {
        english = "For breakfast, I want an egg salad sandwich!\nFor dinner, I want a venison dish!\nFor supper... Mushroom soup!",
        german = "Zum Frühstück will ich Eiersalatsandwich! \n Zum Mittagessen will ich ein Wildgericht mit Beilage! \n Zum Abendessen...Pilzsuppe! "
    },
    kelPuzzle = {
        english = "Together, we can fly up high and soar the skies. However, it is not possible in my current state. Find me, and you shall have the knowledge you seek.",
        german = "Gemeinsam können wir hoch fliegen und die Lüfte erklimmen. Doch in meinem derzeitigen Zustand ist das nicht möglich. Finde mich und du wirst das Wissen bekommen das du suchst.",
        egg = {
            english = "A dragon egg. Could this be the answer?",
            german = "Ein Drachenei. Könnte das die Antwort sein?"
        },
        feather = {
            english = "A feather... of the chicken variety. Surely it can't be this, right?",
            german = "Eine Feder....von einem Hähnchen. Also das kann es nicht sein, oder?"
        },
        air = {
            english = "A swirling mass of pure air. You could probably fly with this?",
            german = "Eine wirbelnde Masse reiner Luft. Damit könntest du wahrscheinlich davonfliegen?"
        },
        suffix = {
            english = "\nIf you believe this to be the answer, go back to the sphere and find out.",
            german = "\nWenn du glaubst, dass das die Antwort ist, geh zurück zur Kugel und finde es heraus."
        },
    },
    mesPuzzle = {
        english = "You call this a lighthouse? Lights! We need more lights! Go get the oil, now!",
        german = "Das soll ein Leuchtturm sein? Lichter! Wir brauchen mehr Lichter! Holt das Öl, sofort!"
    },
    orlPuzzle = {
        english = "They may not be your friends, but these foul creatures will be neccessary to obtain the knowledge that you seek. Find as many as they have legs, and just... try to endure.",
        german = "Sie mögen nicht deine Freunde sein, aber diese üblen Kreaturen werden notwendig sein, um das Wissen zu erlangen, das du suchst. Finde genau so viele, wie sie Beine haben, und... versuche einfach zu überleben."
    },
    peraPuzzle = {
        english = "It's a race! Pull both levers fast enough and you shall obtain the knowledge you seek!",
        german = "Es ist ein Wettrennen! Ziehe beide Hebel schnell genug und du wirst das Wissen erhalten, das du suchst!",
        slow = {
            english = "Too slow! You can always try again, though.",
            german = "Zu langsam! Du kannst es aber jederzeit wieder versuchen."
        },
        fast = {
            english = "You made it! Now go back to reap your reward!",
            german = "Du hast es geschafft! Jetzt geh zurück und hol dir deine Belohnung ab!"
        },
        pulled = {
            english = "You've pulled the lever, starting the timer! Hurry to the other lever!",
            german = "Du hast den Hebel gezogen und damit den Timer gestartet! Beeil dich mit dem anderen Hebel!"
        }
    }
}

local M = {}

local function getSphere(thePos)

    local field = world:getField(thePos)
    local itemsOnField = field:countItems()

    for i = 0, itemsOnField-1 do
        local currentItem = field:getStackItem(itemsOnField-i)
        if currentItem.id == 3499 then --sphere found
            return currentItem
        end
    end

    debug("should never get here")

end

function M.checkTaurPosition(user)

    local taurPosition = position(179, 550, 0)

    local distance = 10

    local biggerX =  user.pos.x > taurPosition.x + distance
    local smallerX = user.pos.x < taurPosition.x - distance
    local biggerY =  user.pos.y > taurPosition.y + distance
    local smallerY = user.pos.y < taurPosition.y - distance

    if user.pos.z ~= taurPosition.z then
        return false
    end

    if biggerX or smallerX or biggerY or smallerY then
        return false
    end

    local sphere =  getSphere(taurPosition)

    lightSphere(user, sphere, true)

    return true

end

local function uraPuzzleSolved()

    local towerShields = {Item.steelTowerShield, Item.legionnairesTowerShield, Item.ornateTowerShield}

    local earth = Item.pureEarth

    local earthFound = false

    local shieldFound = false

    local plate1 = position(826, 156, 0)
    local plate2 = position(828, 156, 0)

    local field1 = world:getField(plate1)
    local field2 = world:getField(plate2)

    local itemsOnField1 = field1:countItems()
    local itemsOnField2 = field2:countItems()

    local currentItem

    for i = 0, itemsOnField1-1 do
        currentItem = field1:getStackItem(i)
        if currentItem.id == earth then
            earthFound = true
            break
        end
        for _, shield in pairs(towerShields) do
            if currentItem.id == shield then
                shieldFound = true
                break
            end
        end
    end
    for i = 0, itemsOnField2-1 do
        currentItem = field2:getStackItem(i)
        if currentItem.id == earth then
            earthFound = true
            break
        end
        for _, shield in pairs(towerShields) do
            if currentItem.id == shield then
                shieldFound = true
                break
            end
        end
    end

    if earthFound and shieldFound then
        return true
    end

    return false

end

local function passesSulPuzzle(user)

    local maxLoad = characterLoad.getMaximumLoad(user)
    local currentLoad = characterLoad.getCharacterLoad(user)

    if currentLoad+1000 >= maxLoad then
        return true
    end

    return false
end

function M.taurInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.taurPuzzle.german, puzzles.taurPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.uraInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.uraPuzzle.german, puzzles.uraPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.sulInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.sulPuzzle.german, puzzles.sulPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.tahInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.tahPuzzle.german, puzzles.tahPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.checkTahPosition(user)

    local tahPosition = position(14, 522, 0)

    local distance = 10

    local biggerX =  user.pos.x > tahPosition.x + distance
    local smallerX = user.pos.x < tahPosition.x - distance
    local biggerY =  user.pos.y > tahPosition.y + distance
    local smallerY = user.pos.y < tahPosition.y - distance

    if user.pos.z ~= tahPosition.z then
        return false
    end

    if biggerX or smallerX or biggerY or smallerY then
        return false
    end

    local sphere =  getSphere(tahPosition)

    lightSphere(user, sphere, true)

    return true

end

local function passesYegPuzzle(user)

    local poisonedWeapons = {549, 2635, 2636, 2655, 2668, 2689, 2694, 2705, 2725}

    for _, weapon in pairs(poisonedWeapons) do
        if user:countItemAt("body", weapon) > 0 then
            return true
        end
    end

    return false
end

function M.yegInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.yegPuzzle.german, puzzles.yegPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function passesSihPuzzle()
    local platePos1 = position(782, 263, -8)
    local platePos2 = position(784, 263, -8)
    local field1 = world:getField(platePos1)
    local field2 = world:getField(platePos2)
    local itemsOnField1 = field1:countItems()
    local itemsOnField2 = field2:countItems()
    local currentItem
    local healthPotionFound = false
    local twoPureWaterFound = false
    local water = Item.pureWater
    local potion = 166 -- No Item.name for violet potion in the database

    for i = 0, itemsOnField1-1 do
        currentItem = field1:getStackItem(i)
        if currentItem.id == water then
            if currentItem.number == 2 then
                twoPureWaterFound = true
                break
            end
        elseif currentItem.id == potion then
            local effect = currentItem:getData("potionEffectId")
            if tonumber(effect) == 95559555 then
                healthPotionFound = true
                break
            end
        end
    end

    for i = 0, itemsOnField2-1 do
        currentItem = field2:getStackItem(i)
        if currentItem.id == water then
            if currentItem.number == 2 then
                twoPureWaterFound = true
                break
            end
        elseif currentItem.id == potion then
            local effect = currentItem:getData("potionEffectId")
            if tonumber(effect) == 95559555 then
                healthPotionFound = true
                break
            end
        end
    end

    if healthPotionFound and twoPureWaterFound then
        return true
    end

    return false
end

function M.sihInfo(user)

    local lizardish =  user:getSkill(Character["lizardLanguage"])


    local callback = function(dialog)
    end

    local english
    local german

    if lizardish >= 80 then
        english = puzzles.sihPuzzle.english
        german = puzzles.sihPuzzle.german
    else
        english = puzzles.sihPuzzle.lizardish.english
        german = puzzles.sihPuzzle.lizardish.german
    end

    local dialog = MessageDialog("", common.GetNLS(user, german, english), callback)
    user:requestMessageDialog(dialog)

end

local function savPuzzleSolved()

    local monsters = world:getMonstersInRangeOf(position(111, 887, -3), 3)

    for _, monster in pairs(monsters) do
        if monster.name == "Small Spider" then
            monsterHooks.setForcedDeath(monster)
            monster:increaseAttrib("hitpoints", -10000)
            monsterHooks.cleanHooks(monster)
            return true
        end
    end

    return false

end

function M.savInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.savPuzzle.german, puzzles.savPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.isBunbun(monster)

    local cornerPos = position(101, 850, -3)
    local rangeY = 60
    local rangeX = 30

    if monster.pos.z ~= cornerPos.z then
        return false
    end

    local monsterY = monster.pos.y
    local monsterX = monster.pos.x

    if monsterX < cornerPos.x or monsterX > cornerPos.x + rangeX then
        return false
    end

    if monsterY < cornerPos.y or monsterY > cornerPos.y + rangeY then
        return false
    end

    return true

end


function M.checkForSpider(user, sourceItem)

    local leverPulled

    local lever = position(111, 850, -3)

    if lever == sourceItem.pos then
        leverPulled = true
    end

    if not leverPulled then
        return
    end

    local lever1 = 436
    local lever2 = 434
    local lever3 = 437
    local lever4 = 439

    local newLeverId

    if sourceItem.id == lever1 then
        newLeverId = lever2
    elseif sourceItem.id == lever2 then
        newLeverId = lever1
    elseif sourceItem.id == lever3 then
        newLeverId = lever4
    elseif sourceItem.id == lever4 then
        newLeverId = lever3
    end

    sourceItem.id = newLeverId
    world:changeItem(sourceItem)

    local centerCoord = position(112, 874, -3)
    local range = 25
    local spawnCoord = position(108, 852, -3)
    local spiderFound = false

    local monsters = world:getMonstersInRangeOf(centerCoord, range)

    for _, monster in pairs(monsters) do
        if monster.name == "Small Spider" then
            spiderFound = true
        end
    end

    if spiderFound then
        user:inform(puzzles.savPuzzle.spiderExists.german, puzzles.savPuzzle.spiderExists.english)
    else
        user:inform(puzzles.savPuzzle.noSpider.german, puzzles.savPuzzle.noSpider.english)
        world:createMonster(196, spawnCoord, 0)
    end
end

function M.qwanPuzzle(user, sourceItem)

    local leverPulled

    local lever = position(240, 776, 1)

    if lever == sourceItem.pos then
        leverPulled = true
    end

    local lever1 = 436
    local lever2 = 434
    local lever3 = 437
    local lever4 = 439

    if leverPulled then
        local strength = user:increaseAttrib("strength", 0)
        if strength >= 15 then
            local newLeverId

            if sourceItem.id == lever1 then
                newLeverId = lever2
            elseif sourceItem.id == lever2 then
                newLeverId = lever1
            elseif sourceItem.id == lever3 then
                newLeverId = lever4
            elseif sourceItem.id == lever4 then
                newLeverId = lever3
            end
            sourceItem.id = newLeverId
            world:changeItem(sourceItem)
            ScriptVars:set("qwanActivate", 1)
            ScriptVars:save()
            user:inform(puzzles.qwanPuzzle.success.german, puzzles.qwanPuzzle.success.english)
        else
            user:inform(puzzles.qwanPuzzle.fail.german, puzzles.qwanPuzzle.fail.english)
        end
    end

end

local function passesPhercPuzzle()

    local mainPos = position(80, 431, -6)
    local positionsToCheck = increaseArea.increaseArea(mainPos)
    local bloodFound = false
    local blood = 3101 -- blood spot, has no Item.name in database
    local substitute = Item.heartBlood

    for _, currentPos in pairs(positionsToCheck) do
        local field = world:getField(currentPos.position)
        local itemsOnField = field:countItems()
        local currentItem

        for i = 0, itemsOnField-1 do
            currentItem = field:getStackItem(i)
            if currentItem.id == blood or currentItem.id == substitute then
                bloodFound = true
                break
            end
        end
    end

    return bloodFound

end

function M.phercInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.phercPuzzle.german, puzzles.phercPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.lukPuzzle(user)

    local germanText
    local englishText

    local callback = function(dialog)
    end

    local callback2 = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex()+1

        local status

        if index == 1 then
            status = "denouncedInform"
        elseif index == 2 then
            status = "praisedInform"
        end
        user:inform(puzzles.lukPuzzle[status].german, puzzles.lukPuzzle[status].english)
        world:makeSound(25, user.pos)
        user:setQuestProgress(245, index)
    end

    if user:getQuestProgress(245) == 1 then
        germanText = puzzles.lukPuzzle.denounce.denounced.german
        englishText = puzzles.lukPuzzle.denounce.denounced.english
        local dialog = MessageDialog("", common.GetNLS(user, germanText, englishText), callback)
        user:requestMessageDialog(dialog)
    elseif user:getQuestProgress(245) == 2 then
        germanText = puzzles.lukPuzzle.denounce.praised.german
        englishText = puzzles.lukPuzzle.denounce.praised.english
        local dialog = MessageDialog("", common.GetNLS(user, germanText, englishText), callback)
        user:requestMessageDialog(dialog)
    else
        germanText = puzzles.lukPuzzle.denounce.german
        englishText = puzzles.lukPuzzle.denounce.english
        local dialog = SelectionDialog("", common.GetNLS(user, germanText, englishText), callback2)
        dialog:addOption(0, common.GetNLS(user, puzzles.lukPuzzle.denounce.yes.german, puzzles.lukPuzzle.denounce.yes.english))
        dialog:addOption(0, common.GetNLS(user, puzzles.lukPuzzle.denounce.no.german, puzzles.lukPuzzle.denounce.no.english))
        user:requestSelectionDialog(dialog)
    end


end

function M.checkLhorPosition(user)

    local lhorPosition = position(781, 438, 0)

    local distance = 10

    local biggerX =  user.pos.x > lhorPosition.x + distance
    local smallerX = user.pos.x < lhorPosition.x - distance
    local biggerY =  user.pos.y > lhorPosition.y + distance
    local smallerY = user.pos.y < lhorPosition.y - distance

    if user.pos.z ~= lhorPosition.z then
        return false
    end

    if biggerX or smallerX or biggerY or smallerY then
        return false
    end

    local sphere =  getSphere(lhorPosition)

    lightSphere(user, sphere, true)

    return true

end

function M.lhorInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.lhorPuzzle.german, puzzles.lhorPuzzle.english), callback)

    user:requestMessageDialog(dialog)
end


local function bhonaMessageDialogue(user, germanText, englishText)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, germanText, englishText), callback)

    user:requestMessageDialog(dialog)
end

function M.bhonaInfo(user, sourceItem)

    for _, location in pairs(puzzles.bhonaPuzzle.locations) do
        if location.location == sourceItem.pos then
            if user:getQuestProgress(244) < location.before  then
                bhonaMessageDialogue(user, puzzles.bhonaPuzzle.gibberish.german, puzzles.bhonaPuzzle.gibberish.english)
            else
                bhonaMessageDialogue(user, location.german, location.english)
                if user:getQuestProgress(244) == location.before then
                    user:setQuestProgress(244, location.after)
                end
            end
        end
    end
end

local peraLevers = {
    {id = 1, location = position(395, 138, 0)},
    {id = 2, location = position(429, 219, 0)}
}

function M.peraPuzzle(user, sourceItem)

    local leverPulled

    for _, lever in pairs(peraLevers) do
        if lever.location == sourceItem.pos then
            leverPulled = lever.id
        end
    end

    local lever1 = 436
    local lever2 = 434
    local lever3 = 437
    local lever4 = 439

    if leverPulled then
        local newLeverId

        if sourceItem.id == lever1 then
            newLeverId = lever2
        elseif sourceItem.id == lever2 then
            newLeverId = lever1
        elseif sourceItem.id == lever3 then
            newLeverId = lever4
        elseif sourceItem.id == lever4 then
            newLeverId = lever3
        end
        sourceItem.id = newLeverId
        world:changeItem(sourceItem)
    end

    if leverPulled then
        local otherLever

        if leverPulled == 1 then
            otherLever = 2
        else
            otherLever = 1
        end

        local setTime = true

        if M[user.name.."lever"..otherLever] then

            local timer = 40

            local time = tonumber(world:getTime("unix"))
            local timePulled = tonumber(M[user.name.."lever"..otherLever])
            local timeCheck = time < timePulled+timer

            if timeCheck then
                setTime = false
            else
                user:inform(puzzles.peraPuzzle.slow.german, puzzles.peraPuzzle.slow.english)
                M[user.name.."lever"..otherLever] = false
                M[user.name.."lever"..leverPulled] = false
            end
        else
            user:inform(puzzles.peraPuzzle.pulled.german, puzzles.peraPuzzle.pulled.english)
        end

        if setTime then
            M[user.name.."lever"..leverPulled] = tonumber(world:getTime("unix"))
        end

        if not setTime then
            user:inform(puzzles.peraPuzzle.fast.german, puzzles.peraPuzzle.fast.english)
            user:setQuestProgress(243, 1)
        end
    end
end

local function passedPeraPuzzle(user)

    if user:getQuestProgress(243) == 1 then
        return true
    else
        return false
    end
end

function M.peraInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.peraPuzzle.german, puzzles.peraPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function passesOrlPuzzle(user)
    local monsters = world:getMonstersInRangeOf(user.pos, 5)

    local spiderCount = 0

    local spidersNeeded = 8

    for _, monster in pairs(monsters) do
        if monster:getRace() == Character.spider then
            spiderCount = spiderCount+1
        end
    end

    if spiderCount == spidersNeeded then
        return true
    end

    return false
end

function M.orlInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.orlPuzzle.german, puzzles.orlPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local mesLamps = {
    position(526, 608, 1),
    position(538, 613, 1),
    position(532, 615, 1),
    position(533, 605, 1),
    position(527, 609, 0),
    position(536, 609, 0),
    position(536, 618, 0)
}

local function checkMesPuzzle()

    local lampOff = 395

    for _, location in pairs(mesLamps) do
        local field = world:getField(location)
        local itemsOnField = field:countItems()
        local topItem = field:getStackItem(itemsOnField-1)
        if topItem.id == lampOff then
            return false
        end
    end

    return true
end

function M.mesInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.mesPuzzle.german, puzzles.mesPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end


local levStatues = {
    {location = position(192, 803, -3), reset = 440, correct = 443, rotation = {440, 441, 442, 443}},
    {location = position(192, 807, -3), reset = 695, correct = 693, rotation = {692, 694, 693, 695}},
    {location = position(192, 811, -3), reset = 693, correct = 692, rotation = {692, 693}},
    {location = position(192, 816, -3), reset = 442, correct = 272, rotation = {692, 694, 442, 272}}
}

function M.changeStatue(user, sourceItem)

    local newStatue

    for _, statue in pairs(levStatues) do
        if statue.location == sourceItem.pos then
            for i = 1, #statue.rotation do
                if statue.rotation[i] == sourceItem.id then
                    if i == #statue.rotation then
                        newStatue = statue.rotation[1]
                        break
                    else
                        newStatue = statue.rotation[i+1]
                        break
                    end
                end
            end
            break
        end
    end

    if newStatue then
        sourceItem.id = newStatue
        world:changeItem(sourceItem)
    end

end

local function passesLevPuzzle()

    local correctStatues = 0

    for _, statue in pairs(levStatues) do
        local field = world:getField(statue.location)
        local itemsOnField = field:countItems()
        local topItem = field:getStackItem(itemsOnField-1)
        if topItem.id == statue.correct then
            correctStatues = correctStatues+1
        end
    end

    if correctStatues == 4 then
        return true
    end

    return false

end

local function resetLevPuzzle()

    for _, statue in pairs(levStatues) do
        local field = world:getField(statue.location)
        local itemsOnField = field:countItems()
        local topItem = field:getStackItem(itemsOnField-1)
        if topItem.id == statue.correct then
            topItem.id = statue.reset
            world:changeItem(topItem)
        end
    end
end

function M.kelInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.kelPuzzle.german, puzzles.kelPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.kahInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.kahPuzzle.german, puzzles.kahPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function kahPuzzleSolved()

    local platePos1 = position(793, 803, 0)
    local platePos2 = position(793, 804, 0)
    local platePos3 = position(793, 805, 0)
    local field1 = world:getField(platePos1)
    local field2 = world:getField(platePos2)
    local field3 = world:getField(platePos3)
    local itemsOnField1 = field1:countItems()
    local itemsOnField2 = field2:countItems()
    local itemsOnField3 = field3:countItems()
    local currentItem
    local supper = false
    local dinner = false
    local breakfast = false
    local soup = Item.mushroomSoup
    local dish = Item.venisonDish
    local sandwich = Item.eggSaladSandwich

    for i = 0, itemsOnField1 - 1 do
        currentItem = field1:getStackItem(i)
        if currentItem.id == soup then
            supper = true
            break
        elseif currentItem.id == dish then
            dinner = true
            break
        elseif currentItem.id == sandwich then
            breakfast = true
            break
        end
    end

    for i = 0, itemsOnField2 - 1 do
        currentItem = field2:getStackItem(i)
        if currentItem.id == soup then
            supper = true
            break
        elseif currentItem.id == dish then
            dinner = true
            break
        elseif currentItem.id == sandwich then
            breakfast = true
            break
        end
    end

    for i = 0, itemsOnField3 - 1 do
        currentItem = field3:getStackItem(i)
        if currentItem.id == soup then
            supper = true
            break
        elseif currentItem.id == dish then
            dinner = true
            break
        elseif currentItem.id == sandwich then
            breakfast = true
            break
        end
    end


    if breakfast and dinner and supper then
        return true
    end

    return false

end

function M.iraInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.iraPuzzle.german, puzzles.iraPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

function M.checkIraPosition(user)

    local iraPosition = position(475, 746, -3)

    local distance = 10

    local biggerX =  user.pos.x > iraPosition.x + distance
    local smallerX = user.pos.x < iraPosition.x - distance
    local biggerY =  user.pos.y > iraPosition.y + distance
    local smallerY = user.pos.y < iraPosition.y - distance

    if user.pos.z ~= iraPosition.z then
        return false
    end

    if biggerX or smallerX or biggerY or smallerY then
        return false
    end

    local sphere =  getSphere(iraPosition)

    lightSphere(user, sphere, true)

    return true

end

local function heptPuzzleSolved()

    local mainPos = position(266, 375, 1)
    local positionsToCheck = increaseArea.increaseArea(mainPos)
    local fireFound = false

    for _, currentPos in pairs(positionsToCheck) do
        local field = world:getField(currentPos.position)
        local itemsOnField = field:countItems()
        local currentItem
        local campfire = Item.campFire
        local magicFire = 359

        for i = 0, itemsOnField-1 do
            currentItem = field:getStackItem(i)
            if currentItem.id == campfire or currentItem.id == magicFire then
                fireFound = true
                break
            end
        end
    end

    return fireFound
end

function M.heptInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.heptPuzzle.german, puzzles.heptPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function fhenPuzzleSolved()

    local platePos = position(735, 317, 0)
    local field = world:getField(platePos)
    local itemsOnField = field:countItems()
    local currentItem
    local beerFound = false
    local wineFound = false

    local beers = {}

    local wineList = {}

    table.insert(wineList, Item.bottleOfElvenWine)

    for _, bottle in pairs(bottles.bottles) do
        if bottle.full[1] == Item.bottleOfElvenWine then
            for _, vessel in pairs(bottle.vessels) do
                table.insert(wineList, vessel.filled)
            end
        end
        if bottle.full[1] == Item.bottleOfBeer then
            for _, vessel in pairs(bottle.vessels) do
                table.insert(beers, vessel.filled)
            end
            for _, vessel in pairs(bottle.full) do
                table.insert(beers, vessel)
            end
        end
    end

    for i = 0, itemsOnField-1 do
        currentItem = field:getStackItem(i)
        for _, wine in pairs(wineList) do

            if currentItem.id == wine then
                wineFound = true
            end
        end

        for _, beer in pairs(beers) do

            if currentItem.id == beer then
                beerFound = true
            end
        end

        if beerFound and wineFound then
            return true
        end
    end

    return false

end

function M.fhenInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.fhenPuzzle.german, puzzles.fhenPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function fhanPuzzleSolved()

    local puzzle = {
        {solution = Item.chickenDish, solution2 = Item.chickenSoup, location = position(598, 321, 3)},
        {solution = Item.drowSword, solution2 = Item.drowBlade, location = position(598, 317, 3)},
        {solution = Item.pureFire, location = position(592, 317, 3)},
        {solution = Item.stone, location = position(592, 321, 3)},
    }

    local solved = 0

    for _, segment in pairs(puzzle) do

        local field = world:getField(segment.location)
        local itemsOnField = field:countItems()
        local currentitem

        for i= 0, itemsOnField-1 do --from lowest to highest item in stack
            currentitem = field:getStackItem(i)
            local solution2 = 488 --just a random impossible item

            if segment.solution2 then
                solution2 = segment.solution2
            end

            if currentitem.id == segment.solution or currentitem.id == solution2 then
                solved = solved+1
                break
            end
        end
    end

    if solved == 4 then
        solved = true
    else
        solved = false
    end

    return solved
end

function M.fhanInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.fhanPuzzle.german, puzzles.fhanPuzzle.english), callback)

    user:requestMessageDialog(dialog)

end

local function dunRequirementCheck(user)

    local mainPos = position(354, 454, 0)
    local pos1 = position(mainPos.x+1, mainPos.y+1, 0)
    local pos2 = position(mainPos.x-1, mainPos.y-1, 0)
    local pos3 = position(mainPos.x+1, mainPos.y-1, 0)
    local pos4 = position(mainPos.x-1, mainPos.y+1, 0)

    local locations1 = increaseArea.increaseArea(pos1)
    local locations2 = increaseArea.increaseArea(pos2)
    local locations3 = increaseArea.increaseArea(pos3)
    local locations4 = increaseArea.increaseArea(pos4)

    for _, location in pairs(locations1) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    for _, location in pairs(locations2) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    for _, location in pairs(locations3) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    for _, location in pairs(locations4) do
        local field = world:getField(location.position)
        local itemsOnField = field:countItems()
        if itemsOnField == 0 then
            return false
        end
    end

    return true

end

M.puzzles = puzzles

function M.dunInfo(user)

    local orcish =  user:getSkill(Character["orcLanguage"])


    local callback = function(dialog)
    end

    local english
    local german

    if orcish >= 80 then
        english = puzzles.dunPuzzle.english
        german = puzzles.dunPuzzle.german
    else
        english = puzzles.dunPuzzle.orcish.english
        german = puzzles.dunPuzzle.orcish.german
    end

    local dialog = MessageDialog("", common.GetNLS(user, german, english), callback)
    user:requestMessageDialog(dialog)

end

local function anthResult(user, answer)

    local status

    if answer == 1332 then
        status = "success"
        ScriptVars:set("anthActivate", 1)
        ScriptVars:save()
    else
        status = "wrong"
    end

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.anthPuzzle[status].german, puzzles.anthPuzzle[status].english), callback)

    user:requestMessageDialog(dialog)
end

function M.anthInfo(user, item)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()
        anthResult(user, tonumber(input))

    end

    local dialog = InputDialog("", common.GetNLS(user, puzzles.anthPuzzle.main.german, puzzles.anthPuzzle.main.english), false, 255, callback)

    user:requestInputDialog(dialog)

end

function M.checkPenPosition(user)

    local penPosition = position(786, 128, 0)

    local distance = 15

    local biggerX =  user.pos.x > penPosition.x + distance
    local smallerX = user.pos.x < penPosition.x - distance
    local biggerY =  user.pos.y > penPosition.y + distance
    local smallerY = user.pos.y < penPosition.y - distance

    if biggerX or smallerX or biggerY or smallerY then
        return false
    end

    local sphere =  getSphere(penPosition)

    lightSphere(user, sphere, true)

    return true

end

function M.penInfo(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog("", common.GetNLS(user, puzzles.penPuzzle.german, puzzles.penPuzzle.english), callback)

    user:requestMessageDialog(dialog)
end

local function getRune(item)
    for _, rune in pairs(runeHints) do
        if rune.location then
            if rune.location == item.pos then
                return rune
            end
        end
    end
    return false
end

local function learnRune(user, rune)

    teaching.checkForExpiredCooldowns(user)

    local runeNumber = runes.runeNameToNumber(rune)
    local levelCheck = teaching.levelRequirementNotMet(user, runeNumber)
    local statCheck = teaching.statRequirementNotMet(user, runeNumber)
    local notMage = teaching.notAMage(user)
    local knowsRune = runes.checkIfLearnedRune(user, false, runeNumber, "isQuest")

    if notMage then
        user:inform(runeHints.notMage.german, runeHints.notMage.english)
        return false
    end

    if knowsRune then
        user:inform(runeHints.alreadyKnows.german, runeHints.alreadyKnows.english)
        return true
    end

    if levelCheck or statCheck then
        user:inform(runeHints.notMetCriteria.german, runeHints.notMetCriteria.english)
        return false
    end

    if teaching.notEnoughTimeHasPassed(user) then
        user:inform(runeHints.cooldown.german, runeHints.cooldown.english)
        return false
    end
    runes.learnRune(user,"", runeNumber, "isQuest")
    teaching.setLearningCooldown(user)
    user:inform(runeHints.learned.german..rune, runeHints.learned.english..rune)
    return true
end

function lightSphere(user, item, lit)
    local newItemId

    if lit then
        newItemId = 3501
    else
        newItemId = 3499
    end
    world:erase(item, item.number)
    local theSphere = world:createItemFromId(newItemId, 1, item.pos, true, 999, {})
    if lit then
        theSphere.wear = 4
    else
        theSphere.wear = 255
    end

    world:changeItem(theSphere)
end

local portalLocations = {
    {destination = position(342, 150, 1), origin = position(411, 159, 1), lever = position(409, 158, 1)},
    {destination = position(410, 159, 1), origin = position(343, 151, 1), lever = position(343, 150, 1)},
    {destination = position(410, 159, 1), origin = position(337, 161, 1), lever = position(337, 160, 1)},
    {destination = position(855, 242, -3), origin = position(749, 321, 0), lever = position(750, 321, 0)},
    {destination = position(749, 322, 0), origin = position(856, 242, -3), lever = position(855, 243, -3)},
    {destination = position(181, 809, -3), origin = position(230, 711, 0), lever = position(229, 711, 0)},
    {destination = position(230, 712, 0), origin = position(180, 809, -3), lever = position(180, 808, -3)},
    {destination = position(116, 893, -3), origin = position(800, 658, 2), lever = position(801, 657, 2)},
    {destination = position(801, 658, 2), origin = position(118, 893, -3), lever = position(117, 892, -3)}
}

local function createPortal(user, portalPos)

    for _, location in pairs(portalLocations) do
        if location.origin == portalPos then
            local field = world:getField(portalPos)
            local itemsOnField = field:countItems()
            local topItem = field:getStackItem(itemsOnField-1)
            if topItem.id ~= 10 then
                local destination = location.destination
                world:makeSound(13, destination)
                local thePortal = world:createItemFromId(10, 1, portalPos, true, 999, {destinationCoordsZ = destination.z, destinationCoordsY = destination.y, destinationCoordsX = destination.x})
                thePortal.wear = 3
                world:changeItem(thePortal)
            elseif topItem.id == 10 then
                world:erase(topItem, 1)
            end
            break
        end
    end
end

function M.useLever(user, lever)

    local lever1 = 436
    local lever2 = 434
    local lever3 = 437
    local lever4 = 439

    for  _, currentLever in pairs(portalLocations)  do
        if currentLever.lever == lever.pos then
            createPortal(user, currentLever.origin)
            local newLeverId = 0

            if lever.id == lever1 then
                newLeverId = lever2
            elseif lever.id == lever2 then
                newLeverId = lever1
            elseif lever.id == lever3 then
                newLeverId = lever4
            elseif lever.id == lever4 then
                newLeverId = lever3
            end
            lever.id = newLeverId
            world:changeItem(lever)
        end
    end
end

function M.leverPosCheck(lever)

    for  _, currentLever in pairs(portalLocations) do
        if currentLever.lever == lever.pos then
            return true
        end
    end

    return false

end

local function cunPuzzleSolved()

    local waterItems = {52, 1841, 1854, 1855, 2058, 2186, 2496, 2554}
    local solved = false
    local platePos = position(628, 598, 0)
    local field = world:getField(platePos)
    local itemsOnField = field:countItems()
    local currentitem

    for i= 0, itemsOnField-1 do --from lowest to highest item in stack
        currentitem = field:getStackItem(i)
        for _, water in pairs(waterItems) do
            if currentitem.id == water then
                solved = true
                break
            end
        end
    end

    return solved
end

local function checkIfCriteriaMet(user, rune)

    local retVal = false

    if rune == "CUN" then
        if cunPuzzleSolved() then
            retVal = true
        end
    elseif rune == "ANTH" then
        local success, anthActivate = ScriptVars:find("anthActivate")
        if success then
            if tonumber(anthActivate) == 1 then
                ScriptVars:set("anthActivate", 0)
                ScriptVars:save()
                retVal = true
            end
        end
    elseif rune == "DUN" then
        if dunRequirementCheck(user) then
            retVal = true
        end
    elseif rune == "FHAN" then
        if fhanPuzzleSolved() then
            retVal = true
        end
    elseif rune == "FHEN" then
        if fhenPuzzleSolved() then
            retVal = true
        end
    elseif rune == "HEPT" then
        if heptPuzzleSolved() then
            retVal = true
        end
    elseif rune == "KAH" then
        if kahPuzzleSolved() then
            retVal = true
        end
    elseif rune == "KEL" then
        if user:getQuestProgress(242) == 1 then
            retVal = true
            user:setQuestProgress(242, 0)
        end
    elseif rune == "LEV" then
        if passesLevPuzzle() then
            resetLevPuzzle()
            retVal = true
        end
    elseif rune == "MES" then
        if checkMesPuzzle() then
            retVal = true
        end
    elseif rune == "ORL" then
        if passesOrlPuzzle(user) then
            retVal = true
        end
    elseif rune == "PERA" then
        if passedPeraPuzzle(user) then
            retVal = true
        end
    elseif rune == "BHONA" then
        if user:getQuestProgress(244) == 18 then
            retVal = true
        end
    elseif rune == "LUK" then
        local progress = user:getQuestProgress(245)
        if progress == 1 then
            user:inform(puzzles.lukPuzzle.denounced.german, puzzles.lukPuzzle.denounced.english)
            return true
        elseif progress == 2 then
            user:inform(puzzles.lukPuzzle.praised.german, puzzles.lukPuzzle.praised.english)
            return true
        end
    elseif rune == "PHERC" then
        if passesPhercPuzzle() then
            retVal = true
        end
    elseif rune == "QWAN" then
        local success, qwanActivate = ScriptVars:find("qwanActivate")
        if success then
            if tonumber(qwanActivate) == 1 then
                ScriptVars:set("qwanActivate", 0)
                ScriptVars:save()
                retVal = true
            end
        end
    elseif rune == "SAV" then
        if savPuzzleSolved() then
            retVal = true
        end
    elseif rune == "SIH" then
        if passesSihPuzzle() then
            retVal = true
        end
    elseif rune == "YEG" then
        if passesYegPuzzle(user) then
            retVal = true
        end
    elseif rune == "SUL" then
        if passesSulPuzzle(user) then
            retVal = true
        end
    elseif rune == "URA" then
        if uraPuzzleSolved() then
            retVal = true
        end
    elseif rune == "TAUR" or rune == "PEN" or rune == "IRA" or rune == "TAH" or rune == "LHOR" then --they are solved elsewhere
        retVal = false
    else --Any remaining puzzles will only require you to find, get to and use the sphere to activate it
        retVal = true
    end

    if retVal then
        user:inform(runeHints.activated.german, runeHints.activated.english)
    end

    return retVal
end

function M.LookAtItem(user, item)

    local lookAt = lookat.GenerateLookAt(user, item)

    local rune = getRune(item)

    if rune then
        if item.id == 3501 then
            lookAt.name= common.GetNLS(user, rune.name.german , rune.name.english )
            lookAt.description = common.GetNLS(user, rune.description.german, rune.description.english)
        else
            lookAt.name = common.GetNLS(user, runeHints.unlitSphere.german, runeHints.unlitSphere.english)
        end
    end


    return lookAt
end

function M.UseItem(user, item)

    local rune = getRune(item)

    if rune then
        if item.id == 3501 then
            local success = learnRune(user, rune.rune)
            lightSphere(user, item, false)
            if rune.rune == "RA" then
                if user:getQuestProgress(237) == 1 and success then -- If they are on the quest we also make sure they learned the rune so they do not progress onwards without actually knowing the spell
                    user:setQuestProgress(237, 2)
                end
            end
        elseif item.id == 3499 then
            if checkIfCriteriaMet(user, rune.rune) then
                lightSphere(user, item, true)
            else
                user:inform(runeHints.unsolved.german, runeHints.unsolved.english)
            end
        end
    end

end

return M
