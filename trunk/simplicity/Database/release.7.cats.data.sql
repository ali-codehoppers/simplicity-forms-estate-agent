insert into un_co_dept_categories(co_id,dept_id,category_name,category_type,flg_delete)
select co_id,dept_id,'[Uncategorized]','D',0 from un_co_dept_details;

insert into un_co_dept_categories(co_id,dept_id,category_name,category_type,flg_delete)
select co_id,dept_id,'[Uncategorized]','T',0 from un_co_dept_details;

insert into un_co_dept_categories(co_id,dept_id,category_name,category_type,flg_delete)
select co_id,dept_id,'[Uncategorized]','H',0 from un_co_dept_details;

insert into un_co_dept_categories(co_id,dept_id,category_name,category_type,flg_delete)
select co_id,dept_id,'[Uncategorized]','P',0 from un_co_dept_details;

update un_ref_co_dept_hazards 
set un_ref_co_dept_hazards.category_id = un_co_dept_categories.category_id
from un_ref_co_dept_hazards
inner join un_co_dept_categories 
on un_co_dept_categories.co_id = un_ref_co_dept_hazards.co_id
and un_co_dept_categories.dept_id = un_ref_co_dept_hazards.dept_id
where un_co_dept_categories.category_type = 'H';

ALTER table un_ref_co_dept_hazards alter column category_id int not null;

update un_ref_co_dept_ppe 
set un_ref_co_dept_ppe.category_id = un_co_dept_categories.category_id
from un_ref_co_dept_ppe
inner join un_co_dept_categories 
on un_co_dept_categories.co_id = un_ref_co_dept_ppe.co_id
and un_co_dept_categories.dept_id = un_ref_co_dept_ppe.dept_id
where un_co_dept_categories.category_type = 'P';

ALTER table un_ref_co_dept_ppe alter column category_id int not null;

update un_ref_co_dept_tools 
set un_ref_co_dept_tools.category_id = un_co_dept_categories.category_id
from un_ref_co_dept_tools
inner join un_co_dept_categories 
on un_co_dept_categories.co_id = un_ref_co_dept_tools.co_id
and un_co_dept_categories.dept_id = un_ref_co_dept_tools.dept_id
where un_co_dept_categories.category_type = 'T';

ALTER table un_ref_co_dept_tools alter column category_id int not null;

update un_co_dept_template_docs 
set un_co_dept_template_docs.category_id = un_co_dept_categories.category_id
from un_co_dept_template_docs
inner join un_co_dept_categories 
on un_co_dept_categories.co_id = un_co_dept_template_docs.co_id
and un_co_dept_categories.dept_id = un_co_dept_template_docs.dept_id
where un_co_dept_categories.category_type = 'D';

ALTER table un_ref_co_dept_tools alter column category_id int not null;

