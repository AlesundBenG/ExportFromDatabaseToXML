--------------------------------------------------------------------------------------------------------------------------------


--Константы.
DECLARE @currentDate            DATE        = CONVERT(DATE, GETDATE()) --Текущая дата.
DECLARE @actStatus              INT         = 10                        --Действующие записи, не удаленные и не архивные.
DECLARE @actDoc                 INT         = 1                         --Статус действующих документов.
DECLARE @deliveryRussianPost    INT         = 1                         --Доставка почтой.


--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


--Удаление таблицы.
IF OBJECT_ID('tempdb..#КЛАССИФИКАТОР_ПРАВОПОДТВЕРЖДАЮЩИХ_ДОКУМЕНТОВ') IS NOT NULL BEGIN DROP TABLE #КЛАССИФИКАТОР_ПРАВОПОДТВЕРЖДАЮЩИХ_ДОКУМЕНТОВ END 
--Создание таблицы.
CREATE TABLE #КЛАССИФИКАТОР_ПРАВОПОДТВЕРЖДАЮЩИХ_ДОКУМЕНТОВ (
    [Код документа] INT,
    [Код меры]      VARCHAR(5),
    [Владелец]      INT,        --0 - Не важно, 1 - Правообладатель, 2 - Лицо, на основании которого...
)
INSERT INTO #КЛАССИФИКАТОР_ПРАВОПОДТВЕРЖДАЮЩИХ_ДОКУМЕНТОВ ([Код документа], [Код меры], [Владелец])
VALUES
    (1862, '02800', 2),
    (2164, '02800', 2),
    (2841, '02800', 0),
    (1799, '02800', 0),
    (2687, '02500', 0),
    (2923, '02500', 0),
    (2275, '02500', 0),
    (1799, '02500', 0),
    (4036, '02500', 0),
    (1862, '02700', 1),
    (2164, '02700', 2),
    (2922, '02700', 2),
    (2404, '02700', 2),
    (2703, '02700', 2),
    (2923, '02700', 2),
    (2091,	'02601',	0),	--Но это не точно.
    (3800,	'02601',	0),	--Но это не точно.
    (1802,	'02601',	0),	--Но это не точно.
    (1796,	'02601',	0),	--Но это не точно.
    (2145,	'03100', 0),	--Но это не точно.
    (2586,	'03100', 0),	--Но это не точно.
    (2746,	'03100', 0),	--Но это не точно.
    (2091,	'03100', 0),	--Но это не точно.
    (1862, '03400', 2),    --Свидетельство о рождении
    (2683, '03400', 0),    --Справка о рождении формы №1 (ранее Справка о рождении ребенка (ф.24), выданная органами ЗАГС)
    (2705, '03500', 0),    --Договор о передаче ребенка на воспитание в приемную семью
    (2704, '03500', 0),    --Решение суда об усыновлении (удочерении) ребенка
    (1858, '03500', 0),    --Распоряжение или постановление Главы района (МО)
    (2125, '03500', 0),    --Выписка из решения органов местного самоуправления об опеке
    (2772, '03600', 0),    --Справка из воинской части о прохождении военной службы по призыву
    (2571, '03600', 0),    --Справка из женской консультации или другого мед.учреждения о постановке на учет в связи с беременностью
    (1862, '03700', 2),    --Свидетельство о рождении
    (1862, '03800', 2),    --Свидетельство о рождении
    (2772, '03800', 0),    --Справка из воинской части о прохождении военной службы по призыву
    (1799, '03900', 0),    --Справка МСЭ
    (2334, '03900', 0),    --Страховой полис обязательного страхования гражданской ответственности владельцев транспортных средств
    (3933, '03900', 0),     --Документ, подтверждающий наличие медицинских показаний на обеспечение транспортным средством
(2736,	'00501', 0),	--Но это не точно.
(2736,	'00502', 0),	--Но это не точно.
(2736,	'00503', 0),	--Но это не точно.
(2720,  '00504', 0), --Но это не точно.
(1802,  '00504', 0), --Но это не точно.
(1799,  '00504', 0), --Но это не точно.
(2736,  '00504', 0), --Но это не точно.
(1863,  '00504', 0), --Но это не точно.
(2715,  '00504', 0), --Но это не точно.
(2175,  '00504', 0), --Но это не точно.
(2051,  '00504', 0), --Но это не точно.
(2829,  '00504', 0), --Но это не точно.
(2081,  '00504', 0), --Но это не точно.
(2050,  '00504', 0), --Но это не точно.
(2810,  '00504', 0), --Но это не точно.
(2596,  '00504', 0), --Но это не точно.
(1862,  '00504', 0), --Но это не точно.
(2309,  '00504', 0), --Но это не точно.
(2924,  '00504', 0), --Но это не точно.
(2121,  '00504', 0), --Но это не точно.
(1843,  '00504', 0), --Но это не точно.
(2295,  '00504', 0), --Но это не точно.
(2300,  '00504', 0), --Но это не точно.
(2827,  '00504', 0), --Но это не точно.
(1798,  '00504', 0), --Но это не точно.
(2743,  '00504', 0), --Но это не точно.
(2186,  '00504', 0), --Но это не точно.
(4037,  '00504', 0), --Но это не точно.
(2091,  '00504', 0), --Но это не точно.
(2935,  '00504', 0), --Но это не точно.
(2830,  '00504', 0), --Но это не точно.
(2832,  '00504', 0), --Но это не точно.
(1844,  '00504', 0), --Но это не точно.
(2083,  '00504', 0), --Но это не точно.
(1787,  '00504', 0), --Но это не точно.
(2178,  '00504', 0), --Но это не точно.
(2890,  '00504', 0), --Но это не точно.
(2946,  '00504', 0), --Но это не точно.
(1799,  '00701', 0), --Но это не точно.
(2736,  '00701', 0), --Но это не точно.
(2596,  '00701', 0), --Но это не точно.
(1863,  '00701', 0), --Но это не точно.
(1802,  '00701', 0), --Но это не точно.
(3892,  '00701', 0), --Но это не точно.
(2050,  '00701', 0), --Но это не точно.
(1803,  '00701', 0), --Но это не точно.
(3890,  '00701', 0), --Но это не точно.
(1862,  '00701', 0), --Но это не точно.
(2045,  '00701', 0), --Но это не точно.
(1827,  '00701', 0), --Но это не точно.
(1843,  '00701', 0), --Но это не точно.
(1826,  '00701', 0), --Но это не точно.
(2743,  '00701', 0), --Но это не точно.
(2779,  '00701', 0), --Но это не точно.
(2797,  '00701', 0), --Но это не точно.
(3888,  '00701', 0), --Но это не точно.
(3936,  '00701', 0), --Но это не точно.
(3889,  '00701', 0), --Но это не точно.
(2929,  '00701', 0), --Но это не точно.
(1844,  '00701', 0), --Но это не точно.
(3891,  '00701', 0), --Но это не точно.
(3939,  '00701', 0), --Но это не точно.
(2753,  '00701', 0), --Но это не точно.
(1840,  '00701', 0), --Но это не точно.
(1829,  '00701', 0), --Но это не точно.
(2799,  '00701', 0), --Но это не точно.
(2741,  '00701', 0), --Но это не точно.
(2740,  '00701', 0), --Но это не точно.
(2308,  '00701', 0), --Но это не точно.
(3938,  '00701', 0), --Но это не точно.
(1843,  '00702', 0),    --Но это не точно.
(2596,  '00702', 0),    --Но это не точно.
(2186,  '00702', 0),    --Но это не точно.
(1841,  '00702', 0),    --Но это не точно.
(1829,  '00702', 0),    --Но это не точно.
(1864,  '00702', 0),    --Но это не точно.
(1832,  '00702', 0),    --Но это не точно.
(1799,  '00702', 0),    --Но это не точно.
(2935,  '00702', 0),    --Но это не точно.
(2335,  '00702', 0),    --Но это не точно.
(2308,  '00702', 0),    --Но это не точно.
(1862,  '00204', 0),    --Но это не точно.
(2792,  '00204', 0),    --Но это не точно.
(1831,  '00204', 0),    --Но это не точно.
(2792,  '00205',    0), --Но это не точно.
(1862,  '00205',    0), --Но это не точно.
(1843,  '00205',    0), --Но это не точно.
(1864,  '00205',    0), --Но это не точно.
(2186,  '00205',    0), --Но это не точно.
(2736,  '00205',    0), --Но это не точно.
(1834,  '00205',    0), --Но это не точно.
(2786, '01100', 0) --Но это не точно.

   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


