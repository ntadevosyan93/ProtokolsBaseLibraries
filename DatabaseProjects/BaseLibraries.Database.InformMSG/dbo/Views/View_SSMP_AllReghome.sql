CREATE VIEW dbo.View_SSMP_AllReghome
AS
SELECT        dbo.SSMP$MAIN.id, dbo.SSMP$MAIN.user_in, dbo.SSMP$MAIN.date_in, dbo.SSMP$MAIN.count, dbo.SSMP$MAIN.fam, dbo.SSMP$MAIN.name, dbo.SSMP$MAIN.otch, 
                         dbo.SSMP$MAIN.fam + ' ' + dbo.SSMP$MAIN.name + ' ' + dbo.SSMP$MAIN.otch AS fio, dbo.SSMP$MAIN.date_b, dbo.SSMP$MAIN.address, dbo.SSMP$MAIN.address_dop, dbo.SSMP$MAIN.phone_1, 
                         dbo.SSMP$MAIN.phone_2, dbo.SSMP$MAIN.calling_fio, dbo.SSMP$MAIN.symptoms, dbo.SSMP$MAIN.comment, dbo.SSMP$MAIN.idm_team, dbo.SSMP$MAIN.idm_reg_1c, dbo.SSMP$MAIN.status, 
                         dbo.KLASS.klass_value AS status_t, dbo.SSMP$MAIN.del, dbo.SSMP$MAIN.year, dbo.SSMP$BRIGADE.mesto + ' (' + dbo.SSMP$EMPLOYEE.fio + ')' AS team_t
FROM            dbo.SSMP$EMPLOYEE WITH (nolock) RIGHT OUTER JOIN
                         dbo.SSMP$TEAM WITH (nolock) ON dbo.SSMP$EMPLOYEE.id = dbo.SSMP$TEAM.idm_doctor LEFT OUTER JOIN
                         dbo.AVTO WITH (nolock) ON dbo.SSMP$TEAM.idm_avto = dbo.AVTO.id RIGHT OUTER JOIN
                         dbo.SSMP$MAIN WITH (nolock) ON dbo.SSMP$TEAM.id = dbo.SSMP$MAIN.idm_team LEFT OUTER JOIN
                         dbo.SSMP$BRIGADE WITH (nolock) ON dbo.SSMP$BRIGADE.id = dbo.SSMP$TEAM.idm_brigade LEFT OUTER JOIN
                         dbo.KLASS WITH (nolock) ON dbo.KLASS.klass_id = dbo.SSMP$MAIN.status AND dbo.KLASS.klass_name = 'ssmp_main_status'
WHERE        (dbo.SSMP$MAIN.del <> 1)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_SSMP_AllReghome';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'     Alias = 900
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_SSMP_AllReghome';


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
         Begin Table = "SSMP$EMPLOYEE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$TEAM"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AVTO"
            Begin Extent = 
               Top = 182
               Left = 386
               Bottom = 312
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$MAIN"
            Begin Extent = 
               Top = 87
               Left = 934
               Bottom = 217
               Right = 1131
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SSMP$BRIGADE"
            Begin Extent = 
               Top = 6
               Left = 909
               Bottom = 136
               Right = 1083
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KLASS"
            Begin Extent = 
               Top = 205
               Left = 592
               Bottom = 335
               Right = 773
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
    ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_SSMP_AllReghome';

