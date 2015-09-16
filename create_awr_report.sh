#!/bin/bash

# your linux user
user=nikita
# path to oracle client
ora_path=/home/$user/sqlplus/instantclient
# path to awr reports; !this directory should exist!
awr_path=/home/$user/awr_reports

# oracle settings
ora_user=admin
ora_pass=admin
ora_sid=db.localhost.com:1520/DBG111

##################
# Body of script
##################

export ORACLE_HOME=$ora_path
export LD_LIBRARY_PATH=$ora_path
export PATH=/bin:/usr/bin:/usr/local/bin:/home/$user/bin:$ora_path:$awr_path:
export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1

echo ORACLE_HOME=$ORACLE_HOME
echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH
echo PATH=$PATH
echo NLS_LANG=$NLS_LANG

cd $awr_path

echo 'change directory: ' $awr_path

##
# Your user should have next grants or be sysdba:
#
# GRANT SELECT ON SYS.V_$DATABASE TO YOUR_USER;
# GRANT SELECT ON SYS.V_$INSTANCE TO YOUR_USER;
# GRANT EXECUTE ON SYS.DBMS_WORKLOAD_REPOSITORY TO YOUR_USER;
# GRANT SELECT ON SYS.DBA_HIST_DATABASE_INSTANCE TO YOUR_USER;
# GRANT SELECT ON SYS.DBA_HIST_SNAPSHOT TO YOUR_USER;
# GRANT ADVISOR TO YOUR_USER;
##
     $ORACLE_HOME/sqlplus $ora_user/$ora_pass@//$ora_sid as sysdba @awr_report_$1.sql
echo $ORACLE_HOME/sqlplus $ora_user/$ora_pass@//$ora_sid as sysdba @awr_report_$1.sql

