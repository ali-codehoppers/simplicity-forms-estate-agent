update un_co_details SET flg_show_wizard = 0;

alter table un_co_details alter column flg_show_wizard bit not null;