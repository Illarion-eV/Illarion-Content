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

local runes = require("magic.arcane.runes")
local teaching = require("magic.arcane.teaching")
local common = require("base.common")
local lookat = require("base.lookat")
local citizenLedger = require("content.citizenLedger")

local M = {}

M.runeHintsBookTexts = {
    CUN =  {rune = "CUN",
        hint = {
            english = "Near the ruins of a mother praised lies the secret of water.",
            german = "In der Nähe der Ruinen einer gelobten Mutter liegt das Gehemnis des Wassers."},
        name = {
            english = "Mysterious Blue Sphere",
            german = "Mysteriöse blaue Sphäre"},
        description = {
            english = "A mysterious glass sphere that appears to contain it's own ocean of water.",
            german = "Eine mysteriöse, gläserne Sphäre. Es scheint als würde sie ein ganzes Meer beinhalten."},
        location = position(630,599,0)},
    JUS = {rune = "JUS",
        hint = {
            english = "Up high where wind and ocean meet, with fuzzy creatures at your feet.",
            german = "Hoch oben, wo sich Wind und Meer treffen, mit flauschigen Geschöpfen zu deinen Füßen."},
        name = {
            english = "Windy Mysterious  Sphere",
            german = "Mysteriöse windige Sphäre"},
        description = {
            english = "A mysterious glass sphere that appears to be full of blowing wind.",
            german = "Eine mysteriöse, gläserne Sphäre. Es scheint als wäre sie voll mit stürmendem Wind. "},
        location = position(329,156,1)},
    PEN = {rune = "PEN",
        hint = {
            english = "In a place a hermit might call home, you'll find a hidden tome.",
            german = "Am Ort den der Einsiedler sein Zuhause nennt, dort findest du den hellsten Geist."},
        name = {
            english = "Mysterious Spiritual Sphere",
            german = "Mysteriöse strahlende Sphäre"},
        description = {
            english = "A mysterious glass sphere that contains a bright spiritual light.",
            german = "Eine mysteriöse, gläserne Spähre, die ein strahlendes Licht enthält. Wie ein strahlender Geist."},
        location = position(786,128,0)},
    RA = {rune = "RA",
        hint = {
            english = "A lone man betwixt the desert dry and forest lush guards the secret of the flame. Tis not the man you seek, but the hidden entrance to the rune itself.",
            german = "Ein einsamer Mann zwischen der trockenen Wüste und dem üppigen Wald hütet das Gehemnis des Feuers. Dies ist nicht der Mann, den du suchst, sondern der verborgene Eingang zur Rune selbst."},
        name = {
            english = "Mysterious Fiery Sphere",
            german = "Mysteriöse feurige Sphäre"},
        description = {
            english = "A mysterious glass sphere that appears to be full of flickering flames. It doesn't appear to give off any heat, though.",
            german = "Eine mysteriöse, gläserne Sphäre. Es scheint als würde sie im Inneren brennen. "},
        location = position(471,768,0)},
    SOLH = {rune = "SOLH",
        hint = {english = "Deep below and long forgotten, a garden lush with guards that are rotten.",
            german = "Tief unten und längst vergessen, ein Garten voller Wächter die schon längst zerfressen."},
        name = {
            english = "Mysterious Earthy Sphere",
            german = "Mysteriöse erdige Sphäre"},
        description = {
            english = "A mysterious sphere that appears to contain a deep, dark soil",
            german = " Eine mysteriöse, gläserne Sphäre. Es scheint als würde sie dunkle, schwarze Erde beinhalten."},
        location = position(793,297,-3)},
    BHONA = {rune = "BHONA",
        hint = {
            english = "Back to where you started, after you first departed.",
            german = "Zurück dorthin, als du einst gingst."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Within the sphere you spot two vague figures. One stands before the other, appearing to be preaching. The latter appears to be kowtowing in a show of piety towards the former.",
            german = "Im Inneren der Sphäre erkennen Sie zwei vage Gestalten. Die eine steht vor der anderen und scheint zu predigen. Letztere scheint sich vor der ersteren in einem Anflug von Frömmigkeit zu verneigen."},
        location = position(469, 869 , -9)},
    ANTH = {rune = "ANTH",
        hint = {
            english = "An enormous structure, static as can be. Were it not, a flood you would see.",
            german = "Ein gigantisches Bauwerk so unbeweglich. Wäre es nicht, die Flut würdest du sehen. "},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Within the sphere various objects can be seen, but what they all have in common is that they stand perfectly still. One could even call them static.",
            german = "Innerhalb der Sphäre kannst du die unterschiedlichsten Objekte erkennen. Eines haben sie alle gemeinsam, sie stehen vollkommen still. Man könnte sie auch statisch nennen. "},
        location = position(843, 216 , -3)},
    DUN = {rune = "DUN",
        hint = {
            english = "In an area vast and empty, where white hands rule.",
            german = "In einem weiten und leeren Gebiet, in dem die weiße Hand regiert."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "The sphere reveals the scene of a vast empty land.",
            german = "Die Kugel zeigt das Bild eines weiten, leeren Landes."},
        location = position(354, 454, 0)},
    FHAN = {rune = "FHAN",
        hint = {
            english = "Among a castle of bones, you'll find what you desire.",
            german = "In einem Schloss aus Knochen wirst du findet was du suchst."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "The sphere contains an eerie magical fog that seems to attempt to get away from you.",
            german = "Die Sphäre enthält einen unheimlichen magischen Nebel, der zu versuchen scheint, von dir wegzukommen."},
        location = position(595, 319, 3)},
    FHEN = {rune = "FHEN",
        hint = {
            english = "Where trolls seek haven and drink fine wine, out in the garden do we dine.",
            german = "Wo Trolle Zuflucht suchen und besten Wein versuchen, dort im Garten speisen wir."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "The sphere contains an eerie magical fog that seems to attempt to get closer to you.",
            german = "Die Sphäre enthält einen unheimlichen magischen Nebel, der zu versuchen scheint, sich dir zu nähern."},
        location = position(736,317,0)},
    HEPT = {rune = "HEPT",
        hint = {
            english = "In a cold place oh so high. Watch out, or you'll freeze.",
            german = "Ein Ort so kalt und hoch. Pass auf, dort erfrierst du noch!"},
        name = {
            english = "Mysterious Frosty Sphere",
            german = "Mysteriöse vereiste Sphäre"},
        description = {
            english = "Inside the sphere you see what resembles as snowstorm swirling about with the occasional hail",
            german = "Im Inneren der Sphäre sieht man etwas, das wie ein Schneesturm aussieht, der mit gelegentlichem Hagel umherwirbelt"},
        location = position(266,375,1)},
    IRA = {rune = "IRA",
        hint = {
            english = "Creatures not of nature, how many eyes does this one have?",
            german = "Wieviele Augen hat diese Kreatur, entspringt sicher nicht der Natur!"},
        name = {
            english = "Mysterious Eye-shaped Sphere",
            german = "Mysteriöse augenförmige Sphäre"},
        description = {
            english = "As you peer into the sphere you feel like you can see a pupil peering right back at you.",
            german = "Als du in die Sphäre starrst, fühlt es sich so an als würde eine Pupille direkt zurückstarren."},
        location = position(475, 746, -3)},
    KAH = {rune = "KAH",
        hint = {
            english = "If a mortal were to require sustenance, much could be found here.",
            german = "Dort wo sterbliche Stärkung suchen, dort findet man viel."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "As you peer into the sphere you see a steaming hot pie, so life-like you can almost smell it.",
            german = "Beim Blick in die Sphäre siehst du einen heiß dampfenden Kuchen, so lebensecht, das du ihn fast riechen kannst."},
        location = position(794 , 804, 0)},
    KEL = {rune = "KEL",
        hint = {
            english = "Where dark creatures of flight reside.",
            german = "Dort wo dunkle geschöpfe des Himmels hausen."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "As you peer into the sphere you see a feather, though before you can determine what kind of feather it is, you witness it change into a dragon wing.",
            german = "Als du in die Sphäre blickst, siehst du eine Feder. Doch bevor du feststellen kannst, um was für eine Feder es sich handelt, wirst du Zeuge, wie sie sich in einen Drachenflügel verwandelt"},
        location = position(711,619,-6)},
    LEV = {rune = "LEV",
        hint = {
            english = "Once a glorious combat academy, now left in ruins. Oh the changes of time.",
            german = "Einst eine stolze Kampfakademie, nun nur mehr Ruinen. Wie die Zeit sich ändert."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "If you peer into the sphere, you would witness an ever-changing scenery. A desert in one moment, the next a tundra, it constantly shows you new, unique sights.",
            german = "Wenn du in die Sphäre blickst wirst du Zeuge einer sich ständig verändernden Landschaft. In einem Moment ist es eine Wüste, im nächsten eine Tundra, sie zeigt dir ständig neue, einzigartige Anblicke."},
        location = position(188, 809, -3)},
    LHOR = {rune = "LHOR",
        hint = {
            english = "Trick you, fool you, lead you astray. Who am I?",
            german = "Ich betrüge, ich täusche ich führe dich in die Irre. Wer bin ich?"},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "An illusory raven is sat inside the sphere, cleaning its wings with its beak.",
            german = "Im Innern der Sphäre sitzt ein fiktiver Rabe, der sich mit seinem Schnabel die Flügel putzt."},
        location = position(781, 438, 0)},
    LUK = {rune = "LUK",
        hint = {
            english = "Among hostile elves, down down we go.",
            german = "Unter feindesligen Elfen, tief tief runter müssen wir."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "A bloodshot eye appears to be peering back out at you from inside the sphere.",
            german = "Ein blutunterlaufenes Auge scheint dich aus dem Inneren der Kugel heraus anzustarren."},
        location = position(564, 542 , -6)},
    MES = {rune = "MES",
        hint = {
            english = "I light the way for those of wood adrift, seeking the glow that marks safe passage.",
            german = "Ich erhelle den Weg für jene aus Holz, die treiben, auf der Suche nach dem Leuchten, das sichere Passage weist."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "The sphere gives off a warm, radiant light.",
            german = "Die Sphäre gibt ein warmes, strahlendes Licht ab."},
        location = position(537, 612, 1)},
    ORL = {rune = "ORL",
        hint = {
            english = "Created from an egg. Creepy, crawly, eight legged friends.",
            german = "Zuerst ein Ei. Gruselige, krabbelnde, achtbeinige....."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "The sphere appears as if full of tiny little spiders, desperately trying to make their way out to get to you.",
            german = "Die Sphäre sieht aus, als wäre sie voller winziger kleiner Spinnen. Sie versuchen verzweifelt sich einen Weg nach draußen zu bahnen um dich zu erwischen."},
        location = position(907, 487, -6)},
    PHERC = {rune = "PHERC",
        hint = {
            english = "The pain of the desert heat is nigh as high as the pain of their axes.",
            german = "Der Schmerz der Wüstenhitze ist fast so groß wie der Schmerz der Axt!"},
        name = {
            english = "Mysterious Bloody Sphere",
            german = "Mysteriöse blutverschmierte Sphäre"},
        description = {
            english = "A grotesque scene full of blood and gore meet you as you peer into the sphere.",
            german = "Beim Blick in die Sphäre bietet sich dem Betrachter eine groteske Szene voller Blut und Qualen."},
        location = position(80, 431, -6)},
    QWAN = {rune = "QWAN",
        hint = {
            english = "On a mountain up high, where creatures of stone reside.",
            german = "Hoch in den Bergen, bei Kreaturen aus Stein."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Within the sphere lies a lone, huge-looking boulder... or is it a pebble?",
            german = "In der Sphäre liegt ein einsamer, riesig wirkender Felsbrocken... oder ist es ein Kieselstein?"},
        location = position(241, 776, 1)},
    SAV = {rune = "SAV",
        hint = {
            english = "In a firey castle where dragons reside below.",
            german = "Ein brennendes Schloss in dem die Drachen hausen."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Within the sphere you can see a majestic looking shield.",
            german = "Im Inneren der Sphäre ist ein majestätisch aussehender Schild zu sehen."},
        location = position(111 , 887, -3)},
    SIH = {rune = "SIH",
        hint = {
            english = "Near water claimed by some to be capable of healing your very soul.",
            german = "In der Nähe des Wasser so rein, es könne die Seele heilen."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "The sphere gives off a feeling of warmth and wellness.",
            german = "Die Sphäre strahlt ein Gefühl von Wärme und Wohlbefinden aus."},
        location = position(783 , 262, -8)},
    SUL = {rune = "SUL",
        hint = {
            english = "Rotten, smelly and cursed to be slow. Such is the fate of a civilization that met its demise.",
            german = "Stinkend, verrottet zum Stillstand verflucht. Das Schicksal einer Zivilisation die ihren Untergang fand. "},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Peering into the sphere, you'd see the shadow of figures passing by ever so slowly.",
            german = "Wenn man in die Sphäre hineinschaut, sieht man die Schatten von Gestalten, die ganz langsam vorüberziehen."},
        location = position(937, 391, -3)},
    TAH = {rune = "TAH",
        hint = {
            english = "Steal from the rich, give to the poor... as long as the poor are they themselves.",
            german = "Ich stehle von den Reichen und gebe den Armen...bin doch ich der Ärmste."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Peering into the sphere, you see yourself but upside down.",
            german = "Wenn du in die Kugel schaust, siehst du dich selbst, aber auf dem Kopf stehend."},
        location = position(14, 522, 0)},
    TAUR = {rune = "TAUR",
        hint = {
            english = "This secret is guarded by creatures that dwell in a cave. What do they look like, you ask? Do they have one head? Two? Are they ugly and deranged?",
            german = "Dieses Geheimnis wird von Kreaturen bewacht die tief in Höhlen leben. Wie sehen sie aus fragst du? Haben sie einen Kopf? Zwei? Sind sie hässlich und verstört?"},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Within the sphere you see the silhouette of a humanoid being, though it quickly changes form into that of various other creatures one by one.",
            german = "In der Sphäre sieht man die Silhouette eines humanoiden Wesens, das jedoch schnell die Form verschiedener anderer Kreaturen annimmt."},
        location = position(179, 550, 0)},
    URA = {rune = "URA",
        hint = {
            english = "Where the guardians of nature reside",
            german = "Dort wo die Hüter der Natur wohnen."},
        name = {
            english = "Mysterious Mossy Sphere",
            german = "Mysteriöse moosbewachsene Sphäre"},
        description = {
            english = "Within the sphere you can see the picturesque image of nature in its barest, most untouched form.",
            german = "In der Sphäre kann man das malerische Bild der Natur in ihrer ursprünglichsten, unberührten Form sehen."},
        location = position(827 , 156, 0)},
    YEG = {rune = "YEG",
        hint = {
            english = "Muddy, grimey and full of despair. This place is not natural, of death beware.",
            german = "Schlammig, schmutzig und voller Verzweiflung. Dieser Ort ist nicht natürlich. Hüte dich vor dem Tod."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "Peering into the sphere, a vision of death and decay meet you. Are you just imagining it, or can you also hear the terrifying wails of the tortured dead?",
            german = "Wenn du in die Sphäre blickst, bietet sich dir eine Vision von Tod und Verwesung. Bildest du dir das nur ein, oder hörst du auch die schrecklichen Schreie der gequälten Toten?"},
        location = position(793, 576, 0)},
    PERA = {rune = "PERA",
        hint = {
            english = "Found in a place where a competition of speed is famously held.",
            german = "Dort an jenem Ort wo die Wettkämpfe der Schnellsten ausgetragen werden."},
        name = {
            english = "Mysterious Sphere",
            german = "Mysteriöse Sphäre"},
        description = {
            english = "All you can see within the sphere is a figure moving so fast it has become nothing but a blurry shadow.",
            german = "Alles, was du in der Sphäre sehen kannst ist eine Figur, die sich so schnell bewegt, dass sie nur noch ein verschwommener Schatten ist."},
        location = position(391, 137, 0)},
    unlitSphere = {
        english = "Empty glass sphere",
        german = "Leere gläserne Sphäre"},
    knowAll = {
        english = "There does not appear to be any knowledge in this book that you do not already know.",
        german = "Dieses Buch enthält kein Wissen, dass du nicht schon kennst."},
    requirementNotMet = {
        english = "While this book contains knowledge unfamiliar to you, it seems beyond your ability to comprehend at this moment.",
        german = "Ein Buch voller Wissen. Doch es ist jenseits deiner Fähigkeiten es zu verstehen."},
    bookName = {
        english = "Mysterious Book",
        german = "Mysteriöses Buch"},
    bookDescription = {
        english = "An old, faded looking book full of scribbles only some may understand.",
        german = "Ein altes, verblasstes Buch voller Kritzeleinen die wohl nur die Wenigsten verstehen."},
    selectRune = {
        english = "Select the name of the rune you wish to locate.",
        german = "Wähle den Namen der Rune die du suchen möchstest."},
    unsolved = {
        english = "The sphere has no reaction to your touch. Perhaps there is something in the area that can change this?",
        german = "Als du die Sphäre berührst passiert...nichts. Möglicherweise befindet sich etwas in der Nähe, dass dies ändern könnte."},
    unwise = {
        english = "It hasn't been long enough since you last learned a rune, making it unwise to go searching for a new one. You may only learn two runes every other week. ",
        german = "Es ist noch nicht lange her, dass du nach einer Rune gesucht hast. Es wäre nicht klug jetzt schon wieder eine Neue zu suchen. Du kannst alle zwei Wochen nur zwei Runen erlernen. "},
    activated = {
        english = "With a sudden glow the sphere lights up, revealing to you the sights within.",
        german = "Mit einem plötzlichen Erstrahlen leichtet die Sphäre auf und enhüllt ihre Gehemnisse."},
    learned = {
        english = "You feel a sudden surge of information enter your mind, it appears you just learned how to use the rune ",
        german = "Eine Welle von Informationen durchflutet deinen Geist. Du hast verstanden wie du die Rune nutzen kannst."},
    cooldown = {
        english = "Not enough time has passed since you last learned a rune. You feel a headache just thinking about learning a new one.",
        german = "Es ist noch nicht genug Zeit vergangen seit du die letzte Rune gelernt hast. Allein der Gedanke an eine neue Rune bereitet dir Kopfschmerzen."},
    notMetCriteria = {
        english = "As you touch the sphere, you get the feeling that you are not well versed enough or perhaps even talented enough at magic to learn the rune.",
        german = "Als du die Sphäre berührst fühlst du dich völlig überwältigt. Du hast das Gefühl, dass du noch viel lernen musst bevor du dieses Wissen aufnehmen kannst. Vielleicht bist du auch nicht talentiert genug um es je zu verstehen."},
    notMage = {
        english = "As you touch the sphere, it has no reaction other than returning to its dim state.",
        german = "Als du die Sphäre berührst passiert....nichts. Sie hört einfach auf zu Leuchten."},
    alreadyKnows = {
        english = "While the magical information enters your mind, you discover nothing new. You already know how to use this rune.",
        german = "Als die Welle an Informationen auf dich trifft, ist dir das Wissen schon vertraut. Du kennst diese Rune bereits."}
}

