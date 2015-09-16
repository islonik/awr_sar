#!/bin/bash

# your linux user
user=nikita
# path to awr reports; !this directory should exist!
awr_path="/home/$user/awr_reports"

##################
# Body of script
##################

echo $awr_path

export PATH=/bin:/usr/bin:/usr/local/bin:/home/$user/bin:

echo PATH=$PATH

mkdir -p $awr_path/sar_reports
cd $awr_path/sar_reports
echo 'change directory: ' $awr_path/sar_reports

# this is format is useful for kSar app. Link - http://sourceforge.net/projects/ksar/files/beta/
# Using kSar can be useful for you if you want to see graphs.
LC_ALL=C /usr/bin/sar -A > sar_$(date +"%F")
echo 'Command SAR -A was executed!'
