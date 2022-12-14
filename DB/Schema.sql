USE [master]
GO
/****** Object:  Database [SWIS]    Script Date: 8/24/2017 11:27:03 AM ******/
CREATE DATABASE [SWIS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWIS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SWIS.mdf' , SIZE = 10304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SWIS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SWIS_log.ldf' , SIZE = 36288KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SWIS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWIS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWIS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SWIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWIS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWIS] SET RECOVERY FULL 
GO
ALTER DATABASE [SWIS] SET  MULTI_USER 
GO
ALTER DATABASE [SWIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWIS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWIS', N'ON'
GO
USE [SWIS]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 8/24/2017 11:27:03 AM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS APPPOOL\ASP.NET v4.0]    Script Date: 8/24/2017 11:27:03 AM ******/
CREATE USER [IIS APPPOOL\ASP.NET v4.0] FOR LOGIN [IIS APPPOOL\ASP.NET v4.0] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\ASP.NET v4.0]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\ASP.NET v4.0]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [IIS APPPOOL\ASP.NET v4.0]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\ASP.NET v4.0]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\ASP.NET v4.0]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\ASP.NET v4.0]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\ASP.NET v4.0]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Branch](
	[VarBranchID] [int] NOT NULL,
	[VarBranchName] [varchar](50) NULL,
	[VarBranchInitial] [varchar](10) NULL,
	[uid] [varchar](50) NULL,
	[Address] [varchar](500) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[VarBranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Class]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[VarClassID] [varchar](10) NOT NULL,
	[VarClassName] [varchar](50) NULL,
	[Board] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[ClassType] [int] NULL,
	[uid] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[houseid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[VarClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[VarEmployeeid] [varchar](50) NOT NULL,
	[EmployeeCategory] [varchar](10) NULL,
	[EmployeeDesignation] [int] NULL,
	[VarEmployeeName] [varchar](70) NOT NULL,
	[VarCurrentStatus] [varchar](1) NULL,
	[DOB] [date] NULL,
	[VarBlood] [int] NULL,
	[VarReligion] [varchar](50) NULL,
	[VarEmployeeSex] [varchar](10) NULL,
	[VarNationality] [varchar](50) NULL,
	[VarEmployeePhoneNo] [varchar](50) NULL,
	[VarEmployeeEmail] [varchar](70) NULL,
	[VarNID] [varchar](100) NULL,
	[VarDrivLicPassport] [varchar](50) NULL,
	[VarCampusId] [varchar](50) NULL,
	[VarPresentAddress] [varchar](200) NULL,
	[VarPermanentAddress] [varchar](250) NULL,
	[ExtraRemarks] [varchar](500) NULL,
	[VarPicture] [image] NULL,
	[JoinSubject] [varchar](50) NULL,
	[JoinDate] [date] NULL,
	[JoinSalary] [decimal](18, 0) NULL,
	[CurrentSalary] [decimal](18, 0) NULL,
	[AdditionalNote] [varchar](500) NULL,
	[Experience] [varchar](100) NULL,
	[VarQualification] [varchar](50) NULL,
	[DatLeavedDate] [date] NULL,
	[VarLeavedFor] [varchar](250) NULL,
	[VarFatherName] [varchar](150) NULL,
	[VarFContactNo] [varchar](100) NULL,
	[VarMotherName] [varchar](150) NULL,
	[VarMContactNo] [varchar](100) NULL,
	[VarMaritalstatus] [varchar](50) NULL,
	[VarSpouseName] [varchar](70) NULL,
	[VarSpouseOccupation] [varchar](100) NULL,
	[VarSpouseContact] [varchar](50) NULL,
	[VarBankName] [varchar](150) NULL,
	[VarBankAcc] [varchar](50) NULL,
	[VarBranchId] [int] NULL,
	[VarShiftCode] [varchar](50) NULL,
	[InsertDate] [date] NULL,
	[InsertUid] [varchar](50) NULL,
	[UpdateDate] [date] NULL,
	[UpdateUid] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[VarEmployeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeCategory]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftId] [varchar](50) NULL,
	[InputDate] [date] NULL,
 CONSTRAINT [PK_EmployeeCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeDesignation]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeDesignation](
	[NumDesignationId] [int] IDENTITY(1,1) NOT NULL,
	[VarDesignationName] [varchar](200) NULL,
	[uid] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[InputDate] [date] NULL,
 CONSTRAINT [PK_Designation_1] PRIMARY KEY CLUSTERED 
(
	[NumDesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeDoc]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeDoc](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](50) NULL,
	[DegreeName1] [varchar](50) NULL,
	[File1] [varbinary](max) NULL,
	[DegreeName2] [varchar](50) NULL,
	[File2] [varbinary](max) NULL,
	[DegreeName3] [varchar](50) NULL,
	[File3] [varbinary](max) NULL,
	[DegreeName4] [varchar](50) NULL,
	[File4] [varbinary](max) NULL,
 CONSTRAINT [PK_EmployeeDoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeEducation]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeEducation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarEmployeeid] [varchar](50) NOT NULL,
	[VarInstituteName] [varchar](200) NULL,
	[VarExamName] [varchar](200) NULL,
	[VarExamPass] [varchar](50) NULL,
	[VarExamResult] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[EntryDate] [date] NULL,
 CONSTRAINT [PK_EmployeeEducation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeEmploymentHistory]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeEmploymentHistory](
	[NumEmployeeid] [int] NOT NULL,
	[NumSlNo] [int] NULL,
	[VarOrganizationName] [varchar](250) NULL,
	[VarOrganizationAdd] [varchar](200) NULL,
	[VarOrganizationContact] [varchar](200) NULL,
	[NumDesignationID] [int] NULL,
	[VarDutyResponsibility] [varchar](50) NULL,
	[VarJobDuration] [varchar](50) NULL,
	[DatJobStart] [datetime] NULL,
	[DatJobEnd] [datetime] NULL,
	[VarLeaveNote] [varchar](250) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_EmployeeEmploymentHistory] PRIMARY KEY CLUSTERED 
