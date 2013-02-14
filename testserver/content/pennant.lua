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
    AddPennant({129,581,0},"Werkstatt","Workshop",1,0);
    AddPennant({134,585,0},"Werkstatt","Workshop",2,0);
    AddPennant({126,611,0},"Marktplatz","Marketplace",1,0);
    AddPennant({129,563,0},"Zhambratempel","Temple of Zhambra",2,0);
    AddPennant({114,588,0},"Taverne 'Einhörniger Löwe'","Tavern 'Unicorn Lion'",1,0);
    AddPennant({87,586,0},"Gasthaus 'Seeufer'","Inn 'Lakeshore'",1,0);

    AddPennant({121,519,0},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 1,0); --palace
	AddPennant({122,519,0},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 1,0); --palace
    AddPennant({123,519,0},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 1,0); --palace
    AddPennant({130,528,0},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 2,0); --palace
    AddPennant({130,530,0},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 2,0); --palace
    AddPennant({109,551,0},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 1,0); --registration
    AddPennant({104,552,0},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 1,0); --registration
    --Carnivore's House
	AddPennant({847,312,0},"Falls du auch Menschenfleisch magst bist du herzlich zum Abendbrot eingeladen! HA! HA!","If you also like human meat, you are very welcome to stay for dinner! HA! HA!", 6,0);
	AddPennant({847,311,0},"Falls du auch Menschenfleisch magst bist du herzlich zum Abendbrot eingeladen! HA! HA!","If you also like human meat, you are very welcome to stay for dinner! HA! HA!", 6,0);
    --Cherass Citadel
    AddPennant({596,383,2},"Cherass heißt euch willkommen in seiner Zitadelle!","Cherass welcomes you in his citadel!", 7,0); --outpost
    AddPennant({601,383,2},"Cherass heißt euch willkommen in seiner Zitadelle!","Cherass welcomes you in his citadel!", 7,0); --outpost
     --[[--Craven cave/Igruk's Cave
    AddPennant({674,389,2},"","", 6,5);
	AddPennant({674,392,2},"","", 6,5);
	AddPennant({670,389,2},"","", 6,5);
	AddPennant({670,392,2},"","", 6,5);]]--
	AddPennant({666,448,0},"Hoheitsgebiet des Igruk","Igruk's territory", 7,0);
	AddPennant({670,448,0},"Hoheitsgebiet des Igruk","Igruk's territory", 7,0);
    AddPennant({627,415,0},"Hoheitsgebiet des Igruk","Igruk's territory", 6,0);
    AddPennant({678,346,0},"Hoheitsgebiet des Igruk","Igruk's territory", 6,0);
   	--Death Marsh
	AddPennant({795,361,0},"Hexen Hütte","Witch's Cottage", 7,0);--Witch's Cottage
    AddPennant({797,361,0},"Hexen Hütte","Witch's Cottage", 7,0);--Witch's Cottage
	AddPennant({795,356,0},"Hexen Hütte","Witch's Cottage", 7,0);--Witch's Cottage
    AddPennant({797,356,0},"Hexen Hütte","Witch's Cottage", 7,0);--Witch's Cottage
	--Dewy Swamp
    AddPennant({902,695,0},"Schattentor - Versuchsgebiet","Shadow Gate - experimental area", 6,0);--Shadow Gate
  --[[   --Dragon lair
	AddPennant({837,677,1},"","", 7, 5);
	AddPennant({837,677,1},"","", 7, 5);]]--
	AddPennant({742,667,0}," Achtung heiß!"," Caution hot!", 7, 5);
	AddPennant({745,667,0}," Achtung heiß!"," Caution hot!", 7, 5);
	AddPennant({748,667,0}," Achtung heiß!"," Caution hot!", 7, 5);
	AddPennant({751,667,0}," Achtung heiß!"," Caution hot!", 7, 5);
	AddPennant({754,667,0}," Achtung heiß!"," Caution hot!", 7, 5);
	AddPennant({757,667,0}," Achtung heiß!"," Caution hot!", 7, 5);
	AddPennant({760,667,0}," Achtung heiß!"," Caution hot!", 7, 5);
    --Eastland
    AddPennant({834,542,0},"Linker Zwilling","Left Twin", 6,0); --Twin Mountains
    AddPennant({875,537,0},"Rechter Zwilling","Right Twin", 7,0); --Twin Mountains
    AddPennant({885,479,0},"Osthafen","Eastport", 3,0); --Eastport
    AddPennant({885,491,0},"Osthafen","Eastport", 2,0); --Eastport
    AddPennant({885,494,0},"Osthafen","Eastport", 2,0); --Eastport
    AddPennant({877,561,0},"Willkommen im Wunderland","Welcome to the Wonderland", 6,0); --Wonderland
    AddPennant({877,563,0},"Willkommen im Wunderland","Welcome to the Wonderland", 6,0); --Wonderland
    AddPennant({874,589,0},"Willkommen im Wunderland","Welcome to the Wonderland", 6,0); --Wonderland
    AddPennant({874,591,0},"Willkommen im Wunderland","Welcome to the Wonderland", 6,0); --Wonderland
    AddPennant({892,599,0},"Willkommen im Wunderland","Welcome to the Wonderland", 7,0); --Wonderland
    AddPennant({898,583,0},"Wunschbrunnen","Wishing Fountain", 6,0); --Wishing Fountain
    AddPennant({890,626,0},"Willkommen im Schatten! - Naganorium","Welcome to the shadow! - Naganorium", 6,0); --Naganorium
    AddPennant({890,628,0},"Willkommen im Schatten! - Naganorium","Welcome to the shadow! - Naganorium", 6,0); --Naganorium
    --[[    AddPennant({902,622,1},"","", 6,5); --Ronagan Temple ]]--
    --Elstree Forest
    AddPennant({826,482,0},"Berg Lebenswurzel","Mount Liferoot", 6,0); --Mount Liferoot
    AddPennant({802,462,0},"Elstree See","Elstree lake", 7,0); --Elstree lake
    AddPennant({797,421,0},"Feen Tanz","Fairy's Dance", 6,0); --Fairy dance
    AddPennant({797,424,0},"Feen Tanz","Fairy's Dance", 6,0); --Fairy dance
    AddPennant({721,426,0},"Vorsicht! Oder du versinkst wie es einst der Turm geschah.","Attention! Or you might sink as the tower did once.", 6,0); --Sunken tower
    --Elstree Plain
    AddPennant({721,426,0},"Des Jarls Langhaus - für immer verloren!","The Jarl's Longhouse - lost forever!", 6,0); --The Jarl's Longhouse
