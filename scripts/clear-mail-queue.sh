#!/bin/sh
/usr/sbin/exim -bp | awk '/^ *[0-9]+[mhd]/{print "/usr/sbin/exim -Mrm " $3}' | sh
