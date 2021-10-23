CREATE VIEW dbo.View$HRM$REQ_CANDIDATE
AS
SELECT        h_req.id AS req_id, h_req.guid AS req_guid, dbo.HRM$REQ_CANDIDATE.idm_candidate, doljn.text AS doljn_t, cand.fio, cand.date_birth, dep.text AS depart_t, h_req.estimated_start_date, 
                         (CASE h_req.drug WHEN NULL THEN 'нет' WHEN 0 THEN 'да' WHEN 1 THEN 'нет' END) AS drug_t, Employment.klass_value AS type_employment_t, (CASE WHEN h_req.schedule IS NULL 
                         THEN '' ELSE shedule.klass_value + ' ' END) + (CASE WHEN h_req.schedule_description IS NULL THEN '' ELSE ' (' + h_req.schedule_description + ')' END) AS shedule_t, dbo.HRM$REQ_CANDIDATE.status, 
                         k_status.klass_value AS status_t, dbo.HRM$REQ_CANDIDATE.id AS id_reqCandidate
FROM            dbo.HRM$REQ AS h_req WITH (nolock) LEFT OUTER JOIN
                         dbo.HRM$REQ_CANDIDATE WITH (nolock) ON dbo.HRM$REQ_CANDIDATE.idm_req = h_req.id AND dbo.HRM$REQ_CANDIDATE.del = 0 LEFT OUTER JOIN
                         dbo.KAD$DOLJN AS doljn WITH (nolock) ON doljn.id = h_req.idm_doljn LEFT OUTER JOIN
                         dbo.HRM$CANDIDATE AS cand WITH (nolock) ON cand.id = dbo.HRM$REQ_CANDIDATE.idm_candidate LEFT OUTER JOIN
                         dbo.DEPARTMENTS AS dep WITH (nolock) ON dep.id = h_req.idm_departments LEFT OUTER JOIN
                         dbo.KLASS AS Employment ON Employment.klass_name = 'type_employment' AND Employment.klass_id = dbo.HRM$REQ_CANDIDATE.type_employment LEFT OUTER JOIN
                         dbo.KLASS AS shedule ON shedule.klass_name = 'hrmReq_shedule' AND shedule.klass_id = h_req.schedule LEFT OUTER JOIN
                         dbo.KLASS AS k_status ON k_status.klass_name = 'status_depart' AND k_status.klass_id = dbo.HRM$REQ_CANDIDATE.status
WHERE        (h_req.del = 0) AND (NOT (dbo.HRM$REQ_CANDIDATE.idm_candidate IS NULL))
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$HRM$REQ_CANDIDATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'           TopColumn = 0
         End
         Begin Table = "k_status"
            Begin Extent = 
               Top = 138
               Left = 257
               Bottom = 268
               Right = 438
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$HRM$REQ_CANDIDATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[41] 2[27] 3) )"
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
         Begin Table = "h_req"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM$REQ_CANDIDATE"
            Begin Extent = 
               Top = 6
               Left = 296
               Bottom = 136
               Right = 481
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "doljn"
            Begin Extent = 
               Top = 6
               Left = 519
               Bottom = 136
               Right = 693
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cand"
            Begin Extent = 
               Top = 6
               Left = 731
               Bottom = 136
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dep"
            Begin Extent = 
               Top = 6
               Left = 954
               Bottom = 136
               Right = 1128
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employment"
            Begin Extent = 
               Top = 6
               Left = 1166
               Bottom = 136
               Right = 1347
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "shedule"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 219
            End
            DisplayFlags = 280
 ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$HRM$REQ_CANDIDATE';

