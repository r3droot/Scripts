#!/bin/bash
#this script is made for check server databases size and report 
#script will check databses resides in /var/lib/mysql
#then check cpanel accounts and go to /backup ad check them also
    echo "avilable databses in mysql are:-"
for i in $(mysql -e "show databases" |grep _  |grep -v information_schema) ; do  
  du -sh /var/lib/mysql/$i
done
  echo "databses available in users homedir are :-"

for i in $(cut -f 1 -d  :  /etc/domainusers) ;do 
    du -sh /backup/cpbackup/daily/$i/mysql/* |grep .sql$ |grep -v horde |grep -v roundcube
done


echo "Please go to  /usr/local/cpanel/logs/cpbackup and check the rest of all backup operations"
