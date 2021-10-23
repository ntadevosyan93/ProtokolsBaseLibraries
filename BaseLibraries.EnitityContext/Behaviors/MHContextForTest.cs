using System;
using System.Collections.Generic;
using System.Data.Entity;
using BaseLibraries.Models.MaternityHospital;

namespace BaseLibraries.EnitityContext.Behaviors
{
    public class MHContextForTest : DropCreateDatabaseAlways<MaternityHospitalContext> //DropCreateDatabaseIfModelChanges<MaternityHospitalContext>
    {
        protected override void Seed(MaternityHospitalContext ctx)
        {
            var employeeTest = new Employee
            {
                idm1c = "-1",
                guid = Guid.NewGuid().ToString(),
                fio = "Тестов Тест Тестович",
            };

            ctx.EmployeList.Add(employeeTest);

            var servTest = new Services
            {
                idm_1c = "-1",
                guid = Guid.NewGuid().ToString(),
                text = "Роды"
            };

            var patIrina = new Patient
            {
                idm_1c = "-A1",
                fio = "Пациентова Ирина Геннадьевна",
                date_b = new DateTime(1992, 2, 12),
                allergic_reactions = "отсутствуют",
                blood_type = Common.BloodType.O_I,
                rh_factor = Common.RhFactor.Positive,
            };

            var patAnna = new Patient
            {
                idm_1c = "-A2",
                fio = "Пациентова Наталья Андреевна",
                date_b = new DateTime(1992, 2, 12),
                allergic_reactions = "отсутствуют",
                blood_type = Common.BloodType.O_I,
                rh_factor = Common.RhFactor.Positive,
            };

            var patNina = new Patient
            {
                idm_1c = "-A2",
                fio = "Пациентова Нина Николаевна",
                date_b = new DateTime(1979, 5, 10),
                allergic_reactions = "отсутствуют",
                blood_type = Common.BloodType.B_III,
                rh_factor = Common.RhFactor.Positive,
            };


            ctx.PatientList.AddRange(new Patient[] { patIrina, patNina, patAnna });


            ctx.TaskList.AddRange(new Task[]
            {
                new Task{
                    idm_1c = "-1",
                    guid = Guid.NewGuid(),
                    task_num = "00001",
                    dog_num = "555555",
                    date_begin = new DateTime(2019,10,3),
                    room_num = "1",
                    Patient = patAnna,
                    Employee = employeeTest,
                    Services = servTest,
                    address_live = "Краснодар, Ленина 100, кв.5",
                    job_place = "ООО Рога и Ко, бухгалтер",
                    status = Common.MH.TaskStatus.TheContractIsExecuted
                },
                new Task{
                    idm_1c = "-1",
                    guid = Guid.NewGuid(),
                    task_num = "00002",
                    dog_num = "555556",
                    date_begin = new DateTime(2019,10,4),
                    room_num = "1",
                    Patient = patIrina,
                    Employee = employeeTest,
                    Services = servTest,
                    address_live = "Краснодар, Ленина 101, кв.10",
                    job_place = "ООО Рога и Ко, менеджер",
                    status = Common.MH.TaskStatus.TheContractIsExecuted,
                },
                new Task{
                    idm_1c = "-1",
                    guid = Guid.NewGuid(),
                    task_num = "00003",
                    dog_num = "555557",
                    date_begin = new DateTime(2019,10,5),
                    room_num = "1",
                    Patient = patNina,
                    Employee = employeeTest,
                    Services = servTest,
                    address_live = "Краснодар, Ленина 600, кв.4",
                    job_place = "ООО Рога и Ко, кладовщик",
                    status = Common.MH.TaskStatus.TheContractIsExecuted
                }

            });

            ctx.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, @"
                                        create function [dbo].[AgeAtDate](@DOB datetime,@PassedDate datetime)
                                        returns int with SCHEMABINDING as begin
                                        declare @iMonthDayDob int
                                        declare @iMonthDayPassedDate int
                                        select @iMonthDayDob = CAST(datepart (mm,@DOB) * 100 + datepart  (dd,@DOB) AS int) 
                                        select @iMonthDayPassedDate = CAST(datepart (mm,@PassedDate) * 100 + datepart  (dd,@PassedDate) AS int) 
                                        return DateDiff(yy,@DOB, @PassedDate) 
                                        - CASE WHEN @iMonthDayDob <= @iMonthDayPassedDate
                                          THEN 0 
                                          ELSE 1
                                          END
                                        End;");

            ctx.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, @"
                                        DROP TABLE View_TaskPage;
                                        DROP TABLE View_TaskList;");

            ctx.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, @"
                                        CREATE VIEW [dbo].[View_TaskList]
                                         AS
                                         SELECT  TL.id, TL.dog_num, TL.date_begin, TL.room_num, P.fio AS patient_fio
                                                 ,dbo.AgeAtDate(P.date_b,TL.date_begin) as age,E.fio AS employee_fio, S.text AS service_name, TL.status
                                         FROM  Task.List AS TL WITH (nolock) 
                                         LEFT OUTER JOIN Patient.List AS P WITH (nolock) ON P.id = TL.idm_patient 
                                         LEFT OUTER JOIN Employee.List AS E WITH (nolock) ON E.id = TL.idm_employee 
                                         LEFT OUTER JOIN Services.List AS S WITH (nolock) ON S.id = TL.idm_service;");

            ctx.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, @"
                                        CREATE VIEW [dbo].[View_TaskPage]
                                         AS
                                         SELECT id, idm_task, date_in, notes,patient_state
                                         FROM  Task.Page
                                         WHERE del = 0;");


            base.Seed(ctx);
        }
    }
}
