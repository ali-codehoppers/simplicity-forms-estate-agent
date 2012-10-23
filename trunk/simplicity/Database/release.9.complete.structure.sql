--
-- Script To Update dbo.un_co_dept_template_items Table In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
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
      DROP COLUMN [item_desc],
                  [item_type]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_items]
      ADD [section_detail_id] [int] NULL
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
-- Script To Create dbo.un_co_dept_template_section_details Table In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.un_co_dept_template_section_details Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

CREATE TABLE [dbo].[un_co_dept_template_section_details] (
   [section_detail_id] [int] IDENTITY (1, 1) NOT NULL,
   [section_id] [int] NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [section_detail_index] [int] NOT NULL,
   [section_detail_desc] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_dept_template_section_details] ADD CONSTRAINT [PK_un_co_dept_template_sections_details] PRIMARY KEY CLUSTERED ([section_detail_id])
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_dept_template_section_details Table Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.un_co_dept_template_section_details Table'
END
GO

--
-- Script To Update dbo.un_co_dept_template_sections Table In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_dept_template_sections Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_un_co_dept_template_sections] (
   [section_id] [int] IDENTITY (1, 1) NOT NULL,
   [flg_delete] [bit] NOT NULL,
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [section_index] [int] NOT NULL,
   [section_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [section_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [doc_type_id] [int] NOT NULL,
   [repeat_columns] [tinyint] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_dept_template_sections] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_un_co_dept_template_sections] ([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns])
   SELECT [section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], '', 0, NULL
   FROM [dbo].[un_co_dept_template_sections]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_dept_template_sections] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[un_co_dept_template_sections]
GO

sp_rename N'[dbo].[tmp_un_co_dept_template_sections]', N'un_co_dept_template_sections'

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
   PRINT 'dbo.un_co_dept_template_sections Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_dept_template_sections Table'
END
GO

--
-- Script To Create dbo.DepartmentOrderDocumentSelectByTypeName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderDocumentSelectByTypeName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderDocumentSelectByTypeName]
	@co_id int,
	@dept_id int,
	@order_id int,
	@doc_type_name varchar(255)
AS
	SET NOCOUNT ON;
SELECT    un_co_dept_ord_docs.dept_order_doc_id,un_co_dept_template_docs.doc_id,un_co_dept_template_docs.doc_name,un_co_dept_template_docs.doc_desc,un_co_dept_template_docs.doc_code
FROM            un_co_dept_ord_docs
INNER JOIN un_co_dept_template_docs 
ON un_co_dept_ord_docs.co_id = un_co_dept_template_docs.co_id
AND un_co_dept_ord_docs.dept_id = un_co_dept_template_docs.dept_id
AND un_co_dept_ord_docs.doc_id = un_co_dept_template_docs.doc_id
INNER JOIN un_co_dept_doc_type 
ON un_co_dept_template_docs.co_id = un_co_dept_doc_type.co_id
AND un_co_dept_template_docs.dept_id = un_co_dept_doc_type.dept_id
AND un_co_dept_template_docs.doc_type_id = un_co_dept_doc_type.doc_data_type_id
WHERE un_co_dept_ord_docs.order_id = @order_id
AND un_co_dept_doc_type.doc_data_type_desc = @doc_type_name
AND	un_co_dept_ord_docs.flg_delete = 0
AND un_co_dept_template_docs.flg_delete = 0
AND un_co_dept_doc_type.flg_delete = 0
ORDER BY un_co_dept_template_docs.doc_index')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderDocumentSelectByTypeName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderDocumentSelectByTypeName Procedure'
END
GO

--
-- Script To Update dbo.DepartmentSelectShortNameRows Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
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

--
-- Script To Create dbo.DocItemDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemDelete
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
   PRINT 'dbo.DocItemDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemDelete Procedure'
END
GO

--
-- Script To Create dbo.DocItemDeleteBySecId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemDeleteBySecId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocItemDeleteBySecId]
(
	@co_id int,
	@dept_id int,
	@doc_id int,
	@section_id int	
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_items] 
WHERE	co_id = @co_id
AND		dept_id = @dept_id
AND		doc_id  = @doc_id
AND		section_id = @section_id')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemDeleteBySecId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemDeleteBySecId Procedure'
END
GO

