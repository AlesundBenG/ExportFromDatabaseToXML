using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExportFromDatabaseToXML.Classes
{
    public class GeneratorXML
    {
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*Внутренние классы*/

        /// <summary>
        /// Часть сгенерированного XML.
        /// </summary>
        private class PartXML
        {
            /// <summary>
            /// Часть XML со вставленными данными.
            /// </summary>
            public string data;
            /// <summary>
            /// Значение для связки с вышестоящей частью XML.
            /// </summary>
            public string forLink;
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*Public-методы*/

        /// <summary>
        /// Генерация XML по шаблону и данным.
        /// </summary>
        /// <param name="patternXML">Шаблон XML.</param>
        /// <param name="data">Данные для вставки.</param>
        /// <returns>XML</returns>
        public string generateXML(string patternXML, List<DataTable> data) {
            //Копия XML.
            string xml = patternXML;
            //Получение секции 2.
            int startSection2 = xml.IndexOf("#ResultSection.2#") + "#ResultSection.2#".Length;
            int endSection2 = xml.IndexOf("#/ResultSection.2#");
            string patternSection2 = xml.Substring(startSection2, endSection2 - startSection2);
            //Удаление секции 2.
            xml = xml.Remove(startSection2, patternSection2.Length + "#/ResultSection.2#".Length);
            //Получение секции 1.
            int startSection1 = xml.IndexOf("#ResultSection.1#") + "#ResultSection.1#".Length;
            int endSection1 = xml.IndexOf("#/ResultSection.1#");
            string patternSection1 = xml.Substring(startSection1, endSection1 - startSection1);
            //Удаление секции 1.
            xml = xml.Remove(startSection1, patternSection1.Length + "#/ResultSection.1#".Length);
            //Вставка значений в секции 2.
            List<PartXML> sections2 = new List<PartXML>();
            for (int row = 0; row < data[1].Rows.Count; row++) {
                string patternWithData = patternSection2;
                for (int column = 0; column < data[1].Columns.Count; column++) {
                    string columnName = data[1].Columns[column].ColumnName;
                    patternWithData = patternWithData.Replace($"#{columnName}#", data[1].Rows[row][column].ToString());
                }
                sections2.Add(new PartXML() {
                    data = patternWithData,
                    forLink = data[1].Rows[row][0].ToString()
                });
            }
            //Вставка значений в секции 1.
            List<PartXML> sections1 = new List<PartXML>();
            for (int row = 0; row < data[0].Rows.Count; row++) {
                string patternWithData = patternSection1;
                for (int column = 0; column < data[0].Columns.Count; column++) {
                    string columnName = data[0].Columns[column].ColumnName;
                    patternWithData = patternWithData.Replace($"#{columnName}#", data[0].Rows[row][column].ToString());
                }
                //Вставка из секции 2.
                for (int k = 0; k < sections2.Count; k++) {
                    if (sections2[k].forLink == data[0].Rows[row][0].ToString()) {
                        int startInsertSection2 = patternWithData.IndexOf("#ResultSection.2#");
                        patternWithData = patternWithData.Insert(startInsertSection2, sections2[k].data);
                    }
                }
                int startInsertSection1 = xml.IndexOf("#ResultSection.1#");
                xml = xml.Insert(startInsertSection1, patternWithData);
            }
            //Удаление меток.
            xml = xml.Replace("#ResultSection.2#", "");
            xml = xml.Replace("#ResultSection.1#", "");
            //Удаление пустых тегов и пустых строк.
            RemoverEmptyTagFromXML remover = new RemoverEmptyTagFromXML();
            xml = remover.removeEmptyTagFromXML(xml);
            return deleteEmptyLines(xml);
        }

        /// <summary>
        /// Удаление пустых строк.
        /// </summary>
        /// <param name="str">Список строк в одной строке с разделителями \r\n</param>
        /// <returns></returns>
        private string deleteEmptyLines(string str) {
            var lines = str.Split(new string[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);
            string result = "";
            for (int i = 0; i < lines.Length; i++) {
                bool isEmpty = true;
                string temp = lines[i].ToString();
                for (int j = 0; j < temp.Length; j++) {
                    if (temp[j] != '\t' && temp[j] != ' ') {
                        isEmpty = false;
                        break;
                    }
                }
                if (!isEmpty) {
                    result = result + temp + "\r\n";
                }
            }
            return result;
        }
    }
}

