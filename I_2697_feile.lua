-- Schmieden mit Feile

-- UPDATE common SET com_script='I_2697_feile.lua' WHERE com_itemid=2697;

dofile( "base_lookat.lua" );
dofile( "base_tools.lua" );

function InitHammer( User )
    -- User:inform( "Init carving knives" );

    -- fill lists only on first call
    if InitTools(  ) then
        -- User:inform( "Setting producst" );

        menstate={  };

        -- set basic parameters
        SetSkill( 2, "smithing", "dexterity" );
        SetTools( { 2697 },                                                                 -- Feile
        { "body" },                                                          -- ( "all", "belt", "body", "backpack" )
        { }
        );
        SetDefaultLocation( { } );
        SetDefaultSound( 8 );

        SetDefaultMaterial( { 2535 }, { "belt" }, { 1 } );

        AddProduct(  0, 2121, 40 );
        AddProduct(  0, 2122, 40 );
        AddProduct(  0, 2123, 40 );
        AddProduct(  0, 2124, 40 );
        AddProduct(  0, 2141, 40 );
        AddProduct(  0, 2144, 40 );
        AddProduct(  0, 2145, 40 );
        AddProduct(  0, 3056, 40 );
        AddProduct(  0, 3054, 40 );
        AddProduct(  0, 2558, 40 );
        AddProduct(  0, 2556, 40 );
        AddProduct(  0, 3054, 40 );
    end
end

function UseItem( User, SourceItem, TargetItem, Counter, Param )  -- DONT EDIT THIS LINE!
    --User:inform( "Using hammer" );

    -- init tools if required
    InitHammer( User );

    if menstate[ User.id ]==nil then                           -- menustatus initialisieren.
        menstate[ User.id ]=0;
        -- User:inform( "Init menstate "..menstate[ User.id ] );
    end

    if ToolsPresent( User ) then

        -- used with a target
        if( TargetItem.id ~= 0 ) then
            RohlingBearbeiten(User,TargetItem)
        else
            if ToolsPresent( User ) then
                if ( Param==0 ) then
                    ToolBuildItemMenu( User, 0 );
                else                                    -- es wurde ein item gewaehlt
                    ToolCreateItem( User, SourceItem, Param );
                end
            end --check tools
        end
    end
end --function

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 1 ));
end

function CheckValidKeyItem(Item)
    local retVal=false;
    if (Item.data~=0) then
        for i=1,table.getn(itemToProduce) do
            if (Item.id==itemToProduce[i]) then
                retVal=true;
            end
        end
    end
    return retVal
end

function RohlingBearbeiten(User,OrgKey)
    RItem=User:getItemAt(5);
    LItem=User:getItemAt(6);
    if (RItem.id==OrgKey.id and RItem.data==0) then
        KeyItem=RItem;
    elseif (LItem.id==OrgKey.id and LItem.data==0) then
        KeyItem=LItem;
    else
        base.common.InformNLS(User,
        "Du musst einen passenden Schlüsselrohling in der Hand haben",
        "You have to hold a fitting blank key in your hand");
        return
    end
    if (RItem.id == needTool[1] or LItem.id ==needTool[1])  then
        if CheckValidKeyItem(OrgKey) then
            needSkill[0]=90;
            local UserSkill=getModifiedSkill( User, 1 );                 -- skill auslesen
            local UserAttrib=User:increaseAttrib( LeadAttrib, 0 );       -- attribut auslesen
            if checkSuccess(User,0,UserSkill,UserAttrib) then
                KeyItem.data=OrgKey.data;
                world:changeItem(KeyItem);
                base.common.InformNLS(User,
                "Du feilst den Bart erfolgreich um",
                "You file the key bit successfuly"); 
            else
                base.common.InformNLS(User,
                "Du brichst den Rohling ab",
                "You break the blank key");
                world:erase(KeyItem,1);
            end
        else
            base.common.InformNLS(User,
            "Du musst die Feile alleine oder mit einem Originalschlüssel benutzen",
            "You have to use the rasp without anything or with a original key");
        end
    else
        base.common.InformNLS(User,
        "Du musst die Feile in die Hand nehmen",
        "You have to hold the rasp in your hand");
    end
end