# Easy Linux Backup
This is quick and easy way to setup automatic backups on a Linux machine via a cronjob. It is easy to turn off and on backups quickly.  By default it allows you to choose a folder you'd like to backup, where you'd like to back it up and enables it to auto backup via cronjob, but can be easily edited to backup whatever you'd like.

## how to use
Clone this repo and open it to find two scripts:

backup.sh

togglecronjob.sh


1. Edit script backup.sh, set the 3 variables at the top to choose what and where to backup. This is typically folders but can be specific files too
2. copy backup.sh and put it wherever you would like to keep it permanently
3. edit the script togglecronjob.sh and edit the variables at the top. Most important of which is to change the fullpath variable to point to where you put your backup.sh script
4. Run the togglecronjob.sh script and if all looks good press A for add. This will add the cronjob to automate this backup. You can run it again and choose "remove" to turn off auto backups.
