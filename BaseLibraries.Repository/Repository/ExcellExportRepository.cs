using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Repository.Repository
{
    public class ExcellExportRepository : IExcellExportRepository
    {
        public ExcellExportRepository()
        {

        }
        string _report_templates = @"C:\Report_Templates";
        public SpreadsheetDocument OpenXlsTemplate(string filepath, out string  file_guid)
        {
            file_guid = Guid.NewGuid().ToString();
            string rash = Path.GetExtension(filepath);
            string path_from = _report_templates + @"\" + filepath;
            string path_to = _report_templates + @"\" + file_guid + rash;
            File.Copy(path_from, path_to);

            SpreadsheetDocument spreadsheetDocument = SpreadsheetDocument.Open(_report_templates + @"\" + file_guid + rash,true );
             
            return spreadsheetDocument;
        }

        public void WriteDataExcell<TDTO>(SpreadsheetDocument xls, List<TDTO> lst) where TDTO:class
        {
            //1 ищу в эксцеле строку #import и пока что просто туда вставляю всё что есть
            WorkbookPart wbPart = xls.WorkbookPart;
            var exSheet = wbPart.Workbook.Descendants<Sheet>().Where(x=>x.Name== "экспорт").FirstOrDefault();
            if (exSheet == null)
                throw new Exception("Не найден лист!!!");

            Worksheet exWorksheet = ((WorksheetPart)wbPart.GetPartById(exSheet.Id)).Worksheet;
            SheetData sheetData = exWorksheet.GetFirstChild<SheetData>();


            var model = typeof(TDTO);
            var values = new List<TDTO>();
            var hashtable = new Hashtable();

            uint row = 2;
            foreach (var item in lst)
            {
                int i = 1;
                Row row_data = new Row { RowIndex = (uint)row };
                foreach (var prop in model.GetProperties())
                {
                    var source = prop.GetValue(item);
                    Cell add = new Cell
                    {
                        CellValue = new CellValue((source?.ToString())),
                        DataType = CellValues.String,
                        CellReference = GetExcelColumnName(i) + row
                    };
                    row_data.Append(add);

                    i++;
                }
                sheetData.Append(row_data);
                row++;
            }

            xls.Save();
            xls.Close();
        }

        public void DeleteFile(string file_guid)
        {
            File.Delete(_report_templates + @"\" + file_guid + ".xlsx");
        }
        private string GetExcelColumnName(int columnNumber)
        {
            int dividend = columnNumber;
            string columnName = String.Empty;
            int modulo;

            while (dividend > 0)
            {
                modulo = (dividend - 1) % 26;
                columnName = Convert.ToChar(65 + modulo).ToString() + columnName;
                dividend = (int)((dividend - modulo) / 26);
            }

            return columnName;
        }



    }

    public interface IExcellExportRepository
    {
        SpreadsheetDocument OpenXlsTemplate(string filepath, out string file_guid);
        void WriteDataExcell<TDTO>(SpreadsheetDocument xls, List<TDTO> lst) where TDTO : class;
        void DeleteFile(string file_guid);
    }

}
