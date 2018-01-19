

--script_3.sql
CREATE AVAILABILITY GROUP [ag1]
WITH (DB_FAILOVER = ON, CLUSTER_TYPE = EXTERNAL)
FOR REPLICA ON
        N'sqlnode1'
        WITH (
            ENDPOINT_URL = N'tcp://sqlnode1:5022',
            AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
            FAILOVER_MODE = EXTERNAL,
            SEEDING_MODE = AUTOMATIC
        ),
        N'sqlnode2'
        WITH (
           ENDPOINT_URL = N'tcp://sqlnode2:5022',
           AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
           FAILOVER_MODE = EXTERNAL,
           SEEDING_MODE = AUTOMATIC
        ),
        N'sqlnode3'
        WITH(
           ENDPOINT_URL = N'tcp://sqlnode3:5022',
           AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
           FAILOVER_MODE = EXTERNAL,
           SEEDING_MODE = AUTOMATIC
        );
GO

ALTER AVAILABILITY GROUP [ag1] GRANT CREATE ANY DATABASE;
GO

CREATE DATABASE [db1];
ALTER DATABASE [db1] SET RECOVERY FULL;
BACKUP DATABASE [db1]
   TO DISK = N'/var/opt/mssql/data/db1.bak';

GO
ALTER AVAILABILITY GROUP [ag1] ADD DATABASE [db1];
GO

