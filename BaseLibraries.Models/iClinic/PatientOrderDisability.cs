using BaseLibraries.Abstractions.Models;
using BaseLibraries.Common;
using Clinic.Development;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BaseLibraries.Models.iClinic
{
    public class PatientOrderDisability : IEntity, IPersonBase, IPersonInfo, IPeriod,IPersonAddress, IEquatable<PatientOrderDisability>
    {
        [Key]
        [ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_patient")]
        public int idm_patient { get; set; }

        [ColumnMap("idm_employee")]
        public int idm_employee { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("idm_type")]
        public DisabilitySheetType? idm_type { get; set; }

        /// <summary>
        /// Дата записи
        /// </summary>
        [ColumnMap("date_in")]
        public DateTime date_in { get; set; }

        /// <summary>
        /// Диагноз 
        /// </summary>
        [ColumnMap("diagnosis")]
        public string diagnosis { get; set; }

        /// <summary>
        /// Диагноз первичный
        /// </summary>
        [ColumnMap("diagnosis_first")]
        public string diagnosis_first { get; set; }

        /// <summary>
        /// ФИО кому выдан ЛН
        /// </summary>
        [ColumnMap("fio")]
        public string fio { get; set; }

        /// <summary>
        /// Адрес регистрации
        /// </summary>
        [ColumnMap("addr_registr")]
        public string addr_registr { get; set; }

        /// <summary>
        /// Дата рождения
        /// </summary>
        [ColumnMap("date_b")]
        public DateTime? date_b { get; set; }

        /// <summary>
        /// Место работы
        /// </summary>
        [ColumnMap("job_place")]
        public string job_place { get; set; }

        /// <summary>
        /// Должность
        /// </summary>
        [ColumnMap("position")]
        public string position { get; set; }

        /// <summary>
        /// Основное место работы
        /// </summary>
        [ColumnMap("is_main_job")]
        public bool is_main_job { get; set; }

        /// <summary>
        /// Контактный телефон
        /// </summary>
        [ColumnMap("contact_phone")]
        public string contact_phone { get; set; }

        /// <summary>
        /// Имеется ЛН
        /// </summary>
        [ColumnMap("hln_number")]
        public string hln_number { get; set; }

        /// <summary>
        /// др лн дата с
        /// </summary>
        [ColumnMap("hln_begin_date")]
        public DateTime? hln_begin_date { get; set; }

        /// <summary>
        /// др лн дата по
        /// </summary>
        [ColumnMap("hln_end_date")]
        public DateTime? hln_end_date { get; set; }

        /// <summary>
        /// ЛН по уходу за больным
        /// </summary>
        [ColumnMap("is_patient_care")]
        public bool is_patient_care { get; set; }

        /// <summary>
        /// Родственная связь
        /// </summary>
        [ColumnMap("fam_relationship")]
        public FamilyRelationshipEnum? fam_relationship { get; set; }

        
        /// <summary>
        /// № листка нетрудоспособности
        /// </summary>
        [ColumnMap("ln_number")]
        public string ln_number { get; set; }

        /// <summary>
        /// ЛН дата с
        /// </summary>
        [ColumnMap("begin_date")]
        public DateTime begin_date { get; set; }

        /// <summary>
        /// ЛН дата по
        /// </summary>
        [ColumnMap("end_date")]
        public DateTime? end_date { get; set; }

        [ColumnMap("status")]
        public DisabilitySheetStatusEnum status { get; set; }

        /// <summary>
        /// Приступить к работе с дата
        /// </summary>
        [ColumnMap("to_work_with")]
        public DateTime? to_work_with { get; set; }

        /// <summary>
        /// Продолжает болеть
        /// </summary>
        [ColumnMap("continues_to_hurt")]
        public bool continues_to_hurt { get; set; }


        /// <summary>
        /// Напрален в другое ЛПУ
        /// </summary>
        [ColumnMap("another_medical")]
        public string another_medical { get; set; }

        [NotMapped()]
        public IAddressData StructedAddress { get; set; }


        /// <summary>
        /// Периоды больничных
        /// </summary>
        public List<DisabilitySheetPeriod> Periods { get; set; }

        public PatientOrderDisability()
        {
            Periods = new List<DisabilitySheetPeriod>();
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;

            return Equals(obj as PatientOrderDisability);
        }

        public bool Equals(PatientOrderDisability other)
        {
            if (other == null) return false;

            if (ReferenceEquals(this, other))
                return true;

            try
            {
                if (id.Equals(other.id) && idm_employee.Equals(other.idm_employee)
                    && idm_patient.Equals(other.idm_patient) && date_in.Equals(other.date_in)
                    && begin_date.Equals(other.begin_date) && end_date.Equals(other.end_date)
                    && is_main_job.Equals(other.is_main_job) && position.Equals(other.position)
                    && is_patient_care.Equals(other.is_patient_care)
                    && date_b.Equals(other.date_b)
                    && (idm_type == null ? (other.idm_type == null) : idm_type.Equals(other.idm_type))
                    && (string.IsNullOrEmpty(diagnosis) ? string.IsNullOrEmpty(other.diagnosis) : diagnosis.Equals(other.diagnosis))
                    && (string.IsNullOrEmpty(diagnosis_first) ? string.IsNullOrEmpty(other.diagnosis_first) : diagnosis_first.Equals(other.diagnosis_first))
                    && (string.IsNullOrEmpty(fio) ? string.IsNullOrEmpty(other.fio) : fio.Equals(other.fio))
                    && (string.IsNullOrEmpty(addr_registr) ? string.IsNullOrEmpty(other.addr_registr) : addr_registr.Equals(other.addr_registr))
                    && (string.IsNullOrEmpty(job_place) ? string.IsNullOrEmpty(other.job_place) : job_place.Equals(other.job_place))
                    && (string.IsNullOrEmpty(hln_number) ? string.IsNullOrEmpty(other.hln_number) : hln_number.Equals(other.hln_number))
                    && (string.IsNullOrEmpty(ln_number) ? string.IsNullOrEmpty(other.ln_number) : ln_number.Equals(other.ln_number)))
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                new System.Threading.Tasks.Task(() => {
                    EnvironmentCollector.WriteLogToDB(EnvironmentCollector.LogType.Exception, EnvironmentCollector.AppType.Protocols,
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Name.ToString(),
                        System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString(), ex);
                }).Start();

                return false;
            }
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public void SetPatronage(PatientOrderDisability patronage)
        {
            fio = patronage.fio;
            date_b = patronage.date_b;
            addr_registr = patronage.addr_registr;
            job_place = patronage.job_place;
            is_main_job = patronage.is_main_job;
            position = patronage.position;
            contact_phone = patronage.contact_phone;
        }
    }
}
