-- called after every player login
require("base.common")
require("base.money")
require("base.factions")
require("content.dailymessage")
require("npc.aldania_elthewan")
require("scheduled.factionLeader")

module("server.login", package.seeall);

function onLogin( player )

    world:gfx(31,player.pos); --A nice GFX that announces clearly: A player logged in.

	--General welcome message
    players=world:getPlayersOnline(); --Reading all players online so we can count them
	
	if table.getn(players) > 1 then
	
	    base.common.InformNLS(player,"[Login] Willkommen auf Illarion! Es sind "..table.getn(players).." Spieler online.","[Login] Welcome to Illarion! There are "..table.getn(players).." players online."); --sending a message
    
	else --player is alone
	
	    base.common.InformNLS(player,"[Login] Willkommen auf Illarion! Es ist ein Spieler online.","[Login] Welcome to Illarion! There is one player online."); --sending a message
	
	end
	
	--Taxes (has to be redone by "someone")
    if not player:isAdmin() and player.pos.z~=100 and player.pos.z~=101 then --Admins don't pay taxes. Not on Noobia!
	    -- So let there be taxes!
	    payTaxes(player);
		
		
	end
receiveGems(player);
	--Noobia handling
	if (base.common.IsOnNoobia(player.pos)) then --On Noobia

	    if not player:isAdmin() then --non admin chars need help!

            --player:pageGM("This player just logged in on Noobia.");

		end

		found, myEffect = player.effects:find(13); --Noob effect

		if not found then --new player!

            newbieEffect = LongTimeEffect(13,1);
		    player.effects:addEffect(newbieEffect);

		end

		if  player:isInRangeToPosition(position(31,22,100),7) then --only show the dialog if the char is close to the noob spawn

		    local callbackNewbie = function(dialogNewbie) end; --empty callback

		    if player:getPlayerLanguage() == 0 then
			    dialogNewbie = MessageDialog("Willkommen bei Illarion!", "Eine lange Reise nähert sich ihrem Ende. Du gehst von Bord des Schiffes und hast endlich wieder festen Boden unter den Füßen. In diesem Land wirst du vor eine Entscheidung gestellt, die wohl die wichtigste deines Lebens sein wird.\nDas edle Cadomyr, das weise Runewick oder das reiche Galmair - welchen Weg wirst du einschlagen?\n\nWillkommen bei Illarion, dem kostenlosen Online-Rollenspiel. Dieses Tutorial wird dich auf deinen ersten Schritten begleiten und dir die Bedienung des Spiels beibringen. Du kannst das Tutorial jederzeit überspringen indem du 'Tutorial überspringen' zu einem NPC sagst.", callbackNewbie);
		    else
			    dialogNewbie = MessageDialog("Welcome to Illarion!", "A long, tiresome journey finally comes to an end. You disembark the ship and feel solid ground beneath your feet. In these lands, you will soon be faced with a choice, perhaps the most important of your entire life. Noble Cadomyr, wise Runewick, or wealthy Galmair - whose side shall you join?\n\nWelcome to Illarion, the free online roleplaying game. This tutorial will guide you through your first steps and teach you the controls of the game. You may skip the tutorial at any time by saying 'skip tutorial' to an NPC.", callbackNewbie);
		    end

		    player:requestMessageDialog(dialogNewbie); --showing the welcome text

		end --Dialog

    end --Noobia end

    if (not base.common.IsOnNoobia(player.pos)) then --Not on Noobia, confuses noobs

		--Messages of the day
		--German
		messageG={};
		messageG[1]="[Tipp] Leichte Rüstungen aus Leder schützen sehr gut gegen stumpfe Waffen aber schlecht gegen Hiebwaffen.";
		messageG[2]="[Tipp] Mittlere Rüstungen wie Kettenhemden schützen sehr gut gegen Hiebwaffen aber schlecht gegen Stichwaffen.";
		messageG[3]="[Tipp] Schwere Rüstungen wie Plattenpanzer schützen sehr gut gegen Stichwaffen aber schlecht gegen stumpfe Waffen.";
		messageG[4]="[Tipp] Wir spielen miteinander, nicht gegeneinander. Viel Spaß beim Spielen!";
		messageG[5]="[Tipp] Bitte besuche uns auch im IRC-Chat: #illarion auf Quakenet.";
		messageG[6]="[Tipp] Im Forum sind viele interessante Diskussion und Informationen zu finden. Meld dich gleich an!";
		messageG[7]="[Tipp] Wenn du einen Gamemaster erreichen möchtest, schreibe !gm <Deine Nachricht> im Chatfenster.";
		messageG[8]="[Tipp] Brágon ist der Gott des Feuers.";
		messageG[9]="[Tipp] Eldan ist der Gott des Geistes.";
		messageG[10]="[Tipp] Findari ist die Göttin der Luft.";
		messageG[11]="[Tipp] Tanora/Zelphia ist die Göttin des Wassers.";
		messageG[12]="[Tipp] Ushara ist die Göttin der Erde .";
		messageG[13]="[Tipp] Adron ist der Gott des Weines und der Feste.";
		messageG[14]="[Tipp] Cherga ist die Göttin der Geister und der Unterwelt.";
		messageG[15]="[Tipp] Elara ist die Göttin des Wissens und der Weisheit.";
		messageG[16]="[Tipp] Irmorom ist der Gott des Handels und des Handwerks.";
		messageG[17]="[Tipp] Malachín ist der Gott der Jagd und der Schlachten.";
		messageG[18]="[Tipp] Moshran ist der Gott des Blutes und der Gebeine.";
		messageG[19]="[Tipp] Nargùn ist der Gott des Chaos.";
		messageG[20]="[Tipp] Oldra ist die Göttin der Fruchtbarkeit und des Lebens.";
		messageG[21]="[Tipp] Ronagan ist der Gott der Diebe und der Schatten.";
		messageG[22]="[Tipp] Sirani ist die Göttin der Liebe und der Freude.";
		messageG[23]="[Tipp] Zhambra ist der Gott der Freundschaft und Treue.";
		messageG[24]="[Tipp] Cadomyr ist das Reich der Ehre.";
		messageG[25]="[Tipp] Runewick ist das Reich der Weisheit.";
		messageG[26]="[Tipp] Galmair ist das Reich des Reichtums.";
		messageG[27]="[Tipp] Manchen Monstern sollte man lieber nicht alleine begegnen.";
		messageG[28]="[Tipp] Gegenstände von geringer Haltbarkeit drohen zu zerbrechen. Ein Fachmann kann sie ausbessern.";
		messageG[29]="[Tipp] Fernwaffen werden nicht umsonst so genannt: stark auf Distanz; nutzlos im Nahkampf.";
		messageG[30]="[Tipp] Hiebwaffen sind gut gegen leichte Rüstungen.";
		messageG[31]="[Tipp] Stichwaffen sind gut gegen mittlere Rüstungen.";
		messageG[32]="[Tipp] Stumpfe Waffen sind gute gegen schwere Rüstungen.";
		messageG[33]="[Tipp] Ein Silberstück entspricht einhundert Kupferstücken. Einhundert Silberstücke entsprechen einem Goldstück.";
		messageG[34]="[Tipp] Die besten Alchemisten	leben in Runewick.";
		messageG[35]="[Tipp] Die besten Kerzenzieher leben in Runewick.";
		messageG[36]="[Tipp] Die besten Schreiner leben in Runewick.";
		messageG[37]="[Tipp] Die besten Köche leben in Runewick.";
		messageG[38]="[Tipp] Die besten Bauern leben in Runewick.";
		messageG[39]="[Tipp] Die besten Kräuterkundigen leben in Runewick.";
		messageG[40]="[Tipp] Die besten Schneider leben in Runewick.";
		messageG[41]="[Tipp] Die besten Schmiede leben in Galmair.";
		messageG[42]="[Tipp] Die besten Ziegelbrenner leben in Galmair.";
		messageG[43]="[Tipp] Die besten Steinmetze leben in Galmair.";
		messageG[44]="[Tipp] Die besten Bergarbeiter leben in Galmair.";
		messageG[45]="[Tipp] Die besten Brauer leben in Galmair.";
		messageG[46]="[Tipp] Die besten Fischer leben in Cadomyr.";
		messageG[47]="[Tipp] Die besten Glasbläser leben in Cadomyr.";
		messageG[48]="[Tipp] Die besten Sandgräber leben in Cadomyr.";
		messageG[49]="[Tipp] Die besten Kunstschmiede leben in Cadomyr.";
		messageG[50]="[Tipp] Die besten Edelsteinschleifer leben in Cadomyr.";
		messageG[51]="[Tipp] Jedes Reich ist auf bestimmte Handwerke spezialisiert. Wenn es das, was du benötigst, nicht auf dem örtlichen Markt gibt, wirst du wohl reisen müssen.";
		messageG[52]="[Tipp] Wenn du Probleme bei der Kommunikation mit einem NPC hast, sage 'Hilfe' um eine Liste der Schlüsselwörter aufzurufen.";
		messageG[53]="[Tipp] Obstbäume haben schon so manchen hungrigen Abenteurer gerettet. Allerdings ist ein schmackhafteres Mahl stets vorzuziehen.";
		messageG[54]="[Tipp] Es gibt viele Möglichkeiten, seinen Charakter zu bewegen: Die rechte Maustaste, die Pfeiltasten, den Ziffernblock und WASD.";
		messageG[55]="[Tipp] Einen NPC nach einer 'Mission' zu fragen ist ein guter Weg um ein paar einfache Münzen zu verdienen.";
		messageG[56]="[Tipp] Scheue dich nicht, andere Spieler um Hilfe zu bitten. Behandle sie mit Respekt und verwende so weit möglich den out-of-character-Modus (#o).";
		messageG[57]="[Tipp] Mit #i stellst du deinen Charakter anderen Spielern vor. Diese erfahren so den Namen deines Charakters.";
		messageG[58]="[Tipp] Der Illarion-Chat ist auf der Homepage verlinkt. Du erhältst dort technische Unterstützung oder kannst einfach andere Spieler kennenlernen.";
		messageG[59]="[Tipp] Der Vollbildmodus kann im Optionsmenü des Clients aktiviert werden.";
		messageG[60]="[Tipp] Wenn ein neuer Spieler deinem Reich beitritt erhältst du eine kurze Mitteilung. Heiße ihn doch gleich willkommen!";
		messageG[61]="[Tipp] Um der Staatskasse deines Reiches etwas zu spenden, lege es einfach auf das Spendenfeld in der Nähe deines Anführers."
		messageG[62]="[Tipp] Um die Sprache deines Charakters umzustellen, schreibe '!l' gefolgt von der gewünschten Sprache: Common, Elf, Human, Dwarf, Halfling, Lizard."
		messageG[63]="[Tipp] Laufen ist schneller als Gehen - halte die linke Maustaste gedrückt um zu laufen."
		messageG[64]="[Tipp] Die meisten NPCs reagieren auf 'Hilfe' mit der Ausgabe einer Liste ihrer wichtigsten Schlüsselwörter."
		messageG[65]="[Tipp] Die Fertigkeiten deines Charakters kannst du aufrufen, indem du 'C' drückst."
        messageG[66]="[Tipp] Ein Stapel von Gegenständen läßt sich durch Halten der Shift-Taste beim Bewegen auflösen."
		messageG[67]="[Tipp] Wenn du auf Reisen gehst, nimm stets Proviant mit. Deine Lebenspunkte regenerieren sich nicht, wenn dein Charakter hungrig ist."
		
		--English
		messageE={};
		messageE[1]="[Hint] Light armours, such as those made of leather, offer good protection against blunt weapons but perform poorly against slashing weapons.";
		messageE[2]="[Hint] Medium armours, such as chain mail, offer good protection against slashing weapons but are more vulnerable to puncture weapons.";
		messageE[3]="[Hint] Heavy armours, such as those made from sturdy metal plates, offer good protection against puncture weapons but are vulnerable to blunt weapons.";
		messageE[4]="[Hint] We play with, not against each other. Have fun playing!";
		messageE[5]="[Hint] Please join our IRC chat: #illarion on Quakenet.";
		messageE[6]="[Hint] The forum contains many interesting discussions and a lot of useful information. Register today!";
		messageE[7]="[Hint] If you want to contact a gamemaster, type !gm <Your message> in the chat box.";
		messageE[8]="[Hint] Brágon is the God of fire.";
		messageE[9]="[Hint] Eldan is the God of spirit.";
		messageE[10]="[Hint] Findari is the Goddess of air.";
		messageE[11]="[Hint] Tanora/Zelphia is the Goddess of water.";
		messageE[12]="[Hint] Ushara is the Goddess of earth.";
		messageE[13]="[Hint] Adron is the God of festivities and wine.";
		messageE[14]="[Hint] Cherga is the Goddess of spirits and the underworld.";
		messageE[15]="[Hint] Elara is the Goddess of wisdom and knowledge.";
		messageE[16]="[Hint] Irmorom is the God of trade and craftsmanship.";
		messageE[17]="[Hint] Malachín is the God of battle and hunting.";
		messageE[18]="[Hint] Moshran is the God of blood and bones.";
		messageE[19]="[Hint] Nargùn is the God of chaos.";
		messageE[20]="[Hint] Oldra is the Goddess of life and fertility.";
		messageE[21]="[Hint] Ronagan is the God of thieves and shadows.";
		messageE[22]="[Hint] Sirani is the Goddess of love and pleasure.";
		messageE[23]="[Hint] Zhambra is the God of friendship and loyalty.";
		messageE[24]="[Hint] Cadomyr is the realm of honour.";
		messageE[25]="[Hint] Runewick is the realm of wisdom.";
		messageE[26]="[Hint] Galmair is the realm of wealth.";
		messageE[27]="[Hint] There are some monsters which you should avoid while adventuring alone.";
		messageE[28]="[Hint] Items of low durability might break any time. A specialist can repair them.";
		messageE[29]="[Hint] Distance weapons have their name for a reason; they are useful for distant targets, but useless in a melee.";
		messageE[30]="[Hint] Slashing weapons are good against light armour.";
		messageE[31]="[Hint] Puncture weapons are good against medium armour.";
		messageE[32]="[Hint] Blunt weapons are good against heavy armour.";
		messageE[33]="[Hint] A single silver coin equals a hundred copper coins. One hundred silver coins equal one gold coin.";
		messageE[34]="[Hint] The best alchemists are living in Runewick.";
		messageE[35]="[Hint] The best candle makers are living in Runewick.";
		messageE[36]="[Hint] The best carpenters are living in Runewick.";
		messageE[37]="[Hint] The best cooks are living in Runewick.";
		messageE[38]="[Hint] The best peasants are living in Runewick.";
		messageE[39]="[Hint] The best herbalists are living in Runewick.";
		messageE[40]="[Hint] The best tailors are living in Runewick.";
		messageE[41]="[Hint] The best blacksmiths are living in Galmair.";
		messageE[42]="[Hint] The best brick makers are living in Galmair.";
		messageE[43]="[Hint] The best masons are living in Galmair.";
		messageE[44]="[Hint] The best miners are living in Galmair.";
		messageE[45]="[Hint] The best brewers are living in Galmair.";
		messageE[46]="[Hint] The best fishers are living in Cadomyr.";
		messageE[47]="[Hint] The best glass blowers are living in Cadomyr.";
		messageE[48]="[Hint] The best sand diggers are living in Cadomyr.";
		messageE[49]="[Hint] The best finesmiths are living in Cadomyr.";
		messageE[50]="[Hint] The best gem grinders are living in Cadomyr.";
		messageE[51]="[Hint] Each realm specialises in certain crafts. If you can't find what you are looking for in your home market, you may need to travel abroad.";
		messageE[52]="[Hint] If you ever get stuck while communicating with an NPC, the 'help' command will provide you with a list of useful topics.";
		messageE[53]="[Hint] Fruit trees have saved the lives of countless starving travellers. You will soon find yourself needing a more filling meal, though.";
		messageE[54]="[Hint] There are many ways to move your character around in Illarion. The right mouse button, arrow keys, num pad, and WASD will all work.";
		messageE[55]="[Hint] Asking an NPC whether they have a 'quest' for you to carry out can be a good way to earn a quick coin or two.";
		messageE[56]="[Hint] Don't be afraid to ask the other players around you for help if you encounter difficulties. But make sure to remain respectful and to use OOC chat (#o), where appropriate.";
		messageE[57]="[Hint] Using the '#i' command will introduce your character to any people around them. The other players will then be able to see your character's name.";
		messageE[58]="[Hint] The Illarion chat is linked on the homepage. It is useful for technical assistance and for simply getting to know your fellow players.";
		messageE[59]="[Hint] Fullscreen mode can be activated from the settings menu when the client is started.";
		messageE[60]="[Hint] You will receive a notification when a new player chooses to join your realm. Give them a friendly welcome!";
        messageE[61]="[Hint] In order to donate something to your realm's treasury, just place the item on the donation square close to your leader.";
        messageE[62]="[Hint] To switch the language of your character, type '!l' followed by the desired language: Common, Elf, Human, Dwarf, Halfling, Lizard.";
        messageE[63]="[Hint] Running is faster than walking - hold down the left mouse button to run.";
        messageE[64]="[Hint] Most NPCs react on 'help' with a list of their most important keywords.";
        messageE[65]="[Hint] You can review the skills of your character by hitting 'C'.";
		messageE[66]="[Hint] To split a stack of items, hold shift while moving it.";
		messageE[67]="[Hint] If you go on a journey, always have some rations with you. Your character's hitpoints won't regenerate if your character is hungry.";

	    dailyMessageID=math.random(1,table.getn(messageG)); --chosing a message at random
	    base.common.InformNLS( player,messageG[dailyMessageID],messageE[dailyMessageID]); --sending the message
    end

	if player.name == "Valerio Guilianni" or player.name == "Rosaline Edwards" or player.name ==  "Elvaine Morgan" then
		exchangeFactionLeader( player.name );
	end

	--TEMPORARY SOLUTION TO CATCH NEW PLAYERS
	if player:getMentalCapacity() < 1999 or player:getQuestProgress(122) == 0 then --Mental Capacity CANNOT drop below 1999 -> New player or cheater. However, new players should start with a higher value

        player:increaseMentalCapacity(2000000); --Maybe reduce to 200000 for brand new players. This is for existing players.
		--base.common.InformNLS(player,"[Skillsystem] Mental Capacity zwangsangepasst!","[Skill system] Adjustment of mental capacity enforced."); --Debuggin'
		player:setQuestProgress(122,1); --Saving the information that the player went throuh this process
	
	end
	--TEMPORARY SOLUTION END

	player:increaseAttrib("foodlevel",-1);

	-- Überprüfung für korrekt initiertes Regenerationsskript
	find, reg_effect = player.effects:find(2);
	if not find then
		player.effects:addEffect( LongTimeEffect(2,10) );
	end

	--Checking longterm cooldown
	find, reg_effect = player.effects:find(33);
	if not find then
		player.effects:addEffect( LongTimeEffect(33,10) );
	end
