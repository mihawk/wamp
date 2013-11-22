#!/usr/bin/env sh
#
# Chicago Boss Init System
#
# @author: Jose Luis Gordo Romero <jgordor@gmail.com>
#
# -------------------------------------------------------------------
# The shell commands are automatically generated by the boss rebar 
# plugin/driver, all configuration params and paths are in boss.config
# -------------------------------------------------------------------

cd `dirname $0`

case "${1:-''}" in
  'start')
        # Start Boss in production mode
        echo "starting boss in production mode..."
        START=$(./rebar boss c=start_cmd|grep -v "==>")
        $START
        ;;
        
  'start-dev')
        # Start Boss in development mode
        START_DEV=$(./rebar boss c=start_dev_cmd|grep -v "==>")
        $START_DEV
        ;;

  'stop')
        # Stop Boss daemon
        echo "stopping boss..."
        STOP=$(./rebar boss c=stop_cmd|grep -v "==>")
        # After hours of shell quoting problems with the erl command,
        # eval with the command quoted works!!!
        eval "$STOP"
        ;;

  'reload')
        # Boss hot code reload <-- only the actual node, not the entire cluster
        echo "Hot code reload, (WARN: Only this node)"
        RELOAD=$(./rebar boss c=reload_cmd|grep -v "==>")
        eval "$RELOAD"
        ;;

  'restart')
        # Boss complete restart
        echo "Restarting (stop-start) boss..."
        $0 stop
        $0 start
        ;;
  *)
        echo "Chicago Boss Boot System"
        echo "Usage: $SELF start|start-dev|stop|reload|restart"
        exit 1
        ;;
esac
