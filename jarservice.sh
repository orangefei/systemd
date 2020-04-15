#!/bin/bash
CU_PID=/data/app/jar.pid
export JAVA_HOME=/usr/local/jdk1.8.0_152
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export  PATH=${JAVA_HOME}/bin:$PATH


start()
{
echo -n "start java"
nohup java -Xms1024m -Xmx1024m -XX:-UseGCOverheadLimit -jar /data/www/lib/edp-cls.jar >log.out &
new_agent_pid=$!
echo "$new_agent_pid" > $CU_PID
}
stop()
{
if [ -f /data/app/jar.pid ];then
SPID=`cat /data/app/jar.pid`
if [ "$SPID" != "" ];then
kill -9 $SPID
echo >$CU_PID
echo "stop sucess"
fi
fi
}
CheckProcessStata()
{
CPS_PID=$1
if [ "$CPS_PID" != "" ] ;then
CPS_PIDLIST=`ps -ef|grep $CPS_PID|grep -v grep|awk -F" " '{print $2}'`
else
CPS_PIDLIST=`ps -ef|grep "$CPS_PNAME"|grep -v grep|awk -F" " '{print $2}'`
fi

for CPS_i in `echo $CPS_PIDLIST`
do
if [ "$CPS_PID" = "" ] ;then
CPS_i1="$CPS_PID"
else
CPS_i1="$CPS_i"
fi

if [ "$CPS_i1" = "$CPS_PID" ] ;then
#kill -s 0 $CPS_i
kill -0 $CPS_i >/dev/null 2>&1
if [ $? != 0 ] ;then
echo "[`date`] MC-10500: Process $i have Dead"
kill -9 $CPS_i >/dev/null 2>&1

return 1
else
#echo "[`date`] MC-10501: Process is alive"
return 0
fi
fi
done
echo "[`date`] MC-10502: Process $CPS_i is not exists"
return 1
}

status()
{
SPID=`cat /data/app/jar.pid`
CheckProcessStata $SPID >/dev/null
if [ $? != 0 ];then
echo "unixdialup:{$SPID} Stopped ...."
else
echo "unixdialup:{$SPID} Running Normal."
fi

}

restart()
{
echo "stoping ... "
stop
echo "staring ..."
start
}

case "$1" in
start)
start
;;
stop)
stop
;;
status)
status
;;
restart)
restart
;;
*)
echo $"Usage: $0 {start|stop|restart}"
RETVAL=1
esac
exit $RETVAL 
