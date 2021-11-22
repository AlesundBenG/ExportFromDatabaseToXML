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
        /// <summary>
        /// Информация о пометках.
        /// </summary>
        private class Mark
        {
            public int      startPosition;
            public int      endPosition;
            public string   name;
            public bool     isCloseMark;
        }

        private class PlaceForInsert
        {
            public string namePlace;
            public string place;
            public string higherLevelPlace;
        }



        public string generateXML(string patternXML, List<DataTable> date) {
            string xml = patternXML;

            List<PlaceForInsert> placeForInsert = new List<PlaceForInsert>();
            Mark mark = getNextMark(xml, 0);
            Mark closeMark = getCloseMark(ref xml, mark, placeForInsert);
            addPlaceForInsert(ref xml, placeForInsert, mark, closeMark, null);
            return "";
        }




        /// <summary>
        /// По открывающей метке найти закрывающую метку.
        /// </summary>
        /// <param name="text">Текст для поиска.</param>
        /// <param name="headerMark">Метка, для которой ищется закрывающая метка.</param>
        /// <returns>Закрывающая метка.</returns>
        private Mark getCloseMark(ref string text, Mark headerMark, List<PlaceForInsert> placeForInsert) {
            //Получаем следующий тег, идущий после текущего.
            Mark nextMark = getNextMark(text, headerMark.endPosition);
            while (!(nextMark.isCloseMark && nextMark.name == headerMark.name)) {
                Mark closeNextMark = getCloseMark(ref text, nextMark, placeForInsert);
                int currentPosition = nextMark.startPosition + 1;
                addPlaceForInsert(ref text, placeForInsert, nextMark, closeNextMark, headerMark);
                nextMark = getNextMark(text, currentPosition);
            }
            return nextMark;
        }

        /// <summary>
        /// Получить первую пометку, идущую после заданной позиции.
        /// </summary>
        /// <param name="text">Текст.</param>
        /// <param name="startPosition">Начальная позиция для поиска.</param>
        private Mark getNextMark(string text, int startPosition) {
            for (int i = startPosition; i < text.Length; i++) {
                if (text[i] == '#') {
                    string a = text.Substring(i + 1, 13);
                    if (text.Substring(i + 1, 13) == "ResultSection" || text.Substring(i + 1, 14) == "/ResultSection") {
                        bool isCloseMark = (text.Substring(i + 1, 1) == "/");
                        string mark = text.Substring(i + 1 + Convert.ToInt32(isCloseMark), text.IndexOf('#', i + 1) - i - 1 - Convert.ToInt32(isCloseMark));
                        return new Mark() {
                            startPosition = i + Convert.ToInt32(text.Substring(i + 1, 1) == "/"),
                            endPosition = i + mark.Length + 2 + Convert.ToInt32(text.Substring(i + 1, 1) == "/"),
                            name = mark,
                            isCloseMark = (text.Substring(i + 1, 1) == "/")
                        };
                    }
                }
            }
            return null;
        }

        /// <summary>
        /// Помещение места для вставки в список, с удалением и заменой этого места в основном тексте.
        /// </summary>
        /// <param name="text">Исходный текст.</param>
        /// <param name="placeForInsert">Список мест для вставки.</param>
        /// <param name="headerMark">Открывающая метка.</param>
        /// <param name="closeMark">Закрывающаяся метка.</param>
        /// <param name="higherLevelMark">Вышестоящее место (место, которое включает данное место).</param>
        private void addPlaceForInsert(ref string text, List<PlaceForInsert> placeForInsert, Mark headerMark, Mark closeMark, Mark higherLevelMark) {
            //Копирование места для вставки.
            PlaceForInsert place = new PlaceForInsert() {
                namePlace           = headerMark.name,
                place               = text.Substring(headerMark.endPosition, closeMark.startPosition - headerMark.endPosition - 1),
                higherLevelPlace    = (higherLevelMark == null) ? null : higherLevelMark.name
            };
            placeForInsert.Add(place);
            //Замена места ключевым словом.
            text = text.Remove(headerMark.startPosition, closeMark.endPosition - headerMark.startPosition);
            text = text.Insert(headerMark.startPosition, $"#{headerMark.name}#");
        }
    }
}
