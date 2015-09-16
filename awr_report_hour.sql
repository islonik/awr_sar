set lines 8000 pages 50000 heading off termout off feedback off trimspool on verify off

column cur_date new_value cur_date noprint
column cur_dated new_value cur_dated noprint
column dbid new_value dbid noprint
column snap_id1 new_value snap_id1 noprint
column snap_id2 new_value snap_id2 noprint

select 
	dbid, 
	trim (max (snap_id) keep (dense_rank first order by end_interval_time)) snap_id1,
    trim (max (snap_id) keep (dense_rank last  order by end_interval_time)) snap_id2,
	to_char (trunc (sysdate, 'hh24') - 1/24, 'YYYYMMDDHH24') cur_date,
	to_char (trunc (sysdate, 'hh24') - 1/24, 'YYYYMMDD')     cur_dated
from dba_hist_snapshot
where trunc (sysdate, 'hh24')        between begin_interval_time and end_interval_time
   or trunc (sysdate, 'hh24') - 1/24 between begin_interval_time and end_interval_time
group by dbid;

host /bin/mkdir -p &cur_dated.

spool &cur_dated./awr_hour_&cur_date._&snap_id1._&snap_id2..html
select output from table(dbms_workload_repository.awr_report_html(&&dbid, 1, &&snap_id1, &&snap_id2, 0));
spool off

exit
