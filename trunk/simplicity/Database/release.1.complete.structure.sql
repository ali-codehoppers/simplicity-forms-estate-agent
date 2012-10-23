--
-- Script To Create dbo.un_co_dept_details Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_details Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_details] (
   [dept_id] [int] IDENTITY (1, 1) NOT NULL,
   [co_id] [int] NOT NULL,
   [flg_deleted] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_details_flg_deleted] DEFAULT ((0)),
   [co_name_short] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [co_name_long] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [contact_title] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [contact_initails] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [contact_forename] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [contact_surname] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_no] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line1] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line2] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line3] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line4] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line5] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_post_code] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_full] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [tel_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [tel_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [tel_fax] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [email] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [co_notes] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [created_by] [int] NULL,
   [date_created] [datetime] NULL,
   [last_amended_by] [int] NULL,
   [date_last_amended] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_details] ADD CONSTRAINT [PK_un_co_dept_details] PRIMARY KEY CLUSTERED ([dept_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_details Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_details Table'
END
GO

--
-- Script To Create dbo.un_co_details Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_details Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_details] (
   [co_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NOT NULL CONSTRAINT [DF_un_co_details_flg_deleted] DEFAULT ((0)),
   [co_name_short] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [co_name_long] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [contact_title] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [contact_initials] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [contact_forename] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [contact_surname] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_no] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line1] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line2] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line3] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line4] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line5] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_post_code] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_full] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [tel_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [tel_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [tel_fax] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [email] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [co_notes] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [licenses_purchased] [int] NULL,
   [lincenses_used] [int] NULL,
   [flg_system_locked] [bit] NULL,
   [created_by] [int] NULL,
   [date_created] [datetime] NULL,
   [last_ameneded_by] [int] NULL,
   [date_last_amended] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_details] ADD CONSTRAINT [PK_un_co_details] PRIMARY KEY CLUSTERED ([co_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_details Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_details Table'
END
GO

--
-- Script To Create dbo.un_co_user_details Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_user_details Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_user_details] (
   [user_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NULL CONSTRAINT [DF_un_co_user_details_flg_deleted] DEFAULT ((0)),
   [co_id] [int] NOT NULL,
   [user_level] [int] NOT NULL,
   [user_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [user_logon] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [user_enable] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [user_enable_reminder] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [user_telephone] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [user_tel_ext] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [user_tel_mobile] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [user_email] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [user_department] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [user_location] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [created_by] [int] NULL,
   [date_created] [datetime] NULL,
   [last_amended_by] [int] NULL,
   [date_last_amended] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_user_details] ADD CONSTRAINT [PK_un_co_user_details] PRIMARY KEY CLUSTERED ([user_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_user_details Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_user_details Table'
END
GO

--
-- Script To Create dbo.un_ref_co_dept_hazards Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_ref_co_dept_hazards Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_ref_co_dept_hazards] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NOT NULL CONSTRAINT [DF_un_ref_co_dept_hazards_flg_deleted] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [index_seq] [int] NOT NULL,
   [name_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [created_by] [int] NULL,
   [date_created] [datetime] NULL,
   [last_amended_by] [int] NULL,
   [date_last_amended] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_hazards] ADD CONSTRAINT [PK_un_ref_co_dept_hazards] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_hazards Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_ref_co_dept_hazards Table'
END
GO

--
-- Script To Create dbo.un_ref_co_dept_people Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_ref_co_dept_people Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_ref_co_dept_people] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NOT NULL CONSTRAINT [DF_un_ref_co_dept_people_flg_deleted] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [index_seq] [int] NOT NULL,
   [name_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [created_by] [int] NULL,
   [date_created] [datetime] NULL,
   [last_ammended_by] [int] NULL,
   [date_last_amended] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people] ADD CONSTRAINT [PK_un_ref_co_dept_people] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_people Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_ref_co_dept_people Table'
END
GO

--
-- Script To Create dbo.un_ref_co_dept_ppe Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_ref_co_dept_ppe Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_ref_co_dept_ppe] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NOT NULL CONSTRAINT [DF_un_ref_co_dept_ppe_flg_deleted] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [index_seq] [int] NOT NULL,
   [name_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [created_by] [int] NULL,
   [date_created] [datetime] NULL,
   [last_amended_by] [int] NULL,
   [date_last_amended] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_ppe] ADD CONSTRAINT [PK_un_ref_co_dept_ppe] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_ppe Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_ref_co_dept_ppe Table'
END
GO

--
-- Script To Create dbo.un_ref_co_dept_tools Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_ref_co_dept_tools Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_ref_co_dept_tools] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NOT NULL CONSTRAINT [DF_un_ref_co_dept_tools_flg_deleted] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [index_seq] [int] NOT NULL,
   [name_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [created_by] [int] NULL,
   [date_created] [datetime] NULL,
   [last_amended_by] [int] NULL,
   [date_last_amended] [datetime] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_tools] ADD CONSTRAINT [PK_un_ref_co_dept_tools] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_tools Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_ref_co_dept_tools Table'
END
GO

--
-- Script To Create dbo.CompanyDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CompanyDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.CompanyDeleteCommand
(
	@Original_co_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_details] WHERE (([co_id] = @Original_co_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanyDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CompanyDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.CompanyInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CompanyInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.CompanyInsertCommand
(
	@flg_deleted bit,
	@co_name_short varchar(16),
	@co_name_long varchar(60),
	@contact_title varchar(7),
	@contact_initials varchar(3),
	@contact_forename varchar(60),
	@contact_surname varchar(60),
	@address_no varchar(32),
	@address_line1 varchar(60),
	@address_line2 varchar(60),
	@address_line3 varchar(60),
	@address_line4 varchar(60),
	@address_line5 varchar(60),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@tel_1 varchar(30),
	@tel_2 varchar(30),
	@tel_fax varchar(30),
	@email varchar(60),
	@co_notes varchar(1000),
	@licenses_purchased int,
	@lincenses_used int,
	@flg_system_locked bit,
	@created_by int,
	@date_created datetime,
	@last_ameneded_by int,
	@date_last_amended datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_details] ([flg_deleted], [co_name_short], [co_name_long], [contact_title], [contact_initials], [contact_forename], [contact_surname], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [tel_1], [tel_2], [tel_fax], [email], [co_notes], [licenses_purchased], [lincenses_used], [flg_system_locked], [created_by], [date_created], [last_ameneded_by], [date_last_amended]) VALUES (@flg_deleted, @co_name_short, @co_name_long, @contact_title, @contact_initials, @contact_forename, @contact_surname, @address_no, @address_line1, @address_line2, @address_line3, @address_line4, @address_line5, @address_post_code, @address_full, @tel_1, @tel_2, @tel_fax, @email, @co_notes, @licenses_purchased, @lincenses_used, @flg_system_locked, @created_by, @date_created, @last_ameneded_by, @date_last_amended);
	
SELECT co_id, flg_deleted, co_name_short, co_name_long, contact_title, contact_initials, contact_forename, contact_surname, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, tel_1, tel_2, tel_fax, email, co_notes, licenses_purchased, lincenses_used, flg_system_locked, created_by, date_created, last_ameneded_by, date_last_amended FROM un_co_details WHERE (co_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanyInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CompanyInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.CompanySelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CompanySelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CompanySelectById]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT  un_co_details.*
FROM    un_co_details
WHERE	co_id = @co_id
AND		flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanySelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CompanySelectById Procedure'
END
GO

--
-- Script To Create dbo.CompanySelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CompanySelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.CompanySelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_details.*
FROM            un_co_details')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanySelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CompanySelectCommand Procedure'
END
GO

--
-- Script To Create dbo.CompanyUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CompanyUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.CompanyUpdateCommand
(
	@flg_deleted bit,
	@co_name_short varchar(16),
	@co_name_long varchar(60),
	@contact_title varchar(7),
	@contact_initials varchar(3),
	@contact_forename varchar(60),
	@contact_surname varchar(60),
	@address_no varchar(32),
	@address_line1 varchar(60),
	@address_line2 varchar(60),
	@address_line3 varchar(60),
	@address_line4 varchar(60),
	@address_line5 varchar(60),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@tel_1 varchar(30),
	@tel_2 varchar(30),
	@tel_fax varchar(30),
	@email varchar(60),
	@co_notes varchar(1000),
	@licenses_purchased int,
	@lincenses_used int,
	@flg_system_locked bit,
	@created_by int,
	@date_created datetime,
	@last_ameneded_by int,
	@date_last_amended datetime,
	@Original_co_id int,
	@co_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_details] SET [flg_deleted] = @flg_deleted, [co_name_short] = @co_name_short, [co_name_long] = @co_name_long, [contact_title] = @contact_title, [contact_initials] = @contact_initials, [contact_forename] = @contact_forename, [contact_surname] = @contact_surname, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [tel_1] = @tel_1, [tel_2] = @tel_2, [tel_fax] = @tel_fax, [email] = @email, [co_notes] = @co_notes, [licenses_purchased] = @licenses_purchased, [lincenses_used] = @lincenses_used, [flg_system_locked] = @flg_system_locked, [created_by] = @created_by, [date_created] = @date_created, [last_ameneded_by] = @last_ameneded_by, [date_last_amended] = @date_last_amended WHERE (([co_id] = @Original_co_id));
	
SELECT co_id, flg_deleted, co_name_short, co_name_long, contact_title, contact_initials, contact_forename, contact_surname, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, tel_1, tel_2, tel_fax, email, co_notes, licenses_purchased, lincenses_used, flg_system_locked, created_by, date_created, last_ameneded_by, date_last_amended FROM un_co_details WHERE (co_id = @co_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanyUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CompanyUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentDeleteCommand
(
	@Original_dept_id int
)
AS
	SET NOCOUNT OFF;
Update [un_co_dept_details] set flg_deleted= 1  WHERE (([dept_id] = @Original_dept_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardDeleteCommand]
(
	@Original_sequence int,
	@user_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_hazards] SET flg_deleted=1,last_amended_by=@user_id,date_last_amended=GETDATE() WHERE (([sequence] = @Original_sequence));')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_hazards];
INSERT INTO [un_ref_co_dept_hazards] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_amended_by], [date_last_amended]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE());
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_hazards WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardSelectByCoId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardSelectByCoId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardSelectByCoId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*
FROM        un_ref_co_dept_hazards
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
ORDER BY	un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectByCoId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardSelectByCoId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*
FROM        un_ref_co_dept_hazards
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.dept_id = @dept_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
ORDER BY	un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardSelectByDeptId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardSelectById]
	@id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*
FROM        un_ref_co_dept_hazards
WHERE		un_ref_co_dept_hazards.sequence = @id
AND			un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardSelectById Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardSelectByName]
	@dept_id int,
	@co_id int,
	@name varchar(255)
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*
FROM        un_ref_co_dept_hazards
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.dept_id = @dept_id
AND			un_ref_co_dept_hazards.name_desc = @name
AND			un_ref_co_dept_hazards.flg_deleted = 0
ORDER BY	un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardSelectCommand]
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*
FROM        un_ref_co_dept_hazards
WHERE		flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_hazards] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_hazards WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentInsertCommand
(
	@co_id int,
	@flg_deleted bit,
	@co_name_short varchar(16),
	@co_name_long varchar(60),
	@contact_title varchar(7),
	@contact_initails varchar(3),
	@contact_forename varchar(60),
	@contact_surname varchar(60),
	@address_no varchar(32),
	@address_line1 varchar(60),
	@address_line2 varchar(60),
	@address_line3 varchar(60),
	@address_line4 varchar(60),
	@address_line5 varchar(60),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@tel_1 varchar(30),
	@tel_2 varchar(30),
	@tel_fax varchar(30),
	@email varchar(60),
	@co_notes varchar(60),
	@created_by int,
	@date_created datetime,
	@last_amended_by int,
	@date_last_amended datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_details] ([co_id], [flg_deleted], [co_name_short], [co_name_long], [contact_title], [contact_initails], [contact_forename], [contact_surname], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [tel_1], [tel_2], [tel_fax], [email], [co_notes], [created_by], [date_created], [last_amended_by], [date_last_amended]) VALUES (@co_id, @flg_deleted, @co_name_short, @co_name_long, @contact_title, @contact_initails, @contact_forename, @contact_surname, @address_no, @address_line1, @address_line2, @address_line3, @address_line4, @address_line5, @address_post_code, @address_full, @tel_1, @tel_2, @tel_fax, @email, @co_notes, @created_by, @date_created, @last_amended_by, @date_last_amended);
	
