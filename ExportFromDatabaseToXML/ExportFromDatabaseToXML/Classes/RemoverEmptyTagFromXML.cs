using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExportFromDatabaseToXML.Classes
{
    public class RemoverEmptyTagFromXML
    {
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*Внутренние классы*/
        /// <summary>
        /// Информация о теге.
        /// </summary>
        private class Tag
        {
            /// <summary>
            /// Позиция, с которой начинается тег.
            /// </summary>
            public int startPosition;
            /// <summary>
            /// Позиция, идущая после тега.
            /// </summary>
            public int endPosition;
            /// <summary>
            /// Имя тега.
            /// </summary>
            public string name;
            /// <summary>
            /// Флаг, является ли тег закрывающим.
            /// </summary>
            public bool isCloseTag;
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*Public-методы*/

        /// <summary>
        /// Удалить пустые теги из XML.
        /// </summary>
        /// <param name="xml">Тест XML.</param>
        /// <returns>Исходный текст XML с удаленными пустыми тегами.</returns>
        public string removeEmptyTagFromXML(string xml) {
            Tag headerTag = getNextTag(xml, 0);
            while (headerTag != null) {
                Tag closeTag = getCloseTag(ref xml, headerTag); //Поиск закрывающего тега с удалением пустых тегов во вложенных тегов в данный тег.
                int positionForContinueSearch;
                if (isEmptyTag(xml, headerTag, closeTag)) {
                    xml = removeTag(xml, headerTag, closeTag);
                    positionForContinueSearch = headerTag.startPosition;  //После удаления пустого тега, поиск нужно продлжать с места, где начинался пустой тег.
                }
                else {
                    positionForContinueSearch = closeTag.endPosition;
                }
                headerTag = getNextTag(xml, positionForContinueSearch);
            }
            return xml;
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*Private-методы*/

        /// <summary>
        /// Получить первый тег, идущий после заданной позиции.
        /// </summary>
        /// <param name="text">Текст.</param>
        /// <param name="startPosition">Начальная позиция для поиска.</param>
        /// <returns>Тег, идущий после заданной позиции, либо NULL.</returns>
        private Tag getNextTag(string text, int startPosition) {
            int startPositionTag = goWhileNotMeetThoseSymbols(text, startPosition, new char[] { '<' });
            if (startPositionTag == -1) {
                return null;
            }
            bool isCloseTag = text[startPositionTag + 1] == '/';
            int endPositionNameTag = goWhileNotMeetThoseSymbols(text, startPositionTag, new char[] { ' ', '\t', '>' });
            if (endPositionNameTag == -1) {
                int lengthNameForPring = (text.Length - startPositionTag > 15) ? 15 : text.Length - startPositionTag;
                throw new Exception($"Ошибка чтения тега: не найден закрывающий символ у тега {text.Substring(startPositionTag, lengthNameForPring)}");
            }
            string nameTag = text.Substring(startPositionTag + 1 + Convert.ToInt32(isCloseTag), endPositionNameTag - startPositionTag - 1 - Convert.ToInt32(isCloseTag));
            int endPositionTag = endPositionNameTag;
            if (text[endPositionNameTag] != '>') {
                endPositionTag = goWhileNotMeetThoseSymbols(text, endPositionNameTag, new char[] { '>' });
                if (endPositionTag == -1) {
                    int lengthNameForPring = (text.Length - startPositionTag > 15) ? 15 : text.Length - startPositionTag;
                    throw new Exception($"Ошибка чтения тега: не найден закрывающий символ у тега {text.Substring(startPositionTag, lengthNameForPring)}");
                }
            }
            else {
                endPositionTag++;
            }
            return new Tag() {
                startPosition = startPositionTag,
                endPosition = endPositionTag,
                name = nameTag,
                isCloseTag = isCloseTag
            };
        }

        /// <summary>
        /// Поиск закрывающего тега с удалением пустых тегов во вложенных тегов в данный тег.
        /// </summary>
        /// <param name="text">Текст для поиска.</param>
        /// <param name="headerTag">Тег, для которого ищется закрывающий тег.</param>
        /// <returns>Закрывающий тег и изменненный текст из-за удаления пустых тегов во вложенных тегах.</returns>
        private Tag getCloseTag(ref string text, Tag headerTag) {
            Tag nextTag = getNextTag(text, headerTag.endPosition);
            while (!(nextTag.isCloseTag && nextTag.name == headerTag.name)) {
                Tag closeNextTag = getCloseTag(ref text, nextTag);
                int currentPosition = closeNextTag.endPosition + 1;
                if (isEmptyTag(text, nextTag, closeNextTag)) {
                    text = removeTag(text, nextTag, closeNextTag);
                    currentPosition = nextTag.startPosition;
                }
                nextTag = getNextTag(text, currentPosition);
            }
            return nextTag;
        }

        /// <summary>
        /// Проверка на пустой тег.
        /// </summary>
        /// <param name="text">Строка, в котором располагается тег.</param>
        /// <param name="headerTag">Открывающий тег.</param>
        /// <param name="closeTag">Закрывающий тег.</param>
        /// <returns></returns>
        private bool isEmptyTag(string text, Tag headerTag, Tag closeTag) {
            string textBetweenTags = text.Substring(headerTag.endPosition, closeTag.startPosition - headerTag.endPosition);
            int positionAfterSpace = goWhileMeetThoseSymbols(textBetweenTags, 0, new char[] { ' ', '\t', '\n', '\r' });
            return (positionAfterSpace == -1);
        }

        /// <summary>
        /// Удаление тега и его содержимого.
        /// </summary>
        /// <param name="text">Строка, в котором располагается тег.</param>
        /// <param name="headerTag">Открывающий тег.</param>
        /// <param name="closeTag">Закрывающий тег.</param>
        /// <returns></returns>
        private string removeTag(string text, Tag headerTag, Tag closeTag) {
            string textBefore = text.Substring(0, headerTag.startPosition);
            string textAfter = text.Substring(closeTag.endPosition, text.Length - closeTag.endPosition);
            return textBefore + textAfter;
        }

        /// <summary>
        /// Идти по строке, пока встречаются указанные символы.
        /// </summary>
        /// <param name="text">Исходная строка</param>
        /// <param name="startPosition">Начальна позиция</param>
        /// <param name="symbol">Массив символов</param>
        /// <returns>Позиция, на которой встречен иной символ. Если дошли до конца строки, то  -1</returns>
        private int goWhileMeetThoseSymbols(string text, int startPosition, char[] symbol) {
            int currentPosition = startPosition;
            bool foundSymbol;
            while (currentPosition < text.Length) {
                foundSymbol = false;
                for (int i = 0; i < symbol.Length; i++) {
                    if (text[currentPosition] == symbol[i]) {
                        currentPosition++;
                        foundSymbol = true;
                        break;
                    }
                }
                if (!foundSymbol) {
                    return currentPosition;
                }
            }
            return -1;
        }

        /// <summary>
        /// Идти по строке, пока не встретются указанные символы.
        /// </summary>
        /// <param name="text">Исходная строка</param>
        /// <param name="startPosition">Начальна позиция</param>
        /// <param name="symbol">Массив символов</param>
        /// <returns>Позиция, на которой встречен один из указанных символов. Если дошли до конца строки, то  -1</returns>
        private int goWhileNotMeetThoseSymbols(string text, int startPosition, char[] symbol) {
            int currentPosition = startPosition;
            while (currentPosition < text.Length) {
                for (int i = 0; i < symbol.Length; i++) {
                    if (text[currentPosition] == symbol[i]) {
                        return currentPosition;
                    }
                }
                currentPosition++;
            }
            return -1;
        }
    }
}
