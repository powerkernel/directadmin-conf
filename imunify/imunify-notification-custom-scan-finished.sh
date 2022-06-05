#!/bin/sh
now=`date +"%Y-%m-%d %T"`
event="Custom Scan Finished @ $now"
mail -s "$event" harry@powerkernel.com <<< "$event"