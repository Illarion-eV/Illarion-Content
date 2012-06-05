-- INSERT INTO triggerfields VALUES (39,76,100,'triggerfield.noobia_cross');
-- leads the newbie's attention on the yellow cross and the lizard

require("base.common")

module("triggerfield.noobia_cross", package.seeall)

function MoveToField(User)
	
	if (User:getQuestProgress(2) < 40) and ( not User:isAdmin() )then
		User:warp(position(39,73,100));
		base.common.TempInformNLS(User,
			"Du hast die Lektionen der Zwerge Hammerfaust noch nicht absolviert. Gehe diesen Weg zurück und spreche einen von ihnen an. Sie werden dich weiterschicken, wenn du fertig bist.",
			"You haven't passed the lessons of the dwarves Hammerfaust. Go this way back and talk to one of them. They will send you further if you're done.");
	else
		base.common.TempInformNLS(User,
			"Als du so den Weg entlangschlenderst, fällt dir die glänzende Säule neben dem Echsenmenschen auf. Dieser Gefährte scheint wohl mehr darüber zu wissen. Vielleicht sagst du ihm mal hallo und fragst ihn, wer er ist und was diese Säule ist.",
			"As you stroll along the road, the shiny column next to the Lizardman attracts your attention. This fellow seems to know more about it. Perhaps you say hello and ask him who he is and what this column is.")
	end
end
