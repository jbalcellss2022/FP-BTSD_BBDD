

USE [master]
GO
/****** Object:  Database [SealSignSaaS_Dev]    Script Date: 18/01/2023 18:20:40 ******/

CREATE DATABASE [SealSignSaaS_Dev]
GO
ALTER DATABASE [SealSignSaaS_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET RECOVERY FULL 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SealSignSaaS_Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SealSignSaaS_Dev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SealSignSaaS_Dev', N'ON'
GO
ALTER DATABASE [SealSignSaaS_Dev] SET QUERY_STORE = OFF
GO
USE [SealSignSaaS_Dev]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SealSignSaaS_Dev]
GO

/****** Object:  Schema [HangFire]    Script Date: 18/01/2023 18:20:40 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'HangFire')
EXEC sys.sp_executesql N'CREATE SCHEMA [HangFire]'
GO
/****** Object:  Schema [Reporting]    Script Date: 18/01/2023 18:20:40 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Reporting')
EXEC sys.sp_executesql N'CREATE SCHEMA [Reporting]'
GO
/****** Object:  UserDefinedTableType [dbo].[IntegerList]    Script Date: 18/01/2023 18:20:40 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'IntegerList' AND ss.name = N'dbo')
CREATE TYPE [dbo].[IntegerList] AS TABLE(
	[IntegerId] [int] NULL
)
GO
/****** Object:  Table [dbo].[WidgetWF]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetWF]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetWF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDStep] [int] NOT NULL,
	[IDWF] [int] NOT NULL,
	[IDPDF] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[IdSrDocumentsStepWFI] [int] NULL,
	[IDFormWidget] [int] NULL,
 CONSTRAINT [PK_WidgetWF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SrDocumentsDrafts]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SrDocumentsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SrDocumentsDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDDocumentDraft] [int] NOT NULL,
	[IDSignRequestDraft] [bigint] NOT NULL,
	[IdWidgetLocationsNameMaster] [int] NULL,
	[Order] [int] NULL,
	[SignaturePosition] [varchar](10) NULL,
 CONSTRAINT [PK__SrDocume__3214EC27DFA63B85] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignRequests]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](500) NULL,
	[ExpireDate] [datetime] NULL,
	[Urgent] [bit] NOT NULL,
	[Comment] [varchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[StateDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Delegated] [bit] NULL,
	[IsChecked] [bit] NULL,
	[CheckDescription] [nvarchar](250) NULL,
	[IDPetitioner] [int] NOT NULL,
	[IDState] [int] NOT NULL,
	[IDProfile] [int] NOT NULL,
	[IDSigner] [int] NULL,
	[IDGroupSigner] [int] NULL,
	[IDReason] [int] NULL,
	[IDDossier] [int] NULL,
	[Document] [nvarchar](max) NULL,
	[GroupSignsRequired] [int] NULL,
	[SendEmail] [nvarchar](2000) NULL,
	[NameDocument] [nvarchar](2000) NULL,
	[IsFromResign] [bit] NOT NULL,
	[ExternalUserEmail] [nvarchar](100) NULL,
	[ExternalUserMobile] [nvarchar](50) NULL,
	[SBAction] [int] NULL,
	[ExternalRef] [nvarchar](50) NULL,
	[CreateUser] [int] NULL,
	[Publish] [bit] NOT NULL,
	[Published] [bit] NOT NULL,
	[NotResign] [bit] NOT NULL,
	[PrevComment] [nvarchar](2000) NULL,
	[Origin] [int] NOT NULL,
	[DefinitiveDocument] [nvarchar](2000) NULL,
	[IsMultiple] [bit] NULL,
	[ActionWidgetMessage] [varchar](300) NULL,
	[IDBillDocument] [int] NULL,
	[Action] [varchar](300) NULL,
	[CustomField] [varchar](max) NULL,
	[UniqueID] [int] NULL,
	[OriginId] [int] NULL,
	[IDAccGroup] [int] NULL,
	[ExpiredReminderDate] [DATETIME] NULL,
 CONSTRAINT [PK_SignRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignRequestsDrafts]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignRequestsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignRequestsDrafts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](500) NULL,
	[Urgent] [bit] NOT NULL,
	[Comment] [varchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[StateDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NULL,
	[IDPetitioner] [int] NOT NULL,
	[IDProfile] [int] NULL,
	[IDReason] [int] NULL,
	[IDDossier] [int] NULL,
	[SendEmail] [nvarchar](2000) NULL,
	[IsFromResign] [bit] NOT NULL,
	[DocumentPassword] [nvarchar](1000) NULL,
	[BodyMessage] [nvarchar](2000) NULL,
	[CustomField] [varchar](max) NULL,
	[CreateUser] [int] NULL,
	[Processing] [bit] NOT NULL,
	[IDAccGroup] [int] NULL,
	[ExpiredReminderDate] [DATETIME]  NULL,
 CONSTRAINT [PK_SignRequestsDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ExternalSignatures]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExternalSignatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Instancia] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
	[IDSignatureTypes] [int] NOT NULL,
	[IDStates] [int] NOT NULL,
	[IDUsers] [int] NOT NULL,
	[IDDocuments] [int] NULL,
	[NSignatures] [int] NOT NULL,
	[DocumentName] [nvarchar](100) NULL,
	[IDAccGroup] [int] NULL,
 CONSTRAINT [PK_ExternalSignatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SrDocuments]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SrDocuments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SrDocuments](
	[IDDocument] [int] NOT NULL,
	[IDSignRequest] [int] NOT NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_SrDocuments] PRIMARY KEY CLUSTERED 
(
	[IDDocument] ASC,
	[IDSignRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ActionDate] [datetime] NOT NULL,
	[IDActionType] [int] NOT NULL,
	[IDUser] [int] NULL,
	[IDContact] [int] NULL,
	[IDSuggestedContact] [int] NULL,
	[IDRequest] [int] NULL,
	[IDActionReason] [int] NULL,
	[IDEndUser] [int] NULL,
	[IDEndContact] [int] NULL,
	[IDEndSuggestedContact] [int] NULL,
	[ElementData] [varchar](max) NULL,
	[IDStepWFI] [int] NULL,
	[IDDocument] [int] NULL,
	[IDExternalSingnatures] [int] NULL,
	[IDAccGroup] [int] NULL,
	[IpAddressUser]  [nvarchar](50),
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StepsWFI]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StepsWFI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWFI] [int] NOT NULL,
	[IDActionType] [int] NOT NULL,
	[IDUser] [int] NULL,
	[IDOriginalStep] [int] NULL,
	[Order] [int] NULL,
	[Completed] [bit] NULL,
	[CompletedOk] [bit] NULL,
	[IDGroup] [int] NULL,
	[GroupSignsRequired] [int] NULL,
	[WorkFlowStepType] [int] NOT NULL,
	[OrderStep] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](100) NULL,
	[NIF] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[Telephone] [nvarchar](20) NULL,
	[Position] [nvarchar](1000) NULL,
	[Company] [nvarchar](1000) NULL,
	[Country] [nvarchar](100) NULL,
	[CustomField] [varchar](max) NULL,
	[PreviewLink] [varchar](max) NULL,
	[IDLanguage] [int] NULL,
	[ActualStep] [bit] NOT NULL,
	[IdSignatureType] [int] NULL,
	[MultiSignAllowed] [bit] NOT NULL,
 CONSTRAINT [PK_StepsWFI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Documents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Documents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Pages] [int] NULL,
	[Url] [nvarchar](500) NOT NULL,
	[UploadDateTime] [datetime] NOT NULL,
	[CanBeSigned] [bit] NOT NULL,
	[Size] [decimal](13, 2) NOT NULL,
	[OriginalName] [nvarchar](200) NOT NULL,
	[CustomField] [varchar](max) NULL,
	[UniqueID] [int] NULL,
	[OriginId] [int] NULL,
	[SignedBefore] [bit] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DocumentsDrafts]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentsDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Pages] [int] NULL,
	[Url] [nvarchar](500) NOT NULL,
	[UploadDateTime] [datetime] NOT NULL,
	[CanBeSigned] [bit] NOT NULL,
	[Size] [decimal](13, 2) NOT NULL,
	[OriginalName] [nvarchar](200) NOT NULL,
	[CustomField] [varchar](max) NULL,
	[SignedBefore] [bit] NULL,
 CONSTRAINT [PK_DocumentsDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SrDocumentsStepsWFI]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SrDocumentsStepsWFI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDStepWFI] [int] NOT NULL,
	[IDSignRequest] [int] NOT NULL,
	[IDDocument] [int] NOT NULL,
	[Signed] [bit] NOT NULL,
	[Order] [int] NULL,
	[IdWidgetLocationsNameMaster] [int] NULL,
	[DataCertificate] [varchar](max) NULL,
	[SignaturePosition] [varchar](10) NULL,
 CONSTRAINT [PK_SrDocumentsStepsWFI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AccGroup]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
	[TenantExpiredDate] [datetime] NOT NULL,
	[TenantGracePeriodDate] [datetime] NOT NULL,
	[Logo] [varchar](255) NULL,
	[IDLanguage] [int] NOT NULL,
	[IDLicense] [int] NOT NULL,
	[LimitUser] [bigint] NULL,
	[ExtraUser] [bigint] NULL,
	[LimitSign] [bigint] NULL,
	[ExtraSign] [bigint] NULL,
	[LimitSMS] [bigint] NULL,
	[ExtraSMS] [bigint] NULL,
	[LimitFileStorage] [bigint] NULL,
	[ExtraFileStorage] [bigint] NULL,
	[LimitTemplates] [bigint] NULL,
	[ExtraTemplates] [bigint] NULL,
	[DoubleFactorAuthTypeForUsers] [int] NULL,
	[CommercialName] [nvarchar](50) NULL,
	[CommercialSurname] [nvarchar](100) NULL,
	[CommercialEmail] [nvarchar](100) NULL,
	[CommercialMobile] [nvarchar](15) NULL,
	[LimitStepTemplate] [bigint] NULL,
 CONSTRAINT [PK_AccGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewCounterMaintenanceAll]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewCounterMaintenanceAll]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View [dbo].[ViewCounterMaintenanceAll]    Script Date: 23/02/2022 13:45:29 ******/

CREATE VIEW [dbo].[ViewCounterMaintenanceAll]
as



select firmadas.Id,firmadas.Name, Sign,Send,Size,OtpSms  from
(
	/*****FIRMAS internas REALIZADAS****/
	select sum(total) ''Sign'',id,Name from 
	( 
			select count(a.id) total,ag.Id,ag.[Name] from [dbo].[AccGroup]ag
			left join [Actions] a   on  a.idaccgroup =ag.ID    --tipo de acción firmar
 			and a.[ActionDate]>=ag.[CreateDate] and a.[IDActionType] in(1,29) --fecha de accion tope de la licencia
			group by ag.id,ag.[Name]
	) AG
		group by id,Name
     
) firmadas 
left join 
(    
    /*****FIRMAS internas ENVIADAS****/
	select sum(total) ''Send'',id,Name from 
	(
			select count(a.id) total,ag.Id,ag.[Name] from [dbo].[AccGroup]ag
			left join [Actions] a   on ( a.idaccgroup =ag.ID    )--tipo de acción firmar
 			where a.[ActionDate]>=ag.[CreateDate] and a.[IDActionType] in(1,29) --fecha de accion tope de la licencia
			group by ag.id,ag.[Name]
	union all
		select count(srdw.ID) total,acc.id Id,acc.[Name]   --WIDGET DE FIRMA QUE ESTAN PENDIENTES
		from AccGroup acc
		 
		inner join [SignRequests] req on req.[IDAccGroup]  = acc.ID
		inner join SrDocumentsStepsWFI srdw on srdw.IDSignRequest = req.ID
		inner join WidgetWF w on w.[IdSrDocumentsStepWFI] = srdw.ID
		inner join [StepsWFI] st on st.ID = srdw.IDStepWFI
		where st.IDActionType = 1 --tipo accion firmar
		and req.Deleted = 0-- request sin eliminar
		and srdw.Signed = 0--widget sin firmar
		and req.idstate in (2,3)--en estado enviada y pendiente
		and w.IDFormWidget is  null --solo widget de firma no de formulario
		group by acc.id,acc.[Name]	
	) as AG group by id,Name

) enviadas on firmadas.Id=enviadas.Id
left join 
(
	/*****TAMAÑO POR EMPRESA CONSUMIDO****/
	select sum(s) Size, Id ,Name from 
	(
			select IsNull(sum(d.size),0)as s ,acc.Id as Id,acc.Name
			from AccGroup acc
			left join SignRequests req on req.[IDAccGroup]  = acc.ID
			left join [dbo].[SrDocuments] sr on sr.IDSignRequest = req.ID
			left join [dbo].[Documents] d on d.id = sr.[IDDocument]
			group by acc.Id ,acc.[Name]	
		union all 
			select sum(d.size)as s ,acc.Id as Id,acc.Name --FICHEROS DE REQUEST ANTIGUAS QUE ANTES NO SE GUARDABAN EN LA TABLA SRDOCUMENT, SE QUITAN LOS DE ESA TABLA PARA NO DUPLICAR
			from accgroup acc
			left join SignRequests req on req.[IDAccGroup]  = acc.ID
			inner join [dbo].[SrDocumentsStepsWFI] sr on sr.[IDSignRequest] = req.id 
			inner join [dbo].[Documents] d on d.id = sr.[IDDocument]
			where sr.[IDDocument] not in (select [IDDocument]from [dbo].[SrDocuments])
 			group by acc.Id ,acc.[Name]	
		union all
			select sum(dd.Size)as s ,acc.Id as Id,acc.Name --SUBIDA DE FICHEROS EN BORRADORES
			from accgroup acc
			inner join SignRequestsDrafts sd  on sd.[IDAccGroup]  = acc.ID
			inner join SrDocumentsDrafts sdd on sdd.IDSignRequestDraft = sd.ID
			inner join DocumentsDrafts dd on dd.ID = sdd.IDDocumentDraft
			 group by acc.Id ,acc.[Name]	
		union all
			select sum(d.size) as s ,acc.Id as Id,acc.Name	--FIRMA EXTERNA SOLO SE SUBE EL FICHERO CUANDO SE FIRMA
			from AccGroup acc
			inner join [ExternalSignatures] e on e.[IDAccGroup]  = acc.ID
			inner join [dbo].[Documents] d on d.id = e.IDDocuments
			where IDDocuments is not null
			and IDStates in (5,6)
			group by acc.Id ,acc.[Name]	 
	) as AG group by id,Name
 
) as tamaño on enviadas.Id= tamaño.ID
left join 
(
	/*****OTP SMS consumidos****/
	select sum(total) OtpSms, id ,[Name] from 
	(
			select count(a.id) total,ag.Id,ag.[Name]
			 from [dbo].[AccGroup]ag
			left join [Actions] a   on (ag.ID  =  a.idaccgroup)--tipo de acción enviar SMS
			where a.[ActionDate]>=ag.[CreateDate]and a.[IDActionType] =25 --fecha de accion tope de la licencia
			group by ag.id,ag.[Name]
		
	) as AG group by id,Name
)as otpSMS on enviadas.Id= otpSMS.ID



/** FIRMAS REALIZADAS **/
' 
GO
/****** Object:  Table [dbo].[UsersGroups]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersGroups](
	[Groups_ID] [int] NOT NULL,
	[Users_ID] [int] NOT NULL,
 CONSTRAINT [PK_UsersGroups] PRIMARY KEY CLUSTERED 
(
	[Groups_ID] ASC,
	[Users_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UsersRequests]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersRequests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDRequest] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDGroup] [int] NULL,
 CONSTRAINT [PK_UsersRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WFInstance]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WFInstance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WFInstance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWF] [int] NOT NULL,
	[IDRequest] [int] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_WFInstance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[Solicitudes_Todas_Distintas]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Solicitudes_Todas_Distintas]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[Solicitudes_Todas_Distintas]
AS
SELECT DISTINCT 
                         SR.ID AS IdRequest, SR.IDState, ISNULL(NOWFUR.IDUser, ISNULL(SR.IDSigner, ISNULL(dbo.StepsWFI.IDUser, WFGR.Users_ID))) AS IDUSUARIO, SR.IDPetitioner
FROM         (SELECT   URNW.ID, URNW.IDRequest, URNW.IDUser
                           FROM         dbo.UsersRequests AS URNW INNER JOIN
                                                        (SELECT   dbo.SignRequests.ID
                                                           FROM         dbo.SignRequests LEFT OUTER JOIN
                                                                                    dbo.WFInstance ON dbo.SignRequests.ID = dbo.WFInstance.IDRequest
                                                           WHERE     (dbo.WFInstance.ID IS NULL)) AS NOWF ON URNW.IDRequest = NOWF.ID) AS NOWFUR RIGHT OUTER JOIN
                         dbo.SignRequests AS SR WITH (NOLOCK) ON NOWFUR.IDRequest = SR.ID LEFT OUTER JOIN
                             (SELECT   MIN([Order]) AS OrdenActivo, IDWFI
                                FROM         dbo.StepsWFI AS StepsWFI_1 WITH (NOLOCK)
                                WHERE     (Completed = 0)
                                GROUP BY IDWFI) AS ORDEN_PASO_ACTIVO RIGHT OUTER JOIN
                         dbo.StepsWFI WITH (NOLOCK) ON ORDEN_PASO_ACTIVO.OrdenActivo = dbo.StepsWFI.[Order] AND ORDEN_PASO_ACTIVO.IDWFI = dbo.StepsWFI.IDWFI RIGHT OUTER JOIN
                         dbo.WFInstance AS WFI WITH (NOLOCK) ON dbo.StepsWFI.IDWFI = WFI.ID LEFT OUTER JOIN
                         dbo.UsersGroups AS WFGR WITH (NOLOCK) ON dbo.StepsWFI.IDGroup = WFGR.Groups_ID ON SR.ID = WFI.IDRequest
WHERE     (SR.Deleted = 0) AND (SR.IDState <> 8) AND (SR.IDState <> 9)




' 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/01/2023 18:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](100) NULL,
	[Position] [nvarchar](1000) NULL,
	[Department] [nvarchar](1000) NULL,
	[Email] [nvarchar](100) NULL,
	[Telephone] [varchar](15) NULL,
	[Mobile] [nvarchar](15) NULL,
	[Picture] [nvarchar](250) NULL,
	[SignGraph] [varbinary](max) NULL,
	[CardId] [nvarchar](10) NULL,
	[ShowPicture] [bit] NOT NULL,
	[Logo] [nvarchar](200) NULL,
	[Enabled] [bit] NULL,
	[ExternalUser] [bit] NOT NULL,
	[PushTokens] [nvarchar](max) NULL,
	[Area] [nvarchar](50) NULL,
	[Password] [nvarchar](500) NULL,
	[idAuthMethod] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Remote] [bit] NULL,
	[UserCreatorId] [int] NULL,
	[IdParent] [int] NULL,
	[ExpiryDate] [datetime] NULL,
	[IdAccGroup] [int] NOT NULL,
	[IdUserState] [int] NOT NULL,
	[IdLanguage] [int] NOT NULL,
	[IdCountry] [int] NULL,
	[IdNotificationsConfigs] [int] NULL,
	[ExternalId] [varchar](20) NULL,
	[OptionalFields] [varchar](max) NULL,
	[ReliablyIdentified] [bit] NOT NULL,
	[IdCardType] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ExternalId] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [ReliablyIdentified]
GO


GO

/****** Object:  View [dbo].[ContadoresRecibidasTODAS]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ContadoresRecibidasTODAS]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ContadoresRecibidasTODAS]
AS
SELECT   dbo.Users.ID AS IdUsuario, COUNT(DISTINCT S.IdRequest) AS TodasRecibidas
FROM         (SELECT DISTINCT IdRequest, IDState, IDUSUARIO
                           FROM         dbo.Solicitudes_Todas_Distintas
                           WHERE     (IDState <> 9) AND (IDState <> 8) AND (IDState <> 1)) AS S INNER JOIN
                         dbo.Users ON S.IDUSUARIO = dbo.Users.ID
GROUP BY dbo.Users.ID




' 
GO
/****** Object:  View [dbo].[Solicitudes_Visibles]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Solicitudes_Visibles]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[Solicitudes_Visibles] as
SELECT   distinct     Solicitudes_Todas_Distintas.IdRequest, Solicitudes_Todas_Distintas.IDPetitioner, Users.ID AS idUsuario
FROM            Solicitudes_Todas_Distintas INNER JOIN
                         Users ON Solicitudes_Todas_Distintas.IDUSUARIO = Users.ID


' 
GO
/****** Object:  View [dbo].[Solicitudes_Todas]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Solicitudes_Todas]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Solicitudes_Todas]
AS
SELECT        SR.ID AS IdRequest, ISNULL(dbo.StepsWFI.Completed, 0) AS PasoCompletado, SR.IDState, ISNULL(NOWFUR.IDUser, ISNULL(SR.IDSigner, ISNULL(dbo.StepsWFI.IDUser, WFGR.Users_ID))) AS IDUSUARIO, 
                         dbo.StepsWFI.ID AS IDStepWFI, dbo.StepsWFI.IDGroup AS IDGroupWFI, CASE WHEN ORDEN_PASO_ACTIVO.OrdenActivo IS NOT NULL OR
                         WFI.ID IS NULL THEN 1 ELSE 0 END AS PASOACTIVO, SR.IDPetitioner, SR.Subject, SR.IDDossier
FROM            (SELECT        URNW.ID, URNW.IDRequest, URNW.IDUser
                          FROM            dbo.UsersRequests AS URNW INNER JOIN
                                                        (SELECT        dbo.SignRequests.ID
                                                          FROM            dbo.SignRequests LEFT OUTER JOIN
                                                                                    dbo.WFInstance ON dbo.SignRequests.ID = dbo.WFInstance.IDRequest
                                                          WHERE        (dbo.WFInstance.ID IS NULL)) AS NOWF ON URNW.IDRequest = NOWF.ID) AS NOWFUR RIGHT OUTER JOIN
                         dbo.SignRequests AS SR WITH (NOLOCK) ON NOWFUR.IDRequest = SR.ID LEFT OUTER JOIN
                             (SELECT        MIN([Order]) AS OrdenActivo, IDWFI
                               FROM            dbo.StepsWFI AS StepsWFI_1 WITH (NOLOCK)
                               WHERE        (Completed = 0)
                               GROUP BY IDWFI) AS ORDEN_PASO_ACTIVO RIGHT OUTER JOIN
                         dbo.StepsWFI WITH (NOLOCK) ON ORDEN_PASO_ACTIVO.OrdenActivo = dbo.StepsWFI.[Order] AND ORDEN_PASO_ACTIVO.IDWFI = dbo.StepsWFI.IDWFI RIGHT OUTER JOIN
                         dbo.WFInstance AS WFI WITH (NOLOCK) ON dbo.StepsWFI.IDWFI = WFI.ID LEFT OUTER JOIN
                         dbo.UsersGroups AS WFGR WITH (NOLOCK) ON dbo.StepsWFI.IDGroup = WFGR.Groups_ID ON SR.ID = WFI.IDRequest
WHERE        (SR.Deleted = 0)



' 
GO
/****** Object:  Table [dbo].[UsersGroupRequest]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersGroupRequest](
	[IDUser] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[IDRequest] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDStepWFI] [int] NULL,
 CONSTRAINT [PK_UsersGroupRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[SOLICITUDES_TODAS_CON_COMPLE_1]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SOLICITUDES_TODAS_CON_COMPLE_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[SOLICITUDES_TODAS_CON_COMPLE_1]
AS
SELECT DISTINCT 
                         V.IdRequest, V.IDState, V.IDUSUARIO, CASE WHEN UGR.ID IS NULL THEN V.PasoCompletado ELSE 1 END AS Paso_Completado, 
                         CASE WHEN V.PasoCompletado = 1 THEN - 1 ELSE PASOACTIVO END AS PASOACTIVO, V.IDPetitioner, V.IDDossier, UGR.ID
FROM            dbo.Solicitudes_Todas AS V LEFT OUTER JOIN
                         dbo.UsersGroupRequest AS UGR ON V.IdRequest = UGR.IDRequest AND V.IDStepWFI = UGR.IDStepWFI AND V.IDGroupWFI = UGR.IDGroup AND V.IDUSUARIO = UGR.IDUser
' 
GO
/****** Object:  View [dbo].[SOLICITUDES_TODAS_CON_COMPLE_2]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SOLICITUDES_TODAS_CON_COMPLE_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[SOLICITUDES_TODAS_CON_COMPLE_2]
AS
SELECT        IdRequest, IDState, IDUSUARIO, Paso_Completado, PASOACTIVO, IDPetitioner, IDDossier
FROM            dbo.SOLICITUDES_TODAS_CON_COMPLE_1
GROUP BY IdRequest, IDState, IDUSUARIO, IDPetitioner, IDDossier, Paso_Completado, PASOACTIVO
' 
GO
/****** Object:  View [dbo].[Solicitudes_Todas_Con_Completa]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Solicitudes_Todas_Con_Completa]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Solicitudes_Todas_Con_Completa]
AS
SELECT DISTINCT 
                         V.IdRequest, V.IDState, V.IDUSUARIO, CASE WHEN UGR.ID IS NULL THEN V.PasoCompletado ELSE 1 END AS Paso_Completado, CASE WHEN V.PasoCompletado = 1 THEN - 1 ELSE PASOACTIVO END AS PASOACTIVO, 
                         V.IDPetitioner, V.IDDossier, UGR.ID
FROM            dbo.Solicitudes_Todas AS V LEFT OUTER JOIN
                         dbo.UsersGroupRequest AS UGR ON V.IdRequest = UGR.IDRequest AND V.IDStepWFI = UGR.IDStepWFI AND V.IDGroupWFI = UGR.IDGroup AND V.IDUSUARIO = UGR.IDUser
' 
GO
/****** Object:  View [dbo].[SolicitudesEnviadas_PreContado]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudesEnviadas_PreContado]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[SolicitudesEnviadas_PreContado]
AS
SELECT   IDPetitioner, IdRequest, CASE WHEN S.IDState = 6 THEN 1 ELSE 0 END AS Erroneas, CASE WHEN S.IDState = 3 THEN 1 ELSE 0 END AS Pendientes, 
                         CASE WHEN S.IDState <> 1 AND S.IDState <> 8 AND S.IDState <> 9 THEN 1 ELSE 0 END AS Todas, CASE WHEN S.IDState = 7 THEN 1 ELSE 0 END AS Rechazadas, 
                         CASE WHEN S.IDState = 1 THEN 1 ELSE 0 END AS Borradores
FROM         (SELECT DISTINCT IdRequest, IDState, IDPetitioner
                           FROM         dbo.Solicitudes_Todas_Distintas) AS S
' 
GO
/****** Object:  View [dbo].[ContadoresEnviadas]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ContadoresEnviadas]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ContadoresEnviadas]
AS
SELECT        IDPetitioner, SUM(Erroneas) AS EnviadasErroneas, SUM(Pendientes) AS EnviadasPendientes, SUM(Todas) AS EnviadasTodas, SUM(Rechazadas) AS EnviadasRechazadas, SUM(Borradores) AS EnviadasBorradores
FROM            dbo.SolicitudesEnviadas_PreContado
GROUP BY IDPetitioner
' 
GO
/****** Object:  Table [dbo].[Dossiers]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dossiers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dossiers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Reference] [nvarchar](50) NOT NULL,
	[Application] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[IDType] [int] NOT NULL,
	[IDState] [int] NOT NULL,
	[Process] [nvarchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[InvestmentProposal] [decimal](18, 2) NULL,
	[ProposalDescription] [nvarchar](250) NULL,
	[DocumentNumber] [int] NULL,
	[InvestmentNumber] [int] NULL,
	[RevisionReason] [nvarchar](100) NULL,
	[AllocationDescription] [nvarchar](250) NULL,
	[IDEntity] [int] NULL,
	[CreateUser] [int] NOT NULL,
 CONSTRAINT [PK_Dossiers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[Solicitudes_PreContadores]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Solicitudes_PreContadores]'))
EXEC dbo.sp_executesql @statement = N'/*where IDUSUARIO=1  
and IDState = 6 and PASOACTIVO=1 and Paso_Completado=0
and IDState = 6
and PASOACTIVO=1 
 and Paso_Completado=0 
 = 3 OR = 6 OR = 2

ID	Name
1	Borrador
2	Enviada
3	Pendiente
4	Cancelada
5	Firmada
6	Errónea
7	Rechazada
8	BorradorRefirma
9	BorradorTemp
*/
CREATE VIEW [dbo].[Solicitudes_PreContadores]
AS
SELECT DISTINCT 
                         S.IdRequest, S.IDDossier, dbo.Dossiers.CreateUser AS DosierCreateUser, S.IDState, S.IDUSUARIO, S.IDPetitioner, CASE WHEN (S.IDState = 2 OR
                         S.IDState = 3) AND (Paso_Completado = 1 OR
                         PASOACTIVO = - 1) THEN 1 ELSE 0 END AS RecibidasEnTramite, CASE WHEN S.IDState = 6 THEN 1 ELSE 0 END AS RecibidasErroneas, CASE WHEN S.IDState = 3 AND Paso_Completado = 0 AND 
                         PASOACTIVO = 1 THEN 1 ELSE 0 END AS RecibidasPendientes, CASE WHEN S.IDState <> 1 AND S.IDState <> 8 AND S.IDState <> 9 THEN 1 ELSE 0 END AS RecibidasTodas, 
                         CASE WHEN S.IDState = 7 THEN 1 ELSE 0 END AS Rechazadas, CASE WHEN S.IDState = 1 THEN 1 ELSE 0 END AS Borradores, dbo.Users.ID AS idUsuarioPK
FROM            dbo.Solicitudes_Todas_con_Completa AS S INNER JOIN
                         dbo.Users WITH (NOLOCK) ON S.IDUSUARIO = dbo.Users.ID LEFT OUTER JOIN
                         dbo.Dossiers WITH (NOLOCK) ON S.IDDossier = dbo.Dossiers.ID
