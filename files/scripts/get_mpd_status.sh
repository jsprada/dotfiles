#!/bin/sh
#status=$(mpc status | grep -Po -m 1 'playing|paused')
#echo $status

filter() {
	grep -Po -m 1 'playing|paused'
}

case $BLOCK_BUTTON in
	1) mpc toggle | filter ;;
	3) mpc next | filter ;;
	*) mpc status | filter ;;
esac

