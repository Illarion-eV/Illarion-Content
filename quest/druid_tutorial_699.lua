--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (691, 'quest.druid_tutorial_691');

local common = require("base.common")

local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Naturmagie: Alchemie"
Title[ENGLISH] = "Nature Magic: Alchemy"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}


Description[GERMAN][1] =  "Großartig! Du hast mit Fianna gesprochen und dich auf den Pfad der Alchemie begeben, und sie hat zugestimmt, dir die Grundlagen beizubringen. Frage sie, wie du deinen ersten Trank brauen kannst, und sie wird dich auf diesem Weg begleiten."
Description[ENGLISH][1] = "Great! You've spoken with Fianna and embarked on the path of alchemy and she has agreed to teach you the basics. Ask her how to brew your first potion and she will guide you along the path."
Description[GERMAN][2] =  "Fianna hat dir eine Sichel gegeben und dich gebeten, mindestens vier Tannensprossen für sie zu sammeln, bevor du zurückkehrst. Du findest eine Tanne hinter ihr in der Nähe des Ufers. Wenn du deine Sichel verlierst, kannst du eine neue bei ihr oder bei anderen Spielern kaufen."
Description[ENGLISH][2] = "Fianna has given you a sickle and told you to gather at least four fir sprouts for her before returning. You can find a fir tree behind her near the shore. If you lose your sickle, you can buy another one from her or from other players."
Description[GERMAN][3] =  "Du hast die Tannensprossen gesammelt und bist bereit, von Fianna weiter zu lernen, wie man einen Trank braut. Sprich mit ihr, um fortzufahren."
Description[ENGLISH][3] = "You've collected the Fir Sprouts and are ready to continue learning about how to brew a potion from Fianna. Speak to her to continue."
Description[GERMAN][4] =  "Fianna hat dir einen Eimer gegeben und dich beauftragt, eine Wasserquelle zu finden, um ihn zu füllen, bevor du mit dem gefüllten Eimer zu ihr zurückkehrst."
Description[ENGLISH][4] = "Fianna has given you a bucket and tasked you to find a source of water to fill it with before returning to her with the bucket of water."
Description[GERMAN][5] =  "Du hast einen Eimer Wasser gefüllt und bist nun bereit für die nächsten Schritte. Sprich erneut mit Fianna, um zu erfahren, was zu tun ist."
Description[ENGLISH][5] = "You've filled a bucket of water and you are now ready for your next steps. Speak to Fianna again to learn what to do."
Description[GERMAN][6] =  "Fianna hat dir die benötigten Materialien gegeben und dich beauftragt, deine erste Basislösung herzustellen. In der Nähe befindet sich ein Kessel; stelle sicher, dass ihn gerade niemand benutzt. Wenn er frei, aber noch nicht leer ist, kannst du ihn mit einem Eimer Wasser reinigen ? vergiss nicht, ihn anschließend wieder zu füllen! Stelle dich mit dem Mörser in der Hand vor den Kessel, füge Wasser hinzu und doppelklicke dann die Zutaten nacheinander, während du auf den Abschluss jeder Aktion wartest: Eimer Wasser, Tannensprosse, Tannensprosse, Tannensprosse, Tannensprosse, dann die leere Flasche."
Description[ENGLISH][6] = "Fianna has handed you the required materials and tasked you with brewing your first stock. There is a cauldron nearby, ensure no one else is currently using it. If it is abandoned but not empty, you can use a water bucket to clean it, don't forget to refill! Face the cauldron with the mortar in your hand, add water, then double click the ingredients one by one and wait for the action to finish: bucket of water, fir sprout, fir sprout, fir sprout, fir sprout, then empty bottle."
Description[GERMAN][7] =  "Du hast deine erste Basislösung hergestellt. Du kannst den dir übergebenen Rubin benutzen, um ihre Eigenschaften zu prüfen. Sobald du bereit bist, sprich erneut mit Fianna, um die Grundlagen der Alchemie weiter zu erlernen."
Description[ENGLISH][7] = "You've created your first stock. You can use the ruby you were handed to inspect its properties. Once you are ready, speak to Fianna again to continue learning the basics of alchemy."
Description[GERMAN][8] =  "Es ist Zeit, deinen ersten Trank fertig zu brauen. Stelle dich dazu vor den leeren Kessel, doppelklicke die grüne Basislösung, um sie wieder in den Kessel zu geben, füge dann das Rubinpulver hinzu, fülle die Flasche erneut und sage Trank zu Fianna."
Description[ENGLISH][8] = "It's time to finish brewing your first potion. To do so just stand in front of the empty cauldron, double-click the green potion stock to add it back to the cauldron, then add ruby powder, rebottle, and say potion to Fianna."
Description[GERMAN][9] =  "Wenn du den Rubin beim Halten des Tranks benutzt hast, solltest du nun die Qualität des Tranks sehen können, das hochgiftige Hyperborelium, das gesättigte Echolon und die unbeeinflussten, neutralen Substanzen. Frage nach Tränken, wenn du bereit bist, weiterzumachen."
Description[ENGLISH][9] = "If you've used the ruby while holding the potion you should now be able to see the potion's quality, highly toxic Hyperborelium and saturated Echolon, and the unaffected, neutral substances. Ask more about potions when you are ready to continue."
Description[GERMAN][10] =  "Fianna hat dir erklärt, wie du mit einer Feder und etwas Pergament ein Rezept schreiben kannst, wodurch der Brauprozess automatisiert werden kann. Wenn du bereit bist, weiterzumachen, sprich erneut mit ihr über Tränke."
Description[ENGLISH][10] = "Fianna explained to you how you can use a quill and some parchment to write a recipe, which allows you to automate the brewing process. When you are ready to continue, speak to her about potions again."
Description[GERMAN][11] =  "Fianna hat dir die Zutaten gegeben, um einen sehr einfachen Heiltrank herzustellen. Du kannst dies tun, indem du Wasser, die Sonnenkräuter viermal und dann das Amethystpulver in einen Kessel gibst, bevor du ihn abfüllst. Sie hat dir auch geraten, den gerade hergestellten Rubin-Trank zu trinken, bevor du braust; Alchemisten nutzen sowohl Essenz als auch Wahrnehmung, und während bessere Tränke existieren, sollte die gesteigerte Wahrnehmung die Qualität des Endprodukts verbessern."
Description[ENGLISH][11] = "Fianna has provided you the ingredients necessary to make a very basic health potion. You can do so by adding water, sun herb four times and then amethyst powder to a cauldron before bottling it. She also advised you to drink the ruby potion you just made when you are ready to brew; Alchemists use both essence and perception, so while better potions exist the boost to perception should help with the quality of the final product."
Description[GERMAN][12] =  "Du hast alles gelernt, was Fianna dir über Alchemie beibringen kann. Auf dieser Reise hast du gelernt, wie man Kräuter erntet, eine Basislösung braut, eine Basislösung in einen Trank verwandelt, Tränke untersucht und Rezepte schreibt."
Description[ENGLISH][12] = "You've completed all Fianna has to teach you about alchemy. Throughout this journey you learned how to harvest herbs, brew a stock, turn a stock into a potion, inspect potions and write recipes."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {661, 301, 0}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 12

function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return Start
end

function M.QuestTargets(user, status)

    if ((user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30) or user:getQuestProgress(691) < 5 then
        return {}
    else
        return {position(661, 301, 0)}
    end
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function M.QuestAvailability(user, status)
    if status == 0 and user:getQuestProgress(691) >= 5 and (user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) > 29 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