(
	[NumEmployeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeTraining]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeTraining](
	[NumEmployeeid] [int] NOT NULL,
	[NumSlNo] [int] NULL,
	[VarTrainingTitles] [varchar](250) NULL,
	[VarTrainingDuration] [varchar](50) NULL,
	[DatTrainingStart] [datetime] NULL,
	[DatTrainingEnd] [datetime] NULL,
	[VarTrainingAchievement] [varchar](250) NULL,
	[uid] [varchar](50) NULL,
	[VarShiftCode] [varchar](10) NULL,
	[VarBranchId] [varchar](10) NULL,
	[emloyeenumid] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeTraining] PRIMARY KEY CLUSTERED 
(
	[emloyeenumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuControl]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuControl](
	[OperatorId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
 CONSTRAINT [PK_MenuControl] PRIMARY KEY CLUSTERED 
(
	[OperatorId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuTree]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuTree](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuTitle] [nvarchar](150) NOT NULL,
	[MenuUrl] [nvarchar](150) NOT NULL,
	[ParentId] [int] NOT NULL,
	[HasChild] [char](1) NOT NULL,
 CONSTRAINT [PK_MenuTree] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParticipantStudent]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParticipantStudent](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[varRegistrationId] [varchar](50) NOT NULL,
	[varStudentFirstName] [varchar](50) NOT NULL,
	[varStudentMiddleName] [varchar](50) NULL,
	[varStudentLastName] [varchar](50) NULL,
	[dob] [date] NULL,
	[varFatherName] [varchar](50) NULL,
	[VarStudentGender] [varchar](10) NULL,
	[fatherPhone] [varchar](50) NULL,
	[varMotherName] [varchar](50) NULL,
	[motherOccupation] [varchar](100) NULL,
	[motherPhone] [varchar](50) NULL,
	[PresentAddress] [varchar](500) NULL,
	[EmergencyPhone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[admissionForClass] [varchar](50) NULL,
	[ReferredBy] [varchar](50) NULL,
	[StudentPhoto] [image] NULL,
	[VarSiblingName] [varchar](50) NULL,
	[VarSiblingClass] [varchar](10) NULL,
	[VarSiblingSection] [varchar](50) NULL,
	[VarSiblingRoll] [varchar](10) NULL,
	[priviousSchoolName] [varchar](50) NULL,
	[priviousSClass] [varchar](100) NULL,
	[PriviousSyear] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
	[VarBranchId] [int] NULL,
	[VarShiftCode] [varchar](50) NULL,
	[VarSession] [varchar](50) NOT NULL,
	[Status] [varchar](50) NULL,
	[Type] [int] NULL,
	[AdmissionDate] [date] NULL,
	[InterviewDate] [date] NULL,
	[InterviewSlot] [int] NULL,
	[IntrviewTime] [int] NULL,
	[InputDate] [date] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK_ParticipantStudent] PRIMARY KEY CLUSTERED 
(
	[varRegistrationId] ASC,
	[VarSession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectGrade]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectGrade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NULL,
	[VarSession] [varchar](10) NULL,
	[VarClass] [varchar](10) NULL,
	[VarSection] [varchar](50) NULL,
	[ExamCode] [varchar](10) NULL,
	[ProjectId] [varchar](50) NULL,
	[ProjectGrade] [varchar](10) NULL,
	[VarBranchID] [int] NULL,
	[Grade] [varchar](10) NULL,
 CONSTRAINT [PK_ProjectGrade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalaryScale]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaryScale](
	[VarScaleid] [int] NOT NULL,
	[VarScaleName] [varchar](70) NULL,
	[FltBasic] [float] NOT NULL,
	[FltHouseRent] [float] NOT NULL,
	[FltMedical] [float] NOT NULL,
	[FltTransport] [float] NOT NULL,
	[FltIncrement] [float] NOT NULL,
	[FltPF] [float] NOT NULL,
	[FltOther] [float] NOT NULL,
 CONSTRAINT [PK_SalaryScale] PRIMARY KEY CLUSTERED 
(
	[VarScaleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SessionInfo]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionInfo](
	[VarSessionId] [varchar](10) NOT NULL,
	[VarSessionName] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_SessionInfo] PRIMARY KEY CLUSTERED 
(
	[VarSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShiftInfo]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShiftInfo](
	[VarShiftCode] [varchar](10) NOT NULL,
	[VarShiftName] [varchar](50) NOT NULL,
	[VarClassId] [varchar](10) NOT NULL,
	[VarBranchId] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_ShiftInfo] PRIMARY KEY CLUSTERED 
(
	[VarShiftCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[VarBranchID] [int] NOT NULL,
	[VarRegistrationID] [varchar](50) NOT NULL,
	[VarSessionName] [varchar](100) NULL,
	[VarAdmissionSession] [varchar](10) NULL,
	[VarShiftCode] [varchar](15) NULL,
	[VarStudentID] [varchar](50) NOT NULL,
	[VarStudentFirstName] [varchar](50) NULL,
	[VarStudentMeddleName] [varchar](50) NULL,
	[VarStudentLastName] [varchar](50) NULL,
	[VarStudentGender] [varchar](10) NULL,
	[VarStudentBirth] [date] NULL,
	[VarStudentNationality] [varchar](100) NULL,
	[VarStudenAddress] [varchar](200) NULL,
	[VarStudentArea] [varchar](500) NULL,
	[VarStudenHomePhone] [varchar](50) NULL,
	[VarStudenHomeCell] [varchar](50) NULL,
	[VarReligion] [varchar](50) NULL,
	[VarFatherName] [varchar](100) NULL,
	[VarFatherOccupation] [varchar](50) NULL,
	[VarFatherOfficeAddress] [varchar](200) NULL,
	[VarFatherMobile] [varchar](50) NULL,
	[VarFatherEmail] [varchar](150) NULL,
	[VarMotherName] [varchar](100) NULL,
	[VarMotherOccupation] [varchar](50) NULL,
	[VarMotherOfficeAddress] [varchar](200) NULL,
	[VarMotherMobile] [varchar](50) NULL,
	[VarMotherEmail] [varchar](150) NULL,
	[VarSiblingYesNo] [varchar](3) NULL,
	[VarSiblingName] [varchar](50) NULL,
	[VarSiblingShift] [varchar](50) NULL,
	[VarSiblingClass] [varchar](50) NULL,
	[VarSiblingSection] [varchar](50) NULL,
	[VarSiblingRoll] [varchar](50) NULL,
	[VarPreviousSchoolAttended] [varchar](200) NULL,
	[VarPrivateYes] [varchar](5) NULL,
	[VarPrincipalRemarks] [varchar](200) NULL,
	[RecommendAddmissionClassName] [varchar](50) NULL,
	[RecommendAdmissionClass] [varchar](10) NULL,
	[RecommendAdmissionSection] [varchar](50) NULL,
	[RecommendDate] [date] NULL,
	[BloodGroup] [varchar](15) NULL,
	[uid] [varchar](50) NULL,
	[LeftSession] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[TCComments] [varchar](500) NULL,
	[Remarks] [varchar](200) NULL,
	[SDate] [date] NULL,
	[StudentRoll] [int] NULL,
	[CampusId] [varchar](15) NULL,
	[PClassID] [varchar](10) NULL,
	[InputTime] [date] NULL,
	[ExamineeSMSNumber] [varchar](20) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[VarStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student_Old]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student_Old](
	[VarBranchID] [int] NOT NULL,
	[VarRegistrationID] [varchar](50) NOT NULL,
	[VarSessionName] [varchar](100) NOT NULL,
	[VarAdmissionSession] [varchar](10) NULL,
	[VarShiftCode] [varchar](15) NULL,
	[VarStudentID] [varchar](50) NOT NULL,
	[VarStudentFirstName] [varchar](50) NULL,
	[VarStudentMeddleName] [varchar](50) NULL,
	[VarStudentLastName] [varchar](50) NULL,
	[VarStudentGender] [varchar](10) NULL,
	[VarStudentBirth] [date] NULL,
	[VarStudentNationality] [varchar](100) NULL,
	[VarStudenAddress] [varchar](200) NULL,
	[VarStudentArea] [varchar](500) NULL,
	[VarStudenHomePhone] [varchar](50) NULL,
	[VarStudenHomeCell] [varchar](50) NULL,
	[VarReligion] [varchar](50) NULL,
	[VarFatherName] [varchar](100) NULL,
	[VarFatherOccupation] [varchar](50) NULL,
	[VarFatherOfficeAddress] [varchar](200) NULL,
	[VarFatherMobile] [varchar](50) NULL,
	[VarFatherEmail] [varchar](150) NULL,
	[VarMotherName] [varchar](100) NULL,
	[VarMotherOccupation] [varchar](50) NULL,
	[VarMotherOfficeAddress] [varchar](200) NULL,
	[VarMotherMobile] [varchar](50) NULL,
	[VarMotherEmail] [varchar](150) NULL,
	[VarSiblingYesNo] [varchar](3) NULL,
	[VarSiblingName] [varchar](50) NULL,
	[VarSiblingShift] [varchar](50) NULL,
	[VarSiblingClass] [varchar](50) NULL,
	[VarSiblingSection] [varchar](50) NULL,
	[VarSiblingRoll] [varchar](50) NULL,
	[VarPreviousSchoolAttended] [varchar](200) NULL,
	[VarPrivateYes] [varchar](5) NULL,
	[VarPrincipalRemarks] [varchar](200) NULL,
	[RecommendAddmissionClassName] [varchar](50) NULL,
	[RecommendAdmissionClass] [varchar](10) NULL,
	[RecommendAdmissionSection] [varchar](50) NULL,
	[RecommendDate] [date] NULL,
	[BloodGroup] [varchar](15) NULL,
	[uid] [varchar](50) NULL,
	[LeftSession] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[TCComments] [varchar](500) NULL,
	[Remarks] [varchar](200) NULL,
	[SDate] [date] NULL,
	[StudentRoll] [int] NULL,
	[CampusId] [varchar](15) NULL,
	[PClassID] [varchar](10) NULL,
	[InputTime] [date] NULL,
	[ExamineeSMSNumber] [varchar](20) NULL,
	[PromossionSession] [varchar](50) NULL,
	[PromossionDate] [date] NULL,
	[PromossionBy] [varchar](50) NULL,
	[PromossionName] [varchar](50) NULL,
 CONSTRAINT [PK_Student_Old] PRIMARY KEY CLUSTERED 
(
	[VarSessionName] ASC,
	[VarStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentAdmissionFee]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentAdmissionFee](
	[VarRegistrationID] [varchar](50) NULL,
	[VarStudentID] [varchar](50) NULL,
	[VarAdmittedClass] [varchar](50) NULL,
	[VarSection] [varchar](50) NULL,
	[FltAdmissionfee] [float] NOT NULL,
	[TakaReceivedDate] [datetime] NULL,
	[ReceivedEntrytime] [datetime] NULL,
	[VarReceivedBy] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentDoc]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentDoc](
	[VarRegistrationID] [varchar](50) NOT NULL,
	[VarStudentID] [varchar](50) NOT NULL,
	[ImgBirthcertificate] [image] NULL,
	[ImgStudentPircture] [image] NULL,
	[ImgAdmissionForm] [image] NULL,
 CONSTRAINT [PK_StudentDoc] PRIMARY KEY CLUSTERED 
(
	[VarStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[VarSubjectCode] [int] NULL,
	[VarSubjectName] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubjectMatch]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectMatch](
	[VarClassID] [numeric](18, 0) NULL,
	[VarSubjectCode] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectPart]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubjectPart](
	[VarClassName] [varchar](50) NULL,
	[VarSubjectCode] [numeric](18, 0) NULL,
	[VarSubjectPartName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BoardExamResult]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BoardExamResult](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarStudentId] [varchar](50) NULL,
	[VarSession] [varchar](50) NULL,
	[ExamSession] [varchar](50) NULL,
	[Class] [varchar](50) NULL,
	[Board] [varchar](50) NULL,
	[SubCode] [varchar](50) NULL,
	[SubName] [varchar](50) NULL,
	[Grade] [varchar](5) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [date] NULL,
 CONSTRAINT [PK_tbl_BoardExamResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BoardExamSubAssign]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BoardExamSubAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Session] [varchar](10) NULL,
	[Class] [varchar](50) NULL,
	[Board] [varchar](50) NULL,
	[ExamSession] [varchar](10) NULL,
	[QualificationLevel] [varchar](50) NULL,
	[StudentId] [varchar](10) NOT NULL,
	[Roll] [varchar](50) NULL,
	[ClassId] [varchar](50) NULL,
	[SubjectId] [varchar](10) NOT NULL,
	[SubjectName] [varchar](50) NULL,
	[UnitCode] [varchar](50) NOT NULL,
	[UnitCodeName] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
	[EntryDate] [date] NULL,
	[UniqueId] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_BoardExamSubAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BoardSubject]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BoardSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Board] [varchar](50) NULL,
	[ClassLevel] [varchar](50) NULL,
	[QualificationLevel] [varchar](50) NULL,
	[SubCode] [varchar](50) NULL,
	[SubName] [varchar](50) NULL,
	[UnitCode] [varchar](50) NULL,
	[UnitName] [varchar](50) NULL,
	[SubType] [varchar](20) NULL,
	[UniqueId] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_BoardSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_department]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_department](
	[dep_id] [varchar](50) NOT NULL,
	[dep_name] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_department] PRIMARY KEY CLUSTERED 
