--
-- Script To Update dbo.un_co_dept_doc_type Table In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 4, 2009, at 01:40 AM
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
      ADD [flg_landscape] [bit] NULL
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
-- Script To Update dbo.un_ref_co_dept_hazards Table In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 4, 2009, at 01:40 AM
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
      ALTER COLUMN [category_id] [int] NULL
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
-- Generated Friday, September 4, 2009, at 01:40 AM
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
      ALTER COLUMN [category_id] [int] NULL
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
-- Generated Friday, September 4, 2009, at 01:40 AM
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
      ALTER COLUMN [category_id] [int] NULL
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
-- Script To Update dbo.DepartmentPPESelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 4, 2009, at 01:40 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPPESelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPPESelectById]
	@id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_ppe
INNER JOIN un_co_dept_categories 
ON un_ref_co_dept_ppe.category_id = un_co_dept_categories.category_id 
AND un_ref_co_dept_ppe.dept_id = un_co_dept_categories.dept_id
AND un_ref_co_dept_ppe.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_ppe.sequence = @id
AND			un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.flg_deleted = 0
AND			un_co_dept_categories.flg_delete = 0 ;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPESelectById Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPPESelectById Procedure'
END
GO

--
-- Script To Update dbo.DepartmentToolSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 4, 2009, at 01:40 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentToolSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentToolSelectById]
	@id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*,un_co_dept_categories.category_name
FROM        un_ref_co_dept_tools
INNER JOIN un_co_dept_categories 
ON un_ref_co_dept_tools.category_id = un_co_dept_categories.category_id 
AND un_ref_co_dept_tools.dept_id = un_co_dept_categories.dept_id
AND un_ref_co_dept_tools.co_id = un_co_dept_categories.co_id
WHERE		un_ref_co_dept_tools.sequence = @id
AND			un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.flg_deleted = 0
AND		un_co_dept_categories.flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolSelectById Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentToolSelectById Procedure'
END
GO

--
-- Script To Update dbo.DocumentSelectRemainingByTypeName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 4, 2009, at 01:40 AM
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
			doc_name,doc_desc,doc_code,un_co_dept_template_docs.flg_delete,doc_index,un_co_dept_template_docs.category_id,
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
-- Script To Update dbo.UserLogin Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 4, 2009, at 01:40 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.UserLogin Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE dbo.UserLogin
	-- Add the parameters for the stored procedure here
	@user_logon varchar(50),
	@user_enable varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT user_id, flg_deleted, co_id, user_level, user_name, user_logon, user_enable, user_enable_reminder, user_telephone, user_tel_ext, user_tel_mobile, user_email, user_department, user_location, created_by, date_created, last_amended_by, date_last_amended FROM un_co_user_details WHERE user_logon = @user_logon AND user_enable = @user_enable
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.UserLogin Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.UserLogin Procedure'
END
GO