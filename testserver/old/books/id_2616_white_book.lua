--SMALL THIN WHITE BOOK

require("base.books")

module("item.book.id_2616_white_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2616_white_book' WHERE com_itemid = 2616;

function UseItem(User, SourceItem, TargetItem)
      if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
          world:erase(SourceItem,1);
      else
          if base.books.InitBook() then
            base.books.AddLanguage("common language",0);
            base.books.AddEnglishBookText("\n \n Faery Culture",0,0,0);
            base.books.AddEnglishBookText("We, the faeries have been realized for a while, but we remain hidden very well. We are rarely spotted, but you can bet you will be the butt of one of our tricks.",0,0,0);
            base.books.AddEnglishBookText("We are very small and can hide in bushes and trees, and therefore pull off these tricks rather well.",0,0,0);
            base.books.AddEnglishBookText("The female faeries have multi-colored wings, like butterflies. Though, the wings of the male faeries are grassy and transparent.",0,0,0);
            base.books.AddEnglishBookText("Our wings are very strong, and move quite fast. This allows us to withstand great winds. Though, we are overall very fragile and do not make excellent fighters, but we can fly fast.",0,0,0);
            base.books.AddEnglishBookText("We can regrow our cut-off or maimed body parts, especially our wings, which grow within weeks of damage.",0,0,0);
            base.books.AddEnglishBookText("In fact, it is said a count of Albar once hunted down us and cut our wings off to sell as a rare item. Though, he sooned died by an odd combustion that started from a magical amulet.",0,0,0);
            base.books.AddEnglishBookText("We usually inhabit natural places, mainly deep woods. We often settle down near elven settlements, as we get along rather well with them.",0,0,0);
            base.books.AddEnglishBookText("Us faeries only reach about the age of four hundred, so we can relate somewhat to the elves, but not much. We still enjoy each others company and way of life.",0,0,0);
            base.books.AddEnglishBookText("Our kings and queens are always coupled, unmarried faeries never become rulers. Our nobles do not own any land, for it is impossible to own Ushara's land, it is hers.",0,0,0);
            base.books.AddEnglishBookText("We have a wonderful understanding of nature, like the elves. We are known to sometimes follow the ideals of Adron. We hate unnatural things like the undead or demons.",0,0,0);
            base.books.AddEnglishBookText("We are naturally talented spellcasters, though our lack of attention span sometimes does not help, but we have lots of curiousity and intrigue.",0,0,0);
            base.books.AddEnglishBookText("We love to have fun and play tricks, but scare easily. We never forget how one treats us, and we always stand by our promises.",0,0,0);

            base.books.AddGermanBookText("\n \n Das Volk der Feen",0,0,0);
            base.books.AddGermanBookText("Wir, die Feen, werden schon seit einer ganzen Weile wahrgenommen, aber wir bleiben weiterhin gut versteckt. Man bekommt uns selten zu Gesicht, aber du kannst darauf wetten, dass wir auch dich irgendwann mal aufs Korn nehmen.",0,0,0);
            base.books.AddGermanBookText("Wir sind sehr klein und können uns in Büschen und Bäumen verbergen, um von dortaus unseren Schabernack zu treiben.",0,0,0);
            base.books.AddGermanBookText("Weibliche Feen haben bunte Flï¿½gel, ï¿½hnlich Schmetterlingen. Die Schwingen der mï¿½nnlichen Feen dagegen sind grï¿½nlich und durchsichtig.",0,0,0);
            base.books.AddGermanBookText("Unsere Flï¿½gel sind krï¿½ftig und sie schlagen rasend schnell. Dadurch können wir auch starken Stï¿½rmen trotzen. Dennoch sind wir letztlich recht zerbrechlich, was uns nicht gerade zu Kï¿½mpfern macht.",0,0,0);
            base.books.AddGermanBookText("Unsere abgeschnittenen oder verstï¿½mmelten Gliedmaï¿½en wachsen nach, insbesondere unsere Flï¿½gel, die binnen weniger Wochen regenerieren.",0,0,0);
            base.books.AddGermanBookText("Tatsächlich wird erzählt, dass uns einmal ein <count of Albar> bejagd hat und uns die Flï¿½gel abschnitt, um sie als Raritï¿½ten zu verhï¿½kern. Dann jedoch starb er unerwartet an einer seltsamen Verbrennung, die von einer Zauberbrosche ausging.",0,0,0);
            base.books.AddGermanBookText("Fï¿½r gewöhnlich bevï¿½lkern wir Plï¿½tze in der freien Natur, hauptsächlich tief in den Wäldern. Wir siedeln gerne in der Nï¿½he von Elben-Niederlassungen, zumal wir gut mit ihnen auskommen.",0,0,0);
            base.books.AddGermanBookText("Feen werden etwa 400 Jahre alt, fast kï¿½nnten wir es also mit den Elben aufnehmen - aber nur fast. Wir genieï¿½en die Gesellschaft unserer Artgenossen und pflegen unsere Lebensart.",0,0,0);
            base.books.AddGermanBookText("Unsere Kï¿½nige und Königinnen sind stets verheirat, ledige Feen können niemals Herrscher sein. Unsere Adligen haben keinen Landbesitz, weil es unmï¿½glich ist, Ushara's Land zu besitzen.",0,0,0);
            base.books.AddGermanBookText("Wir haben ein besonderes Verhï¿½ltnis zur Natur, wie die Elben. Wir sind dafür bekannt, bisweilen den Idealen Adrons zu folgen. Und wir verabscheuen alles Unnatürliche, sowie Untote und Dï¿½monen.",0,0,0);
            base.books.AddGermanBookText("Wir sind naturbegabte Zauberkundige, und obwohl der angeborene Mangel an Aufmerksamkeit nicht gerade hilfreich ist, haben wir allerhand Kurioses zu bieten.",0,0,0);
            base.books.AddGermanBookText("Wir haben gerne unseren Spaï¿½ und treiben Schabernack, sind aber schreckhaft. Wir vergessen nie, wie man uns behandelt hat und halten stets Wort.",0,0,0);
            
            base.books.AddLanguage("dwarf language",1);

            base.books.AddEnglishBookText( "What our king has to say to being a dwarf: ", 0, 0, 1 );
            base.books.AddEnglishBookText( "In the following some outlines: ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Solidarity; dwarves distinguish themselves by extreme solidarity. A dwarf simply is a dwarf's friend because he is a dwarf. One can always rely on each other. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "If a dwarf knocks at another dwarf's door asking for advise or help, he will never be sent away. Just like he himself will never repel any other dwarf. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Loyalty; a dwarf never scrutinises, he acts. The hierarchy will be followed because dwarves like order and order keeps them from having to think too much. Thinking causes aches. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Silliness is a common dwarven attitude, so it seems. This however is a totally wrong image, though some might understand a bit slower than others. But this doesn't matter because they have much time. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Mostly this slowness in understanding is compensated by a considerable not disdainful punch, considerably faster than the brain. It is said that dwarves only after the battle, after having", 0, 0, 1 );
            base.books.AddEnglishBookText( "broken through the front lines, asked \"Against whom are we fighting? And why?\" This might have lead to the fact that the dwarves crowned one of their comrades as king.", 0, 0, 1 );
            base.books.AddEnglishBookText( "He simply should point the direction to make clear what to hit at. Maybe in the hope that he would understand faster and knows right from wrong. And well if not, after the battle nobody complains", 0, 0, 1 );
            base.books.AddEnglishBookText( "anyway, because the dwarves had their fun and the rest didn't matter anymore. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Belligerence, there is nothing better than a hammer hitting a head or a hearty discussion with countless insults and defamations. Arguing definitely is one of the main dwarven preferences, ", 0, 0, 1 );
            base.books.AddEnglishBookText( "simply due to the fact that this is one of their main abilities. Dwarves cultivate their arguing culture as well as their combat efficiency and train both among each other with joy and amusement. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Smithing and other crafting abilities; each dwarf knows how to smith, but as this is nothing unusual among dwarves, they don't talk about it and don't even mention smithing as a profession. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Apart from that there remains to say that dwarves are skilled in many crafts and even achieve qualities others simply recognise with envy. A favoured craft is gold-smithing, but also masonry,", 0, 0, 1 );
            base.books.AddEnglishBookText( "architecture and gem-grinding have a long tradition among dwarves. Not to forget mining stones to get to the Mother's treasures, after all they are a gift from the Mother which should be", 0, 0, 1 );
            base.books.AddEnglishBookText( "esteemed and unearthed. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "What dwarves think about the small lifestock they share the world with: ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Elves are despicable, absolutely unworthy and ridiculous creatures, their arrogance and ado about magic and trees (which, as is generally known, are only there to support mining tunnels) ", 0, 0, 1 );
            base.books.AddEnglishBookText( "in best case is ridiculous. Apart from that they are simply dimwitted, because they simply do not understand that gold, wealth and a cultivated argue is all that counts. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Lizards unite within themselves everything that dwarves dispise, water and fish. Against water they have an aversion deep within, because water (above all in flooded tunnels) means death. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Those creatures should stay in the water where they belong and shouldn't insult our eyes with their sight. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Humans are much too short-lived to recognise the wisdom of the Gods to some extend within their time of existence or to achieve acceptable skills in crafting. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "You barely turn around and come back after sixty years, they already passed away. So you better don't put up with them, because if you trust them after a reasonable time of about fifty", 0, 0, 1 );
            base.books.AddEnglishBookText( "years and start liking them you can already carry them to their grave. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Halflings, the smaller brothers of humans, don't live much longer. However, they are good for feasting with because they also appreciate beer and a good meal. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Their effort and devotion in agriculture and preparing meals comes close to the crafting skills of the dwarves. They are friendly little guys, however, one shouldn't touch them too", 0, 0, 1 );
            base.books.AddEnglishBookText( "hard as they lack of dwarven stability. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Orks; orks smell, they are creatures of Moshran and therefore not designated in Irmorom's conception.Their existence is an insult for every believer. Apart from that they refuse each kind of order. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Their clans are unorganised, and their lack of respect towards higher ranks prevents any ability for social relation to the slightest extend. Their leaders simply scale up because of their brutality.", 0, 0, 1 );
            base.books.AddEnglishBookText( "Wisdom, age and knowledge simply don't matter to them at all. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Some simple thoughts about being a dwarf: ", 0, 0,1 );
            base.books.AddEnglishBookText( "What does it mean to be a dwarf? That's not easy to explain, because just like with humans there are no stereotypes for dwarves. There are considerable differences and there will always ", 0, 0, 1 );
            base.books.AddEnglishBookText( "be exceptions to the rules. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Nevertheless there are some attributes said to be valid for all dwarves. If you are willing to serve them or not is up to yourself, however serving the stereotypes eases the worth of recognition. ", 0, 0, 1 );
            base.books.AddEnglishBookText( "Particularly as there are two levels within the dwarven game. On the one hand dwarves among themselves, on the other hand dwarves moving among all the other small lifestock.", 0, 0, 1 );

            base.books.AddGermanBookText( "Was unser König zum Thema Zwerg zu sein sagt: ", 0, 0, 1 );
            base.books.AddGermanBookText( "Im Folgenden einige Nachsagungen: ", 0, 0, 1 );
            base.books.AddGermanBookText( "Zusammenhalt; Zwerge zeichnen sich durch einen extremen Zusammenhalt aus. Ein Zwerg ist ganz einfach schon deswegen der Freund eines Zwerges weil er ein Zwerg ist. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Untereinander kann man sich immer aufeinander verlassen. Klopft ein Zwerg an und fragt einen anderen Zwergen um Rat oder Hilfe so wird er niemals abgewiesen. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Genauso wie er selbst niemals einen Zwergen abweist. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Loyalitï¿½t; ein Zwerg hinterfragt nicht er handelt. Die Hierarchie wird eingehalten, denn Zwerge lieben die Ordnung. Ordnung bewahrt sie davor allzu viel Denken zu mï¿½ssen. Denn denken tut weh. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Dummheit ist eine weit verbreitete zwergische Eigenschaft, so scheint es immer. Das ist allerdings ein vollkommen falsches Bild, gut einige verstehen viel langsamer. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Aber das macht nichts sie haben ja auch viel Zeit. Meist wird diese Langsamkeit im Verstehen durch eine erhebliche und nicht zu verachtende Schlagkraft ausgeglichen und diese ist erheblich schneller", 0, 0, 1 );
            base.books.AddGermanBookText( "als der Verstand. So soll es schon Zwerge gegeben haben die erst nach der Schlacht, nachdem sie durch die Linien gebrochen waren, innehielten und fragten: 'gegen wen geht's eigentlich? Und warum?'.", 0, 0, 1 );
            base.books.AddGermanBookText( "Dies hat wohl dazu gefï¿½hrt das die Zwerge einen der Ihren zum König gemacht haben. Der sollte dann einfach nur die Richtung angeben, damit klar ist wo draufgehauen wird.", 0, 0, 1 );
            base.books.AddGermanBookText( "Wohl in der Hoffnung das dieser schneller Versteht und schon weiï¿½ was richtig ist, nun ja und wenn er es auch nicht weiï¿½, nach der Schlacht beschwert sich eh keiner mehr, weil die Zwerge", 0, 0, 1 );
            base.books.AddGermanBookText( "hatten ihren Spaï¿½ und der Rest existiert nicht mehr. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Streitlust, was ist schöner als ein Hammer der auf einem Kopf einschlï¿½gt oder ein zï¿½nftiges Streitgesprï¿½ch mit zahllosen Beleidigungen und Schmï¿½hungen? ", 0, 0, 1 );
            base.books.AddGermanBookText( "Streiten ist eindeutig eine der Lieblingsbeschï¿½ftigung der Zwerge, ganz einfach aus dem Grunde weil sie das gut können. Zwerge pflegen ihre Streitkultur genauso wie ihre Kampfkraft und", 0, 0, 1 );
            base.books.AddGermanBookText( "trainieren sie auch untereinander mit Freude und Vergnï¿½gen. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Schmiedekunst und andere Handwerke, ein jeder Zwerg kann schmieden, da dies aber nichts Ungewöhnliches unter den Zwergen ist reden sie meist gar nicht darï¿½ber und ", 0, 0, 1 );
            base.books.AddGermanBookText( "erwï¿½hnen das Schmieden als Beruf nicht einmal. Ansonsten bleibt zu sagen, dass Zwerge in vielen Handwerken bewandert sind und dort auch meist Qualitäten erreichen wo andere nur", 0, 0, 1 );
            base.books.AddGermanBookText( "neidisch werden können. Beliebt ist das Goldschmieden, aber auch Steinmetzarbeiten, Baukunst und Gemmenschleifferei haben unter Zwergen eine lange Tradition.", 0, 0, 1 );
            base.books.AddGermanBookText( "Das wï¿½hlen im Gestein um an die Schï¿½tze der Mutter zu kommen darf hierbei nicht vergessen werden, immerhin sind sie ein Geschenk der Mutter und das sollte man in Ehren halten und zu Tage fï¿½rdern. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Was Zwerge ï¿½ber das Kroppzeug mit dem sie sich die Welt teilen mï¿½ssen denken: ", 0, 0, 1 );
            base.books.AddGermanBookText( "Elfen sind verachtenswerte vollkommen unwï¿½rdige und lï¿½cherliche Kreaturen, ihre Arroganz und das Getue um Magie und Bäume (Die ja bekanntlich nur zum Tunnel abstï¿½tzen da sind) ist im besten Falle ", 0, 0, 1 );
            base.books.AddGermanBookText( "lï¿½cherlich. Auï¿½erdem sind sie einfach dï¿½mlich weil sie einfach nicht verstehen das Gold, Reichtum und ein gepflegter Streit das einzig wahre sind. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Echsen vereinen in sich eigentlich alles was Zwerge verachten, Wasser und Fische. Dem Wasser gegenï¿½ber haben sie eine tiefliegende Abneigung weil Wasser (gerade in ï¿½berfluteten Tunneln) ", 0, 0, 1 );
            base.books.AddGermanBookText( "den Tod bedeutet. Diese Viecher sollten im Wasser bleiben wo sie hingehï¿½ren und unsere Augen nicht mit ihrem Anblick beleidigen. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Menschen sind viel zu kurzlebig um in ihrer Existenz auch nur Ansatzweise die Weisheit der Götter zu erkennen oder ordentliche Fertigkeiten im Handwerk zu erreichen.", 0, 0, 1 );
            base.books.AddGermanBookText( "Kaum hat man sich kurz umgedreht und kommt nach 60 Jahren wieder einmal vorbei, sind sie gestorben. Am besten schlieï¿½t man mit ihnen keine Freundschaft denn wenn man ihnen nach einer", 0, 0, 1 );
            base.books.AddGermanBookText( "normalen Zeit von 50 Jahren das Vertrauen schenkt und anfï¿½ngt sie lieb zu gewinnen kann man sie schon zu Grabe tragen. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Halblinge die kleinen Brï¿½der der Menschen leben auch nicht viel lï¿½nger. Allerdings kann man mit ihnen feste Feste feiern weil sie Bier und gutes Essen genauso schï¿½tzen wie wir. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Ihr Fleiï¿½ und ihre Hingabe zum Anbau und zur Zubereitung von Essen kommt der Handwerkskunst der Zwerge nahezu gleich. Sie sind freundliche kleine Kerle, allerdings sollte man sie nicht allzu", 0, 0, 1 );
            base.books.AddGermanBookText( "hart anfassen da Ihnen die Stabilität von unsereins abgeht. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Orks - Orks stinken sie sind Kreaturen Moshrans und damit in Irmoroms Schï¿½pfung nicht vorgesehen. Ihre Existenz ist eine Beleidigung für jeden Glï¿½ubigen. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Ferner lehnen sie jedwede Art von Ordnung ab. Ihre Verbï¿½nde sind unorganisiert und der mangelnde Respekt gegenï¿½ber hï¿½her Gestellten verhindert das sie auch nur Ansatzweise zum gesellschaftlichen", 0, 0, 1 );
            base.books.AddGermanBookText( "Umgang geeignet sein kï¿½nnten. Ihre Anführer kommen alleine durch Brutalitï¿½t nach oben. Weisheit, Alter und Erfahrung spielen bei Ihnen überhaupt keine Rolle.", 0, 0, 1 );
            base.books.AddGermanBookText( "Einige Gedanken ï¿½ber das Zwergendasein einfach mal so: ", 0, 0, 1 );
            base.books.AddGermanBookText( "Was bedeutet es ein Zwerg zu sein? das ist so eine Sache denn stereotypen gibt es bei den Zwergen genauso wenig wie bei Menschen. Es gibt erhebliche Unterschiede und Ausnahmen bestï¿½tigen die Regel. ", 0, 0, 1 );
            base.books.AddGermanBookText( "Dennoch gibt es einige Eigenschaften die gemeinhin allen Zwergen nachgesagt werden. Ob man diese Bedienen will oder nicht lasse ich mal dahingestellt, allerdings erleichtert das bedienen von ", 0, 0, 1 );
            base.books.AddGermanBookText( "Stereotypen den Wiedererkennwert. Zumal es beim Zwergenspiel zwei Ebenen gibt. Zum einen Zwerge unter sich, zum anderen Zwerge die sich unter dem anderen 'Kroppzeug' bewegen.", 0, 0, 1 );


			----MS. PIGGY BOOK FOR RINCEWIND------------------
			base.books.AddLanguage("common language",2);

            base.books.AddEnglishBookText("Parchment 1:\nWake up, all who wear crowns! Wake up, all who don't! \n\nYou who are nothing but crowned rabscallions and bareheaded rogues.",0,25,2);
			base.books.AddEnglishBookText("Ronagan, the most intelligent God, is it himself who questions your authority! ",0,25,2);
			base.books.AddEnglishBookText("Why do common mortals have the arrogance to wear a golden circlet around your head, ordering others and judging by random laws?",0,25,2);
			base.books.AddEnglishBookText("We, who stand under Ronagan's protection, thieve your golden circlet away from your foreheads, so you will remember what wimpy scum you are! ",0,25,2);
			base.books.AddEnglishBookText("All are now free to try being a royal themselves, as we announce, within this writing, that we will hold an auction of the rogue Friedwulfa's golden crown, ",0,25,2);
			base.books.AddEnglishBookText("monarch under Irmorom's Throne, the Kingdom of Silverbrand. It is now at the unworthy",0,25,2);
			base.books.AddEnglishBookText("to wear the beautiful crown and to claim they are more important than others, elected by grace of God! Ronagan laughs about you, but still, do offer us a proud sum, that is worth a king, via dove.",0,25,2);
			base.books.AddEnglishBookText("with loathing but cheerful greetings,\n the people of shadows,\nthe children of Ronagan,\nthe Rich by grace of God,Rufus the Longfinger.",0,25,2);
			base.books.AddEnglishBookText("Parchment 2:\nTo the bareheaded kings under the throne Irmorom.",0,25,2);
			base.books.AddEnglishBookText("Ignoring the auction of your precious golden circlet, the shadow born demand from you!",0,25,2);
			base.books.AddEnglishBookText("The King of the halls shall pilgrimage crowned with a smelly pumpkin from the dwarfsland to the harbour of the isle Gobaith. Guarded from his foolish cortege, dressed in nightgown.",0,25,2);
			base.books.AddEnglishBookText("Loud and wrong, should they play their Instruments, until the golden crown is given back.",0,25,2);
			base.books.AddEnglishBookText("Who fights asinity, earns Ronagans smile, they say. So we like to give in optional the question to smith another crown! So you stay anserous, and we don't earn smiles.",0,25,2);
			base.books.AddEnglishBookText("Same, same in form and profile. Not able to differ from the crown, wich was stolen from your heads. Just an inscription, small, so people are not able to spot it easily. ",0,25,2);
			base.books.AddEnglishBookText("Grown of the Ging from the Silverland\n\n We want to exchange this Grown with the real crown. Furthermore, we would like to have it flavourful: 47 silver coins and 74 copper coins. ",0,25,2);
			base.books.AddEnglishBookText("So, if you decline our demand, we'll crown a pig's bottom cheek, so that the brute sprinkles it with lovely faecal. ",0,25,2);
			base.books.AddEnglishBookText("Hoping the pig's cheek does not have to wear the crown,\nthe folks of shadows,\nthe children of Ronagan,\nthe one hidden by the shadows of the god,\n Rufus the Longfinger. ",0,25,2);
			base.books.AddEnglishBookText("Parchment 3:\n\nAt the muddy pigpen I sat.\nEating apples to become fat.",0,25,2);
			base.books.AddEnglishBookText("When a fine man came to me.\nHis dark hair in the wind I could see.\nWearing a shadow gown.\nHe speaks with a frown.",0,25,2);
			base.books.AddEnglishBookText("Remember what you wrote in the past.\nIt's not needed to give me the crown at last.",0,25,2);
			base.books.AddEnglishBookText("I took it during you ate fruit. \n Thieving is a glamourous suit.\nHe crested the pig's buttocks.\nLook! The dwarfen king doesn't wear socks!",0,25,2);
			base.books.AddEnglishBookText("Rufus the Longfinger.",0,25,2);

			base.books.AddGermanBookText("Pergament 1:\nAufgewachet, Kronentrï¿½ger! Aufgewachet Kronenlose!\n\nIhr die ihr nichts weiter seid als bekrï¿½nte Halunken und barkï¿½pfige Schurken.",0,25,2);
			base.books.AddGermanBookText("Ronagan, der klï¿½gste Gott, selbst ist es der Eure Autoritï¿½t nun in Frage stellt! ",0,25,2);
			base.books.AddGermanBookText("Woher nehmen sich gewöhnliche sterbliche Wesen die Atroganz einen goldenen Reif am Haupt zu tragen und anderen zu befehlen und nach willkï¿½hrlichen Gesetzten zu richten? ",0,25,2);
			base.books.AddGermanBookText("Wir, die unter Schutze Ronagan stehenden, stehlen Euch den goldenen Reif von der Stirn, auf dass ihr Euch besinnt welch kï¿½mmerliche Wesen ihr seid!",0,25,2);
			base.books.AddGermanBookText("Allen anderen steht es nun frei, sich slebst als König zu versuchen, denn wir verkï¿½nden, mit diesigem Schreiben, die Versteigerung der goldenen Krone von Schurkin Friedwulfa,",0,25,2);
			base.books.AddGermanBookText("Herrscherin unter Irmoroms Thron, dem Reiche Silberbrand. Sollen die Unwï¿½rdigen die schöne Krone tragen und behaupten sie seinen ein Jemand von Wichtigkeit,",0,25,2);
			base.books.AddGermanBookText("von Gottes gnaden erwï¿½hlt! Ronagan lacht ï¿½ber euch, aber bietet uns dennoch eine stolze Summe die eines Kï¿½nigs wï¿½rdig ist, per Taube.",0,25,2);
			base.books.AddGermanBookText("Mit verabscheuendem aber heiteren Gruße,\ndas Volk der Schatten,\ndie Kinder Ronagans,\nder von gottes Schatten betuchte\nRufus der Langfinger.",0,25,2);
			base.books.AddGermanBookText("Pergament 2:\nAn die barkï¿½pfigen Kï¿½nige der Zwerge unterm Thron des Irmorom.",0,25,2);
			base.books.AddGermanBookText("Ungeachtet der Versteigerung Eures wertvollen goldenen Rades, verlangen die Schatttengeborenen von Euch!",0,25,2);
			base.books.AddGermanBookText("Der König der Stï¿½tte pilgert mit einem stinkenden Kï¿½rbis gekrï¿½hnt vom Zwergenlande zum Hafen der Insel Gobaith. Begelitet von dem nï¿½rrischen Gefolge Ihrer Majestï¿½t, im Schlafrocke gekleidet. ",0,25,2);
			base.books.AddGermanBookText("So sollen sie laut und falsch ihr Instrument spielend umherziehen, bis die goldene Krone zurückgereicht wird. ",0,25,2);
			base.books.AddGermanBookText("Wer die Dummheit bekï¿½mpft erntet das Lï¿½cheln Ronagans, heiï¿½t es. So wollen wir euch im Alternativ lediglich um einen Gefallen bitten, so dass ihr dumm bleibt und wir nicht belï¿½chelt werden.",0,25,2);
			base.books.AddGermanBookText("Schmiedet eine Krone, der die ihr misst, gleich in Gestalt und Form. Nicht zu unterscheiden darf sie sein!",0,25,2);
			base.books.AddGermanBookText("Lediglich eine Inschrift, klein und zierlich, schwer zu erblickcen macht hinein. Auf das dort stehe:",0,25,2);
			base.books.AddGermanBookText("Gronne des Gï¿½nigs vom Silberland\n\n Diese Gronne mï¿½chten wir gegen die wahre Krone tauschen, uns geschmacklich gemacht von weiteren 47 Mï¿½nzen in Silber, sowie 74 Mï¿½nzen in Kupfer. ",0,25,2);
			base.books.AddGermanBookText("So diese, unsere Forderung nicht folge geleistet, packen wir den goldenen Ringe einem Schweine auf die hintere Backe, dass das Vieh alles mit Fï¿½kal besprkenkle! ",0,25,2);
			base.books.AddGermanBookText("Auf das nicht die Backe des Schweines gekrï¿½hnt werde, verbleibe\ndas Volk der Schatten,\ndie Kinder Ronagans,\n Rufus der Langfinger\n mit verabscheuendem aber heiteren Gruße.",0,25,2);
			base.books.AddGermanBookText("Pergament 3:\n\nAm Schweinepfuhle saï¿½ ich.\nUnbekï¿½mmert dem grunzen lauschend. Fraï¿½ ich.",0,25,2);
			base.books.AddGermanBookText("ï¿½pfel. Indessen ein Galan zu mir tritt.\nDunkles Haar, weht im flotten Schritt.\nIm schattigen Gewand gehï¿½llt,spricht er, die Stimme von Kraft erfï¿½llt.",0,25,2);
			base.books.AddGermanBookText("Errinere ich dich nun an, was du einst schriebst.\n Es ist auch nicht nï¿½tig das du mir die Krone gibst.\nIch nahm sie dir, also du gefressen Frucht.\nManch einem ist Stehlen Sucht. ",0,25,2);
			base.books.AddGermanBookText("Er hebt den Reif. Zu krï¿½nen des Schweines Backe.\nDer König der Zwergen ist ja nacke!\n\n\nRufus der Langfinger.",0,25,2);
            --------------------------------------------------

		  end
      end
      base.books.SendBookPage(User,SourceItem.data,Counter);
  end

function LookAtItem(User,Item)
  if base.books.InitTitle() then
      base.books.AddEnglishBookTitle("Book with the title \"Faery Culture\"",0);
      base.books.AddGermanBookTitle("Buch mit dem Titel \"Das Volk der Feen\"",0);
      
      base.books.AddEnglishBookTitle( "Book with the title \"King Tialdin's Speeches\"", 1 );
      base.books.AddGermanBookTitle( "Buch mit dem Titel \"Die Reden König Tialdins\"", 1 );
      
      base.books.AddEnglishBookTitle("Book with the title \"Bareheaded Kings \"",2); 
	  base.books.AddGermanBookTitle("Buch mit dem Titel \"Barkï¿½pfige Kï¿½nige \"",2);
	  
  end
  base.books.GetBookItemInform(User,Item);
end