--Удаление таблицы.
IF OBJECT_ID('tempdb..#НАЗНАЧЕНИЯ') IS NOT NULL BEGIN DROP TABLE #НАЗНАЧЕНИЯ END 
--Создание таблицы.
CREATE TABLE #НАЗНАЧЕНИЯ (
    [Идентификатор]                                             INT,
    [ПравообладательМСП]                                        INT,                --Блок;     Обязательный;                                                       Сведения о правообладателе мер социальной поддержки.
    [ПравообладательМСП-Район-Код]                              VARCHAR(3),         --Элемент;  Обязательный;       Строка;                                         Код района.
    [ПравообладательМСП-Район-УТ2:Наименование]                 VARCHAR(256),       --Элемент;  Обязательный;       Непустая Строка;                                Наименование района.
    [Представитель]                                             INT,                --Блок;     Не обязательный;                                                    Сведения о законном представителе (опекуне, попечителе и тд.) правообладателя мер социальной поддержки.
    [МСП-ГИД-КодПолучателя]                                     INT,                --Элемент;  Обязательный;       Число;                                          Код категории получателя меры социальной поддержки  (для граждан, имеющих детей).
    [МСП-ГИД-Ребенок]                                           INT,                --Блок;     Обязательный;                                                       Сведения о ребенке, с рождением которого возникло право на меры социальной поддержки.
    [МСП-РаспорядительныйДокумент-ДатаУстановления]             DATE,               --Блок;     Обязательный;                                                       Блок сведений о распорядительном документе.
    [МСП-РаспорядительныйДокумент-Период-УТ2:С]                 DATE,               --Элемент;  Обязательный;       Дата;                                           Дата начала периода (дата "с").
    [МСП-РаспорядительныйДокумент-Период-УТ2:По]                DATE,               --Элемент;  Обязательный;       Дата;                                           Дата окончания периода (дата "по").
    [МСП-РаспорядительныйДокумент-Реквизиты-Дата]               DATE,               --Элемент;  Обязательный;       Дата;                                           Дата документа «ОТ».
    [МСП-РаспорядительныйДокумент-Реквизиты-Номер]              VARCHAR(256),       --Элемент;  Обязательный;       Непустая Строка;                                Номер документа.
    [МСП-РаспорядительныйДокумент-РазмерМСП]                    FLOAT,              --Элемент;  Обязательный;       Вещественное число с дробной частью в 2 знака   Актуальный на дату передачи сведений размер меры социальной поддержки
    [МСП-НПА]                                                   VARCHAR(2),         --Элемент;  Обязательный;       Строка;                                         Нормативно-правовой акт, в соответствии с которым осуществляется предоставление мер социальной поддержки.
    [МСП-КодМСП]                                                VARCHAR(5),         --Элемент;  Обязательный;       Строка;                                         Код меры социальной поддержки.
    [МСП-СпособДоставки-ТипАдреса]                              INT,                --Элемент;  Обязательный;       Число;                                          Указывается тип адреса правообладателя или представителя, выбранного для доставки почтой. 
    [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:БИК]            VARCHAR(9),         --Элемент;  Обязательный;       Строка;                                         БИК банка.
    [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:Наименование]   VARCHAR(256),       --Элемент;  Обязательный;       Непустая Строка;                                Наименование банка.
    [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:РСчет]          VARCHAR(20)         --Элемент;  Обязательный;       Непустая Строка;                                Расчетный счет получателя
)
--Выборка.
INSERT INTO #НАЗНАЧЕНИЯ ([Идентификатор], [ПравообладательМСП], [ПравообладательМСП-Район-Код], [ПравообладательМСП-Район-УТ2:Наименование], [Представитель], [МСП-ГИД-КодПолучателя], [МСП-ГИД-Ребенок], 
    [МСП-РаспорядительныйДокумент-ДатаУстановления], [МСП-РаспорядительныйДокумент-Период-УТ2:С], [МСП-РаспорядительныйДокумент-Период-УТ2:По], [МСП-РаспорядительныйДокумент-Реквизиты-Дата], 
    [МСП-РаспорядительныйДокумент-Реквизиты-Номер], [МСП-РаспорядительныйДокумент-РазмерМСП], [МСП-НПА], [МСП-КодМСП], [МСП-СпособДоставки-ТипАдреса], [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:БИК], 
    [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:Наименование], [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:РСчет]
)
SELECT DISTINCT
    servServ.OUID                       AS [Идентификатор],
    personalCardHolder.OUID             AS [ПравообладательМСП],
    organization.A_PFRDCDE              AS [ПравообладательМСП-Район-Код],
    CASE 
        WHEN organization.OUID = 173806 
        THEN 'г. Киров' 
        ELSE district.A_NAME + ' район' 
    END                                 AS [ПравообладательМСП-Район-УТ2:Наименование],
    CASE
        WHEN personalCardHolder.OUID <> personalCardReceiver.OUID THEN personalCardReceiver.OUID 
        ELSE NULL
    END                                 AS [Представитель],
    NULL                                AS [МСП-ГИД-КодПолучателя],
    CASE
        WHEN typeServ.CODE_FROM_PFR IN ('03300', '03400', '03500', '03600', '03700', '03800', '03900') 
        THEN personalCardChild.OUID  
        ELSE NULL
    END                                 AS [МСП-ГИД-Ребенок],
    CONVERT(DATE, servServ.A_SERVDATE)  AS [МСП-РаспорядительныйДокумент-ДатаУстановления],
    CONVERT(DATE, period.STARTDATE)     AS [МСП-РаспорядительныйДокумент-Период-УТ2:С],
    ISNULL(CONVERT(DATE, period.A_LASTDATE), CONVERT(DATE, '01-01-9999'))    AS [МСП-РаспорядительныйДокумент-Период-УТ2:По],
    CONVERT(DATE, petition.A_DONEDATE)  AS [МСП-РаспорядительныйДокумент-Реквизиты-Дата],
    ISNULL(petition.A_DECISION_NUM, '-')    AS [МСП-РаспорядительныйДокумент-Реквизиты-Номер],
    ROUND(payAmount.A_AMOUNT, 2)        AS [МСП-РаспорядительныйДокумент-РазмерМСП],
    typeServ.NPA_FROM_PFR               AS [МСП-НПА],
    typeServ.CODE_FROM_PFR              AS [МСП-КодМСП],
    CASE
        WHEN payment.DELIVERYWAY = @deliveryRussianPost THEN 
            CASE
                WHEN personalCardHolder.OUID = personalCardReceiver.OUID THEN
                    CASE
                        WHEN payment.ALTERNATIVEADDRESSDEIVERY = personalCardHolder.A_REGFLAT       THEN 1
                        WHEN payment.ALTERNATIVEADDRESSDEIVERY = personalCardHolder.A_TEMPREGFLAT   THEN 2
                        WHEN payment.ALTERNATIVEADDRESSDEIVERY = personalCardHolder.A_LIVEFLAT      THEN 3  
                        WHEN payment.DELIVERYWAY = @deliveryRussianPost                             THEN 1
                        ELSE NULL
                    END
                WHEN personalCardHolder.OUID <> personalCardReceiver.OUID THEN 
                    CASE
                        WHEN payment.ALTERNATIVEADDRESSDEIVERY = personalCardReceiver.A_REGFLAT     THEN 4
                        WHEN payment.ALTERNATIVEADDRESSDEIVERY = personalCardReceiver.A_TEMPREGFLAT THEN 5
                        WHEN payment.ALTERNATIVEADDRESSDEIVERY = personalCardReceiver.A_LIVEFLAT    THEN 6  
                        WHEN payment.DELIVERYWAY = @deliveryRussianPost                             THEN 4
                    END
                ELSE NULL
            END
        ELSE NULL
    END                                 AS [МСП-СпособДоставки-ТипАдреса],
    CASE     
        WHEN payment.DELIVERYWAY IN (2, 7) THEN ISNULL(bank.A_BIK, parentBank.A_BIK)
        ELSE NULL
    END                                 AS [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:БИК],  
    CASE 
        WHEN payment.DELIVERYWAY IN (2, 7) THEN bank.A_NAME1 
        ELSE NULL
    END                                 AS [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:Наименование],  
    CASE 
        WHEN payment.DELIVERYWAY IN (2, 7) THEN SUBSTRING(payment.ACCOUNTINGCOUNT, 1, 20)
        ELSE NULL
    END                                 AS [МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:РСчет]                               
FROM ESRN_SERV_SERV servServ --Назначения МСП.
----Нужные меры социальной поддержки.
    INNER JOIN CLASSIFY_MSP_FROM_PFR typeServ
        ON typeServ.MSP_LK_NPD_FROM_PPR = servServ.A_SERV	
            AND typeServ.CODE_FROM_PFR = '02700'
----Период предоставления МСП.
    INNER JOIN SPR_SERV_PERIOD period 
        ON period.A_SERV = servServ.OUID 
            AND period.A_STATUS = @actStatus 
            AND @currentDate >= CONVERT(DATE, period.STARTDATE)
            AND (@currentDate <= CONVERT(DATE, period.A_LASTDATE) OR period.A_LASTDATE IS NULL)
            AND (CONVERT(DATE, period.A_LASTDATE) > CONVERT(DATE, '31-12-2021') AND typeServ.CODE_FROM_PFR IN ('03700', '03600') OR typeServ.CODE_FROM_PFR NOT IN ('03700', '03600'))
----Назначение к начислению
    INNER JOIN WM_SERVPAYAMOUNT payAmount
        ON payAmount.A_MSP = servServ.OUID
            AND payAmount.A_STATUS = @actStatus
            AND @currentDate >= CONVERT(DATE, payAmount.A_DATESTART)
            AND (@currentDate <= CONVERT(DATE, payAmount.A_DATELAST) OR payAmount.A_DATELAST IS NULL)
----Заявления.
    INNER JOIN WM_PETITION petition
        ON petition.OUID = servServ.A_REQUEST
----Класс связки Обращения-Документы
    LEFT JOIN SPR_LINK_APPEAL_DOC petition_document
        ON petition_document.FROMID = petition.OUID
----Справки МСЭ, прикрепленные к заявлению.
    LEFT JOIN WM_ACTDOCUMENTS mseNotice 
        ON mseNotice.OUID = petition_document.TOID
            AND mseNotice.A_STATUS = @actStatus
            AND mseNotice.DOCUMENTSTYPE IN (1799)
----Состояния здоровья, прикрепленные к справке МСЭ.
    LEFT JOIN LINK_ACTDOC_HEALTH doc_link_health
        ON doc_link_health.A_FROMID = mseNotice.OUID
----Состояние здоровья, указанное в справке МСЭ.
    LEFT JOIN WM_HEALTHPICTURE health 
        ON health.OUID = doc_link_health.A_TOID
            AND health.A_STATUS = @actStatus
            AND health.A_INVALID_GROUP = SUBSTRING(typeServ.COMMENT, CHARINDEX(':', typeServ.COMMENT) + 1, LEN(typeServ.COMMENT) - CHARINDEX(':', typeServ.COMMENT))
----Выплатное дело.
    INNER JOIN WM_PAYMENT_BOOK payBook
        ON payBook.OUID = servServ.A_PAYMENTBOOK
            AND payBook.A_STATUS = @actStatus 
----Выплатные реквизиты.
    INNER JOIN WM_PAYMENT payment
        ON payment.OUID = payBook.A_ACTREQUISIT
            AND payment.A_STATUS = @actStatus
----Выплатная организация.
    LEFT JOIN SPR_ORG_BASE bank
        ON bank.OUID = payment.A_PAYMENTORG
----Связка выплатной организации с вышестоящей организацией.
    LEFT JOIN SPR_ORG_BANKS bank_link_parent
        ON bank_link_parent.OUID = bank.OUID 
----Вышестоящее подразделение.   
    LEFT JOIN SPR_ORG_BASE parentBank
        ON parentBank.OUID = bank_link_parent.A_PARENT
----Личное дело получателя.
    INNER JOIN WM_PERSONAL_CARD personalCardReceiver
        ON personalCardReceiver.OUID = payment.PERSONOUID
            AND personalCardReceiver.A_STATUS = @actStatus
----Личное дело льготодержателя.
    INNER JOIN WM_PERSONAL_CARD personalCardHolder 
        ON personalCardHolder.OUID = servServ.A_PERSONOUID
            AND personalCardHolder.A_STATUS = @actStatus
----Личное дело лица, на основании данных ЛД которого сделано назначение				
    LEFT JOIN WM_PERSONAL_CARD personalCardChild 
        ON personalCardChild.OUID = servServ.A_CHILD 
            AND personalCardChild.A_STATUS = @actStatus
----ОСЗН.
    INNER JOIN ESRN_OSZN_DEP organization
        ON organization.OUID = servServ.A_ORGNAME 
----Связка ОСЗ и районов
    LEFT JOIN SPR_OSZN_FEDBOR organization_district
        ON organization_district.A_FROMID = organization.OUID
