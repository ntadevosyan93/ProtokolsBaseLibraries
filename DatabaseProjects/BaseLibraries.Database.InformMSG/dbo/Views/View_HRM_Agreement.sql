CREATE VIEW dbo.View$HRM_Agreement
AS
SELECT        agr.id AS agr_id, agr.guid AS agr_guid, doljn.text AS doljn_t, cand.fio, cand.date_birth, dep.text AS depart_t, agr.estimated_start_date, (CASE agr.drug WHEN NULL 
                         THEN 'нет' WHEN 0 THEN 'да' WHEN 1 THEN 'нет' END) AS drug_t, Employment.klass_value AS type_employment_t, (CASE WHEN agr.shedule IS NULL THEN '' ELSE shedule.klass_value + ' ' END) 
                         + (CASE WHEN agr.shedule_description IS NULL THEN '' ELSE ' (' + agr.shedule_description + ')' END) AS shedule_t, agr.idm_status, k_status.klass_value AS status_t, agr.idm_req_cand, 
                         dbo.HRM$REQ_CANDIDATE.status AS req_cand_status, agr.comment
FROM            dbo.HRM$REQ_Agreement AS agr WITH (nolock) INNER JOIN
                         dbo.HRM$REQ_CANDIDATE ON agr.idm_req_cand = dbo.HRM$REQ_CANDIDATE.id LEFT OUTER JOIN
                         dbo.KAD$DOLJN AS doljn WITH (nolock) ON doljn.id = agr.idm_doljn LEFT OUTER JOIN
                         dbo.HRM$CANDIDATE AS cand WITH (nolock) ON cand.id = agr.idm_candidate LEFT OUTER JOIN
                         dbo.DEPARTMENTS AS dep WITH (nolock) ON dep.id = agr.idm_depart LEFT OUTER JOIN
                         dbo.KLASS AS Employment ON Employment.klass_name = 'type_employment' AND Employment.klass_id = agr.idm_type_employment LEFT OUTER JOIN
                         dbo.KLASS AS shedule ON shedule.klass_name = 'hrmReq_shedule' AND shedule.klass_id = agr.shedule LEFT OUTER JOIN
                         dbo.KLASS AS k_status ON k_status.klass_name = 'hrm_agreementStatus' AND k_status.klass_id = agr.idm_status
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$HRM_Agreement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'280
            TopColumn = 0
         End
         Begin Table = "k_status"
            Begin Extent = 
               Top = 6
               Left = 0
               Bottom = 136
               Right = 181
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$HRM_Agreement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[14] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "agr"
            Begin Extent = 
               Top = 11
               Left = 336
               Bottom = 315
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM$REQ_CANDIDATE"
            Begin Extent = 
               Top = 201
               Left = 115
               Bottom = 381
               Right = 300
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "doljn"
            Begin Extent = 
               Top = 154
               Left = 0
               Bottom = 284
               Right = 174
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cand"
            Begin Extent = 
               Top = 16
               Left = 642
               Bottom = 163
               Right = 827
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dep"
            Begin Extent = 
               Top = 215
               Left = 1087
               Bottom = 345
               Right = 1261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employment"
            Begin Extent = 
               Top = 0
               Left = 950
               Bottom = 168
               Right = 1131
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "shedule"
            Begin Extent = 
               Top = 229
               Left = 643
               Bottom = 359
               Right = 824
            End
            DisplayFlags = ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$HRM_Agreement';

