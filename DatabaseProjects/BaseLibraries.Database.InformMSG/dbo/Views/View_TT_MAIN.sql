
CREATE VIEW [dbo].[View$TT$MAIN]
AS
SELECT        dbo.TT$MAIN.id, dbo.TT$MAIN.user_in, dbo.TT$MAIN.date_in, dbo.TT$MAIN.idm_departments, dbo.TT$MAIN.text_problem, dbo.TT$MAIN.date_start, 
                         dbo.TT$MAIN.date_stop, dbo.TT$MAIN.text_solution, dbo.TT$MAIN.idm_empl, dbo.TT$MAIN.status, dbo.TT$MAIN.guid, dbo.TT$MAIN.del, dbo.TT$MAIN.idm_activity, 
                         dbo.ALGORITM$TYPE_ACTIVITY.text, SUBSTRING(dbo.TT$MAIN.text_solution, 1, 80) AS textsolution, SUBSTRING(dbo.TT$MAIN.text_problem, 1, 80) AS textproblem, 
                         dbo.TT$MAIN.idm_place, dbo.TT$MAIN.idm_object, dbo.TT$MAIN.idm_os, dbo.TT$MAIN.os_inv, dbo.TT$MAIN.idm_control
FROM            dbo.TT$MAIN LEFT OUTER JOIN
                         dbo.ALGORITM$TYPE_ACTIVITY ON dbo.TT$MAIN.idm_activity = dbo.ALGORITM$TYPE_ACTIVITY.id
						 where dbo.TT$MAIN.idm_activity != 2
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$TT$MAIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[18] 2[29] 3) )"
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
         Begin Table = "TT$MAIN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 309
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "ALGORITM$TYPE_ACTIVITY"
            Begin Extent = 
               Top = 8
               Left = 241
               Bottom = 314
               Right = 410
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$TT$MAIN';

