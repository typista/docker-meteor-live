#!/bin/sh
#BIN=/usr/local/bin/meteor
BIN=meteor
HTML=/var/www/`hostname`
APP=$HTML/app
IS_EXEC=`cat $MONITOR_PS_LIST | grep -v 'null' | grep meteor`
if [ -f $BIN -a "$IS_EXEC" = "" ];then
    cd $APP
    $BIN -p0.0.0.0:3000
fi

