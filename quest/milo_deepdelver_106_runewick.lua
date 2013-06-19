-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (73, 'quest.milo_deepdelver_106_runewick');
     
require("base.common")
module("quest.milo_deepdelver_106_runewick", package.seeall)
     
GERMAN = Player.german
ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Milos Ochse"
Title[ENGLISH] = "Milo's ox"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge zehn Karotten und bringe sie Milo. Du kannst sie entweder am Feld anbauen oder beim Händler kaufen."
Description[ENGLISH][1] = "Produce ten carrots and bring them back to Milo. You can plant seeds on the fields or buy them from a merchant."
Description[GERMAN][2] = "Du hast Milo seine Karotten gebracht. Jetzt kann er nach Hause zurück kehren."
Description[ENGLISH][2] = "You brought Milo the carrots. Now he can go home." 

 
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(847, 828, 0), position(911, 798, 0), position (883, 634, 0)} -- Feld, Händler
QuestTarget[2] = {position(883, 634, 0)}
     
-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 2
     
     
function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end
     
function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""
     
    return base.common.GetNLS(user, german, english)
end
     
function QuestTargets(user, status)
    return QuestTarget[status]
end
     
function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