WHERE        (NOT (S.IDUSUARIO IS NULL))
' 
GO
/****** Object:  View [dbo].[ContadoresExpedientes]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ContadoresExpedientes]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ContadoresExpedientes]
AS
SELECT        DosieresInvolucrado.TotalDosieres, dbo.Users.ID AS IdUser
FROM            (SELECT        COUNT(DISTINCT IDDossier) AS TotalDosieres, IDUSUARIO
                          FROM            (SELECT DISTINCT IDDossier, IDPetitioner AS IDUSUARIO
                                                    FROM            dbo.Solicitudes_PreContadores
                                                    WHERE        (IDDossier IS NOT NULL)
                                                    UNION ALL
                                                    SELECT DISTINCT IDDossier, IDUSUARIO
                                                    FROM            dbo.Solicitudes_PreContadores AS Solicitudes_PreContadores_1
                                                    WHERE        (IDDossier IS NOT NULL)) AS DosieresInvolucrado_1
                          GROUP BY IDUSUARIO) AS DosieresInvolucrado INNER JOIN
                         dbo.Users ON DosieresInvolucrado.IDUSUARIO = dbo.Users.ID
' 
GO
/****** Object:  View [dbo].[ContadoresRecibidas]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ContadoresRecibidas]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ContadoresRecibidas]
AS
SELECT        idUsuarioPK AS IDUsuario, SUM(RecibidasEnTramite) AS Recibidas_EnTramite, SUM(RecibidasErroneas) AS Recibidas_Erroneas, SUM(RecibidasPendientes) AS Recibidas_Pendientes, SUM(RecibidasTodas) 
                         AS Recibidas_Todas
FROM            dbo.Solicitudes_PreContadores
GROUP BY idUsuarioPK
HAVING        (NOT (idUsuarioPK IS NULL))
' 
GO
/****** Object:  View [dbo].[Solicitudes_Todas_Con_Completadas_DeDuped]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Solicitudes_Todas_Con_Completadas_DeDuped]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Solicitudes_Todas_Con_Completadas_DeDuped]
AS
SELECT        IdRequest, IDState, IDUSUARIO, MIN(PASOACTIVO) AS PASOACTIVO, IDPetitioner, MIN(Paso_Completado) AS Paso_Completado, IDDossier
FROM            dbo.SOLICITUDES_TODAS_CON_COMPLE_1
GROUP BY IdRequest, IDState, IDUSUARIO, IDPetitioner, IDDossier
' 
GO
/****** Object:  View [dbo].[ViewCounterSignatureByType]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewCounterSignatureByType]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ViewCounterSignatureByType]
AS
SELECT TOP (100) PERCENT IDAccGroup, IdSignatureType, SUM(SignatureCount) AS SignatureCount
FROM   (SELECT a.IDAccGroup, swfi.IdSignatureType, COUNT(a.ID) AS SignatureCount
             FROM    dbo.AccGroup AS acc INNER JOIN
                           dbo.Actions AS a ON a.IDAccGroup = acc.Id AND a.ActionDate >= acc.CreateDate INNER JOIN
                           dbo.StepsWFI AS swfi ON a.IDStepWFI = swfi.ID AND a.IDActionType = 1
             GROUP BY a.IDAccGroup, swfi.IdSignatureType
             UNION
             SELECT a.IDAccGroup, 4 AS IdSignatureType, COUNT(a.ID) AS SignatureCount
             FROM   dbo.AccGroup AS acc INNER JOIN
                          dbo.Actions AS a ON a.IDAccGroup = acc.Id AND a.ActionDate >= acc.CreateDate AND a.IDActionType = 29
             GROUP BY a.IDAccGroup
             UNION
             SELECT a.IDAccGroup, e.IDSignatureTypes AS IdSignatureType, COUNT(a.ID) AS SignatureCount
             FROM   dbo.AccGroup AS acc INNER JOIN
                          dbo.Actions AS a ON a.IDAccGroup = acc.Id AND a.ActionDate >= acc.CreateDate INNER JOIN
                          dbo.ExternalSignatures AS e ON a.IDExternalSingnatures = e.Id AND a.IDActionType = 1
             GROUP BY a.IDAccGroup, e.IDSignatureTypes) AS ts where  ts.IdSignatureType is not null
GROUP BY ts.IDAccGroup, ts.IdSignatureType 
' 
GO
/****** Object:  View [dbo].[Solicitudes_Todas_con_Completadas_DesduplicadoGruposPasos]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Solicitudes_Todas_con_Completadas_DesduplicadoGruposPasos]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Solicitudes_Todas_con_Completadas_DesduplicadoGruposPasos]
AS
SELECT        IdRequest, IDState, IDUSUARIO, Paso_Completado, PASOACTIVO, IDPetitioner, IDDossier
FROM            dbo.SOLICITUDES_TODAS_CON_COMPLE_1
GROUP BY IdRequest, IDState, IDUSUARIO, IDPetitioner, IDDossier, Paso_Completado, PASOACTIVO
' 
GO
/****** Object:  View [dbo].[ContadoresAdmin]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ContadoresAdmin]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ContadoresAdmin]
AS
SELECT   dbo.Users.ID AS IdUsuario, COUNT(dbo.SignRequests.ID) AS TotalSolicitudes
FROM         dbo.SignRequests CROSS JOIN
                         dbo.Users
WHERE     (dbo.SignRequests.IDState <> 1) AND (dbo.SignRequests.Deleted = 0) AND (dbo.SignRequests.IDState <> 8) AND (dbo.SignRequests.IDState <> 9)
GROUP BY dbo.Users.ID




' 
GO
/****** Object:  Table [dbo].[Licenses]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Licenses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Licenses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SignUser] [bigint] NULL,
	[SizeUser] [bigint] NULL,
	[Template] [bigint] NULL,
 CONSTRAINT [PK__Licenses__3214EC2700A98AA9] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetLocationsNameMaster]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetLocationsNameMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetLocationsNameMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdWidgetLocationsMaster] [int] NOT NULL,
	[IdAccGroup] [int] NULL,
	[IdTemplateMaster] [int] NULL,
 CONSTRAINT [PK_WidgetLocationsNameMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewCounterAllAccGroup]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewCounterAllAccGroup]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ViewCounterAllAccGroup]
as

select    ACCG.Id Id,accg.Name,accg.CreateDate TenantCreateDate,
CAST(ISNULL(firmadas.Sign,0) AS bigint)   CountSign, 
CAST(ISNULL(enviadas.Send,0) AS bigint) CountSend,

CAST(ISNULL(ISNULL(enviadas.Send,0)+ISNULL(firmadas.Sign,0),0) AS bigint) CountSignSend,

CAST(ISNULL(tamaño.Size,0) AS bigint)      CountSize,
CAST(ISNULL(SMS.Sms,0) AS bigint)     CountSmsOTP ,
CAST(ISNULL(Nusers.Users,0)AS bigint)  CountUsers    ,
CAST( ISNULL(Template.Templates,0) AS bigint)      CountTemplates,
l.name NameLicense
,ACCG.IdLicense,ISNULL( ACCG.Logo,'''') Logo,ACCG.IDLanguage,TenantExpiredDate,TenantGracePeriodDate, LimitUser, ExtraUser
,
CAST(ISNULL(report.Sign,0) AS bigint)     CountSignaturesReport,
CAST(ExtraSign AS bigint) ExtraSign,

CAST(LimitSign AS bigint) LimitSign, 
CAST(ExtraSMS AS bigint) ExtraSMS, 
CAST(LimitSMS AS bigint) LimitSMS, 
CAST(LimitFileStorage AS bigint)  LimitFileStorage,
CAST( ExtraFileStorage  AS bigint) ExtraFileStorage,
CAST( ExtraTemplates  AS bigint) ExtraTemplates,

LimitTemplates,
ISNULL(DoubleFactorAuthTypeForUsers,0)IdDoubleFactorAuthTypeForUsers,ISNULL(CommercialName,'''')CommercialName,ISNULL(CommercialSurname,'''')CommercialSurname,
ISNULL(CommercialEmail,'''')CommercialEmail,ISNULL(CommercialMobile,'''')CommercialMobile


from accgroup accg

left join( /*****FIRMAS REALIZADAS****/ 
		select  count(a.ID) ''Sign'',IDAccGroup id      
		from  Actions a
			inner join AccGroup ag
			on ag.Id=a.IDAccGroup
 			where a.[ActionDate]>=ag.[CreateDate] and a.[IDActionType] in(1,29) --fecha de accion tope de la licencia
			group by IDAccGroup 	      
) AS firmadas     on firmadas.id=accg.Id

left join( /*****FIRMAS REPORT****/ 
		select  count(a.ID) ''Sign'',IDAccGroup id      
		from  Actions a
			inner join AccGroup ag
			on ag.Id=a.IDAccGroup
 			where a.[ActionDate]>=ag.[CreateDate] and a.[IDActionType] in(29) --fecha de accion tope de la licencia
			group by IDAccGroup 	      
) AS report     on report.id=accg.Id
left join /*****SOLO FIRMAS ENVIADAS****/ 
(       
SELECT count(w.id) ''Send'',s.idaccgroup id FROM [dbo].[SrDocumentsStepsWFI] sr
		INNER JOIN [dbo].[StepsWFI] st ON st.id =sr.[IDStepWFI] 
		left join WidgetWF w on w.[IdSrDocumentsStepWFI] = sr.id
		inner join [dbo].[SignRequests] s on s.id = sr.[IDSignRequest]
		where	
		 s.[IDState]=3
		and st.IDActionType = 1 
		and st.[Completed]=0	
		and w.[IDFormWidget] is null
		group by s.idaccgroup    
) enviadas on enviadas.Id=accg.Id
left join 	/*****TAMAÑO POR EMPRESA CONSUMIDO****/
(

		select sum(size) Size, Id  from 
	( 
		select sum(size) size,IDAccGroup id
		from  SrDocuments sd 
		left join Documents d 
		on sd.IDDocument=d.id
		left join SignRequests  s on s.id=sd.IDSignRequest
		group by s.IDAccGroup 
		union
		select sum(size) size,IDAccGroup id from DocumentsDrafts d 
		inner join SrDocumentsDrafts sd  on sd.IDDocumentDraft=d.id
		inner join SignRequestsDrafts  s on s.id=sd.IDSignRequestDraft
		group by s.IDAccGroup 
		union
		select sum(size) size, IDAccGroup id
		from [ExternalSignatures]  ex 
		left join   Documents d 
		on ex.IDDocuments=d.id 
		where ex.IDDocuments is not null 
		group by ex.IDAccGroup 
	) as size group by id
 
) as tamaño on tamaño.ID= accg.Id
left join 	/*****OTP SMS consumidos****/
(
		select  count(a.ID) Sms,IDAccGroup id from Actions a
		inner join AccGroup ag on ag.Id=a.IDAccGroup and IDActionType=25  
		where a.ActionDate>=ag.CreateDate
		group by IDAccGroup

)as  SMS on SMS.Id=  accg.ID


 left join --USUARIOS
(
		select  count(u.ID) Users,IDAccGroup id from Users u
		left join AccGroup ag on ag.Id=u.IDAccGroup  
		where   u.[Enabled]=1
		group by IDAccGroup
 )as  Nusers on Nusers.Id=  accg.ID

 left join --PLANTILLAS
(
 		select  count( ID) Templates,IDAccGroup id from  
		[dbo].[WidgetLocationsNameMaster]
		where   IDAccGroup is not null
		group by IDAccGroup
)as  Template on Template.Id=  accg.ID
		left join   [Licenses]  l
		on l.Id=  accg.[IDLicense]