local myTexts = M.runeHintsBookTexts

local function knowAllRunes(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog(common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english), common.GetNLS(user, myTexts.knowAll.german, myTexts.knowAll.english), callback)

    user:requestMessageDialog(dialog)

end

local function tooAdvanced(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog(common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english), common.GetNLS(user, myTexts.requirementNotMet.german, myTexts.requirementNotMet.english), callback)

    user:requestMessageDialog(dialog)

end

local function checkIfKnowAllRunes(user)

    for _, rune in pairs(runes.runes) do
        if not runes.checkIfLearnedRune(user, false, rune.id, "isQuest") and rune.active then
            return false
        end
    end

    return true

end

local function listOfRunes(user)

    local list = {}

    for _, rune in pairs(runes.runes) do
        local statsOk = false
        local statReq = runes.getStatRequirementOfRune(rune.id)
        local targetStatTotal = user:increaseAttrib("willpower", 0) + user:increaseAttrib("essence", 0) + user:increaseAttrib("intelligence", 0)

        if tonumber(targetStatTotal) >= tonumber(statReq) then
            statsOk = true
        end

        local skillOk = false
        local levelReq = runes.getLevelRequirementOfRune(rune.id)
        local targetLevel = teaching.getTargetsMagicLevels(user, rune.id)

        if targetLevel >= levelReq then
            skillOk = true
        end

        local notLearned = false
        if not runes.checkIfLearnedRune(user, false, rune.id, "isQuest") then
            notLearned = true
        end

        if notLearned and skillOk and statsOk and rune.active then
            list[#list+1] = rune.name
        end
    end

    return list

end

local function checkIfTooAdvanced(user)

    local runeList = listOfRunes(user)

    if #runeList > 0 then
        return false
    else
        return true
    end

end

local function runeHint(user, runeName)

    local callback = function(dialog)
    end

    local dialog = MessageDialog(common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english), common.GetNLS(user, myTexts[runeName].hint.german, myTexts[runeName].hint.english), callback)

    if runeName == "BHONA" then
        if user:getQuestProgress(244) == 0 then
            user:setQuestProgress(244, 1)
        end
    end
    user:requestMessageDialog(dialog)

