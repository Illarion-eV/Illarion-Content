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
-- called after every player login
require("base.common")
require("base.money")
require("base.factions")
require("content.dailymessage")
require("npc.aldania_elthewan")
require("scheduled.factionLeader")
require("base.townTreasure")
require("base.character")

module("server.login", package.seeall);

-- Load messages of the day
--German
messageG={};
messageG[1]="[Tipp] Leichte R�stungen aus Leder sch�tzen sehr gut gegen stumpfe Waffen aber schlecht gegen Hiebwaffen.";
messageG[2]="[Tipp] Mittlere R�stungen wie Kettenhemden sch�tzen sehr gut gegen Hiebwaffen aber schlecht gegen Stich- und Distanzwaffen.";
messageG[3]="[Tipp] Schwere R�stungen wie Plattenpanzer sch�tzen sehr gut gegen Stich- und Distanzwaffen aber schlecht gegen stumpfe Waffen.";
messageG[4]="[Tipp] Wir spielen miteinander, nicht gegeneinander. Viel Spa� beim Spielen!";
messageG[5]="[Tipp] Bitte besuche uns auch im IRC-Chat: #illarion auf Quakenet.";
messageG[6]="[Tipp] Im Forum sind viele interessante Diskussion und Informationen zu finden. Meld dich gleich an!";
messageG[7]="[Tipp] Wenn du einen Gamemaster erreichen m�chtest, schreibe !gm <Deine Nachricht> im Chatfenster.";
messageG[8]="[Tipp] Br�gon ist der Gott des Feuers.";
messageG[9]="[Tipp] Eldan ist der Gott des Geistes.";
messageG[10]="[Tipp] Findari ist die G�ttin der Luft.";
messageG[11]="[Tipp] Tanora/Zelphia ist die G�ttin des Wassers.";
messageG[12]="[Tipp] Ushara ist die G�ttin der Erde .";
messageG[13]="[Tipp] Adron ist der Gott des Weines und der Feste.";
messageG[14]="[Tipp] Cherga ist die G�ttin der Geister und der Unterwelt.";
messageG[15]="[Tipp] Elara ist die G�ttin des Wissens und der Weisheit.";
messageG[16]="[Tipp] Irmorom ist der Gott des Handels und des Handwerks.";
messageG[17]="[Tipp] Malach�n ist der Gott der Jagd und der Schlachten.";
messageG[18]="[Tipp] Moshran ist der Gott des Blutes und der Gebeine.";
messageG[19]="[Tipp] Narg�n ist der Gott des Chaos.";
messageG[20]="[Tipp] Oldra ist die G�ttin der Fruchtbarkeit und des Lebens.";
messageG[21]="[Tipp] Ronagan ist der Gott der Diebe und der Schatten.";
messageG[22]="[Tipp] Sirani ist die G�ttin der Liebe und der Freude.";
messageG[23]="[Tipp] Zhambra ist der Gott der Freundschaft und Treue.";
messageG[24]="[Tipp] Cadomyr ist das Reich der Ehre.";
messageG[25]="[Tipp] Runewick ist das Reich der Weisheit.";
messageG[26]="[Tipp] Galmair ist das Reich des Reichtums.";
messageG[27]="[Tipp] Manchen Monstern sollte man lieber nicht alleine begegnen.";
messageG[28]="[Tipp] Gegenst�nde von geringer Haltbarkeit drohen zu zerbrechen. Ein Fachmann kann sie ausbessern.";
messageG[29]="[Tipp] Fernwaffen werden nicht umsonst so genannt: stark auf Distanz; nutzlos im Nahkampf.";
messageG[30]="[Tipp] Hiebwaffen sind gut gegen leichte R�stungen, aber schlecht gegen mittlere R�stungen.";
messageG[31]="[Tipp] Stichwaffen sind gut gegen mittlere R�stungen, aber schlecht gegen schwere R�stungen.";
messageG[32]="[Tipp] Stumpfe Waffen sind gut gegen schwere R�stungen, aber schlecht gegen leichte R�stungen.";
messageG[33]="[Tipp] Ein Silberst�ck entspricht einhundert Kupferst�cken. Einhundert Silberst�cke entsprechen einem Goldst�ck.";
messageG[34]="[Tipp] Die besten Alchemisten	leben in Runewick.";
messageG[35]="[Tipp] Die besten Kerzenzieher leben in Runewick.";
messageG[36]="[Tipp] Die besten Schreiner leben in Runewick.";
messageG[37]="[Tipp] Die besten K�che leben in Runewick.";
messageG[38]="[Tipp] Die besten Bauern leben in Runewick.";
messageG[39]="[Tipp] Die besten Kr�uterkundigen leben in Runewick.";
messageG[40]="[Tipp] Die besten Schneider leben in Runewick.";
messageG[41]="[Tipp] Die besten Schmiede leben in Galmair.";
messageG[42]="[Tipp] Die besten Ziegelbrenner leben in Galmair.";
messageG[43]="[Tipp] Die besten Steinmetze leben in Galmair.";
messageG[44]="[Tipp] Die besten Bergarbeiter leben in Galmair.";
messageG[45]="[Tipp] Die besten Brauer leben in Galmair.";
messageG[46]="[Tipp] Die besten Fischer leben in Cadomyr.";
messageG[47]="[Tipp] Die besten Glasbl�ser leben in Cadomyr.";
messageG[48]="[Tipp] Die besten Sandgr�ber leben in Cadomyr.";
messageG[49]="[Tipp] Die besten Kunstschmiede leben in Cadomyr.";
messageG[50]="[Tipp] Die besten Edelsteinschleifer leben in Cadomyr.";
messageG[51]="[Tipp] Jedes Reich ist auf bestimmte Handwerke spezialisiert. Wenn es das, was du ben�tigst, nicht auf dem �rtlichen Markt gibt, wirst du wohl reisen m�ssen.";
messageG[52]="[Tipp] Wenn du Probleme bei der Kommunikation mit einem NPC hast, sage 'Hilfe' um eine Liste der Schl�sselw�rter aufzurufen.";
messageG[53]="[Tipp] Obstb�ume haben schon so manchen hungrigen Abenteurer gerettet. Allerdings ist ein schmackhafteres Mahl stets vorzuziehen.";
messageG[54]="[Tipp] Es gibt viele M�glichkeiten, seinen Charakter zu bewegen: Die linke Maustaste, die Pfeiltasten, den Ziffernblock und WASD.";
messageG[55]="[Tipp] Einen NPC nach einer 'Mission' zu fragen ist ein guter Weg um ein paar einfache M�nzen zu verdienen.";
messageG[56]="[Tipp] Scheue dich nicht, andere Spieler um Hilfe zu bitten. Behandle sie mit Respekt und verwende so weit m�glich den out-of-character-Modus (#o).";
messageG[57]="[Tipp] Mit #i stellst du deinen Charakter anderen Spielern vor. Diese erfahren so den Namen deines Charakters.";
messageG[58]="[Tipp] Der Illarion-Chat ist auf der Homepage verlinkt. Du erh�ltst dort technische Unterst�tzung oder kannst einfach andere Spieler kennenlernen.";
messageG[59]="[Tipp] Der Vollbildmodus kann im Optionsmen� des Clients aktiviert werden.";
messageG[60]="[Tipp] Wenn ein neuer Spieler deinem Reich beitritt erh�ltst du eine kurze Mitteilung. Hei�e ihn doch gleich willkommen!";
messageG[61]="[Tipp] Um der Staatskasse deines Reiches etwas zu spenden, lege es einfach auf das Spendenfeld in der N�he deines Anf�hrers."
messageG[62]="[Tipp] Wenn du auf Reisen gehst, nimm stets Proviant mit. Deine Lebenspunkte regenerieren sich nicht, wenn dein Charakter hungrig ist."
messageG[63]="[Tipp] Laufen ist schneller als Gehen - halte die linke Maustaste gedr�ckt um zu laufen."
messageG[64]="[Tipp] Die meisten NPCs reagieren auf 'Hilfe' mit der Ausgabe einer Liste ihrer wichtigsten Schl�sselw�rter."
messageG[65]="[Tipp] Die Fertigkeiten deines Charakters kannst du aufrufen, indem du 'C' dr�ckst."
messageG[66]="[Tipp] Ein Stapel von Gegenst�nden l��t sich durch Halten der Shift-Taste beim Bewegen aufl�sen."
--messageG[67]="[Tipp] Um die Sprache deines Charakters umzustellen, schreibe '!l' gefolgt von der gew�nschten Sprache: Common, Elf, Human, Dwarf, Halfling, Lizard."