SELECT dept_id, co_id, flg_deleted, co_name_short, co_name_long, contact_title, contact_initails, contact_forename, contact_surname, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, tel_1, tel_2, tel_fax, email, co_notes, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_details WHERE (dept_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleDeleteCommand]
(
	@Original_sequence int,
	@user_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_people] SET flg_deleted=1,last_ammended_by=@user_id,date_last_amended=GETDATE() WHERE (([sequence] = @Original_sequence));')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_people];
INSERT INTO [un_ref_co_dept_people] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_ammended_by], [date_last_amended]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE());
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended FROM un_ref_co_dept_people WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleSelectByCoId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleSelectByCoId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleSelectByCoId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_people.*
FROM        un_ref_co_dept_people
WHERE		un_ref_co_dept_people.co_id = @co_id
AND			un_ref_co_dept_people.flg_deleted = 0
ORDER BY	un_ref_co_dept_people.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectByCoId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleSelectByCoId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_people.*
FROM        un_ref_co_dept_people
WHERE		un_ref_co_dept_people.co_id = @co_id
AND			un_ref_co_dept_people.dept_id = @dept_id
AND			un_ref_co_dept_people.flg_deleted = 0
ORDER BY	un_ref_co_dept_people.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleSelectByDeptId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleSelectById]
	@id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_people.*
