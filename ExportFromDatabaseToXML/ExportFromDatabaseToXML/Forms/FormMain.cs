using ExportFromDatabaseToXML.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExportFromDatabaseToXML
{
    public partial class FormMain : Form
    {
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*Атрибуты*/

        /// <summary>
        /// Путь к EXE-файлу.
        /// </summary>
        private string _pathExe;
        /// <summary>
        /// Путь к шаблону XML.
        /// </summary>
        private string _pathPattern;
        /// <summary>
        /// Путь к SQL-запросу.
        /// </summary>
        private string _pathQuery;

        private class Mark
        {
            public int startPosition;
            public int endPosition;
            public bool isCloseMark;
            public string name;
            public string fieldThisMarkForLink;
            public string fieldHigherMarkForLink;
            public string higherMarkName;
        }


        public FormMain() {
            InitializeComponent();
            _pathExe = Environment.CurrentDirectory;
            _pathPattern = _pathExe + "\\Sourse\\PatternXML.xml";
            _pathQuery = _pathExe + "\\Sourse\\Query.sql";
            ExecutorQuerySQL executorQuerySQL = new ExecutorQuerySQL("");
            ReaderTextFile reader = new ReaderTextFile();
            string query = reader.getText(_pathQuery);
            string patternXML = reader.getText(_pathPattern);
            List<DataTable> result = executorQuerySQL.executeComamnd(query);
            GeneratorXML generator = new GeneratorXML();
            string xml = generator.generateXML(patternXML, result);
            System.IO.File.WriteAllText($"{_pathExe}\\Sourse\\TestFile.txt", xml);
        }
    }
}
