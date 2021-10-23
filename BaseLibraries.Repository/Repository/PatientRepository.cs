using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseLibraries.EnitityContext;
using BaseLibraries.Models.iClinic;
using BaseLibraries.Repository.Classes;
using BaseLibraries.Repository.Core;
using BaseLibraries.Repository.DTO;
using BaseLibraries.Repository.ext;

namespace BaseLibraries.Repository.Repository
{
    public class PatientRepository :  IPatientRepository
    {

        public Func<UserOptions> GetOptions { get; set; }

        public iClinicTemplateContext currentContext
        {
            get
            {
                return new iClinicTemplateContext()
                {
                    UserName = GetOptions().UserName
                };
            }
        }
        iClinicTemplateContext _con = new iClinicTemplateContext();
        
        public IQueryable<Patient> GetPatient(Func<Patient, bool> ins = null, int? Take = null, int? Skip = null)
        {

            var q = _con.Patients
                    .AsQueryable();

            return q.OrderBy(x => x.fio).AsQueryable();
        }

        public Patient GetPatient(int idm_patient)
        {
            using (var _Context = currentContext)
            {
                var patient = _Context.Patients.Where(x => x.id == idm_patient).FirstOrDefault();

                return patient;
            }
        }
        public Patient GetPatient1C(string idm_patient_1c)
        {
            using (var _Context = currentContext)
            {
                var patient = _Context.Patients.Where(x => x.idm_1c == idm_patient_1c).FirstOrDefault();

                return patient;
            }
        }
        public bool SubmitPatient(Patient model)
        {
            using (var _Context = currentContext)
            {
                var patient = _Context.Patients.Where(x => x.id == model.id).FirstOrDefault();

                if (patient != null)
                {
                    patient.phone = model.phone;
                    patient.email = model.email;
                    patient.is_vip = model.is_vip;
                    patient.is_non_grata = model.is_non_grata;
                    patient.date_b = model.date_b;
                    patient.total_money = model.total_money;
                    patient.comment = model.comment;

                    _Context.SaveChanges();
                }
                else
                    return false;

                return true;
            }
        }

        public List<DTOPatient> GetDTOPatients(int? idm_patient = null, string phone = null)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["iClinicConnectionString"].ToString()))
            {
                List<DTOPatient> lst = new List<DTOPatient>();
                SqlCommand cmd = new SqlCommand("", conn);
                string where = "where 0=1 ";
                bool is_where = false;
                //if(!string.IsNullOrEmpty(fio))
                //{
                //    is_where = true;
                //    where += " or rtrim(ltrim(UPPER(fio))) = @fio ";
                //    cmd.Parameters.Add("@fio", SqlDbType.VarChar).Value = fio.ToUpper().Trim();
                //}

                if (!string.IsNullOrEmpty(phone))
                {
                    is_where = true;
                    where += " or rtrim(ltrim(UPPER(phone))) = @phone ";
                    cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = phone.ToUpper().Trim();
                }

                if (idm_patient != null)
                {
                    is_where = true;
                    where += " or id = @id";
                    cmd.Parameters.AddWithValue("@id", idm_patient);
                }
                if (!is_where)
                    return lst;

                string prof = string.Format(@"select top 100 id, fio, date_b, phone, age
                                            from Patient p with (nolock)
                                            {0}
                                            order by fio", where);

                conn.Open();
                cmd.CommandText = prof;
                cmd.CommandTimeout = 0;

                SqlDataReader reader = cmd.ExecuteReader();

                List<DTOPatient> tmp_fromMap = reader.MapToModel<DTOPatient>();



                lst.AddRange(tmp_fromMap);

                return lst;
            }

        }

        public List<Patient> GetPatients(int idm_patient)
        {
            using (var _Context = currentContext)
            {
                var patient = _Context.Patients.Where(x => x.id == idm_patient).ToList();

                return patient;
            }
        }
        public List<Patient> GetPatients(string idm_1c_patient)
        {
            using (var _Context = currentContext)
            {
                var patient = _Context.Patients.Where(x => x.idm_1c == idm_1c_patient).ToList();

                return patient;
            }
        }
    }

    public interface IPatientRepository
    {
        Patient GetPatient(int idm_patient);
        Patient GetPatient1C(string idm_patient_1c);
        List<Patient> GetPatients(int idm_patient);
        List<Patient> GetPatients(string idm_1c_patient);
        bool SubmitPatient(Patient model);
        List<DTOPatient> GetDTOPatients(int? idm_patient = null, string phone = null);
        IQueryable<Patient> GetPatient(Func<Patient, bool> ins = null, int? Take = null, int? Skip = null);
    }
}
