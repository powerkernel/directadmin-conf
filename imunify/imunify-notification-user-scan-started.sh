#!/bin/sh
now=`date +"%Y-%m-%d %T"`
event="User Scan Started @ $now"
mail -s "$event" harry@powerkernel.com <<< "$event"