----Справочник районов субъектов федерации.
    LEFT JOIN SPR_FEDERATIONBOROUGHT district
        ON district.OUID = organization_district.A_TOID   
WHERE servServ.A_STATUS = @actStatus 
----Зависимость меры по инвалидности.
    AND (SUBSTRING(typeServ.COMMENT, 1, CHARINDEX(':', typeServ.COMMENT)-1) = 'GroupInvalid'
        AND health.OUID IS NOT NULL
        OR SUBSTRING(typeServ.COMMENT, 1, CHARINDEX(':', typeServ.COMMENT)-1) <> 'GroupInvalid'
        OR typeServ.COMMENT IS NULL
    )


--------------------------------------------------------------------------------------------------------------------------------


--Удаление таблицы.
IF OBJECT_ID('tempdb..#ПРАВОПОДТВЕРЖДАЮЩИЕ_ДОКУМЕНТЫ') IS NOT NULL BEGIN DROP TABLE #ПРАВОПОДТВЕРЖДАЮЩИЕ_ДОКУМЕНТЫ END 
--Создание таблицы.
CREATE TABLE #ПРАВОПОДТВЕРЖДАЮЩИЕ_ДОКУМЕНТЫ (
    [Назначение]            INT,
    [Идентификатор]         INT,
    [УТ2:Наименование]      VARCHAR(1000),   --Элемент; Обязательный;       Непустая строка;    Вид документа, подтвердающего право на меры социальной поддержки.
    [УТ2:Серия]             VARCHAR(256),   --Элемент;  Не обязательный;    Непустая строка;    Серия документа.
    [УТ2:Номер]             VARCHAR(256),   --Элемент;  Обязательный;       Непустая строка;    Номер документа.
    [УТ2:ДатаВыдачи]        DATE,           --Элемент;  Обязательный;       Дата;               Дата выдачи документа.
    [УТ2:КемВыдан]          VARCHAR(256),   --Элемент;  Обязательный;       Непустая строка;    Кем выдан документ, подтверждающий право на меры социальной поддержки.
    [ПериодДействия-УТ2:С]  DATE,           --Элемент;  Обязательный;       Дата;               Дата начала периода (дата "с").
    [ПериодДействия-УТ2:По] DATE            --Элемент;  Обязательный;       Дата;               Дата окончания периода (дата "по").
)
--Выборка.
INSERT INTO #ПРАВОПОДТВЕРЖДАЮЩИЕ_ДОКУМЕНТЫ ([Назначение], [Идентификатор], [УТ2:Наименование], [УТ2:Серия], [УТ2:Номер], [УТ2:ДатаВыдачи], [УТ2:КемВыдан], [ПериодДействия-УТ2:С], [ПериодДействия-УТ2:По])
SELECT 
    servServ.OUID                                                       AS [Назначение],
    actDocuments.OUID                                                   AS [Идентификатор],
    typeDoc.A_NAME                                                      AS [УТ2:Наименование],
    actDocuments.DOCUMENTSERIES                                         AS [УТ2:Серия],
    ISNULL(actDocuments.DOCUMENTSNUMBER, '-')                           AS [УТ2:Номер],
    ISNULL(CONVERT(DATE, actDocuments.ISSUEEXTENSIONSDATE), CONVERT(DATE, '01-01-9999'))                     AS [УТ2:ДатаВыдачи],
    ISNULL(ISNULL(organization.A_NAME1, actDocuments.A_GIVEDOCUMENTORG_TEXT), '-')   AS [УТ2:КемВыдан],
    ISNULL(CONVERT(DATE, actDocuments.ISSUEEXTENSIONSDATE), CONVERT(DATE, '01-01-9999'))                     AS [ПериодДействия-УТ2:С],
    ISNULL(CONVERT(DATE, actDocuments.COMPLETIONSACTIONDATE), CONVERT(DATE, '01-01-9999'))   AS [ПериодДействия-УТ2:По]
FROM #НАЗНАЧЕНИЯ 
----Назначения МСП.
    INNER JOIN ESRN_SERV_SERV servServ 
        ON servServ.OUID = #НАЗНАЧЕНИЯ.[Идентификатор]
----Перечень документов, подтверждающих право.
    INNER JOIN #КЛАССИФИКАТОР_ПРАВОПОДТВЕРЖДАЮЩИХ_ДОКУМЕНТОВ classifyDoc
        ON classifyDoc.[Код меры] = #НАЗНАЧЕНИЯ.[МСП-КодМСП] 
----Заявления.
    INNER JOIN WM_PETITION petition 
        ON petition.OUID = servServ.A_REQUEST
----Класс связки Обращения-Документы
    INNER JOIN SPR_LINK_APPEAL_DOC petition_document
        ON petition_document.FROMID = petition.OUID
----Действующие документы.
    INNER JOIN WM_ACTDOCUMENTS actDocuments 
        ON actDocuments.OUID = petition_document.TOID
            AND actDocuments.A_STATUS = @actStatus
            AND (classifyDoc.[Владелец] = 0
                OR classifyDoc.[Владелец] = 1 AND actDocuments.PERSONOUID = servServ.A_PERSONOUID
                OR classifyDoc.[Владелец] = 2 AND actDocuments.PERSONOUID = servServ.A_CHILD 
            )
----Вид документа.
    INNER JOIN PPR_DOC typeDoc
        ON typeDoc.A_ID = actDocuments.DOCUMENTSTYPE 
            AND typeDoc.A_ID = classifyDoc.[Код документа]
----Организация, выдавшая документ.
    LEFT JOIN SPR_ORG_BASE organization
        ON organization.OUID = actDocuments.GIVEDOCUMENTORG 
   
      
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Удаление таблицы.
IF OBJECT_ID('tempdb..#ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ') IS NOT NULL BEGIN DROP TABLE #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ END 
--Создание таблицы.
CREATE TABLE #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ (
    [Идентификатор]                         INT,    
    [УТ2:СНИЛС]                             VARCHAR(14),    --Элемент;  Обязательный;       Непустая строка;    Страховой номер индивидуального лицевого счета правообладателя.
    [УТ2:ФИО-УТ2:Фамилия]                   VARCHAR(64),    --Элемент;  Не обязательный;    Непустая строка;    Фамилия физического лица.
    [УТ2:ФИО-УТ2:Имя]                       VARCHAR(64),    --Элемент;  Не обязательный;    Непустая строка;    Имя физического лица.  
    [УТ2:ФИО-УТ2:Отчество]                  VARCHAR(64),    --Элемент;  Не обязательный;    Непустая строка;    Отчество физического лица.   
    [УТ2:Пол]                               VARCHAR(1),     --Элемент;  Обязательный;       Непустая строка;    Пол правообладателя.
    [УТ2:ДатаРождения]                      DATE,           --Элемент;  Обязательный;       Дата;               Дата рождения правообладателя.
    [УТ2:МестоРождения]                     INT,            --Элемент;  Блок;                                   Место рождения правообладателя.
    [УТ2:АдресРегистрации]                  INT,            --Элемент;  Блок;                                   Адрес места регистрации (места проживания).
    [УТ2:АдресПребывания]                   INT,            --Элемент;  Блок;                                   Адрес места пребывания.
    [УТ2:АдресФактический]                  INT,            --Элемент;  Блок;                                   Адрес места фактического проживания.
)
--Выборка.
INSERT INTO #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ ([Идентификатор], [УТ2:СНИЛС], [УТ2:ФИО-УТ2:Фамилия], [УТ2:ФИО-УТ2:Имя], [УТ2:ФИО-УТ2:Отчество], [УТ2:Пол], [УТ2:ДатаРождения],    
    [УТ2:МестоРождения], [УТ2:АдресРегистрации], [УТ2:АдресПребывания], [УТ2:АдресФактический])
SELECT DISTINCT
    personalCard.OUID                                               AS [Идентификатор],
    SUBSTRING(personalCard.A_SNILS, 1, 3) + '-' + 
        SUBSTRING(personalCard.A_SNILS, 4, 3) + '-' + 
        SUBSTRING(personalCard.A_SNILS, 7, 3) + ' ' + 
        SUBSTRING(personalCard.A_SNILS, 10, 2)                      AS [УТ2:СНИЛС],
    ISNULL(personalCard.A_SURNAME_STR,    fioSurname.A_NAME)        AS [УТ2:ФИО-УТ2:Фамилия],
    ISNULL(personalCard.A_NAME_STR,       fioName.A_NAME)           AS [УТ2:ФИО-УТ2:Имя],
    ISNULL(personalCard.A_SECONDNAME_STR, fioSecondname.A_NAME)     AS [УТ2:ФИО-УТ2:Отчество],
    gender.A_NAME                                                   AS [УТ2:Пол],
    CONVERT(DATE, personalCard.BIRTHDATE)                           AS [УТ2:ДатаРождения],
    personalCard.A_PLACEOFBIRTH                                     AS [УТ2:МестоРождения],
    personalCard.A_REGFLAT                                          AS [УТ2:АдресРегистрации],
    personalCard.A_TEMPREGFLAT                                      AS [УТ2:АдресПребывания],
    personalCard.A_LIVEFLAT                                         AS [УТ2:АдресФактический]
FROM WM_PERSONAL_CARD personalCard --Личное дело гражданина.
----Правообладатели выбранных назначений.
    LEFT JOIN #НАЗНАЧЕНИЯ servServHolder
        ON servServHolder.[ПравообладательМСП] = personalCard.OUID
----Представители выбранных назначений.
    LEFT JOIN #НАЗНАЧЕНИЯ servServReceiver
        ON servServReceiver.[Представитель] = personalCard.OUID
----Дети выбранных назначений.
    LEFT JOIN #НАЗНАЧЕНИЯ servServChild
        ON servServChild.[МСП-ГИД-Ребенок]  = personalCard.OUID     
----Фамилия.
    LEFT JOIN SPR_FIO_SURNAME fioSurname
        ON fioSurname.OUID = personalCard.SURNAME 
----Имя.     
    LEFT JOIN SPR_FIO_NAME fioName
        ON fioName.OUID = personalCard.A_NAME    
----Отчество.   
    LEFT JOIN SPR_FIO_SECONDNAME fioSecondname
        ON fioSecondname.OUID = personalCard.A_SECONDNAME 
----Пол.       
    LEFT JOIN SPR_GENDER gender
        ON gender.OUID = personalCard.A_SEX       
----ОСВЗ владелец.
    LEFT JOIN ESRN_OSZN_DEP osznDepartament
        ON osznDepartament.OUID = personalCard.A_REG_ORGNAME
WHERE personalCard.A_STATUS = @actStatus
    AND (servServHolder.[ПравообладательМСП] IS NOT NULL 
        OR servServReceiver.[Представитель] IS NOT NULL
        OR servServChild.[МСП-ГИД-Ребенок] IS NOT NULL
    )
     

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



