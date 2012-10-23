--
-- Script To Create dbo.un_co_dept_categories Table In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_categories Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_categories] (
   [category_id] [int] IDENTITY (1, 1) NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [category_name] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [category_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_categories] ADD CONSTRAINT [PK_un_co_dept_categories] PRIMARY KEY CLUSTERED ([category_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_categories Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_categories Table'
END
GO

--
-- Script To Update dbo.un_co_dept_template_docs Table In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
      ADD [category_id] [int] NULL
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
-- Script To Update dbo.un_ref_co_dept_hazards Table In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_ref_co_dept_hazards Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_hazards]
      ADD [category_id] [int] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_hazards Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_ref_co_dept_hazards Table'
END
GO

--
-- Script To Update dbo.un_ref_co_dept_ppe Table In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_ref_co_dept_ppe Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_ppe]
      ADD [category_id] [int] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_ppe Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_ref_co_dept_ppe Table'
END
GO

--
-- Script To Update dbo.un_ref_co_dept_tools Table In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_ref_co_dept_tools Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_tools]
      ADD [category_id] [int] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_tools Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_ref_co_dept_tools Table'
END
GO

--
-- Script To Create dbo.CategoryDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CategoryDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CategoryDelete]
(
	@Original_category_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_categories] SET flg_delete = 1 WHERE (([category_id] = @Original_category_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CategoryDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CategoryDelete Procedure'
END
GO

--
-- Script To Create dbo.CategoryInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CategoryInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CategoryInsert]
(
	@co_id int,
	@dept_id int,
	@category_name varchar(250),
	@category_type char(1)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_categories] ([co_id], [dept_id], [category_name], [category_type],[flg_delete]) VALUES (@co_id, @dept_id, @category_name, @category_type,0);
	
SELECT category_id, co_id, dept_id, category_name, category_type FROM un_co_dept_categories WHERE (category_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CategoryInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CategoryInsert Procedure'
END
GO

--
-- Script To Create dbo.CategorySelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CategorySelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.CategorySelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_categories.*
FROM            un_co_dept_categories')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CategorySelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CategorySelect Procedure'
END
GO

--
-- Script To Create dbo.CategorySelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CategorySelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CategorySelectByName]
	@dept_id int,
	@co_id int,
	@category_type char(1),
	@category_name varchar(250),
	@original_category_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_categories.*
FROM            un_co_dept_categories
WHERE	co_id = @co_id
AND		dept_id = @dept_id
AND		category_type = @category_type
AND		category_name = @category_name 
AND		category_id <> @original_category_id
AND		flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CategorySelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CategorySelectByName Procedure'
END
GO

--
-- Script To Create dbo.CategorySelectByType Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CategorySelectByType Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CategorySelectByType]
	@dept_id int,
	@co_id int,
	@category_type char(1)
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_categories.*
FROM            un_co_dept_categories
WHERE	co_id = @co_id
AND		dept_id = @dept_id
AND		category_type = @category_type
AND		flg_delete = 0
ORDER BY category_name')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CategorySelectByType Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CategorySelectByType Procedure'
END
GO

--
-- Script To Create dbo.CategoryUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.CategoryUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[CategoryUpdate]
(
	@category_name varchar(250),
	@Original_category_id int,
	@category_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_categories] SET [category_name] = @category_name WHERE (([category_id] = @Original_category_id));
	
SELECT category_id, co_id, dept_id, category_name, category_type FROM un_co_dept_categories WHERE (category_id = @category_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.CategoryUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.CategoryUpdate Procedure'
END
GO

--
-- Script To Update dbo.DepartmentHazardInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int,
	@category_id int
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_hazards];
INSERT INTO [un_ref_co_dept_hazards] ([flg_deleted], [dept_id], [co_id], [index_seq], [category_id], [name_desc], [created_by], [date_created], [last_amended_by], [date_last_amended]) 
VALUES (0, @dept_id, @co_id,@index_seq ,@category_id, @name_desc, @user_id, GETDATE(), @user_id, GETDATE());
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, category_id,name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_hazards WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardInsertCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardInsertCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentHazardRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_hazards
INNER JOIN un_co_dept_categories ON un_ref_co_dept_hazards.category_id = un_co_dept_categories.category_id AND 
                         un_ref_co_dept_hazards.dept_id = un_co_dept_categories.dept_id AND un_ref_co_dept_hazards.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.dept_id = @dept_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0