end

function setNewbiePos(newbieEffect,Character)
	newbieEffect:addValue("newbiePosX",Character.pos.x);
	newbieEffect:addValue("newbiePosY",Character.pos.y);
	newbieEffect:addValue("newbiePosZ",Character.pos.z);
end


function payTaxes(taxPayer)
	yr=world:getTime("year");
	mon=world:getTime("month");
	timeStmp=yr*1000+mon;
	lastTax=taxPayer:getQuestProgress(123);
	if (lastTax~=nil) then
		if lastTax<timeStmp then
			taxPayer:setQuestProgress(123,timeStmp);
			payNow(taxPayer)
		end
	else
		taxPayer:setQuestProgress(123,timeStmp);
		payNow(taxPayer)
	end
end

function receiveGems(gemRecipient)
	local yr=world:getTime("year");
	local mon=world:getTime("minute"); --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
	local timeStmp=yr*1000+mon;
	gemRecipient:inform("time stmp = "..timeStmp);
	local town = base.factions.getMembershipByName(gemRecipient)
	town="Cadomyr";	 --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
	if town == "" then
		return;
	end	
	-- first check if there was a switch already: 
	local fnd, lastSwitch = ScriptVars:find("SwitchedToPayment"..town)
	if fnd then gemRecipient:inform("lastSwitch: = "..lastSwitch) end
	if fnd and lastSwitch<timeStmp then
	gemRecipient:inform("now switching!")
		NewMonthSwitch(town,timeStmp)
	end
	-- now check if last payment was before actual month and actual month is the one to pay out.
	lastGem=gemRecipient:getQuestProgress(124);
	if (lastGem~=nil) then
	gemRecipient:inform("last gem: "..lastGem)
		if timeStmp==lastSwitch and lastGem<timeStmp then
			gemRecipient:setQuestProgress(124,timeStmp);
			gemRecipient:inform("Paying NOW! ")
			payNow(gemRecipient)
		end
	else
		gemRecipient:setQuestProgress(124,timeStmp);
	end