' 
GO
/****** Object:  Table [HangFire].[State]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[State]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewBackgroundTasksStatus]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewBackgroundTasksStatus]'))
EXEC dbo.sp_executesql @statement = N'
 


CREATE VIEW [dbo].[ViewBackgroundTasksStatus]
AS
SELECT JobId AS TaskId, Name AS StateName, Reason, CreatedAt AS StateDate
FROM   HangFire.State

 

' 
GO
/****** Object:  View [dbo].[ViewUsersLookUp]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewUsersLookUp]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ViewUsersLookUp]
AS
SELECT u.ID, u.Name, u.Login, acc.Id AS IdAccGroup
FROM   dbo.Users AS u INNER JOIN
             dbo.AccGroup AS acc ON u.IdAccGroup = acc.Id
' 
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[Job]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[JobParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewBackgroundTasks]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewBackgroundTasks]'))
EXEC dbo.sp_executesql @statement = N' 

CREATE VIEW [dbo].[ViewBackgroundTasks]
AS

 

SELECT j.Id AS TaskId, jpTName.Value AS TaskName, j.StateName, jp.Value AS [User], j.CreatedAt, j.ExpireAt, jpTOptF.[Value] as OptionalFields 
FROM   HangFire.JobParameter AS jp LEFT OUTER JOIN
             HangFire.JobParameter AS jpTName ON jp.JobId = jpTName.JobId AND jpTName.Name = ''TaskName'' left JOIN
             HangFire.JobParameter AS jpTOptF ON jp.JobId = jpTOptF.JobId AND jpTOptF.Name = ''OptionalFields'' INNER JOIN
             HangFire.Job AS j ON jp.JobId = j.Id AND jp.Name = ''User''
' 
GO
/****** Object:  Table [dbo].[AccGroupExtraFields]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccGroupExtraFields]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccGroupExtraFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdAccGroup] [int] NOT NULL,
	[Key] [varchar](200) NOT NULL,
	[Value] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[IsKey] [bit] NOT NULL,
	[isVisible] [bit] NOT NULL,
 CONSTRAINT [PK_AccGroupExtraFields_1] PRIMARY KEY CLUSTERED 
(
	[IdAccGroup] ASC,
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewAccGroupLookUp]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewAccGroupLookUp]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ViewAccGroupLookUp]
AS
SELECT 
  acc.Id
  ,acc.Name 
  ,ExternalId = STUFF((
          SELECT '' | '' + accxtr.Value
          FROM [AccGroupExtraFields] accxtr 
          WHERE acc.Id = accxtr.IdAccGroup and accxtr.IsKey = 1
          FOR XML PATH(''''), TYPE).value(''.'', ''NVARCHAR(MAX)''), 1, 1, '''')
  FROM 
  dbo.[AccGroup] acc;
' 
GO
/****** Object:  Table [dbo].[DocumentumMigration]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentumMigration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentumMigration](
	[IdDocument] [int] NOT NULL,
	[IdDocumentumState] [int] NOT NULL,
 CONSTRAINT [PK_DocumentumMigration] PRIMARY KEY CLUSTERED 
(
	[IdDocument] ASC,
	[IdDocumentumState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewDocumentumOld]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewDocumentumOld]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ViewDocumentumOld]  
AS with UnionTable as  
(

select d.id,sr.CreatedDate CreatedDate,u.[IdAccGroup] AccGroup,dm.[IdDocumentumState] DocumentumState from [Documents]  d
left join  [DocumentumMigration] dm on dm.iddocument=d.id
inner join  [dbo].[SrDocuments] srd on srd.[IDDocument]  = d.id -- and srd.[IDDocument] not in  (select [IDDocument]from [dbo].[SrDocumentsStepsWFI] )
inner join   [dbo].[SignRequests] sr on sr.id = srd.[IDSignRequest] 
inner join [dbo].[Users] u on  u.id= sr.[CreateUser]
where   dm.[IdDocumentumState]!=4 or dm.iddocument is  null and sr.[IDState]=12
union all
select d.id,sr.CreatedDate CreatedDate,u.[IdAccGroup] AccGroup,dm.[IdDocumentumState] DocumentumState  from [Documents]  d
left join  [DocumentumMigration] dm on dm.iddocument=d.id
inner join  [dbo].[SrDocumentsStepsWFI] srd on srd.[IDDocument]  = d.id -- and srd.[IDDocument] not in  (select [IDDocument]from [dbo].[SrDocuments] )
inner join   [dbo].[SignRequests] sr on sr.id = srd.[IDSignRequest] 
inner join [dbo].[Users] u on  u.id= sr.[CreateUser]
where   dm.[IdDocumentumState]!=4 or dm.iddocument is  null and sr.[IDState]=12
)
  SELECT distinct id,CreatedDate,AccGroup,DocumentumState   FROM UnionTable --  order by id 
' 
GO
/****** Object:  View [dbo].[ViewDocumentum]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewDocumentum]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ViewDocumentum]   
AS with UnionTable as  
(

select d.id,sr.CreatedDate CreatedDate,u.[IdAccGroup] AccGroup,dm.[IdDocumentumState] DocumentumState from [Documents]  d
left join  [DocumentumMigration] dm on dm.iddocument=d.id
inner join  [dbo].[SrDocuments] srd on srd.[IDDocument]  = d.id -- and srd.[IDDocument] not in  (select [IDDocument]from [dbo].[SrDocumentsStepsWFI] )
inner join   [dbo].[SignRequests] sr on sr.id = srd.[IDSignRequest] 
inner join [dbo].[Users] u on  u.id= sr.[CreateUser]
where   dm.[IdDocumentumState]!=4 or dm.iddocument is  null and sr.[IDState]=12
 
)
  SELECT distinct id,CreatedDate,AccGroup,DocumentumState   FROM UnionTable --  order by id ' 
GO
/****** Object:  Table [dbo].[ActionTypes]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ActionTypes](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShowInCertificatedReport] [bit] NOT NULL,
 CONSTRAINT [PK_ActionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[States]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[States]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[States](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Steps]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Steps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Steps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDActionType] [int] NOT NULL,
	[IDUser] [int] NULL,
	[IDContact] [int] NULL,
	[IDSuggestedContact] [int] NULL,
	[Order] [int] NULL,
	[IDWF] [int] NOT NULL,
	[IDGroup] [int] NULL,
	[GroupSignsRequired] [int] NULL,
	[WorkFlowStepType] [int] NOT NULL,
 CONSTRAINT [PK_Steps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SuggestedContacts]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SuggestedContacts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SuggestedContacts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](100) NULL,
	[NIF] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Position] [nvarchar](1000) NULL,
	[Company] [nvarchar](1000) NULL,
	[Country] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SuggestedContacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WFActionType]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WFActionType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WFActionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_WFActionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[Report]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[MultiSignRequestDraftFileContents]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFileContents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MultiSignRequestDraftFileContents](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMultiSignRequestDraftFiles] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[RowIndex] [int] NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_MultiSignRequestDraftFileContents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MultiSignRequestDraftFiles]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MultiSignRequestDraftFiles](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSignRequestDraft] [bigint] NOT NULL,
	[FileName] [nvarchar](150) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[IdWFActionType] [int] NOT NULL,
	[IdSignatureType] [int] NULL,
 CONSTRAINT [PK_MultiSignRequestDraftFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MultiSignRequestDraftFileContentErrors]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFileContentErrors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MultiSignRequestDraftFileContentErrors](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMultiSignRequestDraftFiles] [bigint] NULL,
	[RowIndex] [int] NOT NULL,
	[ColumnName] [nvarchar](20) NOT NULL,
	[ResourceKey] [nvarchar](50) NULL,
	[Parameters] [nvarchar](150) NULL,
 CONSTRAINT [PK_MultiSignRequestDraftFileContentErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewMultiSRFileContentResult]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewMultiSRFileContentResult]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ViewMultiSRFileContentResult]
AS
SELECT f.IdSignRequestDraft, f.FileName, c.RowIndex, c.Name, c.Email, c.Phone, c.Status,
       COUNT(e_name.ID) AS NameErrors, COUNT(e_mail.ID) AS EmailErrors, COUNT(e_mobile.ID) AS MobileErrors,
       CAST( CASE WHEN COUNT(*) OVER (PARTITION BY f.IdSignRequestDraft, f.FileName, c.Email) > 1 THEN 1 ELSE 0 END AS BIT)AS IsEmailDuplicate
FROM dbo.MultiSignRequestDraftFiles AS f
INNER JOIN dbo.MultiSignRequestDraftFileContents AS c ON f.ID = c.IdMultiSignRequestDraftFiles
LEFT OUTER JOIN dbo.MultiSignRequestDraftFileContentErrors AS e_name ON c.IdMultiSignRequestDraftFiles = e_name.IdMultiSignRequestDraftFiles AND c.RowIndex = e_name.RowIndex AND e_name.ColumnName = ''Name''
LEFT OUTER JOIN dbo.MultiSignRequestDraftFileContentErrors AS e_mail ON c.IdMultiSignRequestDraftFiles = e_mail.IdMultiSignRequestDraftFiles AND c.RowIndex = e_mail.RowIndex AND e_mail.ColumnName = ''Email''
LEFT OUTER JOIN dbo.MultiSignRequestDraftFileContentErrors AS e_mobile ON c.IdMultiSignRequestDraftFiles = e_mobile.IdMultiSignRequestDraftFiles AND c.RowIndex = e_mobile.RowIndex AND e_mobile.ColumnName = ''Mobile''
GROUP BY f.IdSignRequestDraft, f.FileName, c.Name, c.Email, c.Phone, c.Status, c.RowIndex, e_name.ColumnName, e_mail.ColumnName, e_mobile.ColumnName
' 
GO
/****** Object:  View [dbo].[ViewPendingRequestStepRanked]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewPendingRequestStepRanked]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ViewPendingRequestStepRanked]
AS
with swfi_ranked as (
select
swfi.ID as SwfId,
swfi.Email,
wfi.IDRequest,
DENSE_RANK() over (partition by IDWFI order by [Order]) as Rank
FROM [dbo].[StepsWFI] swfi
inner join [dbo].[WFInstance] wfi on wfi.ID = swfi.IDWFI
inner join [dbo].[SignRequests] sr on
sr.ID = wfi.IDRequest
and sr.IDState = 3
and swfi.Completed = 0)
Select IDRequest,SwfId, Email, Rank FROM swfi_ranked;
' 
GO
/****** Object:  Table [dbo].[MessageCategory]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MessageCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MessageCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MessageCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Messages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Messages](
	[IdMessage] [int] IDENTITY(1,1) NOT NULL,
	[MessageTittle] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[idMessageType] [int] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[DateEnd] [datetime] NULL,
	[IsNew] [bit] NULL,
	[ExternalRef] [varchar](255) NULL,
	[NotVisible] [bit] NULL,
	[IdMessageCategory] [int] NOT NULL,
	[VisibleOnlyRegUser] [bit] NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[IdMessage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MesssageType]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MesssageType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MesssageType](
	[idMessageType] [int] NOT NULL,
	[MessageType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMensaje] PRIMARY KEY CLUSTERED 
(
	[idMessageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ViewMessages]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewMessages]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ViewMessages]
AS
SELECT m.IdMessage, m.DateStart AS NotificationDate, m.DateEnd AS ExpirationDate, m.MessageTittle AS MessageTitle, m.Message AS MessageBody, m.VisibleOnlyRegUser as VisibleOnlyRegUser ,mt.idMessageType AS IdType, mt.MessageType AS Type, mc.Id AS IdCategory, mc.Category
FROM   dbo.Messages AS m INNER JOIN
             dbo.MessageCategory AS mc ON m.IdMessageCategory = mc.Id INNER JOIN
             dbo.MesssageType AS mt ON m.idMessageType = mt.idMessageType
' 
GO
/****** Object:  Table [dbo].[AccGroupSignatureTypes]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccGroupSignatureTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccGroupSignatureTypes](
	[IDAccGroup] [int] NOT NULL,
	[IDSignatureTypes] [int] NOT NULL,
 CONSTRAINT [PK_D] PRIMARY KEY CLUSTERED 
(
	[IDAccGroup] ASC,
	[IDSignatureTypes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AccGroupSSO_SAML]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccGroupSSO_SAML]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccGroupSSO_SAML](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdAccGroup] [int] NOT NULL,
	[IdType] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[X509Certificate] [varchar](max) NULL,
	[SAMLFederationMetadata] [varchar](max) NULL,
	[IdPIdentifier] [varchar](max) NOT NULL,
	[IdPLoginUrl] [varchar](max) NULL,
	[IdPLogoutUrl] [varchar](max) NULL,
	[SAMLIdentifier] [varchar](500) NOT NULL,
	[SAMLLoginUrl] [varchar](max) NOT NULL,
	[SAMLLogoutUrl] [varchar](max) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_AccGroupSSO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ActionOTPTypes]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionOTPTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ActionOTPTypes](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_ActionOTPTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ActionReasons]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionReasons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ActionReasons](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_ActionReasons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attachments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Document] [nvarchar](250) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IDDocType] [int] NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AttachmentsDossiers]    Script Date: 18/01/2023 18:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AttachmentsDossiers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AttachmentsDossiers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Document] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IDDocType] [nvarchar](max) NULL,
	[DossierID] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[ModifiedDate] [nvarchar](250) NULL,
 CONSTRAINT [PK_AttachmentsDossiers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AttachmentSigRequests]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AttachmentSigRequests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AttachmentSigRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSignRequest] [int] NOT NULL,
	[IDAttachment] [int] NOT NULL,
 CONSTRAINT [PK_AttachmentSigRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attributes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](1000) NOT NULL,
	[InternalValue] [nvarchar](1000) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AUDIT]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUDIT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AUDIT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Datetime] [datetime] NOT NULL,
	[IdCategory] [int] NOT NULL,
	[IdUser] [int] NULL,
	[IdTarget] [bigint] NULL,
	[IdOperationType] [int] NULL,
	[Description] [varchar](max) NULL,
	[QuerySql] [varchar](max) NULL,
	[Success] [bit] NULL,
	[IpClientAdress] [nvarchar](20) NULL,
	[UserAgent] [varchar](max) NULL,
	[Field] [varchar](max) NULL,
	[OldValue] [varchar](max) NULL,
	[NewValue] [varchar](max) NULL,
 CONSTRAINT [PK_AUDIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AutenticationTypes]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AutenticationTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AutenticationTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AutenticationTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AuthMethod]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthMethod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuthMethod](
	[idAuthMethod] [int] IDENTITY(1,1) NOT NULL,
	[AuthMethodName] [nvarchar](50) NOT NULL,
	[AuthType] [nvarchar](10) NULL,
	[Server] [nvarchar](250) NULL,
	[LDAPQuery] [nvarchar](250) NULL,
	[AppToken] [nvarchar](250) NULL,
	[AppAuthToken] [nvarchar](250) NULL,
	[CertificateName] [nvarchar](250) NULL,
	[CertificateBinary] [nvarchar](250) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_AuthMethod] PRIMARY KEY CLUSTERED 
(
	[idAuthMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AutomatedSendProperties]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AutomatedSendProperties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AutomatedSendProperties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdWidgetFeature] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[IdActionType] [int] NOT NULL,
	[IdSignatureType] [int] NULL,
	[Editable] [bit] NOT NULL,
	[IdSuggestedContact] [int] NULL,
	[IdContact] [int] NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_AutomatedSendProperties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BackgroundServiceMonitor]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BackgroundServiceMonitor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BackgroundServiceMonitor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IDProcess] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[TypeLog] [nvarchar](6) NOT NULL,
	[IDEntity] [bigint] NULL,
	[IDCategory] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_BackgroundServiceMonitor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BackgroundServiceProcess]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BackgroundServiceProcess]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BackgroundServiceProcess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ServiceName] [nvarchar](200) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_BackgroundServiceProcess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BillDocuments]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillDocuments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BillDocuments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](500) NULL,
	[BillType] [nvarchar](20) NULL,
	[DocumentName] [nvarchar](500) NULL,
	[DossierURL] [nvarchar](500) NULL,
	[BillID] [nvarchar](500) NULL,
 CONSTRAINT [PK_BillDocuments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CategoriesAUDIT]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriesAUDIT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoriesAUDIT](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[HasOptionalFields] [bit] NOT NULL,
 CONSTRAINT [PK_CategoriesAUDIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Commitment]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Commitment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Commitment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Enabled] [bit] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Table_1_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Company]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Icon] [nvarchar](250) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CompanyHistorical]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyHistorical]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CompanyHistorical](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [varchar](255) NULL,
	[IDAccgroup] [int] NOT NULL,
	[IDLanguage] [int] NOT NULL,
	[IDLicense] [int] NOT NULL,
	[LimitUser] [bigint] NULL,
	[ExtraUser] [bigint] NULL,
	[LimitSign] [bigint] NULL,
	[ExtraSign] [bigint] NULL,
	[LimitSMS] [bigint] NULL,
	[ExtraSMS] [bigint] NULL,
	[LimitFileStorage] [bigint] NULL,
	[ExtraFileStorage] [bigint] NULL,
	[LimitTemplates] [bigint] NULL,
	[ExtraTemplates] [bigint] NULL,
	[IDOperationTypes] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[Coment] [varchar](max) NULL,
	[ExecutionDate] [datetime] NOT NULL,
	[BeforeCounttemplate] [bigint] NULL,
 CONSTRAINT [PK_CompanyHistorical] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ConfigProperties]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConfigProperties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConfigProperties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDParams] [int] NOT NULL,
	[IDSignedP] [int] NOT NULL,
	[Font] [varchar](20) NULL,
	[Color] [varchar](20) NULL,
	[Size] [varchar](20) NULL,
 CONSTRAINT [PK_ConfigProperties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ConfigWeb]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConfigWeb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConfigWeb](
	[Lowlevel] [bigint] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BlockchainLevel] [bit] NULL,
 CONSTRAINT [PK_ConfigWeb] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contacts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contacts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](100) NULL,
	[NIF] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Position] [nvarchar](1000) NULL,
	[Company] [nvarchar](1000) NULL,
	[Country] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Countrys]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Countrys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Countrys](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Countrys] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsAdmin]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsAdmin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdAccGroup] [int] NOT NULL,
	[IdCategory] [int] NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[Editable] [bit] NOT NULL,
	[Required] [bit] NOT NULL,
	[DefaultValue] [varchar](max) NULL,
	[ShowInWidget] [bit] NULL,
	[IdCustomFieldsAdminType] [int] NOT NULL,
 CONSTRAINT [PK_CustomFieldAdmin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [_CustomFieldsAdmin] UNIQUE NONCLUSTERED 
(
	[IdAccGroup] ASC,
	[IdCategory] ASC,
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomFieldsAdmin] UNIQUE NONCLUSTERED 
(
	[IdAccGroup] ASC,
	[IdCategory] ASC,
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsAdminPlaces]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminPlaces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsAdminPlaces](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdCategory] [int] NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_CustomFieldsAdminPlaces] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsAdminSetPlaces]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminSetPlaces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsAdminSetPlaces](
	[IdCFAdmin] [int] NOT NULL,
	[IdCFAPlaces] [int] NOT NULL,
 CONSTRAINT [PK_CustomFieldsAdminSetPlaces] PRIMARY KEY CLUSTERED 
(
	[IdCFAdmin] ASC,
	[IdCFAPlaces] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsAdminShowValues]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminShowValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsAdminShowValues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[Disabled] [bit] NOT NULL,
	[Hidden] [bit] NOT NULL,
	[SelectDefault] [bit] NOT NULL,
	[IdCustomFieldsAdmin] [int] NOT NULL,
 CONSTRAINT [PK_CustomFieldsAdminShowValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsAdminType]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsAdminType](
	[ID] [int] NOT NULL,
	[Type] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsDocuments]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocuments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsDocuments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdSrDocumentsStepsWFI] [int] NOT NULL,
	[IdField] [int] NOT NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_CustomFieldDocuments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsDocumentsDrafts]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocumentsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsDocumentsDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdSrDocumentDraft] [int] NOT NULL,
	[IdField] [int] NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_CustomFieldDocumentsDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsExternalSignature]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsExternalSignature]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsExternalSignature](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdExternalSignature] [int] NOT NULL,
	[IdField] [int] NOT NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_CustomFieldsExternalSignature] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsRequests]    Script Date: 18/01/2023 18:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdSignRequest] [int] NULL,
	[IdField] [int] NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_CustomFieldRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_CustomFieldsRequests] UNIQUE NONCLUSTERED 
(
	[IdField] ASC,
	[IdSignRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsRequestsDrafts]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequestsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsRequestsDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdSignRequestDraft] [bigint] NOT NULL,
	[IdField] [int] NOT NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_CustomFieldRequestsDraft] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsStepsDrafts]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsStepsDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdStepDraft] [bigint] NULL,
	[idField] [int] NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_CustomFieldStepsDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomFieldsStepsWFI]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsWFI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomFieldsStepsWFI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdStepWFI] [int] NULL,
	[IdField] [int] NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_CustomFieldsStepsWFI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomLogInfo]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomLogInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomLogInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Date] [varchar](20) NOT NULL,
	[Time] [varchar](20) NOT NULL,
	[UserLogin] [varchar](50) NULL,
	[MethodName] [varchar](200) NULL,
	[Params] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Message] [varchar](max) NULL,
	[InnerException] [varchar](max) NULL,
	[MethodNameEx] [varchar](max) NULL,
	[StackTrace] [varchar](max) NULL,
	[MessageInner] [varchar](max) NULL,
	[InnerExceptionInner] [varchar](max) NULL,
	[MethodNameExInner] [varchar](max) NULL,
	[StackTraceInner] [varchar](max) NULL,
	[Type] [varchar](20) NULL,
	[Request] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomLogInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DateFormat]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DateFormat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DateFormat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Format] [varchar](20) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_DateFormats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DelegatesProfiles]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DelegatesProfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DelegatesProfiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProfile] [int] NOT NULL,
	[IDDelegate] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[DateStart] [nvarchar](50) NOT NULL,
	[DateEnd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DelegatesProfiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DelegatesUsers]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DelegatesUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DelegatesUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDDelegate] [int] NOT NULL,
 CONSTRAINT [PK_DelegatesUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DelegateUsersProfiles]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DelegateUsersProfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DelegateUsersProfiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProfile] [int] NOT NULL,
	[IDDelegate] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
 CONSTRAINT [PK_DelegateUsersProfiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[DocumentSignFormat]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentSignFormat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentSignFormat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSignFormat] [int] NOT NULL,
	[IDDocumentType] [int] NOT NULL,
 CONSTRAINT [PK_DocumentSignFormat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DocumentumMigrationStates]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentumMigrationStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentumMigrationStates](
	[ID] [int] NOT NULL,
	[Name] [varchar](15) NOT NULL,
 CONSTRAINT [PK_DocumentumMigrationStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Domains]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Domains]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Domains](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Domains] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DossierActions]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DossierActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DossierActions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[IDDossier] [int] NOT NULL,
	[IDActionType] [int] NOT NULL,
	[IDActionReason] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
 CONSTRAINT [PK_DossierActions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DossierStates]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DossierStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DossierStates](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DossierStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DossierTypes]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DossierTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DossierTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_DossierTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DoubleFactorAuthTypes]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoubleFactorAuthTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DoubleFactorAuthTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DoubleFactorAuthTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Entities]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Entities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Entities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FirVoxConfigurations]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FirVoxConfigurations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAtr_Firvox_SigPage] [int] NOT NULL,
	[IDAtr_Firvox_PageLocation] [int] NOT NULL,
	[IDAtr_Firvox_Orientation] [int] NOT NULL,
	[SignAllPages] [bit] NOT NULL,
	[IDSignRequest] [int] NOT NULL,
 CONSTRAINT [PK_FirVoxConfigurations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FontColor]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FontColor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FontColor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_ColorFormat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FontFamily]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FontFamily]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FontFamily](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Family] [nvarchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_FamilyFormat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FontFormat]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FontFormat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FontFormat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FontSize] [decimal](3, 1) NOT NULL,
	[IDFontFamily] [int] NOT NULL,
	[FontColor] [varchar](10) NOT NULL,
	[Bold] [bit] NOT NULL,
	[Italic] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_FontFormat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FontSize]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FontSize]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FontSize](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Size] [decimal](3, 1) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_SizeFormat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormWidget]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormWidget]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormWidget](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDDateFormat] [int] NULL,
	[Label] [bit] NOT NULL,
	[Value] [nvarchar](50) NULL,
	[LabelName] [varchar](300) NULL,
	[PlaceHolder] [nvarchar](50) NULL,
	[IDFontFormat] [int] NOT NULL,
	[IDWidgetType] [int] NOT NULL,
	[IDWidgetTemplate] [int] NOT NULL,
	[LabelImage] [varbinary](max) NULL,
	[IdFormWidgetGroup] [int] NULL,
	[IdFormWidgetDirection] [int] NULL,
	[IDFormWidgetMandatoryType] [int] NOT NULL,
 CONSTRAINT [PK_FormWidgets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormWidgetDirection]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormWidgetDirection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormWidgetDirection](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FormWidgetDirection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormWidgetGroups]    Script Date: 18/01/2023 18:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormWidgetGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormWidgetGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaxSelection] [int] NOT NULL,
 CONSTRAINT [PK_FormWidgetGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormWidgetMandatoryType]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormWidgetMandatoryType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormWidgetMandatoryType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormWidgetsDraft]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormWidgetsDraft](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDDateFormat] [int] NULL,
	[Label] [bit] NOT NULL,
	[Value] [nvarchar](50) NULL,
	[LabelName] [varchar](300) NULL,
	[PlaceHolder] [nvarchar](50) NULL,
	[IDFontFormat] [int] NOT NULL,
	[IDWidgetTemplate] [int] NOT NULL,
	[IDWidgetType] [int] NOT NULL,
	[LabelImage] [varbinary](max) NULL,
	[IdFormWidgetGroup] [int] NULL,
	[IdFormWidgetDirection] [int] NULL,
	[IDFormWidgetMandatoryType] [int] NOT NULL,
 CONSTRAINT [PK_FormWidgetsDraft] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormWidgetTemplate]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormWidgetTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWidgetType] [int] NOT NULL,
	[IDDateFormat] [int] NULL,
	[IDFontFormat] [int] NULL,
	[Label] [bit] NOT NULL,
	[LabelEdit] [bit] NOT NULL,
	[LabelName] [varchar](300) NULL,
	[PlaceHolderEdit] [bit] NOT NULL,
	[PlaceHolder] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DefaultValue] [nvarchar](50) NULL,
	[Enabled] [bit] NOT NULL,
	[Identifier] [nvarchar](50) NULL,
	[ShowOrder] [int] NULL,
	[LabelImage] [varbinary](max) NULL,
	[IdFormWidgetGroup] [int] NULL,
	[IdFormWidgetDirection] [int] NULL,
	[IDFormWidgetMandatoryType] [int] NOT NULL,
	[IdAccGroup] [int] NULL,
	[IdSignRequestDraft] [bigint] NULL,
 CONSTRAINT [PK_FormWidgetTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[endDate] [datetime] NULL,
	[Enabled]  AS (CONVERT([bit],case isnull([EndDate],(0)) when (0) then (1) else (0) end,(0))),
	[Shared] [bit] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HtmlTemplates]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HtmlTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HtmlTemplates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[InnerHtml] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IntegratorKeys]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IntegratorKeys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IntegratorKeys](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[IntegratorName] [varchar](250) NOT NULL,
	[IntegratorGUID] [varchar](250) NOT NULL,
	[ProductName] [varchar](250) NOT NULL,
	[ProductGUID] [varchar](250) NOT NULL,
	[DescKey] [varchar](500) NOT NULL,
	[User] [varchar](100) NULL,
	[Password] [varchar](500) NULL,
	[IdAuthenticationType] [int] NOT NULL,
	[HeaderName] [varchar](100) NULL,
	[KeyCode] [varchar](500) NOT NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_IntegratorKeys] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Languages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Languages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_Languajes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Location]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoginTries]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginTries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoginTries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Datetime] [datetime] NOT NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_LoginTries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MetadataProfiles]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetadataProfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetadataProfiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProfile] [int] NOT NULL,
	[IDMetadata] [int] NOT NULL,
 CONSTRAINT [PK_MetadataProfiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Metadatas]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Metadatas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Metadatas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Metadatas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MetadataSigRequests]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetadataSigRequests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetadataSigRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDMetadata] [int] NOT NULL,
	[IDSignRequest] [int] NOT NULL,
	[Value] [binary](4000) NOT NULL,
 CONSTRAINT [PK_MetadataSigRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Notifications](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IDType] [int] NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NotificationsConfigs]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NotificationsConfigs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NotificationsConfigs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SmtpServer] [nvarchar](255) NULL,
	[SmtpLogin] [nvarchar](255) NULL,
	[SmtpPassword] [nvarchar](100) NULL,
	[Email] [nvarchar](255) NULL,
	[SmtpPort] [int] NULL,
	[UseCredentials] [bit] NULL,
	[EnableSSL] [bit] NULL,
	[IDAccGroup] [int] NULL,
 CONSTRAINT [PK_NotificationsConfigs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_NotificationsConfigs] UNIQUE NONCLUSTERED 
(
	[IDAccGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OperationTypes]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OperationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OperationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OtpActions]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OtpActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OtpActions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAccGroup] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDActionOTPTypes] [int] NOT NULL,
	[IDOTPState] [int] NOT NULL,
	[InstanceOTP] [varchar](max) NOT NULL,
	[GenerationDate] [datetime] NOT NULL,
	[Email] [varchar](100) NULL,
	[Telephone] [varchar](15) NULL,
	[Tries] [int] NULL,
 CONSTRAINT [PK_OtpActions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OtpStates]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OtpStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OtpStates](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OTPStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PdfSignatureParameters]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PdfSignatureParameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PdfSignatureParameters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[SignatureVisible] [bit] NULL,
	[WidgetOnAllPages] [bit] NULL,
	[WidgetOnPage] [int] NULL,
	[WidgetAutoPos] [bit] NULL,
	[WidgetAutoSize] [bit] NULL,
	[WidgetWidth] [int] NULL,
	[WidgetHeight] [int] NULL,
	[WidgetOffsetX] [int] NULL,
	[WidgetOffsetY] [int] NULL,
	[WidgetRotate] [int] NULL,
	[WidgetHideText] [bit] NULL,
	[BackgroundImage] [bit] NULL,
	[BackgroundStretch] [bit] NULL,
	[BackgroundHeight] [int] NULL,
	[BackgroundWidth] [int] NULL,
	[FieldName] [nvarchar](255) NULL,
	[FilterOnlyDocSignatures] [bit] NULL,
	[WidgetOnLastPage] [bit] NULL,
	[ReviewConfig] [bit] NULL,
	[Background] [varbinary](max) NULL,
	[PageOffset] [int] NULL,
	[ImageTokenText] [nvarchar](100) NULL,
	[DateCaptionFormat] [nvarchar](100) NULL,
	[DateOffsetX] [smallint] NULL,
	[DateOffsetY] [smallint] NULL,
	[WidgetDateTextSize] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PdfSignatureParameters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PdfSignatureParametersDrafts]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PdfSignatureParametersDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PdfSignatureParametersDrafts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[FieldName] [nvarchar](255) NULL,
	[SignatureVisible] [bit] NOT NULL,
	[BackgroundImage] [bit] NULL,
	[BackgroundStretch] [bit] NULL,
	[BackgroundWidth] [int] NULL,
	[BackgroundHeight] [int] NULL,
	[WidgetAutoPos] [bit] NULL,
	[WidgetOffsetX] [int] NULL,
	[WidgetOffsetY] [int] NULL,
	[WidgetAutoSize] [bit] NULL,
	[WidgetWidth] [int] NULL,
	[WidgetHeight] [int] NULL,
	[WidgetRotate] [int] NULL,
	[WidgetOnAllPages] [bit] NULL,
	[WidgetOnPage] [int] NULL,
	[FilterOnlyDocSignatures] [bit] NULL,
	[WidgetHideText] [bit] NULL,
	[WidgetOnLastPage] [bit] NULL,
	[WidgetImageTokenText] [nvarchar](100) NULL,
	[Background] [varbinary](max) NULL,
	[PageOffset] [int] NULL,
	[ImageTokenText] [nvarchar](100) NULL,
	[DateCaptionFormat] [nvarchar](100) NULL,
	[DateOffsetX] [smallint] NULL,
	[DateOffsetY] [smallint] NULL,
	[WidgetDateTextSize] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PDFSignatureParametersDraft] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PdfSignatureParametersTemplates]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PdfSignatureParametersTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PdfSignatureParametersTemplates](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[FieldName] [nvarchar](255) NULL,
	[SignatureVisible] [bit] NOT NULL,
	[BackgroundImage] [bit] NULL,
	[BackgroundStretch] [bit] NULL,
	[BackgroundWidth] [int] NULL,
	[BackgroundHeight] [int] NULL,
	[WidgetAutoPos] [bit] NULL,
	[WidgetOffsetX] [int] NULL,
	[WidgetOffsetY] [int] NULL,
	[WidgetAutoSize] [bit] NULL,
	[WidgetWidth] [int] NULL,
	[WidgetHeight] [int] NULL,
	[WidgetRotate] [int] NULL,
	[WidgetOnAllPages] [bit] NULL,
	[WidgetOnPage] [int] NULL,
	[FilterOnlyDocSignatures] [bit] NULL,
	[WidgetHideText] [bit] NULL,
	[WidgetOnLastPage] [bit] NULL,
	[WidgetImageTokenText] [nvarchar](100) NULL,
	[Background] [varbinary](max) NULL,
	[PageOffset] [int] NULL,
	[ImageTokenText] [nvarchar](100) NULL,
	[DateCaptionFormat] [nvarchar](100) NULL,
	[DateOffsetX] [smallint] NULL,
	[DateOffsetY] [smallint] NULL,
	[IdWidgetWFTemplate] [int] NOT NULL,
	[WidgetDateTextSize] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PdfSignatureParametersTemplates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PermissionsGroups]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermissionsGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PermissionsGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSignPermissions] [int] NOT NULL,
	[IDPermissionsGroupMaster] [int] NOT NULL,
 CONSTRAINT [PK_PermissionsGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PermissionsGroupsMaster]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermissionsGroupsMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PermissionsGroupsMaster](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PermissionsGroupsMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Profiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Profiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CheckRequired] [bit] NOT NULL,
	[Acknowledge] [bit] NOT NULL,
	[IDProfileType] [int] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[AutoConvertToPdf] [bit] NOT NULL,
	[CustomWidgetRequired] [nvarchar](50) NULL,
	[should_add_CSV_and_QR] [bit] NOT NULL,
	[webservice_uri] [nvarchar](max) NULL,
	[CSV_certificate] [int] NOT NULL,
	[CSV_height] [int] NOT NULL,
	[CSV_width] [int] NOT NULL,
	[CSV_offsetX] [int] NOT NULL,
	[CSV_offsetY] [int] NOT NULL,
	[CSV_rotate] [int] NOT NULL,
	[CSV_certificate_owner] [nvarchar](max) NULL,
	[endDate] [datetime] NULL,
	[Enabled]  AS (CONVERT([bit],case isnull([EndDate],(0)) when (0) then (1) else (0) end,(0))),
	[AllWFEnabled] [bit] NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProfileSign]    Script Date: 18/01/2023 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProfileSign]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProfileSign](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProfile] [int] NOT NULL,
	[IDDocumentType] [int] NOT NULL,
	[IDSignType] [int] NOT NULL,
	[IDSignFormat] [int] NOT NULL,
	[IDSignAlgorithm] [int] NOT NULL,
 CONSTRAINT [PK_ProfileSign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProfileTypes]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProfileTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProfileTypes](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProfileTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Reasons]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reasons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reasons](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Reasons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Repository]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Repository]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Repository](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Repository] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RepositorySecurity]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RepositorySecurity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RepositorySecurity](
	[Id] [int] NOT NULL,
	[IdUser] [int] NULL,
	[IdGroup] [int] NULL,
	[IdRepo] [int] NOT NULL,
 CONSTRAINT [PK_RepositorySecurity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[SystemAdmin] [bit] NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RolesPermissions]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesPermissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RolesPermissions](
	[Roles_ID] [int] NOT NULL,
	[SignPermissions_ID] [int] NOT NULL,
 CONSTRAINT [PK_RolesPermissions] PRIMARY KEY CLUSTERED 
(
	[Roles_ID] ASC,
	[SignPermissions_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SAPDocuments]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SAPDocuments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SAPDocuments](
	[Clave] [nvarchar](100) NOT NULL,
	[Titulo] [nvarchar](100) NULL,
	[FechaCreacion] [nvarchar](100) NULL,
	[Referencia] [nvarchar](100) NULL,
	[Proceso] [nvarchar](100) NULL,
	[Estado] [nvarchar](100) NULL,
	[Status] [nvarchar](100) NULL,
	[Panel] [nvarchar](100) NULL,
	[DocVisible] [nvarchar](100) NULL,
	[CajaFirma] [nvarchar](100) NULL,
	[RazondeFirma] [nvarchar](100) NULL,
	[Tipo] [nvarchar](100) NULL,
	[Motivo] [nvarchar](100) NULL,
	[Solicitante] [nvarchar](100) NULL,
	[PerfilFirma] [nvarchar](100) NULL,
	[UrlSPS] [nvarchar](200) NULL,
 CONSTRAINT [PK_SAPDocuments] PRIMARY KEY CLUSTERED 
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SAPTasks]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SAPTasks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SAPTasks](
	[Entidad] [nvarchar](100) NULL,
	[Fecha] [nvarchar](100) NULL,
	[Tipo] [nvarchar](100) NULL,
	[Proceso] [nvarchar](100) NOT NULL,
	[Referencia] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Peticionario] [nvarchar](300) NULL,
	[Firmante] [nvarchar](200) NULL,
	[CadenaFirmantes] [nvarchar](500) NULL,
	[Estado] [nvarchar](100) NULL,
	[Importe] [nvarchar](100) NULL,
	[NPropInversion] [nvarchar](100) NULL,
	[DescripPropInversion] [nvarchar](100) NULL,
	[NDocumento] [nvarchar](100) NULL,
	[NRevision] [nvarchar](100) NULL,
	[CausaRevision] [nvarchar](100) NULL,
	[DescripPropAsignacion] [nvarchar](200) NULL,
	[Acciones] [nvarchar](100) NULL,
	[dni] [nvarchar](30) NULL,
	[APP] [char](1) NULL,
 CONSTRAINT [PK_SAPTasks] PRIMARY KEY CLUSTERED 
(
	[Proceso] ASC,
	[Referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SBActionType]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SBActionType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SBActionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_SBActionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SecurityWFGroup]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityWFGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityWFGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDGroup] [int] NOT NULL,
	[IDWF] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Enabled]  AS (CONVERT([bit],case isnull([EndDate],(0)) when (0) then (1) else (0) end,(0))),
	[CreateUser] [int] NOT NULL,
 CONSTRAINT [PK_SecurityWFGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SecurityWFProfile]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityWFProfile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityWFProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProfile] [int] NOT NULL,
	[IDWF] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Enabled]  AS (CONVERT([bit],case isnull([EndDate],(0)) when (0) then (1) else (0) end,(0))),
	[CreateUser] [int] NOT NULL,
 CONSTRAINT [PK_SecurityWFProfile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SecurityWFUser]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityWFUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityWFUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDWF] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Enabled]  AS (CONVERT([bit],case isnull([EndDate],(0)) when (0) then (1) else (0) end,(0))),
	[CreateUser] [int] NOT NULL,
 CONSTRAINT [PK_SecurityWFUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SettingAccGroup]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SettingAccGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SettingAccGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAccGroup] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[IdSetting] [int] NOT NULL,
 CONSTRAINT [PK_SettingAccGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](50) NOT NULL,
	[Value] [varchar](150) NULL,
	[Description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignAlgoritms]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignAlgoritms]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignAlgoritms](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NULL,
	[SourceValue] [int] NULL,
 CONSTRAINT [PK_SignAlgoritms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignatureOptions]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignatureOptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignatureOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDRequest] [int] NULL,
	[IDStep] [int] NULL,
	[IDSignatureOption] [int] NOT NULL,
	[CodeOTP] [varchar](250) NULL,
	[CodeExpeditionDate] [datetime] NULL,
	[Validated] [bit] NOT NULL,
	[SupportCertificate] [bit] NOT NULL,
	[TextSignatureWithVoice] [nvarchar](1000) NULL,
 CONSTRAINT [PK_SignatureOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignatureOptionsDrafts]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignatureOptionsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignatureOptionsDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSignRequestDrafts] [bigint] NULL,
	[IDStepDrafts] [bigint] NULL,
	[IDSignatureType] [int] NOT NULL,
	[CodeOTP] [varchar](250) NULL,
	[CodeExpeditionDate] [datetime] NULL,
	[Validated] [bit] NOT NULL,
	[SupportCertificate] [bit] NOT NULL,
	[TextSignatureWithVoice] [nvarchar](1000) NULL,
 CONSTRAINT [PK_SignatureOptionsDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignatureOptionsStep]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStep]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignatureOptionsStep](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDStep] [int] NOT NULL,
	[IDSignatureType] [int] NOT NULL,
	[SupportCertificate] [bit] NOT NULL,
	[TextSignatureWithVoice] [nvarchar](1000) NULL,
 CONSTRAINT [PK_SignatureOptionsStep] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignatureOptionsStepDrafts]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStepDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignatureOptionsStepDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDStepDrafts] [bigint] NOT NULL,
	[IDSignatureType] [int] NOT NULL,
	[SupportCertificate] [bit] NOT NULL,
	[TextSignatureWitchVoice] [nvarchar](1000) NULL,
 CONSTRAINT [PK_SignatureOptionsStepDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignatureTypes]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignatureTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignatureTypes](
	[ID] [int] NOT NULL,
	[SignatureType] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](10) NULL,
	[Enable] [bit] NULL,
 CONSTRAINT [PK_SignatureTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignedProperties]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignedProperties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignedProperties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [bit] NULL,
	[Surname] [bit] NULL,
	[Position] [bit] NULL,
	[IDLocation] [int] NULL,
	[IDCommitment] [int] NULL,
	[Date] [bit] NULL,
	[DNI] [bit] NULL,
 CONSTRAINT [PK_SignedProperties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignedPropertiesForSignSignReq]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignedPropertiesForSignSignReq]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignedPropertiesForSignSignReq](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReqPosition] [nvarchar](100) NULL,
	[ReqLocation] [nvarchar](200) NULL,
	[ReqCommiment] [nvarchar](200) NULL,
	[ReqRequired] [bit] NOT NULL,
	[Order] [int] NOT NULL,
	[IsUsed] [bit] NOT NULL,
	[SignRequestId] [int] NOT NULL,
 CONSTRAINT [PKSignedPropertiesForSignRequestId] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignedSignRequestWithSignedPro]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignedSignRequestWithSignedPro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignedSignRequestWithSignedPro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](100) NULL,
	[Location] [nvarchar](200) NULL,
	[Commiment] [nvarchar](200) NULL,
	[SignRequestId] [int] NOT NULL,
 CONSTRAINT [PKSignedSignRequestId] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Signers]    Script Date: 18/01/2023 18:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Signers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Signers](
	[Number] [int] NULL,
	[NIF] [nvarchar](10) NULL,
	[Name] [nvarchar](100) NULL,
	[Rol] [nvarchar](100) NULL,
	[Position] [nvarchar](100) NULL,
	[ActionDate] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Signers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignFormats]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignFormats]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignFormats](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FormatLevel] [int] NULL,
	[FormatParent] [int] NULL,
	[SourceValue] [int] NULL,
 CONSTRAINT [PK_SignFormats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignPermissions]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignPermissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignPermissions](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[SystemAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_SignPermissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignProviderParameters]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignProviderParameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignProviderParameters](
	[GuidIdentifier] [nvarchar](50) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SignProviderParameters] PRIMARY KEY CLUSTERED 
(
	[GuidIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignRequestUrlAttachments]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignRequestUrlAttachments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignRequestUrlAttachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[SignRequestId] [int] NOT NULL,
 CONSTRAINT [PKSignRequestAttachmentURLId] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SignTypes]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SignTypes](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NULL,
	[SourceValue] [int] NULL,
 CONSTRAINT [PK_SignTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SSOTypes]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SSOTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SSOTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](200) NOT NULL,
 CONSTRAINT [PK_SSOTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StepAttachment]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StepAttachment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StepAttachment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDStep] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MaxSize] [numeric](18, 2) NOT NULL,
	[Required] [bit] NOT NULL,
	[IdDocument] [int] NULL,
	[Completed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StepAttachmentDrafts]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StepAttachmentDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StepAttachmentDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDStepDraft] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MaxSize] [numeric](18, 2) NOT NULL,
	[Required] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StepsDrafts]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StepsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StepsDrafts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDActionType] [int] NOT NULL,
	[IDUser] [int] NULL,
	[IDGroup] [int] NULL,
	[IDContact] [int] NULL,
	[IdSuggestedContact] [int] NULL,
	[Order] [int] NULL,
	[IDWFDraft] [int] NOT NULL,
	[GroupSignsRequired] [int] NULL,
	[WorkFlowStepType] [int] NOT NULL,
	[CustomField] [varchar](max) NULL,
	[IDLanguage] [int] NULL,
 CONSTRAINT [PK_StepsDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StepsForConfigurePositions]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StepsForConfigurePositions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StepsForConfigurePositions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StepWFI] [int] NOT NULL,
	[PdfSignatureParameters] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[GroupPosition] [int] NULL,
 CONSTRAINT [PK_StepsForConfigurePositions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StepTemplates]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StepTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StepTemplates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdStepTemplateMaster] [int] NOT NULL,
	[IdActionType] [int] NOT NULL,
	[IdSignatureType] [int] NULL,
	[IdSuggestedContact] [int] NOT NULL,
	[Order] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StepTemplatesMaster]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StepTemplatesMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StepTemplatesMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdAccGroup] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[EnabledForAllUsers] [bit] NOT NULL,
 CONSTRAINT [PK_StepTemplatesMaste] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tasks](
	[ID] [int] NOT NULL,
	[Reference] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[IDType] [int] NOT NULL,
	[IDState] [int] NOT NULL,
	[Process] [nvarchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[InvestmentProposal] [nvarchar](100) NULL,
	[ProposalDescription] [nvarchar](250) NULL,
	[DocumentNumber] [nvarchar](100) NULL,
	[InvestmentNumber] [nvarchar](100) NULL,
	[RevisionReason] [nvarchar](100) NULL,
	[AllocationDescription] [nvarchar](250) NULL,
	[IDEntity] [int] NULL,
	[IDPetitioner] [int] NULL,
	[IDSigner] [int] NULL,
	[Actions] [nvarchar](150) NULL,
	[Signers] [nvarchar](1000) NULL,
	[DNI] [nchar](10) NULL,
	[IDCompany] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TemplateFonts]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemplateFonts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TemplateFonts](
	[Name] [nvarchar](200) NOT NULL,
	[Archive] [nvarchar](200) NULL,
 CONSTRAINT [PK_TemplateFonts] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TemplateLine]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemplateLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TemplateLine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTemplate] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[TextAlign] [nvarchar](20) NULL,
	[Angle] [int] NULL,
	[Pag] [int] NULL,
	[FontWeight] [nvarchar](20) NULL,
	[FontFamily] [nvarchar](20) NULL,
	[FontSize] [decimal](10, 2) NULL,
	[Top] [decimal](10, 2) NULL,
	[Left] [decimal](10, 2) NULL,
	[LineHeight] [decimal](10, 2) NULL,
	[Width] [decimal](10, 2) NULL,
	[Height] [decimal](10, 2) NULL,
	[Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_TemplateLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TemplateLineTextLine]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemplateLineTextLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TemplateLineTextLine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTempateLine] [int] NULL,
	[IdTemplate] [int] NULL,
	[Text] [nvarchar](200) NULL,
 CONSTRAINT [PK_TemplateLineTextLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Templates]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Templates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Templates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Url] [nvarchar](1000) NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Templates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TemporaryOTP]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemporaryOTP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TemporaryOTP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InstanceOTP] [varchar](max) NOT NULL,
	[GenerationDate] [datetime] NOT NULL,
	[IDSrDocumentsStepsWFI] [int] NOT NULL,
	[Tries] [int] NULL,
 CONSTRAINT [PK_TemporaryOTP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TokenBlackList]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TokenBlackList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TokenBlackList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[InsertDate] [datetime] NOT NULL,
	[TokenHash]  AS (hashbytes('SHA2_512',[Token])) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRoles](
	[Roles_ID] [int] NOT NULL,
	[Users_ID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Roles_ID] ASC,
	[Users_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserSignRequestWidget]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserSignRequestWidget](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDSignRequest] [int] NOT NULL,
	[IDPdfSignatureParameters] [int] NOT NULL,
 CONSTRAINT [PK_UserSignRequestWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UsersNotifications]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNotifications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersNotifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDNotification] [int] NOT NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_UsersNotifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UsersProfiles]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersProfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersProfiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProfile] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDCertificate] [int] NULL,
	[IDPdfSignatureParameters] [int] NULL,
 CONSTRAINT [PK_UsersProfiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserStates]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserStates](
	[IdUserState] [int] NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_UserStates] PRIMARY KEY CLUSTERED 
(
	[IdUserState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VerificationDescription]    Script Date: 18/01/2023 18:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VerificationDescription]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VerificationDescription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[idStatus] [int] NOT NULL,
	[vStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_VerificationDescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VerificationStatus]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VerificationStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VerificationStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_VerificationStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VersionNews]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VersionNews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VersionNews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IdVersionNewsTypes] [int] NOT NULL,
	[IdVersions] [int] NOT NULL,
 CONSTRAINT [PK_VersionNews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VersionNewsTypes]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VersionNewsTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VersionNewsTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VersionNewsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Versions]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Versions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Versions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](10) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WebHookConfigs]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebHookConfigs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebHookConfigs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdAccGroup] [int] NOT NULL,
	[User] [varchar](100) NULL,
	[Password] [varchar](500) NULL,
	[APIKey] [varchar](max) NULL,
	[IdAutenticationType] [int] NOT NULL,
	[HeaderName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_WebHookConfigs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_WebHookConfigs] UNIQUE NONCLUSTERED 
(
	[IdAccGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WebhookNotifications]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebhookNotifications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebhookNotifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdSignRequest] [int] NOT NULL,
	[WebHookUri] [nvarchar](max) NOT NULL,
	[Secret] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_WebhookNotifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WFDefinition]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WFDefinition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WFDefinition](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[AllRequired] [bit] NULL,
	[Enabled] [bit] NULL,
	[AllProfilesEnabled] [bit] NOT NULL,
	[AllUserEnabled] [bit] NOT NULL,
	[CreateUser] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserArea] [nvarchar](50) NULL,
	[GenericFlow] [bit] NULL,
 CONSTRAINT [PK_WFDefinition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WFDefinitionDrafts]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WFDefinitionDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WFDefinitionDrafts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSignRequestDrafts] [bigint] NOT NULL,
	[Name] [varchar](100) NULL,
	[Enabled] [bit] NULL,
	[AllProfilesEnabled] [bit] NOT NULL,
	[AllUserEnabled] [bit] NOT NULL,
	[CreateUser] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserArea] [nvarchar](50) NULL,
	[GenericFlow] [bit] NULL,
	[IdTemplate] [int] NULL,
 CONSTRAINT [PK_WFDefinitionsDrafts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetLocationsMaster]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetLocationsMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetLocationsMaster](
	[ID] [int] NOT NULL,
	[Name] [varchar](500) NOT NULL,
 CONSTRAINT [PK_WidgetLocationsMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetOptionalFieldsDrafts]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetOptionalFieldsDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetOptionalFieldsDrafts](
	[IDPDFDraft] [bigint] NOT NULL,
	[IDField] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
 CONSTRAINT [PK_WidgetVisibleFieldsDraft] PRIMARY KEY CLUSTERED 
(
	[IDPDFDraft] ASC,
	[IDField] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetOptionalFieldsTypes]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetOptionalFieldsTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetOptionalFieldsTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Field] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_WidgetOptionalFieldsType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetTemplateExclude]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetTemplateExclude]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetTemplateExclude](
	[IdWidgetTemplateMaster] [int] NOT NULL,
	[IdAccGroup] [int] NOT NULL,
 CONSTRAINT [PK_WidgetTemplateExclude] PRIMARY KEY CLUSTERED 
(
	[IdWidgetTemplateMaster] ASC,
	[IdAccGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetTemplateFeature]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetTemplateFeature]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetTemplateFeature](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_WidgetTemplateFeature] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetTemplateMaster]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetTemplateMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetTemplateMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[UrlDocExample] [nvarchar](max) NULL,
	[Default] [bit] NULL,
 CONSTRAINT [PK_WidgetTemplateMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetType]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NULL,
	[Description] [varchar](150) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_WigdetTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetWFDrafts]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetWFDrafts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDStepsDrafts] [bigint] NOT NULL,
	[IDWFDefinitionDrafts] [int] NOT NULL,
	[IDPDFDrafts] [bigint] NOT NULL,
	[Orden] [int] NOT NULL,
	[IdSrDocumentsDrafts] [int] NULL,
	[IDFormWidgetDraft] [int] NULL,
 CONSTRAINT [PK_WidgetWFDraft] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WidgetWFTemplate]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WidgetWFTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WidgetWFTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdWidgetLocationMaster] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[IdFormWidgetTemplate] [int] NULL,
 CONSTRAINT [PK_WidgetWFTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WorkFlowType]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkFlowType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkFlowType](
	[idWorkFlowType] [int] NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WorkFlowType] PRIMARY KEY CLUSTERED 
(
	[idWorkFlowType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WTempFeatureInWLocation]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WTempFeatureInWLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WTempFeatureInWLocation](
	[IdWidgetLocationName] [int] NOT NULL,
	[IdWidgetTemplateFeature] [int] NOT NULL,
 CONSTRAINT [PK_WTempFeatureInWLocation] PRIMARY KEY CLUSTERED 
(
	[IdWidgetLocationName] ASC,
	[IdWidgetTemplateFeature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[AggregatedCounter]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[Counter]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 18/01/2023 18:20:47 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[Counter]') AND name = N'CX_HangFire_Counter')
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[Hash]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 18/01/2023 18:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[JobQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[List]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[List]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[Schema]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[Server]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HangFire].[Set]') AND type in (N'U'))
BEGIN
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Reporting].[ActionStatisticsByType]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[ActionStatisticsByType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reporting].[ActionStatisticsByType](
	[IdAccGroup] [int] NULL,
	[AccGroupName] [nvarchar](250) NULL,
	[IdUser] [int] NULL,
	[UserLogin] [nvarchar](100) NULL,
	[UserName] [nvarchar](150) NULL,
	[IDActionType] [int] NULL,
	[ActionDate] [datetime] NULL,
	[External] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [IDX_UActS_ActDate_AccGroup_User_CLUSTERED]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[ActionStatisticsByType]') AND name = N'IDX_UActS_ActDate_AccGroup_User_CLUSTERED')
CREATE CLUSTERED INDEX [IDX_UActS_ActDate_AccGroup_User_CLUSTERED] ON [Reporting].[ActionStatisticsByType]
(
	[ActionDate] ASC,
	[IdAccGroup] ASC,
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Reporting].[DashboardsPendingRequest]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[DashboardsPendingRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reporting].[DashboardsPendingRequest](
	[IdAccGroup] [int] NULL,
	[IdUser] [int] NULL,
	[IdRequest] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Sign] [int] NULL,
	[Review] [int] NULL,
	[IdExternalSignature] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [IDX_DPR_AccGruop_User_Date_CLUSTERED]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[DashboardsPendingRequest]') AND name = N'IDX_DPR_AccGruop_User_Date_CLUSTERED')
CREATE CLUSTERED INDEX [IDX_DPR_AccGruop_User_Date_CLUSTERED] ON [Reporting].[DashboardsPendingRequest]
(
	[CreateDate] ASC,
	[IdAccGroup] ASC,
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Reporting].[SignatureStatisticsByType]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[SignatureStatisticsByType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reporting].[SignatureStatisticsByType](
	[IdAccGroup] [int] NULL,
	[AccGroupName] [nvarchar](250) NULL,
	[IdUser] [int] NULL,
	[UserLogin] [nvarchar](100) NULL,
	[UserName] [nvarchar](150) NULL,
	[ActionDate] [datetime] NULL,
	[IDSignatureOption] [int] NULL,
	[External] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [IDX_SST_ActDate_AccGroup_User_CLUSTERED]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[SignatureStatisticsByType]') AND name = N'IDX_SST_ActDate_AccGroup_User_CLUSTERED')
CREATE CLUSTERED INDEX [IDX_SST_ActDate_AccGroup_User_CLUSTERED] ON [Reporting].[SignatureStatisticsByType]
(
	[ActionDate] ASC,
	[IdAccGroup] ASC,
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Reporting].[SignRequestStatisticsByState]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[SignRequestStatisticsByState]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reporting].[SignRequestStatisticsByState](
	[IdAccGroup] [int] NULL,
	[AccGroupName] [nvarchar](250) NULL,
	[IdUser] [int] NULL,
	[UserLogin] [nvarchar](100) NULL,
	[UserName] [nvarchar](150) NULL,
	[IdRequest] [int] NULL,
	[IdState] [int] NULL,
	[CreateDate] [datetime] NULL,
	[IdExternalSignature] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [IDX_DPR_AccGroup_User_Date_CLUSTERED]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[SignRequestStatisticsByState]') AND name = N'IDX_DPR_AccGroup_User_Date_CLUSTERED')
CREATE CLUSTERED INDEX [IDX_DPR_AccGroup_User_Date_CLUSTERED] ON [Reporting].[SignRequestStatisticsByState]
(
	[CreateDate] ASC,
	[IdAccGroup] ASC,
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE CardType( 
	Id INT PRIMARY KEY,  
	Name VARCHAR(50) NOT NULL);  
/****** Object:  Index [IX_FK_ActionReasons_Actions_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Actions]') AND name = N'IX_FK_ActionReasons_Actions_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_ActionReasons_Actions_FK1] ON [dbo].[Actions]
(
	[IDActionReason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IdCardType])
REFERENCES [dbo].[CardType] ([Id])
/****** Object:  Index [IX_FK_ActionTypes_Actions_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Actions]') AND name = N'IX_FK_ActionTypes_Actions_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_ActionTypes_Actions_FK1] ON [dbo].[Actions]
(
	[IDActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SignRequests_Actions_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Actions]') AND name = N'IX_FK_SignRequests_Actions_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_SignRequests_Actions_FK1] ON [dbo].[Actions]
(
	[IDRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_Actions_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Actions]') AND name = N'IX_FK_Users_Actions_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_Actions_FK1] ON [dbo].[Actions]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_Actions_FK2]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Actions]') AND name = N'IX_FK_Users_Actions_FK2')
CREATE NONCLUSTERED INDEX [IX_FK_Users_Actions_FK2] ON [dbo].[Actions]
(
	[IDEndUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DossierAttachmentsDossiers]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AttachmentsDossiers]') AND name = N'IX_FK_DossierAttachmentsDossiers')
CREATE NONCLUSTERED INDEX [IX_FK_DossierAttachmentsDossiers] ON [dbo].[AttachmentsDossiers]
(
	[DossierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Attachment_AttachmentSigRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AttachmentSigRequests]') AND name = N'IX_FK_Attachment_AttachmentSigRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Attachment_AttachmentSigRequests_FK1] ON [dbo].[AttachmentSigRequests]
(
	[IDAttachment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SignRequests_AttachmentSigRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AttachmentSigRequests]') AND name = N'IX_FK_SignRequests_AttachmentSigRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_SignRequests_AttachmentSigRequests_FK1] ON [dbo].[AttachmentSigRequests]
(
	[IDSignRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Profiles_DelegatesProfiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DelegatesProfiles]') AND name = N'IX_FK_Profiles_DelegatesProfiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Profiles_DelegatesProfiles_FK1] ON [dbo].[DelegatesProfiles]
(
	[IDProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_DelegatesProfiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DelegatesProfiles]') AND name = N'IX_FK_Users_DelegatesProfiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_DelegatesProfiles_FK1] ON [dbo].[DelegatesProfiles]
(
	[IDDelegate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_DelegatesUsers_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DelegatesUsers]') AND name = N'IX_FK_Users_DelegatesUsers_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_DelegatesUsers_FK1] ON [dbo].[DelegatesUsers]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_DelegatesUsers_FK2]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DelegatesUsers]') AND name = N'IX_FK_Users_DelegatesUsers_FK2')
CREATE NONCLUSTERED INDEX [IX_FK_Users_DelegatesUsers_FK2] ON [dbo].[DelegatesUsers]
(
	[IDDelegate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Profiles_DelegateUsersProfile_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DelegateUsersProfiles]') AND name = N'IX_FK_Profiles_DelegateUsersProfile_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Profiles_DelegateUsersProfile_FK1] ON [dbo].[DelegateUsersProfiles]
(
	[IDProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_DelegateUsersProfile_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DelegateUsersProfiles]') AND name = N'IX_FK_Users_DelegateUsersProfile_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_DelegateUsersProfile_FK1] ON [dbo].[DelegateUsersProfiles]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ActionReasonDossierActions]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DossierActions]') AND name = N'IX_FK_ActionReasonDossierActions')
CREATE NONCLUSTERED INDEX [IX_FK_ActionReasonDossierActions] ON [dbo].[DossierActions]
(
	[IDActionReason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ActionTypeDossierActions]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DossierActions]') AND name = N'IX_FK_ActionTypeDossierActions')
CREATE NONCLUSTERED INDEX [IX_FK_ActionTypeDossierActions] ON [dbo].[DossierActions]
(
	[IDActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DossierDossierActions]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DossierActions]') AND name = N'IX_FK_DossierDossierActions')
CREATE NONCLUSTERED INDEX [IX_FK_DossierDossierActions] ON [dbo].[DossierActions]
(
	[IDDossier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserDossierActions]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DossierActions]') AND name = N'IX_FK_UserDossierActions')
CREATE NONCLUSTERED INDEX [IX_FK_UserDossierActions] ON [dbo].[DossierActions]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Dossiers_Entities]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Dossiers]') AND name = N'IX_FK_Dossiers_Entities')
CREATE NONCLUSTERED INDEX [IX_FK_Dossiers_Entities] ON [dbo].[Dossiers]
(
	[IDEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DossierStateDossier]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Dossiers]') AND name = N'IX_FK_DossierStateDossier')
CREATE NONCLUSTERED INDEX [IX_FK_DossierStateDossier] ON [dbo].[Dossiers]
(
	[IDState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DossierTypeDossier]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Dossiers]') AND name = N'IX_FK_DossierTypeDossier')
CREATE NONCLUSTERED INDEX [IX_FK_DossierTypeDossier] ON [dbo].[Dossiers]
(
	[IDType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Idx_Messages_DateEnd_NotVisible_DateStart]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Messages]') AND name = N'Idx_Messages_DateEnd_NotVisible_DateStart')
CREATE NONCLUSTERED INDEX [Idx_Messages_DateEnd_NotVisible_DateStart] ON [dbo].[Messages]
(
	[DateEnd] DESC,
	[NotVisible] ASC,
	[DateStart] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Metadata_MetadataProfiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[MetadataProfiles]') AND name = N'IX_FK_Metadata_MetadataProfiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Metadata_MetadataProfiles_FK1] ON [dbo].[MetadataProfiles]
(
	[IDMetadata] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Profiles_MetadataProfiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[MetadataProfiles]') AND name = N'IX_FK_Profiles_MetadataProfiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Profiles_MetadataProfiles_FK1] ON [dbo].[MetadataProfiles]
(
	[IDProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Metadata_MetadataSigRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[MetadataSigRequests]') AND name = N'IX_FK_Metadata_MetadataSigRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Metadata_MetadataSigRequests_FK1] ON [dbo].[MetadataSigRequests]
(
	[IDMetadata] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SignRequests_MetadataSigRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[MetadataSigRequests]') AND name = N'IX_FK_SignRequests_MetadataSigRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_SignRequests_MetadataSigRequests_FK1] ON [dbo].[MetadataSigRequests]
(
	[IDSignRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProfileType_Profiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Profiles]') AND name = N'IX_FK_ProfileType_Profiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_ProfileType_Profiles_FK1] ON [dbo].[Profiles]
(
	[IDProfileType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesPermissions_SignPermissions]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RolesPermissions]') AND name = N'IX_FK_RolesPermissions_SignPermissions')
CREATE NONCLUSTERED INDEX [IX_FK_RolesPermissions_SignPermissions] ON [dbo].[RolesPermissions]
(
	[SignPermissions_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Dossier_SignRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND name = N'IX_FK_Dossier_SignRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Dossier_SignRequests_FK1] ON [dbo].[SignRequests]
(
	[IDDossier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Groups_SignRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND name = N'IX_FK_Groups_SignRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Groups_SignRequests_FK1] ON [dbo].[SignRequests]
(
	[IDGroupSigner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Profiles_SignRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND name = N'IX_FK_Profiles_SignRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Profiles_SignRequests_FK1] ON [dbo].[SignRequests]
(
	[IDProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Reasons_SignRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND name = N'IX_FK_Reasons_SignRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Reasons_SignRequests_FK1] ON [dbo].[SignRequests]
(
	[IDReason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_States_SignRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND name = N'IX_FK_States_SignRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_States_SignRequests_FK1] ON [dbo].[SignRequests]
(
	[IDState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_SignRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND name = N'IX_FK_Users_SignRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_SignRequests_FK1] ON [dbo].[SignRequests]
(
	[IDSigner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_SignRequests_FK2]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SignRequests]') AND name = N'IX_FK_Users_SignRequests_FK2')
CREATE NONCLUSTERED INDEX [IX_FK_Users_SignRequests_FK2] ON [dbo].[SignRequests]
(
	[IDPetitioner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Steps_ActionTypes1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Steps]') AND name = N'IX_FK_Steps_ActionTypes1')
CREATE NONCLUSTERED INDEX [IX_FK_Steps_ActionTypes1] ON [dbo].[Steps]
(
	[IDActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Steps_Groups]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Steps]') AND name = N'IX_FK_Steps_Groups')
CREATE NONCLUSTERED INDEX [IX_FK_Steps_Groups] ON [dbo].[Steps]
(
	[IDGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Steps_Users]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Steps]') AND name = N'IX_FK_Steps_Users')
CREATE NONCLUSTERED INDEX [IX_FK_Steps_Users] ON [dbo].[Steps]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Steps_WFDefinition]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Steps]') AND name = N'IX_FK_Steps_WFDefinition')
CREATE NONCLUSTERED INDEX [IX_FK_Steps_WFDefinition] ON [dbo].[Steps]
(
	[IDWF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_SWFI_Completed]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND name = N'IDX_SWFI_Completed')
CREATE NONCLUSTERED INDEX [IDX_SWFI_Completed] ON [dbo].[StepsWFI]
(
	[Completed] ASC
)
INCLUDE ( 	[ID],
	[IDWFI],
	[IDActionType],
	[Order],
	[WorkFlowStepType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SignatureType]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND name = N'IX_FK_SignatureType')
CREATE NONCLUSTERED INDEX [IX_FK_SignatureType] ON [dbo].[StepsWFI]
(
	[IdSignatureType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StepsWFI_Groups]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND name = N'IX_FK_StepsWFI_Groups')
CREATE NONCLUSTERED INDEX [IX_FK_StepsWFI_Groups] ON [dbo].[StepsWFI]
(
	[IDGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StepsWFI_Users]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND name = N'IX_FK_StepsWFI_Users')
CREATE NONCLUSTERED INDEX [IX_FK_StepsWFI_Users] ON [dbo].[StepsWFI]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StepsWFI_WFActionType]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND name = N'IX_FK_StepsWFI_WFActionType')
CREATE NONCLUSTERED INDEX [IX_FK_StepsWFI_WFActionType] ON [dbo].[StepsWFI]
(
	[IDActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StepsWFI_WFInstance]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND name = N'IX_FK_StepsWFI_WFInstance')
CREATE NONCLUSTERED INDEX [IX_FK_StepsWFI_WFInstance] ON [dbo].[StepsWFI]
(
	[IDWFI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StepWFI_Email_ActualStep]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StepsWFI]') AND name = N'IX_StepWFI_Email_ActualStep')
CREATE NONCLUSTERED INDEX [IX_StepWFI_Email_ActualStep] ON [dbo].[StepsWFI]
(
	[Email] ASC,
	[ActualStep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tasks_Company]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND name = N'IX_FK_Tasks_Company')
CREATE NONCLUSTERED INDEX [IX_FK_Tasks_Company] ON [dbo].[Tasks]
(
	[IDCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tasks_DossierTypes]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND name = N'IX_FK_Tasks_DossierTypes')
CREATE NONCLUSTERED INDEX [IX_FK_Tasks_DossierTypes] ON [dbo].[Tasks]
(
	[IDType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tasks_Entities]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND name = N'IX_FK_Tasks_Entities')
CREATE NONCLUSTERED INDEX [IX_FK_Tasks_Entities] ON [dbo].[Tasks]
(
	[IDEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tasks_Signer]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND name = N'IX_FK_Tasks_Signer')
CREATE NONCLUSTERED INDEX [IX_FK_Tasks_Signer] ON [dbo].[Tasks]
(
	[IDSigner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tasks_States]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND name = N'IX_FK_Tasks_States')
CREATE NONCLUSTERED INDEX [IX_FK_Tasks_States] ON [dbo].[Tasks]
(
	[IDState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tasks_Users]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND name = N'IX_FK_Tasks_Users')
CREATE NONCLUSTERED INDEX [IX_FK_Tasks_Users] ON [dbo].[Tasks]
(
	[IDPetitioner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [UX_SomeHash]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TokenBlackList]') AND name = N'UX_SomeHash')
CREATE UNIQUE NONCLUSTERED INDEX [UX_SomeHash] ON [dbo].[TokenBlackList]
(
	[TokenHash] ASC
)
WHERE ([Token] IS NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRoles_Users]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND name = N'IX_FK_UserRoles_Users')
CREATE NONCLUSTERED INDEX [IX_FK_UserRoles_Users] ON [dbo].[UserRoles]
(
	[Users_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UsersGroups_Users]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersGroups]') AND name = N'IX_FK_UsersGroups_Users')
CREATE NONCLUSTERED INDEX [IX_FK_UsersGroups_Users] ON [dbo].[UsersGroups]
(
	[Users_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserSignRequestWidget_PdfSignatureParameters]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]') AND name = N'IX_FK_UserSignRequestWidget_PdfSignatureParameters')
CREATE NONCLUSTERED INDEX [IX_FK_UserSignRequestWidget_PdfSignatureParameters] ON [dbo].[UserSignRequestWidget]
(
	[IDPdfSignatureParameters] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserSignRequestWidget_SignRequests]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]') AND name = N'IX_FK_UserSignRequestWidget_SignRequests')
CREATE NONCLUSTERED INDEX [IX_FK_UserSignRequestWidget_SignRequests] ON [dbo].[UserSignRequestWidget]
(
	[IDSignRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserSignRequestWidget_Users]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]') AND name = N'IX_FK_UserSignRequestWidget_Users')
CREATE NONCLUSTERED INDEX [IX_FK_UserSignRequestWidget_Users] ON [dbo].[UserSignRequestWidget]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Notifications_UsersNotifications_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersNotifications]') AND name = N'IX_FK_Notifications_UsersNotifications_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Notifications_UsersNotifications_FK1] ON [dbo].[UsersNotifications]
(
	[IDNotification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_UsersNotifications_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersNotifications]') AND name = N'IX_FK_Users_UsersNotifications_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_UsersNotifications_FK1] ON [dbo].[UsersNotifications]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PdfSignatureParameters_UsersProfiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersProfiles]') AND name = N'IX_FK_PdfSignatureParameters_UsersProfiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_PdfSignatureParameters_UsersProfiles_FK1] ON [dbo].[UsersProfiles]
(
	[IDPdfSignatureParameters] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Profiles_UsersProfiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersProfiles]') AND name = N'IX_FK_Profiles_UsersProfiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Profiles_UsersProfiles_FK1] ON [dbo].[UsersProfiles]
(
	[IDProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_UsersProfiles_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersProfiles]') AND name = N'IX_FK_Users_UsersProfiles_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_UsersProfiles_FK1] ON [dbo].[UsersProfiles]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SignRequests_UsersRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersRequests]') AND name = N'IX_FK_SignRequests_UsersRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_SignRequests_UsersRequests_FK1] ON [dbo].[UsersRequests]
(
	[IDRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_UsersRequests_FK1]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UsersRequests]') AND name = N'IX_FK_Users_UsersRequests_FK1')
CREATE NONCLUSTERED INDEX [IX_FK_Users_UsersRequests_FK1] ON [dbo].[UsersRequests]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_VerificationStatusVerificationDescription]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VerificationDescription]') AND name = N'IX_FK_VerificationStatusVerificationDescription')
CREATE NONCLUSTERED INDEX [IX_FK_VerificationStatusVerificationDescription] ON [dbo].[VerificationDescription]
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_WFInstance_SignRequests]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WFInstance]') AND name = N'IX_FK_WFInstance_SignRequests')
CREATE NONCLUSTERED INDEX [IX_FK_WFInstance_SignRequests] ON [dbo].[WFInstance]
(
	[IDRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_WFInstance_WFDefinition]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WFInstance]') AND name = N'IX_FK_WFInstance_WFDefinition')
CREATE NONCLUSTERED INDEX [IX_FK_WFInstance_WFDefinition] ON [dbo].[WFInstance]
(
	[IDWF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[AggregatedCounter]') AND name = N'IX_HangFire_AggregatedCounter_ExpireAt')
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[Hash]') AND name = N'IX_HangFire_Hash_ExpireAt')
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[Job]') AND name = N'IX_HangFire_Job_ExpireAt')
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[Job]') AND name = N'IX_HangFire_Job_StateName')
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[List]') AND name = N'IX_HangFire_List_ExpireAt')
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[Server]') AND name = N'IX_HangFire_Server_LastHeartbeat')
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[Set]') AND name = N'IX_HangFire_Set_ExpireAt')
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[HangFire].[Set]') AND name = N'IX_HangFire_Set_Score')
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_asbt_AccGroupName_UserLogin_IdActionType]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[ActionStatisticsByType]') AND name = N'IDX_asbt_AccGroupName_UserLogin_IdActionType')
CREATE NONCLUSTERED INDEX [IDX_asbt_AccGroupName_UserLogin_IdActionType] ON [Reporting].[ActionStatisticsByType]
(
	[IdAccGroup] ASC,
	[AccGroupName] ASC,
	[UserLogin] ASC,
	[IDActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_asbt_IdActionType]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[ActionStatisticsByType]') AND name = N'IDX_asbt_IdActionType')
CREATE NONCLUSTERED INDEX [IDX_asbt_IdActionType] ON [Reporting].[ActionStatisticsByType]
(
	[IdAccGroup] ASC,
	[AccGroupName] ASC,
	[UserLogin] ASC,
	[IDActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_ssbt_AccGroupName_UserLogin_IDSignatureOption]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[SignatureStatisticsByType]') AND name = N'IDX_ssbt_AccGroupName_UserLogin_IDSignatureOption')
CREATE NONCLUSTERED INDEX [IDX_ssbt_AccGroupName_UserLogin_IDSignatureOption] ON [Reporting].[SignatureStatisticsByType]
(
	[IdAccGroup] ASC,
	[AccGroupName] ASC,
	[UserLogin] ASC,
	[IDSignatureOption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_srstbs_AccGroupName_UserLogin_UserName_IdState]    Script Date: 18/01/2023 18:20:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Reporting].[SignRequestStatisticsByState]') AND name = N'IDX_srstbs_AccGroupName_UserLogin_UserName_IdState')
CREATE NONCLUSTERED INDEX [IDX_srstbs_AccGroupName_UserLogin_UserName_IdState] ON [Reporting].[SignRequestStatisticsByState]
(
	[IdAccGroup] ASC,
	[AccGroupName] ASC,
	[UserLogin] ASC,
	[UserName] ASC,
	[IdState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__LimitU__4C564A9F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__LimitU__4C564A9F]  DEFAULT ((0)) FOR [LimitUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__ExtraU__4D4A6ED8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__ExtraU__4D4A6ED8]  DEFAULT ((0)) FOR [ExtraUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__LimitS__4E3E9311]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__LimitS__4E3E9311]  DEFAULT ((0)) FOR [LimitSign]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__ExtraS__4F32B74A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__ExtraS__4F32B74A]  DEFAULT ((0)) FOR [ExtraSign]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__LimitS__5026DB83]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__LimitS__5026DB83]  DEFAULT ((0)) FOR [LimitSMS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__ExtraS__511AFFBC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__ExtraS__511AFFBC]  DEFAULT ((0)) FOR [ExtraSMS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__LimitF__520F23F5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__LimitF__520F23F5]  DEFAULT ((0)) FOR [LimitFileStorage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__ExtraF__5303482E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__ExtraF__5303482E]  DEFAULT ((0)) FOR [ExtraFileStorage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__LimitT__53F76C67]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__LimitT__53F76C67]  DEFAULT ((0)) FOR [LimitTemplates]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__ExtraT__54EB90A0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  CONSTRAINT [DF__AccGroup__ExtraT__54EB90A0]  DEFAULT ((0)) FOR [ExtraTemplates]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccGroup__LimitS__5E5FEC41]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroup] ADD  DEFAULT ((0)) FOR [LimitStepTemplate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccGroupExtraFields_IsKey]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroupExtraFields] ADD  CONSTRAINT [DF_AccGroupExtraFields_IsKey]  DEFAULT ((0)) FOR [IsKey]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccGroupExtraFields_isVisible]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroupExtraFields] ADD  CONSTRAINT [DF_AccGroupExtraFields_isVisible]  DEFAULT ((0)) FOR [isVisible]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccGroupSSO_Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccGroupSSO_SAML] ADD  CONSTRAINT [DF_AccGroupSSO_Enabled]  DEFAULT ((1)) FOR [Enabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ActionTyp__ShowI__4EFDAD20]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ActionTypes] ADD  DEFAULT ((1)) FOR [ShowInCertificatedReport]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Categorie__HasOp__05F8DC4F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoriesAUDIT] ADD  CONSTRAINT [DF__Categorie__HasOp__05F8DC4F]  DEFAULT ((0)) FOR [HasOptionalFields]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomFie__IdCus__10416098]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomFieldsAdmin] ADD  DEFAULT ((1)) FOR [IdCustomFieldsAdminType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Documents_CanBeSigned]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_CanBeSigned]  DEFAULT ((0)) FOR [CanBeSigned]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DocumentsDrafts_CanBeSigned]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DocumentsDrafts] ADD  CONSTRAINT [DF_DocumentsDrafts_CanBeSigned]  DEFAULT ((0)) FOR [CanBeSigned]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Dossiers_CreateUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Dossiers] ADD  CONSTRAINT [DF_Dossiers_CreateUser]  DEFAULT ((1)) FOR [CreateUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ExternalS__NSign__2C738AF2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalSignatures] ADD  DEFAULT ((1)) FOR [NSignatures]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FormWidge__IDFor__32816A03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FormWidget] ADD  DEFAULT ((1)) FOR [IDFormWidgetMandatoryType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FormWidge__IDFor__30992191]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FormWidgetsDraft] ADD  DEFAULT ((1)) FOR [IDFormWidgetMandatoryType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FormWidgetTemplate_ShowOrder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FormWidgetTemplate] ADD  CONSTRAINT [DF_FormWidgetTemplate_ShowOrder]  DEFAULT ((1)) FOR [ShowOrder]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FormWidge__IDFor__2EB0D91F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FormWidgetTemplate] ADD  DEFAULT ((1)) FOR [IDFormWidgetMandatoryType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Profiles_AllProfilesEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Profiles] ADD  CONSTRAINT [DF_Profiles_AllProfilesEnabled]  DEFAULT ((0)) FOR [AllWFEnabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Roles_SystemAdmin]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_SystemAdmin]  DEFAULT ((0)) FOR [SystemAdmin]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Roles_Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_Enabled]  DEFAULT ((1)) FOR [Enabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SignatureOptions_validated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignatureOptions] ADD  CONSTRAINT [DF_SignatureOptions_validated]  DEFAULT ((0)) FOR [Validated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SignatureOptions_SupportCertificate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignatureOptions] ADD  CONSTRAINT [DF_SignatureOptions_SupportCertificate]  DEFAULT ((0)) FOR [SupportCertificate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SignatureOptionsStep_SupportCertificate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignatureOptionsStep] ADD  CONSTRAINT [DF_SignatureOptionsStep_SupportCertificate]  DEFAULT ((0)) FOR [SupportCertificate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SignedPro__IsUse__214BF109]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignedPropertiesForSignSignReq] ADD  DEFAULT ((0)) FOR [IsUsed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SignPermissions_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignPermissions] ADD  CONSTRAINT [DF_SignPermissions_ID]  DEFAULT ((0)) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SignRequests_GroupSignsRequired]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignRequests] ADD  CONSTRAINT [DF_SignRequests_GroupSignsRequired]  DEFAULT ((1)) FOR [GroupSignsRequired]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SignRequests_IsFromResign]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignRequests] ADD  CONSTRAINT [DF_SignRequests_IsFromResign]  DEFAULT ((0)) FOR [IsFromResign]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SignRequestsDrafts_IsFromResign]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignRequestsDrafts] ADD  CONSTRAINT [DF_SignRequestsDrafts_IsFromResign]  DEFAULT ((0)) FOR [IsFromResign]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SignReque__Proce__149C0161]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SignRequestsDrafts] ADD  DEFAULT ((0)) FOR [Processing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrDocumentsStepsWFI_Signed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SrDocumentsStepsWFI] ADD  CONSTRAINT [DF_SrDocumentsStepsWFI_Signed]  DEFAULT ((0)) FOR [Signed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__StepsWFI__Actual__05E3CDB6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StepsWFI] ADD  DEFAULT ((0)) FOR [ActualStep]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__StepsWFI__MultiS__07CC1628]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StepsWFI] ADD  DEFAULT ((0)) FOR [MultiSignAllowed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_External]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_External]  DEFAULT ((0)) FOR [ExternalUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WFDefinition_AllUserEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WFDefinition] ADD  CONSTRAINT [DF_WFDefinition_AllUserEnabled]  DEFAULT ((0)) FOR [AllUserEnabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_DoubleFactorAuthTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroup]'))
ALTER TABLE [dbo].[AccGroup]  WITH CHECK ADD  CONSTRAINT [FK_AccGroup_DoubleFactorAuthTypes] FOREIGN KEY([DoubleFactorAuthTypeForUsers])
REFERENCES [dbo].[DoubleFactorAuthTypes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_DoubleFactorAuthTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroup]'))
ALTER TABLE [dbo].[AccGroup] CHECK CONSTRAINT [FK_AccGroup_DoubleFactorAuthTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_Language]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroup]'))
ALTER TABLE [dbo].[AccGroup]  WITH CHECK ADD  CONSTRAINT [FK_AccGroup_Language] FOREIGN KEY([IDLanguage])
REFERENCES [dbo].[Languages] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_Language]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroup]'))
ALTER TABLE [dbo].[AccGroup] CHECK CONSTRAINT [FK_AccGroup_Language]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_License]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroup]'))
ALTER TABLE [dbo].[AccGroup]  WITH CHECK ADD  CONSTRAINT [FK_AccGroup_License] FOREIGN KEY([IDLicense])
REFERENCES [dbo].[Licenses] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_License]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroup]'))
ALTER TABLE [dbo].[AccGroup] CHECK CONSTRAINT [FK_AccGroup_License]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroupExtraFields_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupExtraFields]'))
ALTER TABLE [dbo].[AccGroupExtraFields]  WITH CHECK ADD  CONSTRAINT [FK_AccGroupExtraFields_AccGroup] FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroupExtraFields_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupExtraFields]'))
ALTER TABLE [dbo].[AccGroupExtraFields] CHECK CONSTRAINT [FK_AccGroupExtraFields_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_AccGroupSignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupSignatureTypes]'))
ALTER TABLE [dbo].[AccGroupSignatureTypes]  WITH CHECK ADD  CONSTRAINT [FK_AccGroup_AccGroupSignatureTypes] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroup_AccGroupSignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupSignatureTypes]'))
ALTER TABLE [dbo].[AccGroupSignatureTypes] CHECK CONSTRAINT [FK_AccGroup_AccGroupSignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureTypes_AccGroupSignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupSignatureTypes]'))
ALTER TABLE [dbo].[AccGroupSignatureTypes]  WITH CHECK ADD  CONSTRAINT [FK_SignatureTypes_AccGroupSignatureTypes] FOREIGN KEY([IDSignatureTypes])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureTypes_AccGroupSignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupSignatureTypes]'))
ALTER TABLE [dbo].[AccGroupSignatureTypes] CHECK CONSTRAINT [FK_SignatureTypes_AccGroupSignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroupSSO_SAML_SSOTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupSSO_SAML]'))
ALTER TABLE [dbo].[AccGroupSSO_SAML]  WITH CHECK ADD  CONSTRAINT [FK_AccGroupSSO_SAML_SSOTypes] FOREIGN KEY([IdType])
REFERENCES [dbo].[SSOTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccGroupSSO_SAML_SSOTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccGroupSSO_SAML]'))
ALTER TABLE [dbo].[AccGroupSSO_SAML] CHECK CONSTRAINT [FK_AccGroupSSO_SAML_SSOTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Actions__IDExter__4E0988E7]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD FOREIGN KEY([IDExternalSingnatures])
REFERENCES [dbo].[ExternalSignatures] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Action_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Action_AccGroup] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Action_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Action_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionReasons_Actions_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_ActionReasons_Actions_FK1] FOREIGN KEY([IDActionReason])
REFERENCES [dbo].[ActionReasons] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionReasons_Actions_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_ActionReasons_Actions_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_Contacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Contacts] FOREIGN KEY([IDContact])
REFERENCES [dbo].[Contacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_Contacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_Contacts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_Contacts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Contacts1] FOREIGN KEY([IDEndContact])
REFERENCES [dbo].[Contacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_Contacts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_Contacts1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Documents] FOREIGN KEY([IDDocument])
REFERENCES [dbo].[Documents] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_Documents]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_SignRequests] FOREIGN KEY([IDRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_StepsWFI] FOREIGN KEY([IDStepWFI])
REFERENCES [dbo].[StepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_StepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_SuggestedContacts] FOREIGN KEY([IDSuggestedContact])
REFERENCES [dbo].[SuggestedContacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_SuggestedContacts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_SuggestedContacts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_SuggestedContacts1] FOREIGN KEY([IDEndSuggestedContact])
REFERENCES [dbo].[SuggestedContacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Actions_SuggestedContacts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_SuggestedContacts1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionTypes_Actions_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_ActionTypes_Actions_FK1] FOREIGN KEY([IDActionType])
REFERENCES [dbo].[ActionTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionTypes_Actions_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_ActionTypes_Actions_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Actions_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Users_Actions_FK1] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Actions_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Users_Actions_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Actions_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Users_Actions_FK2] FOREIGN KEY([IDEndUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Actions_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Actions]'))
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Users_Actions_FK2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierAttachmentsDossiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttachmentsDossiers]'))
ALTER TABLE [dbo].[AttachmentsDossiers]  WITH CHECK ADD  CONSTRAINT [FK_DossierAttachmentsDossiers] FOREIGN KEY([DossierID])
REFERENCES [dbo].[Dossiers] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierAttachmentsDossiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttachmentsDossiers]'))
ALTER TABLE [dbo].[AttachmentsDossiers] CHECK CONSTRAINT [FK_DossierAttachmentsDossiers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attachment_AttachmentSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttachmentSigRequests]'))
ALTER TABLE [dbo].[AttachmentSigRequests]  WITH CHECK ADD  CONSTRAINT [FK_Attachment_AttachmentSigRequests_FK1] FOREIGN KEY([IDAttachment])
REFERENCES [dbo].[Attachments] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attachment_AttachmentSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttachmentSigRequests]'))
ALTER TABLE [dbo].[AttachmentSigRequests] CHECK CONSTRAINT [FK_Attachment_AttachmentSigRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_AttachmentSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttachmentSigRequests]'))
ALTER TABLE [dbo].[AttachmentSigRequests]  WITH CHECK ADD  CONSTRAINT [FK_SignRequests_AttachmentSigRequests_FK1] FOREIGN KEY([IDSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_AttachmentSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttachmentSigRequests]'))
ALTER TABLE [dbo].[AttachmentSigRequests] CHECK CONSTRAINT [FK_SignRequests_AttachmentSigRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUDIT_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT]'))
ALTER TABLE [dbo].[AUDIT]  WITH CHECK ADD  CONSTRAINT [FK_AUDIT_Categories] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[CategoriesAUDIT] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUDIT_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT]'))
ALTER TABLE [dbo].[AUDIT] CHECK CONSTRAINT [FK_AUDIT_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUDIT_OperationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT]'))
ALTER TABLE [dbo].[AUDIT]  WITH CHECK ADD  CONSTRAINT [FK_AUDIT_OperationTypes] FOREIGN KEY([IdOperationType])
REFERENCES [dbo].[OperationTypes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AUDIT_OperationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AUDIT]'))
ALTER TABLE [dbo].[AUDIT] CHECK CONSTRAINT [FK_AUDIT_OperationTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AutomatedSendProperties_WidgetTemplateFeature]') AND parent_object_id = OBJECT_ID(N'[dbo].[AutomatedSendProperties]'))
ALTER TABLE [dbo].[AutomatedSendProperties]  WITH CHECK ADD  CONSTRAINT [FK_AutomatedSendProperties_WidgetTemplateFeature] FOREIGN KEY([IdWidgetFeature])
REFERENCES [dbo].[WidgetTemplateFeature] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AutomatedSendProperties_WidgetTemplateFeature]') AND parent_object_id = OBJECT_ID(N'[dbo].[AutomatedSendProperties]'))
ALTER TABLE [dbo].[AutomatedSendProperties] CHECK CONSTRAINT [FK_AutomatedSendProperties_WidgetTemplateFeature]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BackgroundServiceMonitor_BackgroundServiceProcess]') AND parent_object_id = OBJECT_ID(N'[dbo].[BackgroundServiceMonitor]'))
ALTER TABLE [dbo].[BackgroundServiceMonitor]  WITH CHECK ADD  CONSTRAINT [FK_BackgroundServiceMonitor_BackgroundServiceProcess] FOREIGN KEY([IDProcess])
REFERENCES [dbo].[BackgroundServiceProcess] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BackgroundServiceMonitor_BackgroundServiceProcess]') AND parent_object_id = OBJECT_ID(N'[dbo].[BackgroundServiceMonitor]'))
ALTER TABLE [dbo].[BackgroundServiceMonitor] CHECK CONSTRAINT [FK_BackgroundServiceMonitor_BackgroundServiceProcess]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BackgroundServiceMonitor_CategoriesAUDIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[BackgroundServiceMonitor]'))
ALTER TABLE [dbo].[BackgroundServiceMonitor]  WITH CHECK ADD  CONSTRAINT [FK_BackgroundServiceMonitor_CategoriesAUDIT] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[CategoriesAUDIT] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BackgroundServiceMonitor_CategoriesAUDIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[BackgroundServiceMonitor]'))
ALTER TABLE [dbo].[BackgroundServiceMonitor] CHECK CONSTRAINT [FK_BackgroundServiceMonitor_CategoriesAUDIT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Commitment_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Commitment]'))
ALTER TABLE [dbo].[Commitment]  WITH CHECK ADD  CONSTRAINT [FK_Commitment_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Commitment_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Commitment]'))
ALTER TABLE [dbo].[Commitment] CHECK CONSTRAINT [FK_Commitment_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyHistorical_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyHistorical]'))
ALTER TABLE [dbo].[CompanyHistorical]  WITH CHECK ADD  CONSTRAINT [FK_CompanyHistorical_AccGroup] FOREIGN KEY([IDAccgroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyHistorical_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyHistorical]'))
ALTER TABLE [dbo].[CompanyHistorical] CHECK CONSTRAINT [FK_CompanyHistorical_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyHistorical_Language]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyHistorical]'))
ALTER TABLE [dbo].[CompanyHistorical]  WITH CHECK ADD  CONSTRAINT [FK_CompanyHistorical_Language] FOREIGN KEY([IDLanguage])
REFERENCES [dbo].[Languages] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyHistorical_Language]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyHistorical]'))
ALTER TABLE [dbo].[CompanyHistorical] CHECK CONSTRAINT [FK_CompanyHistorical_Language]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyHistorical_License]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyHistorical]'))
ALTER TABLE [dbo].[CompanyHistorical]  WITH CHECK ADD  CONSTRAINT [FK_CompanyHistorical_License] FOREIGN KEY([IDLicense])
REFERENCES [dbo].[Licenses] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyHistorical_License]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyHistorical]'))
ALTER TABLE [dbo].[CompanyHistorical] CHECK CONSTRAINT [FK_CompanyHistorical_License]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConfigProperties_SignedProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigProperties]'))
ALTER TABLE [dbo].[ConfigProperties]  WITH CHECK ADD  CONSTRAINT [FK_ConfigProperties_SignedProperties] FOREIGN KEY([IDSignedP])
REFERENCES [dbo].[SignedProperties] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConfigProperties_SignedProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigProperties]'))
ALTER TABLE [dbo].[ConfigProperties] CHECK CONSTRAINT [FK_ConfigProperties_SignedProperties]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacts]'))
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacts]'))
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldAdmin_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdmin]'))
ALTER TABLE [dbo].[CustomFieldsAdmin]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldAdmin_AccGroup] FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldAdmin_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdmin]'))
ALTER TABLE [dbo].[CustomFieldsAdmin] CHECK CONSTRAINT [FK_CustomFieldAdmin_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldAdmin_CategoriesAUDIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdmin]'))
ALTER TABLE [dbo].[CustomFieldsAdmin]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldAdmin_CategoriesAUDIT] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[CategoriesAUDIT] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldAdmin_CategoriesAUDIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdmin]'))
ALTER TABLE [dbo].[CustomFieldsAdmin] CHECK CONSTRAINT [FK_CustomFieldAdmin_CategoriesAUDIT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdmin_CustomFieldsAdminType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdmin]'))
ALTER TABLE [dbo].[CustomFieldsAdmin]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsAdmin_CustomFieldsAdminType] FOREIGN KEY([IdCustomFieldsAdminType])
REFERENCES [dbo].[CustomFieldsAdminType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdmin_CustomFieldsAdminType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdmin]'))
ALTER TABLE [dbo].[CustomFieldsAdmin] CHECK CONSTRAINT [FK_CustomFieldsAdmin_CustomFieldsAdminType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminPlaces_CategoriesAUDIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminPlaces]'))
ALTER TABLE [dbo].[CustomFieldsAdminPlaces]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsAdminPlaces_CategoriesAUDIT] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[CategoriesAUDIT] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminPlaces_CategoriesAUDIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminPlaces]'))
ALTER TABLE [dbo].[CustomFieldsAdminPlaces] CHECK CONSTRAINT [FK_CustomFieldsAdminPlaces_CategoriesAUDIT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminSetPlaces_CustomFieldsAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminSetPlaces]'))
ALTER TABLE [dbo].[CustomFieldsAdminSetPlaces]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsAdminSetPlaces_CustomFieldsAdmin] FOREIGN KEY([IdCFAdmin])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminSetPlaces_CustomFieldsAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminSetPlaces]'))
ALTER TABLE [dbo].[CustomFieldsAdminSetPlaces] CHECK CONSTRAINT [FK_CustomFieldsAdminSetPlaces_CustomFieldsAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminSetPlaces_CustomFieldsAdminPlaces]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminSetPlaces]'))
ALTER TABLE [dbo].[CustomFieldsAdminSetPlaces]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsAdminSetPlaces_CustomFieldsAdminPlaces] FOREIGN KEY([IdCFAPlaces])
REFERENCES [dbo].[CustomFieldsAdminPlaces] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminSetPlaces_CustomFieldsAdminPlaces]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminSetPlaces]'))
ALTER TABLE [dbo].[CustomFieldsAdminSetPlaces] CHECK CONSTRAINT [FK_CustomFieldsAdminSetPlaces_CustomFieldsAdminPlaces]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminShowValues_CustomFieldsAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminShowValues]'))
ALTER TABLE [dbo].[CustomFieldsAdminShowValues]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsAdminShowValues_CustomFieldsAdmin] FOREIGN KEY([IdCustomFieldsAdmin])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsAdminShowValues_CustomFieldsAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsAdminShowValues]'))
ALTER TABLE [dbo].[CustomFieldsAdminShowValues] CHECK CONSTRAINT [FK_CustomFieldsAdminShowValues_CustomFieldsAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocuments_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocuments]'))
ALTER TABLE [dbo].[CustomFieldsDocuments]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldDocuments_CustomFieldAdmin] FOREIGN KEY([IdField])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocuments_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocuments]'))
ALTER TABLE [dbo].[CustomFieldsDocuments] CHECK CONSTRAINT [FK_CustomFieldDocuments_CustomFieldAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocuments_SrDocumentsStepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocuments]'))
ALTER TABLE [dbo].[CustomFieldsDocuments]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldDocuments_SrDocumentsStepsWFI] FOREIGN KEY([IdSrDocumentsStepsWFI])
REFERENCES [dbo].[SrDocumentsStepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocuments_SrDocumentsStepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocuments]'))
ALTER TABLE [dbo].[CustomFieldsDocuments] CHECK CONSTRAINT [FK_CustomFieldDocuments_SrDocumentsStepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocumentsDraft_SrDocumentsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocumentsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsDocumentsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldDocumentsDraft_SrDocumentsDrafts] FOREIGN KEY([IdSrDocumentDraft])
REFERENCES [dbo].[SrDocumentsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocumentsDraft_SrDocumentsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocumentsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsDocumentsDrafts] CHECK CONSTRAINT [FK_CustomFieldDocumentsDraft_SrDocumentsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocumentsDrafts_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocumentsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsDocumentsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldDocumentsDrafts_CustomFieldAdmin] FOREIGN KEY([IdField])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldDocumentsDrafts_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsDocumentsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsDocumentsDrafts] CHECK CONSTRAINT [FK_CustomFieldDocumentsDrafts_CustomFieldAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsExternalSignature_CustomFieldsAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsExternalSignature]'))
ALTER TABLE [dbo].[CustomFieldsExternalSignature]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsExternalSignature_CustomFieldsAdmin] FOREIGN KEY([IdField])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsExternalSignature_CustomFieldsAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsExternalSignature]'))
ALTER TABLE [dbo].[CustomFieldsExternalSignature] CHECK CONSTRAINT [FK_CustomFieldsExternalSignature_CustomFieldsAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsExternalSignature_ExternalSignatures]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsExternalSignature]'))
ALTER TABLE [dbo].[CustomFieldsExternalSignature]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsExternalSignature_ExternalSignatures] FOREIGN KEY([IdExternalSignature])
REFERENCES [dbo].[ExternalSignatures] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsExternalSignature_ExternalSignatures]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsExternalSignature]'))
ALTER TABLE [dbo].[CustomFieldsExternalSignature] CHECK CONSTRAINT [FK_CustomFieldsExternalSignature_ExternalSignatures]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequest_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequests]'))
ALTER TABLE [dbo].[CustomFieldsRequests]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldRequest_CustomFieldAdmin] FOREIGN KEY([IdField])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequest_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequests]'))
ALTER TABLE [dbo].[CustomFieldsRequests] CHECK CONSTRAINT [FK_CustomFieldRequest_CustomFieldAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequest_CustomFieldRequest]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequests]'))
ALTER TABLE [dbo].[CustomFieldsRequests]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldRequest_CustomFieldRequest] FOREIGN KEY([IdSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequest_CustomFieldRequest]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequests]'))
ALTER TABLE [dbo].[CustomFieldsRequests] CHECK CONSTRAINT [FK_CustomFieldRequest_CustomFieldRequest]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequestDraft_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequestsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsRequestsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldRequestDraft_SignRequestsDrafts] FOREIGN KEY([IdSignRequestDraft])
REFERENCES [dbo].[SignRequestsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequestDraft_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequestsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsRequestsDrafts] CHECK CONSTRAINT [FK_CustomFieldRequestDraft_SignRequestsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequestsDrafts_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequestsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsRequestsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldRequestsDrafts_CustomFieldAdmin] FOREIGN KEY([IdField])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldRequestsDrafts_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsRequestsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsRequestsDrafts] CHECK CONSTRAINT [FK_CustomFieldRequestsDrafts_CustomFieldAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsStepsDrafts_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsStepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldsStepsDrafts_CustomFieldAdmin] FOREIGN KEY([idField])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldsStepsDrafts_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsStepsDrafts] CHECK CONSTRAINT [FK_CustomFieldsStepsDrafts_CustomFieldAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldStepsDrafts_CustomFieldStepsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsStepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldStepsDrafts_CustomFieldStepsDrafts] FOREIGN KEY([IdStepDraft])
REFERENCES [dbo].[StepsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldStepsDrafts_CustomFieldStepsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsDrafts]'))
ALTER TABLE [dbo].[CustomFieldsStepsDrafts] CHECK CONSTRAINT [FK_CustomFieldStepsDrafts_CustomFieldStepsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldStepsWFI_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsWFI]'))
ALTER TABLE [dbo].[CustomFieldsStepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldStepsWFI_CustomFieldAdmin] FOREIGN KEY([IdField])
REFERENCES [dbo].[CustomFieldsAdmin] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldStepsWFI_CustomFieldAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsWFI]'))
ALTER TABLE [dbo].[CustomFieldsStepsWFI] CHECK CONSTRAINT [FK_CustomFieldStepsWFI_CustomFieldAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldStepsWFI_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsWFI]'))
ALTER TABLE [dbo].[CustomFieldsStepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_CustomFieldStepsWFI_StepsWFI] FOREIGN KEY([IdStepWFI])
REFERENCES [dbo].[StepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomFieldStepsWFI_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomFieldsStepsWFI]'))
ALTER TABLE [dbo].[CustomFieldsStepsWFI] CHECK CONSTRAINT [FK_CustomFieldStepsWFI_StepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DelegatesProfiles_Profiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesProfiles]'))
ALTER TABLE [dbo].[DelegatesProfiles]  WITH CHECK ADD  CONSTRAINT [FK_DelegatesProfiles_Profiles] FOREIGN KEY([IDProfile])
REFERENCES [dbo].[Profiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DelegatesProfiles_Profiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesProfiles]'))
ALTER TABLE [dbo].[DelegatesProfiles] CHECK CONSTRAINT [FK_DelegatesProfiles_Profiles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DelegatesProfiles_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesProfiles]'))
ALTER TABLE [dbo].[DelegatesProfiles]  WITH CHECK ADD  CONSTRAINT [FK_DelegatesProfiles_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DelegatesProfiles_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesProfiles]'))
ALTER TABLE [dbo].[DelegatesProfiles] CHECK CONSTRAINT [FK_DelegatesProfiles_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_DelegatesUsers_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesUsers]'))
ALTER TABLE [dbo].[DelegatesUsers]  WITH CHECK ADD  CONSTRAINT [FK_Users_DelegatesUsers_FK1] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_DelegatesUsers_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesUsers]'))
ALTER TABLE [dbo].[DelegatesUsers] CHECK CONSTRAINT [FK_Users_DelegatesUsers_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_DelegatesUsers_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesUsers]'))
ALTER TABLE [dbo].[DelegatesUsers]  WITH CHECK ADD  CONSTRAINT [FK_Users_DelegatesUsers_FK2] FOREIGN KEY([IDDelegate])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_DelegatesUsers_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegatesUsers]'))
ALTER TABLE [dbo].[DelegatesUsers] CHECK CONSTRAINT [FK_Users_DelegatesUsers_FK2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_DelegateUsersProfile_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegateUsersProfiles]'))
ALTER TABLE [dbo].[DelegateUsersProfiles]  WITH CHECK ADD  CONSTRAINT [FK_Profiles_DelegateUsersProfile_FK1] FOREIGN KEY([IDProfile])
REFERENCES [dbo].[Profiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_DelegateUsersProfile_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegateUsersProfiles]'))
ALTER TABLE [dbo].[DelegateUsersProfiles] CHECK CONSTRAINT [FK_Profiles_DelegateUsersProfile_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_DelegateUsersProfile_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegateUsersProfiles]'))
ALTER TABLE [dbo].[DelegateUsersProfiles]  WITH CHECK ADD  CONSTRAINT [FK_Users_DelegateUsersProfile_FK1] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_DelegateUsersProfile_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DelegateUsersProfiles]'))
ALTER TABLE [dbo].[DelegateUsersProfiles] CHECK CONSTRAINT [FK_Users_DelegateUsersProfile_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentSignFormat_DocumentType]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentSignFormat]'))
ALTER TABLE [dbo].[DocumentSignFormat]  WITH CHECK ADD  CONSTRAINT [FK_DocumentSignFormat_DocumentType] FOREIGN KEY([IDDocumentType])
REFERENCES [dbo].[DocumentType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentSignFormat_DocumentType]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentSignFormat]'))
ALTER TABLE [dbo].[DocumentSignFormat] CHECK CONSTRAINT [FK_DocumentSignFormat_DocumentType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentSignFormat_SignType]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentSignFormat]'))
ALTER TABLE [dbo].[DocumentSignFormat]  WITH CHECK ADD  CONSTRAINT [FK_DocumentSignFormat_SignType] FOREIGN KEY([IDSignFormat])
REFERENCES [dbo].[SignFormats] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentSignFormat_SignType]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentSignFormat]'))
ALTER TABLE [dbo].[DocumentSignFormat] CHECK CONSTRAINT [FK_DocumentSignFormat_SignType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentumMigration_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentumMigration]'))
ALTER TABLE [dbo].[DocumentumMigration]  WITH CHECK ADD  CONSTRAINT [FK_DocumentumMigration_Documents] FOREIGN KEY([IdDocument])
REFERENCES [dbo].[Documents] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentumMigration_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentumMigration]'))
ALTER TABLE [dbo].[DocumentumMigration] CHECK CONSTRAINT [FK_DocumentumMigration_Documents]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentumMigration_DocumentumMigrationStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentumMigration]'))
ALTER TABLE [dbo].[DocumentumMigration]  WITH CHECK ADD  CONSTRAINT [FK_DocumentumMigration_DocumentumMigrationStates] FOREIGN KEY([IdDocumentumState])
REFERENCES [dbo].[DocumentumMigrationStates] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentumMigration_DocumentumMigrationStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentumMigration]'))
ALTER TABLE [dbo].[DocumentumMigration] CHECK CONSTRAINT [FK_DocumentumMigration_DocumentumMigrationStates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionReasonDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions]  WITH CHECK ADD  CONSTRAINT [FK_ActionReasonDossierActions] FOREIGN KEY([IDActionReason])
REFERENCES [dbo].[ActionReasons] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionReasonDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions] CHECK CONSTRAINT [FK_ActionReasonDossierActions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionTypeDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions]  WITH CHECK ADD  CONSTRAINT [FK_ActionTypeDossierActions] FOREIGN KEY([IDActionType])
REFERENCES [dbo].[ActionTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionTypeDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions] CHECK CONSTRAINT [FK_ActionTypeDossierActions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions]  WITH CHECK ADD  CONSTRAINT [FK_DossierDossierActions] FOREIGN KEY([IDDossier])
REFERENCES [dbo].[Dossiers] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions] CHECK CONSTRAINT [FK_DossierDossierActions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions]  WITH CHECK ADD  CONSTRAINT [FK_UserDossierActions] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDossierActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[DossierActions]'))
ALTER TABLE [dbo].[DossierActions] CHECK CONSTRAINT [FK_UserDossierActions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dossiers_Entities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers]  WITH CHECK ADD  CONSTRAINT [FK_Dossiers_Entities] FOREIGN KEY([IDEntity])
REFERENCES [dbo].[Entities] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dossiers_Entities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers] CHECK CONSTRAINT [FK_Dossiers_Entities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dossiers_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers]  WITH CHECK ADD  CONSTRAINT [FK_Dossiers_Users] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dossiers_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers] CHECK CONSTRAINT [FK_Dossiers_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierState_Dossier]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers]  WITH CHECK ADD  CONSTRAINT [FK_DossierState_Dossier] FOREIGN KEY([IDState])
REFERENCES [dbo].[DossierStates] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierState_Dossier]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers] CHECK CONSTRAINT [FK_DossierState_Dossier]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierType_Dossier]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers]  WITH CHECK ADD  CONSTRAINT [FK_DossierType_Dossier] FOREIGN KEY([IDType])
REFERENCES [dbo].[DossierTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DossierType_Dossier]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dossiers]'))
ALTER TABLE [dbo].[Dossiers] CHECK CONSTRAINT [FK_DossierType_Dossier]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures]  WITH CHECK ADD  CONSTRAINT [FK_ExternalSignatures_AccGroup] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures] CHECK CONSTRAINT [FK_ExternalSignatures_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures]  WITH CHECK ADD  CONSTRAINT [FK_ExternalSignatures_Documents] FOREIGN KEY([IDDocuments])
REFERENCES [dbo].[Documents] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures] CHECK CONSTRAINT [FK_ExternalSignatures_Documents]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures]  WITH CHECK ADD  CONSTRAINT [FK_ExternalSignatures_SignatureTypes] FOREIGN KEY([IDSignatureTypes])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures] CHECK CONSTRAINT [FK_ExternalSignatures_SignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_States]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures]  WITH CHECK ADD  CONSTRAINT [FK_ExternalSignatures_States] FOREIGN KEY([IDStates])
REFERENCES [dbo].[States] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_States]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures] CHECK CONSTRAINT [FK_ExternalSignatures_States]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures]  WITH CHECK ADD  CONSTRAINT [FK_ExternalSignatures_Users] FOREIGN KEY([IDUsers])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExternalSignatures_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalSignatures]'))
ALTER TABLE [dbo].[ExternalSignatures] CHECK CONSTRAINT [FK_ExternalSignatures_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_FirVoxConfigurations_Attributes] FOREIGN KEY([IDAtr_Firvox_PageLocation])
REFERENCES [dbo].[Attributes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations] CHECK CONSTRAINT [FK_FirVoxConfigurations_Attributes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_Attributes1]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_FirVoxConfigurations_Attributes1] FOREIGN KEY([IDAtr_Firvox_Orientation])
REFERENCES [dbo].[Attributes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_Attributes1]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations] CHECK CONSTRAINT [FK_FirVoxConfigurations_Attributes1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_Attributes2]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_FirVoxConfigurations_Attributes2] FOREIGN KEY([IDAtr_Firvox_SigPage])
REFERENCES [dbo].[Attributes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_Attributes2]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations] CHECK CONSTRAINT [FK_FirVoxConfigurations_Attributes2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_FirVoxConfigurations_SignRequests] FOREIGN KEY([IDSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FirVoxConfigurations_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[FirVoxConfigurations]'))
ALTER TABLE [dbo].[FirVoxConfigurations] CHECK CONSTRAINT [FK_FirVoxConfigurations_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FontFormat_FamilyFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FontFormat]'))
ALTER TABLE [dbo].[FontFormat]  WITH CHECK ADD  CONSTRAINT [FK_FontFormat_FamilyFormat] FOREIGN KEY([IDFontFamily])
REFERENCES [dbo].[FontFamily] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FontFormat_FamilyFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FontFormat]'))
ALTER TABLE [dbo].[FontFormat] CHECK CONSTRAINT [FK_FontFormat_FamilyFormat]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IDFor__33758E3C]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget]  WITH CHECK ADD FOREIGN KEY([IDFormWidgetMandatoryType])
REFERENCES [dbo].[FormWidgetMandatoryType] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IdFor__71A7CADF]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget]  WITH CHECK ADD FOREIGN KEY([IdFormWidgetDirection])
REFERENCES [dbo].[FormWidgetDirection] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidget_FormWidgetGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget]  WITH CHECK ADD  CONSTRAINT [FK_FormWidget_FormWidgetGroup] FOREIGN KEY([IdFormWidgetGroup])
REFERENCES [dbo].[FormWidgetGroups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidget_FormWidgetGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget] CHECK CONSTRAINT [FK_FormWidget_FormWidgetGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidget_FormWidgetTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget]  WITH CHECK ADD  CONSTRAINT [FK_FormWidget_FormWidgetTemplate] FOREIGN KEY([IDWidgetTemplate])
REFERENCES [dbo].[FormWidgetTemplate] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidget_FormWidgetTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget] CHECK CONSTRAINT [FK_FormWidget_FormWidgetTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgets_DateFormats]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgets_DateFormats] FOREIGN KEY([IDDateFormat])
REFERENCES [dbo].[DateFormat] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgets_DateFormats]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget] CHECK CONSTRAINT [FK_FormWidgets_DateFormats]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgets_FontFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgets_FontFormat] FOREIGN KEY([IDFontFormat])
REFERENCES [dbo].[FontFormat] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgets_FontFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget] CHECK CONSTRAINT [FK_FormWidgets_FontFormat]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgets_WidgetType]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgets_WidgetType] FOREIGN KEY([IDWidgetType])
REFERENCES [dbo].[WidgetType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgets_WidgetType]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidget]'))
ALTER TABLE [dbo].[FormWidget] CHECK CONSTRAINT [FK_FormWidgets_WidgetType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IDFor__318D45CA]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft]  WITH CHECK ADD FOREIGN KEY([IDFormWidgetMandatoryType])
REFERENCES [dbo].[FormWidgetMandatoryType] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IdFor__6359AB88]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft]  WITH CHECK ADD FOREIGN KEY([IdFormWidgetGroup])
REFERENCES [dbo].[FormWidgetGroups] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IdFor__729BEF18]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft]  WITH CHECK ADD FOREIGN KEY([IdFormWidgetDirection])
REFERENCES [dbo].[FormWidgetDirection] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_DateFormats]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgetsDraft_DateFormats] FOREIGN KEY([IDDateFormat])
REFERENCES [dbo].[DateFormat] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_DateFormats]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft] CHECK CONSTRAINT [FK_FormWidgetsDraft_DateFormats]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_FontFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgetsDraft_FontFormat] FOREIGN KEY([IDFontFormat])
REFERENCES [dbo].[FontFormat] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_FontFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft] CHECK CONSTRAINT [FK_FormWidgetsDraft_FontFormat]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_FormWidgetTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgetsDraft_FormWidgetTemplate] FOREIGN KEY([IDWidgetTemplate])
REFERENCES [dbo].[FormWidgetTemplate] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_FormWidgetTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft] CHECK CONSTRAINT [FK_FormWidgetsDraft_FormWidgetTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_WidgetType]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgetsDraft_WidgetType] FOREIGN KEY([IDWidgetType])
REFERENCES [dbo].[WidgetType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetsDraft_WidgetType]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetsDraft]'))
ALTER TABLE [dbo].[FormWidgetsDraft] CHECK CONSTRAINT [FK_FormWidgetsDraft_WidgetType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IDFor__2FA4FD58]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD FOREIGN KEY([IDFormWidgetMandatoryType])
REFERENCES [dbo].[FormWidgetMandatoryType] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IdFor__644DCFC1]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD FOREIGN KEY([IdFormWidgetGroup])
REFERENCES [dbo].[FormWidgetGroups] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FormWidge__IdFor__73901351]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD FOREIGN KEY([IdFormWidgetDirection])
REFERENCES [dbo].[FormWidgetDirection] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetTemplate_DateFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgetTemplate_DateFormat] FOREIGN KEY([IDDateFormat])
REFERENCES [dbo].[DateFormat] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetTemplate_DateFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate] CHECK CONSTRAINT [FK_FormWidgetTemplate_DateFormat]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetTemplate_FontFormat1]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgetTemplate_FontFormat1] FOREIGN KEY([IDFontFormat])
REFERENCES [dbo].[FontFormat] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetTemplate_FontFormat1]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate] CHECK CONSTRAINT [FK_FormWidgetTemplate_FontFormat1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetTemplate_WigdetTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD  CONSTRAINT [FK_FormWidgetTemplate_WigdetTypes] FOREIGN KEY([IDWidgetType])
REFERENCES [dbo].[WidgetType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormWidgetTemplate_WigdetTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[FormWidgetTemplate]'))
ALTER TABLE [dbo].[FormWidgetTemplate] CHECK CONSTRAINT [FK_FormWidgetTemplate_WigdetTypes]
GO
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD FOREIGN KEY([IdSignRequestDraft])
REFERENCES [dbo].[SignRequestsDrafts] ([ID])
GO
ALTER TABLE [dbo].[FormWidgetTemplate]  WITH CHECK ADD FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IntegratorKeys_AutenticationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[IntegratorKeys]'))
ALTER TABLE [dbo].[IntegratorKeys]  WITH CHECK ADD  CONSTRAINT [FK_IntegratorKeys_AutenticationTypes] FOREIGN KEY([IdAuthenticationType])
REFERENCES [dbo].[AutenticationTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IntegratorKeys_AutenticationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[IntegratorKeys]'))
ALTER TABLE [dbo].[IntegratorKeys] CHECK CONSTRAINT [FK_IntegratorKeys_AutenticationTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IdMessageCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Messages]'))
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_IdMessageCategory] FOREIGN KEY([IdMessageCategory])
REFERENCES [dbo].[MessageCategory] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IdMessageCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Messages]'))
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_IdMessageCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_idTipoMensaje_Mensajes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Messages]'))
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_idTipoMensaje_Mensajes] FOREIGN KEY([idMessageType])
REFERENCES [dbo].[MesssageType] ([idMessageType])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_idTipoMensaje_Mensajes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Messages]'))
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_idTipoMensaje_Mensajes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Metadata_MetadataProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataProfiles]'))
ALTER TABLE [dbo].[MetadataProfiles]  WITH CHECK ADD  CONSTRAINT [FK_Metadata_MetadataProfiles_FK1] FOREIGN KEY([IDMetadata])
REFERENCES [dbo].[Metadatas] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Metadata_MetadataProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataProfiles]'))
ALTER TABLE [dbo].[MetadataProfiles] CHECK CONSTRAINT [FK_Metadata_MetadataProfiles_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_MetadataProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataProfiles]'))
ALTER TABLE [dbo].[MetadataProfiles]  WITH CHECK ADD  CONSTRAINT [FK_Profiles_MetadataProfiles_FK1] FOREIGN KEY([IDProfile])
REFERENCES [dbo].[Profiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_MetadataProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataProfiles]'))
ALTER TABLE [dbo].[MetadataProfiles] CHECK CONSTRAINT [FK_Profiles_MetadataProfiles_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Metadata_MetadataSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataSigRequests]'))
ALTER TABLE [dbo].[MetadataSigRequests]  WITH CHECK ADD  CONSTRAINT [FK_Metadata_MetadataSigRequests_FK1] FOREIGN KEY([IDMetadata])
REFERENCES [dbo].[Metadatas] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Metadata_MetadataSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataSigRequests]'))
ALTER TABLE [dbo].[MetadataSigRequests] CHECK CONSTRAINT [FK_Metadata_MetadataSigRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_MetadataSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataSigRequests]'))
ALTER TABLE [dbo].[MetadataSigRequests]  WITH CHECK ADD  CONSTRAINT [FK_SignRequests_MetadataSigRequests_FK1] FOREIGN KEY([IDSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_MetadataSigRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataSigRequests]'))
ALTER TABLE [dbo].[MetadataSigRequests] CHECK CONSTRAINT [FK_SignRequests_MetadataSigRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFileContentErrors_MultiSignRequestDraftFiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFileContentErrors]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFileContentErrors]  WITH CHECK ADD  CONSTRAINT [FK_MultiSignRequestDraftFileContentErrors_MultiSignRequestDraftFiles] FOREIGN KEY([IdMultiSignRequestDraftFiles])
REFERENCES [dbo].[MultiSignRequestDraftFiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFileContentErrors_MultiSignRequestDraftFiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFileContentErrors]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFileContentErrors] CHECK CONSTRAINT [FK_MultiSignRequestDraftFileContentErrors_MultiSignRequestDraftFiles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFileContents_MultiSignRequestDraftFiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFileContents]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFileContents]  WITH CHECK ADD  CONSTRAINT [FK_MultiSignRequestDraftFileContents_MultiSignRequestDraftFiles] FOREIGN KEY([IdMultiSignRequestDraftFiles])
REFERENCES [dbo].[MultiSignRequestDraftFiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFileContents_MultiSignRequestDraftFiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFileContents]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFileContents] CHECK CONSTRAINT [FK_MultiSignRequestDraftFileContents_MultiSignRequestDraftFiles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFiles_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFiles]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFiles]  WITH CHECK ADD  CONSTRAINT [FK_MultiSignRequestDraftFiles_SignatureTypes] FOREIGN KEY([IdSignatureType])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFiles_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFiles]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFiles] CHECK CONSTRAINT [FK_MultiSignRequestDraftFiles_SignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFiles_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFiles]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFiles]  WITH CHECK ADD  CONSTRAINT [FK_MultiSignRequestDraftFiles_SignRequestsDrafts] FOREIGN KEY([IdSignRequestDraft])
REFERENCES [dbo].[SignRequestsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFiles_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFiles]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFiles] CHECK CONSTRAINT [FK_MultiSignRequestDraftFiles_SignRequestsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFiles_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFiles]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFiles]  WITH CHECK ADD  CONSTRAINT [FK_MultiSignRequestDraftFiles_WFActionType] FOREIGN KEY([IdWFActionType])
REFERENCES [dbo].[WFActionType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MultiSignRequestDraftFiles_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[MultiSignRequestDraftFiles]'))
ALTER TABLE [dbo].[MultiSignRequestDraftFiles] CHECK CONSTRAINT [FK_MultiSignRequestDraftFiles_WFActionType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_AccGrop]') AND parent_object_id = OBJECT_ID(N'[dbo].[NotificationsConfigs]'))
ALTER TABLE [dbo].[NotificationsConfigs]  WITH CHECK ADD  CONSTRAINT [fk_AccGrop] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_AccGrop]') AND parent_object_id = OBJECT_ID(N'[dbo].[NotificationsConfigs]'))
ALTER TABLE [dbo].[NotificationsConfigs] CHECK CONSTRAINT [fk_AccGrop]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions]  WITH CHECK ADD  CONSTRAINT [FK_OtpActions_AccGroup] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions] CHECK CONSTRAINT [FK_OtpActions_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_ActionOTPTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions]  WITH CHECK ADD  CONSTRAINT [FK_OtpActions_ActionOTPTypes] FOREIGN KEY([IDActionOTPTypes])
REFERENCES [dbo].[ActionOTPTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_ActionOTPTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions] CHECK CONSTRAINT [FK_OtpActions_ActionOTPTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_OtpStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions]  WITH CHECK ADD  CONSTRAINT [FK_OtpActions_OtpStates] FOREIGN KEY([IDOTPState])
REFERENCES [dbo].[OtpStates] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_OtpStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions] CHECK CONSTRAINT [FK_OtpActions_OtpStates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions]  WITH CHECK ADD  CONSTRAINT [FK_OtpActions_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtpActions_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtpActions]'))
ALTER TABLE [dbo].[OtpActions] CHECK CONSTRAINT [FK_OtpActions_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PdfSignatureParametersTemplates_WidgetWFTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[PdfSignatureParametersTemplates]'))
ALTER TABLE [dbo].[PdfSignatureParametersTemplates]  WITH CHECK ADD  CONSTRAINT [FK_PdfSignatureParametersTemplates_WidgetWFTemplate] FOREIGN KEY([IdWidgetWFTemplate])
REFERENCES [dbo].[WidgetWFTemplate] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PdfSignatureParametersTemplates_WidgetWFTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[PdfSignatureParametersTemplates]'))
ALTER TABLE [dbo].[PdfSignatureParametersTemplates] CHECK CONSTRAINT [FK_PdfSignatureParametersTemplates_WidgetWFTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermissionsGroups_PermissionsGroupsMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermissionsGroups]'))
ALTER TABLE [dbo].[PermissionsGroups]  WITH CHECK ADD  CONSTRAINT [FK_PermissionsGroups_PermissionsGroupsMaster] FOREIGN KEY([IDPermissionsGroupMaster])
REFERENCES [dbo].[PermissionsGroupsMaster] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermissionsGroups_PermissionsGroupsMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermissionsGroups]'))
ALTER TABLE [dbo].[PermissionsGroups] CHECK CONSTRAINT [FK_PermissionsGroups_PermissionsGroupsMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermissionsGroups_SignPermissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermissionsGroups]'))
ALTER TABLE [dbo].[PermissionsGroups]  WITH CHECK ADD  CONSTRAINT [FK_PermissionsGroups_SignPermissions] FOREIGN KEY([IDSignPermissions])
REFERENCES [dbo].[SignPermissions] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermissionsGroups_SignPermissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermissionsGroups]'))
ALTER TABLE [dbo].[PermissionsGroups] CHECK CONSTRAINT [FK_PermissionsGroups_SignPermissions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_ProfileTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profiles]'))
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [FK_Profiles_ProfileTypes] FOREIGN KEY([IDProfileType])
REFERENCES [dbo].[ProfileTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_ProfileTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profiles]'))
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [FK_Profiles_ProfileTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_DocumentType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign]  WITH CHECK ADD  CONSTRAINT [FK_ProfileSign_DocumentType] FOREIGN KEY([IDDocumentType])
REFERENCES [dbo].[DocumentType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_DocumentType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign] CHECK CONSTRAINT [FK_ProfileSign_DocumentType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_Profile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign]  WITH CHECK ADD  CONSTRAINT [FK_ProfileSign_Profile] FOREIGN KEY([IDProfile])
REFERENCES [dbo].[Profiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_Profile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign] CHECK CONSTRAINT [FK_ProfileSign_Profile]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_SignAlgorithm]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign]  WITH CHECK ADD  CONSTRAINT [FK_ProfileSign_SignAlgorithm] FOREIGN KEY([IDSignAlgorithm])
REFERENCES [dbo].[SignAlgoritms] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_SignAlgorithm]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign] CHECK CONSTRAINT [FK_ProfileSign_SignAlgorithm]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_SignFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign]  WITH CHECK ADD  CONSTRAINT [FK_ProfileSign_SignFormat] FOREIGN KEY([IDSignFormat])
REFERENCES [dbo].[SignFormats] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_SignFormat]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign] CHECK CONSTRAINT [FK_ProfileSign_SignFormat]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_SignType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign]  WITH CHECK ADD  CONSTRAINT [FK_ProfileSign_SignType] FOREIGN KEY([IDSignType])
REFERENCES [dbo].[SignTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileSign_SignType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileSign]'))
ALTER TABLE [dbo].[ProfileSign] CHECK CONSTRAINT [FK_ProfileSign_SignType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepositorySecurity_Repository]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepositorySecurity]'))
ALTER TABLE [dbo].[RepositorySecurity]  WITH CHECK ADD  CONSTRAINT [FK_RepositorySecurity_Repository] FOREIGN KEY([IdRepo])
REFERENCES [dbo].[Repository] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepositorySecurity_Repository]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepositorySecurity]'))
ALTER TABLE [dbo].[RepositorySecurity] CHECK CONSTRAINT [FK_RepositorySecurity_Repository]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepositorySecurity_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepositorySecurity]'))
ALTER TABLE [dbo].[RepositorySecurity]  WITH CHECK ADD  CONSTRAINT [FK_RepositorySecurity_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepositorySecurity_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepositorySecurity]'))
ALTER TABLE [dbo].[RepositorySecurity] CHECK CONSTRAINT [FK_RepositorySecurity_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesPermissions_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesPermissions]'))
ALTER TABLE [dbo].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_Roles] FOREIGN KEY([Roles_ID])
REFERENCES [dbo].[Roles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesPermissions_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesPermissions]'))
ALTER TABLE [dbo].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_Roles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesPermissions_SignPermissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesPermissions]'))
ALTER TABLE [dbo].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_SignPermissions] FOREIGN KEY([SignPermissions_ID])
REFERENCES [dbo].[SignPermissions] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RolesPermissions_SignPermissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[RolesPermissions]'))
ALTER TABLE [dbo].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_SignPermissions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Group_SecurityWFGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFGroup]'))
ALTER TABLE [dbo].[SecurityWFGroup]  WITH CHECK ADD  CONSTRAINT [FK_Group_SecurityWFGroup] FOREIGN KEY([IDGroup])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Group_SecurityWFGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFGroup]'))
ALTER TABLE [dbo].[SecurityWFGroup] CHECK CONSTRAINT [FK_Group_SecurityWFGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityWFGroup_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFGroup]'))
ALTER TABLE [dbo].[SecurityWFGroup]  WITH CHECK ADD  CONSTRAINT [FK_SecurityWFGroup_Users] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityWFGroup_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFGroup]'))
ALTER TABLE [dbo].[SecurityWFGroup] CHECK CONSTRAINT [FK_SecurityWFGroup_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinition_SecurityWFGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFGroup]'))
ALTER TABLE [dbo].[SecurityWFGroup]  WITH CHECK ADD  CONSTRAINT [FK_WFDefinition_SecurityWFGroup] FOREIGN KEY([IDWF])
REFERENCES [dbo].[WFDefinition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinition_SecurityWFGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFGroup]'))
ALTER TABLE [dbo].[SecurityWFGroup] CHECK CONSTRAINT [FK_WFDefinition_SecurityWFGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profile_SecurityWFProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFProfile]'))
ALTER TABLE [dbo].[SecurityWFProfile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_SecurityWFProfile] FOREIGN KEY([IDProfile])
REFERENCES [dbo].[Profiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profile_SecurityWFProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFProfile]'))
ALTER TABLE [dbo].[SecurityWFProfile] CHECK CONSTRAINT [FK_Profile_SecurityWFProfile]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_SecurityWFProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFProfile]'))
ALTER TABLE [dbo].[SecurityWFProfile]  WITH CHECK ADD  CONSTRAINT [FK_User_SecurityWFProfile] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_SecurityWFProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFProfile]'))
ALTER TABLE [dbo].[SecurityWFProfile] CHECK CONSTRAINT [FK_User_SecurityWFProfile]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinition_SecurityWFProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFProfile]'))
ALTER TABLE [dbo].[SecurityWFProfile]  WITH CHECK ADD  CONSTRAINT [FK_WFDefinition_SecurityWFProfile] FOREIGN KEY([IDWF])
REFERENCES [dbo].[WFDefinition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinition_SecurityWFProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFProfile]'))
ALTER TABLE [dbo].[SecurityWFProfile] CHECK CONSTRAINT [FK_WFDefinition_SecurityWFProfile]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreateUser_SecurityWFUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFUser]'))
ALTER TABLE [dbo].[SecurityWFUser]  WITH CHECK ADD  CONSTRAINT [FK_CreateUser_SecurityWFUser] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreateUser_SecurityWFUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFUser]'))
ALTER TABLE [dbo].[SecurityWFUser] CHECK CONSTRAINT [FK_CreateUser_SecurityWFUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityWFUser_FIDUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFUser]'))
ALTER TABLE [dbo].[SecurityWFUser]  WITH CHECK ADD  CONSTRAINT [FK_SecurityWFUser_FIDUser] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityWFUser_FIDUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFUser]'))
ALTER TABLE [dbo].[SecurityWFUser] CHECK CONSTRAINT [FK_SecurityWFUser_FIDUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WF_SecurityWFUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFUser]'))
ALTER TABLE [dbo].[SecurityWFUser]  WITH CHECK ADD  CONSTRAINT [FK_WF_SecurityWFUser] FOREIGN KEY([IDWF])
REFERENCES [dbo].[WFDefinition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WF_SecurityWFUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityWFUser]'))
ALTER TABLE [dbo].[SecurityWFUser] CHECK CONSTRAINT [FK_WF_SecurityWFUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SettingAc__IdSet__01892CED]') AND parent_object_id = OBJECT_ID(N'[dbo].[SettingAccGroup]'))
ALTER TABLE [dbo].[SettingAccGroup]  WITH CHECK ADD FOREIGN KEY([IdSetting])
REFERENCES [dbo].[Settings] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SettingAccGroup_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SettingAccGroup]'))
ALTER TABLE [dbo].[SettingAccGroup]  WITH CHECK ADD  CONSTRAINT [FK_SettingAccGroup_AccGroup] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SettingAccGroup_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SettingAccGroup]'))
ALTER TABLE [dbo].[SettingAccGroup] CHECK CONSTRAINT [FK_SettingAccGroup_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptions_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptions]'))
ALTER TABLE [dbo].[SignatureOptions]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptions_SignatureTypes] FOREIGN KEY([IDSignatureOption])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptions_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptions]'))
ALTER TABLE [dbo].[SignatureOptions] CHECK CONSTRAINT [FK_SignatureOptions_SignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptions_Steps]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptions]'))
ALTER TABLE [dbo].[SignatureOptions]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptions_Steps] FOREIGN KEY([IDStep])
REFERENCES [dbo].[Steps] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptions_Steps]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptions]'))
ALTER TABLE [dbo].[SignatureOptions] CHECK CONSTRAINT [FK_SignatureOptions_Steps]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsDrafts_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptionsDrafts_SignatureTypes] FOREIGN KEY([IDSignatureType])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsDrafts_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsDrafts] CHECK CONSTRAINT [FK_SignatureOptionsDrafts_SignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsDrafts_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptionsDrafts_SignRequestsDrafts] FOREIGN KEY([IDSignRequestDrafts])
REFERENCES [dbo].[SignRequestsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsDrafts_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsDrafts] CHECK CONSTRAINT [FK_SignatureOptionsDrafts_SignRequestsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsDrafts_StepsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptionsDrafts_StepsDrafts] FOREIGN KEY([IDStepDrafts])
REFERENCES [dbo].[StepsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsDrafts_StepsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsDrafts] CHECK CONSTRAINT [FK_SignatureOptionsDrafts_StepsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStep_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStep]'))
ALTER TABLE [dbo].[SignatureOptionsStep]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptionsStep_SignatureTypes] FOREIGN KEY([IDSignatureType])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStep_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStep]'))
ALTER TABLE [dbo].[SignatureOptionsStep] CHECK CONSTRAINT [FK_SignatureOptionsStep_SignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStep_Steps1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStep]'))
ALTER TABLE [dbo].[SignatureOptionsStep]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptionsStep_Steps1] FOREIGN KEY([IDStep])
REFERENCES [dbo].[Steps] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStep_Steps1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStep]'))
ALTER TABLE [dbo].[SignatureOptionsStep] CHECK CONSTRAINT [FK_SignatureOptionsStep_Steps1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStepDrafts_SignatureOptionsStepDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStepDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsStepDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptionsStepDrafts_SignatureOptionsStepDrafts] FOREIGN KEY([IDStepDrafts])
REFERENCES [dbo].[StepsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStepDrafts_SignatureOptionsStepDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStepDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsStepDrafts] CHECK CONSTRAINT [FK_SignatureOptionsStepDrafts_SignatureOptionsStepDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStepDrafts_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStepDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsStepDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SignatureOptionsStepDrafts_SignatureTypes] FOREIGN KEY([IDSignatureType])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignatureOptionsStepDrafts_SignatureTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignatureOptionsStepDrafts]'))
ALTER TABLE [dbo].[SignatureOptionsStepDrafts] CHECK CONSTRAINT [FK_SignatureOptionsStepDrafts_SignatureTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedProperties_Commitment]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedProperties]'))
ALTER TABLE [dbo].[SignedProperties]  WITH CHECK ADD  CONSTRAINT [FK_SignedProperties_Commitment] FOREIGN KEY([IDCommitment])
REFERENCES [dbo].[Commitment] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedProperties_Commitment]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedProperties]'))
ALTER TABLE [dbo].[SignedProperties] CHECK CONSTRAINT [FK_SignedProperties_Commitment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedProperties_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedProperties]'))
ALTER TABLE [dbo].[SignedProperties]  WITH CHECK ADD  CONSTRAINT [FK_SignedProperties_Location] FOREIGN KEY([IDLocation])
REFERENCES [dbo].[Location] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedProperties_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedProperties]'))
ALTER TABLE [dbo].[SignedProperties] CHECK CONSTRAINT [FK_SignedProperties_Location]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedProperties_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedProperties]'))
ALTER TABLE [dbo].[SignedProperties]  WITH CHECK ADD  CONSTRAINT [FK_SignedProperties_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedProperties_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedProperties]'))
ALTER TABLE [dbo].[SignedProperties] CHECK CONSTRAINT [FK_SignedProperties_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedPropertiesForSignSignReq_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedPropertiesForSignSignReq]'))
ALTER TABLE [dbo].[SignedPropertiesForSignSignReq]  WITH CHECK ADD  CONSTRAINT [FK_SignedPropertiesForSignSignReq_SignRequests] FOREIGN KEY([SignRequestId])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignedPropertiesForSignSignReq_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignedPropertiesForSignSignReq]'))
ALTER TABLE [dbo].[SignedPropertiesForSignSignReq] CHECK CONSTRAINT [FK_SignedPropertiesForSignSignReq_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BILLDOCUMENTS_SIGNREQUESTS]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_BILLDOCUMENTS_SIGNREQUESTS] FOREIGN KEY([IDBillDocument])
REFERENCES [dbo].[BillDocuments] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BILLDOCUMENTS_SIGNREQUESTS]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_BILLDOCUMENTS_SIGNREQUESTS]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dossier_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_Dossier_SignRequests_FK1] FOREIGN KEY([IDDossier])
REFERENCES [dbo].[Dossiers] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dossier_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_Dossier_SignRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Groups_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_Groups_SignRequests_FK1] FOREIGN KEY([IDGroupSigner])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Groups_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_Groups_SignRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Petitioner_SignRequests_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_Petitioner_SignRequests_FK2] FOREIGN KEY([IDPetitioner])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Petitioner_SignRequests_FK2]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_Petitioner_SignRequests_FK2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_Profiles_SignRequests_FK1] FOREIGN KEY([IDProfile])
REFERENCES [dbo].[Profiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_Profiles_SignRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reasons_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_Reasons_SignRequests_FK1] FOREIGN KEY([IDReason])
REFERENCES [dbo].[Reasons] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reasons_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_Reasons_SignRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SBActionType_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_SBActionType_SignRequests] FOREIGN KEY([SBAction])
REFERENCES [dbo].[SBActionType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SBActionType_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_SBActionType_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Signer_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_Signer_SignRequests_FK1] FOREIGN KEY([IDSigner])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Signer_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_Signer_SignRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_SignRequests_AccGroup] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_SignRequests_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_States_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests]  WITH CHECK ADD  CONSTRAINT [FK_States_SignRequests_FK1] FOREIGN KEY([IDState])
REFERENCES [dbo].[States] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_States_SignRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequests]'))
ALTER TABLE [dbo].[SignRequests] CHECK CONSTRAINT [FK_States_SignRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Create_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestsDrafts]'))
ALTER TABLE [dbo].[SignRequestsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_Create_User] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Create_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestsDrafts]'))
ALTER TABLE [dbo].[SignRequestsDrafts] CHECK CONSTRAINT [FK_Create_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequestsDrafts_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestsDrafts]'))
ALTER TABLE [dbo].[SignRequestsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SignRequestsDrafts_AccGroup] FOREIGN KEY([IDAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequestsDrafts_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestsDrafts]'))
ALTER TABLE [dbo].[SignRequestsDrafts] CHECK CONSTRAINT [FK_SignRequestsDrafts_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequestsDrafts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestsDrafts]'))
ALTER TABLE [dbo].[SignRequestsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SignRequestsDrafts_Users] FOREIGN KEY([IDPetitioner])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequestsDrafts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestsDrafts]'))
ALTER TABLE [dbo].[SignRequestsDrafts] CHECK CONSTRAINT [FK_SignRequestsDrafts_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FKSignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestUrlAttachments]'))
ALTER TABLE [dbo].[SignRequestUrlAttachments]  WITH CHECK ADD  CONSTRAINT [FKSignRequests] FOREIGN KEY([SignRequestId])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FKSignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SignRequestUrlAttachments]'))
ALTER TABLE [dbo].[SignRequestUrlAttachments] CHECK CONSTRAINT [FKSignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocuments_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocuments]'))
ALTER TABLE [dbo].[SrDocuments]  WITH CHECK ADD  CONSTRAINT [FK_SrDocuments_Documents] FOREIGN KEY([IDDocument])
REFERENCES [dbo].[Documents] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocuments_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocuments]'))
ALTER TABLE [dbo].[SrDocuments] CHECK CONSTRAINT [FK_SrDocuments_Documents]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocuments_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocuments]'))
ALTER TABLE [dbo].[SrDocuments]  WITH CHECK ADD  CONSTRAINT [FK_SrDocuments_SignRequests] FOREIGN KEY([IDSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocuments_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocuments]'))
ALTER TABLE [dbo].[SrDocuments] CHECK CONSTRAINT [FK_SrDocuments_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsDrafts_DocumentsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsDrafts]'))
ALTER TABLE [dbo].[SrDocumentsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SrDocumentsDrafts_DocumentsDrafts] FOREIGN KEY([IDDocumentDraft])
REFERENCES [dbo].[DocumentsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsDrafts_DocumentsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsDrafts]'))
ALTER TABLE [dbo].[SrDocumentsDrafts] CHECK CONSTRAINT [FK_SrDocumentsDrafts_DocumentsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsDrafts_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsDrafts]'))
ALTER TABLE [dbo].[SrDocumentsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_SrDocumentsDrafts_SignRequestsDrafts] FOREIGN KEY([IDSignRequestDraft])
REFERENCES [dbo].[SignRequestsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsDrafts_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsDrafts]'))
ALTER TABLE [dbo].[SrDocumentsDrafts] CHECK CONSTRAINT [FK_SrDocumentsDrafts_SignRequestsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_SrDocumentsStepsWFI_Documents] FOREIGN KEY([IDDocument])
REFERENCES [dbo].[Documents] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_Documents]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI] CHECK CONSTRAINT [FK_SrDocumentsStepsWFI_Documents]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_SrDocumentsStepsWFI_SignRequests] FOREIGN KEY([IDSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI] CHECK CONSTRAINT [FK_SrDocumentsStepsWFI_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_SrDocumentsStepsWFI_StepsWFI] FOREIGN KEY([IDStepWFI])
REFERENCES [dbo].[StepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI] CHECK CONSTRAINT [FK_SrDocumentsStepsWFI_StepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_WidgetLocationsNameMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_SrDocumentsStepsWFI_WidgetLocationsNameMaster] FOREIGN KEY([IdWidgetLocationsNameMaster])
REFERENCES [dbo].[WidgetLocationsNameMaster] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SrDocumentsStepsWFI_WidgetLocationsNameMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SrDocumentsStepsWFI]'))
ALTER TABLE [dbo].[SrDocumentsStepsWFI] CHECK CONSTRAINT [FK_SrDocumentsStepsWFI_WidgetLocationsNameMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__StepAttac__IdDoc__4E298478]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepAttachment]'))
ALTER TABLE [dbo].[StepAttachment]  WITH CHECK ADD FOREIGN KEY([IdDocument])
REFERENCES [dbo].[Documents] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__StepAttac__IDSte__4D35603F]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepAttachment]'))
ALTER TABLE [dbo].[StepAttachment]  WITH CHECK ADD FOREIGN KEY([IDStep])
REFERENCES [dbo].[Steps] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__StepAttac__IDSte__4A58F394]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepAttachmentDrafts]'))
ALTER TABLE [dbo].[StepAttachmentDrafts]  WITH CHECK ADD FOREIGN KEY([IDStepDraft])
REFERENCES [dbo].[StepsDrafts] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_ActionTypes1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_ActionTypes1] FOREIGN KEY([IDActionType])
REFERENCES [dbo].[WFActionType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_ActionTypes1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_ActionTypes1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_Contacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_Contacts] FOREIGN KEY([IDContact])
REFERENCES [dbo].[Contacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_Contacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_Contacts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_Groups] FOREIGN KEY([IDGroup])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_Groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_SuggestedContacts] FOREIGN KEY([IDSuggestedContact])
REFERENCES [dbo].[SuggestedContacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_SuggestedContacts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_WFDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_WFDefinition] FOREIGN KEY([IDWF])
REFERENCES [dbo].[WFDefinition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_WFDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_WFDefinition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_WorkFlowType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_WorkFlowType] FOREIGN KEY([WorkFlowStepType])
REFERENCES [dbo].[WorkFlowType] ([idWorkFlowType])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Steps_WorkFlowType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Steps]'))
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_WorkFlowType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_Contacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_StepsDrafts_Contacts] FOREIGN KEY([IDContact])
REFERENCES [dbo].[Contacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_Contacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [FK_StepsDrafts_Contacts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_StepsDrafts_Groups] FOREIGN KEY([IDGroup])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [FK_StepsDrafts_Groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_StepsDrafts_Languages]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [fk_StepsDrafts_Languages] FOREIGN KEY([IDLanguage])
REFERENCES [dbo].[Languages] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_StepsDrafts_Languages]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [fk_StepsDrafts_Languages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_StepsDrafts_SuggestedContacts] FOREIGN KEY([IdSuggestedContact])
REFERENCES [dbo].[SuggestedContacts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [FK_StepsDrafts_SuggestedContacts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_StepsDrafts_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [FK_StepsDrafts_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_StepsDrafts_WFActionType] FOREIGN KEY([IDActionType])
REFERENCES [dbo].[WFActionType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [FK_StepsDrafts_WFActionType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_WFDefinitionDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_StepsDrafts_WFDefinitionDrafts] FOREIGN KEY([IDWFDraft])
REFERENCES [dbo].[WFDefinitionDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_WFDefinitionDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [FK_StepsDrafts_WFDefinitionDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_WorkFlowType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_StepsDrafts_WorkFlowType] FOREIGN KEY([WorkFlowStepType])
REFERENCES [dbo].[WorkFlowType] ([idWorkFlowType])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsDrafts_WorkFlowType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsDrafts]'))
ALTER TABLE [dbo].[StepsDrafts] CHECK CONSTRAINT [FK_StepsDrafts_WorkFlowType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsForConfigurePositions_PdfSignatureParameters]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsForConfigurePositions]'))
ALTER TABLE [dbo].[StepsForConfigurePositions]  WITH CHECK ADD  CONSTRAINT [FK_StepsForConfigurePositions_PdfSignatureParameters] FOREIGN KEY([PdfSignatureParameters])
REFERENCES [dbo].[PdfSignatureParameters] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsForConfigurePositions_PdfSignatureParameters]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsForConfigurePositions]'))
ALTER TABLE [dbo].[StepsForConfigurePositions] CHECK CONSTRAINT [FK_StepsForConfigurePositions_PdfSignatureParameters]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsForConfigurePositions_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsForConfigurePositions]'))
ALTER TABLE [dbo].[StepsForConfigurePositions]  WITH CHECK ADD  CONSTRAINT [FK_StepsForConfigurePositions_StepsWFI] FOREIGN KEY([StepWFI])
REFERENCES [dbo].[StepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsForConfigurePositions_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsForConfigurePositions]'))
ALTER TABLE [dbo].[StepsForConfigurePositions] CHECK CONSTRAINT [FK_StepsForConfigurePositions_StepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_StepsWFI_Groups] FOREIGN KEY([IDGroup])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI] CHECK CONSTRAINT [FK_StepsWFI_Groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Languages]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_StepsWFI_Languages] FOREIGN KEY([IDLanguage])
REFERENCES [dbo].[Languages] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Languages]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI] CHECK CONSTRAINT [FK_StepsWFI_Languages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Steps]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_StepsWFI_Steps] FOREIGN KEY([IDOriginalStep])
REFERENCES [dbo].[Steps] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Steps]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI] CHECK CONSTRAINT [FK_StepsWFI_Steps]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_StepsWFI_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI] CHECK CONSTRAINT [FK_StepsWFI_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_StepsWFI_WFActionType] FOREIGN KEY([IDActionType])
REFERENCES [dbo].[WFActionType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI] CHECK CONSTRAINT [FK_StepsWFI_WFActionType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_WFInstance]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_StepsWFI_WFInstance] FOREIGN KEY([IDWFI])
REFERENCES [dbo].[WFInstance] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepsWFI_WFInstance]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI] CHECK CONSTRAINT [FK_StepsWFI_WFInstance]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepWFI_SignatureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI]  WITH CHECK ADD  CONSTRAINT [FK_StepWFI_SignatureType] FOREIGN KEY([IdSignatureType])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepWFI_SignatureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepsWFI]'))
ALTER TABLE [dbo].[StepsWFI] CHECK CONSTRAINT [FK_StepWFI_SignatureType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_SignTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StepTemplates_SignTypes] FOREIGN KEY([IdSignatureType])
REFERENCES [dbo].[SignatureTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_SignTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates] CHECK CONSTRAINT [FK_StepTemplates_SignTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_StepTemplatesMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StepTemplates_StepTemplatesMaster] FOREIGN KEY([IdStepTemplateMaster])
REFERENCES [dbo].[StepTemplatesMaster] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_StepTemplatesMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates] CHECK CONSTRAINT [FK_StepTemplates_StepTemplatesMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StepTemplates_SuggestedContacts] FOREIGN KEY([IdSuggestedContact])
REFERENCES [dbo].[SuggestedContacts] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_SuggestedContacts]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates] CHECK CONSTRAINT [FK_StepTemplates_SuggestedContacts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StepTemplates_WFActionType] FOREIGN KEY([IdActionType])
REFERENCES [dbo].[WFActionType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplates_WFActionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplates]'))
ALTER TABLE [dbo].[StepTemplates] CHECK CONSTRAINT [FK_StepTemplates_WFActionType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplatesMaste_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplatesMaster]'))
ALTER TABLE [dbo].[StepTemplatesMaster]  WITH CHECK ADD  CONSTRAINT [FK_StepTemplatesMaste_AccGroup] FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplatesMaste_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplatesMaster]'))
ALTER TABLE [dbo].[StepTemplatesMaster] CHECK CONSTRAINT [FK_StepTemplatesMaste_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplatesMaste_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplatesMaster]'))
ALTER TABLE [dbo].[StepTemplatesMaster]  WITH CHECK ADD  CONSTRAINT [FK_StepTemplatesMaste_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StepTemplatesMaste_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[StepTemplatesMaster]'))
ALTER TABLE [dbo].[StepTemplatesMaster] CHECK CONSTRAINT [FK_StepTemplatesMaste_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SuggestedContacts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SuggestedContacts]'))
ALTER TABLE [dbo].[SuggestedContacts]  WITH CHECK ADD  CONSTRAINT [FK_SuggestedContacts_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SuggestedContacts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SuggestedContacts]'))
ALTER TABLE [dbo].[SuggestedContacts] CHECK CONSTRAINT [FK_SuggestedContacts_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Company]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Company] FOREIGN KEY([IDCompany])
REFERENCES [dbo].[Company] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Company]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Company]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_DossierTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_DossierTypes] FOREIGN KEY([IDType])
REFERENCES [dbo].[DossierTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_DossierTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_DossierTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Entities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Entities] FOREIGN KEY([IDEntity])
REFERENCES [dbo].[Entities] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Entities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Entities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Petitioner]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Petitioner] FOREIGN KEY([IDPetitioner])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Petitioner]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Petitioner]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Signer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Signer] FOREIGN KEY([IDSigner])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_Signer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Signer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_States]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_States] FOREIGN KEY([IDState])
REFERENCES [dbo].[States] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tasks_States]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_States]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemplateLineTextLine_TemplateLine]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemplateLineTextLine]'))
ALTER TABLE [dbo].[TemplateLineTextLine]  WITH CHECK ADD  CONSTRAINT [FK_TemplateLineTextLine_TemplateLine] FOREIGN KEY([IdTempateLine])
REFERENCES [dbo].[TemplateLine] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemplateLineTextLine_TemplateLine]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemplateLineTextLine]'))
ALTER TABLE [dbo].[TemplateLineTextLine] CHECK CONSTRAINT [FK_TemplateLineTextLine_TemplateLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemplateLineTextLine_Templates]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemplateLineTextLine]'))
ALTER TABLE [dbo].[TemplateLineTextLine]  WITH CHECK ADD  CONSTRAINT [FK_TemplateLineTextLine_Templates] FOREIGN KEY([IdTemplate])
REFERENCES [dbo].[Templates] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemplateLineTextLine_Templates]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemplateLineTextLine]'))
ALTER TABLE [dbo].[TemplateLineTextLine] CHECK CONSTRAINT [FK_TemplateLineTextLine_Templates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Templates_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Templates]'))
ALTER TABLE [dbo].[Templates]  WITH CHECK ADD  CONSTRAINT [FK_Templates_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Templates_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Templates]'))
ALTER TABLE [dbo].[Templates] CHECK CONSTRAINT [FK_Templates_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemporaryOTP_SrDocumentsStepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemporaryOTP]'))
ALTER TABLE [dbo].[TemporaryOTP]  WITH CHECK ADD  CONSTRAINT [FK_TemporaryOTP_SrDocumentsStepsWFI] FOREIGN KEY([IDSrDocumentsStepsWFI])
REFERENCES [dbo].[SrDocumentsStepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemporaryOTP_SrDocumentsStepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemporaryOTP]'))
ALTER TABLE [dbo].[TemporaryOTP] CHECK CONSTRAINT [FK_TemporaryOTP_SrDocumentsStepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([Roles_ID])
REFERENCES [dbo].[Roles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Users_ID])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AccGroup] FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Countrys]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Countrys] FOREIGN KEY([IdCountry])
REFERENCES [dbo].[Countrys] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Countrys]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Countrys]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Languages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Languages] FOREIGN KEY([IdLanguage])
REFERENCES [dbo].[Languages] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Languages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Languages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_NotificationsConfigs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_NotificationsConfigs] FOREIGN KEY([IdNotificationsConfigs])
REFERENCES [dbo].[NotificationsConfigs] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_NotificationsConfigs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_NotificationsConfigs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersCreator]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersCreator] FOREIGN KEY([IdParent])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersCreator]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UsersCreator]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersIdParent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersIdParent] FOREIGN KEY([IdParent])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersIdParent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UsersIdParent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersStates] FOREIGN KEY([IdUserState])
REFERENCES [dbo].[UserStates] ([IdUserState])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UsersStates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest]  WITH CHECK ADD  CONSTRAINT [FK_UsersGroupRequest_Groups] FOREIGN KEY([IDGroup])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest] CHECK CONSTRAINT [FK_UsersGroupRequest_Groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest]  WITH CHECK ADD  CONSTRAINT [FK_UsersGroupRequest_SignRequests] FOREIGN KEY([IDRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest] CHECK CONSTRAINT [FK_UsersGroupRequest_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest]  WITH CHECK ADD  CONSTRAINT [FK_UsersGroupRequest_StepsWFI] FOREIGN KEY([IDStepWFI])
REFERENCES [dbo].[StepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_StepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest] CHECK CONSTRAINT [FK_UsersGroupRequest_StepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest]  WITH CHECK ADD  CONSTRAINT [FK_UsersGroupRequest_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroupRequest_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroupRequest]'))
ALTER TABLE [dbo].[UsersGroupRequest] CHECK CONSTRAINT [FK_UsersGroupRequest_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroups_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroups]'))
ALTER TABLE [dbo].[UsersGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersGroups_Groups] FOREIGN KEY([Groups_ID])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroups_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroups]'))
ALTER TABLE [dbo].[UsersGroups] CHECK CONSTRAINT [FK_UsersGroups_Groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroups_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroups]'))
ALTER TABLE [dbo].[UsersGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersGroups_Users] FOREIGN KEY([Users_ID])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroups_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroups]'))
ALTER TABLE [dbo].[UsersGroups] CHECK CONSTRAINT [FK_UsersGroups_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserSignRequestWidget_PdfSignatureParameters]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]'))
ALTER TABLE [dbo].[UserSignRequestWidget]  WITH CHECK ADD  CONSTRAINT [FK_UserSignRequestWidget_PdfSignatureParameters] FOREIGN KEY([IDPdfSignatureParameters])
REFERENCES [dbo].[PdfSignatureParameters] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserSignRequestWidget_PdfSignatureParameters]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]'))
ALTER TABLE [dbo].[UserSignRequestWidget] CHECK CONSTRAINT [FK_UserSignRequestWidget_PdfSignatureParameters]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserSignRequestWidget_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]'))
ALTER TABLE [dbo].[UserSignRequestWidget]  WITH CHECK ADD  CONSTRAINT [FK_UserSignRequestWidget_SignRequests] FOREIGN KEY([IDSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserSignRequestWidget_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]'))
ALTER TABLE [dbo].[UserSignRequestWidget] CHECK CONSTRAINT [FK_UserSignRequestWidget_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserSignRequestWidget_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]'))
ALTER TABLE [dbo].[UserSignRequestWidget]  WITH CHECK ADD  CONSTRAINT [FK_UserSignRequestWidget_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserSignRequestWidget_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSignRequestWidget]'))
ALTER TABLE [dbo].[UserSignRequestWidget] CHECK CONSTRAINT [FK_UserSignRequestWidget_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Notifications_UsersNotifications_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersNotifications]'))
ALTER TABLE [dbo].[UsersNotifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_UsersNotifications_FK1] FOREIGN KEY([IDNotification])
REFERENCES [dbo].[Notifications] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Notifications_UsersNotifications_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersNotifications]'))
ALTER TABLE [dbo].[UsersNotifications] CHECK CONSTRAINT [FK_Notifications_UsersNotifications_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersNotifications_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersNotifications]'))
ALTER TABLE [dbo].[UsersNotifications]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersNotifications_FK1] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersNotifications_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersNotifications]'))
ALTER TABLE [dbo].[UsersNotifications] CHECK CONSTRAINT [FK_Users_UsersNotifications_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PdfSignatureParameters_UsersProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersProfiles]'))
ALTER TABLE [dbo].[UsersProfiles]  WITH CHECK ADD  CONSTRAINT [FK_PdfSignatureParameters_UsersProfiles_FK1] FOREIGN KEY([IDPdfSignatureParameters])
REFERENCES [dbo].[PdfSignatureParameters] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PdfSignatureParameters_UsersProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersProfiles]'))
ALTER TABLE [dbo].[UsersProfiles] CHECK CONSTRAINT [FK_PdfSignatureParameters_UsersProfiles_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_UsersProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersProfiles]'))
ALTER TABLE [dbo].[UsersProfiles]  WITH CHECK ADD  CONSTRAINT [FK_Profiles_UsersProfiles_FK1] FOREIGN KEY([IDProfile])
REFERENCES [dbo].[Profiles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profiles_UsersProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersProfiles]'))
ALTER TABLE [dbo].[UsersProfiles] CHECK CONSTRAINT [FK_Profiles_UsersProfiles_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersProfiles]'))
ALTER TABLE [dbo].[UsersProfiles]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersProfiles_FK1] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersProfiles_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersProfiles]'))
ALTER TABLE [dbo].[UsersProfiles] CHECK CONSTRAINT [FK_Users_UsersProfiles_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_UsersRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersRequests]'))
ALTER TABLE [dbo].[UsersRequests]  WITH CHECK ADD  CONSTRAINT [FK_SignRequests_UsersRequests_FK1] FOREIGN KEY([IDRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SignRequests_UsersRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersRequests]'))
ALTER TABLE [dbo].[UsersRequests] CHECK CONSTRAINT [FK_SignRequests_UsersRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersRequests]'))
ALTER TABLE [dbo].[UsersRequests]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersRequests_FK1] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UsersRequests_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersRequests]'))
ALTER TABLE [dbo].[UsersRequests] CHECK CONSTRAINT [FK_Users_UsersRequests_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VerificationStatusVerificationDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[VerificationDescription]'))
ALTER TABLE [dbo].[VerificationDescription]  WITH CHECK ADD  CONSTRAINT [FK_VerificationStatusVerificationDescription] FOREIGN KEY([idStatus])
REFERENCES [dbo].[VerificationStatus] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VerificationStatusVerificationDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[VerificationDescription]'))
ALTER TABLE [dbo].[VerificationDescription] CHECK CONSTRAINT [FK_VerificationStatusVerificationDescription]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IdVersionNews]') AND parent_object_id = OBJECT_ID(N'[dbo].[VersionNews]'))
ALTER TABLE [dbo].[VersionNews]  WITH CHECK ADD  CONSTRAINT [FK_IdVersionNews] FOREIGN KEY([IdVersions])
REFERENCES [dbo].[Versions] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IdVersionNews]') AND parent_object_id = OBJECT_ID(N'[dbo].[VersionNews]'))
ALTER TABLE [dbo].[VersionNews] CHECK CONSTRAINT [FK_IdVersionNews]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IdVersionNewsType]') AND parent_object_id = OBJECT_ID(N'[dbo].[VersionNews]'))
ALTER TABLE [dbo].[VersionNews]  WITH CHECK ADD  CONSTRAINT [FK_IdVersionNewsType] FOREIGN KEY([IdVersionNewsTypes])
REFERENCES [dbo].[VersionNewsTypes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IdVersionNewsType]') AND parent_object_id = OBJECT_ID(N'[dbo].[VersionNews]'))
ALTER TABLE [dbo].[VersionNews] CHECK CONSTRAINT [FK_IdVersionNewsType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebHookConfigs_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebHookConfigs]'))
ALTER TABLE [dbo].[WebHookConfigs]  WITH CHECK ADD  CONSTRAINT [FK_WebHookConfigs_AccGroup] FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebHookConfigs_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebHookConfigs]'))
ALTER TABLE [dbo].[WebHookConfigs] CHECK CONSTRAINT [FK_WebHookConfigs_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebHookConfigs_AutenticationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebHookConfigs]'))
ALTER TABLE [dbo].[WebHookConfigs]  WITH CHECK ADD  CONSTRAINT [FK_WebHookConfigs_AutenticationTypes] FOREIGN KEY([IdAutenticationType])
REFERENCES [dbo].[AutenticationTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebHookConfigs_AutenticationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebHookConfigs]'))
ALTER TABLE [dbo].[WebHookConfigs] CHECK CONSTRAINT [FK_WebHookConfigs_AutenticationTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebhookNotifications_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebhookNotifications]'))
ALTER TABLE [dbo].[WebhookNotifications]  WITH CHECK ADD  CONSTRAINT [FK_WebhookNotifications_SignRequests] FOREIGN KEY([IdSignRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebhookNotifications_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebhookNotifications]'))
ALTER TABLE [dbo].[WebhookNotifications] CHECK CONSTRAINT [FK_WebhookNotifications_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinition_CreateUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFDefinition]'))
ALTER TABLE [dbo].[WFDefinition]  WITH CHECK ADD  CONSTRAINT [FK_WFDefinition_CreateUser] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinition_CreateUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFDefinition]'))
ALTER TABLE [dbo].[WFDefinition] CHECK CONSTRAINT [FK_WFDefinition_CreateUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinitionsDrafts_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFDefinitionDrafts]'))
ALTER TABLE [dbo].[WFDefinitionDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WFDefinitionsDrafts_SignRequestsDrafts] FOREIGN KEY([IDSignRequestDrafts])
REFERENCES [dbo].[SignRequestsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinitionsDrafts_SignRequestsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFDefinitionDrafts]'))
ALTER TABLE [dbo].[WFDefinitionDrafts] CHECK CONSTRAINT [FK_WFDefinitionsDrafts_SignRequestsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinitionsDrafts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFDefinitionDrafts]'))
ALTER TABLE [dbo].[WFDefinitionDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WFDefinitionsDrafts_Users] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFDefinitionsDrafts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFDefinitionDrafts]'))
ALTER TABLE [dbo].[WFDefinitionDrafts] CHECK CONSTRAINT [FK_WFDefinitionsDrafts_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFInstance_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFInstance]'))
ALTER TABLE [dbo].[WFInstance]  WITH CHECK ADD  CONSTRAINT [FK_WFInstance_SignRequests] FOREIGN KEY([IDRequest])
REFERENCES [dbo].[SignRequests] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFInstance_SignRequests]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFInstance]'))
ALTER TABLE [dbo].[WFInstance] CHECK CONSTRAINT [FK_WFInstance_SignRequests]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFInstance_WFDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFInstance]'))
ALTER TABLE [dbo].[WFInstance]  WITH CHECK ADD  CONSTRAINT [FK_WFInstance_WFDefinition] FOREIGN KEY([IDWF])
REFERENCES [dbo].[WFDefinition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WFInstance_WFDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[WFInstance]'))
ALTER TABLE [dbo].[WFInstance] CHECK CONSTRAINT [FK_WFInstance_WFDefinition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetLocationsNameMaster_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetLocationsNameMaster]'))
ALTER TABLE [dbo].[WidgetLocationsNameMaster]  WITH CHECK ADD  CONSTRAINT [FK_WidgetLocationsNameMaster_AccGroup] FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetLocationsNameMaster_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetLocationsNameMaster]'))
ALTER TABLE [dbo].[WidgetLocationsNameMaster] CHECK CONSTRAINT [FK_WidgetLocationsNameMaster_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetLocationsNameMaster_WidgetLocationsMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetLocationsNameMaster]'))
ALTER TABLE [dbo].[WidgetLocationsNameMaster]  WITH CHECK ADD  CONSTRAINT [FK_WidgetLocationsNameMaster_WidgetLocationsMaster] FOREIGN KEY([IdWidgetLocationsMaster])
REFERENCES [dbo].[WidgetLocationsMaster] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetLocationsNameMaster_WidgetLocationsMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetLocationsNameMaster]'))
ALTER TABLE [dbo].[WidgetLocationsNameMaster] CHECK CONSTRAINT [FK_WidgetLocationsNameMaster_WidgetLocationsMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetLocationsNameMaster_WidgetTemplateMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetLocationsNameMaster]'))
ALTER TABLE [dbo].[WidgetLocationsNameMaster]  WITH CHECK ADD  CONSTRAINT [FK_WidgetLocationsNameMaster_WidgetTemplateMaster] FOREIGN KEY([IdTemplateMaster])
REFERENCES [dbo].[WidgetTemplateMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetLocationsNameMaster_WidgetTemplateMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetLocationsNameMaster]'))
ALTER TABLE [dbo].[WidgetLocationsNameMaster] CHECK CONSTRAINT [FK_WidgetLocationsNameMaster_WidgetTemplateMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetOptionalFieldsDraft_PDFSignatureParametersDraft]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetOptionalFieldsDrafts]'))
ALTER TABLE [dbo].[WidgetOptionalFieldsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WidgetOptionalFieldsDraft_PDFSignatureParametersDraft] FOREIGN KEY([IDPDFDraft])
REFERENCES [dbo].[PdfSignatureParametersDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetOptionalFieldsDraft_PDFSignatureParametersDraft]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetOptionalFieldsDrafts]'))
ALTER TABLE [dbo].[WidgetOptionalFieldsDrafts] CHECK CONSTRAINT [FK_WidgetOptionalFieldsDraft_PDFSignatureParametersDraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetVisibleFieldsDraft_WidgetOptionalFieldsType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetOptionalFieldsDrafts]'))
ALTER TABLE [dbo].[WidgetOptionalFieldsDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WidgetVisibleFieldsDraft_WidgetOptionalFieldsType] FOREIGN KEY([IDField])
REFERENCES [dbo].[WidgetOptionalFieldsTypes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetVisibleFieldsDraft_WidgetOptionalFieldsType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetOptionalFieldsDrafts]'))
ALTER TABLE [dbo].[WidgetOptionalFieldsDrafts] CHECK CONSTRAINT [FK_WidgetVisibleFieldsDraft_WidgetOptionalFieldsType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetTemplateExclude_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetTemplateExclude]'))
ALTER TABLE [dbo].[WidgetTemplateExclude]  WITH CHECK ADD  CONSTRAINT [FK_WidgetTemplateExclude_AccGroup] FOREIGN KEY([IdAccGroup])
REFERENCES [dbo].[AccGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetTemplateExclude_AccGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetTemplateExclude]'))
ALTER TABLE [dbo].[WidgetTemplateExclude] CHECK CONSTRAINT [FK_WidgetTemplateExclude_AccGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetTemplateExclude_WidgetTemplateMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetTemplateExclude]'))
ALTER TABLE [dbo].[WidgetTemplateExclude]  WITH CHECK ADD  CONSTRAINT [FK_WidgetTemplateExclude_WidgetTemplateMaster] FOREIGN KEY([IdWidgetTemplateMaster])
REFERENCES [dbo].[WidgetTemplateMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetTemplateExclude_WidgetTemplateMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetTemplateExclude]'))
ALTER TABLE [dbo].[WidgetTemplateExclude] CHECK CONSTRAINT [FK_WidgetTemplateExclude_WidgetTemplateMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PDF_WidgetWF]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF]  WITH CHECK ADD  CONSTRAINT [FK_PDF_WidgetWF] FOREIGN KEY([IDPDF])
REFERENCES [dbo].[PdfSignatureParameters] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PDF_WidgetWF]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF] CHECK CONSTRAINT [FK_PDF_WidgetWF]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_FormWidget]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWF_FormWidget] FOREIGN KEY([IDFormWidget])
REFERENCES [dbo].[FormWidget] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_FormWidget]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF] CHECK CONSTRAINT [FK_WidgetWF_FormWidget]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_SrDocumentsStepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWF_SrDocumentsStepsWFI] FOREIGN KEY([IdSrDocumentsStepWFI])
REFERENCES [dbo].[SrDocumentsStepsWFI] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_SrDocumentsStepsWFI]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF] CHECK CONSTRAINT [FK_WidgetWF_SrDocumentsStepsWFI]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_Steps]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWF_Steps] FOREIGN KEY([IDStep])
REFERENCES [dbo].[Steps] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_Steps]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF] CHECK CONSTRAINT [FK_WidgetWF_Steps]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_WFDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWF_WFDefinition] FOREIGN KEY([IDWF])
REFERENCES [dbo].[WFDefinition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWF_WFDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWF]'))
ALTER TABLE [dbo].[WidgetWF] CHECK CONSTRAINT [FK_WidgetWF_WFDefinition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDraft_PDFSignatureParametersDraft]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWFDraft_PDFSignatureParametersDraft] FOREIGN KEY([IDPDFDrafts])
REFERENCES [dbo].[PdfSignatureParametersDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDraft_PDFSignatureParametersDraft]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts] CHECK CONSTRAINT [FK_WidgetWFDraft_PDFSignatureParametersDraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDraft_StepsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWFDraft_StepsDrafts] FOREIGN KEY([IDStepsDrafts])
REFERENCES [dbo].[StepsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDraft_StepsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts] CHECK CONSTRAINT [FK_WidgetWFDraft_StepsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDraft_WFDefinitionDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWFDraft_WFDefinitionDrafts] FOREIGN KEY([IDWFDefinitionDrafts])
REFERENCES [dbo].[WFDefinitionDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDraft_WFDefinitionDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts] CHECK CONSTRAINT [FK_WidgetWFDraft_WFDefinitionDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDrafts_FormWidgetsDraft]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWFDrafts_FormWidgetsDraft] FOREIGN KEY([IDFormWidgetDraft])
REFERENCES [dbo].[FormWidgetsDraft] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDrafts_FormWidgetsDraft]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts] CHECK CONSTRAINT [FK_WidgetWFDrafts_FormWidgetsDraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDrafts_SrDocumentsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWFDrafts_SrDocumentsDrafts] FOREIGN KEY([IdSrDocumentsDrafts])
REFERENCES [dbo].[SrDocumentsDrafts] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFDrafts_SrDocumentsDrafts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFDrafts]'))
ALTER TABLE [dbo].[WidgetWFDrafts] CHECK CONSTRAINT [FK_WidgetWFDrafts_SrDocumentsDrafts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFTemplate_FormWidgetTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFTemplate]'))
ALTER TABLE [dbo].[WidgetWFTemplate]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWFTemplate_FormWidgetTemplate] FOREIGN KEY([IdFormWidgetTemplate])
REFERENCES [dbo].[FormWidgetTemplate] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFTemplate_FormWidgetTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFTemplate]'))
ALTER TABLE [dbo].[WidgetWFTemplate] CHECK CONSTRAINT [FK_WidgetWFTemplate_FormWidgetTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFTemplate_WidgetLocationMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFTemplate]'))
ALTER TABLE [dbo].[WidgetWFTemplate]  WITH CHECK ADD  CONSTRAINT [FK_WidgetWFTemplate_WidgetLocationMaster] FOREIGN KEY([IdWidgetLocationMaster])
REFERENCES [dbo].[WidgetLocationsMaster] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WidgetWFTemplate_WidgetLocationMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetWFTemplate]'))
ALTER TABLE [dbo].[WidgetWFTemplate] CHECK CONSTRAINT [FK_WidgetWFTemplate_WidgetLocationMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WTempFeatureInWLocation_WidgetTemplateFeature]') AND parent_object_id = OBJECT_ID(N'[dbo].[WTempFeatureInWLocation]'))
ALTER TABLE [dbo].[WTempFeatureInWLocation]  WITH CHECK ADD  CONSTRAINT [FK_WTempFeatureInWLocation_WidgetTemplateFeature] FOREIGN KEY([IdWidgetTemplateFeature])
REFERENCES [dbo].[WidgetTemplateFeature] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WTempFeatureInWLocation_WidgetTemplateFeature]') AND parent_object_id = OBJECT_ID(N'[dbo].[WTempFeatureInWLocation]'))
ALTER TABLE [dbo].[WTempFeatureInWLocation] CHECK CONSTRAINT [FK_WTempFeatureInWLocation_WidgetTemplateFeature]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WTempFeatureInWLocation_WTempFeatureInWLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[WTempFeatureInWLocation]'))
ALTER TABLE [dbo].[WTempFeatureInWLocation]  WITH CHECK ADD  CONSTRAINT [FK_WTempFeatureInWLocation_WTempFeatureInWLocation] FOREIGN KEY([IdWidgetLocationName])
REFERENCES [dbo].[WidgetLocationsNameMaster] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WTempFeatureInWLocation_WTempFeatureInWLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[WTempFeatureInWLocation]'))
ALTER TABLE [dbo].[WTempFeatureInWLocation] CHECK CONSTRAINT [FK_WTempFeatureInWLocation_WTempFeatureInWLocation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[HangFire].[FK_HangFire_JobParameter_Job]') AND parent_object_id = OBJECT_ID(N'[HangFire].[JobParameter]'))
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[HangFire].[FK_HangFire_JobParameter_Job]') AND parent_object_id = OBJECT_ID(N'[HangFire].[JobParameter]'))
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[HangFire].[FK_HangFire_State_Job]') AND parent_object_id = OBJECT_ID(N'[HangFire].[State]'))
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[HangFire].[FK_HangFire_State_Job]') AND parent_object_id = OBJECT_ID(N'[HangFire].[State]'))
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
/****** Object:  StoredProcedure [dbo].[DeleteJobs]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteJobs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteJobs] AS' 
END
GO
ALTER PROCEDURE [dbo].[DeleteJobs]
  @day int
 as
 
DECLARE @mylist TABLE (Id int)
    INSERT INTO @mylist
    SELECT id FROM 
    (select id from [HangFire].[Job] where StateName not in('Succeeded') and CreatedAt < DATEADD(day,-@day,SYSDATETIME())  ) 
    AS tbl(id)

 


    delete from [HangFire].[State] where jobid in  (select id from @mylist)
    delete from [HangFire].[JobParameter] where jobid in  (select id from @mylist)
    delete from [HangFire].[JobQueue] where jobid in  (select id from @mylist)
    delete from [HangFire].[Job] where id in(select id from @mylist)
    
GO


/*---------------------------------------------------------*/

