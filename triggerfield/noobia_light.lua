-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');

require("base.common")

module("triggerfield.noobia_light", package.seeall)

function MoveToField(Character)
    -- for Noobia: the char has to walk to a specific field (this triggerfield); he gets a message and we add a LTEvalue so that we remember he was at the field
	--find, myEffect = Character.effects:find(13)
	--if find then
	    base.common.InformNLS(Character,
	    "Um mit dem Echsenmann zu sprechen, öffne die Sprechkonsole mit Enter, schreibe etwas und drücke wieder Enter. Alle NPCs (NonPlayerCharacters) reagieren auf bestimmte Signalwörter wenn du in ihrer Nähe stehst. Versuche den Echsenmann um 'Hilfe' zu bitten. Ist die Sprachkonsole leer, kannst du sie mit erneutem Drücken der Entertaste schließen.",
	    "@Rince: ziel erreicht 1 EN");
        --myEffect:addValue("noobiaLight",1)
	--end
end

-- in zeile 15 einfügen: "Um mit dem Echsenmann zu sprechen, öffne die Sprechkonsole mit Enter, schreibe etwas und drücke wieder Enter. Alle NPCs (NonPlayerCharacters) reagiern auf bestimmte Signal Wörter wenn du in ihrer Nähe stehst. Versuche den Echsenmann um 'Hilfe' zu bitten. Ist die Sprachkonsole leer, kannst du sie mit erneutem drücken der Entertaste schließen."