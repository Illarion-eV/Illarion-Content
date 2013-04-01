module("content.bonusitems", package.seeall)

function initBonus()

    preTitle = {}; -- 1==German, 2==English
    preTitle[1] = {};
    preTitle[2] = {};
    postTitle = {};
    postTitle[1] = {};
    postTitle[2] = {};

    preTitle[1][ 1] = "Novizen-";   postTitle[1][ 1] = "Usharas";   preTitle[2][ 1] = "Novice-";  postTitle[2][ 1] = "of Ushara";
    preTitle[1][ 2] = "Novizen-";   postTitle[1][ 2] = "Brágons";   preTitle[2][ 2] = "Novice-";  postTitle[2][ 2] = "of Brágon";
    preTitle[1][ 3] = "Novizen-";   postTitle[1][ 3] = "Eldans";    preTitle[2][ 3] = "Novice-";  postTitle[2][ 3] = "of Eldan";
    preTitle[1][ 4] = "Novizen-";   postTitle[1][ 4] = "Tanoras";   preTitle[2][ 4] = "Novice-";  postTitle[2][ 4] = "of Tanora";
    preTitle[1][ 5] = "Novizen-";   postTitle[1][ 5] = "Findaris";  preTitle[2][ 5] = "Novice-";  postTitle[2][ 5] = "of Findari";
    preTitle[1][ 6] = "Priester-";  postTitle[1][ 6] = "Usharas";   preTitle[2][ 6] = "Priest-";  postTitle[2][ 6] = "of Ushara";
    preTitle[1][ 7] = "Priester-";  postTitle[1][ 7] = "Brágons";   preTitle[2][ 7] = "Priest-";  postTitle[2][ 7] = "of Brágon";
    preTitle[1][ 8] = "Priester-";  postTitle[1][ 8] = "Eldans";    preTitle[2][ 8] = "Priest-";  postTitle[2][ 8] = "of Eldan";
    preTitle[1][ 9] = "Priester-";  postTitle[1][ 9] = "Tanoras";   preTitle[2][ 9] = "Priest-";  postTitle[2][ 9] = "of Tanora";
    preTitle[1][10] = "Priester-";  postTitle[1][10] = "Findaris";  preTitle[2][10] = "Priest-";  postTitle[2][10] = "of Findari";
    preTitle[1][11] = "Hohe";       postTitle[1][11] = "Usharas";   preTitle[2][11] = "High";     postTitle[2][11] = "of Ushara";
    preTitle[1][12] = "Hohe";       postTitle[1][12] = "Brágons";   preTitle[2][12] = "High";     postTitle[2][12] = "of Brágon";
    preTitle[1][13] = "Hohe";       postTitle[1][13] = "Eldans";    preTitle[2][13] = "High";     postTitle[2][13] = "of Eldan";
    preTitle[1][14] = "Hohe";       postTitle[1][14] = "Tanoras";   preTitle[2][14] = "High";     postTitle[2][14] = "of Tanora";
    preTitle[1][15] = "Hohe";       postTitle[1][15] = "Findaris";  preTitle[2][15] = "High";     postTitle[2][15] = "of Findari";
    preTitle[1][16] = "";           postTitle[1][16] = "Usharas";   preTitle[2][16] = "";         postTitle[2][16] = "of Ushara";
    preTitle[1][17] = "";           postTitle[1][17] = "Brágons";   preTitle[2][17] = "";         postTitle[2][17] = "of Brágon";
    preTitle[1][18] = "";           postTitle[1][18] = "Eldans";    preTitle[2][18] = "";         postTitle[2][18] = "of Eldan";
    preTitle[1][19] = "";           postTitle[1][19] = "Tanoras";   preTitle[2][19] = "";         postTitle[2][19] = "of Tanora";
    preTitle[1][20] = "";           postTitle[1][20] = "Findaris";  preTitle[2][20] = "";         postTitle[2][20] = "of Findari";
    preTitle[1][21] = "";           postTitle[1][21] = "Nargúns";   preTitle[2][21] = "";         postTitle[2][21] = "of Nargún";
    preTitle[1][22] = "";           postTitle[1][22] = "Elaras";    preTitle[2][22] = "";         postTitle[2][22] = "of Elara";
    preTitle[1][23] = "";           postTitle[1][23] = "Adrons";    preTitle[2][23] = "";         postTitle[2][23] = "of Adron";
    preTitle[1][24] = "";           postTitle[1][24] = "Oldras";    preTitle[2][24] = "";         postTitle[2][24] = "of Oldra";
    preTitle[1][25] = "";           postTitle[1][25] = "Chergas";   preTitle[2][25] = "";         postTitle[2][25] = "of Cherga";
    preTitle[1][26] = "";           postTitle[1][26] = "Malachíns"; preTitle[2][26] = "";         postTitle[2][26] = "of Malachín";
    preTitle[1][27] = "";           postTitle[1][27] = "Irmoroms";  preTitle[2][27] = "";         postTitle[2][27] = "of Irmorom";
    preTitle[1][28] = "";           postTitle[1][28] = "Siranis";   preTitle[2][28] = "";         postTitle[2][28] = "of Sirani";
    preTitle[1][29] = "";           postTitle[1][29] = "Zhambras";  preTitle[2][29] = "";         postTitle[2][29] = "of Zhambra";
    preTitle[1][30] = "";           postTitle[1][30] = "Ronagans";  preTitle[2][30] = "";         postTitle[2][30] = "of Ronagan";
    preTitle[1][31] = "";           postTitle[1][31] = "Moshrans";  preTitle[2][31] = "";         postTitle[2][31] = "of Moshran";
    preTitle[1][32] = "";           postTitle[1][32] = "";          preTitle[2][32] = "";         postTitle[2][32] = "";
    preTitle[1][33] = "";           postTitle[1][33] = "";          preTitle[2][33] = "";         postTitle[2][33] = "";
    preTitle[1][34] = "";           postTitle[1][34] = "";          preTitle[2][34] = "";         postTitle[2][34] = "";
    preTitle[1][35] = "";           postTitle[1][35] = "";          preTitle[2][35] = "";         postTitle[2][35] = "";
    preTitle[1][36] = "";           postTitle[1][36] = "";          preTitle[2][36] = "";         postTitle[2][36] = "";
    preTitle[1][37] = "";           postTitle[1][37] = "";          preTitle[2][37] = "";         postTitle[2][37] = "";
    preTitle[1][38] = "";           postTitle[1][38] = "";          preTitle[2][38] = "";         postTitle[2][38] = "";
    preTitle[1][39] = "";           postTitle[1][39] = "";          preTitle[2][39] = "";         postTitle[2][39] = "";
    preTitle[1][40] = "";           postTitle[1][40] = "";          preTitle[2][40] = "";         postTitle[2][40] = "";
    preTitle[1][41] = "";           postTitle[1][41] = "";          preTitle[2][41] = "";         postTitle[2][41] = "";
    preTitle[1][42] = "";           postTitle[1][42] = "";          preTitle[2][42] = "";         postTitle[2][42] = "";
    preTitle[1][43] = "";           postTitle[1][43] = "";          preTitle[2][43] = "";         postTitle[2][43] = "";
    preTitle[1][44] = "";           postTitle[1][44] = "";          preTitle[2][44] = "";         postTitle[2][44] = "";
    preTitle[1][45] = "";           postTitle[1][45] = "";          preTitle[2][45] = "";         postTitle[2][45] = "";
    preTitle[1][46] = "";           postTitle[1][46] = "";          preTitle[2][46] = "";         postTitle[2][46] = "";
    preTitle[1][47] = "";           postTitle[1][47] = "";          preTitle[2][47] = "";         postTitle[2][47] = "";
    preTitle[1][48] = "";           postTitle[1][48] = "";          preTitle[2][48] = "";         postTitle[2][48] = "";
    preTitle[1][49] = "";           postTitle[1][49] = "";          preTitle[2][49] = "";         postTitle[2][49] = "";
    preTitle[1][50] = "";           postTitle[1][50] = "";          preTitle[2][50] = "";         postTitle[2][50] = "";
    preTitle[1][51] = "";           postTitle[1][51] = "";          preTitle[2][51] = "";         postTitle[2][51] = "";
    preTitle[1][52] = "";           postTitle[1][52] = "";          preTitle[2][52] = "";         postTitle[2][52] = "";
    preTitle[1][53] = "";           postTitle[1][53] = "";          preTitle[2][53] = "";         postTitle[2][53] = "";
    preTitle[1][54] = "";           postTitle[1][54] = "";          preTitle[2][54] = "";         postTitle[2][54] = "";
    preTitle[1][55] = "";           postTitle[1][55] = "";          preTitle[2][55] = "";         postTitle[2][55] = "";
    preTitle[1][56] = "";           postTitle[1][56] = "";          preTitle[2][56] = "";         postTitle[2][56] = "";
    preTitle[1][57] = "";           postTitle[1][57] = "";          preTitle[2][57] = "";         postTitle[2][57] = "";
    preTitle[1][58] = "";           postTitle[1][58] = "";          preTitle[2][58] = "";         postTitle[2][58] = "";
    preTitle[1][59] = "";           postTitle[1][59] = "";          preTitle[2][59] = "";         postTitle[2][59] = "";
    preTitle[1][60] = "";           postTitle[1][50] = "";          preTitle[2][60] = "";         postTitle[2][50] = "";
    preTitle[1][61] = "";           postTitle[1][61] = "";          preTitle[2][61] = "";         postTitle[2][61] = "";
    preTitle[1][62] = "";           postTitle[1][62] = "";          preTitle[2][62] = "";         postTitle[2][62] = "";
    preTitle[1][63] = "";           postTitle[1][63] = "";          preTitle[2][63] = "";         postTitle[2][63] = "";
    preTitle[1][64] = "";           postTitle[1][64] = "";          preTitle[2][64] = "";         postTitle[2][64] = "";
                                                 