(
	[dep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_EdexcelSubjectAssign]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EdexcelSubjectAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Session] [varchar](10) NULL,
	[ClassId] [varchar](10) NOT NULL,
	[StudentId] [varchar](10) NOT NULL,
	[SubjectId] [varchar](10) NOT NULL,
	[Section] [varchar](50) NULL,
	[UnitCode] [varchar](50) NOT NULL,
	[UnitCodeNo] [varchar](20) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
	[EntryDate] [date] NULL,
 CONSTRAINT [PK_tbl_EdexcelSubjectAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_EdexelunitCode]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EdexelunitCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitCode] [varchar](50) NULL,
	[UnitCodeSpeCode] [varchar](10) NULL,
	[SpecificationCode] [varchar](10) NULL,
	[Class] [varchar](10) NULL,
	[IsLab] [varchar](50) NULL,
	[Type] [int] NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_tbi_unitCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_employee_attendence]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_employee_attendence](
	[VarEmployeeid] [int] NOT NULL,
	[VarEmployeeName] [varchar](100) NULL,
	[NumDesignationid] [int] NULL,
	[AttendDate] [date] NULL,
	[In_Time] [varchar](50) NULL,
	[Out_Time] [varchar](50) NULL,
	[Comments] [varchar](500) NULL,
	[present] [varchar](10) NULL,
	[absent] [varchar](10) NULL,
	[late] [varchar](10) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_employee_attendence] PRIMARY KEY CLUSTERED 