FROM        un_ref_co_dept_people
WHERE		un_ref_co_dept_people.sequence = @id
AND			un_ref_co_dept_people.co_id = @co_id
AND			un_ref_co_dept_people.flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleSelectById Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleSelectByName]
	@dept_id int,
	@co_id int,
	@name varchar(255)
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_people.*
FROM        un_ref_co_dept_people
WHERE		un_ref_co_dept_people.co_id = @co_id
AND			un_ref_co_dept_people.dept_id = @dept_id
AND			un_ref_co_dept_people.name_desc = @name
AND			un_ref_co_dept_people.flg_deleted = 0
ORDER BY	un_ref_co_dept_people.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleSelectCommand]
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_people.*
FROM        un_ref_co_dept_people
WHERE		flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_people] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_ammended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended FROM un_ref_co_dept_people WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPEDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPEDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPEDeleteCommand]
(
	@Original_sequence int,
	@user_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_ppe] SET flg_deleted=1,last_amended_by=@user_id,date_last_amended=GETDATE() WHERE (([sequence] = @Original_sequence));')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPEDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPEDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPEInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPEInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPEInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_ppe];
INSERT INTO [un_ref_co_dept_ppe] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_amended_by], [date_last_amended]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE());
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_ppe WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPEInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPEInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPESelectByCoId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPESelectByCoId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPESelectByCoId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*
FROM        un_ref_co_dept_ppe
WHERE		un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.flg_deleted = 0
ORDER BY	un_ref_co_dept_ppe.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectByCoId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPESelectByCoId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPESelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPESelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPESelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*
FROM        un_ref_co_dept_ppe
WHERE		un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.dept_id = @dept_id
AND			un_ref_co_dept_ppe.flg_deleted = 0
ORDER BY	un_ref_co_dept_ppe.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPESelectByDeptId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPESelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPESelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPESelectById]
	@id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*
