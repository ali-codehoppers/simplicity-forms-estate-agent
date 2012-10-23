--
-- Script To Update dbo.un_co_dept_doc_type Table In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, August 24, 2009, at 12:48 AM
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
   IF EXISTS (SELECT name FROM sysobjects WHERE name = N'DF_un_co_dept_doc_type_flg_delete')
      ALTER TABLE [dbo].[un_co_dept_doc_type] DROP CONSTRAINT [DF_un_co_dept_doc_type_flg_delete]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_un_co_dept_doc_type] (
   [doc_data_type_id] [int] IDENTITY (1, 1) NOT NULL,
   [doc_data_type_desc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [flg_delete] [bit] NOT NULL CONSTRAINT [DF_un_co_dept_doc_type_flg_delete] DEFAULT ((0)),
   [co_id] [int] NOT NULL,
   [dept_id] [int] NOT NULL,
   [sort_order] [tinyint] NOT NULL,
   [field_type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [generator_class] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
   [required] [bit] NOT NULL,
   [style] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_dept_doc_type] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_un_co_dept_doc_type] ([doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class], [required], [style])
   SELECT [doc_data_type_id], [doc_data_type_desc], [flg_delete], [co_id], [dept_id], [sort_order], [field_type], [generator_class], 0, NULL
   FROM [dbo].[un_co_dept_doc_type]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_un_co_dept_doc_type] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[un_co_dept_doc_type]
GO

sp_rename N'[dbo].[tmp_un_co_dept_doc_type]', N'un_co_dept_doc_type'

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
   PRINT 'dbo.un_co_dept_doc_type Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_dept_doc_type Table'
END
GO

--
-- Script To Create dbo.DepartmentOrderCancelOrder Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, August 24, 2009, at 12:48 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderCancelOrder Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderCancelOrder]
(
	@user_id int,
	@Original_sequence int,
	@flg_cancelled bit,
	@date_cancelled datetime
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] SET [flg_cancelled] = @flg_cancelled, [date_cancelled] = @date_cancelled, [last_amended_by] = @user_id, [date_last_amended] = GETDATE() WHERE [sequence] = @Original_sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderCancelOrder Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderCancelOrder Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderSearchCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Monday, August 24, 2009, at 12:48 AM
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
	un_co_dept_ords.date_order_review,un_co_dept_ords.flg_cancelled
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