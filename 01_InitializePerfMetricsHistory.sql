-- connect to <DBNAME>;

CREATE BUFFERPOOL DB2MON_32K_BP PAGESIZE 32K;

CREATE TABLESPACE DB2MON
  PAGESIZE 32K 
  MANAGED BY AUTOMATIC STORAGE USING STOGROUP SGEVMO1 
  BUFFERPOOL DB2MON_32K_BP ;
  
CREATE TABLESPACE DB2MON_LOB 
  PAGESIZE 32K 
  MANAGED BY AUTOMATIC STORAGE USING STOGROUP SGEVMO1 
  BUFFERPOOL DB2MON_32K_BP
  FILE SYSTEM CACHING;


CREATE VARIABLE DB2MON.HIS_SNAPSHOT_TIMESTAMP TIMESTAMP;

COMMIT;



set DB2MON.HIS_SNAPSHOT_TIMESTAMP = CURRENT TIMESTAMP;


create table DB2MON.HIS_MON_BP_UTILIZATION
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_BP_UTILIZATION t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_BP_UTILIZATION
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_BP_UTILIZATION t;


create table DB2MON.HIS_MON_CONNECTION_SUMMARY
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_CONNECTION_SUMMARY  t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_CONNECTION_SUMMARY
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_CONNECTION_SUMMARY  t;


create table DB2MON.HIS_MON_DB_SUMMARY
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_DB_SUMMARY t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_DB_SUMMARY
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_DB_SUMMARY t;


create table DB2MON.HIS_MON_GET_BUFFERPOOL
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_BUFFERPOOL(NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_BUFFERPOOL
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_BUFFERPOOL(NULL, -2)) t;


create table DB2MON.HIS_MON_GET_CONNECTION
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_CONNECTION(NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_CONNECTION
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_CONNECTION(NULL, -2)) t;


create table DB2MON.HIS_MON_GET_CONNECTION_DETAILS
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_CONNECTION_DETAILS(NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_CONNECTION_DETAILS
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_CONNECTION_DETAILS(NULL, -2)) t;


create table DB2MON.HIS_MON_GET_CONTAINER
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_CONTAINER(NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_CONTAINER
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_CONTAINER(NULL, -2)) t;


create table DB2MON.HIS_MON_GET_INDEX
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_INDEX(NULL, NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_INDEX
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_INDEX(NULL, NULL, -2)) t;


create table DB2MON.HIS_MON_GET_MEMORY_POOL
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_MEMORY_POOL(NULL, CURRENT_SERVER, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_MEMORY_POOL
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_MEMORY_POOL(NULL, CURRENT_SERVER, -2)) t;


create table DB2MON.HIS_MON_GET_MEMORY_SET
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_MEMORY_SET(NULL, CURRENT_SERVER, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_MEMORY_SET
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_MEMORY_SET(NULL, CURRENT_SERVER, -2)) t;


create table DB2MON.HIS_MON_GET_PKG_CACHE_STMT
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_PKG_CACHE_STMT(NULL,NULL,NULL,-2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_PKG_CACHE_STMT
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_PKG_CACHE_STMT(NULL,NULL,NULL,-2)) t;


create table DB2MON.HIS_MON_GET_PKG_CACHE_STMT_DETAILS
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_PKG_CACHE_STMT_DETAILS(NULL,NULL,NULL,-2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_PKG_CACHE_STMT_DETAILS
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_PKG_CACHE_STMT_DETAILS(NULL,NULL,NULL,-2)) t;


create table DB2MON.HIS_MON_GET_TABLE
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_TABLE(NULL, NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_TABLE
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_TABLE(NULL, NULL, -2)) t;


create table DB2MON.HIS_MON_GET_TABLESPACE
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_TABLESPACE(NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_TABLESPACE
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_TABLESPACE(NULL, -2)) t;


create table DB2MON.HIS_MON_GET_WORKLOAD
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_WORKLOAD(NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_WORKLOAD
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_WORKLOAD(NULL, -2)) t;


create table DB2MON.HIS_MON_GET_WORKLOAD_DETAILS
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_WORKLOAD_DETAILS(NULL, -2)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_GET_WORKLOAD_DETAILS
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(MON_GET_WORKLOAD_DETAILS(NULL, -2)) t;


create table DB2MON.HIS_MON_PKG_CACHE_SUMMARY
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_PKG_CACHE_SUMMARY t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_PKG_CACHE_SUMMARY
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_PKG_CACHE_SUMMARY t;


create table DB2MON.HIS_MON_TBSP_UTILIZATION
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_TBSP_UTILIZATION  t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_TBSP_UTILIZATION
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_TBSP_UTILIZATION  t;


create table DB2MON.HIS_MON_WORKLOAD_SUMMARY
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_WORKLOAD_SUMMARY t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_MON_WORKLOAD_SUMMARY
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.MON_WORKLOAD_SUMMARY  t;


create table DB2MON.HIS_LOG_UTILIZATION
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.LOG_UTILIZATION t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_LOG_UTILIZATION
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.LOG_UTILIZATION t;


create table DB2MON.HIS_SNAPDB
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPDB t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_SNAPDB
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPDB t;


create table DB2MON.HIS_SNAPTAB_REORG
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPTAB_REORG t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_SNAPTAB_REORG
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPTAB_REORG t;


create table DB2MON.HIS_SNAPAPPL
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPAPPL  t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_SNAPAPPL
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPAPPL  t;


create table DB2MON.HIS_SNAPBP
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPBP  t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_SNAPBP
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.SNAPBP  t;


create table DB2MON.HIS_DB_HISTORY
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.DB_HISTORY  t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_DB_HISTORY
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.DB_HISTORY  t;


create table DB2MON.HIS_DBPATHS
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.DBPATHS  t) WITH NO DATA
  IN DB2MON8K
  LONG IN DB2MON8K_LOB;

INSERT INTO DB2MON.HIS_DBPATHS
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.DBPATHS  t;


create table DB2MON.HIS_ADMIN_GET_DBP_MEM_USAGE
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(ADMIN_GET_DBP_MEM_USAGE(NULL)) t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_ADMIN_GET_DBP_MEM_USAGE
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from TABLE(ADMIN_GET_DBP_MEM_USAGE(NULL)) t;


create table DB2MON.HIS_ADMINTABINFO
  AS (select CURRENT TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.ADMINTABINFO t) WITH NO DATA
  IN DB2MON
  LONG IN DB2MON_LOB;

INSERT INTO DB2MON.HIS_ADMINTABINFO
  select DB2MON.HIS_SNAPSHOT_TIMESTAMP as SNAPSHOT_TIME, t.* from SYSIBMADM.ADMINTABINFO t;
