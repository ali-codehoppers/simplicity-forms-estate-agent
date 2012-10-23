--
-- Script To Update dbo.un_co_dept_ord_people Table In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_dept_ord_people Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_dept_ord_people_flg_delete')
      ALTER TABLE [dbo].[un_co_dept_ord_people] DROP CONSTRAINT [DF_un_co_dept_ord_people_flg_delete]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_dept_ord_people_flg_supervisor')
      ALTER TABLE [dbo].[un_co_dept_ord_people] DROP CONSTRAINT [DF_un_co_dept_ord_people_flg_supervisor]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_dept_ord_people_flg_engaged')
      ALTER TABLE [dbo].[un_co_dept_ord_people] DROP CONSTRAINT [DF_un_co_dept_ord_people_flg_engaged]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_dept_ord_people_flg_first_aider')
      ALTER TABLE [dbo].[un_co_dept_ord_people] DROP CONSTRAINT [DF_un_co_dept_ord_people_flg_first_aider]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_un_co_dept_ord_people] (
   [order_people_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_ord_people_flg_delete] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [order_seq] [int] NOT NULL,
   [people_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [people_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_un_co_dept_ord_people] ([flg_delete], [dept_id], [co_id], [order_seq], [people_name], [people_type])
   SELECT [flg_delete], [dept_id], [co_id], [order_seq], '', ''
   FROM [dbo].[un_co_dept_ord_people]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[un_co_dept_ord_people]
GO

sp_rename N'[dbo].[tmp_un_co_dept_ord_people]', N'un_co_dept_ord_people'

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ord_people] ADD CONSTRAINT [PK_un_co_dept_ord_people] PRIMARY KEY CLUSTERED ([order_people_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_people Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_dept_ord_people Table'
END
GO

--
-- Script To Create dbo.un_co_people_types Table In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_people_types Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_people_types] (
   [people_type_id] [int] IDENTITY (1, 1) NOT NULL,
   [co_id] [int] NOT NULL,
   [people_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_multiple] [bit] NOT NULL,
   [flg_delete] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_people_types] ADD CONSTRAINT [PK_un_co_people_types] PRIMARY KEY CLUSTERED ([people_type_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_people_types Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_people_types Table'
END
GO

--
-- Script To Update dbo.un_ref_co_dept_people Table In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_ref_co_dept_people Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_ref_co_dept_people_flg_deleted')
      ALTER TABLE [dbo].[un_ref_co_dept_people] DROP CONSTRAINT [DF_un_ref_co_dept_people_flg_deleted]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_ref_co_dept_people_flg_fire_warden')
      ALTER TABLE [dbo].[un_ref_co_dept_people] DROP CONSTRAINT [DF_un_ref_co_dept_people_flg_fire_warden]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_ref_co_dept_people_flg_first_aider')
      ALTER TABLE [dbo].[un_ref_co_dept_people] DROP CONSTRAINT [DF_un_ref_co_dept_people_flg_first_aider]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_ref_co_dept_people_flg_supervisor')
      ALTER TABLE [dbo].[un_ref_co_dept_people] DROP CONSTRAINT [DF_un_ref_co_dept_people_flg_supervisor]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_un_ref_co_dept_people] (
   [people_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_deleted] [bit] NOT NULL CONSTRAINT [DF_un_ref_co_dept_people_flg_deleted] DEFAULT ((0)),
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [index_seq] [int] NOT NULL,
   [people_type_id] [int] NOT NULL,
   [people_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_un_ref_co_dept_people] ([flg_deleted], [dept_id], [co_id], [index_seq], [people_type_id], [people_name])
   SELECT [flg_deleted], [dept_id], [co_id], [index_seq], 0, ''
   FROM [dbo].[un_ref_co_dept_people]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[un_ref_co_dept_people]
GO

sp_rename N'[dbo].[tmp_un_ref_co_dept_people]', N'un_ref_co_dept_people'

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people] ADD CONSTRAINT [PK_un_ref_co_dept_people] PRIMARY KEY CLUSTERED ([people_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_people Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_ref_co_dept_people Table'
END
GO

--
-- Script To Delete dbo.DepartmentOrderOperativeInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderOperativeInsert Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderOperativeInsert]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderOperativeInsert Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderOperativeInsert Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderOperativeSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderOperativeSelect Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderOperativeSelect]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderOperativeSelect Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderOperativeSelect Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderOperativeSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderOperativeSelectByName Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderOperativeSelectByName]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderOperativeSelectByName Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderOperativeSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPeopleDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPeopleDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPeopleDelete]
(
	@order_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_ord_people] WHERE (([order_seq] = @order_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPeopleDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPeopleDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPeopleInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPeopleInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderPeopleInsert
(
	@flg_delete bit,
	@dept_id int,
	@co_id int,
	@order_seq int,
	@people_name varchar(255),
	@people_type varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_ord_people] ([flg_delete], [dept_id], [co_id], [order_seq], [people_name], [people_type]) VALUES (@flg_delete, @dept_id, @co_id, @order_seq, @people_name, @people_type);
	
SELECT order_people_id, flg_delete, dept_id, co_id, order_seq, people_name, people_type FROM un_co_dept_ord_people WHERE (order_people_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPeopleInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPeopleInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPeopleSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPeopleSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPeopleSelect]
	@co_id int,
	@dept_id int,
	@order_id int	
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_people.*
FROM            un_co_dept_ord_people
WHERE			co_id = @co_id
AND				dept_id = @dept_id
AND				order_seq = @order_id
AND				flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPeopleSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPeopleSelect Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderPeopleSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderPeopleSelectByName Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderPeopleSelectByName]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPeopleSelectByName Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderPeopleSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPeopleUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPeopleUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderPeopleUpdate
(
	@flg_delete bit,
	@dept_id int,
	@co_id int,
	@order_seq int,
	@people_name varchar(255),
	@people_type varchar(50),
	@Original_order_people_id int,
	@order_people_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ord_people] SET [flg_delete] = @flg_delete, [dept_id] = @dept_id, [co_id] = @co_id, [order_seq] = @order_seq, [people_name] = @people_name, [people_type] = @people_type WHERE (([order_people_id] = @Original_order_people_id));
	
SELECT order_people_id, flg_delete, dept_id, co_id, order_seq, people_name, people_type FROM un_co_dept_ord_people WHERE (order_people_id = @order_people_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPeopleUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPeopleUpdate Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderPersonDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderPersonDelete Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderPersonDelete]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonDelete Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderPersonDelete Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderPersonInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderPersonInsert Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderPersonInsert]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonInsert Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderPersonInsert Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderPersonSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderPersonSelect Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderPersonSelect]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonSelect Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderPersonSelect Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderPersonSelectCommandForEdit Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderPersonSelectCommandForEdit Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderPersonSelectCommandForEdit]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonSelectCommandForEdit Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderPersonSelectCommandForEdit Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentOrderPersonUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentOrderPersonUpdate Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentOrderPersonUpdate]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonUpdate Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentOrderPersonUpdate Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleDeleteCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleDeleteCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleDeleteCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleDeleteCommand Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleInsertCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleInsertCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleInsertCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleInsertCommand Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleRemainingSelect Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleRemainingSelect]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleRemainingSelect Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleRemainingSelect Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleSelectByCoId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleSelectByCoId Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleSelectByCoId]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectByCoId Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleSelectByCoId Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleSelectByDeptId Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleSelectByDeptId]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectByDeptId Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleSelectByDeptId Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleSelectById Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleSelectById]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectById Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleSelectById Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleSelectByName Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleSelectByName]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectByName Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleSelectByName Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleSelectCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleSelectCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleSelectCommand Procedure'
END
GO

