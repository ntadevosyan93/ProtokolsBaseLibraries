CREATE VIEW dbo.View$OS$TT_ACTIVE
AS
SELECT     dbo.RM$OS.text AS os_text, dbo.RM$OS.id AS os_id, dbo.RM$OS.idm_otdel, dbo.DEPARTMENTS.text AS DEPARTMENT_text, dbo.TT$MAIN.status AS tt_status_id, 
                      dbo.TT$MAIN.date_start AS tt_date_start, dbo.TT$MAIN.text_problem AS tt_text, dbo.TT$MAIN.text_solution AS tt_text_solution, dbo.KLASS.klass_value AS tt_status_text, dbo.TT$MAIN.id AS tt_id, 
                      dbo.TT$MAIN.guid, dbo.TT$MAIN.date_cor AS tt_date_cor, dbo.TT$MAIN.date_in AS tt_date_in, dbo.RM$OS.idm_partner_service AS os_service, dbo.RM$OS.inv_num AS os_inv_num
FROM         dbo.KLASS RIGHT OUTER JOIN
                      dbo.RM$OS INNER JOIN
                      dbo.RM$OS$TYPE ON dbo.RM$OS.idm_type = dbo.RM$OS$TYPE.id RIGHT OUTER JOIN
                      dbo.TT$MAIN ON dbo.RM$OS.id = dbo.TT$MAIN.idm_os LEFT OUTER JOIN
                      dbo.DEPARTMENTS ON dbo.RM$OS.idm_otdel = dbo.DEPARTMENTS.id ON dbo.KLASS.klass_id = dbo.TT$MAIN.status
WHERE     (dbo.TT$MAIN.status <> 4) AND (dbo.KLASS.klass_name = 'tt_trouble_status') AND (dbo.TT$MAIN.idm_activity = 3)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$OS$TT_ACTIVE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2835
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$OS$TT_ACTIVE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[28] 2[18] 3) )"
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
         Begin Table = "KLASS"
            Begin Extent = 
               Top = 91
               Left = 806
               Bottom = 199
               Right = 966
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RM$OS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 279
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "RM$OS$TYPE"
            Begin Extent = 
               Top = 176
               Left = 552
               Bottom = 282
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TT$MAIN"
            Begin Extent = 
               Top = 8
               Left = 478
               Bottom = 159
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DEPARTMENTS"
            Begin Extent = 
               Top = 234
               Left = 325
               Bottom = 327
               Right = 485
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 4710
         Width = 2025
         Width = 1500
         Width = 2775
         Width = 1500
         Width = 1890
         Width = 3645
         Width = 2700
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$OS$TT_ACTIVE';

