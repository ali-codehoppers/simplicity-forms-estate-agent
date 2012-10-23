--
-- Script To Update Data In localhost\SQLEXPRESS.unchs_release
-- Generated Friday, September 25, 2009, at 12:52 AM
--
-- Please backup localhost\SQLEXPRESS.unchs_release before executing this script
--


SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, QUOTED_IDENTIFIER, CONCAT_NULL_YIELDS_NULL, XACT_ABORT ON
GO
SET NUMERIC_ROUNDABORT OFF
GO

BEGIN TRANSACTION

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   COMMIT TRANSACTION
GO

BEGIN TRANSACTION

SET IDENTITY_INSERT [dbo].[un_co_dept_template_section_details] ON
GO
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (5, 36, 1, 1, 1, 'Yes', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (6, 36, 1, 1, 2, 'No', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (7, 39, 1, 1, 1, 'Extremely flammable?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (8, 39, 1, 1, 2, 'Highly flammable?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (9, 39, 1, 1, 3, 'Flammable?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (10, 39, 1, 1, 4, 'Asphyxiate', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (11, 39, 1, 1, 5, 'Oxidising?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (12, 39, 1, 1, 6, 'Harmful?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (13, 39, 1, 1, 7, 'Toxic?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (14, 39, 1, 1, 8, 'Very toxic?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (15, 39, 1, 1, 9, 'Corrosive?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (16, 39, 1, 1, 10, 'Irritant?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (17, 39, 1, 1, 11, 'Sensitising?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (18, 39, 1, 1, 12, 'Other? (Specify below.)', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (19, 39, 1, 1, 13, 'Dangerous to the environment', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (20, 39, 1, 1, 14, 'Flash Point degrees C N/A', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (21, 40, 1, 1, 1, 'In contact with skin?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (22, 40, 1, 1, 2, 'In contact with eyes?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (23, 40, 1, 1, 3, 'Breathed in?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (24, 40, 1, 1, 4, 'Swallowed?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (25, 40, 1, 1, 5, 'Other (Specify below)', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (26, 40, 1, 1, 6, 'Avoid contact with skin / eyes', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (27, 40, 1, 1, 7, 'Through broken skin', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (28, 45, 1, 1, 1, 'Yes', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (29, 45, 1, 1, 2, 'No', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (30, 47, 1, 1, 1, 'Eye protection?', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (31, 47, 1, 1, 2, 'Overalls/clothing? Overall (flame retardant)', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (32, 47, 1, 1, 3, 'Other? Statutory testing of LEV. Respiratiors', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (33, 47, 1, 1, 4, 'Gloves? Welders gauntlets', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (34, 47, 1, 1, 5, 'Mask/respirator? When welding 3m Adflo or', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (35, 49, 1, 1, 1, 'Yes', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (36, 49, 1, 1, 2, 'No', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (37, 60, 1, 1, 1, 'Yes', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (38, 60, 1, 1, 2, 'No', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (39, 61, 1, 1, 1, 'Yes', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (40, 61, 1, 1, 2, 'No', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (41, 63, 1, 1, 1, 'Yes', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (42, 63, 1, 1, 2, 'No', 0)
INSERT INTO [dbo].[un_co_dept_template_section_details]([section_detail_id], [section_id], [co_id], [dept_id], [section_detail_index], [section_detail_desc], [flg_delete]) VALUES (44, 64, 1, 1, 1, '1', 0)
SET IDENTITY_INSERT [dbo].[un_co_dept_template_section_details] OFF
GO
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'Data Update Of [dbo].[un_co_dept_template_section_details] Successfully Completed'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Data Update Of [dbo].[un_co_dept_template_section_details] Failed'
END
GO

BEGIN TRANSACTION

SET IDENTITY_INSERT [dbo].[un_co_dept_template_sections] ON
GO
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (16, 0, 1, 2, 11, '1. ACTIVITY /PROCESS BEING ASSESSED1', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (17, 0, 1, 2, 2, '2.REGULATIONS/CODES/GUIDANCE', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (18, 0, 1, 2, 3, '3. SIGNIFICANT HAZARDS', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (19, 0, 1, 2, 4, '4. PEOPLE AT RISK', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (20, 0, 1, 2, 5, '5. Frequency and Duration of Exposure to the Risk', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (21, 0, 1, 2, 6, '6. CONTROL MEASURES:', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (22, 0, 1, 2, 7, '7. RISK RATING WITH PRECAUTIONS:', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (23, 0, 1, 2, 8, 'LIKELIHOOD: ', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (24, 0, 1, 2, 9, 'SEVERITY + PROB: ', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (25, 0, 1, 2, 10, '8. MANAGEMENT ACTION:', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (26, 0, 1, 2, 11, '9. PRIORITY FOR ACTION (DATE)', 'FREE_TEXT', 10, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (32, 0, 1, 1, 1, 'Substance/material: ', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (33, 0, 1, 1, 2, 'Trade name: ', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (34, 0, 1, 1, 3, 'What is the substance used for? ', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (35, 0, 1, 1, 4, 'What are the hazardous ingredients/chemicals in the substance?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (36, 0, 1, 1, 5, 'Do any of the chemicals have a: (Obtainable from MSDS or EH40) ', 'MULTIPLE_SELECT_LIST', 12, 2)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (37, 0, 1, 1, 6, 'Maximum Exposure Limit? ', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (38, 0, 1, 1, 7, 'Occupational Exposure Standard? ', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (39, 0, 1, 1, 8, 'Is the substance: (Check for an orange CHIP square on the product data sheet or packaging.)', 'MULTIPLE_SELECT_LIST', 12, 4)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (40, 0, 1, 1, 9, 'Is the substance hazardous to health when:', 'MULTIPLE_SELECT_LIST', 12, 3)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (41, 0, 1, 1, 10, 'How should the substance be used?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (42, 0, 1, 1, 11, 'How much is used every week?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (43, 0, 1, 1, 12, 'Who is exposed to the substance?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (44, 0, 1, 1, 13, 'Does the substance present additional risks to certain groups or individuals?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (45, 0, 1, 1, 14, 'Can a less hazardous substance be used to do the same job?', 'MULTIPLE_SELECT_LIST', 12, 2)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (46, 0, 1, 1, 15, 'What controls are required for this substance, other than Personal Protective Equipment (PPE)?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (47, 0, 1, 1, 16, 'Is any Personal Protective Equipment (PPE) required when using the substance?', 'MULTIPLE_SELECT_LIST', 12, 2)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (48, 0, 1, 1, 17, 'How should the substance be stored?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (49, 0, 1, 1, 18, 'Have persons using this substance been provided', 'MULTIPLE_SELECT_LIST', 12, 2)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (50, 0, 1, 1, 19, 'Spillages:', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (51, 0, 1, 1, 20, '   a) Swallowed?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (52, 0, 1, 1, 21, '   b) In contact with eyes?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (53, 0, 1, 1, 22, '   c) In contact with skin?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (54, 0, 1, 1, 23, '   d) Inhaled?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (55, 0, 1, 1, 24, '   e) Other?', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (56, 0, 1, 1, 25, 'Fire precautions:', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (57, 0, 1, 1, 26, 'Chemical reactions:', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (58, 0, 1, 1, 27, 'Disposal:', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (59, 0, 1, 1, 28, 'Health surveillance:', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (60, 0, 1, 1, 29, 'Do staff using the substance require any health surveillance?', 'MULTIPLE_SELECT_LIST', 12, 2)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (61, 0, 1, 1, 30, 'Are all the controls detailed above currently in place?', 'MULTIPLE_SELECT_LIST', 12, 2)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (62, 0, 1, 1, 31, 'Remedial actions required', 'FREE_TEXT', 12, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (63, 0, 1, 1, 32, 'Are hazards to health adequately controlled with all control measures in place?', 'MULTIPLE_SELECT_LIST', 12, 2)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (64, 0, 1, 1, 2, '1234', 'MULTIPLE_SELECT_LIST', 1, 12)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (65, 0, 1, 1, 1, 'test', 'FREE_TEXT', 1, NULL)
INSERT INTO [dbo].[un_co_dept_template_sections]([section_id], [flg_delete], [co_id], [dept_id], [section_index], [section_desc], [section_type], [doc_type_id], [repeat_columns]) VALUES (66, 0, 1, 1, 1, '1', 'FREE_TEXT', 1, NULL)
SET IDENTITY_INSERT [dbo].[un_co_dept_template_sections] OFF
GO
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'Data Update Of [dbo].[un_co_dept_template_sections] Successfully Completed'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Data Update Of [dbo].[un_co_dept_template_sections] Failed'
END
GO

BEGIN TRANSACTION

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   COMMIT TRANSACTION
GO
