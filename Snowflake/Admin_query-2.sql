use role accountadmin;
/*
Here we are creating below:
 --> Snowflake Managed Iceberg table having external volume in MS FABRIC ONE LAKE.
 --> MS fabric can access this ICEBERG table using Files in NON-SCHEMA ENABLED LAKEHOUSE But you cannot have it in DATAWARHOUSE ( as it SCHEMA enabled).
*/


/*
STEP 1 : create a External Volume  with Fabric OneLake as storage provider(in my scenario) which is an account level object.
*/
CREATE or replace EXTERNAL VOLUME onelake_external_volume
  STORAGE_LOCATIONS =
    (
      (
        NAME = 'onelake_external_volume'
        STORAGE_PROVIDER = 'AZURE'
        STORAGE_BASE_URL = 'azure://onelake.dfs.fabric.microsoft.com/<WorkspaceName>/<LakehouseName>.Lakehouse/Files/' --> Get this info from  Lakehouse Files --> Properties --> URL (replace https wit azure)
        AZURE_TENANT_ID = '<azure_tenant_id>'
      )
    );

/*
STEP 2: Get the AZURE Consent URL from below query and provide consent from AZURE ADMIN for creation of Service Principle
*/
desc external volume onelake_external_volume;

/*
STEP 3: Grant a usage access on integration object to sysadmin role for creating scehma level objects
*/
grant usage on external volume onelake_external_volume to role sysadmin;