--English
messageE={};
messageE[1]="[Hint] Light armours, such as those made of leather, offer good protection against blunt weapons but perform poorly against slashing weapons.";
messageE[2]="[Hint] Medium armours, such as chain mail, offer good protection against slashing weapons but are more vulnerable to stabbing weapons.";
messageE[3]="[Hint] Heavy armours, such as those made from sturdy metal plates, offer good protection against stabbing weapons but are vulnerable to blunt weapons.";
messageE[4]="[Hint] We play with, not against each other. Have fun playing!";
messageE[5]="[Hint] Please join our IRC chat: #illarion on Quakenet.";
messageE[6]="[Hint] The forum contains many interesting discussions and a lot of useful information. Register today!";
messageE[7]="[Hint] If you want to contact a gamemaster, type !gm <Your message> in the chat box.";
messageE[8]="[Hint] Br�gon is the God of fire.";
messageE[9]="[Hint] Eldan is the God of spirit.";
messageE[10]="[Hint] Findari is the Goddess of air.";
messageE[11]="[Hint] Tanora/Zelphia is the Goddess of water.";
messageE[12]="[Hint] Ushara is the Goddess of earth.";
messageE[13]="[Hint] Adron is the God of festivities and wine.";
messageE[14]="[Hint] Cherga is the Goddess of spirits and the underworld.";
messageE[15]="[Hint] Elara is the Goddess of wisdom and knowledge.";
messageE[16]="[Hint] Irmorom is the God of trade and craftsmanship.";
messageE[17]="[Hint] Malach�n is the God of battle and hunting.";
messageE[18]="[Hint] Moshran is the God of blood and bones.";
messageE[19]="[Hint] Narg�n is the God of chaos.";
messageE[20]="[Hint] Oldra is the Goddess of life and fertility.";
messageE[21]="[Hint] Ronagan is the God of thieves and shadows.";
messageE[22]="[Hint] Sirani is the Goddess of love and pleasure.";
messageE[23]="[Hint] Zhambra is the God of friendship and loyalty.";
messageE[24]="[Hint] Cadomyr is the realm of honour.";
messageE[25]="[Hint] Runewick is the realm of wisdom.";
messageE[26]="[Hint] Galmair is the realm of wealth.";
messageE[27]="[Hint] There are some monsters which you should avoid while adventuring alone.";
messageE[28]="[Hint] Items of low durability might break any time. A specialist can repair them.";
messageE[29]="[Hint] Ranged weapons have their name for a reason; they are useful for distant targets, but useless in a melee.";
messageE[30]="[Hint] Slashing weapons are good against light armour but bad against medium armour.";
messageE[31]="[Hint] Stabbing weapons are good against medium armour but bad against heavy armour.";
messageE[32]="[Hint] Blunt weapons are good against heavy armour but bad against light armour.";
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
messageE[54]="[Hint] There are many ways to move your character around in Illarion. The left mouse button, arrow keys, num pad, and WASD will all work.";
messageE[55]="[Hint] Asking an NPC whether they have a 'quest' for you to carry out can be a good way to earn a quick coin or two.";
messageE[56]="[Hint] Don't be afraid to ask the other players around you for help if you encounter difficulties. But make sure to remain respectful and to use OOC chat (#o), where appropriate.";
messageE[57]="[Hint] Using the '#i' command will introduce your character to any people around them. The other players will then be able to see your character's name.";
messageE[58]="[Hint] The Illarion chat is linked on the homepage. It is useful for technical assistance and for simply getting to know your fellow players.";
messageE[59]="[Hint] Fullscreen mode can be activated from the settings menu when the client is started.";
messageE[60]="[Hint] You will receive a notification when a new player chooses to join your realm. Give them a friendly welcome!";
messageE[61]="[Hint] In order to donate something to your realm's treasury, just place the item on the donation square close to your leader.";
messageE[62]="[Hint] If you go on a journey, always have some rations with you. Your character's hitpoints won't regenerate if your character is hungry.";
messageE[63]="[Hint] Running is faster than walking - hold down the left mouse button to run.";
messageE[64]="[Hint] Most NPCs react on 'help' with a list of their most important keywords.";
messageE[65]="[Hint] You can review the skills of your character by hitting 'C'.";
messageE[66]="[Hint] To split a stack of items, hold shift while moving it.";
--messageE[67]="[Hint] To switch the language of your character, type '!l' followed by the desired language: Common, Elf, Human, Dwarf, Halfling, Lizard.";