--Удаление таблицы.
IF OBJECT_ID('tempdb..#МЕСТА_РОЖДЕНИЯ') IS NOT NULL BEGIN DROP TABLE #МЕСТА_РОЖДЕНИЯ END
--Создание таблицы.
CREATE TABLE #МЕСТА_РОЖДЕНИЯ (
    [Идентификатор] INT,
    [УТ2:Тип]       INT,            --Элемент;  Обязательный;       Число;              Тип места рождения. Возможные значения: 1 - стандартное, 2 - особое
    [УТ2:Город]     VARCHAR(256),   --Элемент;  Не обязательный;    Непустая строка;    Город рождения.
    [УТ2:Район]     VARCHAR(256),   --Элемент;  Не обязательный;    Непустая строка;    Район рождения.
    [УТ2:Регион]    VARCHAR(256),   --Элемент;  Не обязательный;    Непустая строка;    Регион рождения.
    [УТ2:Страна]    VARCHAR(256)    --Элемент;  Не обязательный;    Непустая строка;    Страна рождения.
)
--Выборка.
INSERT INTO #МЕСТА_РОЖДЕНИЯ ([Идентификатор], [УТ2:Тип], [УТ2:Город], [УТ2:Район], [УТ2:Регион], [УТ2:Страна])
SELECT DISTINCT
    placeBirth.OUID                                                                     AS [Идентификатор],
    1                                                                                   AS [УТ2:Тип], 
    ISNULL(townBirthType.A_NAME + '. ', '') + townBirth.A_NAME                          AS [УТ2:Город],
    federationBoroughBirth.A_NAME + ISNULL(' ' + 
        CASE 
            WHEN federationBoroughBirth.A_TYPE = 1 THEN 'район'
            WHEN federationBoroughBirth.A_TYPE = 2 THEN 'район'
            WHEN federationBoroughBirth.A_TYPE = 3 THEN 'область'
            ELSE federationBoroughBirthType.A_NAME
        END, '')                                                                        AS [УТ2:Район],
    subjectFederationBirth.A_NAME + ISNULL(' ' +  
        CASE 
            WHEN subjectFederationBirth.A_TYPE = 1 THEN 'республика'
            WHEN subjectFederationBirth.A_TYPE = 2 THEN 'край'
            WHEN subjectFederationBirth.A_TYPE = 3 THEN 'область'
            ELSE subjectFederationBirthType.A_NAME
        END, '')                                                                        AS [УТ2:Регион],
    UPPER(countryBirth.A_NAME)                                                          AS [УТ2:Страна]
FROM WM_BIRTHPLACE placeBirth
----Выбранные личные дела.
    INNER JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCard
        ON personalCard.[УТ2:МестоРождения] = placeBirth.OUID
----Справочник стран.
    LEFT JOIN SPR_COUNTRY countryBirth
        ON countryBirth.OUID = placeBirth.A_COUNTRY 
------Справочник субъектов федерации.
    LEFT JOIN SPR_SUBJFED subjectFederationBirth 
        ON subjectFederationBirth.OUID = placeBirth.A_SUBFED  
----Тип Субъекта Федерации 
    LEFT JOIN SPR_SUBJFEDTYPE subjectFederationBirthType
        ON subjectFederationBirthType.A_ID = subjectFederationBirth.A_TYPE 
----Справочник районов субъектов федерации.
    LEFT JOIN SPR_FEDERATIONBOROUGHT federationBoroughBirth
        ON federationBoroughBirth.OUID = placeBirth.A_FEDBOROUGH    
----Тип Района Субъекта федерации
    LEFT JOIN SPR_FBTYPE federationBoroughBirthType
        ON federationBoroughBirthType.A_ID = federationBoroughBirth.A_TYPE
----Справочник населенных пунктов.       
    LEFT JOIN SPR_TOWN townBirth
        ON townBirth.OUID = placeBirth.A_TOWN 
----Справочник типов населенных пунктов
    LEFT JOIN SPR_TOWN_TYPE townBirthType
        ON townBirthType.OUID = townBirth.A_TOWNTYPE
WHERE placeBirth.A_STATUS = @actStatus


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Удаление таблицы.
IF OBJECT_ID('tempdb..#АДРЕСА') IS NOT NULL BEGIN DROP TABLE #АДРЕСА END 
--Создание таблицы.
CREATE TABLE #АДРЕСА (
    [Идентификатор]                             INT,
    [УТ2:GUID]                                  VARCHAR(36),    --Элемент;  Не обязательный;    Не пустая строка;   GUID-код ФИАС - глобальный уникальный идентификатор адресного объекта или уникальный идентификатор записи дома.
    [УТ2:Индекс]                                VARCHAR(7),     --Элемент;  Не обязательный;    Не пустая строка;   Почтовый индекс.
    [УТ2:Регион-Т2:Название]                    VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Регион-УТ2:Сокращение]                 VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Округ-Т2:Название]                     VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Округ-УТ2:Сокращение]                  VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Район-Т2:Название]                     VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Район-УТ2:Сокращение]                  VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;  
    [УТ2:Город-Т2:Название]                     VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Город-УТ2:Сокращение]                  VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;  
    [УТ2:ВнутригородскойРайон-Т2:Название]      VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:ВнутригородскойРайон-УТ2:Сокращение]   VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:НаселенныйПункт-Т2:Название]           VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;  
    [УТ2:НаселенныйПункт-УТ2:Сокращение]        VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Улица-Т2:Название]                     VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;  
    [УТ2:Улица-УТ2:Сокращение]                  VARCHAR(64),    --Элемент;  Не обязательный;    Не пустая строка;  
    [УТ2:Дом]                                   VARCHAR(256),   --20--Элемент;  Не обязательный;    Не пустая строка;  
    [УТ2:Строение]                              VARCHAR(50),    --Элемент;  Не обязательный;    Не пустая строка; 
    [УТ2:Владение]                              VARCHAR(10),    --Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Корпус]                                VARCHAR(256),   --50--Элемент;  Не обязательный;    Не пустая строка;   
    [УТ2:Квартира]                              VARCHAR(256)    --8--Элемент;  Не обязательный;    Не пустая строка;  
)
--Выборка.
INSERT INTO #АДРЕСА ([Идентификатор], [УТ2:GUID], [УТ2:Индекс], [УТ2:Регион-Т2:Название], [УТ2:Регион-УТ2:Сокращение], [УТ2:Округ-Т2:Название], [УТ2:Округ-УТ2:Сокращение], [УТ2:Район-Т2:Название], [УТ2:Район-УТ2:Сокращение],
    [УТ2:Город-Т2:Название], [УТ2:Город-УТ2:Сокращение], [УТ2:ВнутригородскойРайон-Т2:Название], [УТ2:ВнутригородскойРайон-УТ2:Сокращение], [УТ2:НаселенныйПункт-Т2:Название], [УТ2:НаселенныйПункт-УТ2:Сокращение], 
    [УТ2:Улица-Т2:Название], [УТ2:Улица-УТ2:Сокращение], [УТ2:Дом], [УТ2:Строение], [УТ2:Владение], [УТ2:Корпус], [УТ2:Квартира]
)
SELECT DISTINCT
    address.OUID                                        AS [Идентификатор],
    address.A_FIASCODE                                  AS [УТ2:GUID],
    CASE
        WHEN ISNUMERIC(SUBSTRING(address.A_ADRTITLE, 0, CHARINDEX(',', address.A_ADRTITLE))) = 1 
            THEN SUBSTRING(address.A_ADRTITLE, 0, CHARINDEX(',', address.A_ADRTITLE))
            ELSE NULL
    END                                                 AS [УТ2:Индекс],
    subjectFederation.A_NAME                            AS [УТ2:Регион-Т2:Название],
    subjectFederationType.A_NAME                        AS [УТ2:Регион-УТ2:Сокращение],
    /*okrug.A_NAME*/ NULL                                        AS [УТ2:Округ-Т2:Название],
    NULL                                                AS [УТ2:Округ-УТ2:Сокращение],
    district.A_NAME                                     AS [УТ2:Район-Т2:Название],
    districtType.A_NAME                                 AS [УТ2:Район-УТ2:Сокращение],
    CASE 
        WHEN townType.OUID = 1 THEN town.A_NAME
        ELSE NULL
    END                                                 AS [УТ2:Город-Т2:Название],
    CASE 
        WHEN townType.OUID = 1 THEN townType.A_NAME
        ELSE NULL
    END                                                 AS [УТ2:Город-УТ2:Сокращение], 
    districtTown.A_NAME                                 AS [УТ2:ВнутригородскойРайон-Т2:Название],
    CASE 
        WHEN districtTown.A_NAME IS NOT NULL THEN 'р-н'
        ELSE NULL
    END                                                 AS [УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    CASE 
        WHEN townType.OUID <> 1 THEN town.A_NAME
        ELSE NULL
    END                                                 AS [УТ2:НаселенныйПункт-Т2:Название],
    CASE 
        WHEN townType.OUID <> 1 THEN townType.A_NAME
        ELSE NULL
    END                                                 AS [УТ2:НаселенныйПункт-УТ2:Сокращение], 
    street.A_NAME                                       AS [УТ2:Улица-Т2:Название],
    streetType.A_NAME                                   AS [УТ2:Улица-УТ2:Сокращение],
    address.A_HOUSENUMBER                               AS [УТ2:Дом],
    NULL                                                AS [УТ2:Строение],
    NULL                                                AS [УТ2:Владение],
    address.A_BUILDING                                  AS [УТ2:Корпус],
    address.A_FLATNUMBER                                AS [УТ2:Квартира]
FROM WM_ADDRESS address --Адрес гражданина
----Адреса регистрации выбранных людей.
    LEFT JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCardReg
        ON personalCardReg.[УТ2:АдресРегистрации] = address.OUID
----Адреса пребывания выбранных людей.
    LEFT JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCardTemp
        ON personalCardTemp.[УТ2:АдресПребывания] = address.OUID
----Адреса фактического пребывания выбранных людей.
    LEFT JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCardLive
        ON personalCardLive.[УТ2:АдресФактический]  = address.OUID           
----Справочник районов субъектов федерации
    LEFT JOIN SPR_SUBJFED subjectFederation
        ON subjectFederation.OUID = address.A_SUBFED
----Справочник федеральных округов 
    LEFT JOIN SPR_FEDOKRRUG okrug
        ON okrug.OUId = address.A_FEDOKRUG
----Тип Субъекта Федерации
    LEFT JOIN SPR_SUBJFEDTYPE subjectFederationType
        ON subjectFederationType.A_ID = subjectFederation.A_TYPE
----Справочник районов субъектов федерации
    LEFT JOIN SPR_FEDERATIONBOROUGHT district
        ON district.OUID = address.A_FEDBOROUGH
----Тип Района Субъекта федерации
    LEFT JOIN SPR_FBTYPE districtType
        ON districtType.A_ID = district.A_TYPE
----Справочник населенных пунктов.       
    LEFT JOIN SPR_TOWN town
        ON town.OUID = address.A_TOWN 
----Справочник типов населенных пунктов
    LEFT JOIN SPR_TOWN_TYPE townType
        ON townType.OUID = town.A_TOWNTYPE
----Справочник районов города 
    LEFT JOIN SPR_BOROUGH districtTown
        ON districtTown.OUID = address.A_TOWNBOROUGH
----Справочник улиц 
    LEFT JOIN SPR_STREET street
        ON street.OUID = address.A_STREET
----Справочник типов улиц
    LEFT JOIN SPR_STEET_TYPE streetType
        ON streetType.OUID = street.A_STREETTYPE
WHERE address.A_STATUS = @actStatus
    AND (personalCardReg.[УТ2:АдресРегистрации] IS NOT NULL 
        OR personalCardTemp.[УТ2:АдресПребывания] IS NOT NULL
        OR personalCardLive.[УТ2:АдресФактический] IS NOT NULL
    )
     

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



--Удаление таблицы.
IF OBJECT_ID('tempdb..#УДОСТОВЕРЯЮЩИЕ_ДОКУМЕНТЫ') IS NOT NULL BEGIN DROP TABLE #УДОСТОВЕРЯЮЩИЕ_ДОКУМЕНТЫ END  
--Создание таблицы.
CREATE TABLE #УДОСТОВЕРЯЮЩИЕ_ДОКУМЕНТЫ (
    [Идентификатор]         INT,
    [Личное дело]           INT,
    [УТ2:Тип]               VARCHAR(256),   --Элемент;  Обязательный;       Не пустая строка;   Тип документа, удостоверяющего личность.
    [УТ2:Серия]             VARCHAR(256),   --Элемент;  Не обязательный;    Не пустая строка;   Серия документа.
    [УТ2:Номер]             VARCHAR(256),   --Элемент;  Обязательный;       Не пустая строка;   Номер документа.
    [УТ2:ДатаВыдачи]        DATE,           --Элемент;  Обязательный;       Дата;               Дата выдачи документа.
    [УТ2:КемВыдан]          VARCHAR(256),   --Элемент;  Обязательный;       Не пустая строка;   Кем выдан документ.
    [УТ2:СрокДействия]      DATE,           --Элемент;  Обязательный;       Дата;               Срок действия документа, удостоверяющего личность заявителя.
    [УТ2:КодПодразделения]  VARCHAR(256)    --Элемент;  Обязательный;       Не пустая строка;   Код подразделения, выдавшего документ, удостоверяющий личность заявителя.
)
--Выборка.
INSERT INTO #УДОСТОВЕРЯЮЩИЕ_ДОКУМЕНТЫ ([Идентификатор], [Личное дело], [УТ2:Тип], [УТ2:Серия], [УТ2:Номер], [УТ2:ДатаВыдачи], [УТ2:КемВыдан], [УТ2:СрокДействия], [УТ2:КодПодразделения])
SELECT
    document.[Идентификатор],
    document.[Личное дело],
    document.[УТ2:Тип],
    document.[УТ2:Серия],
    document.[УТ2:Номер],
    document.[УТ2:ДатаВыдачи],
    document.[УТ2:КемВыдан],
    document.[УТ2:СрокДействия],
    document.[УТ2:КодПодразделения]
