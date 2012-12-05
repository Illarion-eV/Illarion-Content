-- Quest: The Ghost Oak (112)
require("base.common")

module("triggerfield.ghostoak", package.seeall)

function MoveToField(User)
   if (User:getQuestProgress(112) == 1) then
      base.common.InformNLS(User, 
         "[Queststatus] Ein Schauer läuft dir den Rücken herunter, als du den Hain betrittst. Du hast die Geistereiche gefunden.",
         "[Quest status] A shiver runs down your spine as you enter the grove. This must be the ghost oak.");
      User:setQuestProgress(112, 2);
   end
end