-- messages of the day - END

function welcomeNewPlayer(player)
    if not player:isNewPlayer() then
        player:setQuestProgress(851, 0) -- reset session check for newbie welcome dialog
        return
    end

	local onlinePlayers = world:getPlayersOnline()
	for i=1,#onlinePlayers do
	    local user = onlinePlayers[i]

		if not user:isNewPlayer() and user.pos.z ~= -40 then -- no new player and not in the prison mine

			if user:getQuestProgress(851) == 0 then

				local getText = function(deText,enText) return base.common.base.common.GetNLS(user, deText, enText) end

				local callback = function(dialog)
					local success = dialog:getSuccess()
					if success then
						local selected = dialog:getSelectedIndex()+1
						if selected == 1 then
							user:warp(player.pos)
							world:gfx(46, player.pos)
							user:setQuestProgress(850, user:getQuestProgress(850)+1)
						elseif selected == 2 then
							-- nothing
						elseif selected == 3 then
							user:setQuestProgress(851,1)
						end
					end
				end

				local dialog = SelectionDialog(getText("Ein neuer Spieler!","A new player!"), getText("Ein neuer Spieler hat Illarion betreten! M�chtest du deine Hilfe anbieten?", "A new player has entered Illarion! Do you want to offer your help?"), callback)
				dialog:addOption(0, getText("Teleportier mich zu ihm. Ich will helfen!","Warp me to him, let me help!"))
				dialog:addOption(0, getText("Nicht jetzt.", "Not now."))
				dialog:addOption(0, getText("Nicht f�r diese Sitzung.","Not for this session."))
				user:requestSelectionDialog(dialog)
			end
		end
	end
