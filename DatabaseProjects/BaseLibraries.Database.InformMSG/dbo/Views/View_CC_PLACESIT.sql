CREATE VIEW dbo.View$CC$PLACESIT
AS
SELECT     dbo.CHECKSIT$PLACESIT.id_phone, dbo.CHECKSIT$PLACESIT.datetime_sit, View$KAD$EMPLOYEE_1.fio_short AS smena_1_t, 
                      dbo.View$KAD$EMPLOYEE.fio_short AS smena_2_t, View$KAD$EMPLOYEE_2.fio_short AS smena_3_t, dbo.CHECKSIT$PLACESIT.id_empl_smena_1, 
                      dbo.CHECKSIT$PLACESIT.id_empl_smena_2, dbo.CHECKSIT$PLACESIT.id_empl_smena_3
FROM         dbo.CHECKSIT$PLACESIT LEFT OUTER JOIN
                      dbo.View$KAD$EMPLOYEE AS View$KAD$EMPLOYEE_2 ON dbo.CHECKSIT$PLACESIT.id_empl_smena_3 = View$KAD$EMPLOYEE_2.id LEFT OUTER JOIN
                      dbo.View$KAD$EMPLOYEE ON dbo.CHECKSIT$PLACESIT.id_empl_smena_2 = dbo.View$KAD$EMPLOYEE.id LEFT OUTER JOIN
                      dbo.View$KAD$EMPLOYEE AS View$KAD$EMPLOYEE_1 ON dbo.CHECKSIT$PLACESIT.id_empl_smena_1 = View$KAD$EMPLOYEE_1.id
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$CC$PLACESIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'   Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$CC$PLACESIT';


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
         Begin Table = "CHECKSIT$PLACESIT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 272
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View$KAD$EMPLOYEE_1"
            Begin Extent = 
               Top = 24
               Left = 614
               Bottom = 155
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "View$KAD$EMPLOYEE"
            Begin Extent = 
               Top = 165
               Left = 859
               Bottom = 273
               Right = 1019
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "View$KAD$EMPLOYEE_2"
            Begin Extent = 
               Top = 189
               Left = 414
               Bottom = 297
               Right = 574
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 3360
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
      ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$CC$PLACESIT';

