module("content.pennant", package.seeall)
--UNDER CONSTRUCTION by envi--
function InitPennant()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

    
    ---------------- STANDARTEN ----------------

    --AddPennant({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = Simple Pennant - north-south direction
    -- 2 = Simple Pennant - east-west direction
    -- 3 = huge animated flag - north-south direction
    -- 4 = scull post - north
    -- 5 = scull post - east
    -- 6 = scull post - west
    -- 7 = scull post - south
    
    --[[
	--Abtruse Dwelling
    AddPennant({44,607,0},"","", 6,5);
    AddPennant({44,602,0},"","", 6,5);
    AddPennant({46,634,0},"","", 7,5);
    AddPennant({41,634,0},"","", 7,5);
    --Antil Brook
    AddPennant({773,770,0},"","", 7,5);
    AddPennant({775,770,0},"","", 7,5);
	--Buccaneers Lurk
    AddPennant({214,462,0},"","", 4,5);
    AddPennant({210,462,0},"","", 4,5);
    AddPennant({205,462,0},"","", 4,5);
    AddPennant({200,462,0},"","", 4,5);
    AddPennant({196,463,0},"","", 6,5);
    AddPennant({196,467,0},"","", 6,5);
    AddPennant({201,468,0},"","", 7,5);
    AddPennant({196,471,0},"","", 6,5);
    AddPennant({196,475,0},"","", 6,5);
    AddPennant({196,479,0},"","", 6,5);
    AddPennant({196,483,0},"","", 6,5);
    AddPennant({196,487,0},"","", 6,5);
    AddPennant({201,483,0},"","", 7,5);
    AddPennant({200,487,0},"","", 7,5);
    AddPennant({204,487,0},"","", 7,5);]]--
    --Cadomyr
    AddPennant({121,519,0},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 1,0); --palace
	AddPennant({122,519,0},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 1,0); --palace
    AddPennant({123,519,0},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 1,0); --palace
    AddPennant({130,528,0},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 2,0); --palace
    AddPennant({130,530,0},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 2,0); --palace
    AddPennant({109,551,0},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 1,0); --registration
    AddPennant({104,552,0},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 1,0); --registration
    --[[--Cherass Citadel
    AddPennant({596,383,2},"","", 7,5); --outpost
    AddPennant({601,383,2},"","", 7,5); --outpost
    --Craven cave
    AddPennant({674,389,2},"","", 6,5);
	AddPennant({674,392,2},"","", 6,5);
	AddPennant({670,389,2},"","", 6,5);
	AddPennant({670,392,2},"","", 6,5);
	AddPennant({666,448,0},"","", 7,5);
	AddPennant({670,448,0},"","", 7,5);
	--Death Marsh
	AddPennant({795,361,0},"","", 7,5);--Witch's Cottage
    AddPennant({797,361,0},"","", 7,5);--Witch's Cottage
	AddPennant({795,356,0},"","", 7,5);--Witch's Cottage
    AddPennant({797,356,0},"","", 7,5);--Witch's Cottage
    --Dragon lair
	AddPennant({837,677,1},"","", 7, 5);
	AddPennant({837,677,1},"","", 7, 5);
	AddPennant({742,667,0},"","", 7, 5);
	AddPennant({745,667,0},"","", 7, 5);
	AddPennant({748,667,0},"","", 7, 5);
	AddPennant({751,667,0},"","", 7, 5);
	AddPennant({754,667,0},"","", 7, 5);
	AddPennant({757,667,0},"","", 7, 5);
	AddPennant({760,667,0},"","", 7, 5);
    --Eastland
    AddPennant({885,479,0},"","", 3,5); --Eastport
    AddPennant({885,491,0},"","", 2,5); --Eastport
    AddPennant({885,494,0},"","", 2,5); --Eastport
    AddPennant({902,622,1},"","", 6,5); --Ronagan Temple
    --Elstree Plain
    AddPennant({721,426,0},"","", 6,5); --Lost buidling(4)
	--Firelimes
    AddPennant({528,587,1},"","", 3,5);
    AddPennant({525,587,1},"","", 3,5);
    --Galmair
    AddPennant({383,194,-6},"","", 7,5);--Hog Dens
    AddPennant({386,194,-6},"","", 7,5);--Hog Dens
    --Galmair Hinterland
    AddPennant({410,350,0},"","", 3,5); --Miners club
    AddPennant({401,270,1},"","", 1,5); --Miners club
    AddPennant({446,118,0},"","", 3,5); --Harbour
	--Galmair Plateau
    AddPennant({358,378,1},"","", 4,5);
    AddPennant({356,378,1},"","", 4,5);
    --Glowing Forest
    AddPennant({483,561,0},"","", 5,5);
    AddPennant({483,563,0},"","", 5,5);
    AddPennant({487,520,0},"","", 7,5);
    AddPennant({487,520,0},"","", 7,5);
    AddPennant({526,523,0},"","", 6,5);
    AddPennant({526,525,0},"","", 6,5);
	--Glowing Gate
    AddPennant({487,582,0},"","", 1,5);
    AddPennant({485,582,0},"","", 1,5);
    --Hammerfall Mine
    AddPennant({257,419,0},"","", 1,5);
    AddPennant({258,419,0},"","", 3,5);
    AddPennant({260,419,0},"","", 3,5);
	AddPennant({261,419,0},"","", 1,5);]]--
	--Moshran's Brood
    AddPennant({391,743,0},"Dies ist das Hoheitsgebiet der Moshran's Brood.","This is the sovereign territory of the Moshran's Brood.", 1,5);
    AddPennant({393,743,0},"Dies ist das Hoheitsgebiet der Moshran's Brood.","This is the sovereign territory of the Moshran's Brood.", 1,5);
    AddPennant({398,743,0},"Lauf, so lange du noch Beine hast!","Run, as long you have still your legs!", 7,5);
    --Mount Zotmore
    AddPennant({365,497,0},"Sei vorsichtig, hier kˆnnte ein Zot zufinden sein.","Be careful, there could be a Zot around.", 6,0);
    AddPennant({359,506,0},"Sei vorsichtig, hier kˆnnte ein Zot zufinden sein.","Be careful, there could be a Zot around.", 6,0);
	--[[--Lost Building (2)
    AddPennant({277,605,0},"","", 5,5);
    AddPennant({277,596,0},"","", 5,5);
    AddPennant({269,599,0},"","", 6,5);
    AddPennant({265,605,0},"","", 6,5);
    --Lost Building (3)
    AddPennant({290,474,0},"","", 5,5);
    AddPennant({262,488,0},"","", 6,5);]]--
	--Lumpskrums Band
	AddPennant({361,752,0},"Tritt ein, bring Geld herein! Lumpskrum wird es dir danken.","Plese enter and leave your coins! Lumpskrum will be grateful.", 1,5);
    AddPennant({357,752,0},"Tritt ein, bring Geld herein! Lumpskrum wird es dir danken.","Plese enter and leave your coins! Lumpskrum will be grateful.", 1,5);
    --[[--Royal Slave Market
	AddPennant({325,627,0},"","", 5,5);
	AddPennant({325,629,0},"","", 5,5);
	AddPennant({325,632,0},"","", 5,5);
	AddPennant({325,624,0},"","", 5,5);
	AddPennant({323,627,0},"","", 6,5);
	AddPennant({323,629,0},"","", 6,5);
	AddPennant({323,632,0},"","", 6,5);
	AddPennant({323,634,0},"","", 6,5);]]--
	--Sentry Outpost
	AddPennant({641,706,2},"In schimmernden Rot und Weiﬂ ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns in shimmering red and white the banner.", 3,0);
	--[[--Snakehead Coast
    AddPennant({609,462,2},"","", 7,5); --Mt. Snakehead
    --Spider's Mouth
    AddPennant({675,346,0},"","", 4,5);
    AddPennant({678,346,0},"","", 4,5);
	--The Royal Academy of Gladiators
	AddPennant({210,701,0},"","", 7,5);
    AddPennant({215,701,0},"","", 7,5);
    --The Blood Circle Arena
    AddPennant({248,668,1},"","", 3,5);
    AddPennant({250,690,0},"","", 2,5);
    AddPennant({250,685,0},"","", 2,5);
    --The Swamp
    AddPennant({494,155,0},"","", 7,5);
    AddPennant({486,155,0},"","", 7,5);
    AddPennant({502,121,0},"","", 7,5);
    AddPennant({500,121,0},"","", 7,5);
    --Zumbrass Tomb
	AddPennant({331,473,0},"","", 7,5);]]--


end


function AddPennant(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+30));
end


function CheckAndPlaceItem(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            world:createItemFromId(ItemID,1,Posi,true,333,nil);
        end
    else
        world:createItemFromId(ItemID,1,Posi,true,333,nil);
    end
end

function PrepareTables(TablePos)
    if (signCoo[TablePos] == nil) then
        signCoo[TablePos] = {};
        signTextDe[TablePos] = {};
        signTextEn[TablePos] = {};
        signPerception[TablePos] = {};
    end
end

-- DirToItemID converts item IDs into local type values for the Add functions to work with

function DirToItemID(Value)
    if (Value==31) then
        return 2046
    elseif (Value==32) then
        return 2069
    elseif (Value==33) then
        return 512
    elseif (Value==34) then
        return 2924
    elseif (Value==35) then
        return 2925
    elseif (Value==36) then
        return 2926
    elseif (Value==37) then
        return 2927
	end
end