end

function onLogin( player )

	welcomeNewPlayer(player)

	world:gfx(31,player.pos); --A nice GFX that announces clearly: A player logged in.

	--General welcome message
    players=world:getPlayersOnline(); --Reading all players online so we can count them

	if table.getn(players) > 1 then

	    base.common.InformNLS(player,"[Login] Willkommen auf Illarion! Es sind "..table.getn(players).." Spieler online.","[Login] Welcome to Illarion! There are "..table.getn(players).." players online."); --sending a message

	else --player is alone

	    base.common.InformNLS(player,"[Login] Willkommen auf Illarion! Es ist ein Spieler online.","[Login] Welcome to Illarion! There is one player online."); --sending a message

	end

	--Taxes (has to be redone by "someone")
	if not player:isAdmin()  and player.pos.z~=100 and player.pos.z~=101 then --Admins don't pay taxes or get gemss. Not on Noobia!
		if not (player.name == "Valerio Guilianni" or player.name == "Rosaline Edwards" or player.name ==  "Elvaine Morgan") then --leader don't pay taxes or get gems
			-- So let there be taxes!
			local taxText = payTaxes(player);
			local gemText = receiveGems(player);
			if gemText ~= nil or taxText ~= nil then
				informPlayeraboutTaxandGems(player, gemText, taxText)
			end

		end
	end

	if player:getSkill(Character.tactics) > 0 or player:getSkill(Character.dodge) > 0 then
		MergeSkillInform(player);
	end

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
			    dialogNewbie = MessageDialog("Willkommen bei Illarion!", "Eine lange Reise n�hert sich ihrem Ende. Du gehst von Bord des Schiffes und hast endlich wieder festen Boden unter den F��en. In diesem Land wirst du vor eine Entscheidung gestellt, die wohl die wichtigste deines Lebens sein wird.\nDas edle Cadomyr, das weise Runewick oder das reiche Galmair - welchen Weg wirst du einschlagen?\n\nWillkommen bei Illarion, dem kostenlosen Online-Rollenspiel. Dieses Tutorial wird dich auf deinen ersten Schritten begleiten und dir die Bedienung des Spiels beibringen. Du kannst das Tutorial jederzeit �berspringen indem du 'Tutorial �berspringen' zu einem NPC sagst.", callbackNewbie);
		    else
			    dialogNewbie = MessageDialog("Welcome to Illarion!", "A long, tiresome journey finally comes to an end. You disembark the ship and feel solid ground beneath your feet. In these lands, you will soon be faced with a choice, perhaps the most important of your entire life. Noble Cadomyr, wise Runewick, or wealthy Galmair - whose side shall you join?\n\nWelcome to Illarion, the free online roleplaying game. This tutorial will guide you through your first steps and teach you the controls of the game. You may skip the tutorial at any time by saying 'skip tutorial' to an NPC.", callbackNewbie);
		    end

		    player:requestMessageDialog(dialogNewbie); --showing the welcome text

		end --Dialog

    end --Noobia end

    if (not base.common.IsOnNoobia(player.pos)) then --Not on Noobia, confuses noobs

		--Messages of the day
		dailyMessageID=math.random(1,table.getn(messageG)); --chosing a message at random
	    player:inform(messageG[dailyMessageID],messageE[dailyMessageID]); --sending the message
    end

	if player.name == "Valerio Guilianni" or player.name == "Rosaline Edwards" or player.name ==  "Elvaine Morgan" then
		exchangeFactionLeader( player.name );
	end

	--TEMPORARY SOLUTION TO CATCH BUGGED PLAYERS
	if player:getMentalCapacity() < 1999 then --Mental Capacity CANNOT drop below 1999 -> Bugged player or cheater

        player:increaseMentalCapacity(4000000); --This is default for new players.

	end
	--TEMPORARY SOLUTION END

	player:increaseAttrib("foodlevel",-1);

	-- �berpr�fung f�r korrekt initiertes Regenerationsskript
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
	local yr=world:getTime("year");
	local mon=world:getTime("month");
	local timeStmp=yr*1000+mon;
	local lastTax=taxPayer:getQuestProgress(123);
	if (lastTax~=0) then
		if lastTax<timeStmp then
			taxPayer:setQuestProgress(123,timeStmp);
			return payNow(taxPayer)
		end
	else
		taxPayer:setQuestProgress(123,timeStmp);
		return payNow(taxPayer)
	end
