use role accountadmin;
create database test_analytics;
create schema test_analytics.dw_stage;
/*
Here we are creating below:
 --> Snowflake Managed Iceberg table having external volume in ADLS Gen2.
 --> MS fabric can access this ICEBERG table using SHORTCUTS in NON SCHEMA ENABLED LAKEHOUSE and u cannot have it in DATA-WARHOUSE ( as it SCHEMA enabled).
*/

/*
STEP 1 : create a External Volume  with Azure ADLS GEN2 as storage provider(in my scenario) which is an account level object.
*/
CREATE or replace EXTERNAL VOLUME azure_external_volume
  STORAGE_LOCATIONS =
    (
      (
        NAME = 'azure-pune'
        STORAGE_PROVIDER = 'AZURE'
        STORAGE_BASE_URL = 'azure://abhiiceberg.blob.core.windows.net/icebergtables/'
        AZURE_TENANT_ID = '<azure_tenant_id>'
      )
    );

/*
STEP 2: Get the AZURE Consent URL from below query and provide consent from AZURE ADMIN for creation of Service Principle
*/
desc external volume AZURE_EXTERNAL_VOLUME;

/*
STEP 3: Grant a usage access on integration object to sysadmin role for creating scehma level object
*/
grant usage on external volume azure_external_volume to role sysadmin;