AND name_desc NOT IN
(
	SELECT hazard_desc 
	  FROM un_co_dept_ord_hazards
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	un_co_dept_categories.category_name,un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardRemainingSelect Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardRemainingSelect Procedure'
END
GO

--
-- Script To Update dbo.DepartmentHazardSelectByCoId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardSelectByCoId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardSelectByCoId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_hazards
INNER JOIN  un_co_dept_categories 
  ON un_ref_co_dept_hazards.category_id = un_co_dept_categories.category_id 
 AND un_ref_co_dept_hazards.dept_id = un_co_dept_categories.dept_id 
 AND un_ref_co_dept_hazards.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0
ORDER BY	un_co_dept_categories.category_name,un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectByCoId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardSelectByCoId Procedure'
END
GO

--
-- Script To Update dbo.DepartmentHazardSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_hazards
INNER JOIN  un_co_dept_categories 
  ON un_ref_co_dept_hazards.category_id = un_co_dept_categories.category_id 
 AND un_ref_co_dept_hazards.dept_id = un_co_dept_categories.dept_id 
 AND un_ref_co_dept_hazards.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.dept_id = @dept_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0
ORDER BY	un_co_dept_categories.category_name,un_ref_co_dept_hazards.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectByDeptId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardSelectByDeptId Procedure'
END
GO

--
-- Script To Update dbo.DepartmentHazardSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardSelectById]
	@id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_hazards
INNER JOIN  un_co_dept_categories 
  ON un_ref_co_dept_hazards.category_id = un_co_dept_categories.category_id 
 AND un_ref_co_dept_hazards.dept_id = un_co_dept_categories.dept_id 
 AND un_ref_co_dept_hazards.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_hazards.sequence = @id
AND			un_ref_co_dept_hazards.co_id = @co_id
AND			un_ref_co_dept_hazards.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectById Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardSelectById Procedure'
END
GO

--
-- Script To Update dbo.DepartmentHazardSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardSelectCommand]
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_hazards.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_hazards
INNER JOIN  un_co_dept_categories 
  ON un_ref_co_dept_hazards.category_id = un_co_dept_categories.category_id 
 AND un_ref_co_dept_hazards.dept_id = un_co_dept_categories.dept_id 
 AND un_ref_co_dept_hazards.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_hazards.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardSelectCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardSelectCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentHazardUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentHazardUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentHazardUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int,
	@category_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_hazards] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq,[category_id]=@category_id, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, category_id, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_hazards WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentHazardUpdateCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentHazardUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderHazardMultiSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardMultiSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardMultiSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;

DECLARE @HazardTable TABLE
(
  row_num int,sequence int, hazard_desc varchar(255)
);

INSERT INTO @HazardTable
SELECT      ROW_NUMBER() OVER (ORDER BY sequence) as rowNum, sequence,hazard_desc
FROM        un_co_dept_ord_hazards
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			flg_delete = 0;