end                                              
                                                 
                                                 
function setBonusAndTitle(item, bonus1, value1, bonus2, value2, title)
    if( (bonus1 > 63) or (bonus1 < 0) or (bonus2 > 63) or (bonus2 < 0) or
            (title > 63) or (title < 0) or (value1 > 64) or (value1 < -63)
            or (value2 > 64) or (value2 < -63) ) then
        return false;                            
    end;                                         
                                                 
    item:setData("bonusitemData", (((title*128 + value2 + 63)*64 + bonus2) * 128 + value1 + 63) * 64 + bonus1);
    world:changeItem(item);
    return true;
end                                              
                                                 
function getBonusFromItem(item, bonustype)             
    local data = tonumber(item:getData("bonusitemData"));
    local i;
    for i=1,2 do
        if( math.mod( data, 64 ) == bonustype ) then
            return math.mod( math.floor( data / 64 ), 128 ) - 63;
        else
            if( i == 2 ) then return 0; end;
            data = math.floor( data / 8192 );
        end;
    end;
end                      

function getBonusFromUser(user, bonustype)
    local bonus = 0;
    local i;
    local item;
    for i=0,11 do    -- iterate through equipped items
        item = user:getItemAt(i);
        if( item.id ~= 0 ) then
            bonus = bonus + getBonusFromItem( item, bonustype );
        end;
    end;
    return bonus;
end                      
                                                 
function getNameWithTitle(item, lang, gender)            
    local i = math.floor( tonumber(item:getData("bonusitemData")) / 16777216 ); -- 2^30 / 64
    if( i == 0 ) then return world:getItemName(item.id, lang); end;
    if( isinit == nil) then                      
        initBonus();                             
        isinit = 1;                              
    end;                                     
    local name = preTitle[lang+1][i];
    if( (i >= 11) and (i <= 15) ) then name = name..gender.." "; end;
    return name..world:getItemName(item.id, lang).." "..postTitle[lang+1][i];
end                                              