FROM        un_ref_co_dept_ppe
WHERE		un_ref_co_dept_ppe.sequence = @id
AND			un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPESelectById Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPESelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPESelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPESelectByName]
	@dept_id int,
	@co_id int,
	@name varchar(255)
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*
FROM        un_ref_co_dept_ppe
WHERE		un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.dept_id = @dept_id
AND			un_ref_co_dept_ppe.name_desc = @name
AND			un_ref_co_dept_ppe.flg_deleted = 0
ORDER BY	un_ref_co_dept_ppe.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPESelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPESelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPESelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPESelectCommand]
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*
FROM        un_ref_co_dept_ppe
WHERE		flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPESelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPEUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPEUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPPEUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_ppe] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_ppe WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPEUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPEUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentSelectByCompanyId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentSelectByCompanyId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentSelectByCompanyId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_details.*
FROM            un_co_dept_details
WHERE			un_co_dept_details.co_id = @co_id')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentSelectByCompanyId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentSelectByCompanyId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_details.*
FROM            un_co_dept_details where flg_deleted= 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentSelectShortNameRows Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentSelectShortNameRows Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentSelectShortNameRows] 
@shortName varchar(50)
as
BEGIN
select * from dbo.un_co_dept_details where co_name_short = @shortName
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentSelectShortNameRows Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentSelectShortNameRows Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolDeleteCommand]
(
	@Original_sequence int,
	@user_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_tools] SET flg_deleted=1,last_amended_by=@user_id,date_last_amended=GETDATE() WHERE (([sequence] = @Original_sequence));')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_tools];
