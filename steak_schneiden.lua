-- Aus Fleisch ein Steak herausschneiden

function UseItem(User,SourceItem,TargetItem,Counter,Param)

 if ((TargetItem == 307) or (TargetItem == 2934)) then

     world:swap(TargetItem,2940,0)
     User:createItem(2940,1,333,0)

 end



end -- function