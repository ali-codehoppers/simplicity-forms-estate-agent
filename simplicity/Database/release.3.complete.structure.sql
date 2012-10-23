--
-- Script To Update dbo.un_co_details Table In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_co_details Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_co_details]
      ADD [flg_autosave] [bit] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_co_details Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_co_details Table'
END
GO

--
-- Script To Update dbo.un_ref_co_dept_people Table In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.un_ref_co_dept_people Table'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people]
      ADD [flg_fire_warden] [bit] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people]
      ADD [flg_first_aider] [bit] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people]
      ADD [flg_supervisor] [bit] NULL
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people] ADD CONSTRAINT [DF_un_ref_co_dept_people_flg_fire_warden] DEFAULT ((0)) FOR [flg_fire_warden]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people] ADD CONSTRAINT [DF_un_ref_co_dept_people_flg_first_aider] DEFAULT ((0)) FOR [flg_first_aider]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[un_ref_co_dept_people] ADD CONSTRAINT [DF_un_ref_co_dept_people_flg_supervisor] DEFAULT ((0)) FOR [flg_supervisor]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.un_ref_co_dept_people Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.un_ref_co_dept_people Table'
END
GO

--
-- Script To Create dbo.DeleteExistingOrderPersonCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DeleteExistingOrderPersonCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE dbo.DeleteExistingOrderPersonCommand
@order_seq int
AS
BEGIN
delete from un_co_dept_ord_people where order_seq = @order_seq
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DeleteExistingOrderPersonCommand Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DeleteExistingOrderPersonCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentHazardSigRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentHazardSigRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREAte PROCEDURE [dbo].[DepartmentHazardSigRemainingSelect]
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
	  FROM un_co_dept_ord_hazards_sig
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
   PRINT 'dbo.DepartmentHazardSigRemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentHazardSigRemainingSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPeopleSelectByName Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPeopleSelectByName Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPeopleSelectByName]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@sequence int
)
AS
	SET NOCOUNT ON;
SELECT      *
FROM        un_co_dept_ord_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			order_seq = @order_seq
AND			name_desc = @name_desc
AND			flg_delete = 0
AND			(@sequence IS NULL OR @sequence = 0 OR sequence <> @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPeopleSelectByName Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPeopleSelectByName Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonInsert Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonInsert Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonInsert]
(
	@dept_id int,
	@co_id	int,
	@order_seq int,
	@name_desc varchar(255),
	@user_id int,
	@flg_supervisor bit,
	@flg_first_aider bit,
	@flg_fire_warden bit,
	@flg_engaged bit
)
AS
	SET NOCOUNT ON;
INSERT INTO un_co_dept_ord_people(dept_id,co_id,order_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,flg_supervisor,flg_first_aider,flg_fire_warden,flg_engaged)
VALUES (@dept_id,@co_id,@order_seq,@name_desc,@user_id,GETDATE(),@user_id,GETDATE(),@flg_supervisor,@flg_first_aider,@flg_fire_warden,@flg_engaged);

SELECT *
FROM un_co_dept_ord_people
WHERE sequence = @@IDENTITY;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonInsert Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonInsert Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonSelect]
(
	@dept_id int,
	@co_id	int
)
AS
	SET NOCOUNT ON;
SELECT     sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended, flg_fire_warden, flg_first_aider, flg_supervisor, 0 as superrvisor_check, 0 as firstaiderr_check, 0 as firewardenn_check, 0 as engagedd_check  
FROM       dbo.un_ref_co_dept_people
WHERE		co_id = @co_id
AND		    dept_id = @dept_id
AND			flg_deleted = 0')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentOrderPersonSelectCommandForEdit Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentOrderPersonSelectCommandForEdit Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentOrderPersonSelectCommandForEdit]
@dept_id int,
@co_id int,
@order_seq int 
AS
BEGIN
SELECT A.*,B.flg_supervisor as superrvisor_check, B.flg_first_aider as firstaiderr_check, B.flg_fire_warden as firewardenn_check FROM
(SELECT *
  FROM dbo.un_ref_co_dept_people
where un_ref_co_dept_people.co_id = @co_id
and un_ref_co_dept_people.dept_id = @dept_id
and un_ref_co_dept_people.flg_deleted = 0) A 
LEFT OUTER JOIN 
(SELECT *
 FROM un_co_dept_ord_people
where un_co_dept_ord_people.co_id = @co_id
and un_co_dept_ord_people.dept_id = @dept_id 
and un_co_dept_ord_people.order_seq = @order_seq
and un_co_dept_ord_people.flg_delete = 0) B
ON A.name_desc = B.name_desc
END')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonSelectCommandForEdit Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentOrderPersonSelectCommandForEdit Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderPersonUpdate Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentOrderPersonUpdate Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentOrderPersonUpdate]
(
	@name_desc varchar(255),
	@user_id int,
	@sequence int,
	@flg_supervisor bit,
	@flg_fire_warden bit,
	@flg_engaged bit,
	@flg_first_aider bit,
	@original_sequence int
)
AS
	SET NOCOUNT ON;
UPDATE un_co_dept_ord_people SET name_desc = @name_desc,flg_supervisor = @flg_supervisor,flg_fire_warden = @flg_fire_warden,
	flg_engaged = @flg_engaged,flg_first_aider = @flg_first_aider,last_amended_by = @user_id,date_last_amended = GETDATE()
WHERE sequence = @original_sequence;

SELECT *
FROM un_co_dept_ord_people
WHERE sequence = @sequence;')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentOrderPersonUpdate Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentOrderPersonUpdate Procedure'
END
GO

