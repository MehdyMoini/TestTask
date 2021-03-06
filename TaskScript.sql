USE [master]
GO
/****** Object:  Database [TestTask]    Script Date: 10/15/2021 8:26:10 PM ******/
CREATE DATABASE [TestTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestTask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestTask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestTask] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestTask] SET RECOVERY FULL 
GO
ALTER DATABASE [TestTask] SET  MULTI_USER 
GO
ALTER DATABASE [TestTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestTask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestTask] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestTask', N'ON'
GO
ALTER DATABASE [TestTask] SET QUERY_STORE = OFF
GO
USE [TestTask]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [TestTask]
GO
/****** Object:  Table [dbo].[tbl_temperatureLog]    Script Date: 10/15/2021 8:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_temperatureLog](
	[city] [nvarchar](100) NULL,
	[temp] [int] NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 10/15/2021 8:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[lname] [nvarchar](100) NULL,
	[fname] [nvarchar](100) NULL,
	[reg_date] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_temperatureLog] ([city], [temp], [Date]) VALUES (N'London', 14, CAST(N'2021-10-15T19:12:18.713' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_users] ON 
GO
INSERT [dbo].[tbl_users] ([userid], [username], [password], [lname], [fname], [reg_date]) VALUES (4, N'Mehdy', N'5FA285E1BEBE0A6623E33AFC04A1FBD5', N'Moini', N'Admin', CAST(N'2021-10-15T14:14:00.970' AS DateTime))
GO
INSERT [dbo].[tbl_users] ([userid], [username], [password], [lname], [fname], [reg_date]) VALUES (5, N'Mehdy2', N'5FA285E1BEBE0A6623E33AFC04A1FBD5', N'Moini2', N'Admin', CAST(N'2021-10-15T15:11:49.647' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_users] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_loginUser]    Script Date: 10/15/2021 8:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- =============================================
  -- Author:    FreeCode Spot
  -- Create date: 
  -- Description:    
  -- =============================================
  CREATE PROCEDURE [dbo].[sp_loginUser]
      @username Nvarchar(50),
      @password nvarchar(200),
      @retVal int OUTPUT
      AS
  BEGIN
      SET NOCOUNT ON;
         Select 
                userid,
                username,
                fname,
                lname,
                reg_date 
                FROM tbl_users 
                where username = @username and 
               [Password] = CONVERT(VARCHAR(32), HashBytes('MD5', @password), 2)
         IF(@@ROWCOUNT > 0)
         BEGIN
          SET @retVal = 200
         END
         ELSE
         BEGIN
           SET @retVal = 500
         END
  END

GO
/****** Object:  StoredProcedure [dbo].[sp_logTemperature]    Script Date: 10/15/2021 8:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- =============================================
  -- Author:        FeeCode Spot
  -- Create date: 
  -- Description:    
  -- =============================================
  Create PROCEDURE [dbo].[sp_logTemperature]
      @city Nvarchar(50),
      @temp int,
	  @date datetime
  AS
  BEGIN
      SET NOCOUNT ON;
        INSERT INTO tbl_temperatureLog(
                              city,
                              temp,
							  [Date]
                              ) 
                              VALUES(
                              @city,
                              @temp,
							  @date)
     
  END

GO
/****** Object:  StoredProcedure [dbo].[sp_registerUser]    Script Date: 10/15/2021 8:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- =============================================
  -- Author:        FeeCode Spot
  -- Create date: 
  -- Description:    
  -- =============================================
  CREATE PROCEDURE [dbo].[sp_registerUser]
      @username Nvarchar(50),
      @fname Nvarchar(50),
      @password nvarchar(200),
      @lname nvarchar(50),
      @retval int OUTPUT
  AS
  BEGIN
      SET NOCOUNT ON;
        INSERT INTO tbl_users(
                              username,
                              fname,
                              [Password],
                              lname,
                              reg_date) 
                              VALUES(
                              @username,
                              @fname,
                              CONVERT(VARCHAR(32), HashBytes('MD5', @password), 2),
                              @lname,
                              GETDATE())
        if(@@ROWCOUNT > 0)
        BEGIN
          SET @retval = 200 --return value when changes is detected on table
        END
        ELSE
        BEGIN
        SET @retval = 500  --return value if something went wronng
        END
  END

GO
USE [master]
GO
ALTER DATABASE [TestTask] SET  READ_WRITE 
GO
