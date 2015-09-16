#!/bin/bash

svt_file=svt_crontab_previous

echo "" >> $svt_file

crontab $svt_file
rm $svt_file 