--
-- Script To Delete dbo.DocItemDeleteCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DocItemDeleteCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DocItemDeleteCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemDeleteCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DocItemDeleteCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemInsert
(
	@co_id int,
	@dept_id int,
	@section_id int,
	@doc_id int,
	@item_name varchar(255),
	@item_index tinyint,
	@section_detail_id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_items] ([co_id], [dept_id], [section_id], [doc_id], [item_name], [item_index], [section_detail_id]) VALUES (@co_id, @dept_id, @section_id, @doc_id, @item_name, @item_index, @section_detail_id);
	
SELECT item_id, co_id, dept_id, section_id, doc_id, item_name, item_index, section_detail_id FROM un_co_dept_template_items WHERE (item_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemInsert Procedure'
END
GO

--
-- Script To Delete dbo.DocItemInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DocItemInsertCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DocItemInsertCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemInsertCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DocItemInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocItemSelect]
	@co_id int,
	@dept_id int,
	@doc_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_items.*
FROM            un_co_dept_template_items
WHERE 	co_id = @co_id
and  dept_id = @dept_id 
and doc_id = @doc_id')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemSelect Procedure'
END
GO

--
-- Script To Create dbo.DocItemSelectBySecId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemSelectBySecId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATe PROCEDURE [dbo].[DocItemSelectBySecId]
	@co_id int,
	@dept_id int,
	@doc_id int,
	@section_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_items.*
FROM            un_co_dept_template_items
WHERE 	co_id = @co_id
and  dept_id = @dept_id 
and doc_id = @doc_id 
and section_id = @section_id')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemSelectBySecId Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemSelectBySecId Procedure'
END
GO

--
-- Script To Delete dbo.DocItemSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DocItemSelectCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DocItemSelectCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemSelectCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DocItemSelectCommand Procedure'
END
GO

--
-- Script To Create dbo.DocItemUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocItemUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocItemUpdate
(
	@co_id int,
	@dept_id int,
	@section_id int,
	@doc_id int,
	@item_name varchar(255),
	@item_index tinyint,
	@section_detail_id int,
	@Original_item_id int,
	@item_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_items] SET [co_id] = @co_id, [dept_id] = @dept_id, [section_id] = @section_id, [doc_id] = @doc_id, [item_name] = @item_name, [item_index] = @item_index, [section_detail_id] = @section_detail_id WHERE (([item_id] = @Original_item_id));
	
SELECT item_id, co_id, dept_id, section_id, doc_id, item_name, item_index, section_detail_id FROM un_co_dept_template_items WHERE (item_id = @item_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocItemUpdate Procedure'
END
GO

--
-- Script To Delete dbo.DocItemUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Deleting dbo.DocItemUpdateCommand Procedure'
GO

   DROP PROCEDURE [dbo].[DocItemUpdateCommand]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocItemUpdateCommand Procedure Deleted Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Delete dbo.DocItemUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionDetailDelete Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionDetailDelete Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DocSectionDetailDelete
(
	@Original_section_detail_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_dept_template_section_details] WHERE (([section_detail_id] = @Original_section_detail_id))')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionDetailDelete Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionDetailDelete Procedure'
END
GO

--
-- Script To Create dbo.DocSectionDetailInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionDetailInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocSectionDetailInsert]
(
	@section_id int,
	@co_id int,
	@dept_id int,
	@section_detail_index int,
	@section_detail_desc varchar(100)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_section_details] ([section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc],[flg_delete]) VALUES (@section_id, @co_id, @dept_id, @section_detail_index, @section_detail_desc,0);
	
SELECT * FROM un_co_dept_template_section_details WHERE (section_detail_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionDetailInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionDetailInsert Procedure'
END
GO

--
-- Script To Create dbo.DocSectionDetailSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionDetailSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocSectionDetailSelect]
	@co_id int,
	@dept_id int,
	@section_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_section_details.*
FROM            un_co_dept_template_section_details
WHERE	co_id = @co_id
and		dept_id = @dept_id
and		section_id = @section_id
and		flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionDetailSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionDetailSelect Procedure'
END
GO

