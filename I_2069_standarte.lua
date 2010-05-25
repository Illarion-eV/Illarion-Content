function init()
    signTextDe={};
    signTextEn={};
    signCoord={};


    signCoord[1]={-43,194,-9};
    signTextDe[1]="Willkommen in Irundar";
    signTextEn[1]="Welcome to Irundar";

    signCoord[2]={-36,197,-9};
    signTextDe[2]="Magierturm - Kein Zutritt";
    signTextEn[2]="Magetower - No Entrance";

    signCoord[3]={-48,181,-9};
    signTextDe[3]="Kirche der Alten";
    signTextEn[3]="Church of the Ancient";

    signCoord[4]={-48,173,-9};
    signTextDe[4]="Rinaads Eisen";
    signTextEn[4]="Rinaad's Iron";

    signCoord[5]={-49,167,-9};
    signTextDe[5]="Alehas Gemischtwarenhandlung";
    signTextEn[5]="Aleha's General Store";

    signCoord[6]={-41,165,-9};
    signTextDe[6]="Schloss Irundar";
    signTextEn[6]="Irundar Castle";

    signCoord[7]={-38,165,-9};
    signTextDe[7]=signTextDe[6];
    signTextEn[7]=signTextEn[6];

    signCoord[8]={-41,154,-9};
    signTextDe[8]="Vorzimmer";
    signTextEn[8]="Antechamber";

    signCoord[9]={-38,154,-9};
    signTextDe[9]=signTextDe[8];
    signTextEn[9]=signTextEn[8];

    signCoord[10]={-41,148,-9};
    signTextDe[10]="Thronsaal";
    signTextEn[10]="Throne Room";

    signCoord[11]={-38,148,-9};
    signTextDe[11]=signTextDe[10];
    signTextEn[11]=signTextEn[10];

    signCoord[12]={-41,142,-9};
    signTextDe[12]="Der ehrwürdige Herzog von Irundar";
    signTextEn[12]="The venerable Duke of Irundar";

    signCoord[13]={-38,142,-9};
    signTextDe[13]=signTextDe[12];
    signTextEn[13]=signTextEn[12];

    signCoord[14]={-52,212,-3};
    signTextDe[14]="Gefahr: Niedrige Decke";
    signTextEn[14]="Danger: Low ceiling";

    signCoord[15]={-51,201,-3};
    signTextDe[15]="Der Weg nach Irundar...";
    signTextEn[15]="The road to Irundar...";

    signCoord[16]={-49,201,-3};
    signTextDe[16]="...ist den Zweiflern versperrt!";
    signTextEn[16]="...is obstructed for those who doubt!";

    signCoord[17]={-403,77,0};
    signTextDe[17]="Bin beim Angeln - Todd";
    signTextEn[17]="I am fishing - Todd";

end

function LookAtItem(User,Item)
    if (first==nil) then
        init();
        first=1;
    end
    lang=User:getPlayerLanguage();
    for i, sign in pairs(signCoord) do
        if equapos(Item.pos,position(sign[1],sign[2],sign[3])) then
            if lang==0 then
                world:itemInform(User,Item,signTextDe[i]);
            else
                world:itemInform(User,Item,signTextEn[i]);
            end
        end
    end
end



