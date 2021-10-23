CREATE VIEW dbo.ЗагрузкаЗаказовСкоройПомощи
AS
SELECT     TOP (100) PERCENT dbo.SSMP$MAIN.id, dbo.SSMP$MAIN.fam, dbo.SSMP$MAIN.name, dbo.SSMP$MAIN.otch, dbo.SSMP$MAIN.date_b, dbo.SSMP$MAIN.phone_2, 
                      dbo.SSMP$MAIN_SERVICE.idm_1c_code, dbo.SSMP$MAIN_SERVICE.idm_1c_count, dbo.SSMP$EMPLOYEE.idm_1c, dbo.SSMP$MAIN_SERVICE.idm_1c_summ, 
                      dbo.SSMP$MAIN.idm_reg_1c, dbo.SSMP$MAIN.date_end, dbo.SSMP$MAIN.address, dbo.SSMP$MAIN.address_dop
FROM         dbo.SSMP$MAIN INNER JOIN
                      dbo.SSMP$MAIN_SERVICE ON dbo.SSMP$MAIN.id = dbo.SSMP$MAIN_SERVICE.idm_main INNER JOIN
                      dbo.SSMP$TEAM ON dbo.SSMP$MAIN.idm_team = dbo.SSMP$TEAM.id INNER JOIN
                      dbo.SSMP$EMPLOYEE ON dbo.SSMP$TEAM.idm_doctor = dbo.SSMP$EMPLOYEE.id
WHERE     (dbo.SSMP$MAIN.status = 3) AND (dbo.SSMP$MAIN.del = 0) AND (dbo.SSMP$MAIN_SERVICE.del = 0) AND (dbo.SSMP$MAIN.idm_reg_1c = '0') AND 
                      (dbo.SSMP$MAIN.date_end IS NOT NULL)
ORDER BY dbo.SSMP$MAIN.id
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ЗагрузкаЗаказовСкоройПомощи';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'e = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ЗагрузкаЗаказовСкоройПомощи';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[24] 2[25] 3) )"
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
         Begin Table = "SSMP$MAIN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 216
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "SSMP$MAIN_SERVICE"
            Begin Extent = 
               Top = 22
               Left = 465
               Bottom = 230
               Right = 616
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$TEAM"
            Begin Extent = 
               Top = 6
               Left = 794
               Bottom = 213
               Right = 945
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$EMPLOYEE"
            Begin Extent = 
               Top = 12
               Left = 1021
               Bottom = 188
               Right = 1172
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
      Begin ColumnWidths = 15
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
         Width = 585
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
         SortTyp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ЗагрузкаЗаказовСкоройПомощи';

