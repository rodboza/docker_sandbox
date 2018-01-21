
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
	[BusinessEntityID] [int] NOT NULL,
	[PersonType] [nchar](2) NOT NULL,
	[NameStyle] bit NOT NULL CONSTRAINT [DF_Person_NameStyle]  DEFAULT ((0)),
	[Title] [nvarchar](8) NULL,
	[FirstName] varchar(50) NOT NULL,
	[MiddleName] varchar(50) NULL,
	[LastName] varchar(50) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NOT NULL CONSTRAINT [DF_Person_EmailPromotion]  DEFAULT ((0)),
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Person_ModifiedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO

insert into [dbo].[Person]
Select 313,'SC',0,'Mr.','James','T.','Aguilar','Jr.',1,'Jun 30 2013 12:00AM'
union Select 369,'SC',0,'Mr.','Thomas','B.','Armstrong','Jr.',0,'Jul  1 2011 12:00AM'
union Select 389,'SC',0,'Mr.','James','B.','Bailey','Jr.',0,'Aug 30 2012 12:00AM'
union Select 391,'SC',0,'Mr.','Douglas','A.','Baldwin','Jr.',0,'May 31 2011 12:00AM'
union Select 431,'SC',0,'Mr.','Christopher','R.','Beck','Jr.',0,'Jul 31 2012 12:00AM'
union Select 441,'SC',0,'Mr.','Stanley','A.','Alan','Jr.',0,'Jul 31 2013 12:00AM'
union Select 457,'SC',0,'Mr.','Richard','M.','Bentley','Jr.',0,'Mar 30 2013 12:00AM'
union Select 463,'SC',0,'Mr.','Alexander','J.','Berger','II',1,'Jul 31 2013 12:00AM'
union Select 465,'SC',0,'Mr.','John','M.','Berger','Jr.',0,'Jul  1 2011 12:00AM'
union Select 477,'SC',0,'Mr.','Steven','B.','Brown','IV',0,'Aug  1 2011 12:00AM'

go

