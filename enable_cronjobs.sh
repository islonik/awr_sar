#!/bin/bash

svt_file=svt_crontab

echo "" >> $svt_file
# required for sar reports
echo "0,10,20,30,40,50 * * * * /usr/lib/sa/sa1" >> $svt_file
echo "0                0 * * * /usr/lib/sa/sa2 -A" >> $svt_file
echo "" >> $svt_file
echo "50 23 * * * /u02/netcracker/toms/u214_d72_6815_awr/run_sar.sh" >> $svt_file
echo "10 0  * * * /u02/netcracker/toms/u214_d72_6815_awr/create_awr_report.sh day  > /u02/netcracker/toms/u214_d72_6815_awr/report_day.log" >> $svt_file
echo "15 *  * * * /u02/netcracker/toms/u214_d72_6815_awr/create_awr_report.sh hour > /u02/netcracker/toms/u214_d72_6815_awr/report_hour.log" >> $svt_file
echo "" >> $svt_file

crontab $svt_file
rm $svt_file
