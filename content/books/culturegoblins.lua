require("base.books")

module("content.books.culturegoblins", package.seeall)

-- This file contains the book data for the book "Goblin Culture"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);

    base.books.AddEnglishBookText("\n \n Goblin Culture",0,0,toData);
    base.books.AddEnglishBookText("We, the goblins, are somewhat related to orcs I think. Though, we are more agile and a bit smarter, of course. We have big eyes, ears, and mouths. Our whole body is covered in short fur.",0,0,toData);
    base.books.AddEnglishBookText("Though, our faces have a leathery greenish skin. We have squeaky voices, or so I am told. I once was compared to a baby crying or whining for something he just lost. I don't believe it.",0,0,toData);
    base.books.AddEnglishBookText("We are somewhat small, and not too strong. We live in loose families and leadership varies from one another. We are not evil, no, but we aren't boring and do not like boring religions.",0,0,toData);
    base.books.AddEnglishBookText("I've been told I dress rather badly and sometimes smell, but I don't think so. Also, that my eating habits are bad and what I eat is not tasty, but I find it rather delicious.",0,0,toData);
    base.books.AddEnglishBookText("Apparently a well aged, rusty dagger isn't food to humans, but they should try it some time.",0,0,toData);
    base.books.AddEnglishBookText("Sometimes we are caught and enslaved by orcish tribes, we try to stay away from them though. We scare easily, but not to halflings, they aren't scary at all. Not like a tall elf.",0,0,toData);
    base.books.AddEnglishBookText("We have great smell and taste, and are very good with our hands. We make good alchemists and craftsmen, or even thiefs. I am not one though, I swear.",0,0,toData);
    base.books.AddEnglishBookText("We don't like magic, but some are talented in it. I hear there is this wise high lor-angurian mage. Maybe, it could just be a rumor!",0,0,toData);
    base.books.AddEnglishBookText("We don't live in towns, but small camps. Some people find these camps dangerous, I don't know why. Throwing a rock at someone with a sling isn't that bad!",0,0,toData);
    base.books.AddEnglishBookText("In Albar, us goblins are forced to fight other animals. Sometimes we are just used as slaves though, poor goblins.",0,0,toData);
    base.books.AddEnglishBookText("Sometimes, I hear, we live in Gynkese communities, or even Salkamaerian one. We work as servants, messengers, or merchants there. Sometimes, even as alchemists!",0,0,toData);

    base.books.AddGermanBookText("\n \n Das Volk der Goblins",0,0,toData);
    base.books.AddGermanBookText("Wir, die Goblins, stehen in einer gewissen Beziehung zu Orks, glaube ich. Sicher, wir sind flinker und gewitzter. Wir haben große Augen, Ohren und Mï¿½nder. Unser ganzer Körper ist mit einem Kurzhaarfell bedeckt.",0,0,toData);
    base.books.AddGermanBookText("Unser Gesicht weist eine grï¿½ne lederartige Haut auf. Man sagt auch, wir besï¿½ï¿½en eine Fistelstimme. Ich wurde mal mit einem Sï¿½ugling verglichen, der heult, weil er seinen Schnuller verloren hat. Was soll's.",0,0,toData);
    base.books.AddGermanBookText("Wir sind etwas klein und nicht gerade sehr stark und leben in lockeren Familienbanden, deren Fï¿½hrung sich untereinander stark unterscheidet. Wir sind nicht bï¿½se, nein, aber auch nicht auf den Kopf gefallen und wir mï¿½gen keine langweiligen Religionen.",0,0,toData);
    base.books.AddGermanBookText("Man sagt, ich würde mich schrecklich kleiden und manchmal auch muffeln, aber das glaube ich nicht. Auch dass meine Essmanieren schlecht wï¿½ren, sagt man, und das was ich esse sei nicht schmackhaft - also ich finde es kï¿½stlich.",0,0,toData);
    base.books.AddGermanBookText("Offenbar ist ein gut gereifter rostiger Dolch keine Nahrung für Menschen, aber deshalb sollten sie so etwas trotzdem mal kosten.",0,0,toData);
    base.books.AddGermanBookText("Bisweilen werden wir eingefangen und von Ork-Horden versklavt, deshalb versuchen wir, ihnen aus dem Weg zu gehen. Wir erschrecken uns leicht, natürlich nicht vor Halblingen, die sind ja auch gar nicht schrecklich. Nicht so wie diese riesigen Elben.",0,0,toData);
    base.books.AddGermanBookText("Geruch und Geschmack sind bei uns stark ausgeprï¿½gt, und wir sind sehr geschickt mit den Hï¿½nden. Wir geben gute Alchemisten ab oder Handwerker, sogar Diebe. Aber ich bin natürlich keiner, das schwï¿½re ich.",0,0,toData);
    base.books.AddGermanBookText("Wir mï¿½gen keine Magie, aber einige von uns haben wohl Talent dazu. Ich habe von diesem weisen <highlor-angurian> zauberer gehï¿½rt. Wer weiï¿½, vielleicht nur ein Gerï¿½cht!",0,0,toData);
    base.books.AddGermanBookText("Wir leben nicht in Dörfern, sondern in kleinen Lagern. Manche Leute finden solche Lager bedrohlich, ich verstehe gar nicht, warum. Auf jemanden mit einer Schleuder einen Stein zu werfen, ist doch nicht wirklich schlimm!",0,0,toData);
    base.books.AddGermanBookText("In Albar, werden wir Goblins zum Kampf mit Tieren gezwungen. manchmal werden wir auch einfach als Sklaven gehalten, arme Goblins.",0,0,toData);
    base.books.AddGermanBookText("Manche von uns, so habe ich gehï¿½rt, leben in Dörfern in Gynkese oder sogar Salkamaeria. Dort arbeiten sie als Diener, Boten oder Kaufleute. Einige sogar als Alchemisten!",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Das Volk der Goblins\"",toData);
    base.books.AddEnglishBookTitle("Book with the title \"Goblin Culture\"",toData);
end;