FROM (
    SELECT 
        actDocuments.OUID                                                               AS [Идентификатор],
        actDocuments.PERSONOUID                                                         AS [Личное дело],
        classifyDoc.CODE_FROM_PFR                                                       AS [УТ2:Тип],
        actDocuments.DOCUMENTSERIES                                                     AS [УТ2:Серия],
        actDocuments.DOCUMENTSNUMBER                                                    AS [УТ2:Номер],
        CONVERT(DATE, actDocuments.ISSUEEXTENSIONSDATE)                                 AS [УТ2:ДатаВыдачи],
        ISNULL(ISNULL(organization.A_NAME1, actDocuments.A_GIVEDOCUMENTORG_TEXT), '-')  AS [УТ2:КемВыдан],
        CONVERT(DATE, actDocuments.COMPLETIONSACTIONDATE)                               AS [УТ2:СрокДействия],
        REPLACE(actDocuments.A_UNIT_CODE, '-', '')                                      AS [УТ2:КодПодразделения],
        ROW_NUMBER() OVER (PARTITION BY actDocuments.PERSONOUID  ORDER BY actDocuments.ISSUEEXTENSIONSDATE DESC) AS gnum 
    FROM WM_ACTDOCUMENTS actDocuments --Действующие документы. 
    ----Выбранные личные дела.
        INNER JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCard
            ON personalCard.[Идентификатор] = actDocuments.PERSONOUID 
    ----Нужные документы.
        INNER JOIN CLASSIFY_IDENTIFICATION_DOC_FROM_PFR classifyDoc
            ON classifyDoc.DOC_FROM_PPR = actDocuments.DOCUMENTSTYPE  
    ----Базовый класс организаций, выдавшей документ.
        LEFT JOIN SPR_ORG_BASE organization
            ON organization.OUID = actDocuments.GIVEDOCUMENTORG 
    WHERE actDocuments.A_STATUS = @actStatus 
        AND actDocuments.A_DOCSTATUS = @actDoc 
        AND @currentDate >= CONVERT(DATE, actDocuments.ISSUEEXTENSIONSDATE) --Действует на данным момент.
        AND (@currentDate <= CONVERT(DATE, actDocuments.COMPLETIONSACTIONDATE) OR actDocuments.COMPLETIONSACTIONDATE IS NULL) --Действует на данным момент.
) document
WHERE document.gnum = 1


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Удаление таблицы.
IF OBJECT_ID('tempdb..#КОНТАКТНЫЕ_ДАННЫЕ') IS NOT NULL BEGIN DROP TABLE #КОНТАКТНЫЕ_ДАННЫЕ END  
--Создание таблицы.
CREATE TABLE #КОНТАКТНЫЕ_ДАННЫЕ (
    [Личное дело]       INT,
    [УТ2:Телефон]       VARCHAR(16), 
    [УТ2:АдресЭлПочты]  VARCHAR(256)
)
--Выборка.
INSERT INTO #КОНТАКТНЫЕ_ДАННЫЕ ([Личное дело], [УТ2:Телефон], [УТ2:АдресЭлПочты]) 
SELECT 
    lastPhone.[Личное дело],
    lastPhone.[УТ2:Телефон],
    lastPhone.[УТ2:АдресЭлПочты]