(
	[VarEmployeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_EmployeeDegreeName]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EmployeeDegreeName](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VarExamName] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_EmployeeDegreeName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_EmployeeEmergencyContact]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EmployeeEmergencyContact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](50) NULL,
	[ContactPersonName] [varchar](100) NULL,
	[ContactPersonRelation] [varchar](50) NULL,
	[ContactNumber] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_EmployeeEmergencyContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_EmployeeSubjectAssign]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EmployeeSubjectAssign](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarSession] [varchar](50) NULL,
	[VarClass] [varchar](10) NULL,
	[VarSection] [varchar](10) NULL,
	[VarSubjectCode] [varchar](50) NULL,
	[VarEmpId] [varchar](50) NULL,
	[BranchId] [int] NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [date] NULL,
 CONSTRAINT [PK_tbl_EmployeeSubjectAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ExamMarks]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ExamMarks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarSession] [varchar](50) NULL,
	[VarClassId] [varchar](10) NULL,
	[VarShift] [varchar](10) NULL,
	[VarSection] [varchar](50) NULL,
	[VarSubName] [varchar](100) NULL,
	[VarSubjectCode] [varchar](50) NULL,
	[UnitCodeNO] [varchar](50) NULL,
	[UnitCode] [varchar](50) NULL,
	[ExamCode] [varchar](10) NULL,
	[VarStudentId] [varchar](50) NULL,
	[First_ST_Marks] [float] NULL,
	[Second_ST_Marks] [float] NULL,
	[Third_ST_Marks] [float] NULL,
	[Final_Marks] [float] NULL,
	[Avg_ST_Marks] [float] NULL,
	[Highest_ST_Marks] [float] NULL,
	[Total_Marks] [float] NULL,
	[Grade] [varchar](1) NULL,
	[uid] [varchar](50) NULL,
	[InputTime] [date] NULL,
	[VarShiftId] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[UniqueSubId] [varchar](50) NULL,
	[UniqueSubName] [varchar](150) NULL,
 CONSTRAINT [PK_tbl_ExamMarks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ExamName]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ExamName](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamCode] [varchar](10) NOT NULL,
	[ExamName] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_ExamName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ExamSession]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ExamSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [varchar](50) NULL,
	[ExamSessionId] [varchar](50) NULL,
	[ExamSessionName] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_ExamSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ExamType]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ExamType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamTypeCode] [varchar](10) NULL,
	[ExamTypeName] [varchar](100) NULL,
	[ExamNameId] [int] NULL,
 CONSTRAINT [PK_tbl_ExamType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_feesCollection]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_feesCollection](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarInvoiceNo] [varchar](20) NOT NULL,
	[Date] [date] NOT NULL,
	[ReceiptNo] [int] NOT NULL,
	[StudentId] [varchar](50) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[FeesName] [varchar](50) NOT NULL,
	[FeesId] [int] NULL,
	[Session] [varchar](50) NOT NULL,
	[MonthFrom] [varchar](10) NULL,
	[MonthTo] [varchar](10) NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Vat] [decimal](18, 0) NOT NULL,
	[NetAmount] [decimal](18, 0) NOT NULL,
	[BranchId] [varchar](20) NULL,
	[ShiftId] [varchar](20) NULL,
 CONSTRAINT [PK_tbl_feesCollection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_feesCollectionSub]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_feesCollectionSub](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarStudentId] [varchar](50) NULL,
	[VarFeesName] [int] NULL,
	[VarMonth] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Vat] [decimal](18, 2) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[Date] [datetime] NULL,
	[VarSession] [varchar](10) NULL,
	[BranchId] [varchar](20) NULL,
	[ShiftId] [varchar](20) NULL,
	[ReceiptNo] [int] NULL,
	[VarInvoiceNo] [varchar](20) NULL,
 CONSTRAINT [PK_tbl_feesCollectionSub] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_feesInfo]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_feesInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VarClassId] [varchar](10) NOT NULL,
	[FeesId] [int] NULL,
	[VarFeesName] [varchar](50) NOT NULL,
	[Fees] [decimal](18, 0) NOT NULL,
	[FeesType] [int] NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftId] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_feesInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_feesType]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_feesType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeesType] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_feesType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_InterviewSlot]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_InterviewSlot](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InterviewSlot] [varchar](50) NULL,
	[InterviewTime] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_InterviewSlot] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_InterViewTime]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_InterViewTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InterViewTime] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_InterViewTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Month]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Month](
	[MonthId] [int] NOT NULL,
	[MonthName] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Month] PRIMARY KEY CLUSTERED 
