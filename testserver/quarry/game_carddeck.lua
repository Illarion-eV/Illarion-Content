dofile( "game_card.lua" );

function newCardDeck( cardList )
    local self = {
        cardList = cardList,
        numCards = table.getn( cardList ),
        usedIndex = 0,
    };
    
    local shuffle = function()
        local i,j;
        local newCardList = {};
        local indexList = {};
        math.randomseed(os.time());
        for i=1,self.numCards do
            indexList[i] = i;
        end;
        for i=1,self.numCards do
            j = math.random(self.numCards-i+1);
            newCardList[i] = self.cardList[indexList[j]];
            indexList[j] = indexList[self.numCards-i+1];
        end;
        self.cardList = newCardList;
        self.usedIndex = 0;
    end;
    
    local draw = function()
        if self.usedIndex < self.numCards then
            self.usedIndex = self.usedIndex + 1;
            return self.cardList[self.usedIndex];
        else
            return nil;
        end;
    end;
    
    return {
        shuffle = shuffle,
        draw = draw,
    };
end

-- This is a 13 card deck for high card decisions
function newCardDeck13()
    local value;
    local cardList13 = {};
    for value=1,13 do
        cardList13[value] = newCard( 4, value );
    end;
    return newCardDeck( cardList13 );
end

-- This is a 52 card deck usable for e. g. texas hold'em
function newCardDeck52()
    local color, value;
    local cardList52 = {};
    local i=0;
    for color=1,4 do
        for value=1,13 do
            i = i + 1;
            cardList52[i] = newCard( color, value );
        end;
    end;
    return newCardDeck( cardList52 );
end

-- This is a 32 card deck usable for e. g. skat
function newCardDeck32()
    local color, value;
    local cardList32 = {};
    local i=0;
    for color=1,4 do
        for value=6,13 do
            i = i + 1;
            cardList32[i] = newCard( color, value );
        end;
    end;
    return newCardDeck( cardList32 );
end
