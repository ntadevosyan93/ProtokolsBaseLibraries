CREATE VIEW dbo.View$SSMP$ReportMany
AS
SELECT     SUM(dbo.SSMP$MAIN_SERVICE.idm_1c_summ) AS summa, dbo.AVTO.mesto, dbo.SSMP$EMPLOYEE.fio, dbo.SSMP$TEAM.id
FROM         dbo.SSMP$EMPLOYEE RIGHT OUTER JOIN
                      dbo.SSMP$TEAM ON dbo.SSMP$EMPLOYEE.id = dbo.SSMP$TEAM.idm_paramedic LEFT OUTER JOIN
                      dbo.AVTO ON dbo.SSMP$TEAM.idm_avto = dbo.AVTO.id LEFT OUTER JOIN
                      dbo.SSMP$MAIN_SERVICE RIGHT OUTER JOIN
                      dbo.SSMP$MAIN ON dbo.SSMP$MAIN_SERVICE.idm_main = dbo.SSMP$MAIN.id ON dbo.SSMP$TEAM.id = dbo.SSMP$MAIN.idm_team
WHERE     (dbo.SSMP$TEAM.date_start < CONVERT(DATETIME, '2015-07-20  00:00:00', 102)) AND (dbo.SSMP$TEAM.date_start > CONVERT(DATETIME, '2015-07-17 00:00:00', 
                      102)) AND (dbo.SSMP$MAIN_SERVICE.del = 0) AND (dbo.SSMP$MAIN.del = 0)
GROUP BY dbo.SSMP$MAIN_SERVICE.del, dbo.AVTO.mesto, dbo.SSMP$EMPLOYEE.fio, dbo.SSMP$TEAM.id
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$SSMP$ReportMany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N's = 900
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$SSMP$ReportMany';


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
               Top = 214
               Left = 252
               Bottom = 322
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$TEAM"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 239
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AVTO"
            Begin Extent = 
               Top = 83
               Left = 240
               Bottom = 191
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$MAIN_SERVICE"
            Begin Extent = 
               Top = 78
               Left = 696
               Bottom = 290
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$MAIN"
            Begin Extent = 
               Top = 41
               Left = 439
               Bottom = 236
               Right = 599
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
         Width = 2520
         Width = 3525
         Width = 4230
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$SSMP$ReportMany';