SELECT HT1.sequence AS sequence, HT1.hazard_desc AS hazard_desc,HT2.sequence AS sequence2,HT2.hazard_desc AS hazard_desc2 
FROM
(SELECT * from @HazardTable
WHERE row_num%2 = 1) AS HT1
LEFT JOIN 
(SELECT * FROM @HazardTable WHERE row_num%2 = 0) AS HT2 ON HT1.row_num = HT2.row_num - 1;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardMultiSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardMultiSelect Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPPEInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPPEInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPPEInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int,
	@category_id int
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_ppe];
INSERT INTO [un_ref_co_dept_ppe] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_amended_by], [date_last_amended],[category_id]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE(),@category_id);
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended,category_id FROM un_ref_co_dept_ppe WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPEInsertCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPPEInsertCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPPERemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPPERemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER  PROCEDURE [dbo].[DepartmentPPERemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_ppe
INNER JOIN un_co_dept_categories ON un_ref_co_dept_ppe.category_id = un_co_dept_categories.category_id 
	   AND un_ref_co_dept_ppe.dept_id = un_co_dept_categories.dept_id 
       AND un_ref_co_dept_ppe.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.dept_id = @dept_id
AND			un_ref_co_dept_ppe.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0
AND name_desc NOT IN
(
	SELECT ppe_desc 
	  FROM un_co_dept_ord_ppe
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	category_name,un_ref_co_dept_ppe.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPERemainingSelect Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPPERemainingSelect Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPPESelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPPESelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPPESelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_ppe
INNER JOIN un_co_dept_categories 
ON un_ref_co_dept_ppe.category_id = un_co_dept_categories.category_id 
AND un_ref_co_dept_ppe.dept_id = un_co_dept_categories.dept_id
AND un_ref_co_dept_ppe.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.dept_id = @dept_id
AND			un_ref_co_dept_ppe.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0 
ORDER BY	un_co_dept_categories.category_name,un_ref_co_dept_ppe.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectByDeptId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPPESelectByDeptId Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPPESelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPPESelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPPESelectCommand]
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_ppe
INNER JOIN un_co_dept_categories 
ON un_ref_co_dept_ppe.category_id = un_co_dept_categories.category_id 
AND un_ref_co_dept_ppe.dept_id = un_co_dept_categories.dept_id
AND un_ref_co_dept_ppe.co_id = un_co_dept_categories.co_id
WHERE	un_ref_co_dept_ppe.flg_deleted = 0
AND		un_co_dept_categories.flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPPESelectCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPPEUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPPEUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPPEUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int,
	@category_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_ppe] SET [dept_id] = @dept_id,[category_id] = @category_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended,category_id FROM un_ref_co_dept_ppe WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPEUpdateCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPPEUpdateCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentSelectByCompanyId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentSelectByCompanyId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentSelectByCompanyId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_details.*
FROM            un_co_dept_details
WHERE			un_co_dept_details.co_id = @co_id
AND			flg_deleted = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentSelectByCompanyId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentSelectByCompanyId Procedure'
END
GO

--
-- Script To Update dbo.DepartmentToolInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentToolInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentToolInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int,
	@category_id int
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_tools];
INSERT INTO [un_ref_co_dept_tools] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_amended_by], [date_last_amended],[category_id]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE(),@category_id);
	
SELECT sequence, flg_deleted,category_id, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_tools WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolInsertCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentToolInsertCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentToolRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentToolRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentToolRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_tools
INNER JOIN un_co_dept_categories ON un_ref_co_dept_tools.category_id = un_co_dept_categories.category_id 
	   AND un_ref_co_dept_tools.dept_id = un_co_dept_categories.dept_id 
       AND un_ref_co_dept_tools.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.dept_id = @dept_id
AND			un_ref_co_dept_tools.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0
AND name_desc NOT IN
(
	SELECT tool_desc 
	  FROM un_co_dept_ord_tools
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	category_name,un_ref_co_dept_tools.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolRemainingSelect Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentToolRemainingSelect Procedure'
END
GO

--
-- Script To Update dbo.DepartmentToolSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentToolSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentToolSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_tools
INNER JOIN un_co_dept_categories 
ON un_ref_co_dept_tools.category_id = un_co_dept_categories.category_id 
AND un_ref_co_dept_tools.dept_id = un_co_dept_categories.dept_id
AND un_ref_co_dept_tools.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.dept_id = @dept_id
AND			un_ref_co_dept_tools.flg_deleted = 0
AND		un_co_dept_categories.flg_delete = 0
ORDER BY	un_co_dept_categories.category_name,un_ref_co_dept_tools.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectByDeptId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentToolSelectByDeptId Procedure'
END
GO

--
-- Script To Update dbo.DepartmentToolSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentToolSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentToolSelectCommand]
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_tools
INNER JOIN un_co_dept_categories 
ON un_ref_co_dept_tools.category_id = un_co_dept_categories.category_id 
AND un_ref_co_dept_tools.dept_id = un_co_dept_categories.dept_id
AND un_ref_co_dept_tools.co_id = un_co_dept_categories.co_id
WHERE		flg_deleted = 0
AND		un_co_dept_categories.flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentToolSelectCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentToolUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentToolUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentToolUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int,
	@category_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_tools] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_amended_by] = @user_id, [date_last_amended] = GETDATE(),[category_id] = @category_id WHERE (([sequence] = @Original_sequence));
	