end

function receiveGems(gemRecipient)
	local yr=world:getTime("year");
	local mon=world:getTime("month"); --- TODO
	local timeStmp=yr*1000+mon;
	local town = base.factions.getMembershipByName(gemRecipient)
	if town == "None" then
		return;
	end
	-- first check if there was a switch from collecting taxes to pay out gems already:
	local fnd, lastSwitch = ScriptVars:find("SwitchedToPayment"..town)
	--fnd=1
	--lastSwitch=1
	if not fnd then	-- first payout ever:
		base.townTreasure.NewMonthSwitch(town,timeStmp)
		fnd, lastSwitch = ScriptVars:find("SwitchedToPayment"..town)
	end

	if fnd and tonumber(lastSwitch)~=timeStmp then
		base.townTreasure.NewMonthSwitch(town,timeStmp)
		lastSwitch=timeStmp
	end
	-- now check if last payment was before actual month and actual month is the one to pay out.
	lastGem=gemRecipient:getQuestProgress(124);
	if (lastGem~=0) then
		if timeStmp>=tonumber(lastSwitch) and tonumber(lastGem)<timeStmp then
			gemRecipient:setQuestProgress(124,timeStmp);
			return PayOutWage(gemRecipient,town)
		end
	else
		gemRecipient:setQuestProgress(124,timeStmp);
		return PayOutWage(gemRecipient,town)
	end
end

-- transfer
function PayOutWage(Recipient,town)
	local totalTaxes=base.townTreasure.GetPaymentAmount(town)
	local totalPayers=base.townTreasure.GetTaxpayerNumber(town)
	local infText = "";

	--Recipient:inform("in payoutwage "..totalPayers)
	--Recipient:inform("totaltaxes "..totalTaxes)

	if tonumber(totalPayers)>0 then
		if tonumber(totalTaxes)>0 then
			local baseWageUnit=totalTaxes/(totalPayers*10000);		-- 10000: "base unit"; change accordingly if necessary.
			local RecipientRk=base.factions.getRankAsNumber(Recipient)

			--If the recipient is level 1 they don't get anything. Stops abuse! - Flux
			if RecipientRk <2 then

				infText = base.common.GetNLS(Recipient,
	                "Du solltest dich bem�hen, dein Ansehen in "..town.." zu steigern, damit du einen Lohn f�r deine Abgaben erh�ltst.",
					"You should earn favour in "..town.." in order to receive rewards for your tribute.");

				log(string.format("[gems] %s got 0 magic gems from %s. Character's rank: %d",
					base.character.LogText(Recipient), town, RecipientRk))

			else

				local RankedWage=math.ceil(RecipientRk*baseWageUnit*0.5);
				endname="";
				log(string.format("[gems] %s got %d magic gems from %s. Character's rank: %d",
					base.character.LogText(Recipient), RankedWage, town, RecipientRk));
				while RankedWage>0 do
					local randomGem=math.random(1,2);