FROM (
    SELECT 
        correctPhone.[Личное дело],
        correctPhone.[УТ2:Телефон],
        correctPhone.[УТ2:АдресЭлПочты],
        ROW_NUMBER() OVER (PARTITION BY correctPhone.[Личное дело] ORDER BY correctPhone.CREATEDATE DESC) AS gnum 
    FROM (
            SELECT
                phone.A_PERSCARD  AS [Личное дело],
                REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(phone.A_NUMBER, '-', ''), ' ', ''), '+7', '8'), '.', ''), '(', ''), ')', '')  AS [УТ2:Телефон],
                CASE 
                    WHEN CHARINDEX('@', personalCard.A_EMAIL) > 0 THEN personalCard.A_EMAIL 
                    ELSE NULL 
                END AS [УТ2:АдресЭлПочты],
                CONVERT(DATE, phone.A_CREATEDATE) AS CREATEDATE
            FROM WM_PCPHONE phone
                INNER JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCardHolder
                    ON personalCardHolder.[Идентификатор] = phone.A_PERSCARD
                INNER JOIN WM_PERSONAL_CARD personalCard
                    ON personalCard.OUID = phone.A_PERSCARD
            WHERE phone.A_STATUS = 10
    ) correctPhone
    WHERE ISNUMERIC(correctPhone.[УТ2:Телефон]) = 1
        AND (LEN(correctPhone.[УТ2:Телефон]) = 11  
            OR LEN(correctPhone.[УТ2:Телефон]) = 6
        )
) lastPhone
WHERE lastPhone.gnum = 1


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Финальная выборка.
SELECT	
    servServ.[Идентификатор],
    '053' AS [Регион],
    servServ.[ПравообладательМСП-Район-Код],
    servServ.[ПравообладательМСП-Район-УТ2:Наименование],
    personalCardHolder.[УТ2:СНИЛС]                                      AS [ПравообладательМСП-УТ2:СНИЛС],
    personalCardHolder.[УТ2:ФИО-УТ2:Фамилия]                            AS [ПравообладательМСП-УТ2:ФИО-УТ2:Фамилия],
    personalCardHolder.[УТ2:ФИО-УТ2:Имя]                                AS [ПравообладательМСП-УТ2:ФИО-УТ2:Имя],
    personalCardHolder.[УТ2:ФИО-УТ2:Отчество]                           AS [ПравообладательМСП-УТ2:ФИО-УТ2:Отчество],
    personalCardHolder.[УТ2:Пол]                                        AS [ПравообладательМСП-УТ2:Пол],     
    CONVERT(VARCHAR, personalCardHolder.[УТ2:ДатаРождения])             AS [ПравообладательМСП-УТ2:ДатаРождения],
    placeBirthHolder.[УТ2:Тип]                                          AS [ПравообладательМСП-УТ2:МестоРождения-УТ2:Тип],
    placeBirthHolder.[УТ2:Город]                                        AS [ПравообладательМСП-УТ2:МестоРождения-УТ2:Город],
    placeBirthHolder.[УТ2:Район]                                        AS [ПравообладательМСП-УТ2:МестоРождения-УТ2:Район],
    placeBirthHolder.[УТ2:Регион]                                       AS [ПравообладательМСП-УТ2:МестоРождения-УТ2:Регион],
    placeBirthHolder.[УТ2:Страна]                                       AS [ПравообладательМСП-УТ2:МестоРождения-УТ2:Страна],
    addressRegHolder.[УТ2:GUID]                                         AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:GUID],
    addressRegHolder.[УТ2:Индекс]                                       AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Индекс],
    addressRegHolder.[УТ2:Регион-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Регион-Т2:Название],
    addressRegHolder.[УТ2:Регион-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Регион-УТ2:Сокращение],
    addressRegHolder.[УТ2:Округ-Т2:Название]                            AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Округ-Т2:Название],
    addressRegHolder.[УТ2:Округ-УТ2:Сокращение]                         AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Округ-УТ2:Сокращение],
    addressRegHolder.[УТ2:Район-Т2:Название]                            AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Район-Т2:Название],
    addressRegHolder.[УТ2:Район-УТ2:Сокращение]                         AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Район-УТ2:Сокращение],       
    addressRegHolder.[УТ2:Город-Т2:Название]                            AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Город-Т2:Название],
    addressRegHolder.[УТ2:Город-УТ2:Сокращение]                         AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Город-УТ2:Сокращение],
    addressRegHolder.[УТ2:ВнутригородскойРайон-Т2:Название]             AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:ВнутригородскойРайон-Т2:Название],
    addressRegHolder.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]          AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressRegHolder.[УТ2:НаселенныйПункт-Т2:Название]                  AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:НаселенныйПункт-Т2:Название],
    addressRegHolder.[УТ2:НаселенныйПункт-УТ2:Сокращение]               AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressRegHolder.[УТ2:Улица-Т2:Название]                            AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Улица-Т2:Название],
    addressRegHolder.[УТ2:Улица-УТ2:Сокращение]                         AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Улица-УТ2:Сокращение],
    addressRegHolder.[УТ2:Дом]                                          AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Дом],
    addressRegHolder.[УТ2:Строение]                                     AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Строение],
    addressRegHolder.[УТ2:Владение]                                     AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Владение],
    addressRegHolder.[УТ2:Корпус]                                       AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Корпус],
    addressRegHolder.[УТ2:Квартира]                                     AS [ПравообладательМСП-УТ2:АдресРегистрации-УТ2:Квартира],
    addressTempHolder.[УТ2:GUID]                                        AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:GUID],
    addressTempHolder.[УТ2:Индекс]                                      AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Индекс],
    addressTempHolder.[УТ2:Регион-Т2:Название]                          AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Регион-Т2:Название],
    addressTempHolder.[УТ2:Регион-УТ2:Сокращение]                       AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Регион-УТ2:Сокращение],
    addressTempHolder.[УТ2:Округ-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Округ-Т2:Название],
    addressTempHolder.[УТ2:Округ-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Округ-УТ2:Сокращение],
    addressTempHolder.[УТ2:Район-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Район-Т2:Название],
    addressTempHolder.[УТ2:Район-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Район-УТ2:Сокращение],       
    addressTempHolder.[УТ2:Город-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Город-Т2:Название],
    addressTempHolder.[УТ2:Город-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Город-УТ2:Сокращение],
    addressTempHolder.[УТ2:ВнутригородскойРайон-Т2:Название]            AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:ВнутригородскойРайон-Т2:Название],
    addressTempHolder.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]         AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressTempHolder.[УТ2:НаселенныйПункт-Т2:Название]                 AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:НаселенныйПункт-Т2:Название],
    addressTempHolder.[УТ2:НаселенныйПункт-УТ2:Сокращение]              AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressTempHolder.[УТ2:Улица-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Улица-Т2:Название],
    addressTempHolder.[УТ2:Улица-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Улица-УТ2:Сокращение],
    addressTempHolder.[УТ2:Дом]                                         AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Дом],
    addressTempHolder.[УТ2:Строение]                                    AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Строение],
    addressTempHolder.[УТ2:Владение]                                    AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Владение],
    addressTempHolder.[УТ2:Корпус]                                      AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Корпус],
    addressTempHolder.[УТ2:Квартира]                                    AS [ПравообладательМСП-УТ2:АдресПребывания-УТ2:Квартира],
    addressLiveHolder.[УТ2:GUID]                                        AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:GUID],
    addressLiveHolder.[УТ2:Индекс]                                      AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Индекс],
    addressLiveHolder.[УТ2:Регион-Т2:Название]                          AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Регион-Т2:Название],
    addressLiveHolder.[УТ2:Регион-УТ2:Сокращение]                       AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Регион-УТ2:Сокращение],
    addressLiveHolder.[УТ2:Округ-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Округ-Т2:Название],
    addressLiveHolder.[УТ2:Округ-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Округ-УТ2:Сокращение],
    addressLiveHolder.[УТ2:Район-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Район-Т2:Название],
    addressLiveHolder.[УТ2:Район-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Район-УТ2:Сокращение],       
    addressLiveHolder.[УТ2:Город-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Город-Т2:Название],
    addressLiveHolder.[УТ2:Город-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Город-УТ2:Сокращение],
    addressLiveHolder.[УТ2:ВнутригородскойРайон-Т2:Название]            AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:ВнутригородскойРайон-Т2:Название],
    addressLiveHolder.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]         AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressLiveHolder.[УТ2:НаселенныйПункт-Т2:Название]                 AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:НаселенныйПункт-Т2:Название],
    addressLiveHolder.[УТ2:НаселенныйПункт-УТ2:Сокращение]              AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressLiveHolder.[УТ2:Улица-Т2:Название]                           AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Улица-Т2:Название],
    addressLiveHolder.[УТ2:Улица-УТ2:Сокращение]                        AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Улица-УТ2:Сокращение],
    addressLiveHolder.[УТ2:Дом]                                         AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Дом],
    addressLiveHolder.[УТ2:Строение]                                    AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Строение],
    addressLiveHolder.[УТ2:Владение]                                    AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Владение],
    addressLiveHolder.[УТ2:Корпус]                                      AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Корпус],
    addressLiveHolder.[УТ2:Квартира]                                    AS [ПравообладательМСП-УТ2:АдресФактический-УТ2:Квартира],
    identityСardHolder.[УТ2:Тип]                                        AS [ПравообладательМСП-УТ2:УдостоверяющийДокумент-УТ2:Тип],
    identityСardHolder.[УТ2:Серия]                                      AS [ПравообладательМСП-УТ2:УдостоверяющийДокумент-УТ2:Серия],
    identityСardHolder.[УТ2:Номер]                                      AS [ПравообладательМСП-УТ2:УдостоверяющийДокумент-УТ2:Номер],
    CONVERT(VARCHAR, identityСardHolder.[УТ2:ДатаВыдачи])               AS [ПравообладательМСП-УТ2:УдостоверяющийДокумент-УТ2:ДатаВыдачи],
    identityСardHolder.[УТ2:КемВыдан]                                   AS [ПравообладательМСП-УТ2:УдостоверяющийДокумент-УТ2:КемВыдан],
    CONVERT(VARCHAR, identityСardHolder.[УТ2:СрокДействия])             AS [ПравообладательМСП-УТ2:УдостоверяющийДокумент-УТ2:СрокДействия],
    identityСardHolder.[УТ2:КодПодразделения]                           AS [ПравообладательМСП-УТ2:УдостоверяющийДокумент-УТ2:КодПодразделения],
    CASE 
        WHEN personalCardReceiver.[Идентификатор] IS NOT NULL 
        THEN servServ.[ПравообладательМСП-Район-Код]
        ELSE NULL 
    END                                                                 AS [Представитель-Район-Код],
    CASE 
        WHEN personalCardReceiver.[Идентификатор] IS NOT NULL 
        THEN servServ.[ПравообладательМСП-Район-УТ2:Наименование]
        ELSE NULL 
    END                                                                 AS [Представитель-Район-УТ2:Наименование],
    personalCardReceiver.[УТ2:СНИЛС]                                    AS [Представитель-УТ2:СНИЛС],
    personalCardReceiver.[УТ2:ФИО-УТ2:Фамилия]                          AS [Представитель-УТ2:ФИО-УТ2:Фамилия],
    personalCardReceiver.[УТ2:ФИО-УТ2:Имя]                              AS [Представитель-УТ2:ФИО-УТ2:Имя],
    personalCardReceiver.[УТ2:ФИО-УТ2:Отчество]                         AS [Представитель-УТ2:ФИО-УТ2:Отчество],
    personalCardReceiver.[УТ2:Пол]                                      AS [Представитель-УТ2:Пол],     
    CONVERT(VARCHAR, personalCardReceiver.[УТ2:ДатаРождения])           AS [Представитель-УТ2:ДатаРождения],
    placeBirthReceiver.[УТ2:Тип]                                        AS [Представитель-УТ2:МестоРождения-УТ2:Тип],
    placeBirthReceiver.[УТ2:Город]                                      AS [Представитель-УТ2:МестоРождения-УТ2:Город],
    placeBirthReceiver.[УТ2:Район]                                      AS [Представитель-УТ2:МестоРождения-УТ2:Район],
    placeBirthReceiver.[УТ2:Регион]                                     AS [Представитель-УТ2:МестоРождения-УТ2:Регион],
    placeBirthReceiver.[УТ2:Страна]                                     AS [Представитель-УТ2:МестоРождения-УТ2:Страна],
    addressRegReceiver.[УТ2:GUID]                                       AS [Представитель-УТ2:АдресРегистрации-УТ2:GUID],
    addressRegReceiver.[УТ2:Индекс]                                     AS [Представитель-УТ2:АдресРегистрации-УТ2:Индекс],
    addressRegReceiver.[УТ2:Регион-Т2:Название]                         AS [Представитель-УТ2:АдресРегистрации-УТ2:Регион-Т2:Название],
    addressRegReceiver.[УТ2:Регион-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресРегистрации-УТ2:Регион-УТ2:Сокращение],
    addressRegReceiver.[УТ2:Округ-Т2:Название]                          AS [Представитель-УТ2:АдресРегистрации-УТ2:Округ-Т2:Название],
    addressRegReceiver.[УТ2:Округ-УТ2:Сокращение]                       AS [Представитель-УТ2:АдресРегистрации-УТ2:Округ-УТ2:Сокращение],
    addressRegReceiver.[УТ2:Район-Т2:Название]                          AS [Представитель-УТ2:АдресРегистрации-УТ2:Район-Т2:Название],
    addressRegReceiver.[УТ2:Район-УТ2:Сокращение]                       AS [Представитель-УТ2:АдресРегистрации-УТ2:Район-УТ2:Сокращение],       
    addressRegReceiver.[УТ2:Город-Т2:Название]                          AS [Представитель-УТ2:АдресРегистрации-УТ2:Город-Т2:Название],
    addressRegReceiver.[УТ2:Город-УТ2:Сокращение]                       AS [Представитель-УТ2:АдресРегистрации-УТ2:Город-УТ2:Сокращение],
    addressRegReceiver.[УТ2:ВнутригородскойРайон-Т2:Название]           AS [Представитель-УТ2:АдресРегистрации-УТ2:ВнутригородскойРайон-Т2:Название],
    addressRegReceiver.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]        AS [Представитель-УТ2:АдресРегистрации-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressRegReceiver.[УТ2:НаселенныйПункт-Т2:Название]                AS [Представитель-УТ2:АдресРегистрации-УТ2:НаселенныйПункт-Т2:Название],
    addressRegReceiver.[УТ2:НаселенныйПункт-УТ2:Сокращение]             AS [Представитель-УТ2:АдресРегистрации-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressRegReceiver.[УТ2:Улица-Т2:Название]                          AS [Представитель-УТ2:АдресРегистрации-УТ2:Улица-Т2:Название],
    addressRegReceiver.[УТ2:Улица-УТ2:Сокращение]                       AS [Представитель-УТ2:АдресРегистрации-УТ2:Улица-УТ2:Сокращение],
    addressRegReceiver.[УТ2:Дом]                                        AS [Представитель-УТ2:АдресРегистрации-УТ2:Дом],
    addressRegReceiver.[УТ2:Строение]                                   AS [Представитель-УТ2:АдресРегистрации-УТ2:Строение],
    addressRegReceiver.[УТ2:Владение]                                   AS [Представитель-УТ2:АдресРегистрации-УТ2:Владение],
    addressRegReceiver.[УТ2:Корпус]                                     AS [Представитель-УТ2:АдресРегистрации-УТ2:Корпус],
    addressRegReceiver.[УТ2:Квартира]                                   AS [Представитель-УТ2:АдресРегистрации-УТ2:Квартира],
    addressTempReceiver.[УТ2:GUID]                                      AS [Представитель-УТ2:АдресПребывания-УТ2:GUID],
    addressTempReceiver.[УТ2:Индекс]                                    AS [Представитель-УТ2:АдресПребывания-УТ2:Индекс],
    addressTempReceiver.[УТ2:Регион-Т2:Название]                        AS [Представитель-УТ2:АдресПребывания-УТ2:Регион-Т2:Название],
    addressTempReceiver.[УТ2:Регион-УТ2:Сокращение]                     AS [Представитель-УТ2:АдресПребывания-УТ2:Регион-УТ2:Сокращение],
    addressTempReceiver.[УТ2:Округ-Т2:Название]                         AS [Представитель-УТ2:АдресПребывания-УТ2:Округ-Т2:Название],
    addressTempReceiver.[УТ2:Округ-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресПребывания-УТ2:Округ-УТ2:Сокращение],
    addressTempReceiver.[УТ2:Район-Т2:Название]                         AS [Представитель-УТ2:АдресПребывания-УТ2:Район-Т2:Название],
    addressTempReceiver.[УТ2:Район-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресПребывания-УТ2:Район-УТ2:Сокращение],       
    addressTempReceiver.[УТ2:Город-Т2:Название]                         AS [Представитель-УТ2:АдресПребывания-УТ2:Город-Т2:Название],
    addressTempReceiver.[УТ2:Город-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресПребывания-УТ2:Город-УТ2:Сокращение],
    addressTempReceiver.[УТ2:ВнутригородскойРайон-Т2:Название]          AS [Представитель-УТ2:АдресПребывания-УТ2:ВнутригородскойРайон-Т2:Название],
    addressTempReceiver.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]       AS [Представитель-УТ2:АдресПребывания-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressTempReceiver.[УТ2:НаселенныйПункт-Т2:Название]               AS [Представитель-УТ2:АдресПребывания-УТ2:НаселенныйПункт-Т2:Название],
    addressTempReceiver.[УТ2:НаселенныйПункт-УТ2:Сокращение]            AS [Представитель-УТ2:АдресПребывания-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressTempReceiver.[УТ2:Улица-Т2:Название]                         AS [Представитель-УТ2:АдресПребывания-УТ2:Улица-Т2:Название],
    addressTempReceiver.[УТ2:Улица-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресПребывания-УТ2:Улица-УТ2:Сокращение],
    addressTempReceiver.[УТ2:Дом]                                       AS [Представитель-УТ2:АдресПребывания-УТ2:Дом],
    addressTempReceiver.[УТ2:Строение]                                  AS [Представитель-УТ2:АдресПребывания-УТ2:Строение],
    addressTempReceiver.[УТ2:Владение]                                  AS [Представитель-УТ2:АдресПребывания-УТ2:Владение],
    addressTempReceiver.[УТ2:Корпус]                                    AS [Представитель-УТ2:АдресПребывания-УТ2:Корпус],
    addressTempReceiver.[УТ2:Квартира]                                  AS [Представитель-УТ2:АдресПребывания-УТ2:Квартира],
    addressLiveReceiver.[УТ2:GUID]                                      AS [Представитель-УТ2:АдресФактический-УТ2:GUID],
    addressLiveReceiver.[УТ2:Индекс]                                    AS [Представитель-УТ2:АдресФактический-УТ2:Индекс],
    addressLiveReceiver.[УТ2:Регион-Т2:Название]                        AS [Представитель-УТ2:АдресФактический-УТ2:Регион-Т2:Название],
    addressLiveReceiver.[УТ2:Регион-УТ2:Сокращение]                     AS [Представитель-УТ2:АдресФактический-УТ2:Регион-УТ2:Сокращение],
    addressLiveReceiver.[УТ2:Округ-Т2:Название]                         AS [Представитель-УТ2:АдресФактический-УТ2:Округ-Т2:Название],
    addressLiveReceiver.[УТ2:Округ-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресФактический-УТ2:Округ-УТ2:Сокращение],
    addressLiveReceiver.[УТ2:Район-Т2:Название]                         AS [Представитель-УТ2:АдресФактический-УТ2:Район-Т2:Название],
    addressLiveReceiver.[УТ2:Район-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресФактический-УТ2:Район-УТ2:Сокращение],       
    addressLiveReceiver.[УТ2:Город-Т2:Название]                         AS [Представитель-УТ2:АдресФактический-УТ2:Город-Т2:Название],
    addressLiveReceiver.[УТ2:Город-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресФактический-УТ2:Город-УТ2:Сокращение],
    addressLiveReceiver.[УТ2:ВнутригородскойРайон-Т2:Название]          AS [Представитель-УТ2:АдресФактический-УТ2:ВнутригородскойРайон-Т2:Название],
    addressLiveReceiver.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]       AS [Представитель-УТ2:АдресФактический-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressLiveReceiver.[УТ2:НаселенныйПункт-Т2:Название]               AS [Представитель-УТ2:АдресФактический-УТ2:НаселенныйПункт-Т2:Название],
    addressLiveReceiver.[УТ2:НаселенныйПункт-УТ2:Сокращение]            AS [Представитель-УТ2:АдресФактический-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressLiveReceiver.[УТ2:Улица-Т2:Название]                         AS [Представитель-УТ2:АдресФактический-УТ2:Улица-Т2:Название],
    addressLiveReceiver.[УТ2:Улица-УТ2:Сокращение]                      AS [Представитель-УТ2:АдресФактический-УТ2:Улица-УТ2:Сокращение],
    addressLiveReceiver.[УТ2:Дом]                                       AS [Представитель-УТ2:АдресФактический-УТ2:Дом],
    addressLiveReceiver.[УТ2:Строение]                                  AS [Представитель-УТ2:АдресФактический-УТ2:Строение],
    addressLiveReceiver.[УТ2:Владение]                                  AS [Представитель-УТ2:АдресФактический-УТ2:Владение],
    addressLiveReceiver.[УТ2:Корпус]                                    AS [Представитель-УТ2:АдресФактический-УТ2:Корпус],
    addressLiveReceiver.[УТ2:Квартира]                                  AS [Представитель-УТ2:АдресФактический-УТ2:Квартира],
    identityСardReceiver.[УТ2:Тип]                                      AS [Представитель-УТ2:УдостоверяющийДокумент-УТ2:Тип],
    identityСardReceiver.[УТ2:Серия]                                    AS [Представитель-УТ2:УдостоверяющийДокумент-УТ2:Серия],
    identityСardReceiver.[УТ2:Номер]                                    AS [Представитель-УТ2:УдостоверяющийДокумент-УТ2:Номер],
    CONVERT(VARCHAR, identityСardReceiver.[УТ2:ДатаВыдачи])             AS [Представитель-УТ2:УдостоверяющийДокумент-УТ2:ДатаВыдачи],
    identityСardReceiver.[УТ2:КемВыдан]                                 AS [Представитель-УТ2:УдостоверяющийДокумент-УТ2:КемВыдан],
    CONVERT(VARCHAR, identityСardReceiver.[УТ2:СрокДействия])           AS [Представитель-УТ2:УдостоверяющийДокумент-УТ2:СрокДействия],
    identityСardReceiver.[УТ2:КодПодразделения]                         AS [Представитель-УТ2:УдостоверяющийДокумент-УТ2:КодПодразделения],
    servServ.[МСП-ГИД-КодПолучателя],
    personalCardChild.[УТ2:СНИЛС]                                       AS [МСП-ГИД-Ребенок-УТ2:СНИЛС],
    personalCardChild.[УТ2:ФИО-УТ2:Фамилия]                             AS [МСП-ГИД-Ребенок-УТ2:ФИО-УТ2:Фамилия],
    personalCardChild.[УТ2:ФИО-УТ2:Имя]                                 AS [МСП-ГИД-Ребенок-УТ2:ФИО-УТ2:Имя],
    personalCardChild.[УТ2:ФИО-УТ2:Отчество]                            AS [МСП-ГИД-Ребенок-УТ2:ФИО-УТ2:Отчество],
    CONVERT(VARCHAR, personalCardChild.[УТ2:ДатаРождения])              AS [МСП-ГИД-Ребенок-УТ2:ДатаРождения],
    addressRegChild.[УТ2:GUID]                                          AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:GUID],
    addressRegChild.[УТ2:Индекс]                                        AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Индекс],
    addressRegChild.[УТ2:Регион-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Регион-Т2:Название],
    addressRegChild.[УТ2:Регион-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Регион-УТ2:Сокращение],
    addressRegChild.[УТ2:Округ-Т2:Название]                             AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Округ-Т2:Название],
    addressRegChild.[УТ2:Округ-УТ2:Сокращение]                          AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Округ-УТ2:Сокращение],
    addressRegChild.[УТ2:Район-Т2:Название]                             AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Район-Т2:Название],
    addressRegChild.[УТ2:Район-УТ2:Сокращение]                          AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Район-УТ2:Сокращение],       
    addressRegChild.[УТ2:Город-Т2:Название]                             AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Город-Т2:Название],
    addressRegChild.[УТ2:Город-УТ2:Сокращение]                          AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Город-УТ2:Сокращение],
    addressRegChild.[УТ2:ВнутригородскойРайон-Т2:Название]              AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:ВнутригородскойРайон-Т2:Название],
    addressRegChild.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]           AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressRegChild.[УТ2:НаселенныйПункт-Т2:Название]                   AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:НаселенныйПункт-Т2:Название],
    addressRegChild.[УТ2:НаселенныйПункт-УТ2:Сокращение]                AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressRegChild.[УТ2:Улица-Т2:Название]                             AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Улица-Т2:Название],
    addressRegChild.[УТ2:Улица-УТ2:Сокращение]                          AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Улица-УТ2:Сокращение],
    addressRegChild.[УТ2:Дом]                                           AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Дом],
    addressRegChild.[УТ2:Строение]                                      AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Строение],
    addressRegChild.[УТ2:Владение]                                      AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Владение],
    addressRegChild.[УТ2:Корпус]                                        AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Корпус],
    addressRegChild.[УТ2:Квартира]                                      AS [МСП-ГИД-Ребенок-УТ2:АдресРегистрации-УТ2:Квартира],
    addressTempChild.[УТ2:GUID]                                         AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:GUID],
    addressTempChild.[УТ2:Индекс]                                       AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Индекс],
    addressTempChild.[УТ2:Регион-Т2:Название]                           AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Регион-Т2:Название],
    addressTempChild.[УТ2:Регион-УТ2:Сокращение]                        AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Регион-УТ2:Сокращение],
    addressTempChild.[УТ2:Округ-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Округ-Т2:Название],
    addressTempChild.[УТ2:Округ-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Округ-УТ2:Сокращение],
    addressTempChild.[УТ2:Район-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Район-Т2:Название],
    addressTempChild.[УТ2:Район-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Район-УТ2:Сокращение],       
    addressTempChild.[УТ2:Город-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Город-Т2:Название],
    addressTempChild.[УТ2:Город-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Город-УТ2:Сокращение],
    addressTempChild.[УТ2:ВнутригородскойРайон-Т2:Название]             AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:ВнутригородскойРайон-Т2:Название],
    addressTempChild.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]          AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressTempChild.[УТ2:НаселенныйПункт-Т2:Название]                  AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:НаселенныйПункт-Т2:Название],
    addressTempChild.[УТ2:НаселенныйПункт-УТ2:Сокращение]               AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressTempChild.[УТ2:Улица-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Улица-Т2:Название],
    addressTempChild.[УТ2:Улица-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Улица-УТ2:Сокращение],
    addressTempChild.[УТ2:Дом]                                          AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Дом],
    addressTempChild.[УТ2:Строение]                                     AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Строение],
    addressTempChild.[УТ2:Владение]                                     AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Владение],
    addressTempChild.[УТ2:Корпус]                                       AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Корпус],
    addressTempChild.[УТ2:Квартира]                                     AS [МСП-ГИД-Ребенок-УТ2:АдресПребывания-УТ2:Квартира],
    addressLiveChild.[УТ2:GUID]                                         AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:GUID],
    addressLiveChild.[УТ2:Индекс]                                       AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Индекс],
    addressLiveChild.[УТ2:Регион-Т2:Название]                           AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Регион-Т2:Название],
    addressLiveChild.[УТ2:Регион-УТ2:Сокращение]                        AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Регион-УТ2:Сокращение],
    addressLiveChild.[УТ2:Округ-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Округ-Т2:Название],
    addressLiveChild.[УТ2:Округ-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Округ-УТ2:Сокращение],
    addressLiveChild.[УТ2:Район-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Район-Т2:Название],
    addressLiveChild.[УТ2:Район-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Район-УТ2:Сокращение],       
    addressLiveChild.[УТ2:Город-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Город-Т2:Название],
    addressLiveChild.[УТ2:Город-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Город-УТ2:Сокращение],
    addressLiveChild.[УТ2:ВнутригородскойРайон-Т2:Название]             AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:ВнутригородскойРайон-Т2:Название],
    addressLiveChild.[УТ2:ВнутригородскойРайон-УТ2:Сокращение]          AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:ВнутригородскойРайон-УТ2:Сокращение],
    addressLiveChild.[УТ2:НаселенныйПункт-Т2:Название]                  AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:НаселенныйПункт-Т2:Название],
    addressLiveChild.[УТ2:НаселенныйПункт-УТ2:Сокращение]               AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:НаселенныйПункт-УТ2:Сокращение],   
    addressLiveChild.[УТ2:Улица-Т2:Название]                            AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Улица-Т2:Название],
    addressLiveChild.[УТ2:Улица-УТ2:Сокращение]                         AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Улица-УТ2:Сокращение],
    addressLiveChild.[УТ2:Дом]                                          AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Дом],
    addressLiveChild.[УТ2:Строение]                                     AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Строение],
    addressLiveChild.[УТ2:Владение]                                     AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Владение],
    addressLiveChild.[УТ2:Корпус]                                       AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Корпус],
    addressLiveChild.[УТ2:Квартира]                                     AS [МСП-ГИД-Ребенок-УТ2:АдресФактический-УТ2:Квартира],
    CONVERT(VARCHAR, servServ.[МСП-РаспорядительныйДокумент-ДатаУстановления]) AS [МСП-РаспорядительныйДокумент-ДатаУстановления], 
    CONVERT(VARCHAR, servServ.[МСП-РаспорядительныйДокумент-Период-УТ2:С]) AS [МСП-РаспорядительныйДокумент-Период-УТ2:С],
    CONVERT(VARCHAR, servServ.[МСП-РаспорядительныйДокумент-Период-УТ2:По])  AS [МСП-РаспорядительныйДокумент-Период-УТ2:По],
    CONVERT(VARCHAR, servServ.[МСП-РаспорядительныйДокумент-Реквизиты-Дата]) AS [МСП-РаспорядительныйДокумент-Реквизиты-Дата],
    servServ.[МСП-РаспорядительныйДокумент-Реквизиты-Номер],
    servServ.[МСП-РаспорядительныйДокумент-РазмерМСП],
    servServ.[МСП-НПА],
    servServ.[МСП-КодМСП],
    servServ.[МСП-СпособДоставки-ТипАдреса],
    servServ.[МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:БИК],
    servServ.[МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:Наименование],
    servServ.[МСП-СпособДоставки-БанковскиеРеквизиты-УТ2:РСчет],
    contactDetails.[УТ2:Телефон]                                        AS [КонтактныеДанные-УТ2:Телефон],
    contactDetails.[УТ2:АдресЭлПочты]                                   AS [КонтактныеДанные-УТ2:АдресЭлПочты]
