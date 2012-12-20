-- color: 1=diamonds, 2=hearts, 3=spades, 4=clubs
-- value: 1=2, 2=3, 3=4, 4=5, ..., 9=10, 10=J, 11=Q, 12=K, 13=A

local ENGLISH_COLOR={" of Diamonds", " of Hearts", " of Spades", " of Clubs"}
local ENGLISH_VALUE={"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"}
local ENGLISH_COLOR_SHORT={"D", "H", "S", "C"}
local ENGLISH_VALUE_SHORT={"2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"}
local GERMAN_COLOR={"Karo ", "Herz ", "Pik ", "Kreuz "}
local GERMAN_VALUE={"2", "3", "4", "5", "6", "7", "8", "9", "10", "Bube", "Dame", "König", "As"}
local GERMAN_COLOR_SHORT={"Ka", "H", "P", "Kr"}
local GERMAN_VALUE_SHORT={"2", "3", "4", "5", "6", "7", "8", "9", "10", "B", "D", "K", "A"}

function newCard( color, value )
    local self = {
        color = color,
        value = value,
    };
    
    local getColor = function()
        return self.color;
    end;
    
    local getValue = function()
        return self.value;
    end;
    
    local getEnglish = function()
        return ENGLISH_VALUE[getValue()] .. ENGLISH_COLOR[getColor()];
    end;
    
    local getEnglishShort = function()
        return ENGLISH_VALUE_SHORT[getValue()] .. ENGLISH_COLOR_SHORT[getColor()];
    end;
    
    local getGerman = function()
        return GERMAN_VALUE[getValue()] .. GERMAN_COLOR[getColor()];
    end;
    
    local getGermanShort = function()
        return GERMAN_VALUE_SHORT[getValue()] .. GERMAN_COLOR_SHORT[getColor()];
    end;
    
    return {
        getColor = getColor,
        getValue = getValue,
        getEnglish = getEnglish,
        getEnglishShort = getEnglishShort,
        getGerman = getGerman,
        getGermanShort = getGermanShort,        
    }
end
