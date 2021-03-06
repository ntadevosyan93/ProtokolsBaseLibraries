CREATE VIEW dbo.View$RM$OS
AS
SELECT     dbo.RM$OS$TYPE.text AS type_t, dbo.RM$OS.date_in, dbo.RM$OS.user_in, dbo.RM$OS.idm_type, dbo.RM$OS.text, dbo.RM$OS.serial_num, dbo.RM$OS.inv_num, 
                      dbo.RM$OS.doc_date_purchase, dbo.RM$OS.doc_num_purchase, dbo.RM$OS.date_start, dbo.RM$OS.del, dbo.PARTNER.text AS partner_t
FROM         dbo.RM$OS LEFT OUTER JOIN
                      dbo.PARTNER ON dbo.RM$OS.idm_partner = dbo.PARTNER.id LEFT OUTER JOIN
                      dbo.RM$OS$TYPE ON dbo.RM$OS.idm_type = dbo.RM$OS$TYPE.id
WHERE     (dbo.RM$OS.del = 0)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RM$OS';


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
         Begin Table = "RM$OS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 254
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "RM$OS$TYPE"
            Begin Extent = 
               Top = 6
               Left = 251
               Bottom = 162
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PARTNER"
            Begin Extent = 
               Top = 204
               Left = 651
               Bottom = 282
               Right = 811
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RM$OS';