end

local function convertUnixTime(unixTime) -- Unixtime is the stored date of when it is possible to learn runes again

    local currentTime = tonumber(world:getTime("unix"))

    local timeRemaining = unixTime - currentTime

    local weeks = math.floor(timeRemaining / 604800)
    timeRemaining = timeRemaining % 604800
    local days = math.floor(timeRemaining / 86400)
    timeRemaining = timeRemaining % 86400
    local hours = math.floor(timeRemaining / 3600)
    timeRemaining = timeRemaining % 3600
    local minutes = math.floor(timeRemaining / 60)
    local seconds = timeRemaining % 60
    return weeks, days, hours, minutes, seconds
end

-- Example usage


local function cooldownMessage(user)

    teaching.checkForExpiredCooldowns(user)

    local notEnoughTime, time = teaching.notEnoughTimeHasPassed(user)

    if notEnoughTime then
        return
    end

    local weeks, days, hours, minutes, seconds = convertUnixTime(time)

    local remainingTime = {}

    local english = "There's"
    local german = "Es verbleiben"

    if weeks > 0 then
        english = english.." "..weeks.." week"
        german = german.." "..weeks.." Woche"
    end

    if days > 0 then
        if weeks > 0 then
            english = english..","
            german = german..","
        end
        english = english.." "..days.." days"
        german = german.." "..days.." Tage"
    end

    if hours > 0 then
        if weeks > 0 then
            english = english..","
            german = german..","
        end
        english = english.." "..hours.." hours"
        german = german.." "..hours.." Stunden"
    end

    if minutes > 0 then
        if weeks > 0 or days > 0 or hours > 0 then
            english = english..","
            german = german..","
        end
        english = english.." "..minutes.." minutes"
        german = german.." "..minutes.." Minuten"
    end

    if weeks > 0 or days > 0 or hours > 0 or minutes > 0 then
        english = english.." and"
        german = german.." und"
    end

    remainingTime.english = english.." "..seconds.." seconds remaining until you can learn another rune."
    remainingTime.german = german.." "..seconds.." Sekunden, bis du eine weitere Rune lernen kannst."

    user:inform(myTexts.unwise.german..remainingTime.german, myTexts.unwise.english..remainingTime.english)