/****** Object:  StoredProcedure [dbo].[SignedPropertiesAllTrue]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SignedPropertiesAllTrue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SignedPropertiesAllTrue] AS' 
END
GO
ALTER PROCEDURE  [dbo].[SignedPropertiesAllTrue] @IDLocation int
AS 

DECLARE @ID int
DECLARE CURX CURSOR FOR SELECT ID FROM USERS--CURSOR CON LOS IDs DE LOS USUARIOS
OPEN CURX
FETCH NEXT FROM CURX INTO @ID

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT(@ID) 

	IF (SELECT Count(*) FROM SignedProperties WHERE ID = @ID ) > 0
		BEGIN
			PRINT('SI TENGO')
			/*HAY QUE ACTUALIZAR EL REGISTRO*/
			UPDATE SignedProperties SET 
			IDUser = @ID, 
			--CreateDate = GetDate(),
			EndDate = NULL, 
			Enabled = 1,
			Name = 1, 
			Surname = 1, 
			Position = 1, 
			--IDLocation = 99,Ya tiene. no se la cambio
			--IDCommitment = 99, YA tiene, no se la cambio
			Date = 1,
			DNI = 1  
			WHERE ID = @ID

			PRINT(convert(varchar, @ID) + ' ACTUALIZADO')
		END
	ELSE
	BEGIN
		PRINT('NO TENGO')
		/*Hay que meter un nuevo registro*/
		INSERT SignedProperties (IDUser, CreateDate, EndDate, Enabled, Name, Surname, Position, IDLocation, IDCommitment, Date, DNI) 
						VALUES(@ID, GetDate(), NULL, 1, 1, 1, 1, @IDLocation, NULL, 1, 1)

		PRINT(convert(varchar, @ID) + ' INSERT')
	END

	FETCH NEXT FROM CURX INTO @ID
