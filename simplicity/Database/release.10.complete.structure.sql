--
-- Script To Update dbo.un_co_dept_doc_type Table In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_dept_doc_type Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_dept_doc_type_flg_delete')
      ALTER TABLE [dbo].[un_co_dept_doc_type] DROP CONSTRAINT [DF_un_co_dept_doc_type_flg_delete]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_un_co_dept_doc_type] (
   [doc_data_type_id] [int] IDENTITY (1, 1) NOT NULL,
   [doc_data_type_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_doc_type_flg_delete] DEFAULT ((0)),
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [sort_order] [tinyint] NOT NULL,
   [field_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [generator_class] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [required] [bit] NOT NULL,
   [style] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [flg_landscape] [bit] NULL,
   [num_of_sections] [int] NULL,
   [flg_checked] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_dept_doc_type] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_un_co_dept_doc_type] ([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class], [required], [style], [flg_landscape], [num_of_sections], [flg_checked])
   SELECT [doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class], [required], [style], [flg_landscape], [num_of_sections], 0
   FROM [dbo].[un_co_dept_doc_type]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_dept_doc_type] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[un_co_dept_doc_type]
GO

sp_rename N'[dbo].[tmp_un_co_dept_doc_type]', N'un_co_dept_doc_type'

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_doc_type] ADD CONSTRAINT [PK_un_ref_doc_data_type] PRIMARY KEY CLUSTERED ([doc_data_type_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_doc_type Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_dept_doc_type Table'
END
GO

--
-- Script To Update dbo.un_co_dept_template_docs Table In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_dept_template_docs Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_docs]
      ADD [related_doc_codes] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_docs Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_dept_template_docs Table'
END
GO

--
-- Script To Update dbo.un_co_details Table In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_details Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_details_flg_deleted')
      ALTER TABLE [dbo].[un_co_details] DROP CONSTRAINT [DF_un_co_details_flg_deleted]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_details_first_aider_label')
      ALTER TABLE [dbo].[un_co_details] DROP CONSTRAINT [DF_un_co_details_first_aider_label]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_details_supervisor_label')
      ALTER TABLE [dbo].[un_co_details] DROP CONSTRAINT [DF_un_co_details_supervisor_label]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_un_co_details] (
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
   [date_last_amended] [datetime] NULL,
   [flg_autosave] [bit] NULL,
   [fire_warden_label] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [first_aider_label] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_un_co_details_first_aider_label] DEFAULT ('First Aider'),
   [flg_multi_supervisors] [bit] NULL,
   [supervisor_label] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_un_co_details_supervisor_label] DEFAULT ('Supervisor'),
   [flg_active] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_details] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_un_co_details] ([co_id], [flg_deleted], [co_name_short], [co_name_long], [contact_title], [contact_initials], [contact_forename], [contact_surname], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [tel_1], [tel_2], [tel_fax], [email], [co_notes], [licenses_purchased], [lincenses_used], [flg_system_locked], [created_by], [date_created], [last_ameneded_by], [date_last_amended], [flg_autosave], [fire_warden_label], [first_aider_label], [flg_multi_supervisors], [supervisor_label], [flg_active])
   SELECT [co_id], [flg_deleted], [co_name_short], [co_name_long], [contact_title], [contact_initials], [contact_forename], [contact_surname], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [tel_1], [tel_2], [tel_fax], [email], [co_notes], [licenses_purchased], [lincenses_used], [flg_system_locked], [created_by], [date_created], [last_ameneded_by], [date_last_amended], [flg_autosave], [fire_warden_label], [first_aider_label], [flg_multi_supervisors], [supervisor_label], 0
   FROM [dbo].[un_co_details]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_details] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[un_co_details]
GO

sp_rename N'[dbo].[tmp_un_co_details]', N'un_co_details'

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
   PRINT 'dbo.un_co_details Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_details Table'
END
GO

--
-- Script To Update dbo.un_co_user_details Table In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_user_details Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_user_details_flg_deleted')
      ALTER TABLE [dbo].[un_co_user_details] DROP CONSTRAINT [DF_un_co_user_details_flg_deleted]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_un_co_user_details] (
   [user_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NULL CONSTRAINT [DF_un_co_user_details_flg_deleted] DEFAULT ((0)),
   [co_id] [int] NULL,
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
   [date_last_amended] [datetime] NULL,
   [role] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_user_details] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_un_co_user_details] ([user_id], [flg_deleted], [co_id], [user_level], [user_name], [user_logon], [user_enable], [user_enable_reminder], [user_telephone], [user_tel_ext], [user_tel_mobile], [user_email], [user_department], [user_location], [created_by], [date_created], [last_amended_by], [date_last_amended], [role])
   SELECT [user_id], [flg_deleted], [co_id], [user_level], [user_name], [user_logon], [user_enable], [user_enable_reminder], [user_telephone], [user_tel_ext], [user_tel_mobile], [user_email], [user_department], [user_location], [created_by], [date_created], [last_amended_by], [date_last_amended], ''
   FROM [dbo].[un_co_user_details]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_user_details] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[un_co_user_details]
