CREATE VIEW dbo.View$RM$OS$BILLING
AS
SELECT        dbo.GetAllowAgreeFromBilling(rmBill.id, 1) AS reas_ur, dbo.GetAllowAgreeFromBilling(rmBill.id, 3) AS reas_m, rmBill.id, rmBill.user_in, rmBill.date_in, rmBill.date_bill, rmBill.number, post.text AS partner, 
                         owner.text AS owner, k.fio_short AS curator, rmBill.description, rmBill.summ, rmBill.summ_cy, rmBill.summ_cy_type, rmBill.cy_rate, rmBill.percent_cy, rmBill.nds, rmBill.status, rmBill.date_paid, 
                         rmBill.nom_paid, rmBill.send_assept, dep.text AS department, rmBill.invoice_number, rmBill.invoice_date, rmBill.bill_dogovor, rmBill.type_pay, rmBill.date_pay, rmBill.date_pay_purpose, rmBill.assept_number, 
                         rmBill.assept_idm, rmBill.idm_budget, rmBill.send_agree, rmBill.idm_file_store, rmBill.user_cur, rmBill.date_cur, rmBill.del, rmBill.bill_guid, a.klass_value, dbo.f_GetResultAgreementBillingByOtdel(rmBill.id, 1) 
                         AS comment_ur, dbo.f_GetResultAgreementBillingByOtdel(rmBill.id, 3) AS comment_m, (CASE rmBill.[status] WHEN 7 THEN 0 WHEN 4 THEN 1 ELSE - 1 END) AS AllowPurpose, rmBill.idm_partner, 
                         rmBill.idm_owner, rmBill.idm_isp, rmBill.idm_curator, rmBill.idm_department, rmBill.idm_dogovor, rmBill.idm_budgetGroup, rmBill.assept_date, rmBill.AllowAgreeMarceting
FROM            dbo.RM$OS$BILLING AS rmBill WITH (nolock) LEFT OUTER JOIN
                         dbo.KLASS AS a WITH (nolock) ON a.klass_id = rmBill.status AND a.klass_name = 'billing' LEFT OUTER JOIN
                         dbo.View$KAD$EMPLOYEE$ALL AS k ON k.id = rmBill.idm_curator LEFT OUTER JOIN
                         dbo.PARTNER AS post WITH (nolock) ON post.id = rmBill.idm_partner LEFT OUTER JOIN
                         dbo.PARTNER AS owner WITH (nolock) ON owner.id = rmBill.idm_owner LEFT OUTER JOIN
                         dbo.DEPARTMENTS AS dep WITH (nolock) ON dep.id = rmBill.idm_department
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RM$OS$BILLING';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'  Width = 1500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RM$OS$BILLING';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[11] 2[29] 3) )"
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
         Begin Table = "rmBill"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 281
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 29
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "k"
            Begin Extent = 
               Top = 6
               Left = 481
               Bottom = 136
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "post"
            Begin Extent = 
               Top = 6
               Left = 693
               Bottom = 136
               Right = 867
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "owner"
            Begin Extent = 
               Top = 6
               Left = 905
               Bottom = 136
               Right = 1079
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dep"
            Begin Extent = 
               Top = 6
               Left = 1117
               Bottom = 136
               Right = 1291
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
       ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View$RM$OS$BILLING';

