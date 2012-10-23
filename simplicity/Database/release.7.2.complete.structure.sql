--
-- Script To Update dbo.DepartmentSelectShortNameRows Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 5, 2009, at 04:15 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentSelectShortNameRows Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentSelectShortNameRows] 
@shortName varchar(50),
@co_id int
as
BEGIN
select * from dbo.un_co_dept_details where co_id = @co_id and co_name_short = @shortName
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentSelectShortNameRows Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentSelectShortNameRows Procedure'
END
GO