

CREATE VIEW [dbo].[View$RD$TASK]
AS
SELECT        KLASS_1.klass_value AS status_t, dbo.RD$TASK.del, dbo.RD$TASK.id, dbo.RD$TASK.date_in, dbo.RD$TASK.user_in, dbo.RD$TASK.text, dbo.RD$TASK.tema, dbo.RD$TASK.status, dbo.RD$TASK.date_start, 
                         dbo.RD$TASK.date_stop, dbo.RD$TASK.day_stop, dbo.RD$TASK.date_fact_stop, dbo.RD$TASK.vazhnost, dbo.KLASS.klass_value AS vazhnost_t, dbo.RD$TASK.idm_isp, 
                         dbo.KAD$EMPLOYEE.fam + ' ' + dbo.KAD$EMPLOYEE.name + ' ' + dbo.KAD$EMPLOYEE.otch AS isp_fio, dbo.RD$TASK.idm_project, dbo.RD$TASK.idm_kontrol, dbo.RD$TASK.idm_task, dbo.RD$TASK.idm_author, 
                         dbo.RD$TASK.cost_fact, dbo.RD$TASK.cost, dbo.RD$TASK.guid, dbo.RD$TASK.idm_otdel, dbo.RD$TASK.idm_departments, dbo.DEPARTMENTS.text AS kaotdel, a.fio_short AS autor, b.fio_short AS ispoln, 
                         KLASS_1.klass_value_int AS role_status, dbo.RD$TASK.arhive, Tview.date_in AS kontrol_dateR, k.fio_short AS kontrol_f, 
						 isnull(importantly,0) importantly
FROM            dbo.RD$TASK LEFT OUTER JOIN
                         dbo.DEPARTMENTS ON dbo.RD$TASK.idm_departments = dbo.DEPARTMENTS.id LEFT OUTER JOIN
                         dbo.KAD$EMPLOYEE ON dbo.RD$TASK.idm_isp = dbo.KAD$EMPLOYEE.id LEFT OUTER JOIN
                         dbo.KLASS ON dbo.RD$TASK.vazhnost = dbo.KLASS.klass_id LEFT OUTER JOIN
                         dbo.KLASS AS KLASS_1 ON dbo.RD$TASK.status = KLASS_1.klass_id LEFT OUTER JOIN
                         dbo.View$KAD$EMPLOYEE AS a ON a.id = dbo.RD$TASK.idm_author LEFT OUTER JOIN
                         dbo.View$KAD$EMPLOYEE AS b ON b.id = dbo.RD$TASK.idm_isp LEFT OUTER JOIN
                         dbo.View$KAD$EMPLOYEE AS k ON k.id = dbo.RD$TASK.idm_kontrol LEFT OUTER JOIN
                         dbo.RD$TASK_FIRST_VIEW AS Tview ON Tview.idm_empl = dbo.RD$TASK.idm_kontrol AND Tview.idm_task = dbo.RD$TASK.id
WHERE        (KLASS_1.klass_name = 'rd_task_status') AND (dbo.RD$TASK.del = 0) AND (dbo.KLASS.klass_name = 'rd_task_vazhnost')
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RD$TASK';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'        TopColumn = 0
         End
         Begin Table = "k"
            Begin Extent = 
               Top = 138
               Left = 847
               Bottom = 268
               Right = 1021
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tview"
            Begin Extent = 
               Top = 138
               Left = 1059
               Bottom = 268
               Right = 1233
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
      Begin ColumnWidths = 33
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RD$TASK';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[17] 4[46] 2[20] 3) )"
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
         Begin Table = "RD$TASK"
            Begin Extent = 
               Top = 0
               Left = 35
               Bottom = 260
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "DEPARTMENTS"
            Begin Extent = 
               Top = 193
               Left = 452
               Bottom = 298
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KAD$EMPLOYEE"
            Begin Extent = 
               Top = 85
               Left = 276
               Bottom = 193
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KLASS"
            Begin Extent = 
               Top = 50
               Left = 649
               Bottom = 179
               Right = 809
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "KLASS_1"
            Begin Extent = 
               Top = 0
               Left = 402
               Bottom = 164
               Right = 562
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 847
               Bottom = 136
               Right = 1021
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 1059
               Bottom = 136
               Right = 1233
            End
            DisplayFlags = 280
    ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RD$TASK';

