-- creates by random a Questid which stands for the color, shape and content of the emblem
function createQuestID(originator)
	if math.random(1,4) == 3 then
		quest = 11222;
	else
		local digit = {};
		for i=2,5,1 do
			digit[i] = math.random(1,3);
		end
		quest = ("1"..digit[2]..digit[3]..digit[4]..digit[5])+1-1;
	end 
	originator:setQuestProgress(62,quest);
end


function split_questdata(originator)
	local qpg = {};
	local questid = originator:getQuestProgress(62);
	qpg[1]=math.floor(questid/10^4); -- the quest progress
	qpg[2] = math.floor ( (questid-qpg[1]*10^4)/10^3 ); --the shape of the banner
	qpg[3] = math.floor ( (questid - (qpg[1]*10^4 + qpg[2]*10^3))/10^2 );-- the content of the banner 
	qpg[4] = math.floor ( (questid - (qpg[1]*10^4 + qpg[2]*10^3 + qpg[3]*10^2))/10 ); -- the number of items(content) that shall be on the banner
	qpg[5] = math.floor ( (questid - (qpg[1]*10^4 + qpg[2]*10^3 + qpg[3]*10^2 + qpg[4]*10)) ); --the color of the banner

	local sentence = 2;
	if (originator:getQuestProgress(62) == 11222) then sentence = 1; end --questid = 11222			Kreis,mit 2 Tauben in gelb

	return qpg, sentence;
end

--switches the index of the shape, content and color the quest npc wants and puts the properties the npc wants at index 1 of those arrays
function switch_banner(qpg,banner)
	bannerW = banner; --copy original banner array in a write-access array
	for i=1,3,1 do
		local temp= {bannerW.shape[lang][1], bannerW.content[lang][1], bannerW.color[lang][1], bannerW.content[lang][4]}
		if i== qpg[2] then 
			bannerW.shape[lang][1] = bannerW.shape[lang][i];
			bannerW.shape[lang][i] = temp[1];
		end
		if i == qpg[3] then
			bannerW.content[lang][1] = bannerW.content[lang][i];
			bannerW.content[lang][i] = temp[2];
			
			bannerW.content[lang][1+3] = bannerW.content[lang][i+3];
			bannerW.content[lang][i+3] = temp[4];
		end
		if i == qpg[5] then
			bannerW.color[lang][1] = bannerW.color[lang][i];
			bannerW.color[lang][i] = temp[3];
		end
	end
	return bannerW;
end

if not BannerInit then
	--emblemquest:
	banner = { content = {},shape = {}, color = {} }
	banner.content[0] = {"Bär","Taube","Schwert", "Bären", "Tauben", "Schwerter"};
	banner.content[1] = {"bear", "dove", "sword", "bears", "doves", "swords"};
	banner.shape[0] = {"Kreis","Viereck","Dreieck"};
	banner.shape[1] = {"circle", "square", "triangle"};
	banner.color[0] = {"Schwarz","Gelb","Rot"};
	banner.color[1] = {"black", "yellow", "red"};
	BannerInit = true;
end

function chooseSentence(originator,SentenceID)
	lang = originator:getPlayerLanguage();
	
	local qpg, sentence= split_questdata(originator);
	bannerW = switch_banner(qpg,banner);

	gText ={ {}, {}};
	eText ={ {}, {}};
	gText[1][1] = "Meine liebsten Farben sind "..bannerW.color[lang][1].." und "..bannerW.color[lang][2]..", ein Wappen sollte auf jeden Fall eine dieser Farben haben. Und dann kommen "..bannerW.content[lang][2+3].." oder irgendwelche Vögel hinzu, das würde mir gefallen. Die Form wäre mir unwichtig, ein Kreis, ein Dreieck oder auch ein Viereck, alles gleich.";
	gText[1][2] = "Bögen habe ich am liebsten, genau so wie "..bannerW.content[lang][3+1]..". Bögen haben jedenfalls keine spitzen Kanten oder Ecken, die mag ich nämlich gar nicht. Genau so wie ungerade Zahlen, viel zu kantig.";
	gText[1][3] = "Raubtiere und Waffen finde ich schrecklich. Und es sollten in jedem Fall weniger als 3 Symbole auf dem Wappen sein sonst wird es zu voll. Und helle Farben, damit man es aus der Ferne sehen kann.";

	eText[1][1] = "My favorite colors are "..bannerW.color[lang][1].." and "..bannerW.color[lang][2]..", an emblem should, in any case, have one of this colors. And what I would also like to see of course is a "..bannerW.content[lang][3].." or some birds, it would look great.The shape of the emblem is unimportant to me, a circle, a triangle or a square, I don't care.";
	eText[1][2] = "I like bows the best, just as "..bannerW.content[lang][3+1]..". Bows have no shape ridges or corners, which I really dislike. Same as odd numbers, far too edged, I hate them!";
	eText[1][3] = "Predators and weapons are aweful in my eyes. The emblem should have less than 3 symbols on it, otherwise it will be too full. And bright colors, so that it can be seen from far away!";


	gText[2][1] = "Ich kann "..bannerW.content[lang][3+2].." nicht ausstehen! Ich habe gehört das NPC B auf all seinen Nachrichten kleine "..bannerW.shape[lang][1].."e malt, sehr nervig!";
	gText[2][2] = "Ich liebe "..bannerW.content[lang][3+1].." und "..bannerW.content[lang][3+2]..", fragt nicht wieso. "..bannerW.shape[lang][2].."e und "..bannerW.shape[lang][3].."e kann ich aber nicht ausstehen! Und meine Lieblingszahl ist...naja eigentlich habe ich keine, aber ich mag kleine Zahlen, zum Beispiel die "..qpg[4]..".";
	gText[2][3] = "Als kleines Kind hatte ich ein Buch mit "..bannerW.color[lang][1].."em Einband welches über "..bannerW.content[lang][3+1].." handelte. Wenn ich bloß wüsste wo ich es gelassen habe, es war nämlich eines meiner Lieblingsbücher.";

	eText[2][1] = "I hate "..bannerW.content[lang][3+2].."! I heard from a friend that NPC B paints on all of his messages some small "..bannerW.shape[lang][1].."s, really annoying!";
	eText[2][2] = "I love "..bannerW.content[lang][3+1].." and "..bannerW.content[lang][3+2]..", don't ask me why. But I can't stand "..bannerW.shape[lang][2].."s and "..bannerW.shape[lang][3].."s! And my favorite number is...well in fact I have no favorite number, but I like small numbers, like the number "..qpg[4]..".";
	eText[2][3] = "When I was a young child I had once a "..bannerW.color[lang][1].." covered book which contained stories about "..bannerW.content[lang][3+1]..". If I just would knew where I put that book, it was one of my favourite books.";

	return gText[sentence][SentenceID], eText[sentence][SentenceID];
end
