#!/bin/sh
now=`date +"%Y-%m-%d %T"`
event="Custom Scan Started @ $now"
mail -s "$event" harry@powerkernel.com <<< "$event"