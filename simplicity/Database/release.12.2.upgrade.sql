Update un_co_dept_doc_type set category = 'COSHH' where doc_data_type_desc = 'COSHH Documents';

update un_co_dept_doc_type set category = 'Method Statement' where category IS NULL;