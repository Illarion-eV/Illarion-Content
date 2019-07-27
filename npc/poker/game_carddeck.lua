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

local game_card = require("npc.poker.game_card")

local newCard = game_card.newCard

local function newCardDeck( cardList )
    local self = {
        cardList = cardList,
        numCards = #cardList,
        usedIndex = 0,
    };
    
    local shuffle = function()
        local i,j;
        local newCardList = {};
        local indexList = {};
        math.randomseed(world:getTime("unix"));
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
function M.newCardDeck13()
    local value;
    local cardList13 = {};
    for value=1,13 do
        cardList13[value] = newCard( 4, value );
    end;
    return newCardDeck( cardList13 );
end

-- This is a 52 card deck usable for e. g. texas hold'em
function M.newCardDeck52()
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
function M.newCardDeck32()
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

return M