INSERT INTO [un_ref_co_dept_tools] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_amended_by], [date_last_amended]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE());
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_tools WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolSelectByCoId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolSelectByCoId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolSelectByCoId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*
FROM        un_ref_co_dept_tools
WHERE		un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.flg_deleted = 0
ORDER BY	un_ref_co_dept_tools.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectByCoId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolSelectByCoId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*
FROM        un_ref_co_dept_tools
WHERE		un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.dept_id = @dept_id
AND			un_ref_co_dept_tools.flg_deleted = 0
ORDER BY	un_ref_co_dept_tools.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolSelectByDeptId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolSelectById]
	@id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*
FROM        un_ref_co_dept_tools
WHERE		un_ref_co_dept_tools.sequence = @id
AND			un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolSelectById Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolSelectByName]
	@dept_id int,
	@co_id int,
	@name varchar(255)
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*
FROM        un_ref_co_dept_tools
WHERE		un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.dept_id = @dept_id
AND			un_ref_co_dept_tools.name_desc = @name
AND			un_ref_co_dept_tools.flg_deleted = 0
ORDER BY	un_ref_co_dept_tools.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolSelectCommand]
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*
FROM        un_ref_co_dept_tools
WHERE		flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_tools] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_tools WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE procedure dbo.DepartmentUpdateCommand
	@co_name_short varchar(16),
	@co_name_long varchar(60),
	@contact_title varchar(7),
	@contact_initails varchar(3),
	@contact_forename varchar(60),
	@contact_surname varchar(60),
	@address_no varchar(32),
	@address_line1 varchar(60),
	@address_line2 varchar(60),
	@address_line3 varchar(60),
	@address_line4 varchar(60),
	@address_line5 varchar(60),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@tel_1 varchar(30),
	@tel_2 varchar(30),
	@tel_fax varchar(30),
	@email varchar(60),
	@co_notes varchar(60),
	@last_amended_by int,
	@date_last_amended datetime,
	@dept_id int
AS
Begin
UPDATE [un_co_dept_details] SET [co_name_short] = @co_name_short, [co_name_long] = @co_name_long, [contact_title] = @contact_title, [contact_initails] = @contact_initails, [contact_forename] = @contact_forename, [contact_surname] = @contact_surname, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [tel_1] = @tel_1, [tel_2] = @tel_2, [tel_fax] = @tel_fax, [email] = @email, [co_notes] = @co_notes, [last_amended_by] = @last_amended_by, [date_last_amended] = @date_last_amended WHERE (([dept_id] = @dept_id));
End')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.GetDepartmentsByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.GetDepartmentsByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.GetDepartmentsByDeptId
@dep_id int
AS
BEGIN
	SELECT * from un_co_dept_details where  dept_id = @dep_id
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.GetDepartmentsByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.GetDepartmentsByDeptId Procedure'
END
GO

--
-- Script To Create dbo.GetShortNameCountByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.GetShortNameCountByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[GetShortNameCountByDeptId] 
@dept_id int,
@shortName varchar(50)
AS
select * from un_co_dept_details where co_name_short=@shortName and dept_id <> @dept_id and flg_deleted = 0
RETURN')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.GetShortNameCountByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.GetShortNameCountByDeptId Procedure'
END
GO

