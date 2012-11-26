-- Side note: "BS" = Bookshelf
-- Bookshelves contain a list of positions of bookshelves and a list of books

-- UPDATE common SET com_script='item.id_266_bookshelf' WHERE com_itemid IN (266, 267);

module("item.id_266_bookshelf", package.seeall)

function InitLibraries()
      
    Libraries = {}    
    
    -- Shelves with misc books (was previously about crafts)
    -- In Troll's Bane
    PositionsZero = {
      position( -90, -128, 0 ),
      position( -90, -126, 0 ),
      position( -90, -124, 0 ),
      position( -97, -122, 0 ),
      position( -97, -124, 0 ),   
    }
    
    -- Shelves with books about histories
    -- In Troll's Bane
    PositionsOneA = {
      -- In Troll's Bane
      position( -88, -128, 0 ),
      position( -88, -126, 0 ),
      position( -88, -124, 0 ),
      -- In Academy
      position( 34, 21, 50 ),
      position( 34, 23, 50 ),
      -- in Grey Refuge Castle
      position( -53, -234, 0 ),
	  position( -55, -234, 0 ),
	  position( -57, -234, 0 )
    }
    
    -- Shelves with books about cultures
    -- In Troll's Bane
    PositionsOneB = {
      position( -83, -122, 0 ),
      position( -85, -129, 0 ),
      position( -87, -129, 0 ),
      -- in Academy
      position( 36, 21, 50 ),
      position( 36, 23, 50 ),
      position( 36, 25, 50 ),
      position( 38, 21, 50 ),
      position( 38, 23, 50 ),
      position( 38, 25, 50 ),
      -- In Grey Refuge Castle
      position( -48, -233, 0 ),
      position( -48, -231, 0 ),
      position( -48, -229, 0 ),
      position( -48, -227, 0 ),
      -- in Varshikar Castle
      position( 253, -318, -3 )
    }

    -- Shelves with books about Eldan priests and history
    -- In Tol Vanima
    PositionsTwo = {
      position( 360, 209, -3 ),
      position( 363, 209, -3 ),
      position( 366, 209, -3 )
    }

    -- Shelves with books about other stuff
    -- In Varshikar
    PositionsThree = {
      position( 272, -310, 0 ),
      position( 274, -310, 0 ),
      position( 276, -310, 0 ),
    }

    -- Shelves with books about the old man's tales
    -- In Tol Vanima
    PositionsFourA = { position( 361, 212, -3 ) };
    PositionsFourB = { position( 363, 212, -3 ) };
    PositionsFourC = { position( 365, 212, -3 ) };
    PositionsFourD = { position( 367, 212, -3 ) };
    
    -- Shelves with dwarven books
    -- In Silverbrand
    PositionsFive = {
       position( 129, -209, -3 ),
       position( 129, -211, -3 ),
       position( 137, -212, -3 ),
       position( 139, -212, -3 ),
       position( 175, -204, -3 ),
       position( 173, -204, -3 ),
       position( 171, -204, -3 )
    }
    
    -- In Silverbrand - Hall of the Axe
    PositionsSix = {
       position( 112, -164, -3 ),
       position( 112, -162, -3 )
    }
    
    -- In Magnus' building in Tol Vanima
    PositionsSeven = {
       position( 317, 233, -3 );
    }
    
    -- In Grey Refuge Castle
    PositionsEight = {
       position( -43, -233, 0 )
    }
    -- In Grey Rose's Castle
	PositionsEightB = {
	   position( -41, -228, 0 )
	}
	
	-- Gem Books
	PositionsNine = {
		position(-92,-123,1);		-- TB Library first floor
		position(367,220,0);		-- Tol Vanima
		position( 278, -308,0);		-- Varshikar
		position( 137, -212, -3 );	-- Silverbrand
		position(42,20,50);			-- Magic academy
		position(-41,-231,0);		-- Grey Rose
		position(-32,-132,-3);		-- Garon's workshop
		position(33,22,1);      	-- Kadi's Room
		position( 253, -320, -3 );  -- Varshikar Castle
	}

    -- Kadiya's room / magic academy
    PositionsTen = {
       position( 33, 23, 51 )
    }

    -- Greenbriar bookshelf in tavern
    PositionsEleven = {
       position( -370, 74, 0 )
    }

    -- With books about history/celebrations
    -- Shelves in Varshikar Castle Library
	PositionsTwelve = {
	   position( 255, -318, -3 )
	}

	-- With books about basics of magic
    -- Shelves in Varshikar Castle Library
	PositionsThirteen = {
	   position( 255, -320, -3 )
	}

	-- With books about Fragments of the lost Chronicles of Manrok
    -- Shelves in Varshikar Castle Library
	PositionsForteen = {
	   position( 238, -325, -6 )
	}

    -- With books about Daughter of Blood
    -- Shelves in Varshikar Castle Library
	PositionsFifteen = {
	   position( 230, -326, -6 )
	}

	--In Magic Academy
	PositionsSixteen = {
      	position( 34, 25, 50 )
	}
	
    -- Misc books (previously about crafts)
    BooksZero = {
        {2622,4},              -- How to be a simple monk
		{2616,2},              -- Ms. Piggy book
		{2615,7},             -- Brewyn the Liar
		{2605,3};            -- cooking book
  --    {106,0},              -- Simple Guide to Carpentry
  --    {107,0},              -- Husbandry and Nutrition
  --    {109,0},              -- Alchemists Basics
  --    {129,0},              -- Guide to Basic Cooking
  --    {2617,2}              -- Tihgorac's Book of Combat
    }  
  
    -- Books about histories
    BooksOneA = {
      {116,0},              -- History of Illarion
      {2607,0},             -- Gods of Illarion
      {2622,1},             -- Religions of Illarion
      {2617,0}              -- Celebrations
    }
    
    -- Books about cultures
    BooksOneB = {
      {2622,2},             -- Human Culture
      {2609,0},             -- Elven History and Culture
      {2619,2},             -- Dwarven History and Culture
      {2607,1},             -- Halfling Culture and History
      {2617,1},             -- Lizard Culture and History
      {2616,0},             -- Feary Culture
      {2606,0},             -- Gnomish Culture
      {2604,0},             -- Orcish Culture
      {2598,0}              -- Goblin Culture
    }
    
    -- Books about the Eldan priests and others
    BooksTwo = {
      {2605,0},             -- Diary of Noira Liv
      {2622,0},             -- Priests of Eldan
      {2615,7},             -- Brewyn the Liar
      {2610,0}              -- Schira'thel, Daughter of Blood
    }
    
    -- Books about other stuff
    BooksThree = {
      {110,0},              -- Three Guiding truths
      {2619,0},              -- Fragments of the lost Chronicles of Manrok
	  {2605,3};            -- cooking book
    }
    
    -- Books about the old man's tales
    BooksFourA = { {2615, 0} };
    BooksFourB = { {2615, 1} };
    BooksFourC = { {2615, 2} };
    BooksFourD = { {2615, 3} };
    
    -- Dwarven books
    BooksFive = {
      {2604, 1},            -- The Founding of Silverbrand
      {2610, 2},            -- The Saga of Thiron
      {2615, 4},            -- Tialdin's Oath
      {2616, 1},            -- Tialdin's Speeches
      {2617, 3},            -- The Story of Urubur
      {2607, 2},            -- The Festival of Relationship
      {2598, 1}             -- Dwarven poems
    }
    
    BooksSix = {
      {2605, 1 }            -- Warguide of the Dwarves I
    }
    
    BooksSeven = {
      {2610, 3}             -- Confusion, by Magnus Magnol
    }
      
    BooksEight = {
      {2622, 3},            -- The Battle Epics of the Grey
      {2617, 6},			-- Glorification to Irmorom
      {2609, 1},            -- Petition in the name of Findari
      {2615, 6}				-- Petition on Zelphia
    }

    BooksEightB = {
	  {2617, 5}             -- Codex of the Grey Rose
    }

    BooksNine = {
      {116, 1};              -- Magic Stones (general)
      {107, 1};             -- Rubine
      {2622,5};             -- Diamanten
      {2607,3};             -- Blaustein
      {115, 1};             -- Smaragd
      {2619,3};             -- Obsidian
      {108, 1};             -- Amethyst
      {2615,5};             -- Topas
    }

    BooksTen = {
      {2619, 4}             --  Drachenträume
    }
    
    BooksEleven = {
      {2598, 2};			-- Cake Bible
	  {2617, 4};            -- The Articles of Greenbriar
	  {2607, 1};            -- Halfling Culture and History
	  {2622, 6};			-- The book of the jokes
	  {2609, 2};			-- The chronicles of the Blumfussens 
	  {2604, 2};            -- About the humans
	  {2610, 5};  			-- Evergreen Halflings
	  {2615, 7};             -- Brewyn the Liar
	  {2605, 3};            -- cooking book
    }

    -- Twelve - Fifteen: In Varshikar Castle
    BooksTwelve = {
      {116,0},              -- History of Illarion
      {2617,0}              -- Celebrations
    }

    BooksThirteen = {
      {2610, 4}             -- Basics of Magic
    }

    BooksForteen = {
      {2619,0}              -- Fragments of the lost Chronicles of Manrok
    }

    BooksFifteen = {
      {2610,0}              -- Schira'thel, Daughter of Blood
    }
	-- in Magic Academy
   	BooksSixteen = {

		{2615,7};             -- Brewyn the Liar
    }
	--
  AddBookshelves( PositionsZero, BooksZero, 
    "\"Seien Sie ein Mönch\", \"Barköpfige Könige\", \"Kochen auf Illarion, Band 1\n Fisch und Fleisch \", \"Brewyn der Lügner\"",
    "\"How To Be A Simple Monk\", \"Bareheaded Kings \", \"Cooking in Illarion, volume 1\n Fish and Meat\", \"Brewyn the Liar\"" );
  AddBookshelves( PositionsOneA, BooksOneA,
    "Geschichte, Götter, Religion, Feiertage",
    "History, Gods, Religions, Celebrations" );
  AddBookshelves( PositionsOneB, BooksOneB,
    "Kulturen: Menschen, Elfen, Zwerge, Halblinge, Echsenmenschen, Feen, Gnome, Orks, Goblins",
    "Cultures: Human, Elven, Dwarven, Halfling,  Lizardmen, Faery, Gnomish, Orcish, Goblin" );
  AddBookshelves( PositionsTwo, BooksTwo,
    "Tagebuch von Noira Liv, Priester Eldans, Tochter des Blutes, \"Brewyn der Lügner\"",
    "Diary of Noira Liv, Priests of Eldan, Daughter of Blood, \"Brewyn the Liar\"" );
  AddBookshelves( PositionsThree, BooksThree,
    "Three Guiding Truths, verlorenen Chroniken von Manrok,  \"Kochen auf Illarion, Band 1\n Fisch und Fleisch \"",
    "Three Guiding Truths, Lost Chronicles of Manrok,  \"Cooking in Illarion, volume 1\n Fish and Meat\"" );
  AddBookshelves( PositionsFourA, BooksFourA,
    "Der Alte Mann, Buch 1 1",
    "the Old Man's Tales Book 1" );
  AddBookshelves( PositionsFourB, BooksFourB,
    "Der Alte Mann, Buch 1 2",
    "the Old Man's Tales Book 2" );
  AddBookshelves( PositionsFourC, BooksFourC,
    "Der Alte Mann, Buch 1 3",
    "the Old Man's Tales Book 3" );
  AddBookshelves( PositionsFourD, BooksFourD,
    "Der Alte Mann, Buch 1 4",
    "the Old Man's Tales Book 4" );
  AddBookshelves( PositionsFive, BooksFive,
    "Von der Gründung Silverbrands, Thiron Saga, Tialdins Gelöbnis, Reden König Tialdins, Die Geschichte Urubur, Gedichte",
    "Founding of Silverbrand, Saga of Thiron, Tialdin's Oath, Tialdin's Speeches, Urubur's Story, Festival of Relationship, Poems" );
  AddBookshelves( PositionsSix, BooksSix,
    "Kriegshandbuch der Zwerge I",
    "Warguide of the Dwarves I" );
  AddBookshelves( PositionsSeven, BooksSeven,
    "Verwirrung",
    "Confusion" );
  AddBookshelves( PositionsEight, BooksEight,
    "Poesie und epische Geschichten, Lobpreis an Irmorom, Gebet im Namen Findaris, Gebet für Zelphia",
    "Poetry and Epic Stories, Glorification to Irmorom, Petition for Findari, Petition for Zelphia" );
  AddBookshelves( PositionsEightB, BooksEightB,
	"Kodex der Grauen Rose",
	"Codex of the Grey Rose" );
  AddBookshelves( PositionsNine, BooksNine,
    "Magische Steine",
    "Magic stones" );
  AddBookshelves( PositionsTen, BooksTen,
    "Gesammelte Werke",
    "Collected works" );
  AddBookshelves( PositionsEleven, BooksEleven,
    "Die Kuchenbibel, Die Satzung Greenbriars, Kultur und Geschichte der Halblinge, Buch der Witze, Stammbaum der Blumfußens, Über die Menschen, \"Evergreen Halblinge\", \"Kochen auf Illarion, Band 1\n Fisch und Fleisch \", \"Brewyn der Lügner\"",
    "The Cake Bible, The Articles of Greenbriar, Halfling Culture and History, Book of the jokes, Chronicle of the Blumfußens, About the Humans, \"Evergreen Halflings\", \"Cooking in Illarion, volume 1\n Fish and Meat\", \"Brewyn the Liar\"" );
  AddBookshelves( PositionsTwelve, BooksTwelve,
    "Geschichte, Feiertage",
    "History, Celebrations" );
  AddBookshelves( PositionsThirteen, BooksThirteen,
    "Grundlagen der Magie",
    "Basics of Magic" );
  AddBookshelves( PositionsForteen, BooksForteen,
    "verlorenen Chroniken von Manrok",
    "Lost Chronicles of Manrok" );
  AddBookshelves( PositionsFifteen, BooksFifteen,
    "Tochter des Blutes",
    "Daughter of Blood" );
  AddBookshelves( PositionsSixteen, BooksSixteen,
    "\"Brewyn der Lügner\"",
    "\"Brewyn the Liar\"" );