--
-- Script To Update dbo.DepartmentOrderSearchCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
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
@from_date DateTime,
@to_date DateTime,
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
and (@from_date IS null  or un_co_dept_ords.date_created >= convert(datetime,@from_date,0))
and (@to_date IS null  or un_co_dept_ords.date_created <= dateadd(d,1,convert(datetime,@to_date,0)))
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
-- Script To Update dbo.DepartmentPeopleInsertCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPeopleInsertCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPeopleInsertCommand]
(
	@dept_id int,
	@co_id int,
	@name_desc varchar(255),
	@user_id int,
	@flg_supervisor bit,
	@flg_first_aider bit,
	@flg_fire_warden bit
)

AS
	SET NOCOUNT OFF;
declare @index_seq int;

SELECT @index_seq=ISNULL(MAX(index_seq),0) + 1 FROM [un_ref_co_dept_people];
INSERT INTO [un_ref_co_dept_people] ([flg_deleted], [dept_id], [co_id], [index_seq], [name_desc], [created_by], [date_created], [last_ammended_by], [date_last_amended], [flg_supervisor], [flg_first_aider], [flg_fire_warden]) 
VALUES (0, @dept_id, @co_id,@index_seq , @name_desc, @user_id, GETDATE(), @user_id, GETDATE(),@flg_supervisor,@flg_first_aider,@flg_fire_warden);
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended FROM un_ref_co_dept_people WHERE (sequence = SCOPE_IDENTITY())')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleInsertCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPeopleInsertCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPeopleRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPeopleRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentPeopleRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      *
FROM        un_ref_co_dept_people
WHERE		co_id = @co_id
AND			dept_id = @dept_id
AND			flg_deleted = 0
AND name_desc NOT IN
(
	SELECT name_desc 
	  FROM un_co_dept_ord_people
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleRemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPeopleRemainingSelect Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPeopleSelectByDeptId Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPeopleSelectByDeptId Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPeopleSelectByDeptId]
	@dept_id int,
	@co_id int
AS
	SET NOCOUNT ON;
SELECT      sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended, flg_supervisor, flg_first_aider, flg_fire_warden
FROM        un_ref_co_dept_people
WHERE		un_ref_co_dept_people.co_id = @co_id
AND			un_ref_co_dept_people.dept_id = @dept_id
AND			un_ref_co_dept_people.flg_deleted = 0
ORDER BY	un_ref_co_dept_people.index_seq desc')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleSelectByDeptId Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPeopleSelectByDeptId Procedure'
END
GO

--
-- Script To Update dbo.DepartmentPeopleUpdateCommand Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating dbo.DepartmentPeopleUpdateCommand Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('ALTER PROCEDURE [dbo].[DepartmentPeopleUpdateCommand]
(
	@dept_id int,
	@name_desc varchar(255),
	@index_seq int,
	@user_id int,
	@Original_sequence int,
	@sequence int,
	@flg_supervisor bit,
	@flg_first_aider bit,
	@flg_fire_warden bit
)
AS
	SET NOCOUNT OFF;
UPDATE [un_ref_co_dept_people] SET [dept_id] = @dept_id, [name_desc] = @name_desc,[index_seq]=@index_seq, [last_ammended_by] = @user_id, [date_last_amended] = GETDATE(),[flg_supervisor] = @flg_supervisor,[flg_first_aider] = @flg_first_aider,[flg_fire_warden]= @flg_fire_warden WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_deleted, dept_id, co_id, index_seq, name_desc, created_by, date_created, last_ammended_by, date_last_amended FROM un_ref_co_dept_people WHERE (sequence = @sequence)')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPeopleUpdateCommand Procedure Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update dbo.DepartmentPeopleUpdateCommand Procedure'
END
GO

--
-- Script To Create dbo.DepartmentPPERemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentPPERemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE  PROCEDURE [dbo].[DepartmentPPERemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_ppe.*
FROM        un_ref_co_dept_ppe
WHERE		un_ref_co_dept_ppe.co_id = @co_id
AND			un_ref_co_dept_ppe.dept_id = @dept_id
AND			un_ref_co_dept_ppe.flg_deleted = 0
AND name_desc NOT IN
(
	SELECT ppe_desc 
	  FROM un_co_dept_ord_ppe
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	un_ref_co_dept_ppe.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentPPERemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentPPERemainingSelect Procedure'
END
GO

--
-- Script To Create dbo.DepartmentToolRemainingSelect Procedure In localhost\SQLEXPRESS.unchs_release
-- Generated Tuesday, August 4, 2009, at 11:51 PM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Creating dbo.DepartmentToolRemainingSelect Procedure'
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL ON
GO

SET NUMERIC_ROUNDABORT OFF
GO


exec('CREATE PROCEDURE [dbo].[DepartmentToolRemainingSelect]
	@dept_id int,
	@co_id int,
	@dept_order_id int
AS
	SET NOCOUNT ON;
SELECT      un_ref_co_dept_tools.*
FROM        un_ref_co_dept_tools
WHERE		un_ref_co_dept_tools.co_id = @co_id
AND			un_ref_co_dept_tools.dept_id = @dept_id
AND			un_ref_co_dept_tools.flg_deleted = 0
AND name_desc NOT IN
(
	SELECT tool_desc 
	  FROM un_co_dept_ord_tools
     WHERE co_id = @co_id
	   AND dept_id = @dept_id
	   AND order_seq = @dept_order_id
	   AND flg_delete = 0
)
ORDER BY	un_ref_co_dept_tools.index_seq')
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'dbo.DepartmentToolRemainingSelect Procedure Added Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Add dbo.DepartmentToolRemainingSelect Procedure'
END
GO