--
-- Script To Delete dbo.DepartmentPeopleUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DepartmentPeopleUpdateCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DepartmentPeopleUpdateCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleUpdateCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DepartmentPeopleUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DeptPeopleDeleteByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeptPeopleDeleteByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DeptPeopleDeleteByName]
(
	@co_id int,
	@dept_id int,
	@people_name varchar(255)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_ref_co_dept_people] WHERE co_id = @co_id and dept_id = @dept_id and people_name = @people_name')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeptPeopleDeleteByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeptPeopleDeleteByName Procedure'
END
GO

--
-- Script To Create dbo.DeptPeopleDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeptPeopleDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DeptPeopleDeleteCommand
(
	@Original_people_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_ref_co_dept_people] WHERE (([people_id] = @Original_people_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeptPeopleDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeptPeopleDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DeptPeopleInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeptPeopleInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DeptPeopleInsertCommand
(
	@flg_deleted bit,
	@dept_id int,
	@co_id int,
	@index_seq int,
	@people_type_id int,
	@people_name varchar(255)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_ref_co_dept_people] ([flg_deleted], [dept_id], [co_id], [index_seq], [people_type_id], [people_name]) VALUES (@flg_deleted, @dept_id, @co_id, @index_seq, @people_type_id, @people_name);
	
SELECT people_id, flg_deleted, dept_id, co_id, index_seq, people_type_id, people_name FROM un_ref_co_dept_people WHERE (people_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeptPeopleInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeptPeopleInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DeptPeopleSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeptPeopleSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DeptPeopleSelectByName]
	@co_id int,
	@dept_id int,
	@people_name varchar(255)
AS
	SET NOCOUNT ON;
SELECT        un_ref_co_dept_people.*
FROM            un_ref_co_dept_people
WHERE	co_id = @co_id
AND dept_id = @dept_id
AND people_name = @people_name
AND		flg_deleted = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeptPeopleSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeptPeopleSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DeptPeopleSelectByNameAndType Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeptPeopleSelectByNameAndType Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DeptPeopleSelectByName]
	@co_id int,
	@dept_id int,
	@people_name varchar(255),
	@people_type_id int,
	@people_id int
AS
	SET NOCOUNT ON;
SELECT        un_ref_co_dept_people.*
FROM            un_ref_co_dept_people
WHERE	co_id = @co_id
AND dept_id = @dept_id
AND people_name = @people_name
AND		people_type_id = @people_type_id
AND		(@people_id = 0 OR people_id <> @people_id)
AND		flg_deleted = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeptPeopleSelectByNameAndType Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeptPeopleSelectByNameAndType Procedure'
END
GO

--
-- Script To Create dbo.DeptPeopleSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeptPeopleSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DeptPeopleSelectCommand]
	@co_id int,
	@dept_id int
