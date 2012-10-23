--
-- Script To Create dbo.un_co_dept_details Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.un_co_dept_doc_type Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_doc_type Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_doc_type] (
   [doc_data_type_id] [int] IDENTITY (1, 1) NOT NULL,
   [doc_data_type_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_doc_type_flg_delete] DEFAULT ((0)),
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [sort_order] [tinyint] NOT NULL,
   [field_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [generator_class] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

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
   PRINT 'dbo.un_co_dept_doc_type Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_doc_type Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_assem_pt Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_assem_pt Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_assem_pt] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [assem_point_title] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [assem_point_desc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_assem_pt] ADD CONSTRAINT [PK_un_co_dept_ord_assem_pt] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_assem_pt Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_assem_pt Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_client_req Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_client_req Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_client_req] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [requirement_header] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [requirement_desc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_client_req] ADD CONSTRAINT [PK_un_co_dept_ord_client_req] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_client_req Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_client_req Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_ctrl_meas Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_ctrl_meas Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_ctrl_meas] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [control_measure_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_ctrl_meas] ADD CONSTRAINT [PK_un_co_dept_ord_ctrl_meas] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_ctrl_meas Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_ctrl_meas Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_docs Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_docs Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_docs] (
   [dept_order_doc_id] [int] IDENTITY (1, 1) NOT NULL,
   [order_id] [int] NOT NULL,
   [doc_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [flg_delete] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ord_docs] ADD CONSTRAINT [PK_un_co_dept_ord_docs] PRIMARY KEY CLUSTERED ([dept_order_doc_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_docs Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_docs Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_emer_exits Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_emer_exits Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_emer_exits] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [emer_exit_title] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [emer_exit_desc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_emer_exits] ADD CONSTRAINT [PK_un_co_dept_ord_emer_exits] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_emer_exits Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_emer_exits Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_hazards Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_hazards Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_hazards] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [hazard_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_hazards] ADD CONSTRAINT [PK_un_co_dept_ord_hazards] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_hazards Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_hazards Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_hazards_sig Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_hazards_sig Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_hazards_sig] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [hazard_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_hazards_sig] ADD CONSTRAINT [PK_un_co_dept_ord_hazards_sig] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_hazards_sig Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_hazards_sig Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_key_aspects Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_key_aspects Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_key_aspects] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [key_aspect_header] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [key_aspect_desc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_key_aspects] ADD CONSTRAINT [PK_un_co_dept_ord_key_aspects] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_key_aspects Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_key_aspects Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_log Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_log Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_log] (
   [log_id] [int] IDENTITY (1, 1) NOT NULL,
   [order_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [created_by] [int] NOT NULL,
   [creation_time] [datetime] NOT NULL,
   [file_path] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ord_log] ADD CONSTRAINT [PK_un_co_dept_ord_folders] PRIMARY KEY CLUSTERED ([log_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_log Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_log Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_people Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_people Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_people] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_ord_people_flg_delete] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [name_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [flg_supervisor] [bit] NULL CONSTRAINT [DF_un_co_dept_ord_people_flg_supervisor] DEFAULT ((0)),
   [flg_engaged] [bit] NULL CONSTRAINT [DF_un_co_dept_ord_people_flg_engaged] DEFAULT ((0)),
   [flg_first_aider] [bit] NULL CONSTRAINT [DF_un_co_dept_ord_people_flg_first_aider] DEFAULT ((0)),
   [flg_fire_warden] [bit] NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_people] ADD CONSTRAINT [PK_un_co_dept_ord_people] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_people Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_people Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_ppe Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_ppe Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_ppe] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [ppe_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_ppe] ADD CONSTRAINT [PK_un_co_dept_ord_ppe] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_ppe Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_ppe Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_seq_of_works Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_seq_of_works Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_seq_of_works] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [work_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_seq_of_works] ADD CONSTRAINT [PK_un_co_dept_ord_seq_of_works] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_seq_of_works Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_seq_of_works Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_tools Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_tools Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_tools] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [tool_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ord_tools] ADD CONSTRAINT [PK_un_co_dept_ord_tools] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_tools Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_tools Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ords Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ords Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ords] (
   [sequence] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_ords_flg_delete] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_ref] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [order_client_ref] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [order_sms] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [date_order_created] [datetime] NULL,
   [order_est_of_works] [int] NULL,
   [est_num_of_operatives] [int] NULL,
   [date_order_review] [datetime] NULL,
   [flg_order_doc_to_client] [bit] NULL CONSTRAINT [DF_un_co_dept_ords_flg_order_doc_to_client] DEFAULT ((0)),
   [date_sent_to_client] [datetime] NULL,
   [flg_asbestos_register] [bit] NULL,
   [flg_health_safety_closed] [bit] NULL,
   [date_closed] [datetime] NULL,
   [address_no] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line1] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line2] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line3] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line4] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line5] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_post_code] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_full] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [order_desc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [desc_of_work] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [flg_multi_emer_exits] [bit] NULL CONSTRAINT [DF_un_co_dept_ords_flg_multi_emer_exits] DEFAULT ((0)),
   [flg_multi_assem_points] [bit] NULL CONSTRAINT [DF_un_co_dept_ords_flg_multi_assem_points] DEFAULT ((0)),
   [flg_cancelled] [bit] NULL CONSTRAINT [DF_un_co_dept_ords_flg_cancelled] DEFAULT ((0)),
   [date_cancelled] [datetime] NULL,
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
   ALTER TABLE [dbo].[un_co_dept_ords] ADD CONSTRAINT [PK_un_co_dept_ords] PRIMARY KEY CLUSTERED ([sequence])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ords Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ords Table'
END
GO

--
-- Script To Create dbo.un_co_dept_template_docs Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_template_docs Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_template_docs] (
   [doc_id] [int] IDENTITY (1, 1) NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [doc_type_id] [int] NOT NULL,
   [doc_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [doc_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [doc_code] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_template_docs_flg_delete] DEFAULT ((0)),
   [doc_index] [int] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_docs] ADD CONSTRAINT [PK_un_co_dept_template_docs] PRIMARY KEY CLUSTERED ([doc_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_docs Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_template_docs Table'
END
GO

--
-- Script To Create dbo.un_co_dept_template_items Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_template_items Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_template_items] (
   [item_id] [int] IDENTITY (1, 1) NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [section_id] [int] NOT NULL,
   [doc_id] [int] NOT NULL,
   [item_type] [tinyint] NOT NULL,
   [item_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [item_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [item_index] [tinyint] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_items] ADD CONSTRAINT [PK_un_co_dept_template_items] PRIMARY KEY CLUSTERED ([item_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_items Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_template_items Table'
END
GO

--
-- Script To Create dbo.un_co_dept_template_sections Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_template_sections Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_template_sections] (
   [section_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [section_index] [int] NOT NULL,
   [section_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_sections] ADD CONSTRAINT [PK_un_co_doc_template_sections] PRIMARY KEY CLUSTERED ([section_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_sections Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_template_sections Table'
END
GO

--
-- Script To Create dbo.un_co_details Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
   [date_last_amended] [datetime] NULL,
   [flg_autosave] [bit] NULL
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
-- Script To Create dbo.un_co_user_details Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.un_ref_co_dept_hazards Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.un_ref_co_dept_people Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
   [date_last_amended] [datetime] NULL,
   [flg_fire_warden] [bit] NULL CONSTRAINT [DF_un_ref_co_dept_people_flg_fire_warden] DEFAULT ((0)),
   [flg_first_aider] [bit] NULL CONSTRAINT [DF_un_ref_co_dept_people_flg_first_aider] DEFAULT ((0)),
   [flg_supervisor] [bit] NULL CONSTRAINT [DF_un_ref_co_dept_people_flg_supervisor] DEFAULT ((0))
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
-- Script To Create dbo.un_ref_co_dept_ppe Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.un_ref_co_dept_tools Table In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.CompanyDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.CompanyInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.CompanySelectById Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.CompanySelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.CompanyUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DeleteExistingOrderPersonCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeleteExistingOrderPersonCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DeleteExistingOrderPersonCommand
@order_seq int
AS
BEGIN
delete from un_co_dept_ord_people where order_seq = @order_seq
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeleteExistingOrderPersonCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeleteExistingOrderPersonCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentHazardDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentHazardInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentHazardRemainingSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentHazardRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*
FROM        un_ref_co_dept_hazards
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.dept_id = @dept_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
AND name_desc NOT IN
(
	SELECT hazard_desc 
	  FROM un_co_dept_ord_hazards
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardRemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardRemainingSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardSelectByCoId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentHazardSelectByDeptId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentHazardSelectById Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentHazardSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
	@name varchar(255),
	@original_sequence int
AS
	SET NOCOUNT ON;
SELECT      *
FROM        un_ref_co_dept_hazards
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			name_desc = @name
AND			(@original_sequence = 0 OR sequence <> @original_sequence)
AND			flg_deleted = 0
ORDER BY	index_seq')
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
-- Script To Create dbo.DepartmentHazardSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentHazardSigRemainingSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardSigRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREAte PROCEDURE [dbo].[DepartmentHazardSigRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*
FROM        un_ref_co_dept_hazards
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.dept_id = @dept_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
AND name_desc NOT IN
(
	SELECT hazard_desc 
	  FROM un_co_dept_ord_hazards_sig
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSigRemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardSigRemainingSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentOrderAssemblePtsDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderAssemblePtsDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderAssemblePtsDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_assem_pt SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderAssemblePtsDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderAssemblePtsDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderAssemblePtsInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderAssemblePtsInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderAssemblePtsInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@assem_point_title varchar(128),
	@assem_point_desc varchar(1000),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_assem_pt(dept_id,co_id,order_seq,assem_point_title,assem_point_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@assem_point_title,@assem_point_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,assem_point_title,assem_point_desc
FROM un_co_dept_ord_assem_pt
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderAssemblePtsInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderAssemblePtsInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderAssemblePtsSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderAssemblePtsSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderAssemblePtsSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,assem_point_title,assem_point_desc
FROM        un_co_dept_ord_assem_pt
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderAssemblePtsSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderAssemblePtsSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderAssemblePtsSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderAssemblePtsSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderAssemblePtsSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@assem_point_title varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,assem_point_title,assem_point_desc
FROM        un_co_dept_ord_assem_pt
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			assem_point_title = @assem_point_title')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderAssemblePtsSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderAssemblePtsSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderAssemblePtsUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderAssemblePtsUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderAssemblePtsUpdate]
(
	@assem_point_title varchar(128),
	@assem_point_desc varchar(1000),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_assem_pt SET assem_point_title = @assem_point_title,assem_point_desc = @assem_point_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,assem_point_title,assem_point_desc
FROM un_co_dept_ord_assem_pt
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderAssemblePtsUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderAssemblePtsUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderCtrlMeasureDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderCtrlMeasureDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderCtrlMeasureDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_ctrl_meas SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderCtrlMeasureDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderCtrlMeasureDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderCtrlMeasureInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderCtrlMeasureInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderCtrlMeasureInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@control_measure_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_ctrl_meas(dept_id,co_id,order_seq,control_measure_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@control_measure_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,control_measure_desc
FROM un_co_dept_ord_ctrl_meas
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderCtrlMeasureInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderCtrlMeasureInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderCtrlMeasureSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderCtrlMeasureSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderCtrlMeasureSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,control_measure_desc
FROM        un_co_dept_ord_ctrl_meas
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderCtrlMeasureSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderCtrlMeasureSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderCtrlMeasureSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderCtrlMeasureSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderCtrlMeasureSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@control_measure_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,control_measure_desc
FROM        un_co_dept_ord_ctrl_meas
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			control_measure_desc = @control_measure_desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderCtrlMeasureSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderCtrlMeasureSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderCtrlMeasureUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderCtrlMeasureUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderCtrlMeasureUpdate]
(
	@control_measure_desc varchar(255),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_ctrl_meas SET control_measure_desc = @control_measure_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,control_measure_desc
FROM un_co_dept_ord_ctrl_meas
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderCtrlMeasureUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderCtrlMeasureUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderDeleteCommand
(
	@Original_sequence int
)
AS
	SET NOCOUNT OFF;
update [un_co_dept_ords] set flg_delete = 1 WHERE (([sequence] = @Original_sequence))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentDefaultSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentDefaultSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderDocumentDefaultSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_docs.*
FROM            un_co_dept_ord_docs')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentDefaultSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentDefaultSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderDocumentDelete]
(
	@Original_dept_order_doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ord_docs] SET flg_delete = 1 WHERE (([dept_order_doc_id] = @Original_dept_order_doc_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderDocumentInsert
(
	@order_id int,
	@doc_id int,
	@dept_id int,
	@co_id int,
	@flg_delete bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_ord_docs] ([order_id], [doc_id], [dept_id], [co_id], [flg_delete]) VALUES (@order_id, @doc_id, @dept_id, @co_id, @flg_delete);
	
SELECT dept_order_doc_id, order_id, doc_id, dept_id, co_id, flg_delete FROM un_co_dept_ord_docs WHERE (dept_order_doc_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderDocumentSelect]
	@co_id int,
	@dept_id int,
	@order_id int
AS
	SET NOCOUNT ON;
SELECT    un_co_dept_ord_docs.dept_order_doc_id,un_co_dept_template_docs.doc_id,un_co_dept_template_docs.doc_name,un_co_dept_template_docs.doc_desc,un_co_dept_template_docs.doc_code
FROM            un_co_dept_ord_docs
INNER JOIN un_co_dept_template_docs 
ON un_co_dept_ord_docs.co_id = un_co_dept_template_docs.co_id
AND un_co_dept_ord_docs.dept_id = un_co_dept_template_docs.dept_id
AND un_co_dept_ord_docs.doc_id = un_co_dept_template_docs.doc_id
WHERE un_co_dept_ord_docs.order_id = @order_id
AND	un_co_dept_ord_docs.flg_delete = 0
AND un_co_dept_template_docs.flg_delete = 0
ORDER BY un_co_dept_template_docs.doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentSelectByTypeId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentSelectByTypeId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderDocumentSelectByTypeId]
	@co_id int,
	@dept_id int,
	@order_id int,
	@doc_type_id int
AS
	SET NOCOUNT ON;
SELECT    un_co_dept_ord_docs.dept_order_doc_id,un_co_dept_template_docs.doc_id,un_co_dept_template_docs.doc_name,un_co_dept_template_docs.doc_desc,un_co_dept_template_docs.doc_code
FROM            un_co_dept_ord_docs
INNER JOIN un_co_dept_template_docs 
ON un_co_dept_ord_docs.co_id = un_co_dept_template_docs.co_id
AND un_co_dept_ord_docs.dept_id = un_co_dept_template_docs.dept_id
AND un_co_dept_ord_docs.doc_id = un_co_dept_template_docs.doc_id
WHERE un_co_dept_ord_docs.order_id = @order_id
AND un_co_dept_template_docs.doc_type_id = @doc_type_id
AND	un_co_dept_ord_docs.flg_delete = 0
AND un_co_dept_template_docs.flg_delete = 0
ORDER BY un_co_dept_template_docs.doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentSelectByTypeId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentSelectByTypeId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderEmergencyExitsDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderEmergencyExitsDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderEmergencyExitsDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_emer_exits SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderEmergencyExitsDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderEmergencyExitsDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderEmergencyExitsInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderEmergencyExitsInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderEmergencyExitsInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@emer_exit_title varchar(128),
	@emer_exit_desc varchar(1000),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_emer_exits(dept_id,co_id,order_seq,emer_exit_title,emer_exit_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@emer_exit_title,@emer_exit_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,emer_exit_title,emer_exit_desc
FROM un_co_dept_ord_emer_exits
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderEmergencyExitsInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderEmergencyExitsInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderEmergencyExitsSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderEmergencyExitsSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderEmergencyExitsSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,emer_exit_title,emer_exit_desc
FROM        un_co_dept_ord_emer_exits
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderEmergencyExitsSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderEmergencyExitsSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderEmergencyExitsSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderEmergencyExitsSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderEmergencyExitsSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@emer_exit_title varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,emer_exit_title,emer_exit_desc
FROM        un_co_dept_ord_emer_exits
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			emer_exit_title = @emer_exit_title')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderEmergencyExitsSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderEmergencyExitsSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderEmergencyExitsUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderEmergencyExitsUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderEmergencyExitsUpdate]
(
	@emer_exit_title varchar(128),
	@emer_exit_desc varchar(1000),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_emer_exits SET emer_exit_title = @emer_exit_title,emer_exit_desc = @emer_exit_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,emer_exit_title,emer_exit_desc
FROM un_co_dept_ord_emer_exits
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderEmergencyExitsUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderEmergencyExitsUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderFireWardenInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderFireWardenInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderFireWardenInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_people(dept_id,co_id,order_seq,name_desc,flg_fire_warden,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@name_desc,1,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,name_desc
FROM un_co_dept_ord_people
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderFireWardenInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderFireWardenInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderFireWardenSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderFireWardenSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderFireWardenSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			flg_fire_warden = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderFireWardenSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderFireWardenSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderFireWardenSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderFireWardenSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderFireWardenSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			name_desc = @name_desc
AND			flg_delete = 0
AND			flg_fire_warden = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderFireWardenSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderFireWardenSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderFirstAiderInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderFirstAiderInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderFirstAiderInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_people(dept_id,co_id,order_seq,name_desc,flg_first_aider,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@name_desc,1,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,name_desc
FROM un_co_dept_ord_people
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderFirstAiderInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderFirstAiderInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderFirstAiderSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderFirstAiderSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderFirstAiderSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			flg_first_aider = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderFirstAiderSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderFirstAiderSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderFirstAiderSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderFirstAiderSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderFirstAiderSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			name_desc = @name_desc
AND			flg_delete = 0
AND			flg_first_aider = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderFirstAiderSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderFirstAiderSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderHazardDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_hazards SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderHazardInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@hazard_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_hazards(dept_id,co_id,order_seq,hazard_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@hazard_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,hazard_desc
FROM un_co_dept_ord_hazards
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderHazardSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,hazard_desc
FROM        un_co_dept_ord_hazards
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderHazardSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@hazard_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,hazard_desc
FROM        un_co_dept_ord_hazards
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			hazard_desc = @hazard_desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderHazardUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardUpdate]
(
	@hazard_desc varchar(255),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_hazards SET hazard_desc = @hazard_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,hazard_desc
FROM un_co_dept_ord_hazards
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderInsertCommand
(
	@flg_delete bit,
	@dept_id int,
	@co_id int,
	@order_ref varchar(32),
	@order_client_ref varchar(32),
	@order_sms varchar(32),
	@date_order_created datetime,
	@order_est_of_works int,
	@date_order_review datetime,
	@flg_order_doc_to_client bit,
	@address_no varchar(32),
	@address_line1 varchar(128),
	@address_line2 varchar(128),
	@address_line3 varchar(128),
	@address_line4 varchar(128),
	@address_line5 varchar(128),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@order_desc varchar(1000),
	@flg_multi_emer_exits bit,
	@flg_multi_assem_points bit,
	@flg_cancelled bit,
	@date_cancelled datetime,
	@created_by int,
	@date_created datetime,
	@last_amended_by int,
	@date_last_amended datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_ords] ([flg_delete], [dept_id], [co_id], [order_ref], [order_client_ref], [order_sms], [date_order_created], [order_est_of_works], [date_order_review], [flg_order_doc_to_client], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [order_desc], [flg_multi_emer_exits], [flg_multi_assem_points], [flg_cancelled], [date_cancelled], [created_by], [date_created], [last_amended_by], [date_last_amended]) VALUES (@flg_delete, @dept_id, @co_id, @order_ref, @order_client_ref, @order_sms, @date_order_created, @order_est_of_works, @date_order_review, @flg_order_doc_to_client, @address_no, @address_line1, @address_line2, @address_line3, @address_line4, @address_line5, @address_post_code, @address_full, @order_desc, @flg_multi_emer_exits, @flg_multi_assem_points, @flg_cancelled, @date_cancelled, @created_by, @date_created, @last_amended_by, @date_last_amended);
	
SELECT sequence, flg_delete, dept_id, co_id, order_ref, order_client_ref, order_sms, date_order_created, order_est_of_works, date_order_review, flg_order_doc_to_client, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, order_desc, flg_multi_emer_exits, flg_multi_assem_points, flg_cancelled, date_cancelled, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_ords WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderKeyAspectsDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderKeyAspectsDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderKeyAspectsDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_key_aspects SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderKeyAspectsDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderKeyAspectsDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderKeyAspectsInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderKeyAspectsInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderKeyAspectsInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@key_aspect_header varchar(128),
	@key_aspect_desc varchar(1000),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_key_aspects(dept_id,co_id,order_seq,key_aspect_header,key_aspect_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@key_aspect_header,@key_aspect_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,key_aspect_header,key_aspect_desc
FROM un_co_dept_ord_key_aspects
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderKeyAspectsInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderKeyAspectsInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderKeyAspectsSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderKeyAspectsSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderKeyAspectsSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,key_aspect_header,key_aspect_desc
FROM        un_co_dept_ord_key_aspects
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderKeyAspectsSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderKeyAspectsSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderKeyAspectsSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderKeyAspectsSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderKeyAspectsSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@key_aspect_header varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,key_aspect_header,key_aspect_desc
FROM        un_co_dept_ord_key_aspects
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			key_aspect_header = @key_aspect_header')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderKeyAspectsSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderKeyAspectsSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderKeyAspectsUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderKeyAspectsUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderKeyAspectsUpdate]
(
	@key_aspect_header varchar(128),
	@key_aspect_desc varchar(1000),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_key_aspects SET key_aspect_header = @key_aspect_header,key_aspect_desc = @key_aspect_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,key_aspect_header,key_aspect_desc
FROM un_co_dept_ord_key_aspects
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderKeyAspectsUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderKeyAspectsUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogDelete]
(
	@Original_log_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ord_log] SET flg_delete = 1 WHERE (([log_id] = @Original_log_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogInsert]
(
	@order_id int,
	@co_id int,
	@dept_id int,
	@created_by int,
	@creation_time datetime,
	@file_path varchar(250),
	@flg_delete bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_ord_log] ([order_id], [co_id], [dept_id], [created_by], [creation_time], [file_path], [flg_delete]) VALUES (@order_id, @co_id, @dept_id, @created_by, @creation_time, @file_path, @flg_delete);
	
SELECT log_id, order_id, co_id, dept_id, created_by, creation_time, file_path, flg_delete FROM un_co_dept_ord_log WHERE (log_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderLogSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_log.*
FROM            un_co_dept_ord_log')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogSelectByOrderId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogSelectByOrderId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogSelectByOrderId]
	@co_id int,
	@dept_id int,
	@order_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_log.*
FROM            un_co_dept_ord_log
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_id = @order_id
AND			flg_delete = 0
ORDER BY creation_time desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogSelectByOrderId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogSelectByOrderId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogUpdate]
(
	@order_id int,
	@co_id int,
	@dept_id int,
	@created_by int,
	@creation_time datetime,
	@file_path varchar(250),
	@flg_delete bit,
	@Original_log_id int,
	@log_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ord_log] SET [order_id] = @order_id, [co_id] = @co_id, [dept_id] = @dept_id, [created_by] = @created_by, [creation_time] = @creation_time, [file_path] = @file_path, [flg_delete] = @flg_delete WHERE (([log_id] = @Original_log_id));
	
SELECT log_id, order_id, co_id, dept_id, created_by, creation_time, file_path, flg_delete FROM un_co_dept_ord_log WHERE (log_id = @log_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderOperativeInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderOperativeInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderOperativeInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_people(dept_id,co_id,order_seq,name_desc,flg_engaged,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@name_desc,1,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,name_desc
FROM un_co_dept_ord_people
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderOperativeInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderOperativeInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderOperativeSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderOperativeSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderOperativeSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			flg_engaged = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderOperativeSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderOperativeSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderOperativeSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderOperativeSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderOperativeSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			name_desc = @name_desc
AND			flg_delete = 0
AND			flg_engaged = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderOperativeSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderOperativeSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPeopleSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPeopleSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPeopleSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@sequence int
)
AS
	SET NOCOUNT ON;
SELECT      *
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			name_desc = @name_desc
AND			flg_delete = 0
AND			(@sequence IS NULL OR @sequence = 0 OR sequence <> @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPeopleSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPeopleSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_people SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@user_id int,
	@flg_supervisor bit,
	@flg_first_aider bit,
	@flg_fire_warden bit,
	@flg_engaged bit
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_people(dept_id,co_id,order_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,flg_supervisor,flg_first_aider,flg_fire_warden,flg_engaged)
VALUES (@dept_id,@co_id,@order_seq,@name_desc,@user_id,GETDATE(),@user_id,GETDATE(),@flg_supervisor,@flg_first_aider,@flg_fire_warden,@flg_engaged);

SELECT *
FROM un_co_dept_ord_people
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonSelect]
(
	@dept_id int,
	@co_id	int
)
AS
	SET NOCOUNT ON;
SELECT     sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended, flg_fire_warden, flg_first_aider, flg_supervisor, 0 as superrvisor_check, 0 as firstaiderr_check, 0 as firewardenn_check, 0 as engagedd_check  
FROM       dbo.un_ref_co_dept_people
WHERE		co_id = @co_id
AND		    dept_id = @dept_id
AND			flg_deleted = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonSelectCommandForEdit Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonSelectCommandForEdit Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonSelectCommandForEdit]
@dept_id int,
@co_id int,
@order_seq int 
AS
BEGIN
SELECT A.*,B.flg_supervisor as superrvisor_check, B.flg_first_aider as firstaiderr_check, B.flg_fire_warden as firewardenn_check FROM
(SELECT *
  FROM dbo.un_ref_co_dept_people
where un_ref_co_dept_people.co_id = @co_id
and un_ref_co_dept_people.dept_id = @dept_id
and un_ref_co_dept_people.flg_deleted = 0) A 
LEFT OUTER JOIN 
(SELECT *
 FROM un_co_dept_ord_people
where un_co_dept_ord_people.co_id = @co_id
and un_co_dept_ord_people.dept_id = @dept_id 
and un_co_dept_ord_people.order_seq = @order_seq
and un_co_dept_ord_people.flg_delete = 0) B
ON A.name_desc = B.name_desc
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonSelectCommandForEdit Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonSelectCommandForEdit Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonUpdate]
(
	@name_desc varchar(255),
	@user_id int,
	@sequence int,
	@flg_supervisor bit,
	@flg_fire_warden bit,
	@flg_engaged bit,
	@flg_first_aider bit,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_people SET name_desc = @name_desc,flg_supervisor = @flg_supervisor,flg_fire_warden = @flg_fire_warden,
	flg_engaged = @flg_engaged,flg_first_aider = @flg_first_aider,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT *
FROM un_co_dept_ord_people
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPPEDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPPEDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPPEDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_ppe SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPPEDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPPEDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPPEInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPPEInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPPEInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@ppe_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_ppe(dept_id,co_id,order_seq,ppe_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@ppe_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,ppe_desc
FROM un_co_dept_ord_ppe
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPPEInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPPEInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPPESelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPPESelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPPESelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,ppe_desc
FROM        un_co_dept_ord_ppe
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPPESelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPPESelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPPESelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPPESelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPPESelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@ppe_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,ppe_desc
FROM        un_co_dept_ord_ppe
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			ppe_desc = @ppe_desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPPESelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPPESelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPPEUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPPEUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPPEUpdate]
(
	@ppe_desc varchar(255),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_ppe SET ppe_desc = @ppe_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,ppe_desc
FROM un_co_dept_ord_ppe
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPPEUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPPEUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderRequirementsDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderRequirementsDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderRequirementsDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_client_req SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderRequirementsDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderRequirementsDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderRequirementsInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderRequirementsInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderRequirementsInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@requirement_header varchar(128),
	@requirement_desc varchar(1000),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_client_req(dept_id,co_id,order_seq,requirement_header,requirement_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@requirement_header,@requirement_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,requirement_header,requirement_desc
FROM un_co_dept_ord_client_req
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderRequirementsInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderRequirementsInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderRequirementsSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderRequirementsSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderRequirementsSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,requirement_header,requirement_desc
FROM        un_co_dept_ord_client_req
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderRequirementsSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderRequirementsSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderRequirementsSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderRequirementsSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderRequirementsSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@requirement_header varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,requirement_header,requirement_desc
FROM        un_co_dept_ord_client_req
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			requirement_header = @requirement_header')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderRequirementsSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderRequirementsSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderRequirementsUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderRequirementsUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderRequirementsUpdate]
(
	@requirement_header varchar(128),
	@requirement_desc varchar(1000),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_client_req SET requirement_header = @requirement_header,requirement_desc = @requirement_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,requirement_header,requirement_desc
FROM un_co_dept_ord_client_req
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderRequirementsUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderRequirementsUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSearchCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSearchCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSearchCommand] 
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
	un_co_dept_ords.date_order_review
from [un_co_dept_ords]
inner join [un_co_dept_details]  on un_co_dept_ords.dept_id = un_co_dept_details.dept_id
where un_co_dept_ords.dept_id =@dept_id
and (@site_add IS null  or un_co_dept_ords.address_full = @site_add)
and (@ord_ref IS null  or un_co_dept_ords.order_ref = @ord_ref)
and (@client_ref IS null  or un_co_dept_ords.order_client_ref = @client_ref)
and (@from_date IS null  or un_co_dept_ords.date_created >= convert(datetime,@from_date,103))
and (@to_date IS null  or un_co_dept_ords.date_created <= dateadd(d,1,convert(datetime,@to_date,103)))
and (@postal_code IS null or un_co_dept_ords.address_post_code = @postal_code)
and un_co_dept_ords.flg_delete = 0
and un_co_dept_ords.flg_cancelled = 0
order by date_order_created desc 
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSearchCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSearchCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSelectById Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSelectById]
(
	@sequence int
)
AS
	SET NOCOUNT ON;
SELECT      un_co_dept_ords.*
FROM        un_co_dept_ords
WHERE		un_co_dept_ords.sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSelectById Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ords.*
FROM            un_co_dept_ords')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSigHazardDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSigHazardDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSigHazardDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_hazards_sig SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSigHazardDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSigHazardDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSigHazardInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSigHazardInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSigHazardInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@hazard_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_hazards_sig(dept_id,co_id,order_seq,hazard_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@hazard_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,hazard_desc
FROM un_co_dept_ord_hazards_sig
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSigHazardInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSigHazardInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSigHazardSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSigHazardSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSigHazardSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,hazard_desc
FROM        un_co_dept_ord_hazards_sig
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSigHazardSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSigHazardSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSigHazardSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSigHazardSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSigHazardSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@hazard_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,hazard_desc
FROM        un_co_dept_ord_hazards_sig
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			hazard_desc = @hazard_desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSigHazardSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSigHazardSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSigHazardUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSigHazardUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSigHazardUpdate]
(
	@hazard_desc varchar(255),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_hazards_sig SET hazard_desc = @hazard_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,hazard_desc
FROM un_co_dept_ord_hazards_sig
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSigHazardUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSigHazardUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSupervisorInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSupervisorInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSupervisorInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_people(dept_id,co_id,order_seq,name_desc,flg_supervisor,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@name_desc,1,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,name_desc
FROM un_co_dept_ord_people
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSupervisorInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSupervisorInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSupervisorSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSupervisorSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSupervisorSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			flg_supervisor = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSupervisorSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSupervisorSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderSupervisorSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderSupervisorSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderSupervisorSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,name_desc
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			name_desc = @name_desc
AND			flg_delete = 0
AND			flg_supervisor = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSupervisorSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderSupervisorSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderToolDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderToolDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderToolDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_tools SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderToolDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderToolDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderToolInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderToolInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderToolInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@tool_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_tools(dept_id,co_id,order_seq,tool_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@tool_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,tool_desc
FROM un_co_dept_ord_tools
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderToolInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderToolInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderToolSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderToolSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderToolSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,tool_desc
FROM        un_co_dept_ord_tools
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderToolSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderToolSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderToolSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderToolSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderToolSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@tool_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,tool_desc
FROM        un_co_dept_ord_tools
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			tool_desc = @tool_desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderToolSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderToolSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderToolUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderToolUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderToolUpdate]
(
	@tool_desc varchar(255),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_tools SET tool_desc = @tool_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,tool_desc
FROM un_co_dept_ord_tools
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderToolUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderToolUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderUpdateCommand]
(
	@flg_delete bit,
	@dept_id int,
	@co_id int,
	@order_ref varchar(32),
	@order_client_ref varchar(32),
	@order_sms varchar(32),
	@date_order_created datetime,
	@order_est_of_works int,
	@est_num_of_operatives int,
	@date_order_review datetime,
	@flg_order_doc_to_client bit,
	@address_no varchar(32),
	@address_line1 varchar(128),
	@address_line2 varchar(128),
	@address_line3 varchar(128),
	@address_line4 varchar(128),
	@address_line5 varchar(128),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@order_desc varchar(1000),
	@desc_of_work varchar(1000),
	@flg_multi_emer_exits bit,
	@flg_multi_assem_points bit,
	@flg_cancelled bit,
	@date_cancelled datetime,
	@last_amended_by int,
	@date_last_amended datetime,
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] SET [flg_delete] = @flg_delete,[est_num_of_operatives]=@est_num_of_operatives, [dept_id] = @dept_id, [co_id] = @co_id, [order_ref] = @order_ref, [order_client_ref] = @order_client_ref, [order_sms] = @order_sms, [date_order_created] = @date_order_created, [order_est_of_works] = @order_est_of_works, [date_order_review] = @date_order_review, [flg_order_doc_to_client] = @flg_order_doc_to_client, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [order_desc] = @order_desc,[desc_of_work] = @desc_of_work,[flg_multi_emer_exits] = @flg_multi_emer_exits, [flg_multi_assem_points] = @flg_multi_assem_points, [flg_cancelled] = @flg_cancelled, [date_cancelled] = @date_cancelled, [last_amended_by] = @last_amended_by, [date_last_amended] = @date_last_amended WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_delete, dept_id, co_id, order_ref, order_client_ref, order_sms, date_order_created, order_est_of_works, date_order_review, flg_order_doc_to_client, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, order_desc, flg_multi_emer_exits, flg_multi_assem_points, flg_cancelled, date_cancelled, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_ords WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderUpdateDetails Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderUpdateDetails Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderUpdateDetails]
(
	@flg_order_doc_to_client bit,
	@date_sent_to_client datetime,
	@flg_asbestos_register bit,
	@flg_health_safety_closed bit,
	@date_closed datetime,
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] 
SET  [flg_order_doc_to_client] = @flg_order_doc_to_client, 
	 [date_sent_to_client] = @date_sent_to_client, 
	 [flg_asbestos_register] = @flg_asbestos_register,
	 [flg_health_safety_closed] = @flg_health_safety_closed,
	 [date_closed] = @date_closed,
	 [last_amended_by] = @user_id,
	 [date_last_amended] = GETDATE()
 WHERE (([sequence] = @sequence));
	
SELECT * FROM un_co_dept_ords WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderUpdateDetails Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderUpdateDetails Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderUpdateMultiAssemblePoints Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderUpdateMultiAssemblePoints Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderUpdateMultiAssemblePoints]
(
	@flg_multi_assem_points bit,
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] SET  [flg_multi_assem_points] = @flg_multi_assem_points, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @sequence));
	
SELECT sequence, flg_delete, dept_id, co_id, order_ref, order_client_ref, order_sms, date_order_created, order_est_of_works, date_order_review, flg_order_doc_to_client, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, order_desc, flg_multi_emer_exits, flg_multi_assem_points, flg_cancelled, date_cancelled, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_ords WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderUpdateMultiAssemblePoints Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderUpdateMultiAssemblePoints Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderUpdateMultiEmergencyExits Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderUpdateMultiEmergencyExits Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderUpdateMultiEmergencyExits]
(
	@flg_multi_emer_exits bit,
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] SET  [flg_multi_emer_exits] = @flg_multi_emer_exits, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @sequence));
	
SELECT sequence, flg_delete, dept_id, co_id, order_ref, order_client_ref, order_sms, date_order_created, order_est_of_works, date_order_review, flg_order_doc_to_client, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, order_desc, flg_multi_emer_exits, flg_multi_assem_points, flg_cancelled, date_cancelled, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_ords WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderUpdateMultiEmergencyExits Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderUpdateMultiEmergencyExits Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderWorkDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderWorkDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderWorkDelete]
(
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_seq_of_works SET flg_delete=1,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderWorkDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderWorkDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderWorkInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderWorkInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderWorkInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@work_desc varchar(255),
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_seq_of_works(dept_id,co_id,order_seq,work_desc,flg_delete,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@work_desc,0,@user_id,GETDATE(),@user_id,GETDATE());

SELECT sequence,work_desc
FROM un_co_dept_ord_seq_of_works
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderWorkInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderWorkInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderWorkSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderWorkSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderWorkSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,work_desc
FROM        un_co_dept_ord_seq_of_works
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderWorkSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderWorkSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderWorkSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderWorkSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderWorkSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@work_desc varchar(255)
)
AS
	SET NOCOUNT ON;
SELECT      sequence,work_desc
FROM        un_co_dept_ord_seq_of_works
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0
AND			work_desc = @work_desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderWorkSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderWorkSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderWorkUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderWorkUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderWorkUpdate]
(
	@work_desc varchar(255),
	@user_id int,
	@sequence int,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_seq_of_works SET work_desc = @work_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,work_desc
FROM un_co_dept_ord_seq_of_works
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderWorkUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderWorkUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPeopleInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
	@user_id int,
	@flg_supervisor bit,
	@flg_first_aider bit,
	@flg_fire_warden bit
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_people];
INSERT INTO [un_ref_co_dept_people] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_ammended_by], [date_last_amended], [flg_supervisor], [flg_first_aider], [flg_fire_warden]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE(),@flg_supervisor,@flg_first_aider,@flg_fire_warden);
	
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
-- Script To Create dbo.DepartmentPeopleRemainingSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      *
FROM        un_ref_co_dept_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			flg_deleted = 0
AND name_desc NOT IN
(
	SELECT name_desc 
	  FROM un_co_dept_ord_people
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleRemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleRemainingSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleSelectByCoId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPeopleSelectByDeptId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
SELECT      sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended, flg_supervisor, flg_first_aider, flg_fire_warden
FROM        un_ref_co_dept_people
WHERE		un_ref_co_dept_people.co_id = @co_id
AND			un_ref_co_dept_people.dept_id = @dept_id
AND			un_ref_co_dept_people.flg_deleted = 0
ORDER BY	un_ref_co_dept_people.index_seq desc')
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
-- Script To Create dbo.DepartmentPeopleSelectById Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPeopleSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
	@name varchar(255),
	@original_sequence int
AS
	SET NOCOUNT ON;

SELECT      *
FROM        un_ref_co_dept_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			name_desc = @name
AND			(@original_sequence = 0 OR sequence <> @original_sequence)
AND			flg_deleted = 0
ORDER BY	index_seq')
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
-- Script To Create dbo.DepartmentPeopleSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPeopleUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
	@sequence int,
	@flg_supervisor bit,
	@flg_first_aider bit,
	@flg_fire_warden bit
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_people] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_ammended_by] = @user_id, [date_last_amended] = GETDATE(),[flg_supervisor] = @flg_supervisor,[flg_first_aider] = @flg_first_aider,[flg_fire_warden]= @flg_fire_warden WHERE (([sequence] = @Original_sequence));
	
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
-- Script To Create dbo.DepartmentPPEDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPPEInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPPERemainingSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPERemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE  PROCEDURE [dbo].[DepartmentPPERemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*
FROM        un_ref_co_dept_ppe
WHERE		un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.dept_id = @dept_id
AND			un_ref_co_dept_ppe.flg_deleted = 0
AND name_desc NOT IN
(
	SELECT ppe_desc 
	  FROM un_co_dept_ord_ppe
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	un_ref_co_dept_ppe.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPERemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPERemainingSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPESelectByCoId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPPESelectByDeptId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPPESelectById Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPPESelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
	@name varchar(255),
	@original_sequence int
AS
	SET NOCOUNT ON;

SELECT      *
FROM        un_ref_co_dept_ppe
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			name_desc = @name
AND			(@original_sequence = 0 OR sequence <> @original_sequence)
AND			flg_deleted = 0
ORDER BY	index_seq')
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
-- Script To Create dbo.DepartmentPPESelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentPPEUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentSelectByCompanyId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentSelectShortNameRows Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentToolDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentToolInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentToolRemainingSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*
FROM        un_ref_co_dept_tools
WHERE		un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.dept_id = @dept_id
AND			un_ref_co_dept_tools.flg_deleted = 0
AND name_desc NOT IN
(
	SELECT tool_desc 
	  FROM un_co_dept_ord_tools
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	un_ref_co_dept_tools.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolRemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolRemainingSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolSelectByCoId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentToolSelectByDeptId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentToolSelectById Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentToolSelectByName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
	@name varchar(255),
	@original_sequence int
AS
	SET NOCOUNT ON;

SELECT      *
FROM        un_ref_co_dept_tools
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			name_desc = @name
AND			(@original_sequence = 0 OR sequence <> @original_sequence)
AND			flg_deleted = 0
ORDER BY	index_seq')
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
-- Script To Create dbo.DepartmentToolSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentToolUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DepartmentUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.DocItemDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemDeleteCommand
(
	@Original_item_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_items] WHERE (([item_id] = @Original_item_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemInsertCommand
(
	@co_id int,
	@dept_id int,
	@section_id int,
	@doc_id int,
	@item_type tinyint,
	@item_name varchar(255),
	@item_desc varchar(255),
	@item_index tinyint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_items] ([co_id], [dept_id], [section_id], [doc_id], [item_type], [item_name], [item_desc], [item_index]) VALUES (@co_id, @dept_id, @section_id, @doc_id, @item_type, @item_name, @item_desc, @item_index);
	
SELECT item_id, co_id, dept_id, section_id, doc_id, item_type, item_name, item_desc, item_index FROM un_co_dept_template_items WHERE (item_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_items.*
FROM            un_co_dept_template_items')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemUpdateCommand
(
	@co_id int,
	@dept_id int,
	@section_id int,
	@doc_id int,
	@item_type tinyint,
	@item_name varchar(255),
	@item_desc varchar(255),
	@item_index tinyint,
	@Original_item_id int,
	@item_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_items] SET [co_id] = @co_id, [dept_id] = @dept_id, [section_id] = @section_id, [doc_id] = @doc_id, [item_type] = @item_type, [item_name] = @item_name, [item_desc] = @item_desc, [item_index] = @item_index WHERE (([item_id] = @Original_item_id));
	
SELECT item_id, co_id, dept_id, section_id, doc_id, item_type, item_name, item_desc, item_index FROM un_co_dept_template_items WHERE (item_id = @item_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionDeleteCommand
(
	@Original_section_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_sections] WHERE (([section_id] = @Original_section_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionInsertCommand
(
	@flg_delete bit,
	@co_id int,
	@dept_id int,
	@section_index int,
	@section_desc varchar(255)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_sections] ([flg_delete], [co_id], [dept_id], [section_index], [section_desc]) VALUES (@flg_delete, @co_id, @dept_id, @section_index, @section_desc);
	
SELECT section_id, flg_delete, co_id, dept_id, section_index, section_desc FROM un_co_dept_template_sections WHERE (section_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_sections.*
FROM            un_co_dept_template_sections')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionUpdateCommand
(
	@flg_delete bit,
	@co_id int,
	@dept_id int,
	@section_index int,
	@section_desc varchar(255),
	@Original_section_id int,
	@section_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_sections] SET [flg_delete] = @flg_delete, [co_id] = @co_id, [dept_id] = @dept_id, [section_index] = @section_index, [section_desc] = @section_desc WHERE (([section_id] = @Original_section_id));
	
SELECT section_id, flg_delete, co_id, dept_id, section_index, section_desc FROM un_co_dept_template_sections WHERE (section_id = @section_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DocumentDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentDelete
(
	@Original_doc_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_docs] WHERE (([doc_id] = @Original_doc_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentDelete Procedure'
END
GO

--
-- Script To Create dbo.DocumentInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentInsert
(
	@co_id int,
	@dept_id int,
	@doc_type_id int,
	@doc_name varchar(255),
	@doc_desc varchar(255),
	@doc_code varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_docs] ([co_id], [dept_id], [doc_type_id], [doc_name], [doc_desc], [doc_code]) VALUES (@co_id, @dept_id, @doc_type_id, @doc_name, @doc_desc, @doc_code);
	
SELECT doc_id, co_id, dept_id, doc_type_id, doc_name, doc_desc, doc_code FROM un_co_dept_template_docs WHERE (doc_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentInsert Procedure'
END
GO

--
-- Script To Create dbo.DocumentItemSelectByDocId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentItemSelectByDocId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentItemSelectByDocId]
	@dept_id int,
	@co_id int,
	@doc_id int
AS
SET NOCOUNT ON;

SELECT item_id,section_desc,item_type,item_name 
  FROM dbo.un_co_dept_template_items
INNER JOIN dbo.un_co_dept_template_sections ON dbo.un_co_dept_template_sections.section_id = dbo.un_co_dept_template_items.section_id
WHERE dbo.un_co_dept_template_items.co_id = @co_id
AND dbo.un_co_dept_template_items.dept_id = @dept_id
AND dbo.un_co_dept_template_items.doc_id = @doc_id
ORDER BY section_index,item_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentItemSelectByDocId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentItemSelectByDocId Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*
FROM            un_co_dept_template_docs')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelect Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelectById Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentSelectById]
	@doc_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*
FROM            un_co_dept_template_docs
WHERE		doc_id = @doc_id
AND		flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelectById Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelectByTypeId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelectByTypeId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentSelectByTypeId]
	@co_id int,
	@dept_id int,
	@doc_type_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*
FROM            un_co_dept_template_docs
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			doc_type_id = @doc_type_id
AND		flg_delete = 0
ORDER BY doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectByTypeId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelectByTypeId Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelectRemainingByTypeName Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelectRemainingByTypeName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentSelectRemainingByTypeName]
	@co_id int,
	@dept_id int,
	@doc_type_desc varchar(255),
	@order_id int
AS
	SET NOCOUNT ON;
SELECT      un_co_dept_template_docs.*
FROM        un_co_dept_template_docs
INNER JOIN un_co_dept_doc_type ON un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_docs.doc_type_id
WHERE		un_co_dept_template_docs.co_id = @co_id
AND			un_co_dept_template_docs.dept_id = @dept_id
AND			doc_data_type_desc = @doc_type_desc
AND			un_co_dept_template_docs.flg_delete = 0
AND			doc_id NOT IN (
	SELECT doc_id 
	  FROM un_co_dept_ord_docs 
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_id = @order_id
       AND flg_delete =0
)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectRemainingByTypeName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelectRemainingByTypeName Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeDelete Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentTypeDelete
(
	@Original_doc_data_type_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_doc_type] WHERE (([doc_data_type_id] = @Original_doc_data_type_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeDelete Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeInsert Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentTypeInsert
(
	@doc_data_type_id int,
	@doc_data_type_desc varchar(255),
	@flg_delete bit,
	@co_id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_doc_type] ([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id]) VALUES (@doc_data_type_id, @doc_data_type_desc, @flg_delete, @co_id);
	
SELECT doc_data_type_id, doc_data_type_desc, flg_delete, co_id, dept_id FROM un_co_dept_doc_type WHERE (doc_data_type_id = @doc_data_type_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeInsert Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeSelect Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentTypeSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_doc_type.*
FROM            un_co_dept_doc_type')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeSelect Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeSelectByDeptId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentTypeSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_doc_type.*
FROM            un_co_dept_doc_type
WHERE		dept_id = @dept_id
AND		co_id = @co_id
and flg_delete = 0
ORDER BY sort_order')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeSelectByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeSelectByDeptId Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentTypeUpdate]
(
	@doc_data_type_id int,
	@doc_data_type_desc varchar(255),
	@flg_delete bit,
	@co_id int,
	@Original_doc_data_type_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_doc_type] SET [doc_data_type_desc] = @doc_data_type_desc, [flg_delete] = @flg_delete, [co_id] = @co_id WHERE (([doc_data_type_id] = @Original_doc_data_type_id));
	
SELECT doc_data_type_id, doc_data_type_desc, flg_delete, co_id, dept_id FROM un_co_dept_doc_type WHERE (doc_data_type_id = @doc_data_type_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeUpdate Procedure'
END
GO

--
-- Script To Create dbo.DocumentUpdate Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentUpdate
(
	@co_id int,
	@dept_id int,
	@doc_type_id int,
	@doc_name varchar(255),
	@doc_desc varchar(255),
	@doc_code varchar(50),
	@Original_doc_id int,
	@doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_docs] SET [co_id] = @co_id, [dept_id] = @dept_id, [doc_type_id] = @doc_type_id, [doc_name] = @doc_name, [doc_desc] = @doc_desc, [doc_code] = @doc_code WHERE (([doc_id] = @Original_doc_id));
	
SELECT doc_id, co_id, dept_id, doc_type_id, doc_name, doc_desc, doc_code FROM un_co_dept_template_docs WHERE (doc_id = @doc_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentUpdate Procedure'
END
GO

--
-- Script To Create dbo.GetDepartmentsByDeptId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.GetShortNameCountByDeptId Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.UserDeleteCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.UserInsertCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.UserLogin Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.UserSelectCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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
-- Script To Create dbo.UserUpdateCommand Procedure In localhost\SQLEXPRESS.Blank
-- Generated Sunday, August 16, 2009, at 05:45 PM
--
-- Please backup localhost\SQLEXPRESS.Blank before executing this script
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