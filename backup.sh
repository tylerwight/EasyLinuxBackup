#!/bin/sh
#This script will backup a folder from one location, to another and delete the oldest backups after a threshhold is met
#To use this script set these 3 variables below. This backups script does not run on it's own, you can use the togglecronjob.sh script to enable and disable this script to be ran via cronjob
#backupfrom is the place you'd like to backup
#backup to is where you want to put the backup
#numkeep is how many backups to keep before it starts deleting the oldest one
#============================
backupfrom=/home/user/.local/share/Terraria/Worlds
backupto=/mnt/nfs/gamebackups/terraria/bak
numkeep=10
#============================



numexist=`ls ${backupto}|wc -l`
echo "found $numexist existing backups"
echo "Set to keep $numkeep backups"

echo "taking new backup "
cp -r ${backupfrom} ${backupto}/Worlds$(date +%Y_%m_%d__%H_%M)


sleep 1
i=$(ls -1tr ${backupto} | head -n 1 )

if [ $numexist -gt $numkeep ]
then
	#do if number of backups exceeds threshold
	rm -rf ${backupto}/$i
	echo "Deleting $i"

else
	#do if number of backups that exists is behlow threshold
	sleep 1
	echo "Existing backups is less than keep, not removing any data"
fi

numexist=`ls ${backupto}|wc -l`
echo "Now there are $numexist existing backups"
