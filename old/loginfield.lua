module("triggerfield.loginfield", package.seeall)

function CharacterOnField(character)
    character:talk(Character.say,"Ich befinde mich auf einem Triggerfeld");
end

function MoveToField(character)
    character:talk(Character.say,"Aua! Geh von mir runter,"..character.name.."!");
end

function MoveFromField(character)
    character:talk(Character.say,"Danke. Warum nicht gleich?!");
end

function PutItemOnField(item,character)
    character:talk(Character.say,"Kann man das essen?");
end

function TakeItemFromField(item,character)
    --character:talk(Character.say,"Soebend habe ich etwas von einen Triggerfeld genommen: " .. item.id .. "!");
    character:talk(Character.say,"Soebend habe ich etwas von einen Triggerfeld genommen: " .. item.id .. "!");
end
