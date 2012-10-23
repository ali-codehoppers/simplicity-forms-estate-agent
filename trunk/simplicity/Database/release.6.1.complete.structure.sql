--
-- Script To Create dbo.DepartmentOrderHazardEvenSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, August 24, 2009, at 02:55 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardEvenSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardEvenSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,hazard_desc
FROM        
(SELECT ROW_NUMBER() OVER (ORDER BY sequence)AS row_num,sequence,hazard_desc
FROM un_co_dept_ord_hazards
WHERE  co_id = @co_id
AND	   dept_id = @dept_id
AND	   order_seq = @order_seq
AND	   flg_delete = 0) AS T
WHERE t.row_num%2 = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardEvenSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardEvenSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderHazardOddSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, August 24, 2009, at 02:55 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderHazardOddSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderHazardOddSelect]
(
	@dept_id int,
	@co_id	int,
	@order_seq int
)
AS
	SET NOCOUNT ON;
SELECT      sequence,hazard_desc
FROM        
(SELECT ROW_NUMBER() OVER (ORDER BY sequence)AS row_num,sequence,hazard_desc
FROM un_co_dept_ord_hazards
WHERE  co_id = @co_id
AND	   dept_id = @dept_id
AND	   order_seq = @order_seq
AND	   flg_delete = 0) AS T
WHERE t.row_num%2 = 1')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderHazardOddSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderHazardOddSelect Procedure'
END
GO