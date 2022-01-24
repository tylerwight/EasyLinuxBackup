#!/bin/sh
#This script will add or remove a specific cronjob for a user without making duplicates. In this case it is used to run a backup script
#To use this cript you need to set the 3 variables below
#fullpath: the path to the script you would like to run
#cronjob: the cronjob you would like to run. Current example shows once every 60 minutes. Use crontab.guru if you need help
#user: the user who you want to add to their crontab. this script will add the cronjob to the crontab of the specific user
#=============================
fullpath="/home/user/scripts/backup.sh"
cronjob="*/60 * * * * ${fullpath}"
user=user
#===========================



echo "Cronjob ${cronjob} to be added to the crontab for user ${user}"
echo "\n"
echo "Current Crontab:"
sudo su -c "crontab -l" -s /bin/sh $user
echo "\n"



read -p "Do you want to [A]dd or [R]emove this cronjob? `echo '\n>'`" ar
case $ar in
	[Aa]* )
		#add line to crontab with no duplication
		echo "adding job to crontab, ensureing no duplicates"
		sudo su -c "(crontab -l| grep -v -F '$cronjob'; echo '$cronjob') | crontab -" -s /bin/sh $user
		;;
	[Rr]* )
		#Remove line from crontab
		echo "removing job from crontab"
		sudo su -c "(crontab -l| grep -v -F '$cronjob') | crontab -" -s /bin/sh $user
		;;
	* ) echo "not recognized, quitting";;
esac


echo "\n"
echo "Crontab after script:"
sudo su -c "crontab -l" -s /bin/sh $user
echo "\n"