SELECT category_id,sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_amended_by, date_last_amended FROM un_ref_co_dept_tools WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolUpdateCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentToolUpdateCommand Procedure'
END
GO

--
-- Script To Update dbo.DocumentDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocumentDelete
(
	@Original_doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_docs] SET [flg_delete] = 1 WHERE (([doc_id] = @Original_doc_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentDelete Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentDelete Procedure'
END
GO

--
-- Script To Update dbo.DocumentSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocumentSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*,un_co_dept_categories.category_name
FROM            un_co_dept_template_docs
INNER JOIN un_co_dept_categories ON un_co_dept_categories.category_id = un_co_dept_template_docs.category_id')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelect Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentSelect Procedure'
END
GO

--
-- Script To Update dbo.DocumentSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DocumentSelectById]
	@doc_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*,un_co_dept_categories.category_name
FROM            un_co_dept_template_docs
INNER JOIN un_co_dept_categories ON un_co_dept_categories.category_id = un_co_dept_template_docs.category_id
WHERE		doc_id = @doc_id
AND		un_co_dept_template_docs.flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectById Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentSelectById Procedure'
END
GO

--
-- Script To Update dbo.DocumentSelectByTypeId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentSelectByTypeId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DocumentSelectByTypeId]
	@co_id int,
	@dept_id int,
	@doc_type_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*,un_co_dept_categories.category_name
FROM            un_co_dept_template_docs
INNER JOIN un_co_dept_categories ON un_co_dept_categories.category_id = un_co_dept_template_docs.category_id
WHERE		un_co_dept_template_docs.co_id = @co_id
AND			un_co_dept_template_docs.dept_id = @dept_id
AND			doc_type_id = @doc_type_id
AND		un_co_dept_template_docs.flg_delete = 0
ORDER BY doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectByTypeId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentSelectByTypeId Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelectByTypeName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelectByTypeName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentSelectByTypeName]
	@co_id int,
	@dept_id int,
	@doc_type_desc varchar(255)
AS
	SET NOCOUNT ON;
SELECT      un_co_dept_template_docs.*,un_co_dept_categories.category_name
FROM        un_co_dept_template_docs
INNER JOIN un_co_dept_doc_type ON un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_docs.doc_type_id
INNER JOIN un_co_dept_categories ON un_co_dept_categories.category_id = un_co_dept_template_docs.category_id
WHERE		un_co_dept_template_docs.co_id = @co_id
AND			un_co_dept_template_docs.dept_id = @dept_id
AND			doc_data_type_desc = @doc_type_desc
AND			un_co_dept_template_docs.flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectByTypeName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelectByTypeName Procedure'
END
GO

--
-- Script To Update dbo.DocumentSelectRemainingByTypeName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentSelectRemainingByTypeName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DocumentSelectRemainingByTypeName]
	@co_id int,
	@dept_id int,
	@doc_type_desc varchar(255),
	@order_id int
AS
	SET NOCOUNT ON;
SELECT      un_co_dept_template_docs.doc_id,un_co_dept_template_docs.co_id,un_co_dept_template_docs.dept_id,un_co_dept_template_docs.doc_type_id,
			category_name + '' - '' + doc_name as doc_name ,doc_desc,doc_code,un_co_dept_template_docs.flg_delete,doc_index,un_co_dept_template_docs.category_id,
			un_co_dept_categories.category_name
FROM        un_co_dept_template_docs
INNER JOIN un_co_dept_doc_type ON un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_docs.doc_type_id
INNER JOIN un_co_dept_categories ON un_co_dept_categories.category_id = un_co_dept_template_docs.category_id
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
)
order by category_name,doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectRemainingByTypeName Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentSelectRemainingByTypeName Procedure'
END
GO

--
-- Script To Update dbo.DocumentUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, September 1, 2009, at 01:07 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocumentUpdate
(
	@doc_name varchar(255),
	@doc_desc varchar(255),
	@doc_code varchar(50),
	@category_id int,
	@original_doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_docs] SET [doc_name] = @doc_name, [doc_desc] = @doc_desc, [doc_code] = @doc_code,[category_id]=@category_id WHERE (([doc_id] = @original_doc_id));')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentUpdate Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentUpdate Procedure'
END
GO