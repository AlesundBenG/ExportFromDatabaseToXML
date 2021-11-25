﻿
namespace ExportFromDatabaseToXML
{
    partial class FormMain
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent() {
            this.groupBoxSetting = new System.Windows.Forms.GroupBox();
            this.groupBoxExecution = new System.Windows.Forms.GroupBox();
            this.buttonSelectPatternXML = new System.Windows.Forms.Button();
            this.buttonSelectQuerySQL = new System.Windows.Forms.Button();
            this.dataGridViewQueryParametrs = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.buttonExecute = new System.Windows.Forms.Button();
            this.CodeParametr = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Value = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.groupBoxSetting.SuspendLayout();
            this.groupBoxExecution.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewQueryParametrs)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBoxSetting
            // 
            this.groupBoxSetting.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBoxSetting.BackColor = System.Drawing.Color.LightGray;
            this.groupBoxSetting.Controls.Add(this.buttonSelectQuerySQL);
            this.groupBoxSetting.Controls.Add(this.buttonSelectPatternXML);
            this.groupBoxSetting.Location = new System.Drawing.Point(13, 14);
            this.groupBoxSetting.Name = "groupBoxSetting";
            this.groupBoxSetting.Size = new System.Drawing.Size(759, 130);
            this.groupBoxSetting.TabIndex = 0;
            this.groupBoxSetting.TabStop = false;
            this.groupBoxSetting.Text = "Настройка";
            // 
            // groupBoxExecution
            // 
            this.groupBoxExecution.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBoxExecution.BackColor = System.Drawing.Color.LightGray;
            this.groupBoxExecution.Controls.Add(this.buttonExecute);
            this.groupBoxExecution.Controls.Add(this.label1);
            this.groupBoxExecution.Controls.Add(this.dataGridViewQueryParametrs);
            this.groupBoxExecution.Location = new System.Drawing.Point(13, 150);
            this.groupBoxExecution.Name = "groupBoxExecution";
            this.groupBoxExecution.Size = new System.Drawing.Size(759, 399);
            this.groupBoxExecution.TabIndex = 1;
            this.groupBoxExecution.TabStop = false;
            this.groupBoxExecution.Text = "Выполнение";
            // 
            // buttonSelectPatternXML
            // 
            this.buttonSelectPatternXML.BackColor = System.Drawing.Color.Orange;
            this.buttonSelectPatternXML.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSelectPatternXML.Location = new System.Drawing.Point(6, 33);
            this.buttonSelectPatternXML.Name = "buttonSelectPatternXML";
            this.buttonSelectPatternXML.Size = new System.Drawing.Size(145, 23);
            this.buttonSelectPatternXML.TabIndex = 3;
            this.buttonSelectPatternXML.Text = "Выбрать XML-шаблон";
            this.buttonSelectPatternXML.UseVisualStyleBackColor = false;
            this.buttonSelectPatternXML.Click += new System.EventHandler(this.buttonSelectPatternXML_Click);
            // 
            // buttonSelectQuerySQL
            // 
            this.buttonSelectQuerySQL.BackColor = System.Drawing.Color.Orange;
            this.buttonSelectQuerySQL.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSelectQuerySQL.Location = new System.Drawing.Point(6, 81);
            this.buttonSelectQuerySQL.Name = "buttonSelectQuerySQL";
            this.buttonSelectQuerySQL.Size = new System.Drawing.Size(145, 23);
            this.buttonSelectQuerySQL.TabIndex = 3;
            this.buttonSelectQuerySQL.Text = "Выбрать SQL-запрос";
            this.buttonSelectQuerySQL.UseVisualStyleBackColor = false;
            this.buttonSelectQuerySQL.Click += new System.EventHandler(this.buttonSelectQuerySQL_Click);
            // 
            // dataGridViewQueryParametrs
            // 
            this.dataGridViewQueryParametrs.AllowUserToAddRows = false;
            this.dataGridViewQueryParametrs.AllowUserToDeleteRows = false;
            this.dataGridViewQueryParametrs.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewQueryParametrs.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridViewQueryParametrs.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewQueryParametrs.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.CodeParametr,
            this.Value});
            this.dataGridViewQueryParametrs.Location = new System.Drawing.Point(9, 41);
            this.dataGridViewQueryParametrs.Name = "dataGridViewQueryParametrs";
            this.dataGridViewQueryParametrs.Size = new System.Drawing.Size(744, 323);
            this.dataGridViewQueryParametrs.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(145, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Переменные SQL-запроса:";
            // 
            // buttonExecute
            // 
            this.buttonExecute.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonExecute.BackColor = System.Drawing.Color.Orange;
            this.buttonExecute.Enabled = false;
            this.buttonExecute.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonExecute.Location = new System.Drawing.Point(678, 370);
            this.buttonExecute.Name = "buttonExecute";
            this.buttonExecute.Size = new System.Drawing.Size(75, 23);
            this.buttonExecute.TabIndex = 4;
            this.buttonExecute.Text = "Выполнить";
            this.buttonExecute.UseVisualStyleBackColor = false;
            this.buttonExecute.Click += new System.EventHandler(this.buttonExecute_Click);
            // 
            // CodeParametr
            // 
            this.CodeParametr.HeaderText = "Код";
            this.CodeParametr.Name = "CodeParametr";
            // 
            // Value
            // 
            this.Value.HeaderText = "Значение";
            this.Value.Name = "Value";
            // 
            // openFileDialog
            // 
            this.openFileDialog.FileName = "openFileDialog1";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(784, 561);
            this.Controls.Add(this.groupBoxExecution);
            this.Controls.Add(this.groupBoxSetting);
            this.MinimumSize = new System.Drawing.Size(640, 480);
            this.Name = "FormMain";
            this.Text = "Генерация XML файла из базы данных.";
            this.groupBoxSetting.ResumeLayout(false);
            this.groupBoxExecution.ResumeLayout(false);
            this.groupBoxExecution.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewQueryParametrs)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBoxSetting;
        private System.Windows.Forms.Button buttonSelectQuerySQL;
        private System.Windows.Forms.Button buttonSelectPatternXML;
        private System.Windows.Forms.GroupBox groupBoxExecution;
        private System.Windows.Forms.Button buttonExecute;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridViewQueryParametrs;
        private System.Windows.Forms.DataGridViewTextBoxColumn CodeParametr;
        private System.Windows.Forms.DataGridViewTextBoxColumn Value;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.SaveFileDialog saveFileDialog;
    }
}

