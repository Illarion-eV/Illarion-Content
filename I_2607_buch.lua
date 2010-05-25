--Buch
function UseItem(User,SourceItem,TargetItem,Counter,Param)


 if Counter ==1 then User:inform("You find nothing new in this book ") end


-- Buch in Regal stellen
 if ((TargetItem.id == 266) or (TargetItem.id == 267)) then

     world:erase(SourceItem,1)
 end

     --User:learn(4,"library research",2,100)

end
