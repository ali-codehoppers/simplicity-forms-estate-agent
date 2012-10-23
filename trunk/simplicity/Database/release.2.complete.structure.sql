--
-- Script To Create dbo.un_co_dept_ord_assem_pt Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_client_req Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_ctrl_meas Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_emer_exits Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_hazards Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_hazards_sig Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_key_aspects Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_people Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_ppe Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_seq_of_works Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ord_tools Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.un_co_dept_ords Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
   [date_order_review] [datetime] NULL,
   [flg_order_doc_to_client] [bit] NULL CONSTRAINT [DF_un_co_dept_ords_flg_order_doc_to_client] DEFAULT ((0)),
   [address_no] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line1] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line2] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line3] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line4] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_line5] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_post_code] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [address_full] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [order_desc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
-- Script To Update dbo.DepartmentHazardSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardSelectByName]
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
   PRINT 'dbo.DepartmentHazardSelectByName Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderAssemblePtsDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderAssemblePtsInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderAssemblePtsSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderAssemblePtsSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderAssemblePtsUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderCtrlMeasureDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderCtrlMeasureInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderCtrlMeasureSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderCtrlMeasureSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderCtrlMeasureUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderEmergencyExitsDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderEmergencyExitsInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderEmergencyExitsSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderEmergencyExitsSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderEmergencyExitsUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderFireWardenInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderFireWardenSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderFireWardenSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderFirstAiderInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderFirstAiderSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderFirstAiderSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderHazardDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderHazardInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderHazardSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderHazardSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderHazardUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderKeyAspectsDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderKeyAspectsInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderKeyAspectsSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderKeyAspectsSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderKeyAspectsUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderOperativeInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderOperativeSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderOperativeSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderPersonDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderPersonUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_people SET name_desc = @name_desc,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT sequence,name_desc
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
-- Script To Create dbo.DepartmentOrderPPEDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderPPEInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderPPESelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderPPESelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderPPEUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderRequirementsDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderRequirementsInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderRequirementsSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderRequirementsSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderRequirementsUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSearchCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
@from_date varchar(50),
@to_date varchar(50),
@postal_code varchar(9)
AS
BEGIN
Select un_co_dept_ords.sequence,un_co_dept_details.co_name_short as department,un_co_dept_ords.order_ref,un_co_dept_ords.order_sms,
	un_co_dept_ords.order_client_ref,un_co_dept_ords.date_order_created,un_co_dept_ords.address_post_code,
	un_co_dept_ords.date_order_review
from [un_co_dept_ords]
inner join [un_co_dept_details]  on un_co_dept_ords.dept_id = un_co_dept_details.dept_id
where un_co_dept_ords.dept_id =@dept_id
and (@site_add IS null  or un_co_dept_ords.address_full = @site_add)
and (@ord_ref IS null  or un_co_dept_ords.order_ref = @ord_ref)
and (@client_ref IS null  or un_co_dept_ords.order_client_ref = @client_ref)
and (@from_date IS null  or un_co_dept_ords.date_created >= convert(datetime,@from_date,0))
and (@to_date IS null  or un_co_dept_ords.date_created <= convert(datetime,@to_date,0))
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
-- Script To Create dbo.DepartmentOrderSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSigHazardDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSigHazardInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSigHazardSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSigHazardSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSigHazardUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSupervisorInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSupervisorSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderSupervisorSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderToolDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderToolInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderToolSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderToolSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderToolUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
	@last_amended_by int,
	@date_last_amended datetime,
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] SET [flg_delete] = @flg_delete, [dept_id] = @dept_id, [co_id] = @co_id, [order_ref] = @order_ref, [order_client_ref] = @order_client_ref, [order_sms] = @order_sms, [date_order_created] = @date_order_created, [order_est_of_works] = @order_est_of_works, [date_order_review] = @date_order_review, [flg_order_doc_to_client] = @flg_order_doc_to_client, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [order_desc] = @order_desc, [flg_multi_emer_exits] = @flg_multi_emer_exits, [flg_multi_assem_points] = @flg_multi_assem_points, [flg_cancelled] = @flg_cancelled, [date_cancelled] = @date_cancelled, [last_amended_by] = @last_amended_by, [date_last_amended] = @date_last_amended WHERE (([sequence] = @Original_sequence));
	
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
-- Script To Create dbo.DepartmentOrderUpdateMultiAssemblePoints Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderUpdateMultiEmergencyExits Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderWorkDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderWorkInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderWorkSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderWorkSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderWorkUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Update dbo.DepartmentPeopleSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPeopleSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPeopleSelectByName]
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
   PRINT 'dbo.DepartmentPeopleSelectByName Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPeopleSelectByName Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPPESelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPPESelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPPESelectByName]
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
   PRINT 'dbo.DepartmentPPESelectByName Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPPESelectByName Procedure'
END
GO

--
-- Script To Update dbo.DepartmentToolSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, July 27, 2009, at 11:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentToolSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentToolSelectByName]
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
   PRINT 'dbo.DepartmentToolSelectByName Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentToolSelectByName Procedure'
END
GO