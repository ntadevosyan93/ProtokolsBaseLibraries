CREATE VIEW dbo.team_active_develov
AS
SELECT     dbo.SSMP$TEAM.id, dbo.SSMP$EMPLOYEE.fio, dbo.AVTO.text, dbo.AVTO.phone AS phone_avto, dbo.SSMP$EMPLOYEE.phone AS phone_doc, dbo.AVTO.mesto, 
                      dbo.AVTO.gos_nomer + ', ' + dbo.AVTO.mesto + ' (' + dbo.SSMP$EMPLOYEE.fio + ')' AS full_name, dbo.SSMP$EMPLOYEE.pediatr,
                          (SELECT     COUNT(id) AS Expr1
                            FROM          dbo.SSMP$MAIN
                            WHERE      (status = 2) AND (del = 0) AND (NOT (guid IS NULL)) AND (idm_team = dbo.SSMP$TEAM.id)) AS orderCount
FROM         dbo.SSMP$TEAM LEFT OUTER JOIN
                      dbo.AVTO ON dbo.SSMP$TEAM.idm_avto = dbo.AVTO.id LEFT OUTER JOIN
                      dbo.SSMP$EMPLOYEE ON dbo.SSMP$TEAM.idm_doctor = dbo.SSMP$EMPLOYEE.id
WHERE     (dbo.SSMP$TEAM.del = 0) AND (dbo.SSMP$TEAM.date_stop IS NULL)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'team_active_develov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "SSMP$TEAM"
            Begin Extent = 
               Top = 46
               Left = 17
               Bottom = 303
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AVTO"
            Begin Extent = 
               Top = 163
               Left = 262
               Bottom = 344
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$EMPLOYEE"
            Begin Extent = 
               Top = 35
               Left = 264
               Bottom = 155
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'team_active_develov';