FROM #НАЗНАЧЕНИЯ servServ
    INNER JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCardHolder
        ON personalCardHolder.[Идентификатор] = servServ.[ПравообладательМСП]
    INNER JOIN WM_PERSONAL_CARD
        ON WM_PERSONAL_CARD.OUID = personalCardHolder.[Идентификатор]
            AND WM_PERSONAL_CARD.A_PCSTATUS = 1
            AND WM_PERSONAL_CARD.A_DEATHDATE IS NULL
    LEFT JOIN #МЕСТА_РОЖДЕНИЯ placeBirthHolder
        ON placeBirthHolder.[Идентификатор] = personalCardHolder.[УТ2:МестоРождения]
    LEFT JOIN #АДРЕСА addressRegHolder
        ON addressRegHolder.[Идентификатор] = personalCardHolder.[УТ2:АдресРегистрации]
    LEFT JOIN #АДРЕСА addressTempHolder
        ON addressTempHolder.[Идентификатор] = personalCardHolder.[УТ2:АдресПребывания]
    LEFT JOIN #АДРЕСА addressLiveHolder
        ON addressLiveHolder.[Идентификатор] = personalCardHolder.[УТ2:АдресФактический] 
    LEFT JOIN #УДОСТОВЕРЯЮЩИЕ_ДОКУМЕНТЫ identityСardHolder
        ON identityСardHolder.[Личное дело] = personalCardHolder.[Идентификатор]

    LEFT JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCardReceiver
        ON personalCardReceiver.[Идентификатор] = servServ.[Представитель]
    LEFT JOIN #МЕСТА_РОЖДЕНИЯ placeBirthReceiver
        ON placeBirthReceiver.[Идентификатор] = personalCardReceiver.[УТ2:МестоРождения]
    LEFT JOIN #АДРЕСА addressRegReceiver
        ON addressRegReceiver.[Идентификатор] = personalCardReceiver.[УТ2:АдресРегистрации]
    LEFT JOIN #АДРЕСА addressTempReceiver
        ON addressTempReceiver.[Идентификатор] = personalCardReceiver.[УТ2:АдресПребывания]
    LEFT JOIN #АДРЕСА addressLiveReceiver
        ON addressLiveReceiver.[Идентификатор] = personalCardReceiver.[УТ2:АдресФактический] 
    LEFT JOIN #УДОСТОВЕРЯЮЩИЕ_ДОКУМЕНТЫ identityСardReceiver
        ON identityСardReceiver.[Личное дело] = personalCardReceiver.[Идентификатор]

    LEFT JOIN #ПЕРСОНАЛЬНАЯ_ИНФОРМАЦИЯ personalCardChild
        ON personalCardChild.[Идентификатор] = servServ.[МСП-ГИД-Ребенок] 
    LEFT JOIN #АДРЕСА addressRegChild
        ON addressRegChild.[Идентификатор] = personalCardChild.[УТ2:АдресРегистрации]
    LEFT JOIN #АДРЕСА addressTempChild
        ON addressTempChild.[Идентификатор] = personalCardChild.[УТ2:АдресПребывания]
    LEFT JOIN #АДРЕСА addressLiveChild
        ON addressLiveChild.[Идентификатор] = personalCardChild.[УТ2:АдресФактический] 
        
    LEFT JOIN #КОНТАКТНЫЕ_ДАННЫЕ contactDetails
        ON contactDetails.[Личное дело] = personalCardHolder.[Идентификатор]