end

function AddBookshelves( Positions, Books, gBooks, eBooks )
  offset = table.getn( Libraries ) + 1; 
  Libraries[offset] = {}; 
  Libraries[offset][1] = Positions;
  Libraries[offset][2] = Books;
  Libraries[offset][3] = gBooks;
  Libraries[offset][4] = eBooks;
end

function CreateBookList( TargetPos )
    local retList={};
    for i = 1, table.getn( Libraries ) do
        for j = 1, table.getn( Libraries[i][1] ) do
            if ( BookshelvesEqual( Libraries[i][1][j], TargetPos ) ) then
                for k = 1, table.getn( Libraries[i][2] ) do
                    retList[k] = Libraries[i][2][k][1]    
                end
--                for bookid, bookdata in Libraries[i][2] do
--                    retList[bookid] = true;
--                end
            end
        end
    end
    return retList
end

function BookshelvesEqual( BSPosi, Posi )
    return ( ( BSPosi.x == Posi.x ) and ( BSPosi.y == Posi.y ) and ( BSPosi.z == Posi.z ) )
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if ( Libraries == nil ) then
        InitLibraries()        
    end
    
        
    if ( Param == 0 ) then
        local BookList = CreateBookList( SourceItem.pos );
        BookMenu = MenuStruct()                    -- make new menu;
        for i = 1, table.getn( BookList ) do
            BookMenu:addItem( BookList[i] );
        end
