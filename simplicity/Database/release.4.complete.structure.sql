--
-- Script To Create dbo.un_co_dept_doc_type Table In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_doc_type Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_doc_type] (
   [doc_data_type_id] [int] IDENTITY (1, 1) NOT NULL,
   [doc_data_type_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_doc_type_flg_delete] DEFAULT ((0)),
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [sort_order] [tinyint] NOT NULL,
   [field_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [generator_class] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_doc_type] ADD CONSTRAINT [PK_un_ref_doc_data_type] PRIMARY KEY CLUSTERED ([doc_data_type_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_doc_type Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_doc_type Table'
END
GO

--
-- Script To Update dbo.un_co_dept_ords Table In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
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
      ADD [date_closed] [datetime] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ords]
      ADD [date_sent_to_client] [datetime] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ords]
      ADD [flg_asbestos_register] [bit] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_ords]
      ADD [flg_health_safety_closed] [bit] NULL
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
-- Script To Create dbo.un_co_dept_template_docs Table In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_template_docs Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_template_docs] (
   [doc_id] [int] IDENTITY (1, 1) NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [doc_type_id] [int] NOT NULL,
   [doc_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [doc_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [doc_code] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_template_docs_flg_delete] DEFAULT ((0))
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_docs] ADD CONSTRAINT [PK_un_co_dept_template_docs] PRIMARY KEY CLUSTERED ([doc_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_docs Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_template_docs Table'
END
GO

--
-- Script To Create dbo.un_co_dept_template_items Table In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_template_items Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_template_items] (
   [item_id] [int] IDENTITY (1, 1) NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [section_id] [int] NOT NULL,
   [doc_id] [int] NOT NULL,
   [item_type] [tinyint] NOT NULL,
   [item_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [item_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_items] ADD CONSTRAINT [PK_un_co_dept_template_items] PRIMARY KEY CLUSTERED ([item_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_items Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_template_items Table'
END
GO

--
-- Script To Create dbo.un_co_dept_template_sections Table In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_template_sections Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_template_sections] (
   [section_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [section_index] [int] NOT NULL,
   [section_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_sections] ADD CONSTRAINT [PK_un_co_doc_template_sections] PRIMARY KEY CLUSTERED ([section_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_sections Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_template_sections Table'
END
GO

--
-- Script To Update dbo.DepartmentOrderSearchCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
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
	un_co_dept_ords.order_client_ref,un_co_dept_ords.date_order_created,un_co_dept_ords.address_post_code,
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
-- Script To Create dbo.DepartmentOrderUpdateDetails Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderUpdateDetails Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderUpdateDetails]
(
	@flg_order_doc_to_client bit,
	@date_sent_to_client datetime,
	@flg_asbestos_register bit,
	@flg_health_safety_closed bit,
	@date_closed datetime,
	@user_id int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] 
SET  [flg_order_doc_to_client] = @flg_order_doc_to_client, 
	 [date_sent_to_client] = @date_sent_to_client, 
	 [flg_asbestos_register] = @flg_asbestos_register,
	 [flg_health_safety_closed] = @flg_health_safety_closed,
	 [date_closed] = @date_closed,
	 [last_amended_by] = @user_id,
	 [date_last_amended] = GETDATE()
 WHERE (([sequence] = @sequence));
	
SELECT * FROM un_co_dept_ords WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderUpdateDetails Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderUpdateDetails Procedure'
END
GO

--
-- Script To Create dbo.DocumentDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentDelete
(
	@Original_doc_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_docs] WHERE (([doc_id] = @Original_doc_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentDelete Procedure'
END
GO

--
-- Script To Create dbo.DocumentInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentInsert
(
	@co_id int,
	@dept_id int,
	@doc_type_id int,
	@doc_name varchar(255),
	@doc_desc varchar(255),
	@doc_code varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_docs] ([co_id], [dept_id], [doc_type_id], [doc_name], [doc_desc], [doc_code]) VALUES (@co_id, @dept_id, @doc_type_id, @doc_name, @doc_desc, @doc_code);
	
SELECT doc_id, co_id, dept_id, doc_type_id, doc_name, doc_desc, doc_code FROM un_co_dept_template_docs WHERE (doc_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentInsert Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_docs.*
FROM            un_co_dept_template_docs')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelect Procedure'
END
GO

--
-- Script To Create dbo.DocumentSelectByTypeId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentSelectByTypeId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentSelectByTypeId]
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
AND		flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentSelectByTypeId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentSelectByTypeId Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentTypeDelete
(
	@Original_doc_data_type_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_doc_type] WHERE (([doc_data_type_id] = @Original_doc_data_type_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeDelete Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentTypeInsert
(
	@doc_data_type_id int,
	@doc_data_type_desc varchar(255),
	@flg_delete bit,
	@co_id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_doc_type] ([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id]) VALUES (@doc_data_type_id, @doc_data_type_desc, @flg_delete, @co_id);
	
SELECT doc_data_type_id, doc_data_type_desc, flg_delete, co_id, dept_id FROM un_co_dept_doc_type WHERE (doc_data_type_id = @doc_data_type_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeInsert Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentTypeSelect
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_doc_type.*
FROM            un_co_dept_doc_type')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeSelect Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentTypeSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_doc_type.*
FROM            un_co_dept_doc_type
WHERE		dept_id = @dept_id
AND		co_id = @co_id
and flg_delete = 0
ORDER BY sort_order')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeSelectByDeptId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeSelectByDeptId Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentTypeUpdate
(
	@doc_data_type_id int,
	@doc_data_type_desc varchar(255),
	@flg_delete bit,
	@co_id int,
	@Original_doc_data_type_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_doc_type] SET [doc_data_type_id] = @doc_data_type_id, [doc_data_type_desc] = @doc_data_type_desc, [flg_delete] = @flg_delete, [co_id] = @co_id WHERE (([doc_data_type_id] = @Original_doc_data_type_id));
	
SELECT doc_data_type_id, doc_data_type_desc, flg_delete, co_id, dept_id FROM un_co_dept_doc_type WHERE (doc_data_type_id = @doc_data_type_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeUpdate Procedure'
END
GO

--
-- Script To Create dbo.DocumentUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:39 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocumentUpdate
(
	@co_id int,
	@dept_id int,
	@doc_type_id int,
	@doc_name varchar(255),
	@doc_desc varchar(255),
	@doc_code varchar(50),
	@Original_doc_id int,
	@doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_docs] SET [co_id] = @co_id, [dept_id] = @dept_id, [doc_type_id] = @doc_type_id, [doc_name] = @doc_name, [doc_desc] = @doc_desc, [doc_code] = @doc_code WHERE (([doc_id] = @Original_doc_id));
	
SELECT doc_id, co_id, dept_id, doc_type_id, doc_name, doc_desc, doc_code FROM un_co_dept_template_docs WHERE (doc_id = @doc_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentUpdate Procedure'
END
GO

--
-- Script To Create dbo.DocumentTypeUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:43 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocumentTypeUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocumentTypeUpdate]
(
	@doc_data_type_id int,
	@doc_data_type_desc varchar(255),
	@flg_delete bit,
	@co_id int,
	@Original_doc_data_type_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_doc_type] SET [doc_data_type_desc] = @doc_data_type_desc, [flg_delete] = @flg_delete, [co_id] = @co_id WHERE (([doc_data_type_id] = @Original_doc_data_type_id));
	
SELECT doc_data_type_id, doc_data_type_desc, flg_delete, co_id, dept_id FROM un_co_dept_doc_type WHERE (doc_data_type_id = @doc_data_type_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentTypeUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocumentTypeUpdate Procedure'
END
GO

--
-- Script To Update Data In localhost\SQLEXPRESS.unchs_release
-- Generated Wednesday, August 12, 2009, at 01:47 AM
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

SET IDENTITY_INSERT [dbo].[un_co_dept_doc_type] ON
GO
INSERT INTO [dbo].[un_co_dept_doc_type]([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class]) VALUES (1, 'Sign In Sheet', 0, 1, 1, 1, 'int', 'SigninSheetGenerator')
INSERT INTO [dbo].[un_co_dept_doc_type]([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class]) VALUES (2, 'Safety Method Statement', 0, 1, 1, 2, NULL, NULL)
INSERT INTO [dbo].[un_co_dept_doc_type]([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class]) VALUES (3, 'Risk Assessment Procedure', 0, 1, 1, 3, NULL, 'RiskAssessmentProcedureGenerator')
INSERT INTO [dbo].[un_co_dept_doc_type]([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class]) VALUES (5, 'Risk Assessments', 0, 1, 1, 4, 'detail', NULL)
INSERT INTO [dbo].[un_co_dept_doc_type]([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class]) VALUES (6, 'Hot Works', 0, 1, 1, 5, 'int', 'HotWorksGenerator')
SET IDENTITY_INSERT [dbo].[un_co_dept_doc_type] OFF
GO
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
