update un_co_dept_template_sections
  set section_type = 'FREE_TEXT';

update un_co_dept_template_sections 
set un_co_dept_template_sections.doc_type_id = (select types.doc_data_type_id
from un_co_dept_doc_type as types
where types.co_id = un_co_dept_template_sections.co_id
and types.dept_id = un_co_dept_template_sections.dept_id
and types.doc_data_type_desc = 'Risk Assessments');

alter table un_co_dept_template_sections 
alter column section_type varchar(50) not null;

alter table un_co_dept_template_sections 
alter column doc_type_id int not null;

insert into un_co_dept_doc_type(co_id,dept_id,doc_data_type_desc,flg_delete,sort_order,field_type,
	generator_class,[required])
select co_id,dept_id,'COSHH Documents',0,6,'detail','COSHHGenerator',0
from un_co_dept_details;