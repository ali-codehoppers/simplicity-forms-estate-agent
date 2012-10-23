BEGIN 

DECLARE @sourceCoId int;
DECLARE @sourceDeptId int;
DECLARE @targetCoId int;
DECLARE @targetDeptId int;

SET @sourceCoId = 1;
SET @sourceDeptId = 1;
SET @targetCoId = 21;
SET @targetDeptId = 23;

/*INSERT INTO un_co_dept_categories(co_id,dept_id,category_name,category_type,flg_delete)
select @targetCoId,@targetDeptId,category_name,category_type,flg_delete
  from un_co_dept_categories
where co_id = @sourceCoId
and dept_id = @sourceDeptId;*/ 
/****** all cats copied in docs script ******/

insert into un_ref_co_dept_hazards(flg_deleted,dept_id,co_id,index_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,category_id,flg_default)
select un_ref_co_dept_hazards.flg_deleted,@targetDeptId,@targetCoId,un_ref_co_dept_hazards.index_seq,un_ref_co_dept_hazards.name_desc,un_ref_co_dept_hazards.created_by,un_ref_co_dept_hazards.date_created,un_ref_co_dept_hazards.last_amended_by,un_ref_co_dept_hazards.date_last_amended,cats.category_id,un_ref_co_dept_hazards.flg_default
  from un_ref_co_dept_hazards 
inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_hazards.category_id
and un_co_dept_categories.co_id = un_ref_co_dept_hazards.co_id
and un_co_dept_categories.dept_id = un_ref_co_dept_hazards.dept_id
inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
where un_co_dept_categories.co_id = @sourceCoId
and un_co_dept_categories.dept_id = @sourceDeptId 
and cats.co_id = @targetCoId
and cats.dept_id = @targetDeptId
and cats.category_type = 'H';

insert into un_ref_co_dept_ppe(flg_deleted,dept_id,co_id,index_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,category_id,flg_default)
select un_ref_co_dept_ppe.flg_deleted,@targetDeptId,@targetCoId,un_ref_co_dept_ppe.index_seq,un_ref_co_dept_ppe.name_desc,un_ref_co_dept_ppe.created_by,un_ref_co_dept_ppe.date_created,un_ref_co_dept_ppe.last_amended_by,un_ref_co_dept_ppe.date_last_amended,cats.category_id,un_ref_co_dept_ppe.flg_default
  from un_ref_co_dept_ppe 
inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_ppe.category_id
and un_co_dept_categories.co_id = un_ref_co_dept_ppe.co_id
and un_co_dept_categories.dept_id = un_ref_co_dept_ppe.dept_id
inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
where un_co_dept_categories.co_id = @sourceCoId
and un_co_dept_categories.dept_id = @sourceDeptId 
and cats.co_id = @targetCoId
and cats.dept_id = @targetDeptId
and cats.category_type = 'P';

insert into un_ref_co_dept_tools(flg_deleted,dept_id,co_id,index_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,category_id,flg_default)
select un_ref_co_dept_tools.flg_deleted,@targetDeptId,@targetCoId,un_ref_co_dept_tools.index_seq,un_ref_co_dept_tools.name_desc,un_ref_co_dept_tools.created_by,un_ref_co_dept_tools.date_created,un_ref_co_dept_tools.last_amended_by,un_ref_co_dept_tools.date_last_amended,cats.category_id,un_ref_co_dept_tools.flg_default
  from un_ref_co_dept_tools 
inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_tools.category_id
and un_co_dept_categories.co_id = un_ref_co_dept_tools.co_id
and un_co_dept_categories.dept_id = un_ref_co_dept_tools.dept_id
inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
where un_co_dept_categories.co_id = @sourceCoId
and un_co_dept_categories.dept_id = @sourceDeptId 
and cats.co_id = @targetCoId
and cats.dept_id = @targetDeptId
and cats.category_type = 'T';


insert into un_ref_co_dept_suggestions(co_id,dept_id,flg_deleted,category_id,suggestion_text,index_seq,suggestion_type,flg_default)
select @targetCoId,@targetDeptId,un_ref_co_dept_suggestions.flg_deleted,cats.category_id,un_ref_co_dept_suggestions.suggestion_text,un_ref_co_dept_suggestions.index_seq,un_ref_co_dept_suggestions.suggestion_type,un_ref_co_dept_suggestions.flg_default
  from un_ref_co_dept_suggestions 
inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_suggestions.category_id
and un_co_dept_categories.co_id = un_ref_co_dept_suggestions.co_id
and un_co_dept_categories.dept_id = un_ref_co_dept_suggestions.dept_id
inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
where un_co_dept_categories.co_id = @sourceCoId
and un_co_dept_categories.dept_id = @sourceDeptId 
and cats.co_id = @targetCoId
and cats.dept_id = @targetDeptId

END