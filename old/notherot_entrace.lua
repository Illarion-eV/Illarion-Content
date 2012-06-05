-- INSERT INTO triggerfields VALUES (244,-362,-6,'triggerfield.notherot_entrace');

module("triggerfield.notherot_entrace", package.seeall)

function CharacterOnField(Character)
    local TestItem = Character:getItemAt(Character.right_tool);
    if ((TestItem.id == 283) and (TestItem.data == 6666)) then
        return
    end
    Character:warp(position(252,-362,-6));
    if (Character:getPlayerLanguage()==0) then
        Character:inform("Eine unsichtbare Kraft wirft dich zurück!");
    else
        Character:inform("A invisible force throws you backwards!");
    end
end
