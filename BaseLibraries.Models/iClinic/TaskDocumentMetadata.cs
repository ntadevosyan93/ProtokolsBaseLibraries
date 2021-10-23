using BaseLibraries.Abstractions.Models;
using BaseLibraries.Abstractions.Models.iClinic;
using System.ComponentModel.DataAnnotations;

namespace BaseLibraries.Models.iClinic
{
    public class TaskDocumentMetadata : IEntity
    {
        [Key, ColumnMap("id")]
        public int id { get; set; }

        [ColumnMap("idm_task")]
        public int idm_task { get; set; }

        [ColumnMap("bind_name")]
        public string bind_name { get; set; }

        [ColumnMap("data")]
        public byte[] data { get;set;}
    }

    public static class TaskDocumentMetadataExtension
    {
        public static void ClearLink(this TaskDocumentMetadata source)
        {
            source.id = -1;
            source.idm_task = -1;
        }

        public static TaskDocumentMetadata LinkTo(this TaskDocumentMetadata source, IProtocolView target)
        {
            return new TaskDocumentMetadata
            {
                idm_task = target.idm_task,
                bind_name = source.bind_name,
                data = source.data
            };
        }
    }
}
