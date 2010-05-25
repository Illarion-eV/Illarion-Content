-- Erze einschmelzen

-- Vorsicht: Benutzt items aus dem neuen Client! Nicht RS-fähig

-- UPDATE common SET com_script='I_2748_schmelztigel.lua' WHERE com_itemid=2748;

dofile( "base_tools.lua" );
dofile( "base_lookat.lua" );

function InitSmelter(User)
    --User:inform("Init Smelter");

    -- fill lists only on first call
    if InitTools() then
        --User:inform("Setting producst");

        -- set basic parameters
        SetSkill( 2, "smithing", "agility");
        SetTools( {2751,2748},                                          -- -- Tigelzange, Tigel
                        {"body", "belt"}, {} );      

        SetFoodConsumption( 300 ); 
        SetDefaultLocation( { 2835 } );                                -- brennende Esse
        SetDefaultSound( 7 );

                                -- DIE LISTE DER ERZEUGBAREN ITEMS!
    
        AddProduct(  0, 2749, 0 );                              -- Tigel mit Eisen
        AddMaterial( {22,21},{"belt","belt"}, {1,1} );  -- Erz, Kohle
   	ConsumeTool();

        AddProduct(  0, 2750, 0 );                              -- Tigel mit Gold
        AddMaterial( {234,21},{"belt","belt"}, {5,3} );  -- Erz, Kohle
   	ConsumeTool();

        AddProduct(  0, 2753, 0 );                              -- Tigel mit Kupfer
        AddMaterial( {2536,21},{"belt","belt"}, {1,1} ); -- Erz, Kohle
   	ConsumeTool();

    end
end


function UseItem(User,SourceItem,TargetItem,Counter,Param)  -- DONT EDIT THIS LINE!
    --User:inform("using gold ");

    InitSmelter( User );

    if ToolsPresent(User) then

        if (Param==0) then
            ToolBuildItemMenu(User, 0);
        else                                    -- es wurde ein item gewaehlt
            stat  = ToolCreateItem( User, SourceItem, Param );
            --User:inform("done "..stat );
            if stat == 2 and Param ~= 2550 then
                -- Tiegel nach erfolgreichem Abwickeln entfernen
                 --User:inform("deleting tools" );
                User:eraseItem(2748,1);                     -- tigel entfernen
            end
        end

    end --check tools
end --function

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 1, false, false ));
end