rsync -r --delete testserver/alchemy/ illarionserver/alchemy/
rsync -r --delete testserver/base/ illarionserver/base/
rsync -r --delete testserver/content/ illarionserver/content/
rsync -r --delete testserver/gm/ illarionserver/gm/
rsync -r --delete testserver/handler/ illarionserver/handler/
rsync -r --delete testserver/item/ illarionserver/item/
rsync -r --delete testserver/lte/ illarionserver/lte/
rsync -r --delete testserver/monster/ illarionserver/monster/
rsync -r --delete testserver/npc/ illarionserver/npc/
rsync -r --delete testserver/quest/ illarionserver/quest/
rsync -r --delete --exclude "testquest.quest" testserver/questsystem/ illarionserver/questsystem/
rsync -r --delete testserver/scheduled/ illarionserver/scheduled/
rsync -r --delete testserver/server/ illarionserver/server/
rsync -r --delete testserver/tile/ illarionserver/tile/
rsync -r  --deletetestserver/triggerfield/ illarionserver/triggerfield/
