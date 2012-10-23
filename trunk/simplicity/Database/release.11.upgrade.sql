update un_co_dept_ords set risk_taking = 'Low';

alter table un_co_dept_ords
alter column risk_taking varchar(20) null;