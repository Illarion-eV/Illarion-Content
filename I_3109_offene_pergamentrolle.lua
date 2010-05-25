require("base.common")


function LookAtItem(User,Item)
    lang = User:getPlayerLanguage();
    if(Item.data==1) then
   	if (lang==1) then
   	    world:itemInform(User,Item,"Exam of the magic academy of gobaith");
   	else
   	    world:itemInform(User,Item,"Examen der magischen Akademie zu Gobaith");
   	end
    elseif (Item.data==600) then
	base.common.InformNLS( User, "Von der offnenen Pergamentrolle geht ein gefährliches rotes Glühen aus.","moep." );

   	if (lang==1) then
   	    world:itemInform(User,Item,"open pell");
   	else
   	    world:itemInform(User,Item,"offene Pergamentrolle");
   	end
    end
end

function MoveItemAfterMove( User, SourceItem, TargetItem )
    if ( TargetItem.data == 600 ) then
        User:inform("moep->BOOM!");
	world:erase( TargetItem, 1 );
        return true;
    else
        return true;
    end

end


function UseItem(User, SourceItem, TargetItem, counter, param)
    if(SourceItem.data==1) then
   	if (lang==1) then
    	    User:inform("There's not much to see yet.");
   	else
    	    User:inform("Du kannst nicht viel darauf erkennen.");
   	end
    else
    	use=nothing;
    end
end
