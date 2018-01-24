
CREATE DATABASE [db1];
ALTER DATABASE [db1] SET RECOVERY FULL;
BACKUP DATABASE [db1]
   TO DISK = N'/var/opt/mssql/data/db1.bak';

GO
ALTER AVAILABILITY GROUP [ag1] ADD DATABASE [db1];
GO


USE [db1]
GO

/****** Object:  Table [Person].[Person]    Script Date: 01/21/2018 10:58:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Person](
	[Id] [int] ,
	[FirstName] varchar(50),
	[MiddleName] varchar(50),
	[LastName] varchar(50)
) 

GO

insert into [dbo].[Person]
      Select 313,'James','T.','Aguilar'
union Select 369,'Thomas','B.','Armstrong'
union Select 389,'James','B.','Bailey'
union Select 391,'Douglas','A.','Baldwin'
union Select 431,'Christopher','R.','Beck'
union Select 441,'Stanley','A.','Alan'
union Select 457,'Richard','M.','Bentley'
union Select 463,'Alexander','J.','Berger'
union Select 465,'John','M.','Berger'
union Select 477,'Steven','B.','Brown'

go

