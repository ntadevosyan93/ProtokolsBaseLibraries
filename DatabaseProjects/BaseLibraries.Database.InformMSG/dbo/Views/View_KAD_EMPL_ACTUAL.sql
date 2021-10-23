CREATE VIEW dbo.View$KAD$EMPL$ACTUAL
AS
SELECT        dbo.KAD$EMPLOYEE.id, dbo.KAD$EMPLOYEE.fam, dbo.KAD$EMPLOYEE.name, dbo.KAD$EMPLOYEE.otch, (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL 
                         THEN name ELSE '' END) + ' ' + (CASE WHEN otch IS NOT NULL THEN otch ELSE '' END) AS fio_full, (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL 
                         THEN LEFT(name, 1) ELSE ' ' END) + '.' + (CASE WHEN otch IS NOT NULL THEN LEFT(otch, 1) ELSE '' END) + '.' AS fio_short, dbo.KAD$EMPLOYEE.idm_bolid, dbo.KAD$EMPLOYEE.curator_dog, 
                         dbo.KAD$EMPLOYEE.guid, dbo.KAD$EMPLOYEE.idm_doljn AS id_doljn, dbo.KAD$EMPLOYEE.phone_mob, dbo.KAD$DOLJN.text AS doljn_text, dbo.KAD$EMPLOYEE.email, dbo.KAD$EMPLOYEE.phone_vn, 
                         dbo.KAD$EMPLOYEE.guid_iclinic, dbo.KAD$EMPLOYEE.isKKB
FROM            dbo.KAD$EMPLOYEE WITH (nolock) LEFT OUTER JOIN
                         dbo.KAD$DOLJN WITH (nolock) ON dbo.KAD$EMPLOYEE.idm_doljn = dbo.KAD$DOLJN.id
WHERE        (dbo.KAD$EMPLOYEE.del = 0 OR
                         dbo.KAD$EMPLOYEE.del IS NULL) AND (dbo.KAD$EMPLOYEE.actual = 1) OR
                         (dbo.KAD$EMPLOYEE.actual <> 1) AND (CAST(GETDATE() AS date) <= CAST(DATEADD(dd, 10, dbo.KAD$EMPLOYEE.date_dismissal) AS date))
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$KAD$EMPL$ACTUAL';


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
         Begin Table = "KAD$EMPLOYEE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 278
               Right = 307
            End
            DisplayFlags = 280
            TopColumn = 43
         End
         Begin Table = "KAD$DOLJN"
            Begin Extent = 
               Top = 6
               Left = 345
               Bottom = 126
               Right = 514
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1410
         Width = 4020
         Width = 1500
         Width = 1500
         Width = 2490
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$KAD$EMPL$ACTUAL';