END

CLOSE CURX
DEALLOCATE CURX
GO
/****** Object:  StoredProcedure [Reporting].[GenerateStatistics]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GenerateStatistics]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GenerateStatistics] AS' 
END
GO

ALTER PROCEDURE [Reporting].[GenerateStatistics] 
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	DELETE FROM [Reporting].[DashboardsPendingRequest];
	DELETE FROM [Reporting].[SignatureStatisticsByType];
	DELETE FROM [Reporting].[SignRequestStatisticsByState];
	DELETE FROM [Reporting].[ActionStatisticsByType];

	-- DISABLE INDEXES
	ALTER INDEX [IDX_srstbs_AccGroupName_UserLogin_UserName_IdState] ON [Reporting].[SignRequestStatisticsByState] DISABLE;
	ALTER INDEX [IDX_ssbt_AccGroupName_UserLogin_IDSignatureOption] ON [Reporting].[SignatureStatisticsByType] DISABLE;
	ALTER INDEX [IDX_asbt_AccGroupName_UserLogin_IdActionType] ON [Reporting].[ActionStatisticsByType] DISABLE;
	ALTER INDEX [IDX_asbt_IdActionType] ON [Reporting].[ActionStatisticsByType] DISABLE;

    -- Pending request dahsboards
	with swfi_ordered as (
	select
	swfi.ID,	
	swfi.IDWFI,
	swfi.IDActionType,
	swfi.WorkFlowStepType,
	swfi.[Order],
	wfi.IDRequest,
	sr.CreatedDate,
	u.[Id] UserId,
	acc.[Id] CompanyId,
	row_number() over (partition by IDWFI order by [Order]) as row_number
	FROM [dbo].[StepsWFI] swfi 
	inner join [dbo].[WFInstance] wfi on wfi.ID = swfi.IDWFI
	--La solicitud debe estar pendiente y no borrada
	inner join [dbo].[SignRequests] sr on sr.ID = wfi.IDRequest 
	and sr.IDState = 3 
	and sr.Deleted = 0
	left join [dbo].[Users] u on sr.IDPetitioner = u.ID 
	left join [dbo].[AccGroup] acc on u.IdAccGroup = acc.ID 
	where 
	swfi.Completed = 0 and
	swfi.IDActionType IN (1,2) 
	)
	INSERT INTO [Reporting].[DashboardsPendingRequest] (IdAccGroup, IdUser, IdRequest, CreateDate, [Sign], Review)
	SELECT 
	src.CompanyId,
	src.UserId,
	src.IDRequest,
	src.CreatedDate,
	CASE When (src.IDActionType = 1 OR srcPar.ParallelIdActionType = 1) 
		THEN 1 ELSE 0 
	END as [Sign],
	CASE When (src.IDActionType = 2 OR srcPar.ParallelIdActionType = 2) 
		THEN 1 ELSE 0
	END as [Review]
	FROM
	(
	SELECT 
	CompanyId,
	UserId,
	IDRequest,
	IDActionType,
	CreatedDate
	FROM 
	swfi_ordered where row_number = 1) as src left join
	(SELECT 
	IDRequest,
	swfi_par.IDActionType as ParallelIdActionType
	FROM
	swfi_ordered inner join [dbo].[StepsWFI] swfi_par 
		on swfi_ordered.IDWFI = swfi_par.IDWFI and swfi_ordered.[Order] = swfi_par.[Order]
		and swfi_ordered.ID != swfi_par.ID and swfi_par.Completed = 0 
		-- AQUI SOLO NOS QUEDAMOS CON LOS VALORES DE ACCCIONES DISTINTAS
		and swfi_par.IDActionType != swfi_ordered.IDActionType
	where swfi_ordered.row_number = 1) as srcPar on src.IDRequest = srcPar.IDRequest;

  -- FIRMAS EXTERNAS PENDIENTES
  INSERT INTO [Reporting].[DashboardsPendingRequest] (IdAccGroup, IdUser, IdExternalSignature, CreateDate, [Sign],[Review])
  SELECT 
  acc.Id IdAccGroup,
  u.ID IdUser,
  es.ID,
  es.CreateDate,
  1 as [Sign],
  0 as [Review]
  FROM

  [dbo].[ExternalSignatures] es left join 
  [dbo].[Users] u on u.Id = es.IDUsers left join 
  [dbo].[AccGroup] acc on u.IdAccGroup = acc.Id
  -- SOLO PENDIENTES
  where es.IDStates = 3;

	-- SignRequest statistics

	INSERT INTO [Reporting].[SignRequestStatisticsByState] (IdAccGroup,AccGroupName,IdUser,UserLogin,UserName,IdRequest,CreateDate,IdState)
	  SELECT 
	  acc.[id] IdAccGroup,
	  acc.[Name] AccGroupName,
	  u.[Id] IdUser,
	  u.[Login] ,
	  CONCAT(u.[Name],' ',u.[Surname]),
	  sr.ID IdRequest,
	  sr.CreatedDate,
	  sr.IdState
	  FROM [dbo].[SignRequests] sr 
	  left join [dbo].[Users] u on sr.IDPetitioner = u.ID 
	  left join [dbo].[AccGroup] acc on u.IdAccGroup = acc.ID
	  where 	  
	  sr.IDState in  (12,7,3,4,13)

	  -- External request
	  INSERT INTO [Reporting].[SignRequestStatisticsByState] (IdAccGroup,AccGroupName,IdUser,UserLogin,UserName,IdExternalSignature,CreateDate,IdState)	  
	  SELECT 
	  acc.Id IdAccGroup,
	  acc.[Name] AccGroupName,
	  u.ID IdUser,
	  u.Login,
	  CONCAT(u.[Name],' ',u.[Surname]) UserName,
	  es.ID,
	  es.CreateDate,
	  CASE WHEN (IDStates = 5) THEN 12 ELSE IDStates END as IdState 
	  FROM

	  [dbo].[ExternalSignatures] es left join 
	  [dbo].[Users] u on u.Id = es.IDUsers left join 
	  [dbo].[AccGroup] acc on u.IdAccGroup = acc.Id
	  -- OMITIMOS ERRONEAS POR EL MOMENTO
	  where es.IDStates in (3,5);

	-- Signature statistics

	INSERT INTO [Reporting].[SignatureStatisticsByType]
	([IdAccGroup],[AccGroupName] ,[IdUser] ,[UserLogin] ,[UserName] ,[ActionDate] ,[IDSignatureOption] ,[External] )
	  -- Firmas No externas
	  SELECT 
	  acc.Id IdAccGroup,
	  acc.[Name] AccGroupName,
	  u.ID IdUser,
	  u.Login,
	  CONCAT(u.[Name],' ',u.[Surname]) UserName,
	  a.ActionDate,
	  so.IDSignatureOption,
	  CASE When (a.IDExternalSingnatures is null) 
		THEN 0 ELSE 1 
		END as [External]	
	  FROM 
	  [dbo].Actions a 
	  left join dbo.ExternalSignatures es on a.IDExternalSingnatures = es.Id
	  left join [dbo].[StepsWFI] swfi on a.IDStepWFI = swfi.ID and a.IDExternalSingnatures is null
	  left join [dbo].Steps s on s.ID = swfi.IDOriginalStep
	  left join [dbo].SignatureOptions so on so.IDStep = s.ID
	  left join [dbo].[SignRequests] sr on sr.ID = a.IDRequest
	  left join [dbo].[Users] u on (sr.IDPetitioner = u.ID or es.IDUsers = u.ID) 
	  left join [dbo].[AccGroup] acc on u.IdAccGroup = acc.ID
	  where a.IDActionType = 1;

	-- Actions by type dashboard
	--ALTER INDEX IDX_ActionType_DbActByType ON [Reporting].[DashboardActionsByType]
	--DISABLE;    
	INSERT INTO [Reporting].[ActionStatisticsByType] 
	(
		[IdAccGroup],
		[AccGroupName],
		[IdUser],
		[UserLogin],
		[UserName] ,
		[IDActionType],
		[ActionDate],
		[External]
	)
	SELECT 
	  acc.Id IdAccGroup,
	  acc.Name,
	  u.ID IdUser,
	  u.[Login],
	  CONCAT(u.[Name],' ',u.[Surname]) as UserName,
	  a.IDActionType,
	  a.ActionDate,
	  CASE When (a.IDExternalSingnatures is null) 
		THEN 0 ELSE 1 
		END as [External]	
	  FROM
	  [dbo].Actions a
	  left join dbo.ExternalSignatures es on a.IDExternalSingnatures = es.Id
	  left join [dbo].[SignRequests] sr on sr.ID = a.IDRequest
	  left join [dbo].[Users] u on (sr.IDPetitioner = u.ID or es.IDUsers = u.ID) 
	  left join [dbo].[AccGroup] acc on u.IdAccGroup = acc.ID where 
	  a.IDActionType in (1,2,4,6,17,18,21);


	 -- REBUILD INDEXES
	ALTER INDEX [IDX_srstbs_AccGroupName_UserLogin_UserName_IdState] ON [Reporting].[SignRequestStatisticsByState] REBUILD;
	ALTER INDEX [IDX_ssbt_AccGroupName_UserLogin_IDSignatureOption] ON [Reporting].[SignatureStatisticsByType] REBUILD;
	ALTER INDEX [IDX_asbt_AccGroupName_UserLogin_IdActionType] ON [Reporting].[ActionStatisticsByType] REBUILD;
	ALTER INDEX [IDX_asbt_IdActionType] ON [Reporting].[ActionStatisticsByType] REBUILD;

	-- SET UPDATE DATE ON CONFIG
	IF EXISTS ( SELECT * FROM dbo.Settings WHERE [key] = 'STATISTICS_CALC_DATE' )
		UPDATE dbo.Settings
		 SET Value = GETUTCDATE()
		 where [key] = 'STATISTICS_CALC_DATE'
	   ELSE 
		INSERT INTO dbo.Settings ([key], [value], [Description])
		VALUES
		('STATISTICS_CALC_DATE',GETUTCDATE(), 'The date (UTC) when the statistics tables were regenerated.')
END
GO
/****** Object:  StoredProcedure [Reporting].[GetActionsByTypeDashboardData]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetActionsByTypeDashboardData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetActionsByTypeDashboardData] AS' 
END
GO
ALTER PROCEDURE [Reporting].[GetActionsByTypeDashboardData]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
	ISNULL([1],0) as [Sign],
	ISNULL([2],0) as Reject,
	ISNULL([4],0) as Review,
	ISNULL([6],0) as Cancel,
	ISNULL([17],0) as Completed,
	ISNULL([18],0) as Inform,
	ISNULL([21],0) as Deleted
	FROM
	(
		SELECT [IDActionType],COUNT([IDActionType]) TypeCount

		FROM 
		[Reporting].[ActionStatisticsByType]
		
		WHERE 
		ActionDate between @StartCreateDate and @EndCreateDate and
		(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
			 AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
			 group by [IDActionType]) as src PIVOT
	    (
			SUM(TypeCount) FOR [IDActionType] IN ([1],[2],[4],[6],[17],[18],[21])
		) as PivotTable;

END
GO
/****** Object:  StoredProcedure [Reporting].[GetActionStatisticsByType]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetActionStatisticsByType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetActionStatisticsByType] AS' 
END
GO

-- PROCEDIMIENTO OBTENCIÓN DE ACCIONES POR EMPRESA Y USUARIO PAGINADAS
ALTER PROCEDURE [Reporting].[GetActionStatisticsByType]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY,
	@sortDir varchar(5) = 'ASC',
	@sortOrder varchar(50) = 'AccGroupName',
	@recordsOffset [int] = 0,
	@nextRecords [int] = 10
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	   SELECT 
	    [AccGroupName],
		[UserLogin],
		Total,
		[Sign],
		Reject,
		Review,
		Cancel,
		Completed,
		Inform,
		Deleted,
		ExternalId = STUFF((
          SELECT ' | ' + accxtr.Value
          FROM [AccGroupExtraFields] accxtr 
          WHERE src.IdAccGroup = accxtr.IdAccGroup and accxtr.IsKey = 1
          FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')
	   FROM
	   (
	   SELECT
	    IdAccGroup,
	    [AccGroupName],
		[UserLogin],
		(ISNULL([1],0) + ISNULL([2],0) + ISNULL([4],0) + ISNULL([6],0) + ISNULL([17],0) + ISNULL([18],0) + ISNULL([21],0)) as Total,
		ISNULL([1],0) as [Sign],
		ISNULL([2],0) as Reject,
		ISNULL([4],0) as Review,
		ISNULL([6],0) as Cancel,
		ISNULL([17],0) as Completed,
		ISNULL([18],0) as Inform,
		ISNULL([21],0) as Deleted
	   FROM
	   (
	   SELECT
	   IdAccGroup,
	   [AccGroupName],
	   [UserLogin],
	   IDActionType,
	   COUNT(IDActionType) TypeCount	   
	  FROM
	  [Reporting].[ActionStatisticsByType]
	  where ActionDate between @StartCreateDate and @EndCreateDate and
		(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
		AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
	  group by
		[IdAccGroup],
		[AccGroupName],
		[UserLogin],
		[IDActionType]
	  ) as src PIVOT
	    (
			SUM(TypeCount) FOR [IDActionType] IN ([1],[2],[4],[6],[17],[18],[21])
		) as PivotTable) src order by 
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'AccGroupName' THEN AccGroupName END,
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'AccGroupName' THEN AccGroupName END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'UserLogin' THEN UserLogin END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'UserLogin' THEN UserLogin END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Sign' THEN [Sign] END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Sign' THEN [Sign] END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Reject' THEN Reject END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Reject' THEN Reject END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Review' THEN Review END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Review' THEN Review END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Cancel' THEN Cancel END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Cancel' THEN Cancel END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Completed' THEN Completed END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Completed' THEN Completed END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Inform' THEN Inform END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Inform' THEN Inform END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Deleted' THEN Deleted END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Deleted' THEN Deleted END DESC,		
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Total' THEN Total END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Total' THEN Total END DESC
		offset @recordsOffset rows fetch next @nextRecords rows only; 
END
GO
/****** Object:  StoredProcedure [Reporting].[GetActionStatisticsByTypeCount]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetActionStatisticsByTypeCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetActionStatisticsByTypeCount] AS' 
END
GO


-- PROCEDIMIENTO OBTENCIÓN DE CONTEO DE ACCIONES POR EMPRESA Y USUARIO PAGINADAS
ALTER PROCEDURE [Reporting].[GetActionStatisticsByTypeCount]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY	
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	  
	   return (SELECT
	   COUNT(*) RecordCount
	   FROM
	   (
	   SELECT
	   [AccGroupName],
	   [UserLogin],
	   IDActionType,
	   COUNT(IDActionType) TypeCount	   
	  FROM
	  [Reporting].[ActionStatisticsByType]
	  where ActionDate between @StartCreateDate and @EndCreateDate and
		(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
		AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
	  group by 
		[IdAccGroup],
		[AccGroupName],
		[UserLogin],
		[IDActionType]
	  ) as src PIVOT
	    (
			SUM(TypeCount) FOR [IDActionType] IN ([1],[2],[4],[6],[17],[18],[21])
		) as PivotTable); 
END
GO
/****** Object:  StoredProcedure [Reporting].[GetPendingRequestDashboardData]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetPendingRequestDashboardData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetPendingRequestDashboardData] AS' 
END
GO
ALTER PROCEDURE [Reporting].[GetPendingRequestDashboardData]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	SELECT  
	ISNULL(SUM([Sign]), 0) [Sign],
	ISNULL(SUM([Review]), 0) [Review]
	FROM 
	[Reporting].[DashboardsPendingRequest] 
	WHERE 
	CreateDate between @StartCreateDate and @EndCreateDate and
	(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
		 AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)));

END
GO
/****** Object:  StoredProcedure [Reporting].[GetRequestByStateDashboardData]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetRequestByStateDashboardData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetRequestByStateDashboardData] AS' 
END
GO
ALTER PROCEDURE [Reporting].[GetRequestByStateDashboardData]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
	ISNULL([3],0) as Pending,
	ISNULL([4],0) as Canceled,
	ISNULL([7],0) as Rejected,
	ISNULL([12],0) as Completed,
	ISNULL([13],0) as Deleted
	FROM
	(
		SELECT IdState,COUNT(IdState) StateCount

		FROM 
		[Reporting].[SignRequestStatisticsByState] 

		WHERE 
		CreateDate between @StartCreateDate and @EndCreateDate and
		(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
			 AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
			 group by idState) as src PIVOT
	    (
			SUM(StateCount) FOR IdState IN ([3],[4],[7],[12],[13])
		) as PivotTable;

END
GO
/****** Object:  StoredProcedure [Reporting].[GetRequestByStateStatisticsData]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetRequestByStateStatisticsData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetRequestByStateStatisticsData] AS' 
END
GO
ALTER PROCEDURE [Reporting].[GetRequestByStateStatisticsData]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY,
	@sortDir varchar(5) = 'ASC',
	@sortOrder varchar(50) = 'AccGroupName',
	@recordsOffset [int] = 0,
	@nextRecords [int] = 10
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT
	AccGroupName,
	UserLogin,
	UserName,
	Total,
	Pending,
	Canceled,
	Rejected,
	Completed,
	Deleted,
	ExternalId = STUFF((
          SELECT ' | ' + accxtr.Value
          FROM [AccGroupExtraFields] accxtr 
          WHERE src.IdAccGroup = accxtr.IdAccGroup and accxtr.IsKey = 1
          FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')
	FROM (
	SELECT
	IdAccGroup,
	AccGroupName,
	UserLogin,
	UserName,
	(ISNULL([3],0) + ISNULL([4],0) + ISNULL([7],0) + ISNULL([12],0) + ISNULL([13],0)) Total,
	ISNULL([3],0) Pending,
	ISNULL([4],0) Canceled,
	ISNULL([7],0) Rejected,
	ISNULL([12],0) Completed,
	ISNULL([13],0) Deleted
	FROM
	(
	SELECT IdAccGroup, AccGroupName,UserLogin,UserName,IdState,COUNT(IdState) StateCount
	FROM
	[Reporting].[SignRequestStatisticsByState]
	WHERE
	CreateDate between @StartCreateDate and @EndCreateDate and
	(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
	AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
	group by IdAccGroup,AccGroupName,UserLogin,UserName, IdState) as src PIVOT
	(
	SUM(StateCount) FOR IdState IN ([3],[4],[7],[12], [13])
	) as PivotTable) src
	order by
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'AccGroupName' THEN AccGroupName END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'AccGroupName' THEN AccGroupName END DESC,
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'UserLogin' THEN UserLogin END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'UserLogin' THEN UserLogin END DESC,
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'UserName' THEN UserName END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'UserName' THEN UserName END DESC,
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Pending' THEN Pending END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Pending' THEN Pending END DESC,
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Canceled' THEN Canceled END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Canceled' THEN Canceled END DESC,
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Rejected' THEN Rejected END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Rejected' THEN Rejected END DESC,
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Completed' THEN Completed END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Completed' THEN Completed END DESC,
	CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Total' THEN Total END,
	CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Total' THEN Total END DESC
	offset @recordsOffset rows fetch next @nextRecords rows only; 

END
GO
/****** Object:  StoredProcedure [Reporting].[GetRequestByStateStatisticsDataCount]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetRequestByStateStatisticsDataCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetRequestByStateStatisticsDataCount] AS' 
END
GO
ALTER PROCEDURE [Reporting].[GetRequestByStateStatisticsDataCount]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY
WITH RECOMPILE
AS
BEGIN	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	RETURN (
	SELECT COUNT(*) RecordCount
	FROM
	(
	SELECT AccGroupName,UserLogin,UserName,IdState,COUNT(IdState) StateCount
	FROM
	[Reporting].[SignRequestStatisticsByState]
	WHERE
	CreateDate between @StartCreateDate and @EndCreateDate and
	(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
	AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
	group by IdAccGroup,AccGroupName,UserLogin,UserName, IdState) as src PIVOT
	(
	SUM(StateCount) FOR IdState IN ([3],[4],[7],[12])
	) as PivotTable); 	

END
GO
/****** Object:  StoredProcedure [Reporting].[GetSignatureTypeDashboardData]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetSignatureTypeDashboardData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetSignatureTypeDashboardData] AS' 
END
GO
ALTER PROCEDURE [Reporting].[GetSignatureTypeDashboardData]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
	ISNULL([1],0) Biometric,
	ISNULL([2],0) OtpSms,
	ISNULL([3],0) OtpEmail,
	ISNULL([4],0) Digital
	FROM
	(
	SELECT 
	IdSignatureOption, 
	COUNT(*) SignatureCount
	FROM [Reporting].[SignatureStatisticsByType]
	WHERE ActionDate between @StartCreateDate and @EndCreateDate and
	(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
		 AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
	group by IdSignatureOption) as src PIVOT
	(
		SUM(SignatureCount) FOR [IdSignatureOption] IN ([1],[2],[3],[4])
	) as PivotTable;

END
GO
/****** Object:  StoredProcedure [Reporting].[GetSignatureTypeStatisticsData]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetSignatureTypeStatisticsData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetSignatureTypeStatisticsData] AS' 
END
GO

-- PROCEDIMIENTO OBTENCIÓN DE ESTADÍSTICAS DE TIPOS DE FIRMA POR EMPRESA Y USUARIO PAGINADAS 
ALTER PROCEDURE [Reporting].[GetSignatureTypeStatisticsData]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY,
	@sortDir varchar(5) = 'ASC',
	@sortOrder varchar(50) = 'AccGroupName',
	@recordsOffset [int] = 0,
	@nextRecords [int] = 10
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 SELECT 
	 IdAccGroup,
	 [AccGroupName], 
	 [UserLogin],
	 Total,
	 Biometric,
	 OtpSms,
	 OtpEmail,
	 Digital,
	 ExternalId = STUFF((
          SELECT ' | ' + accxtr.Value
          FROM [AccGroupExtraFields] accxtr 
          WHERE res.IdAccGroup = accxtr.IdAccGroup and accxtr.IsKey = 1
          FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')
	 FROM
	 (
	 SELECT
	 IdAccGroup,
	 [AccGroupName], 
	 [UserLogin],
	 (ISNULL([1],0) + ISNULL([2],0) + ISNULL([3],0) + ISNULL([4],0)) as Total,
	 Isnull([1],0) Biometric,
	 Isnull([2],0) OtpSms,
	 Isnull([3],0) OtpEmail,
	 Isnull([4],0) Digital
	FROM (
	select IdAccGroup,[AccGroupName], [UserLogin] , [UserName], IdSignatureOption,COUNT(IDSignatureOption) OptionCount
	from [Reporting].[SignatureStatisticsByType] where ActionDate between @StartCreateDate and @EndCreateDate and
	(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
	AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
	group by [IdAccGroup],[AccGroupName], [UserLogin], [UserName], [IdSignatureOption]) as src PIVOT
	(
		SUM(OptionCount) FOR IDSignatureOption IN ([1],[2],[3],[4])
	) as PivotTable) res 
	order by 
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'AccGroupName' THEN AccGroupName END,
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'AccGroupName' THEN AccGroupName END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'UserLogin' THEN UserLogin END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'UserLogin' THEN UserLogin END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Biometric' THEN Biometric END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Biometric' THEN Biometric END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'OtpSms' THEN OtpSms END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'OtpSms' THEN OtpSms END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'OtpEmail' THEN OtpEmail END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'OtpEmail' THEN OtpEmail END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Digital' THEN Digital END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Digital' THEN Digital END DESC,
		CASE WHEN @sortDir = 'asc' AND @sortOrder = 'Total' THEN Total END,		
		CASE WHEN @sortDir = 'desc' AND @sortOrder = 'Total' THEN Total END DESC
	offset @recordsOffset rows fetch next @nextRecords rows only; 

END
GO
/****** Object:  StoredProcedure [Reporting].[GetSignatureTypeStatisticsDataCount]    Script Date: 18/01/2023 18:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reporting].[GetSignatureTypeStatisticsDataCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Reporting].[GetSignatureTypeStatisticsDataCount] AS' 
END
GO

-- PROCEDIMIENTO CONTEO OBTENCIÓN DE ESTADÍSTICAS DE TIPOS DE FIRMA POR EMPRESA Y USUARIO PAGINADAS 
ALTER PROCEDURE [Reporting].[GetSignatureTypeStatisticsDataCount]
	-- Add the parameters for the stored procedure here
	@StartCreateDate datetime, 
	@EndCreateDate datetime,
	@AccGroupIds IntegerList READONLY,
	@UsersIds IntegerList READONLY	
WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
	return (SELECT COUNT(*) RecordCount	 
	FROM (
	select [AccGroupName], [UserLogin] , [UserName], IdSignatureOption,COUNT(IDSignatureOption) OptionCount
	from [Reporting].[SignatureStatisticsByType] where ActionDate between @StartCreateDate and @EndCreateDate and
	(((SELECT COUNT(*) FROM @AccGroupIds) = 0 OR [IdAccGroup] in (SELECT IntegerId FROM @AccGroupIds))
	AND ((SELECT COUNT(*) FROM @UsersIds) = 0 OR [IdUser] in (SELECT IntegerId FROM @UsersIds)))
	group by [IdAccGroup],[AccGroupName], [UserLogin], [UserName], [IdSignatureOption]) as src PIVOT
	(
		SUM(OptionCount) FOR IDSignatureOption IN ([1],[2],[3],[4])
	) as PivotTable); 
END
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'ContadoresEnviadas', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "SolicitudesEnviadas_PreContado"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContadoresEnviadas'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'ContadoresEnviadas', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContadoresEnviadas'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'ContadoresExpedientes', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[33] 3) )"
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
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DosieresInvolucrado"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContadoresExpedientes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'ContadoresExpedientes', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContadoresExpedientes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'ContadoresRecibidas', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[28] 2[12] 3) )"
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
         Begin Table = "Solicitudes_PreContadores"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 241
               Right = 345
            End
            DisplayFlags = 280
            TopColumn = 0
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
      Begin ColumnWidths = 12
         Column = 3990
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContadoresRecibidas'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'ContadoresRecibidas', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContadoresRecibidas'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_PreContadores', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[22] 2[23] 3) )"
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
         Begin Table = "Users"
            Begin Extent = 
               Top = 23
               Left = 581
               Bottom = 153
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dossiers"
            Begin Extent = 
               Top = 157
               Left = 572
               Bottom = 287
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1605
         Width = 2205
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
         Column = 8295
         Alias = 3285
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2700
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_PreContadores'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_PreContadores', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_PreContadores'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "NOWFUR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SR"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ORDEN_PASO_ACTIVO"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 216
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StepsWFI"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WFI"
            Begin Extent = 
               Top = 216
               Left = 38
               Bottom = 346
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WFGR"
            Begin Extent = 
               Top = 270
               Left = 246
               Bottom = 366
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'SOLICITUDES_TODAS_CON_COMPLE_1', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[12] 3) )"
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
         Begin Table = "V"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 260
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UGR"
            Begin Extent = 
               Top = 3
               Left = 417
               Bottom = 182
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
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
         Column = 8280
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SOLICITUDES_TODAS_CON_COMPLE_1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'SOLICITUDES_TODAS_CON_COMPLE_1', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SOLICITUDES_TODAS_CON_COMPLE_1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'SOLICITUDES_TODAS_CON_COMPLE_2', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "SOLICITUDES_TODAS_CON_COMPLE_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SOLICITUDES_TODAS_CON_COMPLE_2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'SOLICITUDES_TODAS_CON_COMPLE_2', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SOLICITUDES_TODAS_CON_COMPLE_2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas_Con_Completa', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[21] 2[24] 3) )"
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
         Begin Table = "V"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 260
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UGR"
            Begin Extent = 
               Top = 3
               Left = 417
               Bottom = 182
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
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
         Column = 8280
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas_Con_Completa'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas_Con_Completa', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas_Con_Completa'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas_Con_Completadas_DeDuped', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "SOLICITUDES_TODAS_CON_COMPLE_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
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
      Begin ColumnWidths = 12
         Column = 1920
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas_Con_Completadas_DeDuped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas_Con_Completadas_DeDuped', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas_Con_Completadas_DeDuped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas_con_Completadas_DesduplicadoGruposPasos', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "SOLICITUDES_TODAS_CON_COMPLE_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas_con_Completadas_DesduplicadoGruposPasos'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Solicitudes_Todas_con_Completadas_DesduplicadoGruposPasos', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Solicitudes_Todas_con_Completadas_DesduplicadoGruposPasos'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'ViewAccGroupLookUp', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAccGroupLookUp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'ViewAccGroupLookUp', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAccGroupLookUp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'ViewUsersLookUp', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "u"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 338
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "acc"
            Begin Extent = 
               Top = 9
               Left = 395
               Bottom = 206
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUsersLookUp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'ViewUsersLookUp', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUsersLookUp'
GO
USE [master]
GO
ALTER DATABASE [SealSignSaaS_Dev] SET  READ_WRITE 
GO

