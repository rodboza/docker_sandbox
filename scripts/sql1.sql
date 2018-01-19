--script_1.sql
ALTER EVENT SESSION  AlwaysOn_health ON SERVER WITH (STARTUP_STATE=ON);
GO

CREATE LOGIN dbm_login WITH PASSWORD = 'P@ssw0rd';
CREATE USER dbm_user FOR LOGIN dbm_login;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'P@ssw0rd';
CREATE CERTIFICATE dbm_certificate WITH SUBJECT = 'dbm';
BACKUP CERTIFICATE dbm_certificate
   TO FILE = '/var/opt/mssql/data/dbm_certificate.cer'
   WITH PRIVATE KEY (
           FILE = '/var/opt/mssql/data/dbm_certificate.pvk',
           ENCRYPTION BY PASSWORD = 'P@ssw0rd'
      );
GO

--script_2.sql
CREATE ENDPOINT [Hadr_endpoint]
    AS TCP (LISTENER_IP = (0.0.0.0), LISTENER_PORT = 5022)
    FOR DATA_MIRRORING (
        ROLE = ALL,
        AUTHENTICATION = CERTIFICATE dbm_certificate,
        ENCRYPTION = REQUIRED ALGORITHM AES
     );
ALTER ENDPOINT [Hadr_endpoint] STATE = STARTED;
GRANT CONNECT ON ENDPOINT::[Hadr_endpoint] TO [dbm_login];
GO


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


--script4.sql
ALTER EVENT SESSION  AlwaysOn_health ON SERVER WITH (STARTUP_STATE=ON);
GO

CREATE LOGIN dbm_login WITH PASSWORD = 'P@ssw0rd';
CREATE USER dbm_user FOR LOGIN dbm_login;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'P@ssw0rd';
GO

CREATE CERTIFICATE dbm_certificate
    AUTHORIZATION dbm_user
    FROM FILE = '/var/opt/mssql/data/dbm_certificate.cer'
    WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/data/dbm_certificate.pvk',
        DECRYPTION BY PASSWORD = 'P@ssw0rd'
    );
GO
CREATE ENDPOINT [Hadr_endpoint]
   AS TCP (LISTENER_IP = (0.0.0.0), LISTENER_PORT = 5022)
   FOR DATA_MIRRORING (
        ROLE = ALL,
        AUTHENTICATION = CERTIFICATE dbm_certificate,
        ENCRYPTION = REQUIRED ALGORITHM AES
   );
GO
ALTER ENDPOINT [Hadr_endpoint] STATE = STARTED;
GRANT CONNECT ON ENDPOINT::[Hadr_endpoint] TO [dbm_login];
GO

--copy.sh
_PathContainer = $1
cp /var/opt/mssql/data/dbm_certificate.* $(_PathContainer)/cert


