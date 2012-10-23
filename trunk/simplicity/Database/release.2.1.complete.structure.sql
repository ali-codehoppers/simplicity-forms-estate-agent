--
-- Script To Create dbo.DepartmentHazardRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Thursday, July 30, 2009, at 10:55 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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