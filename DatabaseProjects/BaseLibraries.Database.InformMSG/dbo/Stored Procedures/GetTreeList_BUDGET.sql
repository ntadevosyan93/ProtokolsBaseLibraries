-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.GetTreeList_BUDGET
	-- Add the parameters for the stored procedure here
	@month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select idm_department,idm_Parent_group,idm_Child_group,description,summ,
  a.text as name_parent, c.text as name_Child, DEPARTMENTS.text as name_dep,
  (select sum(summ) from RM$BUDGET where idm_department =B.idm_department ) as Departsum, 
  (select sum(summ) from RM$BUDGET where idm_Parent_group =B.idm_Parent_group and idm_department=B.idm_department) as GroupSum 
  ,(select sum(summ) from RM$BUDGET where idm_department=B.idm_department and idm_Child_group=b.idm_Child_group and idm_Parent_group =B.idm_Parent_group) as Childsum
  from RM$BUDGET B 
  left join RM$BUDGET$GROUPINGS a on a.id = b.idm_Parent_group
  left join RM$BUDGET$GROUPINGS c on c.id = b.idm_Child_group
  left join DEPARTMENTS on DEPARTMENTS.id =idm_department
  where [month]=@month and del=0
   order by idm_department, idm_Parent_group
END