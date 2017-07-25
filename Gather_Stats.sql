declare
cursor c is 
SELECT table_name from DBA_TAB_STATISTICS where owner = '&1'
AND STALE_STATS <> 'NO';

begin

for r in c
loop
    dbms_output.put_line('Table - '||r.table_name);
    DBMS_STATS.gather_table_stats('&1', r.table_name, cascade => TRUE);
end loop;
end;
/