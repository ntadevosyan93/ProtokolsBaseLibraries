CREATE VIEW dbo.View_WT
AS
SELECT        wt.id, wt.date_in, wt.user_in, wt.idm_empl, v_kad.fio_short, wt.estimated_start, wt.estimated_stop, wt.actual_start, wt.actual_stop, wt.del, wt.break_start, wt.break_stop, wt.break_time, wt.idm_status, 
                         k_status.klass_value AS status_t, wt.idm_depart, depart.text AS depart_t, wt.freeDay, wt.comment, wt.handmark, wt.from_1c, wt.curatorComment, wt.actual_start_2, wt.actual_stop_2, wt.freeDay_2, wt.sb_ok, 
                         wt.user_cor, wt.date_cor, wt.idm_violation, wt.idm_breakdown, wt.comment_it, wt.idm_doljn, dbo.KAD$DOLJN.text AS doljn_t, wt.first_checkIn, wt.is_lock
FROM            dbo.KAD$WORK_TIME AS wt INNER JOIN
                         dbo.KAD$DOLJN ON wt.idm_doljn = dbo.KAD$DOLJN.id LEFT OUTER JOIN
                         dbo.View$KAD$EMPLOYEE AS v_kad ON v_kad.id = wt.idm_empl LEFT OUTER JOIN
                         dbo.KLASS AS k_status ON k_status.klass_name = 'wt_status' AND k_status.klass_id = wt.idm_status LEFT OUTER JOIN
                         dbo.DEPARTMENTS AS depart ON depart.id = wt.idm_depart LEFT OUTER JOIN
                         dbo.KAD$DOLJN AS doljn ON doljn.id = wt.idm_doljn
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_WT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'h = 1500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_WT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[51] 2[22] 3) )"
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
         Begin Table = "wt"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 347
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "v_kad"
            Begin Extent = 
               Top = 225
               Left = 165
               Bottom = 355
               Right = 339
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "k_status"
            Begin Extent = 
               Top = 6
               Left = 469
               Bottom = 136
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "depart"
            Begin Extent = 
               Top = 6
               Left = 688
               Bottom = 136
               Right = 862
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "doljn"
            Begin Extent = 
               Top = 6
               Left = 900
               Bottom = 136
               Right = 1074
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KAD$DOLJN"
            Begin Extent = 
               Top = 214
               Left = 688
               Bottom = 344
               Right = 862
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
         Widt', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_WT';

