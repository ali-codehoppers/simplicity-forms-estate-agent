--
-- Script To Update dbo.un_co_dept_doc_type Table In localhost\SQLEXPRESS.unchs_release
-- Generated Thursday, October 1, 2009, at 06:43 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
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
   ALTER TABLE [dbo].[un_co_dept_doc_type]
      ADD [num_of_sections] [int] NULL
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
-- Script To Create dbo.DocumentTypeSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Thursday, October 1, 2009, at 06:43 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentTypeSelectById]
	@dept_id int,
	@co_id int,
	@doc_type_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_doc_type.*
FROM            un_co_dept_doc_type
WHERE		dept_id = @dept_id
AND		co_id = @co_id
AND		doc_data_type_id = @doc_type_id
and flg_delete = 0
ORDER BY sort_order')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeSelectById Procedure'
END
GO