GO

sp_rename N'[dbo].[tmp_un_co_user_details]', N'un_co_user_details'

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
   PRINT 'dbo.un_co_user_details Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_user_details Table'
END
GO

--
-- Script To Update dbo.CompanyDeleteCommand Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CompanyDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.CompanyDeleteCommand
(
	@Original_co_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_details] SET flg_deleted = 1 WHERE (([co_id] = @Original_co_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanyDeleteCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CompanyDeleteCommand Procedure'
END
GO

--
-- Script To Update dbo.CompanyInsertCommand Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CompanyInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.CompanyInsertCommand
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
	@flg_autosave bit,
	@fire_warden_label varchar(50),
	@first_aider_label varchar(50),
	@flg_multi_supervisors bit,
	@supervisor_label varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_details] ([flg_deleted], [co_name_short], [co_name_long], [contact_title], [contact_initials], [contact_forename], [contact_surname], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [tel_1], [tel_2], [tel_fax], [email], [co_notes], [licenses_purchased], [lincenses_used], [flg_system_locked], [created_by], [date_created], [last_ameneded_by], [date_last_amended],[flg_autosave],[fire_warden_label],[first_aider_label],[flg_multi_supervisors],[supervisor_label]) VALUES (@flg_deleted, @co_name_short, @co_name_long, @contact_title, @contact_initials, @contact_forename, @contact_surname, @address_no, @address_line1, @address_line2, @address_line3, @address_line4, @address_line5, @address_post_code, @address_full, @tel_1, @tel_2, @tel_fax, @email, @co_notes, @licenses_purchased, @lincenses_used, @flg_system_locked, @created_by, @date_created, @last_ameneded_by, @date_last_amended,@flg_autosave,@fire_warden_label,@first_aider_label,@flg_multi_supervisors,@supervisor_label);
	
SELECT co_id, flg_deleted, co_name_short, co_name_long, contact_title, contact_initials, contact_forename, contact_surname, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, tel_1, tel_2, tel_fax, email, co_notes, licenses_purchased, lincenses_used, flg_system_locked, created_by, date_created, last_ameneded_by, date_last_amended FROM un_co_details WHERE (co_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanyInsertCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CompanyInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.CompanySelectByName Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CompanySelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CompanySelectByName]
	@co_name_short varchar(16),
	@co_id int
AS
	SET NOCOUNT ON;
SELECT  un_co_details.*
FROM    un_co_details
WHERE	co_name_short = @co_name_short
AND		(@co_id IS NULL OR @co_id = 0 OR co_id <> @co_id)
AND		flg_deleted = 0;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanySelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CompanySelectByName Procedure'
END
GO

--
-- Script To Update dbo.CompanySelectCommand Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CompanySelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.CompanySelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_details.*
FROM            un_co_details
WHERE flg_deleted = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanySelectCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CompanySelectCommand Procedure'
END
GO

--
-- Script To Create dbo.CompanyUpdateActive Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CompanyUpdateActive Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CompanyUpdateActive]
(
	@flg_active bit,
	@co_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_details] SET [flg_active] = @flg_active
WHERE [co_id] = @co_id;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanyUpdateActive Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CompanyUpdateActive Procedure'
END
GO

--
-- Script To Update dbo.CompanyUpdateCommand Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.CompanyUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.CompanyUpdateCommand
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
	@last_ameneded_by int,
	@date_last_amended datetime,
	@flg_autosave bit,
	@fire_warden_label varchar(50),
	@first_aider_label varchar(50),
	@flg_multi_supervisors bit,
	@supervisor_label varchar(50),
	@Original_co_id int,
	@co_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_details] SET [flg_deleted] = @flg_deleted, [co_name_short] = @co_name_short, [co_name_long] = @co_name_long, [contact_title] = @contact_title, [contact_initials] = @contact_initials, [contact_forename] = @contact_forename, [contact_surname] = @contact_surname, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [tel_1] = @tel_1, [tel_2] = @tel_2, [tel_fax] = @tel_fax, [email] = @email, [co_notes] = @co_notes, [licenses_purchased] = @licenses_purchased, [lincenses_used] = @lincenses_used, [flg_system_locked] = @flg_system_locked, [last_ameneded_by] = @last_ameneded_by, [date_last_amended] = @date_last_amended ,
	[flg_autosave]=@flg_autosave,[fire_warden_label] = @fire_warden_label, [first_aider_label] = @first_aider_label, [flg_multi_supervisors] = @flg_multi_supervisors, [supervisor_label] = @supervisor_label
WHERE (([co_id] = @Original_co_id));
	