--        for bookid, nothing in BookList do
--            BookMenu:addItem( bookid );
--        end
        User:sendMenu( BookMenu );
    else
        if DistanceFromPosToPos( SourceItem.pos, User.pos ) > 1 then
            return;
        end;
  
        local bookPos = getFreePosition( User, SourceItem );
        
        done = false;
        for i = 1, table.getn( Libraries ) do      
            for j = 1, table.getn( Libraries[i][1] ) do      
                if ( BookshelvesEqual( Libraries[i][1][j], SourceItem.pos ) ) then
                    for k = 1, table.getn( Libraries[i][2] ) do
                        if ( Libraries[i][2][k][1] == Param ) and ( not done ) then
                            world:createItemFromId( Param, 1, bookPos, true, 333, Libraries[i][2][k][2] );
                            done = true;
                        end
                    end
                end
            end
        end
    end
end

function getFreePosition( User, BS )
   local faceto = User:getFaceTo();
   
   if BS.id == 266 then
      return position( User.pos.x + 1, User.pos.y, User.pos.z );
   else
      return position( User.pos.x, User.pos.y + 1, User.pos.z );
   end;
end

function DistanceFromPosToPos(TargetA,TargetB)
    local LengthX=math.sqrt(math.pow(TargetA.x-TargetB.x,2));
    local LengthY=math.sqrt(math.pow(TargetA.y-TargetB.y,2));
    return math.ceil(math.sqrt(math.pow(LengthX,2)+math.pow(LengthY,2)))