--
-- Script To Create dbo.UserDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.UserDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.UserDeleteCommand
(
	@Original_user_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_user_details] WHERE (([user_id] = @Original_user_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.UserDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.UserDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.UserInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.UserInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.UserInsertCommand
(
	@flg_deleted bit,
	@co_id int,
	@user_level int,
	@user_name varchar(50),
	@user_logon varchar(50),
	@user_enable varchar(50),
	@user_enable_reminder varchar(50),
	@user_telephone varchar(16),
	@user_tel_ext varchar(6),
	@user_tel_mobile varchar(16),
	@user_email varchar(254),
	@user_department varchar(32),
	@user_location varchar(256),
	@created_by int,
	@date_created datetime,
	@last_amended_by int,
	@date_last_amended datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_user_details] ([flg_deleted], [co_id], [user_level], [user_name], [user_logon], [user_enable], [user_enable_reminder], [user_telephone], [user_tel_ext], [user_tel_mobile], [user_email], [user_department], [user_location], [created_by], [date_created], [last_amended_by], [date_last_amended]) VALUES (@flg_deleted, @co_id, @user_level, @user_name, @user_logon, @user_enable, @user_enable_reminder, @user_telephone, @user_tel_ext, @user_tel_mobile, @user_email, @user_department, @user_location, @created_by, @date_created, @last_amended_by, @date_last_amended);
	
SELECT user_id, flg_deleted, co_id, user_level, user_name, user_logon, user_enable, user_enable_reminder, user_telephone, user_tel_ext, user_tel_mobile, user_email, user_department, user_location, created_by, date_created, last_amended_by, date_last_amended FROM un_co_user_details WHERE (user_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.UserInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.UserInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.UserLogin Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.UserLogin Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.UserLogin
	-- Add the parameters for the stored procedure here
	@user_name varchar(50),
	@user_enable varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT user_id, flg_deleted, co_id, user_level, user_name, user_logon, user_enable, user_enable_reminder, user_telephone, user_tel_ext, user_tel_mobile, user_email, user_department, user_location, created_by, date_created, last_amended_by, date_last_amended FROM un_co_user_details WHERE user_name = @user_name AND user_enable = @user_enable
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.UserLogin Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.UserLogin Procedure'
END
GO

--
-- Script To Create dbo.UserSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.UserSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.UserSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_user_details.*
FROM            un_co_user_details')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.UserSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.UserSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.UserUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, July 19, 2009, at 09:50 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.UserUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.UserUpdateCommand
(
	@flg_deleted bit,
	@co_id int,
	@user_level int,
	@user_name varchar(50),
	@user_logon varchar(50),
	@user_enable varchar(50),
	@user_enable_reminder varchar(50),
	@user_telephone varchar(16),
	@user_tel_ext varchar(6),
	@user_tel_mobile varchar(16),
	@user_email varchar(254),
	@user_department varchar(32),
	@user_location varchar(256),
	@created_by int,
	@date_created datetime,
	@last_amended_by int,
	@date_last_amended datetime,
	@Original_user_id int,
	@user_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_user_details] SET [flg_deleted] = @flg_deleted, [co_id] = @co_id, [user_level] = @user_level, [user_name] = @user_name, [user_logon] = @user_logon, [user_enable] = @user_enable, [user_enable_reminder] = @user_enable_reminder, [user_telephone] = @user_telephone, [user_tel_ext] = @user_tel_ext, [user_tel_mobile] = @user_tel_mobile, [user_email] = @user_email, [user_department] = @user_department, [user_location] = @user_location, [created_by] = @created_by, [date_created] = @date_created, [last_amended_by] = @last_amended_by, [date_last_amended] = @date_last_amended WHERE (([user_id] = @Original_user_id));
	
SELECT user_id, flg_deleted, co_id, user_level, user_name, user_logon, user_enable, user_enable_reminder, user_telephone, user_tel_ext, user_tel_mobile, user_email, user_department, user_location, created_by, date_created, last_amended_by, date_last_amended FROM un_co_user_details WHERE (user_id = @user_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.UserUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.UserUpdateCommand Procedure'
END
GO