--
-- Script To Create dbo.DocSectionDetailUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionDetailUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocSectionDetailUpdate]
(
	@section_detail_index int,
	@section_detail_desc varchar(100),
	@Original_section_detail_id int,
	@section_detail_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_section_details] SET  [section_detail_index] = @section_detail_index, [section_detail_desc] = @section_detail_desc WHERE (([section_detail_id] = @Original_section_detail_id));
	
SELECT * FROM un_co_dept_template_section_details WHERE (section_detail_id = @section_detail_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionDetailUpdate Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionDetailUpdate Procedure'
END
GO

--
-- Script To Update dbo.DocSectionInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocSectionInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocSectionInsertCommand
(
	@flg_delete bit,
	@co_id int,
	@dept_id int,
	@section_index int,
	@section_desc varchar(255),
	@section_type varchar(50),
	@doc_type_id int,
	@repeat_columns int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_sections] ([flg_delete], [co_id], [dept_id], [section_index], [section_desc],[section_type],[doc_type_id],[repeat_columns]) VALUES (@flg_delete, @co_id, @dept_id, @section_index, @section_desc,@section_type,@doc_type_id,@repeat_columns);
	
SELECT * FROM un_co_dept_template_sections WHERE (section_id = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionInsertCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocSectionInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DocSectionSelectById Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DocSectionSelectById Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DocSectionSelectById]
	@co_id int,
	@dept_id int,
	@section_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_sections.*
FROM            un_co_dept_template_sections
WHERE co_id = @co_id
and dept_id = @dept_id
and section_id = @section_id
and flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionSelectById Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DocSectionSelectById Procedure'
END
GO

--
-- Script To Update dbo.DocSectionSelectCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocSectionSelectCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocSectionSelectCommand
	@co_id int,
	@dept_id int,
	@doc_type_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_template_sections.*
FROM            un_co_dept_template_sections
WHERE co_id = @co_id
and dept_id = @dept_id
and doc_type_id = @doc_type_id
and flg_delete = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionSelectCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocSectionSelectCommand Procedure'
END
GO

--
-- Script To Update dbo.DocSectionUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocSectionUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocSectionUpdateCommand
(
	@section_index int,
	@section_desc varchar(255),
	@section_type varchar(50),
	@repeat_columns int,
	@Original_section_id int,
	@section_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_sections] SET [section_index] = @section_index, [section_desc] = @section_desc,
	[section_type] = @section_type,[repeat_columns] = @repeat_columns WHERE (([section_id] = @Original_section_id));
	
SELECT section_id, flg_delete, co_id, dept_id, section_index, section_desc FROM un_co_dept_template_sections WHERE (section_id = @section_id)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocSectionUpdateCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocSectionUpdateCommand Procedure'
END
GO

--
-- Script To Update dbo.DocumentInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocumentInsert
(
	@co_id int,
	@dept_id int,
	@doc_type_id int,
	@doc_name varchar(255),
	@doc_desc varchar(255),
	@doc_code varchar(50),
	@category_id int,
	@doc_index int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_template_docs] ([co_id], [dept_id], [doc_type_id], [doc_name], [doc_desc], [doc_code],[category_id],[doc_index]) VALUES (@co_id, @dept_id, @doc_type_id, @doc_name, @doc_desc, @doc_code,@category_id,@doc_index);')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentInsert Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentInsert Procedure'
END
GO

--
-- Script To Update dbo.DocumentItemSelectByDocId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentItemSelectByDocId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DocumentItemSelectByDocId]
	@dept_id int,
	@co_id int,
	@doc_id int
AS
SET NOCOUNT ON;

SELECT item_id,section_desc,item_name,section_type
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
   PRINT 'dbo.DocumentItemSelectByDocId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentItemSelectByDocId Procedure'
END
GO

--
-- Script To Update dbo.DocumentUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:46 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DocumentUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE dbo.DocumentUpdate
(
	@doc_name varchar(255),
	@doc_desc varchar(255),
	@doc_code varchar(50),
	@category_id int,
	@doc_index int,
	@original_doc_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_template_docs] SET [doc_name] = @doc_name, [doc_desc] = @doc_desc, [doc_code] = @doc_code,[category_id]=@category_id,[doc_index] = @doc_index WHERE (([doc_id] = @original_doc_id));')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DocumentUpdate Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DocumentUpdate Procedure'
END
GO