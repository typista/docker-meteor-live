#!/bin/bash
HOSTNAME=`hostname`
FQDN=`echo $HOSTNAME | sed -r "s/_/\./g"`
ROOT=/var/www/$HOSTNAME
HTML=$ROOT
if [ ! -e $HTML ]; then
	mkdir -p $HTML
	cd $HTML
fi

CRON_SHELL=/root/export/start.sh
if [ ! -f $CRON_SHELL ]; then
	wget $URL_GIT/start.sh -O $CRON_SHELL
fi
if [ ! -x $CRON_SHELL ]; then
	chmod +x $CRON_SHELL
fi
MONITOR_METEOR=/root/export/monitor_meteor.sh
if [ ! -f $MONITOR_METEOR ]; then
	wget $URL_GIT/monitor_meteor.sh -O $MONITOR_METEOR
fi
ISDEFUALT=`grep $MONITOR_METEOR $CRON_SHELL | wc -l`
if [ $ISDEFUALT -eq 0 ]; then
	echo $MONITOR_METEOR >> $CRON_SHELL
fi
if [ ! -x $MONITOR_METEOR ]; then
	chmod +x $MONITOR_METEOR
fi
CRON_TAB=/root/export/crontab.txt
if [ ! -f $CRON_TAB ];then
	wget $URL_GIT/crontab.txt -O $CRON_TAB
fi

crontab $CRON_TAB