--					local maxGemLevel=math.floor(RankedWage^(1/3))
					local maxGemLevel = math.floor(math.log(RankedWage)/math.log(3)) + 1
					local gemLevel= base.common.Limit(math.random(1,maxGemLevel), 1, 10)

					local gemsByTown={};
					gemsByTown["Cadomyr"]={item.gems.TOPAZ, item.gems.AMETHYST}
					gemsByTown["Runewick"]={item.gems.EMERALD, item.gems.RUBY}
					gemsByTown["Galmair"]={item.gems.SAPPHIRE, item.gems.OBSIDIAN}

					local gemId = item.gems.getMagicGemId(gemsByTown[town][randomGem]);
					local gemData = item.gems.getMagicGemData(gemLevel);

					local basename={}
					basename=world:getItemName(gemId, Recipient:getPlayerLanguage());

					if Recipient:getPlayerLanguage() == 0 then
						basename = item.gems.gemPrefixDE[gemLevel] .. " magischer " .. basename
					else
						basename = item.gems.gemPrefixEN[gemLevel] .. " magical " .. basename
					end

					endname=endname.."\n"..basename;
					--Recipient:inform("endname= "..endname);
					local notCreated = Recipient:createItem( gemId, 1, 333, gemData );
					if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
						world:createItemFromId( gemId, notCreated, Recipient.pos, true, 333, gemData );
						base.common.HighInformNLS(Recipient,
							"Du kannst nichts mehr halten und der Rest f�llt zu Boden.",
							"You can't carry any more and the rest drops to the ground.");
					end

--					RankedWage=RankedWage-gemLevel^3;
					RankedWage=RankedWage-3^(gemLevel-1)
				end

				infText = base.common.GetNLS(Recipient,
	                                   "Deine loyalen Dienste f�r "..town.." werden mit den folgenden magischen Edelsteinen belohnt:"..endname,
	                                   "Your loyal service to "..town.." is awarded with the following magical gems:"..endname)
			end
			return infText;
		end
	end
end


function MergeSkillInform(User)


		local infText = base.common.GetNLS(User,
						"Illarion hat neue R�stungsfertigkeiten. Deine alten Fertigkeiten Ausweichen und Taktik werden in eine R�stungsfertigkeit deiner Wahl konvertiert. Bitte w�hle eine Option:",
						"Illarion now has new armour skills. Your old dodging and tactics skills will be converted into an armour skill of your choice. Please select an option:");
		local title = base.common.GetNLS(User,"Neue R�stungsfertigkeiten","New Armour Skills")

		local closeTrib=function(onClose)
			MergeSkill(User);
		end

		local dialogue=MessageDialog(title,infText,closeTrib);

		User:requestMessageDialog(dialogue);

end