end

function payNow(User)
--Cadomyr = 101
--Runewick = 102
--Galmair = 103
--Hemp Necktie Inn = 104 (not a faction!)
     
	 -- no memeber of any town
	local town = base.factions.getMembershipByName(User)
	if town == "" then
	    return;
	end	

    taxHeight=0.05;  -- 5% taxes
    
	depNr={101,102,103,104};
    valDepot={0,0,0,0};
    for i=1,2 do
        valDepot[i]=base.money.DepotCoinsToMoney(User,depNr[i]);
    end

    valBody=base.money.CharCoinsToMoney(User);
    val=valBody+valDepot[1]+valDepot[2];
    tax=math.floor(val*taxHeight);
    totTax=tax;

    -- try to get it from homedepot:
    if tax<=valDepot[1] then
        base.money.TakeMoneyFromDepot(User,tax,depNr[1]);
    elseif tax<=valDepot[2] then    -- if not possible, just take it from the pub-depot:
        base.money.TakeMoneyFromDepot(User,tax,depNr[2]);
    elseif tax<=valDepot[1]+valDepot[2] then    -- try both, for god's sake!
        base.money.TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        base.money.TakeMoneyFromDepot(User,tax,depNr[2]);
    else    -- last, but not least, get it from wherever you can!
        base.money.TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        base.money.TakeMoneyFromDepot(User,valDepot[2],depNr[2]);
        tax=tax-valDepot[2];
        base.money.TakeMoneyFromChar(User,tax);
    end

	gstring,estring=base.money.MoneyToString(totTax); --converting money to a string
    
	local infText = base.common.GetNLS(User, 
	                                   "Du hast deine monatliche Abgabe an "..town.." gezahlt. Diesen Monat waren es "..gstring..". Die Abgabenhöhe betrug "..(taxHeight*100).."%", 
	                                   "You have paid your monthly tribute to "..town..". This month, it was "..estring..", resulting from a tribute rate of "..(taxHeight*100).."%")
	local title = base.common.GetNLS(User,"Abgabenbenachrichtigung","Tribute information")
	
	local dialog=MessageDialog(title,infText,closeTrib);
    
	local closeTrib=function(onClose)
    -- do nothing
    end

    User:requestMessageDialog(dialog);
	
	base.townTreasure.ChangeTownTreasure(town,tax)
    
end

-- Function to exchange the faction leader of a town.
function exchangeFactionLeader( playerName )
	for i=1, #(scheduled.factionLeader.informationTable) do
		if playerName == scheduled.factionLeader.informationTable[i].npcName then
			scheduled.factionLeader.updatePosition(scheduled.factionLeader.informationTable[i].usualPosition,
				scheduled.factionLeader.informationTable[i].newPosition)
		end
	end
end