end

local function selectRune(user)

    local runeList = listOfRunes(user)

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        for i = 1, #runeList do
            if index == i then
                runeHint(user, runeList[i])
                return
            end
        end
    end
    local dialog = SelectionDialog(
        common.GetNLS(user,
            myTexts.bookName.german,
            myTexts.bookName.english),
        common.GetNLS(user,
            myTexts.selectRune.german,
            myTexts.selectRune.english),
        callback)

    for i = 1, #runeList do
        dialog:addOption(0, runeList[i])
    end

    user:requestSelectionDialog(dialog)

end

local bookPosition = position(655, 315, 0)

function M.UseItem(user, sourceItem)

    if citizenLedger.isCitizenLedger(sourceItem) then
        return citizenLedger.UseItem(user, sourceItem)
    end

    if sourceItem.pos ~= bookPosition then
        return
    end

    if runes.checkIfLearnedRune(user, false, 4, "isQuest") and user:getQuestProgress(237) == 1 then
        user:setQuestProgress(237, 2) --Workaround to skip the step of learning RA if you learned it before starting the tutorial, as NPC scripts can not check if you know it or not
    end

    if checkIfKnowAllRunes(user) then
        knowAllRunes(user)
        return
    end

    if checkIfTooAdvanced(user) then
        tooAdvanced(user)
        return
    end

    cooldownMessage(user)

    selectRune(user)

end

function M.LookAtItem(user, item)

    if citizenLedger.isCitizenLedger(item) then
        return citizenLedger.LookAtItem(user, item)
    end

    local lookAt = lookat.GenerateLookAt(user, item)
    if item.pos == bookPosition then
        lookAt.name = common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english)
        lookAt.description = common.GetNLS(user, myTexts.bookDescription.german, myTexts.bookDescription.english)
    end

    return lookAt
end

return M