function MergeSkill(User)

    local names
	if  User:getPlayerLanguage() == Player.german then
		names = {"Leichte R�stungen (gut gegen Schlagwaffen aber schlecht gegen Hiebwaffen)","Mittlere R�stungen (gut gegen Hiebwaffen aber schlecht gegen Stich- und Distanzwaffen)","Schwere R�stungen (gut gegen Stich- und Distanzwaffen aber schlecht gegen Schlagwaffen)"}
	else
		names = {"Light Armour (good against concussion weapons, bad against slashing weapons)","Medium Armour (good against slashing weapons, bad against puncture/distance weapons)","Heavy Armour (good against puncture/distance weapons, bad against concussion weapons)"}
	end
	local items = {364, 2403, 2390}
	local targetSkill = {Character.lightArmour, Character.mediumArmour, Character.heavyArmour}

	local callback = function(dialog)

		success = dialog:getSuccess()

		if success then
					selected = dialog:getSelectedIndex()
				    local newskillValue = math.floor((User:getSkill(Character.tactics)+User:getSkill(Character.dodge))/2);
					local skillValue = User:getSkill(targetSkill[selected+1]); --reading the skill points
     			    User:increaseSkill(targetSkill[selected+1],newskillValue-skillValue);
					User:increaseSkill(Character.dodge,-User:getSkill(Character.dodge));
					User:increaseSkill(Character.tactics,-User:getSkill(Character.tactics));
					User:inform("Du hast " ..names[selected+1].. " ausgew�hlt. Dr�cke 'C' um deine Fertigkeiten zu �berpr�fen.", "You have selected " ..names[selected+1].. ". Hit 'C' to review your skills.")
					world:gfx(46,User.pos)
					world:makeSound(13,User.pos);
		else
			User:inform("Bitte w�hle eine Fertigkeit.", "Please choose a skill.");
			MergeSkill(User);
		end
	end

	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Neue R�stungsfertigkeiten", "Welche R�stungsfertigkeit wirst du nutzen?", callback)
	else
		dialog = SelectionDialog("New Armour Skill", "Which armour skill will you use?", callback)
	end

	for i=1,#items do
		dialog:addOption(items[i], names[i])
	end
	User:requestSelectionDialog(dialog)

	return;
end



function payNow(User)
--Cadomyr = 100
--Runewick = 101
--Galmair = 102
--Hemp Necktie Inn = 103 (not a faction!)
    local infText = "";

	 -- no memeber of any town
	local town = base.factions.getMembershipByName(User)
	if town == "None" then
	    return;
	end

    local taxHeight=0.05;  -- 5% taxes

	local depNr={100,101,102,103};
    local valDepot={0,0,0,0};
	local val = 0;

    for i=1, #(depNr) do
        valDepot[i]=base.money.DepotCoinsToMoney(User,depNr[i]);
		val = val + valDepot[i]; 	--how much money is in the depots combined
    end

	val = val + base.money.CharCoinsToMoney(User); -- total wealth

    tax=math.floor(val*taxHeight);
    local totTax=tax; -- total tax to pay
--	log("[taxes] "..User.id.." paid "..totTax.." copper coins to "..town)

	-- try to get the payable tax from the depots first
	for i=1, #(depNr) do
		if tax<=valDepot[i] then -- if you fild all you need in the first/ next depot, take it.
			base.money.TakeMoneyFromDepot(User,tax,depNr[i]);
			tax = 0;
			break;
		elseif tax ~= 0 and valDepot[i] > 0 then -- if not, take as much as you can from the following depots
			base.money.TakeMoneyFromDepot(User,valDepot[i],depNr[i]);
			tax = tax - valDepot[i];
		end
	end

	if tax ~= 0 then --there wasn't enough cash in the depots, get the rest from the char
		base.money.TakeMoneyFromChar(User,tax);
	end

	gstring,estring=base.money.MoneyToString(totTax); --converting money to a string

	infText = base.common.GetNLS(User,
	                                   "Du hast deine monatliche Abgabe an "..town.." gezahlt. Diesen Monat waren es "..gstring..". Die Abgabenh�he betrug "..(taxHeight*100).."%",
	                                   "You have paid your monthly tribute to "..town..". This month, it was "..estring..", resulting from a tribute rate of "..(taxHeight*100).."%");


	base.townTreasure.ChangeTownTreasure(town,totTax)
	base.townTreasure.IncreaseTaxpayerNumber(town)
	
	log(string.format("[taxes] %s paid %d. Faction wealth of %s increased to %d copper.",
				base.character.LogText(User), totTax, town, base.townTreasure.GetTownTreasure(town)));
    return infText;
end

function informPlayeraboutTaxandGems(User, gemText, taxText)
	local infText = "";
	if taxText ~= nil then
		infText = taxText.."\n\n"
	end
	if gemText ~= nil then
		infText = infText..gemText
	end
	local title = base.common.GetNLS(User,"Abgabenbenachrichtigung","Tribute information")

	local dialog=MessageDialog(title,infText,closeTrib);

	local closeTrib=function(onClose)
    -- do nothing
    end

    User:requestMessageDialog(dialog);

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
