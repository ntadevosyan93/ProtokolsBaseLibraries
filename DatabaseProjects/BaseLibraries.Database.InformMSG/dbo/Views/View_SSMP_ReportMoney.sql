CREATE VIEW dbo.View$SSMP$ReportMoney
AS
SELECT     SUM(dbo.SSMP$MAIN_SERVICE.idm_1c_summ) AS summa, dbo.AVTO.mesto, dbo.SSMP$EMPLOYEE.fio, dbo.SSMP$TEAM.id, dbo.AVTO.id AS idm_team, dbo.AVTO.text, 
                      dbo.SSMP$TEAM.date_start AS dstart, dbo.SSMP$TEAM.date_start AS dstop, dbo.SSMP$MAIN.paytype
FROM         dbo.SSMP$EMPLOYEE RIGHT OUTER JOIN
                      dbo.SSMP$TEAM ON dbo.SSMP$EMPLOYEE.id = dbo.SSMP$TEAM.idm_paramedic LEFT OUTER JOIN
                      dbo.AVTO ON dbo.SSMP$TEAM.idm_avto = dbo.AVTO.id LEFT OUTER JOIN
                      dbo.SSMP$MAIN_SERVICE RIGHT OUTER JOIN
                      dbo.SSMP$MAIN ON dbo.SSMP$MAIN_SERVICE.idm_main = dbo.SSMP$MAIN.id ON dbo.SSMP$TEAM.id = dbo.SSMP$MAIN.idm_team
WHERE     (dbo.SSMP$MAIN_SERVICE.del = 0) AND (dbo.SSMP$MAIN.del = 0)
GROUP BY dbo.SSMP$MAIN_SERVICE.del, dbo.AVTO.mesto, dbo.SSMP$EMPLOYEE.fio, dbo.SSMP$TEAM.id, dbo.AVTO.id, dbo.AVTO.text, dbo.SSMP$TEAM.date_start, dbo.SSMP$MAIN.paytype
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$SSMP$ReportMoney';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'mn = 1440
         Alias = 900
         Table = 2850
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$SSMP$ReportMoney';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
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
         Begin Table = "SSMP$EMPLOYEE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 181
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$TEAM"
            Begin Extent = 
               Top = 72
               Left = 261
               Bottom = 290
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AVTO"
            Begin Extent = 
               Top = 146
               Left = 513
               Bottom = 309
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$MAIN_SERVICE"
            Begin Extent = 
               Top = 6
               Left = 707
               Bottom = 126
               Right = 892
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$MAIN"
            Begin Extent = 
               Top = 6
               Left = 930
               Bottom = 309
               Right = 1115
            End
            DisplayFlags = 280
            TopColumn = 14
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1725
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 5550
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Colu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$SSMP$ReportMoney';

