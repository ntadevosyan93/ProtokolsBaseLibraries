CREATE VIEW dbo.AllOne
AS
SELECT     dbo.ALGORITM$MAIN.text, dbo.ALGORITM$MAIN.reg_num_full, dbo.ALGORITM$MAIN_LIST.text AS text_MAIN_LIST, dbo.ALGORITM$MAIN_LIST.reg_num AS reg_num_MAIN_LIST, 
                      dbo.ALGORITM$MAIN_LIST.reg_num_full AS reg_num_full_MAIN_LIST, dbo.ALGORITM$TYPE_ACTIVITY.text AS text_TYPE_ACTIVITY, dbo.ALGORITM$TYPE_ACTIVITY.number, 
                      dbo.ALGORITM$MAIN_LIST.id, dbo.KAD$EMPLOYEE.fam, dbo.KAD$EMPLOYEE.name, dbo.KAD$EMPLOYEE.otch, dbo.KAD$EMPLOYEE.id AS id_EMPLOYEE, dbo.KAD$DOLJN.id AS id_DOLJN, 
                      dbo.KAD$OTDEL.id AS id_OTDEL, dbo.KAD$DOLJN.text AS text_DOLJN, dbo.KAD$OTDEL.text AS text_OTDEL, CAST(dbo.ALGORITM$TYPE_ACTIVITY.number AS varchar(50)) 
                      + ' ' + dbo.ALGORITM$TYPE_ACTIVITY.text AS typeact, dbo.ALGORITM$MAIN.reg_num_full + ' ' + dbo.ALGORITM$MAIN_LIST.text AS algoritm, 
                      dbo.ALGORITM$MAIN_LIST.reg_num_full + ' ' + dbo.ALGORITM$MAIN_LIST.text AS step, dbo.KAD$EMPLOYEE.fam + ' ' + dbo.KAD$EMPLOYEE.name + ' ' + dbo.KAD$EMPLOYEE.otch AS fio, 
                      dbo.ALGORITM$MAIN_LIST.text_print,
					  (SELECT STUFF((
    SELECT text + ', ' AS 'data()' 
	FROM KAD$DOLJN
	WHERE id in (
	select idm_doljn from ALGORITM$DOLGN where id_main_list = [ALGORITM$MAIN_LIST].id)
	FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 0, '')) as doljn
FROM         dbo.ALGORITM$MAIN_LIST LEFT OUTER JOIN
                      dbo.KAD$DOLJN ON dbo.ALGORITM$MAIN_LIST.idm_doljn = dbo.KAD$DOLJN.id LEFT OUTER JOIN
                      dbo.KAD$OTDEL ON dbo.ALGORITM$MAIN_LIST.idm_otdel = dbo.KAD$OTDEL.id LEFT OUTER JOIN
                      dbo.KAD$EMPLOYEE ON dbo.ALGORITM$MAIN_LIST.idm_employee = dbo.KAD$EMPLOYEE.id RIGHT OUTER JOIN
                      dbo.ALGORITM$MAIN LEFT OUTER JOIN
                      dbo.ALGORITM$TYPE_ACTIVITY ON dbo.ALGORITM$MAIN.idm_main = dbo.ALGORITM$TYPE_ACTIVITY.id ON dbo.ALGORITM$MAIN_LIST.idm_main = dbo.ALGORITM$MAIN.id
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[21] 2[37] 3) )"
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
         Begin Table = "ALGORITM$MAIN_LIST"
            Begin Extent = 
               Top = 5
               Left = 366
               Bottom = 245
               Right = 686
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "KAD$DOLJN"
            Begin Extent = 
               Top = 251
               Left = 844
               Bottom = 341
               Right = 1013
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KAD$OTDEL"
            Begin Extent = 
               Top = 1
               Left = 844
               Bottom = 106
               Right = 1013
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KAD$EMPLOYEE"
            Begin Extent = 
               Top = 108
               Left = 843
               Bottom = 229
               Right = 1012
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ALGORITM$MAIN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 289
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ALGORITM$TYPE_ACTIVITY"
            Begin Extent = 
               Top = 181
               Left = 367
               Bottom = 327
               Right = 648
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
      Begin ColumnWidths = 21
         Width = 284
       ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'AllOne';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'AllOne';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'  Width = 2175
         Width = 1500
         Width = 1500
         Width = 3375
         Width = 1500
         Width = 1500
         Width = 4200
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
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6600
         Alias = 900
         Table = 3690
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'AllOne';