(
	[MonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_OffDayStatus]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OffDayStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarSession] [varchar](50) NULL,
	[DatDate] [date] NULL,
	[VarStatus] [varchar](500) NULL,
 CONSTRAINT [PK_tbl_OffDayStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Present_class]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Present_class](
	[VarStudentID] [varchar](50) NOT NULL,
	[VarShiftCode] [varchar](10) NULL,
	[VarClassID] [varchar](10) NULL,
	[VarSection] [varchar](50) NULL,
	[VarSessionId] [varchar](10) NULL,
	[StudentRoll] [int] NULL,
	[CampusId] [varchar](15) NULL,
	[Status] [varchar](5) NULL,
 CONSTRAINT [PK_tbl_Present_class] PRIMARY KEY CLUSTERED 
(
	[VarStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Present_class_Old]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Present_class_Old](
	[VarStudentID] [varchar](50) NOT NULL,
	[VarShiftCode] [varchar](10) NULL,
	[VarClassID] [varchar](10) NULL,
	[VarSection] [varchar](50) NULL,
	[VarSessionId] [varchar](10) NOT NULL,
	[StudentRoll] [int] NULL,
	[CampusId] [varchar](15) NULL,
	[Status] [varchar](5) NULL,
	[PromossionSession] [varchar](50) NULL,
	[PromossionDate] [date] NULL,
	[PromossionBy] [varchar](50) NULL,
	[PromossionName] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Present_class_Old] PRIMARY KEY CLUSTERED 
(
	[VarStudentID] ASC,
	[VarSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PreviousSchool]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PreviousSchool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_PreviousSchool] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ReAdmissionHistory]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ReAdmissionHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarStudentId] [varchar](50) NULL,
	[PreSession] [varchar](50) NULL,
	[PreClass] [varchar](10) NULL,
	[PreSection] [varchar](50) NULL,
	[PreCampus] [varchar](15) NULL,
	[PreRoll] [varchar](50) NULL,
	[PreShift] [varchar](15) NULL,
	[ReSession] [varchar](50) NULL,
	[ReClass] [varchar](10) NULL,
	[ReSection] [varchar](50) NULL,
	[ReShift] [varchar](15) NULL,
	[ReCampus] [varchar](50) NULL,
	[NewRoll] [varchar](15) NULL,
	[Status] [int] NULL,
	[uid] [varchar](50) NULL,
	[InputDate] [date] NULL,
 CONSTRAINT [PK_tbl_ReAdmissionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_role]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_role](
	[role_name] [varchar](50) NOT NULL,
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Student_attendance]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Student_attendance](
	[VarStudentID] [varchar](50) NOT NULL,
	[VarClassID] [varchar](10) NOT NULL,
	[sectionId] [int] NOT NULL,
	[inTime] [varchar](50) NULL,
	[outTime] [varchar](50) NULL,
	[comments] [varchar](500) NULL,
	[present] [varchar](10) NULL,
	[late] [varchar](10) NULL,
	[absent] [varchar](10) NULL,
	[classDate] [date] NOT NULL,
	[VarShiftCode] [varchar](10) NULL,
	[VarBranchId] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Student_attendance] PRIMARY KEY CLUSTERED 
