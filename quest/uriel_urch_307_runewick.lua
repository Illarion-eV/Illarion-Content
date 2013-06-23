-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (307, 'quest.uriel_urch_307_runewick');

require("base.common")
module("quest.uriel_urch_307_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Geschichten und Schwerter"
Title[ENGLISH] = "Tales and Swords"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge einen Bierkrug und bringe ihn Uriel. Du kannst einen Bierkrug vom Händler kaufen oder fülle Bier aus einer Flasche in einen leeren Krug. Bier kann man mit einen Kochlöffel am Weinfass herstellen."
Description[ENGLISH][1] = "Get a mug of beer and take it to Uriel. You can buy a mug of beer from a merchant or pour beer from a bottle into a mug. You can brew beer using a cooking spoon at a wine barrel."
Description[GERMAN][2] = "Frag doch Uriel nach seiner Geschichte."
Description[ENGLISH][2] = "Ask Uriel for his story."
Description[GERMAN][3] = "Besorge noch einen Bierkrug und bringe ihn Uriel. Du kannst einen Bierkrug vom Händler kaufen oder fülle Bier aus einer Flasche in einen leeren Krug. Bier kann man am Weinfass herstellen."
Description[ENGLISH][3] = "Get a mug of beer and take it to Uriel. You can buy a mug of beer from a merchant or pour beer from a bottle into a mug. You can brew beer using a cooking spoon at a wine barrel."
Description[GERMAN][4] = "Frag doch Uriel nach seiner Geschichte."
Description[ENGLISH][4] = "Ask Uriel for his story."
Description[GERMAN][5] = "Besorge noch einen Bierkrug und bringe ihn Uriel. Du kannst einen Bierkrug vom Händler kaufen oder fülle Bier aus einer Flasche in einen leeren Krug. Bier kann man am Weinfass herstellen."
Description[ENGLISH][5] = "Get a mug of beer and take it to Uriel. You can buy a mug of beer from a merchant or pour beer from a bottle into a mug. You can brew beer using a cooking spoon at a wine barrel."
Description[GERMAN][6] = "Spreche Uriel noch einmal an."
Description[ENGLISH][6] = "Talk to Uriel once more."
Description[GERMAN][7] = "Du hast Uriel Bier gebracht und seiner Geschichte gelauscht. Danke dafür."
Description[ENGLISH][7] = "You have brought beer to Uriel and have listened his story. Thanks for that."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(902, 773, 0), position(899, 772, 0), position (906, 841, 0)}
QuestTarget[2] = {position(902, 773, 0)} 
QuestTarget[3] = {position(902, 773, 0), position(899, 772, 0), position (906, 841, 0)} 
QuestTarget[4] = {position(902, 773, 0)} 
QuestTarget[5] = {position(902, 773, 0), position(899, 772, 0), position (906, 841, 0)} 
QuestTarget[6] = {position(902, 773, 0)} 
QuestTarget[7] = {position(902, 773, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 7


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