AS
	SET NOCOUNT ON;

DECLARE @columns VARCHAR(8000);
SELECT @columns = COALESCE(@columns + '',['' + people_type + '']'',
''['' + people_type + '']'')
FROM un_co_people_types
WHERE co_id = @co_id
AND flg_delete = 0;

DECLARE @casted_columns VARCHAR(8000);
SELECT @casted_columns = COALESCE(@casted_columns + '',cast(['' + people_type + ''] AS bit) as ['' + people_type +'']'',
''cast(['' + people_type + ''] as bit) as ['' + people_type +'']'')
FROM un_co_people_types
WHERE co_id = @co_id
AND flg_delete = 0;

DECLARE @query VARCHAR(8000)

SET @query = ''
select [Person Name],'' +  @casted_columns +
'' from (
	select people_name AS [Person Name],people_type 
      from un_ref_co_dept_people
    inner join un_co_people_types 
	ON un_co_people_types.people_type_id = un_ref_co_dept_people.people_type_id
	AND un_co_people_types.co_id = un_ref_co_dept_people.co_id
	WHERE un_co_people_types.co_id = '' + cast(@co_id as varchar)+ 
	'' AND dept_id = '' + cast(@dept_id as varchar)+ 
	'' AND un_co_people_types.flg_delete = 0
	AND un_ref_co_dept_people.flg_deleted = 0
) AS Q
PIVOT 
(
	count([people_type])
	FOR [people_type] IN ('' + @columns + '')
)
AS P'';

EXECUTE(@query);')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeptPeopleSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeptPeopleSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DeptPeopleUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeptPeopleUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DeptPeopleUpdateCommand
(
	@flg_deleted bit,
	@dept_id int,
	@co_id int,
	@index_seq int,
	@people_type_id int,
	@people_name varchar(255),
	@Original_people_id int,
	@people_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_people] SET [flg_deleted] = @flg_deleted, [dept_id] = @dept_id, [co_id] = @co_id, [index_seq] = @index_seq, [people_type_id] = @people_type_id, [people_name] = @people_name WHERE (([people_id] = @Original_people_id));
	
SELECT people_id, flg_deleted, dept_id, co_id, index_seq, people_type_id, people_name FROM un_ref_co_dept_people WHERE (people_id = @people_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeptPeopleUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeptPeopleUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.PeopleTypeDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.PeopleTypeDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[PeopleTypeDeleteCommand]
(
	@Original_people_type_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_people_types] SET flg_delete = 1 WHERE (([people_type_id] = @Original_people_type_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.PeopleTypeDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.PeopleTypeDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.PeopleTypeInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.PeopleTypeInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.PeopleTypeInsertCommand
(
	@co_id int,
	@people_type varchar(50),
	@flg_multiple bit,
	@flg_delete bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_people_types] ([co_id], [people_type], [flg_multiple], [flg_delete]) VALUES (@co_id, @people_type, @flg_multiple, @flg_delete);
	
SELECT people_type_id, co_id, people_type, flg_multiple, flg_delete FROM un_co_people_types WHERE (people_type_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.PeopleTypeInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.PeopleTypeInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.PeopleTypeSelectByCoId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.PeopleTypeSelectByCoId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[PeopleTypeSelectByCoId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_people_types.*
FROM            un_co_people_types
WHERE	co_id = @co_id
AND flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.PeopleTypeSelectByCoId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.PeopleTypeSelectByCoId Procedure'
END
GO

--
-- Script To Create dbo.PeopleTypeSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.PeopleTypeSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[PeopleTypeSelectByName]
	@co_id int,
	@name varchar(50),
	@people_type_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_people_types.*
FROM            un_co_people_types
WHERE	co_id = @co_id
and people_type = @name
and (@people_type_id = 0 OR people_type_id <> @people_type_id)
AND flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.PeopleTypeSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.PeopleTypeSelectByName Procedure'
END
GO

--
-- Script To Create dbo.PeopleTypeSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.PeopleTypeSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.PeopleTypeSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_people_types.*
FROM            un_co_people_types')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.PeopleTypeSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.PeopleTypeSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.PeopleTypeUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:58 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.PeopleTypeUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[PeopleTypeUpdateCommand]
(
	@people_type varchar(50),
	@flg_multiple bit,
	@Original_people_type_id int,
	@people_type_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_people_types] SET [people_type] = @people_type, [flg_multiple] = @flg_multiple WHERE (([people_type_id] = @Original_people_type_id));
	
SELECT people_type_id, co_id, people_type, flg_multiple, flg_delete FROM un_co_people_types WHERE (people_type_id = @people_type_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.PeopleTypeUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.PeopleTypeUpdateCommand Procedure'
END
GO