SELECT * FROM un_co_details WHERE (co_id = @co_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CompanyUpdateCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.CompanyUpdateCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderLogSelect Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentOrderLogSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DepartmentOrderLogSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_log.*,un_co_user_details.user_name
FROM            un_co_dept_ord_log
inner join un_co_user_details on un_co_user_details.user_id = un_co_dept_ord_log.created_by')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogSelect Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentOrderLogSelect Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderLogSelectByOrderId Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentOrderLogSelectByOrderId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentOrderLogSelectByOrderId]
	@co_id int,
	@dept_id int,
	@order_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_log.*,un_co_user_details.user_name
FROM            un_co_dept_ord_log
inner join un_co_user_details on un_co_user_details.user_id = un_co_dept_ord_log.created_by
WHERE		un_co_dept_ord_log.co_id = @co_id
AND			un_co_dept_ord_log.dept_id = @dept_id
AND			un_co_dept_ord_log.order_id = @order_id
AND			un_co_dept_ord_log.flg_delete = 0
ORDER BY creation_time desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogSelectByOrderId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentOrderLogSelectByOrderId Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderSearchCommand Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentOrderSearchCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentOrderSearchCommand] 
@dept_id int,
@site_add varchar(100),
@ord_ref varchar(32),
@client_ref varchar(32),
@from_date varchar(20),
@to_date varchar(20),
@postal_code varchar(9)
AS
BEGIN
Select un_co_dept_ords.sequence,un_co_dept_details.co_name_short as department,un_co_dept_ords.order_ref,un_co_dept_ords.order_sms,
    un_co_dept_ords.order_client_ref,un_co_dept_ords.date_order_created,un_co_dept_ords.address_no,un_co_dept_ords.address_line1,un_co_dept_ords.address_post_code,
	un_co_dept_ords.date_order_review,un_co_dept_ords.flg_cancelled,count(order_docs.order_id) as num_of_risk_assessments
from [un_co_dept_ords]
inner join [un_co_dept_details]  on un_co_dept_ords.dept_id = un_co_dept_details.dept_id
left join 
(
	select un_co_dept_ord_docs.co_id,un_co_dept_ord_docs.dept_id,un_co_dept_ord_docs.order_id
      from un_co_dept_ord_docs
	 inner join dbo.un_co_dept_template_docs 
		on un_co_dept_ord_docs.co_id = un_co_dept_template_docs.co_id
	   and un_co_dept_ord_docs.dept_id = un_co_dept_template_docs.dept_id 
	   and un_co_dept_ord_docs.doc_id = un_co_dept_template_docs.doc_id
	 inner join dbo.un_co_dept_doc_type
	    on un_co_dept_doc_type.co_id = un_co_dept_template_docs.co_id
	   and un_co_dept_doc_type.dept_id = un_co_dept_template_docs.dept_id
	   and un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_docs.doc_type_id
	 where un_co_dept_doc_type.doc_data_type_desc = ''Risk Assessments''
) order_docs on order_docs.co_id = un_co_dept_ords.co_id
			and order_docs.dept_id = un_co_dept_ords.dept_id
			and order_docs.order_id = un_co_dept_ords.sequence
where un_co_dept_ords.dept_id =@dept_id
and (@site_add IS null  or un_co_dept_ords.address_full = @site_add)
and (@ord_ref IS null  or un_co_dept_ords.order_ref = @ord_ref)
and (@client_ref IS null  or un_co_dept_ords.order_client_ref = @client_ref)
and (@from_date IS null  or un_co_dept_ords.date_created >= convert(datetime,@from_date,103))
and (@to_date IS null  or un_co_dept_ords.date_created <= dateadd(d,1,convert(datetime,@to_date,103)))
and (@postal_code IS null or un_co_dept_ords.address_post_code = @postal_code)
and un_co_dept_ords.flg_delete = 0
group by un_co_dept_ords.sequence,un_co_dept_details.co_name_short,un_co_dept_ords.order_ref,un_co_dept_ords.order_sms,
    un_co_dept_ords.order_client_ref,un_co_dept_ords.date_order_created,un_co_dept_ords.address_no,un_co_dept_ords.address_line1,un_co_dept_ords.address_post_code,
	un_co_dept_ords.date_order_review,un_co_dept_ords.flg_cancelled
order by date_order_created desc 
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSearchCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentOrderSearchCommand Procedure'
END
GO

--
-- Script To Create dbo.DocumentRelatedDocsUpdate Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentRelatedDocsUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentRelatedDocsUpdate]
(
	@related_doc_codes varchar(1000),
	@original_doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_docs] SET [related_doc_codes] = @related_doc_codes WHERE [doc_id] = @original_doc_id;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentRelatedDocsUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentRelatedDocsUpdate Procedure'
END
GO

--
-- Script To Update dbo.UserLogin Procedure In .\SQLEXPRESS.unchs_release
-- Generated Wednesday, October 21, 2009, at 12:07 AM
--
-- Please backup .\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.UserLogin Procedure'
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
ALTER PROCEDURE dbo.UserLogin
	-- Add the parameters for the stored procedure here
	@user_logon varchar(50),
	@user_enable varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM un_co_user_details WHERE user_logon = @user_logon AND user_enable = @user_enable
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.UserLogin Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.UserLogin Procedure'
END
GO