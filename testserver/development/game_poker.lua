require("development.game_carddeck");

module("development.game_poker", package.seeall)

newCardDeck13 = development.game_carddeck.newCardDeck13
newCardDeck52 = development.game_carddeck.newCardDeck52

function newPokerTable( 
                        npcDealer,           -- Dealer npc
                        hundredthId,         -- id of one hundredth money unit, e.g. id of copper coins
                        unitId,              -- id of one money unit, e.g. id of silver coins
                        hundredId,           -- id of hundred money units, e.g. id of gold coins
                        buttonId,            -- id of the button
                        smallBlind,          -- The small blind
                        bigBlind,            -- The big blind
                        listPosSeat,         -- A list with positions of player seats
                        listPosBetUnits,     -- A list with positions of player bet units
                        posPotUnits,         -- Position where the units will be displayed
                        rake,                -- Rake in Percent
                        fileRake             -- Path to the rake file
                      )
                      
    npcDealer:increaseSkill(Character.commonLanguage, 100);

    local indexSet = function()
        local t = {};
        local i;
        for i=1,table.getn( listPosSeat ) do
            t[i] = i;
        end;
        return t;
    end;
    
    local zeroSet = function()
        local t = {};
        local i;
        for i=1,table.getn( listPosSeat ) do
            t[i] = 0;
        end;
        return t;
    end;
                      
    -- definition of internal table state
    local self = {
        -- static part
        npcDealer          = npcDealer,
        hundredthId        = hundredthId,
        unitId             = unitId,
        hundredId          = hundredId,
        buttonId           = buttonId,
        smallBlind         = smallBlind,
        bigBlind           = bigBlind,
        listPosSeat        = listPosSeat,
        listPosBetUnits    = listPosBetUnits,
        posPotUnits        = posPotUnits,
        rake               = rake/100,
        fileRake           = fileRake,
        initialDelay       = 100,
        cardDeck13         = newCardDeck13(),
        cardDeck52         = newCardDeck52(),
        timeoutWarning1    = 200,
        timeoutWarning2    = 600,
        timeoutFinal       = 800,
        tableSize          = table.getn( listPosSeat ),
        
        -- semi dynamic part
        isInit,
        
        -- dynamic part
        gameState          = 0,     -- 0: inactive, 1: small blind, 2: big blind, 3: preflop, 4: flop, 5: turn, 6: river
        activePlayer       = 0,     -- table position of active player
        buttonPlayer       = 0,     -- table position of player on the button
        smallPlayer        = 0,     -- table position of player on the small blind
        bigPlayer          = 0,     -- table position of player on the big blind
        numberPlayer       = 0,     -- number of players in the round
        numberInHand       = 0,     -- number of players still in the hand
        numberAllIn        = 0,     -- number of players still in the hand who went all in
        timeoutCounter     = 0,     -- counter for timeouts
        maxBet             = 0,     -- highest bet in this betting round
        roundRake          = 0,     -- rake from one round
        listPlayer         = {},    -- list of players at the table
        listBets           = {},    -- list of corresponding bets
        listHasFolded      = {},    -- list of players who folded
        listHasShown       = {},    -- list of players who showed their hand
        listIsAllIn        = {},    -- list of players who are all in
        listPots           = { {value=0, listPlayersInPot={}, maxHandValue=0, listPotCandidates={} } },    -- list of pots; contains elements of type {value, listPlayersInPot}
        listPocket1        = {},    -- list of 1st pocket cards
        listPocket2        = {},    -- list of 2nd pocket cards
        listBoard          = {},    -- list of public cards
        listIndex          = indexSet(),
    };
    
    local compareBets = function( index1, index2 )
        return not self.listBets[index1] or ( self.listBets[index2] and self.listBets[index1] < self.listBets[index2] );
    end;
    
    local compareColorValueDesc = function( card1, card2 )
        return ( card1.getColor() > card2.getColor() ) or ( ( card1.getColor() == card2.getColor() ) and ( card1.getValue() > card2.getValue() ) );
    end;
    
    local compareValueDesc = function( card1, card2 )
        return ( card1.getValue() > card2.getValue() );
    end;
    
    local evaluateHand = function()
        local start;
    
        -- load all seven cards
        local i;
        local cardsByColor = {};
        local cardsByValue = {};
        for i=1,5 do
            cardsByColor[i] = self.listBoard[i];
            cardsByValue[i] = self.listBoard[i];
        end;
        cardsByColor[6] = self.listPocket1[self.activePlayer];
        cardsByValue[6] = self.listPocket1[self.activePlayer];
        cardsByColor[7] = self.listPocket2[self.activePlayer];
        cardsByValue[7] = self.listPocket2[self.activePlayer];
        
        -- sort them by color and, in case of a tie, by value descending
        table.sort( cardsByColor, compareColorValueDesc );
        -- sort by Value descending
        table.sort( cardsByValue, compareValueDesc );
        
        -- test for straight flush
        start = 1;
        i = 2;
        while start <= 3 do -- if start >= 4, then we have less than 5 cards to form a straight flush, so we can abort
            if i-start == 5 or (i-start == 4 and cardsByValue[1].getValue()==13 and cardsByColor[start].getValue()==4) then
                return { value=8000000+cardsByColor[start].getValue(), descDe="Straight Flush", descEn="straight flush" };
            end;
            if ( cardsByColor[i].getColor() ~= cardsByColor[start].getColor() )
            or ( cardsByColor[i].getValue() ~= cardsByColor[i-1].getValue()-1 ) then
                start = i;
            end;
            i = i + 1;
        end;
        
        -- test for quads
        start = 1;
        i = 2;
        while start <= 4 do -- if start >= 5, then we have less than 4 cards to get four of a kind, so we can abort
            if i-start == 4 then
                return { value=7000000+cardsByValue[start].getValue()*14+cardsByValue[start==1 and 5 or 1].getValue(), descDe="Vierling", descEn="four of a kind" };
            end;
            if cardsByValue[i].getValue() ~= cardsByValue[i-1].getValue() then
                start = i;
            end;
            i = i + 1;
        end;
        
        -- test for full house
        start = 1;
        local val2;
        local val3;
        i = 2;
        while start <= 3 or (start <= 6 and val3) or (start <= 5 and val2) do
            if i-start == 2 and not val2 then
                val2 = cardsByValue[start].getValue();
            elseif i-start == 3 then
                val3 = cardsByValue[start].getValue();
                if val2 == val3 then
                    val2 = nil;
                end;
            end;
            
            if val3 and val2 then
                return { value=6000000+val3*14+val2, descDe="Full House", descEn="full house" };
            end;
                        
            if cardsByValue[i].getValue() ~= cardsByValue[i-1].getValue() then
                start = i;
            end;
            i = i + 1;
        end;
        
        -- test for flush
        start = 1;
        i = 2;
        while start <= 3 do -- if start >= 4, then we have less than 5 cards to form a flush, so we can abort
            if i-start == 5 then
                return { value=5000000+cardsByColor[start].getValue(), descDe="Flush", descEn="flush" };
            end;
            if ( cardsByColor[i].getColor() ~= cardsByColor[start].getColor() ) then
                start = i;
            end;
            i = i + 1;
        end;
        
        -- test for straight
        local count = 1;
        start = 1;
        i = 2;
        while i<=7 or count==5 or (count==4 and cardsByValue[1].getValue()==13) do -- if start >= 4, then we have less than 5 cards to form a straight, so we can abort
            if count == 5 or (count == 4 and cardsByValue[1].getValue()==13 and cardsByValue[start].getValue()==4) then
                return { value=4000000+cardsByValue[start].getValue(), descDe="Straight", descEn="straight" };
            end;
            if ( cardsByValue[i].getValue() == cardsByValue[i-1].getValue()-1 ) then
                count = count + 1;
            elseif ( cardsByValue[i].getValue() < cardsByValue[i-1].getValue()-1 ) then
                start = i;
                count = 1;
            end;
            i = i + 1;
        end;
        
        -- test for three of a kind
        start = 1;
        i = 2;
        while start <= 5 do -- if start >= 6, then we have less than 3 cards to get three of a kind, so we can abort
            if i-start == 3 then
                local kicker1 = cardsByValue[ start>1 and 1 or 4 ].getValue();
                local kicker2 = cardsByValue[ start>2 and 2 or 5 ].getValue();
                return { value=3000000+(cardsByValue[start].getValue()*14+kicker1)*14+kicker2, descDe="Drilling", descEn="three of a kind" };
            end;
            if cardsByValue[i].getValue() ~= cardsByValue[i-1].getValue() then
                start = i;
            end;
            i = i + 1;
        end;
        
        -- test for two pairs
        start = 1;
        kicker1 = nil;
        local pairval1;
        local pairval2;
        i = 2;
        while start <= 4 or (start <= 6 and pairval1) do -- if start >= 5, then we have less than 4 cards to get two pairs, so we can abort
            if i-start == 2 then
                if not pairval1 then
                    pairval1 = cardsByValue[start].getValue();
                    if start > 1 then
                        kicker1 = cardsByValue[1].getValue();
                    end;
                else
                    pairval2 = cardsByValue[start].getValue();
                    if not kicker1 then
                        kicker1 = cardsByValue[start == 3 and 5 or 3].getValue();
                    end;
                    return { value=2000000+(pairval1*14+pairval2)*14+kicker1, descDe="zwei Paare", descEn="two pair" };
                end;
            end;
                        
            if cardsByValue[i].getValue() ~= cardsByValue[i-1].getValue() then
                start = i;
            end;
            i = i + 1;
        end;
        
        -- test for one pair
        local kicker3;
        start = 1;
        i = 2;
        while start <= 6 do -- if start >= 7, then we have less than 2 cards to get a pair, so we can abort
            if i-start == 2 then
                pairval1 = cardsByValue[start].getValue();
                kicker1 = cardsByValue[start == 1 and 3 or 1].getValue();
                kicker2 = cardsByValue[start  > 2 and 2 or 4].getValue();
                kicker3 = cardsByValue[start  > 3 and 3 or 5].getValue();
                return { value=1000000+((pairval1*14+kicker1)*14+kicker2)*14+kicker3, descDe="ein Paar", descEn="one pair" };
            end;
                        
            if cardsByValue[i].getValue() ~= cardsByValue[i-1].getValue() then
                start = i;
            end;
            i = i + 1;
        end;
        
        start = 0;
        for i=1,5 do
            start = start*14 + cardsByValue[i].getValue();
        end;
        return { value=start, descDe="höchste Karte", descEn="high card" };
    end;
    
    local talkDealer = function(german, english)
        self.npcDealer:talkLanguage(Character.say, Character.german, german)
        self.npcDealer:talkLanguage(Character.say, Character.english, english)
    end
    
    local showHand = function()
        local strDe, strEn;
        strDe = self.listPocket1[self.activePlayer].getGermanShort() .. " " .. self.listPocket2[self.activePlayer].getGermanShort() .. " [";
        strEn = self.listPocket1[self.activePlayer].getEnglishShort() .. " " .. self.listPocket2[self.activePlayer].getEnglishShort() .. " [";
        local i=1;
        while self.listBoard[i] do
            strDe = strDe .. " " .. self.listBoard[i].getGermanShort();
            strEn = strEn .. " " .. self.listBoard[i].getEnglishShort();
            i = i + 1;
        end;
        strDe = strDe .. " ]";
        strEn = strEn .. " ]";
        local eval = evaluateHand();
        self.talkDealer("Sitz "..self.activePlayer.." zeigt die Karten: "..str.. " ("..eval.descDe..")",
                        "Seat "..self.activePlayer.." shows his cards: "..str.. " ("..eval.descEn..")");
        
        i = 1;

        while i <= table.getn(self.listPots) and self.listPots[i].listPlayersInPot[ self.activePlayer ] do
            if eval.value > self.listPots[i].maxHandValue then
                self.listPots[i].maxHandValue = eval.value;
                self.listPots[i].listPotCandidates = { self.activePlayer };
            elseif eval.value == self.listPots[i].maxHandValue then
                table.insert( self.listPots[i].listPotCandidates, self.activePlayer );
            end;
            i = i + 1;
        end;
        self.listHasShown[ self.activePlayer ] = true;
    end;
    
    local clearField = function( p )
        local delete = true;
        while delete and world:isItemOnField( p ) do
            item = world:getItemOnField( p );
            if ( item.wear < 255 ) or ( ( item.wear == 255 ) and ( ( item.id == self.unitId ) or ( item.id == self.buttonId ) ) ) then
                world:erase( item, item.number );
            else
                delete = false;
            end;
        end;
    end;
  
    local clearFields = function()
        local i;
        for i=1,self.tableSize do
            clearField( self.listPosBetUnits[ i ] );
        end;
        clearField( self.posPotUnits );
    end;
    
    local setFixedItemOnField = function( id, amount, pos )
        if amount > 0 then
            local item = world:createItemFromId( id, amount, pos, true, 333, nil );
            item.wear = 255;
            world:changeItem( item );
        end;
    end;
    
    local setPlayerMoneyOnTable = function()
        local seat   = self.activePlayer;
        local amount = self.listBets[ seat ] or 0;
        local posU   = self.listPosBetUnits[ seat ];
        clearField( posU );
        if seat == self.buttonPlayer then
            setFixedItemOnField( self.buttonId, 1, posU );
        end;
        setFixedItemOnField( self.unitId, amount, posU );
    end;
    
    local setPotOnTable = function( amount )
        local posU = self.posPotUnits;
        clearField( posU );
        setFixedItemOnField( self.unitId, amount, posU );
    end;

    local init = function()
        if not self.isInit then
            clearFields();
            self.isInit = true;
        end;
    end;
    
    local reset = function() -- reset all dynamic variables
        self.isInit             = false;
        self.gameState          = 0;
        self.activePlayer       = 0;
        self.buttonPlayer       = 0;
        self.smallPlayer        = 0;
        self.bigPlayer          = 0;
        self.numberPlayer       = 0;
        self.numberInHand       = 0;
        self.numberAllIn        = 0;
        self.timeoutCounter     = 0;
        self.maxBet             = 0;
        self.roundRake          = 0;
        self.listPlayer         = {};
        self.listBets           = {};
        self.listHasFolded      = {};
        self.listHasShown       = {};
        self.listIsAllIn        = {};
        self.listPots           = { {value=0, listPlayersInPot={}, maxHandValue=0, listPotCandidates={} } };
        self.listPocket1        = {};
        self.listPocket2        = {};
        self.listBoard          = {};
    end;
    
    local debugReset = function() -- reset and print a message
        reset();
        self.npcDealer:talk(Character.yell, "### program incomplete - game aborted and reset ###");
    end;
    
    local errorReset = function( msg ) -- reset and print a message
        reset();
        self.npcDealer:talk(Character.yell, "### CRITICAL ERROR: '"..msg.."' - game aborted and reset ###");
    end;
    
    local gameReset = function() -- reset and print a message
        local n    = self.numberPlayer;
        local list = self.listPlayer;
        self.talkDealer("Nicht genug Spieler, Runde beendet. Warten wir auf weitere Mitspieler.", "Not enough players, round ended. We will wait for more to join.");
        reset();
        self.numberPlayer = n;
        self.listPlayer   = list;
    end;
    
    local nextPlayer = function() -- set activePlayer to id of next active player
        local i;
        local nextId;
        for i=1,self.tableSize-1 do
            nextId = 1 + math.mod( self.activePlayer+i-1, self.tableSize );
            if self.listPlayer[nextId] and not self.listHasFolded[nextId] and ( not self.listIsAllIn[nextId] or self.gameState == 7 ) then
                self.activePlayer = nextId;
                return false;
            end;
        end;
        return true; -- drawing all cards
    end;
    
    local isTimeout = function()
        if self.timeoutCounter >= self.timeoutFinal then
            self.timeoutCounter = 0;
            self.listHasFolded[self.activePlayer] = true;
            self.numberInHand = self.numberInHand - 1;
            if self.gameState < 3 then -- still blinds -> out of game
                self.listPlayer[self.activePlayer] = nil;
                self.numberPlayer = self.numberPlayer - 1;
                self.talkDealer("Sitz "..self.activePlayer.." hat den Blind nicht gesetzt und das Spiel verlassen.", "Seat "..self.activePlayer.." did not place the blind and has left the game.");
            else
                self.talkDealer("Sitz "..self.activePlayer.." hat gepasst.", "Seat "..self.activePlayer.." has folded.");                
            end;
            return true;
        elseif self.timeoutCounter == self.timeoutWarning2 then
            self.talkDealer("Sitz "..self.activePlayer.." hat "..math.floor((self.timeoutFinal-self.timeoutWarning2)/10).." Sekunden um zu handeln.",
                            "Seat "..self.activePlayer.." has "..math.floor((self.timeoutFinal-self.timeoutWarning2)/10).." seconds to act.");
        elseif self.timeoutCounter == self.timeoutWarning1 then
            self.talkDealer("Sitz "..self.activePlayer.." hat "..math.floor((self.timeoutFinal-self.timeoutWarning1)/10).." Sekunden um zu handeln.",
                            "Seat "..self.activePlayer.." has "..math.floor((self.timeoutFinal-self.timeoutWarning1)/10).." seconds to act.");
        end;
        self.timeoutCounter = self.timeoutCounter + 1;
        return false;
    end;
    
    local bet = function( amount ) -- return true if successful
        local _amount = amount;
        local p = self.listPlayer[ self.activePlayer ];
        local hundredths = p:countItem( self.hundredthId );
        local units = p:countItem( self.unitId );
        local hundreds = p:countItem( self.hundredId );
        
        if amount > hundreds*100+units+hundredths/100 then
            return false, hundreds*100 + units + math.floor( hundredths/100 );
        end;
        
        hundredths = (amount*100 <= hundredths) and (amount) or (math.floor(hundredths/100));
        amount = amount - hundredths;
        p:eraseItem( self.hundredthId, hundredths*100 );
        
        if amount <= units then
            p:eraseItem( self.unitId, amount );
        else
            amount = amount - units;
            hundreds = math.ceil( amount/100 );
            p:eraseItem( self.hundredId, hundreds );
            units = units + amount - hundreds*100;
            if units > 0 then
                p:eraseItem( self.unitId, units );
            elseif units < 0 then
                p:createItem( self.unitId, -units, 333, nil);
            end;
        end;
        
        self.listBets[ self.activePlayer ] = (self.listBets[ self.activePlayer ] or 0) + _amount;
        
        setPlayerMoneyOnTable();
        
        return true;
    end;
    
    local nextRound = function() -- start a new round, move button
        -- store self.roundRake
        filepoint,errmsg=io.open( self.fileRake , "r+" );
        if (filepoint~=nil) then
            filepoint:seek("set");
            self.roundRake = self.roundRake * 100 + filepoint:read("*n");
            filepoint:seek("set");
            filepoint:write(""..self.roundRake);
            filepoint:close();
        end 
        
        self.isInit             = false;
        init();
        self.gameState          = 0;
        self.smallPlayer        = 0;
        self.bigPlayer          = 0;
        self.numberInHand       = 0;
        self.numberAllIn        = 0;
        self.timeoutCounter     = 0;
        self.maxBet             = 0;
        self.roundRake          = 0;
        self.listBets           = {};
        self.listHasFolded      = {};
        self.listHasShown       = {};
        self.listIsAllIn        = {};
        self.listPots           = { {value=0, listPlayersInPot={}, maxHandValue=0, listPotCandidates={}} };
        self.listPocket1        = {};
        self.listPocket2        = {};
        self.listBoard          = {};
        
        self.activePlayer       = self.buttonPlayer;
        nextPlayer();
        self.buttonPlayer       = self.activePlayer;
        self.talkDealer("Sitz "..self.buttonPlayer.." ist jetzt am Button.", "Seat "..self.buttonPlayer.." is now on the button.");
        bet(0);
        nextPlayer();
    end;
    
    local payPlayer = function( pid, amount )
        local player = self.listPlayer[pid]
        
        if player and isValidChar(player) then
            local ints = math.floor( amount );
            player:createItem( self.hundredthId, ( amount - ints ) * 100, 333, nil );
            player:createItem( self.unitId, math.mod( ints, 100 ), 333, nil );
            player:createItem( self.hundredId, math.floor( ints / 100 ), 333, nil );
        end
    end;
    
    local payPotsToPlayer = function()
        local i;
        local money = 0;
        for i=1,table.getn( self.listPots ) do
            money = money + self.listPots[i].value;
        end;
        for i=1,self.tableSize do
            if self.listBets[i] then
                money = money + self.listBets[i];
            end;
        end;
        payPlayer( self.activePlayer, money );
        self.talkDealer("Sitz "..self.activePlayer.." gewinnt "..money..".", "Seat "..self.activePlayer.." wins "..money..".");
    end;
    
    local informSeat = function(german, english, seat)
        local seatNumber = seat or self.activePlayer
        local player = self.listPlayer[seatNumber]
        
        if player and isValidChar(player) then
            player:inform(german, english, Character.highPriority)
        end
    end
    
    local showAvailableCards = function()
        local strDe, strEn;
        strEn = self.listPocket1[self.activePlayer].getGermanShort() .. " " .. self.listPocket2[self.activePlayer].getGermanShort() .. " [";
        strEn = self.listPocket1[self.activePlayer].getEnglishShort() .. " " .. self.listPocket2[self.activePlayer].getEnglishShort() .. " [";
        local i=1;
        while self.listBoard[i] do
            strDe = strDe .. " " .. self.listBoard[i].getGermanShort();
            strEn = strEn .. " " .. self.listBoard[i].getEnglishShort();
            i=i+1;
        end;
        strDe = strDe .. " ]";
        strEn = strEn .. " ]";
        self.informSeat("Verfügbare Karten: "..strDe, "Available cards: "..strEn);
    end;
    
    local nextCycle = function()
        local i;
        if self.gameState == 0 then -- game inactive, not enough players (at least two players necessary)
            init();
            local oldNumberPlayer = self.numberPlayer;
            for i=1,self.tableSize do
                posi=self.listPosSeat[i];
                if world:isCharacterOnField(posi) then
                    char = world:getCharacterOnField(posi);
                    if not self.listPlayer[i] or (self.listPlayer[i].id ~= char.id) then
                        self.listPlayer[i] = char;
                        self.numberPlayer = self.numberPlayer + 1;
                        self.talkDealer("Sitz "..i.." wurde belegt.", "Seat "..i.." has been taken.");
                    end;
                else
                    if self.listPlayer[i] then
                        self.listPlayer[i] = nil;
                        self.numberPlayer = self.numberPlayer - 1;
                        self.talkDealer("Sitz "..i.." wurde frei.", "Seat "..i.." has become vacant.");
                    end;                    
                end;
            end;
            if self.numberPlayer >= 2 then -- enough players, but wait some seconds if more want to join
                if oldNumberPlayer < 2 then
                    self.talkDealer("Die nächste Runde beginnt in "..math.ceil(self.initialDelay/10).." Sekunden.", "The next round will start in "..math.ceil(self.initialDelay/10).." seconds.");
                end;
                self.timeoutCounter = self.timeoutCounter + 1;
                if self.timeoutCounter >= self.initialDelay then
                    self.timeoutCounter = 0;
                    self.gameState = 1;
                    self.talkDealer("Willkommen zu einer weiteren Runde Poker!", "Welcome to another round of poker!");
                end;
            else
                if oldNumberPlayer >= 2 then
                    self.talkDealer("Zu viele Spieler haben den Tisch verlassen, wir werden warten müssen.",
                                    "Too many players left the table, we will have to wait.");
                end;
                self.timeoutCounter = 0;
            end;
        elseif (self.gameState == 1) then -- small blind
            if self.activePlayer == 0 then -- determine position of the button and then the small blind
                self.cardDeck13.shuffle();
                local card;
                local value=1;
                local cardHigh;
                for i=1,self.tableSize do
                    if self.listPlayer[i] then
                        card = self.cardDeck13.draw();
                        if card.getValue() > value then
                            value = card.getValue();
                            cardHigh = card;
                            self.buttonPlayer = i;
                        end;
                        self.informSeat("Du erhältst "..card.getGerman(), "You got the "..card.getEnglish(), i);
                    end;
                end;
                self.activePlayer = self.buttonPlayer;
                bet( 0 );
                self.talkDealer("Sitz "..self.buttonPlayer.." hat die höchste Karte ("..cardHigh.getGermanShort()..") und ist jetzt am Button.",
                                "Seat "..self.buttonPlayer.." has the highest card ("..cardHigh.getEnglishShort()..") and is now on the button.");
                nextPlayer();
            else                           -- wait for small blind
                if self.timeoutCounter == 0 then
                    self.numberInHand = self.numberPlayer;
                    self.talkDealer("Sitz "..self.activePlayer..", bitte setze den Small Blind.", "Seat "..self.activePlayer..", please place the small blind.");
                    self.informSeat("Du kannst jetzt den Small Blind setzen", "You can now place the small blind");
                end;
                if isTimeout() then
                    if self.numberPlayer < 2 then
                        gameReset();
                    else
                        nextPlayer();
                    end;
                end;
            end;
        elseif (self.gameState == 2) then -- wait for big blind  
            if self.timeoutCounter == 0 then
                self.talkDealer("Sitz "..self.activePlayer..", bitte setze den Big Blind.", "Seat "..self.activePlayer..", please place the big blind.");
                self.informSeat("Du kannst jetzt den Big Blind setzen", "You can now place the big blind");
            end;
            if isTimeout() then
                if self.numberPlayer < 2 then
                    payPlayer( self.smallPlayer, self.smallBlind );
                    self.talkDealer("Sitz "..self.smallPlayer.." erhält den Small Blind zurück.", "Seat "..self.smallPlayer.." gets back the small blind.");
                    gameReset();
                else
                    nextPlayer();
                end;
            end;
        elseif (self.gameState >= 3) and (self.gameState <= 6) then -- betting
            if self.timeoutCounter == 0 then
                self.talkDealer("Sitz "..self.activePlayer..", du bist dran.", "Seat "..self.activePlayer..", it is your turn.");
               
                showAvailableCards();
                
                if self.maxBet == 0 then
                    strDe = "check und bet";
                    strEn = "check and bet";
                elseif self.gameState == 3 and self.activePlayer == self.bigPlayer and self.maxBet == self.bigBlind then
                    strDe = "check und raise";
                    strEn = "check and raise";
                else
                    strDe = "call und raise";
                    strEn = "call and raise";
                end;
                self.informSeat("Mögliche Aktionen: fold, "..strDe, "You can now fold, "..strEn);
            end;
            if isTimeout() then
                if self.numberInHand < 2 then
                    nextPlayer();
                    payPotsToPlayer();
                    gameReset();
                else
                    nextPlayer();
                end;
            end;
	    elseif self.gameState == 7 then -- showdown
	        if self.timeoutCounter == 0 then
	            self.talkDealer("Was möchtest du mit deinen Karten machen, Sitz "..self.activePlayer.."?", "What will you do with your cards, seat "..self.activePlayer.."?");
	            showAvailableCards();
                self.informSeat("Mögliche Aktionen: fold oder show", "You can now fold or show your cards");
	        end;
            if isTimeout() then
	            if self.numberInHand < 2 then
	                nextPlayer();
                    payPotsToPlayer();
		            gameReset();
		        else
		            nextPlayer();
		        end;
            end;
        else    
            -- die
            debugReset();
        end;
    end
    
    local receiveText = function (texttype, message, originator)
        if not self.listPlayer[self.activePlayer] then
            return
        end
        if not isValidChar(self.listPlayer[self.activePlayer]) then
            return
        end
        if (originator.id == self.listPlayer[self.activePlayer].id) and ( originator.pos == self.listPosSeat[self.activePlayer] ) then
            if (self.gameState == 1) then -- small blind
                if string.find( message, "[Bb]lind" ) then
                    if bet( self.smallBlind ) then
                        self.smallPlayer = self.activePlayer;
                        self.talkDealer("Sitz "..self.activePlayer.." setzt den Small Blind.", "Seat "..self.activePlayer.." places the small blind.");
                        nextPlayer();
                        self.gameState = 2;
                        self.timeoutCounter = 0;
                    else
                        self.informSeat("Du hast nicht genug Geld um den Small Blind zu bezahlen", "You do not have enough money to cover the small blind");
                    end;
                end;
            elseif (self.gameState == 2) then -- big blind
                if string.find( message, "[Bb]lind" ) then
                    if bet( self.bigBlind ) then
                        self.bigPlayer = self.activePlayer;
                        self.talkDealer("Sitz "..self.activePlayer.." setzt den Big Blind.", "Seat "..self.activePlayer.." places the big blind.");
                        self.talkDealer("#me teilt die Pocket Cards aus.", "#me deals the pocket cards.");
                        self.cardDeck52.shuffle();
                        local i;
                        for i=1,self.tableSize do
                            if self.listPlayer[i] then
                                self.listPocket1[i] = self.cardDeck52.draw();
                                self.informSeat("Du erhältst "..self.listPocket1[i].getGerman().." als erste Pocket Card",
                                                "You got the "..self.listPocket1[i].getEnglish().." as first pocket card", i);
                            end;
                        end;
                        for i=1,self.tableSize do
                            if self.listPlayer[i] then
                                self.listPocket2[i] = self.cardDeck52.draw();
                                self.informSeat("Du erhältst "..self.listPocket2[i].getGerman().." als zweite Pocket Card",
                                                "You got the "..self.listPocket2[i].getEnglish().." as second pocket card", i);
                            end;
                        end;
                        nextPlayer();
                        self.maxBet = self.bigBlind;
                        self.gameState = 3;
                        self.timeoutCounter = 0;
                    else
                        self.informSeat("Du hast nicht genug Geld um den Big Blind zu bezahlen", "You do not have enough money to cover the big blind");
                    end;
                end;                
            elseif (self.gameState >= 3) and (self.gameState <= 6) then -- betting
                local cont = false;
                if string.find( message, "[Ff]old" ) then
                    self.listHasFolded[self.activePlayer] = true;
                    self.listBets[self.activePlayer] = self.listBets[self.activePlayer] or 0;
                    self.numberInHand = self.numberInHand - 1;
                    self.talkDealer("Sitz "..self.activePlayer.." passt.", "Seat "..self.activePlayer.." folds.");
                    if self.numberInHand < 2 then
                        nextPlayer();
                        payPotsToPlayer();
                        nextRound();
                    else
                        cont = true;
                    end;
                elseif self.maxBet == 0 or ( self.gameState == 3 and self.activePlayer == self.bigPlayer and self.maxBet == self.bigBlind and string.find( message, "[Cc]heck" ) ) then
                    -- check / bet
                    if string.find( message, "[Cc]heck" ) then
                        if self.maxBet == 0 then
                            self.listBets[self.activePlayer] = 0;
                        end;
                        self.talkDealer("Sitz "..self.activePlayer.." wartet ab.", "Seat "..self.activePlayer.." checks.");
                        cont = true;
                    elseif string.find( message, "[Bb]et" ) then
                        local amount;
                        _, _, amount = string.find( message, "[Bb]et%s(%d+)")
                        amount = tonumber( amount );
                        if amount then
                            if amount >= self.bigBlind then
                                if bet( amount ) then
                                    self.listBets[self.activePlayer] = amount;
                                    self.maxBet = amount;
                                    self.talkDealer("Sitz "..self.activePlayer.." setzt "..amount..".", "Seat "..self.activePlayer.." bets "..amount..".");
                                    cont = true;
                                else
                                    self.informSeat("Du hast nicht genug Geld für diesen Einsatz", "You do not have enough money to cover this bet");
                                end;
                            else
                                self.informSeat("Du musst mindestens den Big Blind setzen ("..self.bigBlind..")", "You have to bet at least the big blind ("..self.bigBlind..")");
                            end;
                        else
                            self.informSeat("Du musst einen bestimmten Betrag setzen", "You have to bet a certain amount");
                        end;                            
                    end;                        
                else
                    -- call / raise
                    if string.find( message, "[Cc]all" ) and not ( self.gameState == 3 and self.activePlayer == self.bigPlayer and self.maxBet == self.bigBlind ) then
                        local success;
                        local pMoney;
                        success, pMoney = bet( self.maxBet - (self.listBets[self.activePlayer] or 0) );
                        if success then
                            self.listBets[self.activePlayer] = self.maxBet;
                            self.talkDealer("Sitz "..self.activePlayer.." geht "..self.maxBet.." mit.", "Seat "..self.activePlayer.." calls "..self.maxBet..".");
                            cont = true;
                        else
                            bet( pMoney );
                            self.listIsAllIn[self.activePlayer] = true;
                            self.numberAllIn = self.numberAllIn + 1;
                            self.talkDealer("Sitz "..self.activePlayer.." geht mit und ist mit "..self.listBets[self.activePlayer].." all-in.",
                                            "Seat "..self.activePlayer.." calls all in with "..self.listBets[self.activePlayer]..".");
                            cont = true;
                        end;
                    elseif string.find( message, "[Rr]aise" ) then
                        local amount;
                        _, _, amount = string.find( message, "[Rr]aise%s(%d+)");
                        amount = tonumber( amount );
                        if amount then
                            if amount >= self.bigBlind+self.maxBet then
                                if bet( amount - (self.listBets[self.activePlayer] or 0) ) then
                                    self.listBets[self.activePlayer] = amount;
                                    self.maxBet = amount;
                                    self.talkDealer("Sitz "..self.activePlayer.." erhöht auf "..amount..".", "Seat "..self.activePlayer.." raises to "..amount..".");
                                    cont = true;
                                else
                                    self.informSeat("Du hast nicht genug Geld für diese Erhöhung", "You do not have enough money to cover this raise");
                                end;
                            else
                                self.informSeat("Du musst mindestens auf den aktuellen Einsatz plus Big Blind erhöhen ("..(self.bigBlind+self.maxBet)..")",
                                                "You have to raise to the current maximum bet/raise plus the big blind ("..(self.bigBlind+self.maxBet)..") at least");
                            end;
                        else
                            self.informSeat("Du musst auf einen bestimmten Betrag erhöhen", "You have to raise to a certain amount");
                        end;
                    end;
                end;
                if cont then
                    -- continue to next player or next round
                    nextPlayer();
                    self.timeoutCounter = 0;
                    if self.listBets[self.activePlayer] and ( self.maxBet == (self.listBets[self.activePlayer] ) )
                       and not ( self.gameState == 3 and self.activePlayer == self.bigPlayer and self.maxBet == self.bigBlind ) then -- next round
                        -- BEGIN: move money into pot(s)
                        local i;
                        for i=1,self.tableSize do
                            if self.listBets[i] == nil then
                                self.listBets[i] = -1;
                            end;
                        end;
                        table.sort( self.listIndex, compareBets );
                        for i=1,self.tableSize do
                            if self.listBets[i] == -1 then
                                self.listBets[i] = nil;
                            end;
                        end;
                        i = 1;
			            local idx;
			            local z;
                        while self.listBets[ self.listIndex[ self.tableSize ] ] > 0 do
			                idx = self.listIndex[ i ];
                            if self.listBets[ idx ] and self.listBets[ idx ] > 0 then
                                if i == self.tableSize then
                                    payPlayer( idx, self.listBets[ idx ] );
                                    self.talkDealer("Sitz "..idx.." erhält "..self.listBets[ idx ].." zurück.",
                                                    "Seat "..idx.." receives back "..self.listBets[ idx ]..".");
                                    self.listBets[ idx ] = 0;
                                else
	                                local pot = self.listPots[ table.getn( self.listPots ) ];
                                    for z=i+1,self.tableSize do
                                        self.listBets[ self.listIndex[ z ] ] = self.listBets[ self.listIndex[ z ] ] - self.listBets[ idx ];
		                                pot.listPlayersInPot[ self.listIndex[ z ] ] = true; 
	                                end;
		                            local money = self.listBets[ idx ] * ( self.tableSize - i + 1 );
		                            
		                            -- Rake
		                            local currentRake = math.floor(money * self.rake);
		                            self.roundRake = self.roundRake + currentRake;
		                            
                                    pot.value = pot.value + money - currentRake;
		                            self.listBets[ idx ] = 0;
		                            pot.listPlayersInPot[ idx ] = true;
		                            if self.listBets[ self.listIndex[ self.tableSize ] ] > 0 then
		                                self.talkDealer("#me nimmt einen Pot von "..pot.value.." beiseite.", "#me moves a pot of "..pot.value.." aside.");
                                        table.insert( self.listPots, { value=0, listPlayersInPot = {}, maxHandValue = 0, listPotCandidates = {} } );
		                            end;
		                        end;
		                    end;
		                    i = i + 1;
                        end;                        
                        
                        -- reset bets
                        self.listBets = {};
                        
                        -- graphical part
                        clearFields();
                        setFixedItemOnField( self.buttonId, 1, self.listPosBetUnits[ self.buttonPlayer ] );
            			local money = 0;
                        local i;
			            for i=1,table.getn( self.listPots ) do
	            		    money = money + self.listPots[ i ].value;
			            end;
                        setPotOnTable( money );
                        
                        -- END: move money into pot(s)

                        self.gameState = self.gameState + 1;
                        self.maxBet = 0;
                        if self.gameState <= 7 then
                            self.activePlayer = self.buttonPlayer;
                        end;
                        
                        local drawall = (self.numberInHand - self.numberAllIn == 1)
                        nextPlayer();
                        if self.gameState == 4 then -- show flop
                            self.cardDeck52.draw();
                            self.listBoard[1] = self.cardDeck52.draw();
                            self.listBoard[2] = self.cardDeck52.draw();
                            self.listBoard[3] = self.cardDeck52.draw();
                            self.talkDealer("#me zeigt den Flop: "..self.listBoard[1].getGerman()..", "..self.listBoard[2].getGerman()..", "..self.listBoard[3].getGerman(),
                                            "#me shows the flop: "..self.listBoard[1].getEnglish()..", "..self.listBoard[2].getEnglish()..", "..self.listBoard[3].getEnglish());
                            self.gameState = self.gameState + (drawall and 1 or 0);
                        end;
                        if self.gameState == 5 then -- show turn
                            self.cardDeck52.draw();
                            self.listBoard[4] = self.cardDeck52.draw();
                            self.talkDealer("#me zeigt den Turn: "..self.listBoard[4].getGerman(), "#me shows the turn: "..self.listBoard[4].getEnglish());
                            self.gameState = self.gameState + (drawall and 1 or 0);
                        end;
                        if self.gameState == 6 then -- show river
                            self.cardDeck52.draw();
                            self.listBoard[5] = self.cardDeck52.draw();
                            self.talkDealer("#me zeigt den River: "..self.listBoard[5].getGerman(), "#me shows the river: "..self.listBoard[5].getEnglish());
                            self.gameState = self.gameState + (drawall and 1 or 0);
                        end;
                        if self.gameState == 7 then -- prepare showdown
                            self.talkDealer("Der Showdown beginnt!", "The showdown begins!");
                            showHand();
                            nextPlayer();
                        end;
                    end;
                end;
            elseif self.gameState == 7 then
	            if string.find( message, "[Ff]old" ) then
                    self.listHasFolded[self.activePlayer] = true;
                    self.listBets[self.activePlayer] = self.listBets[self.activePlayer] or 0;
                    self.numberInHand = self.numberInHand - 1;
                    self.talkDealer("Sitz "..self.activePlayer.." passt.", "Seat "..self.activePlayer.." folds.");
                    if self.numberInHand < 2 then
                        nextPlayer();
                        payPotsToPlayer();
                        nextRound();
                    else
                        nextPlayer();
                        self.timeoutCounter = 0;
                    end;
                elseif string.find( message, "[Ss]how" ) then
                    showHand();
                    nextPlayer();
                    if self.listHasShown[ self.activePlayer ] then
                    
                        -- pay winners
                        local i,z;
                        local money;
                        for i=1,table.getn( self.listPots ) do
                            local pot = self.listPots[i];
                            money = pot.value;
                            local n = table.getn( pot.listPotCandidates );
                            money = math.floor( money / n * 100 ) / 100;
                            for z=1,n do
                                payPlayer( pot.listPotCandidates[z], money );
                                self.talkDealer("Sitz "..pot.listPotCandidates[z].." gewinnt "..money.." aus Pot #"..i..".",
                                                "Seat "..pot.listPotCandidates[z].." wins "..money.." of pot #"..i..".");
                            end;
                        end;
                        
                        nextRound();
                    end;
                end;
	        end;
        end;
    end
    
    local beforeReload = function()
        self.talkDealer("Entschuldigung, wir müssen eine kurze Auszeit vom Pokern nehmen. Ihr bekommt euer Geld zurück.",
                        "Sorry, but we have to take a short break from poker. You will get your money back.");
        -- pay players
        local i,z;
        local money;
        for i=1,table.getn( self.listPots ) do
            local pot = self.listPots[i];
            pot.listPotCandidates = {};
            for z=1,self.tableSize do
                if pot.listPlayersInPot[z] then
                    table.insert( pot.listPotCandidates, z );
                end;
            end;
            money = pot.value;
            local n = table.getn( pot.listPotCandidates );
            money = math.floor( money / n * 100 ) / 100;
            for z=1,n do
                self.listBets[ pot.listPotCandidates[z] ] = (self.listBets[ pot.listPotCandidates[z] ] or 0) + money;
            end;
        end;
        for z=1,self.tableSize do
            if self.listBets[ z ] and self.listBets[ z ] > 0 then
                payPlayer( z, self.listBets[ z ] );
                self.talkDealer("Sitz "..z.." bekommt "..self.listBets[ z ].." zurück.",
                                "Seat "..z.." gets "..self.listBets[ z ].." back.");
            end;
        end;
    end;
    
    return {
        nextCycle    = nextCycle,
        receiveText  = receiveText,
        beforeReload = beforeReload,
    };
end
