CREATE VIEW dbo.View$RM$OS_MOVE
AS
SELECT     dbo.RM$OS$MOVE.idm_departments, dbo.RM$OS$MOVE.descript, dbo.RM$OS$MOVE.room, dbo.RM$OS$MOVE.date_in, dbo.DEPARTMENTS.text, 
                      dbo.View$RM$OS_MOVE_ID.text AS os_text, dbo.View$RM$OS_MOVE_ID.idm_type, dbo.View$RM$OS_MOVE_ID.inv_num, dbo.View$RM$OS_MOVE_ID.serial_num, 
                      dbo.View$RM$OS_MOVE_ID.id
FROM         dbo.View$RM$OS_MOVE_ID LEFT OUTER JOIN
                      dbo.DEPARTMENTS ON dbo.View$RM$OS_MOVE_ID.id = dbo.DEPARTMENTS.id LEFT OUTER JOIN
                      dbo.RM$OS$MOVE ON dbo.View$RM$OS_MOVE_ID.last_move_id = dbo.RM$OS$MOVE.id
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RM$OS_MOVE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
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
         Begin Table = "View$RM$OS_MOVE_ID"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 293
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RM$OS$MOVE"
            Begin Extent = 
               Top = 26
               Left = 857
               Bottom = 241
               Right = 1029
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DEPARTMENTS"
            Begin Extent = 
               Top = 122
               Left = 558
               Bottom = 226
               Right = 727
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 4500
         Width = 2700
         Width = 3690
         Width = 3615
         Width = 4740
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
         Table = 4500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RM$OS_MOVE';

