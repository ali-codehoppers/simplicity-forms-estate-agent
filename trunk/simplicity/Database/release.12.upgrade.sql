Delete from un_co_dept_doc_type where doc_data_type_desc = 'Signage';

INSERT INTO un_co_dept_doc_type (doc_data_type_desc,flg_delete,co_id,dept_id,sort_order,field_type,generator_class,[required],style,flg_landscape,flg_checked,category)
SELECT 'Signage',0,co_id,dept_id,1,'detail','SignageGenerator',1,null,0,0,'Signage'
FROM un_co_dept_details;

update un_co_details set order_sms_count = (SELECT MAX(CAST(order_sms AS int)) FROM un_co_dept_ords WHERE order_sms LIKE '%[0-9]%');

alter table un_co_details alter column order_sms_count int not null;