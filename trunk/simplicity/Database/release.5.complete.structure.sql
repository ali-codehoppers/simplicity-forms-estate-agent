--
-- Script To Create dbo.un_co_dept_ord_docs Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_docs Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_docs] (
   [dept_order_doc_id] [int] IDENTITY (1, 1) NOT NULL,
   [order_id] [int] NOT NULL,
   [doc_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [flg_delete] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ord_docs] ADD CONSTRAINT [PK_un_co_dept_ord_docs] PRIMARY KEY CLUSTERED ([dept_order_doc_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_docs Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_docs Table'
END
GO

--
-- Script To Create dbo.un_co_dept_ord_log Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_ord_log Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_ord_log] (
   [log_id] [int] IDENTITY (1, 1) NOT NULL,
   [order_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [created_by] [int] NOT NULL,
   [creation_time] [datetime] NOT NULL,
   [file_path] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ord_log] ADD CONSTRAINT [PK_un_co_dept_ord_folders] PRIMARY KEY CLUSTERED ([log_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ord_log Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_ord_log Table'
END
GO

--
-- Script To Update dbo.un_co_dept_ords Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_dept_ords Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ords]
      ADD [desc_of_work] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ords]
      ADD [est_num_of_operatives] [int] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_ords Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_dept_ords Table'
END
GO

--
-- Script To Update dbo.un_co_dept_template_docs Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
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
      ADD [doc_index] [int] NULL
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
-- Script To Update dbo.un_co_dept_template_items Table In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_dept_template_items Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_items]
      ADD [item_index] [tinyint] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_items Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_dept_template_items Table'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentDefaultSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentDefaultSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderDocumentDefaultSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_docs.*
FROM            un_co_dept_ord_docs')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentDefaultSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentDefaultSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderDocumentDelete]
(
	@Original_dept_order_doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ord_docs] SET flg_delete = 1 WHERE (([dept_order_doc_id] = @Original_dept_order_doc_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderDocumentInsert
(
	@order_id int,
	@doc_id int,
	@dept_id int,
	@co_id int,
	@flg_delete bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_ord_docs] ([order_id], [doc_id], [dept_id], [co_id], [flg_delete]) VALUES (@order_id, @doc_id, @dept_id, @co_id, @flg_delete);
	
SELECT dept_order_doc_id, order_id, doc_id, dept_id, co_id, flg_delete FROM un_co_dept_ord_docs WHERE (dept_order_doc_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderDocumentSelect]
	@co_id int,
	@dept_id int,
	@order_id int
AS
	SET NOCOUNT ON;
SELECT    un_co_dept_ord_docs.dept_order_doc_id,un_co_dept_template_docs.doc_id,un_co_dept_template_docs.doc_name,un_co_dept_template_docs.doc_desc,un_co_dept_template_docs.doc_code
FROM            un_co_dept_ord_docs
INNER JOIN un_co_dept_template_docs 
ON un_co_dept_ord_docs.co_id = un_co_dept_template_docs.co_id
AND un_co_dept_ord_docs.dept_id = un_co_dept_template_docs.dept_id
AND un_co_dept_ord_docs.doc_id = un_co_dept_template_docs.doc_id
WHERE un_co_dept_ord_docs.order_id = @order_id
AND	un_co_dept_ord_docs.flg_delete = 0
AND un_co_dept_template_docs.flg_delete = 0
ORDER BY un_co_dept_template_docs.doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentSelectByTypeId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentSelectByTypeId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderDocumentSelectByTypeId]
	@co_id int,
	@dept_id int,
	@order_id int,
	@doc_type_id int
AS
	SET NOCOUNT ON;
SELECT    un_co_dept_ord_docs.dept_order_doc_id,un_co_dept_template_docs.doc_id,un_co_dept_template_docs.doc_name,un_co_dept_template_docs.doc_desc,un_co_dept_template_docs.doc_code
FROM            un_co_dept_ord_docs
INNER JOIN un_co_dept_template_docs 
ON un_co_dept_ord_docs.co_id = un_co_dept_template_docs.co_id
AND un_co_dept_ord_docs.dept_id = un_co_dept_template_docs.dept_id
AND un_co_dept_ord_docs.doc_id = un_co_dept_template_docs.doc_id
WHERE un_co_dept_ord_docs.order_id = @order_id
AND un_co_dept_template_docs.doc_type_id = @doc_type_id
AND	un_co_dept_ord_docs.flg_delete = 0
AND un_co_dept_template_docs.flg_delete = 0
ORDER BY un_co_dept_template_docs.doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentSelectByTypeId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentSelectByTypeId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogDelete]
(
	@Original_log_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ord_log] SET flg_delete = 1 WHERE (([log_id] = @Original_log_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogDelete Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogInsert]
(
	@order_id int,
	@co_id int,
	@dept_id int,
	@created_by int,
	@creation_time datetime,
	@file_path varchar(250),
	@flg_delete bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_ord_log] ([order_id], [co_id], [dept_id], [created_by], [creation_time], [file_path], [flg_delete]) VALUES (@order_id, @co_id, @dept_id, @created_by, @creation_time, @file_path, @flg_delete);
	
SELECT log_id, order_id, co_id, dept_id, created_by, creation_time, file_path, flg_delete FROM un_co_dept_ord_log WHERE (log_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DepartmentOrderLogSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_log.*
FROM            un_co_dept_ord_log')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogSelectByOrderId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogSelectByOrderId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogSelectByOrderId]
	@co_id int,
	@dept_id int,
	@order_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_ord_log.*
FROM            un_co_dept_ord_log
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_id = @order_id
AND			flg_delete = 0
ORDER BY creation_time desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogSelectByOrderId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogSelectByOrderId Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderLogUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderLogUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderLogUpdate]
(
	@order_id int,
	@co_id int,
	@dept_id int,
	@created_by int,
	@creation_time datetime,
	@file_path varchar(250),
	@flg_delete bit,
	@Original_log_id int,
	@log_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ord_log] SET [order_id] = @order_id, [co_id] = @co_id, [dept_id] = @dept_id, [created_by] = @created_by, [creation_time] = @creation_time, [file_path] = @file_path, [flg_delete] = @flg_delete WHERE (([log_id] = @Original_log_id));
	
SELECT log_id, order_id, co_id, dept_id, created_by, creation_time, file_path, flg_delete FROM un_co_dept_ord_log WHERE (log_id = @log_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderLogUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderLogUpdate Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderSearchCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentOrderSearchCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentOrderSearchCommand] 
@dept_id int,
@site_add varchar(100),
@ord_ref varchar(32),
@client_ref varchar(32),
@from_date varchar(20),
@to_date varchar(20),
@postal_code varchar(9)
AS
BEGIN
Select un_co_dept_ords.sequence,un_co_dept_details.co_name_short as department,un_co_dept_ords.order_ref,un_co_dept_ords.order_sms,
    un_co_dept_ords.order_client_ref,un_co_dept_ords.date_order_created,un_co_dept_ords.address_no,un_co_dept_ords.address_line1,un_co_dept_ords.address_post_code,
	un_co_dept_ords.date_order_review
from [un_co_dept_ords]
inner join [un_co_dept_details]  on un_co_dept_ords.dept_id = un_co_dept_details.dept_id
where un_co_dept_ords.dept_id =@dept_id
and (@site_add IS null  or un_co_dept_ords.address_full = @site_add)
and (@ord_ref IS null  or un_co_dept_ords.order_ref = @ord_ref)
and (@client_ref IS null  or un_co_dept_ords.order_client_ref = @client_ref)
and (@from_date IS null  or un_co_dept_ords.date_created >= convert(datetime,@from_date,103))
and (@to_date IS null  or un_co_dept_ords.date_created <= dateadd(d,1,convert(datetime,@to_date,103)))
and (@postal_code IS null or un_co_dept_ords.address_post_code = @postal_code)
and un_co_dept_ords.flg_delete = 0
and un_co_dept_ords.flg_cancelled = 0
order by date_order_created desc 
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderSearchCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentOrderSearchCommand Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentOrderUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentOrderUpdateCommand]
(
	@flg_delete bit,
	@dept_id int,
	@co_id int,
	@order_ref varchar(32),
	@order_client_ref varchar(32),
	@order_sms varchar(32),
	@date_order_created datetime,
	@order_est_of_works int,
	@est_num_of_operatives int,
	@date_order_review datetime,
	@flg_order_doc_to_client bit,
	@address_no varchar(32),
	@address_line1 varchar(128),
	@address_line2 varchar(128),
	@address_line3 varchar(128),
	@address_line4 varchar(128),
	@address_line5 varchar(128),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@order_desc varchar(1000),
	@desc_of_work varchar(1000),
	@flg_multi_emer_exits bit,
	@flg_multi_assem_points bit,
	@flg_cancelled bit,
	@date_cancelled datetime,
	@last_amended_by int,
	@date_last_amended datetime,
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] SET [flg_delete] = @flg_delete,[est_num_of_operatives]=@est_num_of_operatives, [dept_id] = @dept_id, [co_id] = @co_id, [order_ref] = @order_ref, [order_client_ref] = @order_client_ref, [order_sms] = @order_sms, [date_order_created] = @date_order_created, [order_est_of_works] = @order_est_of_works, [date_order_review] = @date_order_review, [flg_order_doc_to_client] = @flg_order_doc_to_client, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [order_desc] = @order_desc,[desc_of_work] = @desc_of_work,[flg_multi_emer_exits] = @flg_multi_emer_exits, [flg_multi_assem_points] = @flg_multi_assem_points, [flg_cancelled] = @flg_cancelled, [date_cancelled] = @date_cancelled, [last_amended_by] = @last_amended_by, [date_last_amended] = @date_last_amended WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_delete, dept_id, co_id, order_ref, order_client_ref, order_sms, date_order_created, order_est_of_works, date_order_review, flg_order_doc_to_client, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, order_desc, flg_multi_emer_exits, flg_multi_assem_points, flg_cancelled, date_cancelled, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_ords WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderUpdateCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentOrderUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemDeleteCommand
(
	@Original_item_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_items] WHERE (([item_id] = @Original_item_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemInsertCommand
(
	@co_id int,
	@dept_id int,
	@section_id int,
	@doc_id int,
	@item_type tinyint,
	@item_name varchar(255),
	@item_desc varchar(255),
	@item_index tinyint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_items] ([co_id], [dept_id], [section_id], [doc_id], [item_type], [item_name], [item_desc], [item_index]) VALUES (@co_id, @dept_id, @section_id, @doc_id, @item_type, @item_name, @item_desc, @item_index);
	
SELECT item_id, co_id, dept_id, section_id, doc_id, item_type, item_name, item_desc, item_index FROM un_co_dept_template_items WHERE (item_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_items.*
FROM            un_co_dept_template_items')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemUpdateCommand
(
	@co_id int,
	@dept_id int,
	@section_id int,
	@doc_id int,
	@item_type tinyint,
	@item_name varchar(255),
	@item_desc varchar(255),
	@item_index tinyint,
	@Original_item_id int,
	@item_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_items] SET [co_id] = @co_id, [dept_id] = @dept_id, [section_id] = @section_id, [doc_id] = @doc_id, [item_type] = @item_type, [item_name] = @item_name, [item_desc] = @item_desc, [item_index] = @item_index WHERE (([item_id] = @Original_item_id));
	
SELECT item_id, co_id, dept_id, section_id, doc_id, item_type, item_name, item_desc, item_index FROM un_co_dept_template_items WHERE (item_id = @item_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionDeleteCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionDeleteCommand
(
	@Original_section_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_sections] WHERE (([section_id] = @Original_section_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionDeleteCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionInsertCommand
(
	@flg_delete bit,
	@co_id int,
	@dept_id int,
	@section_index int,
	@section_desc varchar(255)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_sections] ([flg_delete], [co_id], [dept_id], [section_index], [section_desc]) VALUES (@flg_delete, @co_id, @dept_id, @section_index, @section_desc);
	
SELECT section_id, flg_delete, co_id, dept_id, section_index, section_desc FROM un_co_dept_template_sections WHERE (section_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionInsertCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_sections.*
FROM            un_co_dept_template_sections')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionSelectCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionUpdateCommand
(
	@flg_delete bit,
	@co_id int,
	@dept_id int,
	@section_index int,
	@section_desc varchar(255),
	@Original_section_id int,
	@section_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_sections] SET [flg_delete] = @flg_delete, [co_id] = @co_id, [dept_id] = @dept_id, [section_index] = @section_index, [section_desc] = @section_desc WHERE (([section_id] = @Original_section_id));
	
SELECT section_id, flg_delete, co_id, dept_id, section_index, section_desc FROM un_co_dept_template_sections WHERE (section_id = @section_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionUpdateCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DocumentItemSelectByDocId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentItemSelectByDocId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentItemSelectByDocId]
	@dept_id int,
	@co_id int,
	@doc_id int
AS
SET NOCOUNT ON;

SELECT item_id,section_desc,item_type,item_name 
  FROM dbo.un_co_dept_template_items
INNER JOIN dbo.un_co_dept_template_sections ON dbo.un_co_dept_template_sections.section_id = dbo.un_co_dept_template_items.section_id
WHERE dbo.un_co_dept_template_items.co_id = @co_id
AND dbo.un_co_dept_template_items.dept_id = @dept_id
AND dbo.un_co_dept_template_items.doc_id = @doc_id
ORDER BY section_index,item_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentItemSelectByDocId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentItemSelectByDocId Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentSelectById]
	@doc_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*
FROM            un_co_dept_template_docs
WHERE		doc_id = @doc_id
AND		flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelectById Procedure'
END
GO

--
-- Script To Update dbo.DocumentSelectByTypeId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
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
SELECT        un_co_dept_template_docs.*
FROM            un_co_dept_template_docs
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			doc_type_id = @doc_type_id
AND		flg_delete = 0
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
-- Script To Create dbo.DocumentSelectRemainingByTypeName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Sunday, August 16, 2009, at 05:21 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelectRemainingByTypeName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentSelectRemainingByTypeName]
	@co_id int,
	@dept_id int,
	@doc_type_desc varchar(255),
	@order_id int
AS
	SET NOCOUNT ON;
SELECT      un_co_dept_template_docs.*
FROM        un_co_dept_template_docs
INNER JOIN un_co_dept_doc_type ON un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_docs.doc_type_id
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
)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectRemainingByTypeName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelectRemainingByTypeName Procedure'
END
GO