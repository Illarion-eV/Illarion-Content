module("npc.tayaneth", package.seeall)

function useNPC(user)
    --user:talk(Character.say, "test");
    thisNPC:increaseSkill(1,"common language",100);
    originator:inform( "Don't dare to touch me!");
end

function nextCycle()

end

function receiveText(texttype, message, originator)

    if (librfirst == nil) then
    
        TraderTrig[1]="[Gg]reetings"; 
        TraderText[1]="Be greeted, what can I do for you?"; 
        
        TraderTrig[2]="[Hh]ello"; 
        TraderText[2]="Good day"; 
        
        TraderTrig[3]="[Yy]ou.+[Tt]rader"; 
        TraderText[3]="I trade different wares, if you pay enough." 
        
        TraderTrig[4]="[Ww]hat.+sell"; 
        TraderText[4]="I sell smithed objects. *My* smithed weapons, armor and such. Hurry."; 
        
        TraderTrig[5]="[Ww]hat.+[Ww]eapons"; 
        TraderText[5]="Narrrr. You are stealing my time. Some swords and daggers.."; 
        
        TraderTrig[6]="[Ww]hat.+[Aa]rmor"; 
        TraderText[6]="Helmets. Dare to hurry up?"; 
        
        TraderTrig[7]="[Tt]ell.+[Ss]omething"; 
        TraderText[7]="Leave me alone. I won't waste my time tellin' ya anything";
        
        TraderTrig[8]="[Gg]oodbye"; 
        TraderText[8]="Finally."; 
        
        TraderTrig[9]="[Bb]ye"; 
        TraderText[9]="Ya, leave."; 
        
        TraderTrig[10]="[Ff]arewell"; 
        TraderText[10]="Ya, go away. Fast."; 
        
        TraderTrig[11]="[Ww]hat.+buy"; 
        TraderText[11]="Smithed objects."; 
        
        TraderTrig[12]="[Ww]ho.+you?"; 
        TraderText[12]="What's your interest in my name? They call me "..thisNPC.name.."."; 
        
        TraderTrig[13]="I'm .+"; 
        TraderText[13]="Yes. Who cares?";
        thisNPC:increaseSkill(1,"common language",100);
        originator:inform("ini...");
        librfirst=1;
    end
    if thisNPC:isInRange(originator,2) then
        if originator.id ~= thisNPC.id then                                                  --straight forward (avoid talking to himself).
            originator:introduce(thisNPC);

            if (string.find(message,"[Gg]reetings") ~= nil) then                         --reacts if "greetings" (or Greetings) is inside the text
                originator:inform( "Good day, stranger. What is your name?");
            elseif (string.find(message,originator.name) ~= nil) then
                originator:inform( "Nice to meet you, "..originator.name..". My name is "..thisNPC.name..". Can I help you?");
                originator:introduce(thisNPC);
            elseif (string.find(message,"[Ww]ho.*are.*you") ~= nil) then
                originator:inform( "I am "..thisNPC.name..", the librarian. I studied Illarions history.");
            elseif (string.find(message,"chronicle") ~= nil) then
                TextNumb=math.random(table.getn(HistText));
                originator:inform( HistText[TextNumb]);
            elseif (string.find(message,"history") ~= nil) then
                TextNumb=math.random(table.getn(HistText));
                originator:inform( HistText[TextNumb]);
            end
        end
    end
end