--[[	--Firelimes
    AddPennant({528,587,1},"","", 3,5);
    AddPennant({525,587,1},"","", 3,5);
    --Galmair Hinterland
    AddPennant({410,350,0},"","", 3,5); --Miners club
    AddPennant({401,270,1},"","", 1,5); --Miners club
    AddPennant({446,118,0},"","", 3,5); --Harbour ]]--
	--Galmair Plateau
    AddPennant({358,378,1},"Fort Schnellbeil - Wir zahlen dem Don keine Steuern!","Fort Schnellbeil - We do not pay taxes to the Don!", 4,0);
    AddPennant({356,378,1},"Fort Schnellbeil - Wir zahlen dem Don keine Steuern!","Fort Schnellbeil - We do not pay taxes to the Don!", 4,0);
    --[[--Glowing Forest
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
    AddPennant({391,743,0},"Dies ist das Hoheitsgebiet der Moshran's Brood.","This is the sovereign territory of Moshran's Brood.", 1,0);
    AddPennant({393,743,0},"Dies ist das Hoheitsgebiet der Moshran's Brood.","This is the sovereign territory of Moshran's Brood.", 1,0);
    AddPennant({398,743,0},"Lauf, so lange du noch Beine hast!","Run, as long you still have your legs!", 7,0);
    --Mount Zotmore
    AddPennant({365,497,0},"Sei vorsichtig, hier könnte ein Zot zufinden sein.","Be careful, there could be a Zot around.", 6,0);
    AddPennant({359,506,0},"Sei vorsichtig, hier könnte ein Zot zufinden sein.","Be careful, there could be a Zot around.", 6,0);
	--Northern Outpost
    AddPennant({818,750,0},"Nördlicher Außenposten","Northern Outpost", 7,0);
	--[[--Lost Building (2)
    AddPennant({277,605,0},"","", 5,5);
    AddPennant({277,596,0},"","", 5,5);
    AddPennant({269,599,0},"","", 6,5);
    AddPennant({265,605,0},"","", 6,5);
    --Lost Building (3)
    AddPennant({290,474,0},"","", 5,5);
    AddPennant({262,488,0},"","", 6,5);]]--
	--Lumpskrums Band
	AddPennant({361,752,0},"Tritt ein, bring Geld herein! Lumpskrum wird es dir danken.","Please enter and leave your coins! Lumpskrum will be grateful.", 1,0);
    AddPennant({357,752,0},"Tritt ein, bring Geld herein! Lumpskrum wird es dir danken.","Please enter and leave your coins! Lumpskrum will be grateful.", 1,0);
    --Raban's Grove
	AddPennant({828,109,0},"Rabans Hain","Raban's Grove", 5,0);
	AddPennant({828,113,0},"Rabans Hain","Raban's Grove", 5,0);
    --[[--Royal Slave Market
	AddPennant({325,627,0},"","", 5,5);
	AddPennant({325,629,0},"","", 5,5);
	AddPennant({325,632,0},"","", 5,5);
	AddPennant({325,624,0},"","", 5,5);
	AddPennant({323,627,0},"","", 6,5);
	AddPennant({323,629,0},"","", 6,5);
	AddPennant({323,632,0},"","", 6,5);
	AddPennant({323,634,0},"","", 6,5);]]--
	--Runewick
    AddPennant({747,805,0},"Vierbeiniger Roter Vogel","Quadruped Red Bird", 1,0);
    AddPennant({750,805,0},"Vierbeiniger Roter Vogel","Quadruped Red Bird", 1,0);
	--Sentry Outpost
	AddPennant({641,706,2},"In schimmernden Rot und Weiß ziert das Wappen von Cadomyr den Banner.","The crest of Cadomyr adorns the banner in shimmering red and white.", 3,0);
	--Snakehead Coast
    AddPennant({609,462,2},"Schlangenkopfberg","Mount Snakehead", 7,0); --Mt. Snakehead
    AddPennant({608,468,0},"Schlangenkopfberg","Mount Snakehead", 7,0); --Mt. Snakehead
    --Spider's Mouth
    AddPennant({675,346,0},"Der Todes Sumpf - Trette den Toten bei!","The Death Marsh - Join the dead!", 4,0);
    AddPennant({678,346,0},"Der Todes Sumpf - Trette den Toten bei!","The Death Marsh - Join the dead!", 4,0);
--[[	--The Royal Academy of Gladiators
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

InitPennant();
