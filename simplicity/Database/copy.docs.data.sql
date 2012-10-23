BEGIN 

DECLARE @sourceCoId int;
DECLARE @sourceDeptId int;
DECLARE @sourceDocTypeId int;
DECLARE @targetCoId int;
DECLARE @targetDeptId int;


-- SET THE SOURCE IDS to where the data is to be copied from
-- Set the Target IDs to where the data is to be copied to. Make sure these Company and Department already exist. 
SET @sourceCoId = 1;
SET @sourceDeptId = 1;
SET @sourceDocTypeId = 1;
SET @targetCoId = 21;
SET @targetDeptId = 23;



--Document Types are wrt Co,Dept therefore first we need to copy them. to the target.
INSERT INTO un_co_dept_doc_type (doc_data_type_desc,flg_delete,co_id,dept_id,sort_order,field_type,generator_class,[required],style,flg_landscape,num_of_sections,flg_checked,category)
SELECT doc_data_type_desc,flg_delete,@targetCoId,@targetDeptId,sort_order,field_type,generator_class,[required],style,flg_landscape,num_of_sections,flg_checked,category
FROM un_co_dept_doc_type
WHERE co_id = @sourceCoId 
AND dept_id = @sourceDeptId;


--The documents can be categorized. We need to copy the categories from source to target also. 
INSERT INTO un_co_dept_categories (dept_id,co_id,category_name,category_type,flg_delete)
SELECT @targetDeptId,@targetCoId,category_name,category_type,flg_delete
FROM un_co_dept_categories
WHERE co_id = @sourceCoId 
AND dept_id = @sourceDeptId;

-- Inset the document sections, these are generic sections based on co and dept. 
insert into un_co_dept_template_sections(flg_delete,co_id,dept_id,section_index,section_desc,section_type,doc_type_id,repeat_columns)
select un_co_dept_template_sections.flg_delete,@targetCoId,@targetDeptId,section_index,section_desc,section_type,docTypes.doc_data_type_id,repeat_columns
from un_co_dept_template_sections
inner join un_co_dept_doc_type 
on un_co_dept_doc_type.co_id = un_co_dept_template_sections.co_id
and un_co_dept_doc_type.dept_id = un_co_dept_template_sections.dept_id
and un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_sections.doc_type_id
inner join un_co_dept_doc_type docTypes on un_co_dept_doc_type.doc_data_type_desc = docTypes.doc_data_type_desc
where un_co_dept_template_sections.co_id = @sourceCoId
and un_co_dept_template_sections.dept_id = @sourceDeptId
and un_co_dept_doc_type.co_id = @sourceCoId
and un_co_dept_doc_type.dept_id = @sourceDeptId
and docTypes.co_id = @targetCoId
and docTypes.dept_id = @targetDeptId;

--Insert the document section details
insert into un_co_dept_template_section_details(section_id,co_id,dept_id,section_detail_index,section_detail_desc,flg_delete)
select sections.section_id,@targetCoId,@targetDeptId,section_detail_index,section_detail_desc,un_co_dept_template_section_details.flg_delete
  from un_co_dept_template_section_details
 inner join un_co_dept_template_sections 
 on  un_co_dept_template_section_details.co_id = un_co_dept_template_sections.co_id
 and un_co_dept_template_section_details.dept_id = un_co_dept_template_sections.dept_id
 and un_co_dept_template_section_details.section_id = un_co_dept_template_sections.section_id
 inner join un_co_dept_template_sections as sections on sections.section_desc = un_co_dept_template_sections.section_desc
 where un_co_dept_template_section_details.co_id = @sourceCoId
   and un_co_dept_template_section_details.dept_id = @sourceDeptId
   and sections.co_id = @targetCoId
   and sections.dept_id = @targetDeptId;
  
--Insert the documents. For this we need to join the document type on the basis of name and category_id on the basis of name
insert into un_co_dept_template_docs(co_id,dept_id,doc_type_id,doc_name,doc_desc,doc_code,flg_delete,doc_index,category_id,related_doc_codes,flg_default)
select @targetCoId,@targetDeptId,doc_type.doc_data_type_id,un_co_dept_template_docs.doc_name,un_co_dept_template_docs.doc_desc,un_co_dept_template_docs.doc_code,
	un_co_dept_template_docs.flg_delete,doc_index,cats.category_id,related_doc_codes,flg_default
from un_co_dept_template_docs
inner join un_co_dept_doc_type on un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_docs.doc_type_id
and un_co_dept_doc_type.co_id = un_co_dept_template_docs.co_id
and un_co_dept_doc_type.dept_id = un_co_dept_template_docs.dept_id
inner join un_co_dept_categories on un_co_dept_template_docs.category_id = un_co_dept_categories.category_id
and un_co_dept_categories.co_id = un_co_dept_template_docs.co_id
and un_co_dept_categories.dept_id = un_co_dept_template_docs.dept_id
inner join un_co_dept_doc_type as doc_type on doc_type.doc_data_type_desc = un_co_dept_doc_type.doc_data_type_desc
inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name
where un_co_dept_doc_type.dept_id = @sourceDeptId
and un_co_dept_doc_type.co_id = @sourceCoId
and doc_type.co_id = @targetCoId
and doc_type.dept_id = @targetDeptId
and cats.co_id = @targetCoId
and cats.dept_id = @targetDeptId
and cats.category_type = 'D';

-- insert document items

insert into un_co_dept_template_items(co_id,dept_id,section_id,doc_id,item_name,item_index,section_detail_id)
select secs2.co_id,secs2.dept_id,secs2.section_id,docs2.doc_id,items.item_name,items.item_index,section_detail_id
 from un_co_dept_template_items as items
inner join un_co_dept_template_docs as docs on docs.doc_id = items.doc_id
and docs.co_id = items.co_id
and docs.dept_id = items.dept_id
inner join un_co_dept_template_docs docs2 on docs.doc_name = docs2.doc_name
inner join un_co_dept_template_sections as secs on secs.section_id = items.section_id
and secs.co_id = items.co_id
and secs.dept_id = items.dept_id
inner join un_co_dept_template_sections secs2 on secs.section_desc = secs2.section_desc
where items.co_id = @sourceCoId
and items.dept_id = @sourceDeptId
and docs2.co_id = @targetCoId
and docs2.dept_id = @targetDeptId
and secs2.co_id = @targetCoId
and secs2.dept_id = @targetDeptId;

END;

