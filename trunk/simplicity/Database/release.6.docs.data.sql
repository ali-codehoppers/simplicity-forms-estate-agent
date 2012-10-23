--
-- Script To Update Data In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, August 24, 2009, at 12:49 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL, XACT_ABORT ON
GO
SET NUMERIC_ROUNDABORT OFF
GO

BEGIN TRANSACTION

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   COMMIT TRANSACTION
GO

BEGIN TRANSACTION

UPDATE [dbo].[un_co_dept_doc_type] SET [required] = 1 WHERE [doc_data_type_id] = 2
UPDATE [dbo].[un_co_dept_doc_type] SET [style] = 'font-weight:bold;' WHERE [doc_data_type_id] = 3
UPDATE [dbo].[un_co_dept_doc_type] SET [required] = 1 WHERE [doc_data_type_id] = 5
UPDATE [dbo].[un_co_dept_doc_type] SET [doc_data_type_desc] = 'Hot Works Permit' WHERE [doc_data_type_id] = 6
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'Data Update Of [dbo].[un_co_dept_doc_type] Successfully Completed'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Data Update Of [dbo].[un_co_dept_doc_type] Failed'
END
GO

BEGIN TRANSACTION

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   COMMIT TRANSACTION
GO
