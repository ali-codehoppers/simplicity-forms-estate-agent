--
-- Script To Create dbo.DepartmentOrderPeopleSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, August 1, 2009, at 03:22 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
-- Script To Create dbo.DepartmentOrderPersonInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, August 1, 2009, at 03:22 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
	@user_id int
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_people(dept_id,co_id,order_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended)
VALUES (@dept_id,@co_id,@order_seq,@name_desc,@user_id,GETDATE(),@user_id,GETDATE());

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
-- Script To Create dbo.DepartmentOrderPersonSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, August 1, 2009, at 03:22 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      *
FROM        un_co_dept_ord_people
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
   PRINT 'dbo.DepartmentOrderPersonSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonSelect Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderPersonUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, August 1, 2009, at 03:22 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentOrderPersonUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentOrderPersonUpdate]
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
   PRINT 'dbo.DepartmentOrderPersonUpdate Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentOrderPersonUpdate Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, August 1, 2009, at 03:22 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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