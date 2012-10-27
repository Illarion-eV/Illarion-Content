dofile("quest_giveUniqueItem.lua")

-- UPDATE common SET com_script='base_quest_items.lua' WHERE com_itemid IN (320,1247,1912,2937,2850);

function init()
    getTextDe={};
    getTextEn={};
    getCoord={};
    getItem={};
    getItemData={};
    getTilePos={};
    getTileId={};
    getWarpTarget={};
    getMageOnly={};

    AddQuestItem({-47,210,-3},
    "In der linken Hand des Skeletts findest du ein staubiges Tagebuch.",
    "You find a dusty diary in the left hand of the skeletton.",
    2602,1,false);

    AddQuestItem({-59,204,-3},
    "Als du zwischen den Knochen stocherst fällt dir ein großer kupferner Schlüssel auf.",
    "As you rake through the bones a large copper key attracts your attention.",
    2121,23101982,false);

    AddQuestItem({-53,172,-8},
    "Auf dem Tisch liegt ein aufgeschlagenes Buch, als ob kürzlich noch jemand in ihm gelesen hätte.",
    "On the table you find an opened book, as if somebody read it only recently.",
    2602,3,false);

    AddQuestItem({-30,157,-8},
    "Während du unter der Decke suchst zerfällt diese fast zu Staub, jedoch findest du einen schweren Schlüssel unter dem Kopfkissen.",
    "The blanket almost turns into dust while you are searching, but you are able to find a heavy key under the pillow.",
    2121,333,false);

    AddQuestItem({-28,158,-8},
    "Unter dem hölzernen Hocker, von Staub bedeckt, liegt ein kleines Buch welches wohl vor langer Zeit aus Versehen heruntergefallen ist.",
    "Under the wooden stool, beneath some dust there is a small book which seems to have accidently slipped down a long time ago.",
    2602,2,false);

    AddQuestTile({-118,255,-3},
    {"Als du den Stein abtastest fährt auf einmal eine Marmorbrücke von beiden Seiten aus.","Als du den Stein an einer bestimmten Stelle berührst fährt die Brücke ein."},
    {"As you feel the stone suddenly a marble bridge extends from both sides.","As you feel the stone in a certain region the bridge retracts."},
    {55,6},
    {-119,256,-3},false);

    AddQuestTile({-118,255,-3},
    {"",""},
    {"",""},
    {55,6},
    {-119,257,-3},false);

end

function AddQuestItem(Coord,gText,eText,ItemID,ItemData,mage)
    table.insert(getCoord,Coord);
    table.insert(getTextDe,gText);
    table.insert(getTextEn,eText);
    table.insert(getItem,ItemID);
    table.insert(getItemData,ItemData);
    table.insert(getTilePos,0);
    table.insert(getTileId,0);
    table.insert(getWarpTarget,0);
    table.insert(getMageOnly,mage);
end

-- Quest Item Pos, List of german Texts, List of english Texts, List of Tile IDs, Tile Pos
function AddQuestTile(Coord,gText,eText,TileIds,TilePos,mage)
    table.insert(getCoord,Coord);
    table.insert(getTextDe,gText);
    table.insert(getTextEn,eText);
    table.insert(getItem,0);
    table.insert(getItemData,0);
    table.insert(getTilePos,position(TilePos[1],TilePos[2],TilePos[3]));
    table.insert(getTileId,TileIds);
    table.insert(getWarpTarget,0);
    table.insert(getMageOnly,mage);
end

function AddQuestWarp(Coord,gText,eText,WarpTarget,mage)
    table.insert(getCoord,Coord);
    table.insert(getTextDe,gText);
    table.insert(getTextEn,eText);
    table.insert(getItem,0);
    table.insert(getItemData,0);
    table.insert(getTilePos,0);
    table.insert(getTileId,0);
    table.insert(getWarpTarget,position(WarpTarget[1],WarpTarget[2],WarpTarget[3]));
    table.insert(getMageOnly,mage);
end

function UseItem( User, Item, TargetItem, counter, param )
    if (first==nil) then
        init();
        first=1;
    end
    for i, c in pairs(getCoord) do
        if Item.pos == position(c[1],c[2],c[3]) then
            if (getMageOnly[i]) then
                if ((User:increaseAttrib("essence",0)+User:increaseAttrib("willpower",0)+User:increaseAttrib("intelligence",0))>29) then
                    doit=true;
                else
                    doit=false;
                end
            else
                doit=true
            end
            if doit then
                if (getItem[i]~=0) then
                    giveUniqueItem( User, getItem[i], getItemData[i], getTextDe[i], getTextEn[i] );
                elseif (getTileId[i]~=0) then
                    changeTileOnPos( User, getTileId[i], getTilePos[i], getTextDe[i], getTextEn[i] );
                elseif (getWarpTarget[i]~=0) then
                    User:warp(getWarpTarget[i])
                    if (User:getPlayerLanguage()==0) then
                        User:inform(getTextDe[i]);
                    else
                        User:inform(getTextEn[i]);
                    end
                end
            end
        end
    end
end

function changeTileOnPos( User, TileIDs, TilePos, TextDe, TextEn )
    local Field=world:getField(TilePos);
    local PosTiles={};
    local TextsDe={};
    local TextsEn={};
    for i=1,table.getn(TileIDs) do
        if (TileIDs[i]~=Field.tile) then
            table.insert(PosTiles,TileIDs[i]);
            table.insert(TextsDe,TextDe[i]);
            table.insert(TextsEn,TextEn[i]);
        end
    end
    local Choose=(math.random(1,table.getn(PosTiles)))
    TileID=PosTiles[Choose];
    world:changeTile(TileID,TilePos);
    world:sendMapUpdate(TilePos,12);
    if (TextDe[Choose]~="") then
        if (User:getPlayerLanguage()==0) then
            User:inform(TextsDe[Choose]);
        else
            User:inform(TextsEn[Choose]);
        end
    end
end
