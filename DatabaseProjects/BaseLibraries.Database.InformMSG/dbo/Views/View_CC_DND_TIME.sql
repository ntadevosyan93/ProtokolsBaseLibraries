CREATE VIEW dbo.View$CC$DND_TIME
AS
SELECT        phone AS Телефон, dnd_activated AS [Время  установки], CONVERT(varchar(20), GETDATE() - dnd_activated, 108) AS Длительность,
                             (SELECT        TOP (1) dbo.KAD$EMPLOYEE.fam + ' ' + dbo.KAD$EMPLOYEE.name + ' ' + dbo.KAD$EMPLOYEE.otch AS Expr1
                               FROM            dbo.PBX$CC$WORK_TIME LEFT OUTER JOIN
                                                         dbo.KAD$EMPLOYEE ON dbo.KAD$EMPLOYEE.id = dbo.PBX$CC$WORK_TIME.idm_employee
                               WHERE        (dbo.PBX$CC$WORK_TIME.del = 0) AND (dbo.PBX$CC$WORK_TIME.phone = dbo.PBX$DND_SET.phone) AND (GETDATE() BETWEEN DATEADD(dd, 0, DATEDIFF(dd, 0, 
                                                         dbo.PBX$CC$WORK_TIME.work_date)) + CAST(dbo.PBX$CC$WORK_TIME.work_start AS time) AND DATEADD(dd, 0, DATEDIFF(dd, 0, dbo.PBX$CC$WORK_TIME.work_date)) 
                                                         + CAST(dbo.PBX$CC$WORK_TIME.work_stop AS time))) AS Сотрудник, id
FROM            dbo.PBX$DND_SET
WHERE        (dnd_deactivated IS NULL) AND (phone >= 1020) AND (phone <= 1038)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$CC$DND_TIME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[19] 3) )"
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
         Begin Table = "PBX$DND_SET"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 279
               Right = 199
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
         Width = 1935
         Width = 3720
         Width = 1500
         Width = 3240
         Width = 3465
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$CC$DND_TIME';

