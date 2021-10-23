using BaseLibraries.Abstractions.Models.iClinic;
using BaseLibraries.Common;
using System;
using System.Collections.Generic;

namespace BaseLibraries.Abstractions.Models
{
    public interface IHandBook
    {
        bool IsDataLost { get; }

        event EventHandler OnDataChanged;
        void FireOnDataChanged();
        IEnumerable<IMkb10> Mkb10List { get; }
        IEnumerable<IService> ServiceList { get; }
        IEnumerable<IPlace> Places { get; }
        IEnumerable<IEmployeeView> Employees { get; }
        List<IEmployeePharmView> EmployeePharms { get; set; }
        List<OutClassService> OutClassServices { get; }
        void LoadEmployeePharm(int idm_employee);
        void SaveEmployeePharms();
        IEnumerable<IMkb10> GetMkbsRange(string startCode, string endCode);

        IEnumerable<IService> GetServicesByRoot(int id);
        int GetServiceRootID(int idm_service);
        int GetServiceParentID(int serviceID);
        bool IsExistsServiceInRoot(int serviceID, int rootID);
    }
}