end

function LookAtItem(User,Item)
    if ( Libraries == nil ) then
        InitLibraries()        
    end
    
    for i = 1, table.getn( Libraries ) do      
        for j = 1, table.getn( Libraries[i][1] ) do      
            if ( BookshelvesEqual( Libraries[i][1][j], Item.pos ) ) then
                if (User:getPlayerLanguage()==0) then
                    --world:itemInform(User,Item, "Bücherregal (" .. Libraries[i][3] .. ")" );
                    User:inform( "Verschiedene Bücher über " .. Libraries[i][3] );
                else
                    --world:itemInform(User,Item, "Bookshelf (" .. Libraries[i][5] .. ")" );
                    User:inform( "books about " .. Libraries[i][4] );
                end  
                return;  
            end
        end
    end
    
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,world:getItemName(Item.id,0)) 
    else
        world:itemInform(User,Item,world:getItemName(Item.id,1)) 
    end        
end
---- Bücherregal
--
--function InitLibraries()
--    LibPos={};
--    LibRad={};
--    LibBooks={};
--
--    AddLibrary(position(-89,-125,0),15,
--    {
--      {106,0},
--      {107,0},
--      {108,0},
--      {109,0},
--      {110,0},
--      {111,0},
--      {112,0},
--      {113,0},
--      {114,0},
--      {115,0},
--      {116,0},
--      {127,0},
--      {131,0},
--      {2606,0},
--      {2607,0},
--      {2608,0},
--      {2610,0},
--      {2619,0},
--      {2621,0}
--    });
--
--end
--
--function AddLibrary(Posi,Rad,Books)
--    table.insert(LibPos,Posi);
--    table.insert(LibRad,Rad);
--    offset = table.getn(LibRad);
--    LibBooks[offset] = { };
--    for i, bookdef in Books do
--        if not LibBooks[offset][bookdef[1]] then
--            LibBooks[offset][bookdef[1]] = {};
--        end
--        table.insert( LibBooks[offset][bookdef[1]], bookdef[2] );
--    end
--end
--
--function DistanceFromPosToPos(TargetA,TargetB)
--    local LengthX=math.sqrt(math.pow(TargetA.x-TargetB.x,2));
--    local LengthY=math.sqrt(math.pow(TargetA.y-TargetB.y,2));
--    return math.ceil(math.sqrt(math.pow(LengthX,2)+math.pow(LengthY,2)))
--end
--
--function CreateBookList(TargetPos)
--    local retList={};
--    for i=1,table.getn(LibPos) do
--        if (DistanceFromPosToPos(TargetPos,LibPos[i])<=LibRad[i]) then
--            for bookid, bookdata in LibBooks[i] do
--                retList[bookid] = true;
--            end
--        end
--    end
--    return retList
--end
--
--function UseItem(User,SourceItem,TargetItem,Counter,Param)
--    if (LibPos==nil) then
--        InitLibraries()
--    end
--    if (Param == 0) then
--        BuecherListe=CreateBookList(SourceItem.pos);
--        BuecherMenue = MenuStruct()                    -- make new menu
--        for bookid, nothing in BuecherListe do
--            BuecherMenue:addItem(bookid);
--        end
--        User:sendMenu(BuecherMenue);
--    else
--        -- Position für Buch
--        local buchPos = position(SourceItem.pos.x+1, SourceItem.pos.y+1, SourceItem.pos.z )    
--        
--        done = false;
--        for i=1,table.getn(LibPos) do            
--            if (DistanceFromPosToPos(TargetPos,LibPos[i])<=LibRad[i]) then
--                for bookid, bookdatalist in LibBooks[i] do
--                    if (bookid == Param) and not done then
--                        math.randomseed( SourceItem.pos.x + SourceItem.pos.y + SourceItem.pos.z );
--                        bookdata = bookdatalist[ math.random( 1, table.getn(  bookdatalist ) ) ];
--                        world:createItemFromId(Param,1,buchPos,false,333,bookdata);
--                        done = true;
--                    end
--                end
--            end
--        end
--    end
--end