(
	[VarStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StudentArea]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StudentArea](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AreaName] [varchar](500) NULL,
 CONSTRAINT [PK_tbl_StudentArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StudentAttendance]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StudentAttendance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarSession] [varchar](50) NULL,
	[VarMonth] [int] NULL,
	[VarStudentId] [varchar](50) NOT NULL,
	[ClassId] [int] NULL,
	[VarSection] [varchar](50) NULL,
	[DatDate] [date] NULL,
	[AttendanceStatus] [varchar](1) NULL,
	[VarBranch] [varchar](50) NULL,
	[EntryDate] [date] NULL,
	[Uid] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_StudentAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StudentPresentStatus]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StudentPresentStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PresentStatus] [varchar](50) NULL,
	[StatusInitial] [varchar](5) NULL,
 CONSTRAINT [PK_tbl_StudentPresentStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Students_Account]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Students_Account](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReceiptNo] [int] NULL,
	[InvoNo] [varchar](20) NULL,
	[VarSessionId] [varchar](50) NULL,
	[VarStudentId] [varchar](50) NULL,
	[PayableFeesId] [int] NULL,
	[PayableVat] [decimal](18, 0) NULL,
	[PayableAmount] [decimal](18, 0) NULL,
	[NetPayable] [decimal](18, 0) NULL,
	[PaidFeesId] [int] NULL,
	[PaidAmount] [decimal](18, 0) NULL,
	[PaidVat] [decimal](18, 0) NULL,
	[NetPaid] [decimal](18, 0) NULL,
	[Dues] [decimal](18, 0) NULL,
	[Balance] [decimal](18, 0) NULL,
	[FeesAssignDate] [date] NULL,
	[PayDate] [date] NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Students_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StudentSubjectAssign]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StudentSubjectAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VarStudentId] [varchar](50) NOT NULL,
	[ClassId] [varchar](10) NULL,
	[VarSection] [varchar](10) NULL,
	[VarSubjectCode] [varchar](50) NULL,
	[VarSessionId] [varchar](10) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
	[EntryDate] [date] NULL,
 CONSTRAINT [PK_tbl_StudentSubjectAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Subject]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VarSubjectCode] [varchar](50) NULL,
	[VarASCode] [varchar](10) NULL,
	[VarSubjectName] [varchar](100) NULL,
	[SubSerial] [int] NULL,
	[ClassId] [varchar](10) NULL,
	[VarClassName] [varchar](50) NULL,
	[IsLab] [int] NULL,
	[Type] [int] NULL,
	[ExamType] [varchar](10) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_TransferHistory]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_TransferHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarStudentId] [varchar](50) NULL,
	[PreSession] [varchar](50) NULL,
	[PreClass] [varchar](10) NULL,
	[PreSection] [varchar](50) NULL,
	[PreCampus] [varchar](15) NULL,
	[PreRoll] [varchar](50) NULL,
	[PreShift] [varchar](15) NULL,
	[TraSession] [varchar](50) NULL,
	[TraClass] [varchar](10) NULL,
	[TraSection] [varchar](50) NULL,
	[TraShift] [varchar](15) NULL,
	[TraCampus] [varchar](50) NULL,
	[NewRoll] [varchar](15) NULL,
	[Status] [int] NULL,
	[uid] [varchar](50) NULL,
	[InputDate] [date] NULL,
 CONSTRAINT [PK_tbl_TransferHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user_info]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user_info](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [varchar](50) NOT NULL,
	[upass] [varchar](50) NULL,
	[urole] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[isactive] [varchar](10) NULL,
	[activationDate] [date] NULL,
	[user_full_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_user_info] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_WaiverHistory]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_WaiverHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VarStudentId] [varchar](50) NULL,
	[VarSessiuon] [varchar](50) NULL,
	[VarClassId] [varchar](10) NULL,
	[FromMonthId] [int] NULL,
	[FromMonth] [varchar](20) NULL,
	[ToMonthId] [int] NULL,
	[ToMonth] [varchar](20) NULL,
	[Amount] [decimal](18, 0) NULL,
	[uid] [varchar](50) NULL,
	[InputDate] [date] NULL,
	[VarBranchId] [varchar](10) NULL,
	[VarShiftId] [varchar](10) NULL,
 CONSTRAINT [PK_tbl_WaiverHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblhouse]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblhouse](
	[house_Code] [varchar](50) NOT NULL,
	[house_name] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[remarks] [varchar](500) NULL,
	[VarBranchId] [varchar](50) NULL,
	[VarShiftCode] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[house_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSection]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSection](
	[SectionId] [varchar](50) NOT NULL,
	[NumSectionId] [int] NULL,
	[varSectionName] [varchar](50) NOT NULL,
	[ClassID] [varchar](10) NOT NULL,
	[VarShiftCode] [varchar](50) NULL,
	[VarBranchId] [varchar](50) NULL,
	[uid] [varchar](50) NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_AllBoardExamSubjectWithUnitCode]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_AllBoardExamSubjectWithUnitCode](
	[StudentId] [varchar](50) NOT NULL,
	[Subject] [varchar](500) NULL,
	[TotalSub] [int] NULL,
	[Roll] [varchar](50) NULL,
	[ExamSession] [varchar](10) NULL,
	[VarUser] [varchar](50) NOT NULL,
	[VarBranch] [varchar](50) NOT NULL,
 CONSTRAINT [PK_temp_AllBoardExamSubjectWithUnitCode] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[VarUser] ASC,
	[VarBranch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_AllSubjectWithUnitCode]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_AllSubjectWithUnitCode](
	[StudentId] [varchar](50) NOT NULL,
	[Subject] [varchar](500) NULL,
	[TotalSub] [int] NULL,
	[VarBranch] [varchar](50) NOT NULL,
	[VarUser] [varchar](50) NOT NULL,
 CONSTRAINT [PK_temp_AllSubjectWithUnitCode_1] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[VarBranch] ASC,
	[VarUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_FileTag]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_FileTag](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NULL,
	[SubjectCode] [varchar](50) NULL,
	[Unit] [varchar](500) NULL,
	[TotalUnit] [int] NULL,
	[VarBranch] [varchar](50) NULL,
	[VarUser] [varchar](50) NULL,
 CONSTRAINT [PK_FileTag_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_IDCard]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_IDCard](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NULL,
	[SubjectCode] [varchar](50) NULL,
	[Unit] [varchar](500) NULL,
	[TotalUnit] [int] NULL,
	[VarBranch] [varchar](50) NULL,
	[VarUser] [varchar](50) NULL,
 CONSTRAINT [PK_temp_IDCard_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_OrientationIDCard]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_OrientationIDCard](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NULL,
	[SubjectCode] [varchar](50) NULL,
	[Unit] [varchar](500) NULL,
	[TotalUnit] [int] NULL,
	[VarBranch] [varchar](50) NULL,
	[VarUser] [varchar](50) NULL,
 CONSTRAINT [PK_temp_OrientationIDCard_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_OrientationSubjectWithUnit]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_OrientationSubjectWithUnit](
	[StudentId] [varchar](50) NOT NULL,
	[Subject] [varchar](500) NULL,
	[TotalSub] [int] NULL,
	[PreSchool] [varchar](500) NULL,
	[VarBranch] [varchar](50) NOT NULL,
	[VarUser] [varchar](50) NOT NULL,
 CONSTRAINT [PK_temp_OrientationSubjectWithUnit_1] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[VarBranch] ASC,
	[VarUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_ReportTextObject]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_ReportTextObject](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarTextObject] [varchar](500) NULL,
	[VarReport] [varchar](500) NULL,
	[VarBranch] [int] NULL,
	[VarUser] [varchar](50) NULL,
 CONSTRAINT [PK_Temp_ReportTextObject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_SectionPaper]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_SectionPaper](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NULL,
	[VarSubjectName] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
	[IsLab] [varchar](50) NULL,
	[Section] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_temp_SectionPaper] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_TotalStudent]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_TotalStudent](
	[ClassId] [int] NULL,
	[NewAdmission] [int] NULL,
	[PreviousAdmission] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tempAttendence]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempAttendence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NULL,
	[Attendence] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_tempAttendence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempCurrentStudent]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempCurrentStudent](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassId] [varchar](50) NULL,
	[OldStudent] [int] NULL,
	[NewStudent] [int] NULL,
	[TotalStudent] [int] NULL,
	[ClassName] [varchar](50) NULL,
	[BranchId] [int] NULL,
	[UserId] [varchar](50) NULL,
 CONSTRAINT [PK_TempCurrentStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempDynamicReport]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempDynamicReport](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VarStudentID] [varchar](20) NULL,
	[StudentName] [varchar](200) NULL,
	[VarSession] [varchar](50) NULL,
	[Roll] [int] NULL,
	[Section] [varchar](50) NULL,
	[VarClass] [varchar](100) NULL,
	[Mobile] [varchar](50) NULL,
	[Shift] [varchar](50) NULL,
	[DatDate] [date] NULL,
	[UserId] [varchar](50) NULL,
	[VarBranch] [int] NULL,
 CONSTRAINT [PK_TempDynamicReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempTabulationSheet]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempTabulationSheet](
	[StudentId] [varchar](50) NOT NULL,
	[Percentage] [float] NULL,
	[Attendence] [float] NULL,
	[Project] [varchar](50) NULL,
	[Position] [float] NULL,
	[VarBranchId] [int] NULL,
 CONSTRAINT [PK_tempTabulationSheet_1] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[MenuView]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MenuView]
