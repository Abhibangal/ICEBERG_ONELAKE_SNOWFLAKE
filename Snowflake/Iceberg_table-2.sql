use role sysadmin;


/*
STEP - 1: Create an ICEBEREG table  with CAtalog in SNOWFLAKE but data is being stored in MS FABRIC ONELAKE  With use of
External volume
*/
-- IB_location table
create or replace iceberg table test_analytics.dw_stage.IB_location
(
loc_id int,
state string,
country string
)
external_volume = 'onelake_external_volume'
catalog = 'SNOWFLAKE'
BASE_LOCATION ='Files/IB_location/';-- imp to give the base location as it will create new subfolder for respective tables


/*
STEP - 2 : Insert dummy data for test in ICEBERG table
*/
-- IB_location
insert into test_analytics.dw_stage.IB_location
select 101 as loc_id,'maharashtra' as state, 'INDIA' as country from dual
union all 
select 102 as loc_id,'hyderabad' as state, 'INDIA' as country from dual
union all 
select 103 as loc_id,'Karnataka' as state, 'INDIA' as country from dual
union all 
select 104 as loc_id,'Tamil Nadu' as state, 'INDIA' as country from dual
union all 
select 105 as loc_id,'Kashmir' as state, 'INDIA' as country from dual
union all 
select 106 as loc_id,'Assam' as state, 'INDIA' as country from dual;