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
        private string _pathPatternXML;
        /// <summary>
        /// Путь к SQL-запросу.
        /// </summary>
        private string _pathQuery;
        /// <summary>
        /// Шаблон XML.
        /// </summary>
        private string _patternXML;
        /// <summary>
        /// Шаблон SQL-запроса.
        /// </summary>
        private string _query;
        /// <summary>
        /// Исполнитель SQL-запросов.
        /// </summary>
        private ExecutorQuerySQL _executorQuerySQL;

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*Public-методы*/

        public FormMain() {
            InitializeComponent();
            _pathPatternXML = null;
            _pathQuery = null;
            /*
            _pathExe = Environment.CurrentDirectory;
            _pathPattern = _pathExe + "\\Sourse\\PatternXML.xml";
            _pathQuery = _pathExe + "\\Sourse\\Query.sql";
            ExecutorQuerySQL executorQuerySQL = new ExecutorQuerySQL();
            ReaderTextFile reader = new ReaderTextFile();
            string query = reader.getText(_pathQuery);
            string patternXML = reader.getText(_pathPattern);
            List<DataTable> result = executorQuerySQL.executeComamnd(query);
            GeneratorXML generator = new GeneratorXML();
            string xml = generator.generateXML(patternXML, result);
            System.IO.File.WriteAllText($"{_pathExe}\\Sourse\\TestFile.txt", xml);
            */
        }

        /// <summary>
        /// Выбор шаблона XML документа.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonSelectPatternXML_Click(object sender, EventArgs e) {
            if (openFileDialog.ShowDialog() == DialogResult.OK) {
                _pathPatternXML = openFileDialog.FileName;
                ReaderTextFile reader = new ReaderTextFile();
                _patternXML = reader.getText(_pathPatternXML);
                buttonSelectPatternXML.BackColor = Color.LightGreen;
                if (canExecute()) {
                    buttonExecute.BackColor = Color.LightGreen;
                    buttonExecute.Enabled = true;
                }
            }
        }

        /// <summary>
        /// Выбор SQL-запроса.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonSelectQuerySQL_Click(object sender, EventArgs e) {
            if (openFileDialog.ShowDialog() == DialogResult.OK) {
                _pathQuery = openFileDialog.FileName;
                ReaderTextFile reader = new ReaderTextFile();
                _query = reader.getText(_pathQuery);
                buttonSelectQuerySQL.BackColor = Color.LightGreen;
                if (canExecute()) {
                    buttonExecute.BackColor = Color.LightGreen;
                    buttonExecute.Enabled = true;
                }
            }
        }

        /// <summary>
        /// Выполнение.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonExecute_Click(object sender, EventArgs e) {
            FormLogging formLogging;
            if (_executorQuerySQL != null) {
                formLogging = new FormLogging(_executorQuerySQL);
            }
            else {
                formLogging = new FormLogging();
            }
            formLogging.ShowDialog();
            if (formLogging.DialogResult == DialogResult.OK) {
                if (formLogging.ExecutorQuerySQL.ThereIsConnection) {
                    MessageBox.Show("Успешное подключение.", "Результат подключения", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    _executorQuerySQL = formLogging.ExecutorQuerySQL;
                    List<DataTable> result = _executorQuerySQL.executeComamnd(_query);
                    GeneratorXML generator = new GeneratorXML();
                    string xml = generator.generateXML(_patternXML, result);
                    if (saveFileDialog.ShowDialog() == DialogResult.OK) {
                        System.IO.File.WriteAllText(saveFileDialog.FileName, xml);
                        MessageBox.Show("Файл сохранен", "Сохранение файла", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else {
                    MessageBox.Show("Не удалось подключиться!", "Результат подключения", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        /// <summary>
        /// Проверка на возможность выполнения.
        /// </summary>
        /// <returns>Возможность выполнения.</returns>
        private bool canExecute() {
            return _pathPatternXML != null && _pathQuery != null;
        }

        /// <summary>
        /// Очистка таблицы.
        /// </summary>
        /// <param name="dataGridView">Таблица.</param>
        private void clearDataGridView(DataGridView dataGridView) {
            dataGridView.Invoke(new Action(() => dataGridView.Rows.Clear()));
        }

        /// <summary>
        /// Добавить строку в таблицу.
        /// </summary>
        /// <param name="dataGridView">Таблица.</param>
        private void addRowDataGridView(DataGridView dataGridView) {
            dataGridView.Invoke(new Action(() => dataGridView.Rows.Add()));
        }

        /// <summary>
        /// Установка значения в ячейку таблицы.
        /// </summary>
        /// <param name="dataGridView">Таблица.</param>
        /// <param name="row">Строка.</param>
        /// <param name="columnName">Название столбца.</param>
        /// <param name="value">Значение.</param>
        private void setCellValueDataGridView(DataGridView dataGridView, int row, string columnName, string value) {
            dataGridView.Invoke(new Action(() => dataGridView[columnName, row].Value = value));
        }

        private List<Token> getTokensFromDataGridView(DataGridView dataGridView) {
            List<Token> token = new List<Token>();
            for (int i = 0; i < dataGridView.Rows.Count; i++) {
                token.Add(new Token(dataGridView["CodeParametr", i].Value.ToString(), dataGridView["Value", i].Value.ToString()));
            }
            return token;
        }
    }
}