AS
SELECT        dbo.MenuTree.MenuTitle, dbo.MenuTree.MenuUrl, dbo.MenuTree.ParentId, dbo.MenuControl.OperatorId, dbo.MenuControl.MenuId, dbo.MenuTree.HasChild
FROM            dbo.MenuControl INNER JOIN
                         dbo.MenuTree ON dbo.MenuControl.MenuId = dbo.MenuTree.Id








GO
ALTER TABLE [dbo].[StudentAdmissionFee] ADD  CONSTRAINT [DF_AdmissionFee_FltAdmissionfee]  DEFAULT ((0)) FOR [FltAdmissionfee]
GO
ALTER TABLE [dbo].[MenuControl]  WITH CHECK ADD  CONSTRAINT [FK_MenuControl_MenuTree] FOREIGN KEY([MenuId])
REFERENCES [dbo].[MenuTree] ([Id])
GO
ALTER TABLE [dbo].[MenuControl] CHECK CONSTRAINT [FK_MenuControl_MenuTree]
GO
/****** Object:  Trigger [dbo].[GetHighestAndAvgSt]    Script Date: 8/24/2017 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
CREATE trigger [dbo].[GetHighestAndAvgSt]
ON [dbo].[tbl_ExamMarks]
 AFTER INSERT,UPDATE
AS
declare @first_st decimal(18,2),
@second_st decimal(18,2),
@third_st decimal(18,2),
@final_marks decimal(18,2),
@highest_st decimal(18,2),
@avg_st decimal(18,2),
@total_marks decimal(18,2),
@grade as varchar(1),
@id bigint

set @first_st = (select First_ST_Marks from inserted)
set @second_st = (select Second_ST_Marks from inserted)
set @third_st = (select Third_ST_Marks from inserted)
set @final_marks=(select Final_Marks from inserted)
set @total_marks=(select Total_Marks from inserted)
set @id = (select Id from inserted)

IF(@first_st IS NOT NULL AND @second_st IS NOT NULL AND @third_st IS NOT NULL)
  BEGIN
  set @avg_st=(@first_st+@second_st+@third_st)/3
	if( @first_st>=@second_st AND @first_st>=@third_st)
      begin
	   set @highest_st=@first_st
      end
	  if( @second_st>=@first_st AND @second_st>=@third_st)
      begin
	   set @highest_st=@second_st
      end
	   if( @third_st>=@first_st AND @third_st>=@second_st)
      begin
	   set @highest_st=@third_st
      end
  END
  ELSE IF(@first_st IS NOT NULL AND @second_st IS NOT NULL)
  BEGIN
  set @avg_st=(@first_st+@second_st)/2
	if( @first_st>=@second_st)
      begin
	   set @highest_st=@first_st
      end
	  else
	   begin
	   set @highest_st=@second_st
      end
  END
  ELSE IF(@third_st IS NOT NULL AND @second_st IS NOT NULL)
  BEGIN
  
	if( @third_st>=@second_st)
      begin
	   set @highest_st=@third_st
      end
	  else
	   begin
	   set @highest_st=@second_st
      end
  END
  ELSE IF(@third_st IS NOT NULL AND @first_st IS NOT NULL)
  BEGIN

	if( @third_st>=@first_st)
      begin
	   set @highest_st=@third_st
      end
	  else
	   begin
	   set @highest_st=@first_st
      end
  END
  ELSE IF(@first_st IS NOT NULL)
  BEGIN
	set @highest_st=@first_st
  END
  ELSE IF(@second_st IS NOT NULL)
  BEGIN
	set @highest_st=@second_st
  END
  ELSE IF(@third_st IS NOT NULL)
  BEGIN
	set @highest_st=@third_st
  END
  update tbl_ExamMarks set Highest_ST_Marks=@highest_st where Id=@id
  update tbl_ExamMarks set Avg_ST_Marks=@avg_st where Id=@id
  
  IF(@highest_st IS NOT NULL AND @final_marks IS NOT NULL)
  BEGIN
  set @total_marks=@highest_st+@final_marks	
  END
 
  ELSE IF(@highest_st IS NULL AND @final_marks IS NOT NULL)
  BEGIN
  set @total_marks=@final_marks	
  END

  ELSE IF(@highest_st IS NOT NULL AND @final_marks IS NULL)
  BEGIN
 set @total_marks=@highest_st	
  END
  
  update tbl_ExamMarks set Total_Marks=@total_marks where Id=@id


  IF(@total_marks IS NOT NULL)
	  BEGIN
		IF(@total_marks>=80 and @total_marks<=100)
		set @grade='A'
		ELSE IF(@total_marks>=70 and @total_marks<=79)
		set @grade='B'
		ELSE IF(@total_marks>=60 and @total_marks<=69)
		set @grade='C'
		ELSE IF(@total_marks>=50 and @total_marks<=59)
		set @grade='D'
		ELSE IF(@total_marks>=0 and @total_marks<=49)
		set @grade='F'	
	  END

	  update tbl_ExamMarks set Grade=@grade where Id=@id











GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MenuControl"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 101
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MenuTree"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MenuView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MenuView'
GO
USE [master]
GO
ALTER DATABASE [SWIS] SET  READ_WRITE 
GO