WHERE servServ.[Идентификатор] IN (SELECT [Назначение] FROM #ПРАВОПОДТВЕРЖДАЮЩИЕ_ДОКУМЕНТЫ)

ORDER BY personalCardHolder.[УТ2:СНИЛС], servServ.[Идентификатор]



SELECT 
    сonfirmationDocument.[Назначение],
    сonfirmationDocument.[УТ2:Наименование]         AS [МСП-ПравоподтверждающийДокумент-УТ2:Наименование],
    сonfirmationDocument.[УТ2:Серия]                AS [МСП-ПравоподтверждающийДокумент-УТ2:Серия],
    сonfirmationDocument.[УТ2:Номер]                AS [МСП-ПравоподтверждающийДокумент-УТ2:Номер],
    CONVERT(VARCHAR, сonfirmationDocument.[УТ2:ДатаВыдачи])           AS [МСП-ПравоподтверждающийДокумент-УТ2:ДатаВыдачи],
    сonfirmationDocument.[УТ2:КемВыдан]             AS [МСП-ПравоподтверждающийДокумент-УТ2:КемВыдан],
    CONVERT(VARCHAR, сonfirmationDocument.[ПериодДействия-УТ2:С])     AS [МСП-ПравоподтверждающийДокумент-ПериодДействия-УТ2:С],
    CONVERT(VARCHAR, сonfirmationDocument.[ПериодДействия-УТ2:По]) AS [МСП-ПравоподтверждающийДокумент-ПериодДействия-УТ2:По]
FROM #ПРАВОПОДТВЕРЖДАЮЩИЕ_ДОКУМЕНТЫ сonfirmationDocument