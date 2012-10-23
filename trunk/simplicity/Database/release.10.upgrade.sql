update un_co_details set flg_active = 1;

alter table un_co_details alter column flg_active bit not null;

update un_co_user_details set [role] = 'User';

alter table un_co_user_details alter column [role] varchar(50) not null;

alter table un_co_user_details alter column co_id int null;

update un_co_dept_doc_type set flg_checked = 1;

alter table un_co_dept_doc_type alter column flg_checked bit not null;