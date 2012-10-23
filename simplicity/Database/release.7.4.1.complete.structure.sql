--
-- Script To Create dbo.DeptPeopleSelectByNameAndType Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Saturday, September 12, 2009, at 02:59 PM
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