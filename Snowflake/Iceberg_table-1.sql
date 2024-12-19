use role sysadmin;
/*
STEP - 1: Create an ICEBEREG table  with CAtalog in SNOWFLAKE but data is being stored in ADLS Gen2 With use of
External volume
*/
-- IB_EMPLOYEE table
create or replace iceberg table test_analytics.dw_stage.IB_EMPLOYEE
(
emp_id int,
emp_name string,
emp_salary decimal(5,2)
)
external_volume = 'azure_external_volume' 
catalog = 'SNOWFLAKE'
BASE_LOCATION ='IB_EMPLOYEE';-- imp to give the base location as it will create new subfolder for respective tables

-- IB_DEPT table
create or replace iceberg table test_analytics.dw_stage.IB_DEPT(
dept_id int,
dept_name string
)
external_volume = 'azure_external_volume'
catalog = 'SNOWFLAKE'
BASE_LOCATION ='IB_DEPT'; -- imp to give the base location as it will create new subfolder for respective tables

/*
STEP - 2 : Insert dummy data for test in ICEBERG table
*/
-- IB_EMPLOYEE table
insert into test_analytics.dw_stage.IB_EMPLOYEE
select 1 as emp_id,'ABHI'AS EMP_NAME,999.00 AS SALARY FROM DUAL
UNION ALL 
select 2 as emp_id,'AKSHU'AS EMP_NAME,500.00 AS SALARY FROM DUAL
UNION ALL 
select 3 as emp_id,'MAYUR'AS EMP_NAME,600.00 AS SALARY FROM DUAL
UNION ALL 
select 4 as emp_id,'AARTI'AS EMP_NAME,700.00 AS SALARY FROM DUAL
UNION ALL 
select 5 as emp_id,'OMYA'AS EMP_NAME,800.00 AS SALARY FROM DUAL
UNION ALL
select 6 as emp_id,'BONDE'AS EMP_NAME,900.00 AS SALARY FROM DUAL;

-- IB_DEPT table
insert into test_analytics.dw_stage.IB_DEPT
select 101 as dept_id, 'IT' as dept_name from dual
union all
select 102 as dept_id, 'HR' as dept_name from dual
union all
select 103 as dept_id, 'FINANCE' as dept_name from dual;

