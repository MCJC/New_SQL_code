/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
--USE [x_LoadRLS1cUS]                                                          /* use working database                    */
  USE [forum]                                                                  /* use final database                      */
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Answer_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_NoStd]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
-- select distinct * from                                                      /*  select sttm. for testing Set of Values */
(                                                                              /*> Set of Vals: QWd+StdVal+NoStdVal+AnsWd */
        SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  1 
             , X =  1 
             , Y =  'Afghanistan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2100 
             , X =  2 
             , Y =  'AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2 
             , X =  4 
             , Y =  'Albania'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  3 
             , X =  5 
             , Y =  'Algeria'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  4 
             , X =  6 
             , Y =  'American Samoa'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  5 
             , X =  7 
             , Y =  'Andorra'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  6 
             , X =  8 
             , Y =  'Angola'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  7 
             , X =  9 
             , Y =  'Anguilla'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  8002 
             , X =  10 
             , Y =  'Antarctica'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  8 
             , X =  11 
             , Y =  'Antigua and Barbuda'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  9 
             , X =  12 
             , Y =  'Argentina'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  10 
             , X =  13 
             , Y =  'Armenia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  11 
             , X =  14 
             , Y =  'Aruba'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2300 
             , X =  15 
             , Y =  'ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  12 
             , X =  16 
             , Y =  'Australia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  13 
             , X =  17 
             , Y =  'Austria'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  14 
             , X =  18 
             , Y =  'Azerbaijan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  15 
             , X =  19 
             , Y =  'Bahamas'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  16 
             , X =  20 
             , Y =  'Bahrain'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  17 
             , X =  21 
             , Y =  'Bangladesh'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  18 
             , X =  22 
             , Y =  'Barbados'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  19 
             , X =  23 
             , Y =  'Belarus'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  20 
             , X =  24 
             , Y =  'Belgium'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  21 
             , X =  25 
             , Y =  'Belize'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  22 
             , X =  26 
             , Y =  'Benin'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  23 
             , X =  27 
             , Y =  'Bermuda'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  24 
             , X =  28 
             , Y =  'Bhutan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  25 
             , X =  29 
             , Y =  'Bolivia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  26 
             , X =  30 
             , Y =  'Bosnia and Herzegovina'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  27 
             , X =  31 
             , Y =  'Botswana'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  28 
             , X =  33 
             , Y =  'Brazil'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  29 
             , X =  36 
             , Y =  'British Virgin Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  30 
             , X =  37 
             , Y =  'Brunei'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  31 
             , X =  38 
             , Y =  'Bulgaria'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  32 
             , X =  39 
             , Y =  'Burkina Faso'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  142 
             , X =  40 
             , Y =  'Burma (Myanmar)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  33 
             , X =  41 
             , Y =  'Burundi'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  34 
             , X =  42 
             , Y =  'Cambodia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  35 
             , X =  43 
             , Y =  'Cameroon'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  36 
             , X =  44 
             , Y =  'Canada'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  37 
             , X =  45 
             , Y =  'Cape Verde'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2211 
             , X =  46 
             , Y =  'Caribbean'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  38 
             , X =  47 
             , Y =  'Cayman Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  39 
             , X =  48 
             , Y =  'Central African Rep'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2212 
             , X =  49 
             , Y =  'CENTRAL AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  40 
             , X =  50 
             , Y =  'Chad'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  41 
             , X =  51 
             , Y =  'Channel Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  42 
             , X =  52 
             , Y =  'Chile'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  43 
             , X =  53 
             , Y =  'China'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  628 
             , X =  54 
             , Y =  'Christmas Island'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  629 
             , X =  55 
             , Y =  'Cocos (Keeling) Island'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  44 
             , X =  56 
             , Y =  'Colombia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  45 
             , X =  57 
             , Y =  'Comoros'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  47 
             , X =  58 
             , Y =  'Congo, Democratic Republic of the'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  46 
             , X =  59 
             , Y =  'Congo, Republic of the'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  48 
             , X =  60 
             , Y =  'Cook Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  49 
             , X =  61 
             , Y =  'Costa Rica'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  50 
             , X =  62 
             , Y =  'Cote dIvoire'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  51 
             , X =  63 
             , Y =  'Croatia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  52 
             , X =  64 
             , Y =  'Cuba'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  53 
             , X =  65 
             , Y =  'Cyprus'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  54 
             , X =  66 
             , Y =  'Czech Republic'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  55 
             , X =  67 
             , Y =  'Denmark'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  56 
             , X =  69 
             , Y =  'Djibouti'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  57 
             , X =  70 
             , Y =  'Dominica'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  58 
             , X =  71 
             , Y =  'Dominican Republic'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  207 
             , X =  72 
             , Y =  'Timor-Leste'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2110 
             , X =  73 
             , Y =  'EASTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2310 
             , X =  74 
             , Y =  'EASTERN ASIA  (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2410 
             , X =  75 
             , Y =  'EASTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  59 
             , X =  77 
             , Y =  'Ecuador'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  60 
             , X =  78 
             , Y =  'Egypt'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  61 
             , X =  79 
             , Y =  'El Salvador'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  62 
             , X =  81 
             , Y =  'Equatorial Guinea'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  63 
             , X =  82 
             , Y =  'Eritrea'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  64 
             , X =  83 
             , Y =  'Estonia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  65 
             , X =  84 
             , Y =  'Ethiopia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  1003 
             , X =  85 
             , Y =  'EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  66 
             , X =  86 
             , Y =  'Faeroe Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  67 
             , X =  87 
             , Y =  'Falkland Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  68 
             , X =  88 
             , Y =  'Fiji'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  69 
             , X =  89 
             , Y =  'Finland'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  70 
             , X =  90 
             , Y =  'France'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  71 
             , X =  91 
             , Y =  'French Guiana'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  72 
             , X =  92 
             , Y =  'French Polynesia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  73 
             , X =  93 
             , Y =  'Gabon'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  74 
             , X =  94 
             , Y =  'Gambia, The'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  75 
             , X =  96 
             , Y =  'Georgia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  76 
             , X =  97 
             , Y =  'Germany'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  77 
             , X =  98 
             , Y =  'Ghana'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  78 
             , X =  99 
             , Y =  'Gibraltar'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  79 
             , X =  100 
             , Y =  'Greece'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  80 
             , X =  101 
             , Y =  'Greenland'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  81 
             , X =  102 
             , Y =  'Grenada'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  179 
             , X =  103 
             , Y =  'Grenadines/St. Vincent and the Grenadines'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  82 
             , X =  104 
             , Y =  'Guadeloupe'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  83 
             , X =  105 
             , Y =  'Guam'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  84 
             , X =  106 
             , Y =  'Guatemala'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  85 
             , X =  108 
             , Y =  'Guinea'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  86 
             , X =  109 
             , Y =  'Guinea-Bissau'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  87 
             , X =  110 
             , Y =  'Guyana'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  88 
             , X =  111 
             , Y =  'Haiti'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  89 
             , X =  112 
             , Y =  'Holy See/Vatican City'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  90 
             , X =  113 
             , Y =  'Honduras'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  91 
             , X =  114 
             , Y =  'Hong Kong'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  92 
             , X =  115 
             , Y =  'Hungary'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  93 
             , X =  116 
             , Y =  'Iceland'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  94 
             , X =  117 
             , Y =  'India'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  95 
             , X =  118 
             , Y =  'Indonesia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  96 
             , X =  119 
             , Y =  'Iran'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  97 
             , X =  120 
             , Y =  'Iraq'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  98 
             , X =  121 
             , Y =  'Ireland'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  99 
             , X =  122 
             , Y =  'Isle of Man'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  100 
             , X =  123 
             , Y =  'Israel'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  101 
             , X =  125 
             , Y =  'Italy'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  102 
             , X =  126 
             , Y =  'Jamaica'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  103 
             , X =  127 
             , Y =  'Japan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  104 
             , X =  129 
             , Y =  'Jordan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  105 
             , X =  130 
             , Y =  'Kazakhstan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  106 
             , X =  131 
             , Y =  'Kenya'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  107 
             , X =  132 
             , Y =  'Kiribati'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  801 
             , X =  133 
             , Y =  'Korea'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  154 
             , X =  134 
             , Y =  'Korea, North'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  194 
             , X =  135 
             , Y =  'Korea, South'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  108 
             , X =  136 
             , Y =  'Kosovo'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  109 
             , X =  137 
             , Y =  'Kuwait'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  110 
             , X =  138 
             , Y =  'Kyrgyzstan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  111 
             , X =  139 
             , Y =  'Laos'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2210 
             , X =  140 
             , Y =  'LATIN AMERICA AND THE CARIBBEAN (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  112 
             , X =  141 
             , Y =  'Latvia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  113 
             , X =  142 
             , Y =  'Lebanon'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  114 
             , X =  143 
             , Y =  'Lesotho'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  115 
             , X =  144 
             , Y =  'Liberia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  116 
             , X =  145 
             , Y =  'Libya'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  117 
             , X =  146 
             , Y =  'Liechtenstein'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  118 
             , X =  147 
             , Y =  'Lithuania'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  119 
             , X =  148 
             , Y =  'Luxembourg'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  120 
             , X =  149 
             , Y =  'Macau'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  121 
             , X =  150 
             , Y =  'Macedonia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  122 
             , X =  151 
             , Y =  'Madagascar'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  123 
             , X =  152 
             , Y =  'Malawi'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  124 
             , X =  153 
             , Y =  'Malaysia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  125 
             , X =  154 
             , Y =  'Maldives'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  126 
             , X =  155 
             , Y =  'Mali'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  127 
             , X =  156 
             , Y =  'Malta'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  128 
             , X =  157 
             , Y =  'Marshall Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  129 
             , X =  158 
             , Y =  'Martinique'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  130 
             , X =  159 
             , Y =  'Mauritania'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  131 
             , X =  160 
             , Y =  'Mauritius'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  132 
             , X =  161 
             , Y =  'Mayotte'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  8001 
             , X =  162 
             , Y =  'MIDDLE EAST'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  133 
             , X =  163 
             , Y =  'Mexico'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  134 
             , X =  164 
             , Y =  'Micronesia, Federated States'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2120 
             , X =  165 
             , Y =  'MIDDLE AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  135 
             , X =  166 
             , Y =  'Moldova'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  136 
             , X =  167 
             , Y =  'Monaco'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  137 
             , X =  168 
             , Y =  'Mongolia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  138 
             , X =  169 
             , Y =  'Montenegro'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  139 
             , X =  170 
             , Y =  'Montserrat'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  140 
             , X =  171 
             , Y =  'Morocco'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  141 
             , X =  172 
             , Y =  'Mozambique'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  143 
             , X =  174 
             , Y =  'Namibia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  144 
             , X =  175 
             , Y =  'Nauru'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  145 
             , X =  176 
             , Y =  'Nepal'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  146 
             , X =  177 
             , Y =  'Netherlands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  805 
             , X =  178 
             , Y =  'Netherlands Antilles'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  148 
             , X =  179 
             , Y =  'New Caledonia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  149 
             , X =  180 
             , Y =  'New Zealand'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  150 
             , X =  181 
             , Y =  'Nicaragua'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  151 
             , X =  182 
             , Y =  'Niger'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  152 
             , X =  183 
             , Y =  'Nigeria'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  153 
             , X =  184 
             , Y =  'Niue'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  1001 
             , X =  186 
             , Y =  'NORTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2130 
             , X =  187 
             , Y =  'NORTHERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2420 
             , X =  190 
             , Y =  'NORTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  155 
             , X =  192 
             , Y =  'Northern Mariana Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  156 
             , X =  193 
             , Y =  'Norway'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2500 
             , X =  194 
             , Y =  'OCEANIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  157 
             , X =  195 
             , Y =  'Oman'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  158 
             , X =  196 
             , Y =  'Pakistan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  159 
             , X =  197 
             , Y =  'Palau'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  160 
             , X =  198 
             , Y =  'Palestine/Palestinian Territories'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  161 
             , X =  199 
             , Y =  'Panama'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  162 
             , X =  200 
             , Y =  'Papua New Guinea'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  163 
             , X =  201 
             , Y =  'Paraguay'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  164 
             , X =  202 
             , Y =  'Peru'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  165 
             , X =  203 
             , Y =  'Philippines'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  631 
             , X =  204 
             , Y =  'Pitcairn Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  167 
             , X =  205 
             , Y =  'Poland'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  168 
             , X =  207 
             , Y =  'Portugal'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  169 
             , X =  208 
             , Y =  'Puerto Rico'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  170 
             , X =  209 
             , Y =  'Qatar'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  171 
             , X =  210 
             , Y =  'Reunion'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  172 
             , X =  211 
             , Y =  'Romania'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  173 
             , X =  212 
             , Y =  'Russia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  174 
             , X =  213 
             , Y =  'Rwanda'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  175 
             , X =  214 
             , Y =  'Saint Helena'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  176 
             , X =  215 
             , Y =  'Saint Kitts and Nevis'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  177 
             , X =  216 
             , Y =  'Saint Lucia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  178 
             , X =  217 
             , Y =  'Saint Pierre and Miquelon'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  180 
             , X =  218 
             , Y =  'Samoa'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  181 
             , X =  219 
             , Y =  'San Marino'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  182 
             , X =  220 
             , Y =  'Sao Tome and Principe'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  183 
             , X =  221 
             , Y =  'Saudi Arabia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  184 
             , X =  223 
             , Y =  'Senegal'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  185 
             , X =  224 
             , Y =  'Serbia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  804 
             , X =  225 
             , Y =  'Serbia and Montenegro'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  186 
             , X =  226 
             , Y =  'Seychelles'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  187 
             , X =  227 
             , Y =  'Sierra Leone'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  188 
             , X =  228 
             , Y =  'Singapore'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  189 
             , X =  229 
             , Y =  'Slovakia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  190 
             , X =  230 
             , Y =  'Slovenia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  191 
             , X =  231 
             , Y =  'Solomon Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  192 
             , X =  232 
             , Y =  'Somalia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  193 
             , X =  234 
             , Y =  'South Africa'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2213 
             , X =  235 
             , Y =  'SOUTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2320 
             , X =  236 
             , Y =  'SOUTH-CENTRAL ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2330 
             , X =  237 
             , Y =  'SOUTH-EASTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2140 
             , X =  238 
             , Y =  'Southern Africa'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2430 
             , X =  239 
             , Y =  'SOUTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  237 
             , X =  240 
             , Y =  'South Sudan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  195 
             , X =  241 
             , Y =  'Spain'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  196 
             , X =  243 
             , Y =  'Sri Lanka'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  1005 
             , X =  244 
             , Y =  'SUB-SAHARAN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  197 
             , X =  245 
             , Y =  'Sudan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  198 
             , X =  246 
             , Y =  'Suriname'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  199 
             , X =  248 
             , Y =  'Swaziland'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  200 
             , X =  249 
             , Y =  'Sweden'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  201 
             , X =  250 
             , Y =  'Switzerland'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  202 
             , X =  251 
             , Y =  'Syria'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  203 
             , X =  252 
             , Y =  'Taiwan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  204 
             , X =  253 
             , Y =  'Tajikistan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  205 
             , X =  254 
             , Y =  'Tanzania'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  206 
             , X =  255 
             , Y =  'Thailand'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  632 
             , X =  256 
             , Y =  'Tibet'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  208 
             , X =  257 
             , Y =  'Togo'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  209 
             , X =  258 
             , Y =  'Tokelau'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  210 
             , X =  259 
             , Y =  'Tonga'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  211 
             , X =  260 
             , Y =  'Trinidad and Tobago'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  212 
             , X =  261 
             , Y =  'Tunisia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  213 
             , X =  262 
             , Y =  'Turkey'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  214 
             , X =  263 
             , Y =  'Turkmenistan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  215 
             , X =  264 
             , Y =  'Turks and Caicos Islands'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  216 
             , X =  265 
             , Y =  'Tuvalu'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  217 
             , X =  266 
             , Y =  'Uganda'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  218 
             , X =  267 
             , Y =  'Ukraine'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  219 
             , X =  268 
             , Y =  'United Arab Emirates'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  220 
             , X =  269 
             , Y =  'United Kingdom'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  221 
             , X =  270 
             , Y =  'United States'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  223 
             , X =  271 
             , Y =  'Uruguay'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  224 
             , X =  272 
             , Y =  'Uzbekistan'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  225 
             , X =  273 
             , Y =  'Vanuatu'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  226 
             , X =  274 
             , Y =  'Venezuela'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  227 
             , X =  275 
             , Y =  'Vietnam'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  222 
             , X =  276 
             , Y =  'Virgin Islands (U.S.)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  228 
             , X =  278 
             , Y =  'Wallis and Futuna'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2150 
             , X =  280 
             , Y =  'WESTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2340 
             , X =  281 
             , Y =  'WESTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  2440 
             , X =  282 
             , Y =  'WESTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  229 
             , X =  284 
             , Y =  'Western Sahara'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  230 
             , X =  285 
             , Y =  'Yemen'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  231 
             , X =  287 
             , Y =  'Zambia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  232 
             , X =  288 
             , Y =  'Zimbabwe'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  802 
             , X =  500 
             , Y =  'USSR'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  803 
             , X =  501 
             , Y =  'Yugoslavia'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  9998 
             , X =  597 
             , Y =  'Other/Unclear/Undetermined'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  705 
             , X =  598 
             , Y =  'Born Outside U.S. - Dont Know Where'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  706 
             , X =  599 
             , Y =  'Born Outside U.S. - Refused to Say Where'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  9997 
             , X =  888 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS07cUS_respondent_birthcountry'
             , V =  9999 
             , X =  999 
             , Y =  'Dont know/Refused to say where born'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  1 
             , X =  1 
             , Y =  'Afghanistan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2100 
             , X =  2 
             , Y =  'AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2 
             , X =  4 
             , Y =  'Albania'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  3 
             , X =  5 
             , Y =  'Algeria'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  4 
             , X =  6 
             , Y =  'American Samoa'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  5 
             , X =  7 
             , Y =  'Andorra'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  6 
             , X =  8 
             , Y =  'Angola'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  7 
             , X =  9 
             , Y =  'Anguilla'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  8002 
             , X =  10 
             , Y =  'Antarctica'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  8 
             , X =  11 
             , Y =  'Antigua and Barbuda'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  9 
             , X =  12 
             , Y =  'Argentina'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  10 
             , X =  13 
             , Y =  'Armenia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  11 
             , X =  14 
             , Y =  'Aruba'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2300 
             , X =  15 
             , Y =  'ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  12 
             , X =  16 
             , Y =  'Australia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  13 
             , X =  17 
             , Y =  'Austria'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  14 
             , X =  18 
             , Y =  'Azerbaijan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  15 
             , X =  19 
             , Y =  'Bahamas'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  16 
             , X =  20 
             , Y =  'Bahrain'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  17 
             , X =  21 
             , Y =  'Bangladesh'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  18 
             , X =  22 
             , Y =  'Barbados'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  19 
             , X =  23 
             , Y =  'Belarus'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  20 
             , X =  24 
             , Y =  'Belgium'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  21 
             , X =  25 
             , Y =  'Belize'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  22 
             , X =  26 
             , Y =  'Benin'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  23 
             , X =  27 
             , Y =  'Bermuda'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  24 
             , X =  28 
             , Y =  'Bhutan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  25 
             , X =  29 
             , Y =  'Bolivia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  26 
             , X =  30 
             , Y =  'Bosnia and Herzegovina'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  27 
             , X =  31 
             , Y =  'Botswana'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  28 
             , X =  33 
             , Y =  'Brazil'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  29 
             , X =  36 
             , Y =  'British Virgin Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  30 
             , X =  37 
             , Y =  'Brunei'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  31 
             , X =  38 
             , Y =  'Bulgaria'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  32 
             , X =  39 
             , Y =  'Burkina Faso'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  142 
             , X =  40 
             , Y =  'Burma (Myanmar)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  33 
             , X =  41 
             , Y =  'Burundi'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  34 
             , X =  42 
             , Y =  'Cambodia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  35 
             , X =  43 
             , Y =  'Cameroon'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  36 
             , X =  44 
             , Y =  'Canada'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  37 
             , X =  45 
             , Y =  'Cape Verde'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2211 
             , X =  46 
             , Y =  'Caribbean'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  38 
             , X =  47 
             , Y =  'Cayman Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  39 
             , X =  48 
             , Y =  'Central African Rep'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2212 
             , X =  49 
             , Y =  'CENTRAL AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  40 
             , X =  50 
             , Y =  'Chad'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  41 
             , X =  51 
             , Y =  'Channel Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  42 
             , X =  52 
             , Y =  'Chile'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  43 
             , X =  53 
             , Y =  'China'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  628 
             , X =  54 
             , Y =  'Christmas Island'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  629 
             , X =  55 
             , Y =  'Cocos (Keeling) Island'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  44 
             , X =  56 
             , Y =  'Colombia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  45 
             , X =  57 
             , Y =  'Comoros'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  47 
             , X =  58 
             , Y =  'Congo, Democratic Republic of the'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  46 
             , X =  59 
             , Y =  'Congo, Republic of the'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  48 
             , X =  60 
             , Y =  'Cook Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  49 
             , X =  61 
             , Y =  'Costa Rica'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  50 
             , X =  62 
             , Y =  'Cote dIvoire'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  51 
             , X =  63 
             , Y =  'Croatia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  52 
             , X =  64 
             , Y =  'Cuba'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  53 
             , X =  65 
             , Y =  'Cyprus'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  54 
             , X =  66 
             , Y =  'Czech Republic'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  55 
             , X =  67 
             , Y =  'Denmark'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  56 
             , X =  69 
             , Y =  'Djibouti'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  57 
             , X =  70 
             , Y =  'Dominica'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  58 
             , X =  71 
             , Y =  'Dominican Republic'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  207 
             , X =  72 
             , Y =  'Timor-Leste'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2110 
             , X =  73 
             , Y =  'EASTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2310 
             , X =  74 
             , Y =  'EASTERN ASIA  (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2410 
             , X =  75 
             , Y =  'EASTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  59 
             , X =  77 
             , Y =  'Ecuador'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  60 
             , X =  78 
             , Y =  'Egypt'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  61 
             , X =  79 
             , Y =  'El Salvador'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  62 
             , X =  81 
             , Y =  'Equatorial Guinea'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  63 
             , X =  82 
             , Y =  'Eritrea'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  64 
             , X =  83 
             , Y =  'Estonia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  65 
             , X =  84 
             , Y =  'Ethiopia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  1003 
             , X =  85 
             , Y =  'EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  66 
             , X =  86 
             , Y =  'Faeroe Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  67 
             , X =  87 
             , Y =  'Falkland Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  68 
             , X =  88 
             , Y =  'Fiji'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  69 
             , X =  89 
             , Y =  'Finland'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  70 
             , X =  90 
             , Y =  'France'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  71 
             , X =  91 
             , Y =  'French Guiana'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  72 
             , X =  92 
             , Y =  'French Polynesia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  73 
             , X =  93 
             , Y =  'Gabon'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  74 
             , X =  94 
             , Y =  'Gambia, The'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  75 
             , X =  96 
             , Y =  'Georgia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  76 
             , X =  97 
             , Y =  'Germany'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  77 
             , X =  98 
             , Y =  'Ghana'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  78 
             , X =  99 
             , Y =  'Gibraltar'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  79 
             , X =  100 
             , Y =  'Greece'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  80 
             , X =  101 
             , Y =  'Greenland'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  81 
             , X =  102 
             , Y =  'Grenada'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  179 
             , X =  103 
             , Y =  'Grenadines/St. Vincent and the Grenadines'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  82 
             , X =  104 
             , Y =  'Guadeloupe'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  83 
             , X =  105 
             , Y =  'Guam'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  84 
             , X =  106 
             , Y =  'Guatemala'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  85 
             , X =  108 
             , Y =  'Guinea'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  86 
             , X =  109 
             , Y =  'Guinea-Bissau'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  87 
             , X =  110 
             , Y =  'Guyana'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  88 
             , X =  111 
             , Y =  'Haiti'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  89 
             , X =  112 
             , Y =  'Holy See/Vatican City'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  90 
             , X =  113 
             , Y =  'Honduras'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  91 
             , X =  114 
             , Y =  'Hong Kong'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  92 
             , X =  115 
             , Y =  'Hungary'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  93 
             , X =  116 
             , Y =  'Iceland'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  94 
             , X =  117 
             , Y =  'India'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  95 
             , X =  118 
             , Y =  'Indonesia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  96 
             , X =  119 
             , Y =  'Iran'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  97 
             , X =  120 
             , Y =  'Iraq'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  98 
             , X =  121 
             , Y =  'Ireland'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  99 
             , X =  122 
             , Y =  'Isle of Man'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  100 
             , X =  123 
             , Y =  'Israel'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  101 
             , X =  125 
             , Y =  'Italy'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  102 
             , X =  126 
             , Y =  'Jamaica'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  103 
             , X =  127 
             , Y =  'Japan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  104 
             , X =  129 
             , Y =  'Jordan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  105 
             , X =  130 
             , Y =  'Kazakhstan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  106 
             , X =  131 
             , Y =  'Kenya'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  107 
             , X =  132 
             , Y =  'Kiribati'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  801 
             , X =  133 
             , Y =  'Korea'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  154 
             , X =  134 
             , Y =  'Korea, North'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  194 
             , X =  135 
             , Y =  'Korea, South'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  108 
             , X =  136 
             , Y =  'Kosovo'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  109 
             , X =  137 
             , Y =  'Kuwait'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  110 
             , X =  138 
             , Y =  'Kyrgyzstan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  111 
             , X =  139 
             , Y =  'Laos'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2210 
             , X =  140 
             , Y =  'LATIN AMERICA AND THE CARIBBEAN (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  112 
             , X =  141 
             , Y =  'Latvia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  113 
             , X =  142 
             , Y =  'Lebanon'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  114 
             , X =  143 
             , Y =  'Lesotho'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  115 
             , X =  144 
             , Y =  'Liberia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  116 
             , X =  145 
             , Y =  'Libya'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  117 
             , X =  146 
             , Y =  'Liechtenstein'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  118 
             , X =  147 
             , Y =  'Lithuania'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  119 
             , X =  148 
             , Y =  'Luxembourg'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  120 
             , X =  149 
             , Y =  'Macau'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  121 
             , X =  150 
             , Y =  'Macedonia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  122 
             , X =  151 
             , Y =  'Madagascar'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  123 
             , X =  152 
             , Y =  'Malawi'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  124 
             , X =  153 
             , Y =  'Malaysia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  125 
             , X =  154 
             , Y =  'Maldives'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  126 
             , X =  155 
             , Y =  'Mali'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  127 
             , X =  156 
             , Y =  'Malta'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  128 
             , X =  157 
             , Y =  'Marshall Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  129 
             , X =  158 
             , Y =  'Martinique'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  130 
             , X =  159 
             , Y =  'Mauritania'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  131 
             , X =  160 
             , Y =  'Mauritius'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  132 
             , X =  161 
             , Y =  'Mayotte'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  8001 
             , X =  162 
             , Y =  'MIDDLE EAST'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  133 
             , X =  163 
             , Y =  'Mexico'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  134 
             , X =  164 
             , Y =  'Micronesia, Federated States'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2120 
             , X =  165 
             , Y =  'MIDDLE AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  135 
             , X =  166 
             , Y =  'Moldova'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  136 
             , X =  167 
             , Y =  'Monaco'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  137 
             , X =  168 
             , Y =  'Mongolia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  138 
             , X =  169 
             , Y =  'Montenegro'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  139 
             , X =  170 
             , Y =  'Montserrat'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  140 
             , X =  171 
             , Y =  'Morocco'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  141 
             , X =  172 
             , Y =  'Mozambique'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  143 
             , X =  174 
             , Y =  'Namibia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  144 
             , X =  175 
             , Y =  'Nauru'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  145 
             , X =  176 
             , Y =  'Nepal'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  146 
             , X =  177 
             , Y =  'Netherlands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  805 
             , X =  178 
             , Y =  'Netherlands Antilles'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  148 
             , X =  179 
             , Y =  'New Caledonia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  149 
             , X =  180 
             , Y =  'New Zealand'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  150 
             , X =  181 
             , Y =  'Nicaragua'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  151 
             , X =  182 
             , Y =  'Niger'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  152 
             , X =  183 
             , Y =  'Nigeria'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  153 
             , X =  184 
             , Y =  'Niue'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  1001 
             , X =  186 
             , Y =  'NORTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2130 
             , X =  187 
             , Y =  'NORTHERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2420 
             , X =  190 
             , Y =  'NORTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  155 
             , X =  192 
             , Y =  'Northern Mariana Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  156 
             , X =  193 
             , Y =  'Norway'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2500 
             , X =  194 
             , Y =  'OCEANIA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  157 
             , X =  195 
             , Y =  'Oman'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  158 
             , X =  196 
             , Y =  'Pakistan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  159 
             , X =  197 
             , Y =  'Palau'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  160 
             , X =  198 
             , Y =  'Palestine/Palestinian Territories'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  161 
             , X =  199 
             , Y =  'Panama'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  162 
             , X =  200 
             , Y =  'Papua New Guinea'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  163 
             , X =  201 
             , Y =  'Paraguay'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  164 
             , X =  202 
             , Y =  'Peru'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  165 
             , X =  203 
             , Y =  'Philippines'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  631 
             , X =  204 
             , Y =  'Pitcairn Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  167 
             , X =  205 
             , Y =  'Poland'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  168 
             , X =  207 
             , Y =  'Portugal'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  169 
             , X =  208 
             , Y =  'Puerto Rico'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  170 
             , X =  209 
             , Y =  'Qatar'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  171 
             , X =  210 
             , Y =  'Reunion'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  172 
             , X =  211 
             , Y =  'Romania'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  173 
             , X =  212 
             , Y =  'Russia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  174 
             , X =  213 
             , Y =  'Rwanda'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  175 
             , X =  214 
             , Y =  'Saint Helena'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  176 
             , X =  215 
             , Y =  'Saint Kitts and Nevis'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  177 
             , X =  216 
             , Y =  'Saint Lucia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  178 
             , X =  217 
             , Y =  'Saint Pierre and Miquelon'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  180 
             , X =  218 
             , Y =  'Samoa'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  181 
             , X =  219 
             , Y =  'San Marino'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  182 
             , X =  220 
             , Y =  'Sao Tome and Principe'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  183 
             , X =  221 
             , Y =  'Saudi Arabia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  184 
             , X =  223 
             , Y =  'Senegal'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  185 
             , X =  224 
             , Y =  'Serbia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  804 
             , X =  225 
             , Y =  'Serbia and Montenegro'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  186 
             , X =  226 
             , Y =  'Seychelles'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  187 
             , X =  227 
             , Y =  'Sierra Leone'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  188 
             , X =  228 
             , Y =  'Singapore'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  189 
             , X =  229 
             , Y =  'Slovakia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  190 
             , X =  230 
             , Y =  'Slovenia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  191 
             , X =  231 
             , Y =  'Solomon Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  192 
             , X =  232 
             , Y =  'Somalia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  193 
             , X =  234 
             , Y =  'South Africa'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2213 
             , X =  235 
             , Y =  'SOUTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2320 
             , X =  236 
             , Y =  'SOUTH-CENTRAL ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2330 
             , X =  237 
             , Y =  'SOUTH-EASTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2140 
             , X =  238 
             , Y =  'Southern Africa'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2430 
             , X =  239 
             , Y =  'SOUTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  237 
             , X =  240 
             , Y =  'South Sudan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  195 
             , X =  241 
             , Y =  'Spain'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  196 
             , X =  243 
             , Y =  'Sri Lanka'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  1005 
             , X =  244 
             , Y =  'SUB-SAHARAN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  197 
             , X =  245 
             , Y =  'Sudan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  198 
             , X =  246 
             , Y =  'Suriname'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  199 
             , X =  248 
             , Y =  'Swaziland'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  200 
             , X =  249 
             , Y =  'Sweden'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  201 
             , X =  250 
             , Y =  'Switzerland'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  202 
             , X =  251 
             , Y =  'Syria'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  203 
             , X =  252 
             , Y =  'Taiwan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  204 
             , X =  253 
             , Y =  'Tajikistan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  205 
             , X =  254 
             , Y =  'Tanzania'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  206 
             , X =  255 
             , Y =  'Thailand'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  632 
             , X =  256 
             , Y =  'Tibet'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  208 
             , X =  257 
             , Y =  'Togo'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  209 
             , X =  258 
             , Y =  'Tokelau'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  210 
             , X =  259 
             , Y =  'Tonga'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  211 
             , X =  260 
             , Y =  'Trinidad and Tobago'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  212 
             , X =  261 
             , Y =  'Tunisia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  213 
             , X =  262 
             , Y =  'Turkey'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  214 
             , X =  263 
             , Y =  'Turkmenistan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  215 
             , X =  264 
             , Y =  'Turks and Caicos Islands'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  216 
             , X =  265 
             , Y =  'Tuvalu'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  217 
             , X =  266 
             , Y =  'Uganda'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  218 
             , X =  267 
             , Y =  'Ukraine'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  219 
             , X =  268 
             , Y =  'United Arab Emirates'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  220 
             , X =  269 
             , Y =  'United Kingdom'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  221 
             , X =  270 
             , Y =  'United States'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  223 
             , X =  271 
             , Y =  'Uruguay'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  224 
             , X =  272 
             , Y =  'Uzbekistan'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  225 
             , X =  273 
             , Y =  'Vanuatu'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  226 
             , X =  274 
             , Y =  'Venezuela'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  227 
             , X =  275 
             , Y =  'Vietnam'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  222 
             , X =  276 
             , Y =  'Virgin Islands (U.S.)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  228 
             , X =  278 
             , Y =  'Wallis and Futuna'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2150 
             , X =  280 
             , Y =  'WESTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2340 
             , X =  281 
             , Y =  'WESTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  2440 
             , X =  282 
             , Y =  'WESTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  229 
             , X =  284 
             , Y =  'Western Sahara'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  230 
             , X =  285 
             , Y =  'Yemen'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  231 
             , X =  287 
             , Y =  'Zambia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  232 
             , X =  288 
             , Y =  'Zimbabwe'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  802 
             , X =  500 
             , Y =  'USSR'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  803 
             , X =  501 
             , Y =  'Yugoslavia'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  9998 
             , X =  597 
             , Y =  'Other/Unclear/Undetermined'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  705 
             , X =  598 
             , Y =  'Born Outside U.S. - Dont Know Where'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  706 
             , X =  599 
             , Y =  'Born Outside U.S. - Refused to Say Where'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  9997 
             , X =  888 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS14all_respondent_birthcountry'
             , V =  9999 
             , X =  999 
             , Y =  'Dont know/Refused to say where born'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  1 
             , X =  1 
             , Y =  'Afghanistan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2100 
             , X =  2 
             , Y =  'AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2 
             , X =  4 
             , Y =  'Albania'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  3 
             , X =  5 
             , Y =  'Algeria'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  4 
             , X =  6 
             , Y =  'American Samoa'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  5 
             , X =  7 
             , Y =  'Andorra'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  6 
             , X =  8 
             , Y =  'Angola'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  7 
             , X =  9 
             , Y =  'Anguilla'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  8002 
             , X =  10 
             , Y =  'Antarctica'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  8 
             , X =  11 
             , Y =  'Antigua and Barbuda'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  9 
             , X =  12 
             , Y =  'Argentina'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  10 
             , X =  13 
             , Y =  'Armenia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  11 
             , X =  14 
             , Y =  'Aruba'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2300 
             , X =  15 
             , Y =  'ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  12 
             , X =  16 
             , Y =  'Australia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  13 
             , X =  17 
             , Y =  'Austria'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  14 
             , X =  18 
             , Y =  'Azerbaijan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  15 
             , X =  19 
             , Y =  'Bahamas'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  16 
             , X =  20 
             , Y =  'Bahrain'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  17 
             , X =  21 
             , Y =  'Bangladesh'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  18 
             , X =  22 
             , Y =  'Barbados'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  19 
             , X =  23 
             , Y =  'Belarus'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  20 
             , X =  24 
             , Y =  'Belgium'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  21 
             , X =  25 
             , Y =  'Belize'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  22 
             , X =  26 
             , Y =  'Benin'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  23 
             , X =  27 
             , Y =  'Bermuda'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  24 
             , X =  28 
             , Y =  'Bhutan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  25 
             , X =  29 
             , Y =  'Bolivia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  26 
             , X =  30 
             , Y =  'Bosnia and Herzegovina'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  27 
             , X =  31 
             , Y =  'Botswana'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  28 
             , X =  33 
             , Y =  'Brazil'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  29 
             , X =  36 
             , Y =  'British Virgin Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  30 
             , X =  37 
             , Y =  'Brunei'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  31 
             , X =  38 
             , Y =  'Bulgaria'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  32 
             , X =  39 
             , Y =  'Burkina Faso'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  142 
             , X =  40 
             , Y =  'Burma (Myanmar)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  33 
             , X =  41 
             , Y =  'Burundi'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  34 
             , X =  42 
             , Y =  'Cambodia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  35 
             , X =  43 
             , Y =  'Cameroon'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  36 
             , X =  44 
             , Y =  'Canada'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  37 
             , X =  45 
             , Y =  'Cape Verde'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2211 
             , X =  46 
             , Y =  'Caribbean'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  38 
             , X =  47 
             , Y =  'Cayman Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  39 
             , X =  48 
             , Y =  'Central African Rep'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2212 
             , X =  49 
             , Y =  'CENTRAL AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  40 
             , X =  50 
             , Y =  'Chad'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  41 
             , X =  51 
             , Y =  'Channel Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  42 
             , X =  52 
             , Y =  'Chile'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  43 
             , X =  53 
             , Y =  'China'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  628 
             , X =  54 
             , Y =  'Christmas Island'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  629 
             , X =  55 
             , Y =  'Cocos (Keeling) Island'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  44 
             , X =  56 
             , Y =  'Colombia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  45 
             , X =  57 
             , Y =  'Comoros'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  47 
             , X =  58 
             , Y =  'Congo, Democratic Republic of the'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  46 
             , X =  59 
             , Y =  'Congo, Republic of the'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  48 
             , X =  60 
             , Y =  'Cook Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  49 
             , X =  61 
             , Y =  'Costa Rica'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  50 
             , X =  62 
             , Y =  'Cote dIvoire'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  51 
             , X =  63 
             , Y =  'Croatia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  52 
             , X =  64 
             , Y =  'Cuba'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  53 
             , X =  65 
             , Y =  'Cyprus'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  54 
             , X =  66 
             , Y =  'Czech Republic'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  55 
             , X =  67 
             , Y =  'Denmark'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  56 
             , X =  69 
             , Y =  'Djibouti'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  57 
             , X =  70 
             , Y =  'Dominica'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  58 
             , X =  71 
             , Y =  'Dominican Republic'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  207 
             , X =  72 
             , Y =  'Timor-Leste'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2110 
             , X =  73 
             , Y =  'EASTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2310 
             , X =  74 
             , Y =  'EASTERN ASIA  (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2410 
             , X =  75 
             , Y =  'EASTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  59 
             , X =  77 
             , Y =  'Ecuador'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  60 
             , X =  78 
             , Y =  'Egypt'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  61 
             , X =  79 
             , Y =  'El Salvador'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  62 
             , X =  81 
             , Y =  'Equatorial Guinea'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  63 
             , X =  82 
             , Y =  'Eritrea'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  64 
             , X =  83 
             , Y =  'Estonia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  65 
             , X =  84 
             , Y =  'Ethiopia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  1003 
             , X =  85 
             , Y =  'EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  66 
             , X =  86 
             , Y =  'Faeroe Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  67 
             , X =  87 
             , Y =  'Falkland Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  68 
             , X =  88 
             , Y =  'Fiji'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  69 
             , X =  89 
             , Y =  'Finland'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  70 
             , X =  90 
             , Y =  'France'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  71 
             , X =  91 
             , Y =  'French Guiana'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  72 
             , X =  92 
             , Y =  'French Polynesia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  73 
             , X =  93 
             , Y =  'Gabon'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  74 
             , X =  94 
             , Y =  'Gambia, The'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  75 
             , X =  96 
             , Y =  'Georgia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  76 
             , X =  97 
             , Y =  'Germany'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  77 
             , X =  98 
             , Y =  'Ghana'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  78 
             , X =  99 
             , Y =  'Gibraltar'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  79 
             , X =  100 
             , Y =  'Greece'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  80 
             , X =  101 
             , Y =  'Greenland'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  81 
             , X =  102 
             , Y =  'Grenada'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  179 
             , X =  103 
             , Y =  'Grenadines/St. Vincent and the Grenadines'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  82 
             , X =  104 
             , Y =  'Guadeloupe'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  83 
             , X =  105 
             , Y =  'Guam'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  84 
             , X =  106 
             , Y =  'Guatemala'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  85 
             , X =  108 
             , Y =  'Guinea'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  86 
             , X =  109 
             , Y =  'Guinea-Bissau'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  87 
             , X =  110 
             , Y =  'Guyana'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  88 
             , X =  111 
             , Y =  'Haiti'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  89 
             , X =  112 
             , Y =  'Holy See/Vatican City'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  90 
             , X =  113 
             , Y =  'Honduras'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  91 
             , X =  114 
             , Y =  'Hong Kong'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  92 
             , X =  115 
             , Y =  'Hungary'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  93 
             , X =  116 
             , Y =  'Iceland'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  94 
             , X =  117 
             , Y =  'India'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  95 
             , X =  118 
             , Y =  'Indonesia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  96 
             , X =  119 
             , Y =  'Iran'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  97 
             , X =  120 
             , Y =  'Iraq'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  98 
             , X =  121 
             , Y =  'Ireland'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  99 
             , X =  122 
             , Y =  'Isle of Man'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  100 
             , X =  123 
             , Y =  'Israel'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  101 
             , X =  125 
             , Y =  'Italy'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  102 
             , X =  126 
             , Y =  'Jamaica'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  103 
             , X =  127 
             , Y =  'Japan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  104 
             , X =  129 
             , Y =  'Jordan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  105 
             , X =  130 
             , Y =  'Kazakhstan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  106 
             , X =  131 
             , Y =  'Kenya'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  107 
             , X =  132 
             , Y =  'Kiribati'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  801 
             , X =  133 
             , Y =  'Korea'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  154 
             , X =  134 
             , Y =  'Korea, North'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  194 
             , X =  135 
             , Y =  'Korea, South'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  108 
             , X =  136 
             , Y =  'Kosovo'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  109 
             , X =  137 
             , Y =  'Kuwait'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  110 
             , X =  138 
             , Y =  'Kyrgyzstan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  111 
             , X =  139 
             , Y =  'Laos'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2210 
             , X =  140 
             , Y =  'LATIN AMERICA AND THE CARIBBEAN (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  112 
             , X =  141 
             , Y =  'Latvia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  113 
             , X =  142 
             , Y =  'Lebanon'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  114 
             , X =  143 
             , Y =  'Lesotho'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  115 
             , X =  144 
             , Y =  'Liberia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  116 
             , X =  145 
             , Y =  'Libya'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  117 
             , X =  146 
             , Y =  'Liechtenstein'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  118 
             , X =  147 
             , Y =  'Lithuania'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  119 
             , X =  148 
             , Y =  'Luxembourg'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  120 
             , X =  149 
             , Y =  'Macau'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  121 
             , X =  150 
             , Y =  'Macedonia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  122 
             , X =  151 
             , Y =  'Madagascar'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  123 
             , X =  152 
             , Y =  'Malawi'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  124 
             , X =  153 
             , Y =  'Malaysia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  125 
             , X =  154 
             , Y =  'Maldives'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  126 
             , X =  155 
             , Y =  'Mali'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  127 
             , X =  156 
             , Y =  'Malta'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  128 
             , X =  157 
             , Y =  'Marshall Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  129 
             , X =  158 
             , Y =  'Martinique'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  130 
             , X =  159 
             , Y =  'Mauritania'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  131 
             , X =  160 
             , Y =  'Mauritius'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  132 
             , X =  161 
             , Y =  'Mayotte'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  8001 
             , X =  162 
             , Y =  'MIDDLE EAST'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  133 
             , X =  163 
             , Y =  'Mexico'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  134 
             , X =  164 
             , Y =  'Micronesia, Federated States'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2120 
             , X =  165 
             , Y =  'MIDDLE AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  135 
             , X =  166 
             , Y =  'Moldova'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  136 
             , X =  167 
             , Y =  'Monaco'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  137 
             , X =  168 
             , Y =  'Mongolia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  138 
             , X =  169 
             , Y =  'Montenegro'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  139 
             , X =  170 
             , Y =  'Montserrat'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  140 
             , X =  171 
             , Y =  'Morocco'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  141 
             , X =  172 
             , Y =  'Mozambique'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  143 
             , X =  174 
             , Y =  'Namibia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  144 
             , X =  175 
             , Y =  'Nauru'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  145 
             , X =  176 
             , Y =  'Nepal'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  146 
             , X =  177 
             , Y =  'Netherlands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  805 
             , X =  178 
             , Y =  'Netherlands Antilles'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  148 
             , X =  179 
             , Y =  'New Caledonia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  149 
             , X =  180 
             , Y =  'New Zealand'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  150 
             , X =  181 
             , Y =  'Nicaragua'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  151 
             , X =  182 
             , Y =  'Niger'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  152 
             , X =  183 
             , Y =  'Nigeria'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  153 
             , X =  184 
             , Y =  'Niue'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  1001 
             , X =  186 
             , Y =  'NORTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2130 
             , X =  187 
             , Y =  'NORTHERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2420 
             , X =  190 
             , Y =  'NORTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  155 
             , X =  192 
             , Y =  'Northern Mariana Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  156 
             , X =  193 
             , Y =  'Norway'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2500 
             , X =  194 
             , Y =  'OCEANIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  157 
             , X =  195 
             , Y =  'Oman'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  158 
             , X =  196 
             , Y =  'Pakistan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  159 
             , X =  197 
             , Y =  'Palau'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  160 
             , X =  198 
             , Y =  'Palestine/Palestinian Territories'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  161 
             , X =  199 
             , Y =  'Panama'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  162 
             , X =  200 
             , Y =  'Papua New Guinea'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  163 
             , X =  201 
             , Y =  'Paraguay'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  164 
             , X =  202 
             , Y =  'Peru'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  165 
             , X =  203 
             , Y =  'Philippines'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  631 
             , X =  204 
             , Y =  'Pitcairn Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  167 
             , X =  205 
             , Y =  'Poland'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  168 
             , X =  207 
             , Y =  'Portugal'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  169 
             , X =  208 
             , Y =  'Puerto Rico'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  170 
             , X =  209 
             , Y =  'Qatar'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  171 
             , X =  210 
             , Y =  'Reunion'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  172 
             , X =  211 
             , Y =  'Romania'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  173 
             , X =  212 
             , Y =  'Russia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  174 
             , X =  213 
             , Y =  'Rwanda'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  175 
             , X =  214 
             , Y =  'Saint Helena'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  176 
             , X =  215 
             , Y =  'Saint Kitts and Nevis'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  177 
             , X =  216 
             , Y =  'Saint Lucia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  178 
             , X =  217 
             , Y =  'Saint Pierre and Miquelon'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  180 
             , X =  218 
             , Y =  'Samoa'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  181 
             , X =  219 
             , Y =  'San Marino'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  182 
             , X =  220 
             , Y =  'Sao Tome and Principe'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  183 
             , X =  221 
             , Y =  'Saudi Arabia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  184 
             , X =  223 
             , Y =  'Senegal'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  185 
             , X =  224 
             , Y =  'Serbia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  804 
             , X =  225 
             , Y =  'Serbia and Montenegro'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  186 
             , X =  226 
             , Y =  'Seychelles'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  187 
             , X =  227 
             , Y =  'Sierra Leone'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  188 
             , X =  228 
             , Y =  'Singapore'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  189 
             , X =  229 
             , Y =  'Slovakia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  190 
             , X =  230 
             , Y =  'Slovenia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  191 
             , X =  231 
             , Y =  'Solomon Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  192 
             , X =  232 
             , Y =  'Somalia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  193 
             , X =  234 
             , Y =  'South Africa'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2213 
             , X =  235 
             , Y =  'SOUTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2320 
             , X =  236 
             , Y =  'SOUTH-CENTRAL ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2330 
             , X =  237 
             , Y =  'SOUTH-EASTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2140 
             , X =  238 
             , Y =  'Southern Africa'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2430 
             , X =  239 
             , Y =  'SOUTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  237 
             , X =  240 
             , Y =  'South Sudan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  195 
             , X =  241 
             , Y =  'Spain'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  196 
             , X =  243 
             , Y =  'Sri Lanka'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  1005 
             , X =  244 
             , Y =  'SUB-SAHARAN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  197 
             , X =  245 
             , Y =  'Sudan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  198 
             , X =  246 
             , Y =  'Suriname'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  199 
             , X =  248 
             , Y =  'Swaziland'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  200 
             , X =  249 
             , Y =  'Sweden'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  201 
             , X =  250 
             , Y =  'Switzerland'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  202 
             , X =  251 
             , Y =  'Syria'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  203 
             , X =  252 
             , Y =  'Taiwan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  204 
             , X =  253 
             , Y =  'Tajikistan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  205 
             , X =  254 
             , Y =  'Tanzania'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  206 
             , X =  255 
             , Y =  'Thailand'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  632 
             , X =  256 
             , Y =  'Tibet'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  208 
             , X =  257 
             , Y =  'Togo'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  209 
             , X =  258 
             , Y =  'Tokelau'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  210 
             , X =  259 
             , Y =  'Tonga'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  211 
             , X =  260 
             , Y =  'Trinidad and Tobago'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  212 
             , X =  261 
             , Y =  'Tunisia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  213 
             , X =  262 
             , Y =  'Turkey'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  214 
             , X =  263 
             , Y =  'Turkmenistan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  215 
             , X =  264 
             , Y =  'Turks and Caicos Islands'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  216 
             , X =  265 
             , Y =  'Tuvalu'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  217 
             , X =  266 
             , Y =  'Uganda'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  218 
             , X =  267 
             , Y =  'Ukraine'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  219 
             , X =  268 
             , Y =  'United Arab Emirates'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  220 
             , X =  269 
             , Y =  'United Kingdom'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  221 
             , X =  270 
             , Y =  'United States'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  223 
             , X =  271 
             , Y =  'Uruguay'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  224 
             , X =  272 
             , Y =  'Uzbekistan'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  225 
             , X =  273 
             , Y =  'Vanuatu'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  226 
             , X =  274 
             , Y =  'Venezuela'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  227 
             , X =  275 
             , Y =  'Vietnam'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  222 
             , X =  276 
             , Y =  'Virgin Islands (U.S.)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  228 
             , X =  278 
             , Y =  'Wallis and Futuna'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2150 
             , X =  280 
             , Y =  'WESTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2340 
             , X =  281 
             , Y =  'WESTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  2440 
             , X =  282 
             , Y =  'WESTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  229 
             , X =  284 
             , Y =  'Western Sahara'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  230 
             , X =  285 
             , Y =  'Yemen'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  231 
             , X =  287 
             , Y =  'Zambia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  232 
             , X =  288 
             , Y =  'Zimbabwe'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  802 
             , X =  500 
             , Y =  'USSR'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  803 
             , X =  501 
             , Y =  'Yugoslavia'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  9998 
             , X =  597 
             , Y =  'Other/Unclear/Undetermined'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  705 
             , X =  598 
             , Y =  'Born Outside U.S. - Dont Know Where'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  706 
             , X =  599 
             , Y =  'Born Outside U.S. - Refused to Say Where'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  9997 
             , X =  888 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS07cUS_father_birthcountry'
             , V =  9999 
             , X =  999 
             , Y =  'Dont know/Refused to say where born'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  1 
             , X =  1 
             , Y =  'Afghanistan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2100 
             , X =  2 
             , Y =  'AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2 
             , X =  4 
             , Y =  'Albania'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  3 
             , X =  5 
             , Y =  'Algeria'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  4 
             , X =  6 
             , Y =  'American Samoa'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  5 
             , X =  7 
             , Y =  'Andorra'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  6 
             , X =  8 
             , Y =  'Angola'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  7 
             , X =  9 
             , Y =  'Anguilla'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  8002 
             , X =  10 
             , Y =  'Antarctica'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  8 
             , X =  11 
             , Y =  'Antigua and Barbuda'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  9 
             , X =  12 
             , Y =  'Argentina'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  10 
             , X =  13 
             , Y =  'Armenia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  11 
             , X =  14 
             , Y =  'Aruba'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2300 
             , X =  15 
             , Y =  'ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  12 
             , X =  16 
             , Y =  'Australia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  13 
             , X =  17 
             , Y =  'Austria'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  14 
             , X =  18 
             , Y =  'Azerbaijan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  15 
             , X =  19 
             , Y =  'Bahamas'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  16 
             , X =  20 
             , Y =  'Bahrain'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  17 
             , X =  21 
             , Y =  'Bangladesh'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  18 
             , X =  22 
             , Y =  'Barbados'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  19 
             , X =  23 
             , Y =  'Belarus'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  20 
             , X =  24 
             , Y =  'Belgium'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  21 
             , X =  25 
             , Y =  'Belize'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  22 
             , X =  26 
             , Y =  'Benin'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  23 
             , X =  27 
             , Y =  'Bermuda'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  24 
             , X =  28 
             , Y =  'Bhutan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  25 
             , X =  29 
             , Y =  'Bolivia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  26 
             , X =  30 
             , Y =  'Bosnia and Herzegovina'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  27 
             , X =  31 
             , Y =  'Botswana'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  28 
             , X =  33 
             , Y =  'Brazil'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  29 
             , X =  36 
             , Y =  'British Virgin Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  30 
             , X =  37 
             , Y =  'Brunei'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  31 
             , X =  38 
             , Y =  'Bulgaria'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  32 
             , X =  39 
             , Y =  'Burkina Faso'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  142 
             , X =  40 
             , Y =  'Burma (Myanmar)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  33 
             , X =  41 
             , Y =  'Burundi'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  34 
             , X =  42 
             , Y =  'Cambodia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  35 
             , X =  43 
             , Y =  'Cameroon'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  36 
             , X =  44 
             , Y =  'Canada'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  37 
             , X =  45 
             , Y =  'Cape Verde'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2211 
             , X =  46 
             , Y =  'Caribbean'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  38 
             , X =  47 
             , Y =  'Cayman Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  39 
             , X =  48 
             , Y =  'Central African Rep'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2212 
             , X =  49 
             , Y =  'CENTRAL AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  40 
             , X =  50 
             , Y =  'Chad'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  41 
             , X =  51 
             , Y =  'Channel Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  42 
             , X =  52 
             , Y =  'Chile'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  43 
             , X =  53 
             , Y =  'China'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  628 
             , X =  54 
             , Y =  'Christmas Island'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  629 
             , X =  55 
             , Y =  'Cocos (Keeling) Island'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  44 
             , X =  56 
             , Y =  'Colombia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  45 
             , X =  57 
             , Y =  'Comoros'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  47 
             , X =  58 
             , Y =  'Congo, Democratic Republic of the'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  46 
             , X =  59 
             , Y =  'Congo, Republic of the'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  48 
             , X =  60 
             , Y =  'Cook Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  49 
             , X =  61 
             , Y =  'Costa Rica'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  50 
             , X =  62 
             , Y =  'Cote dIvoire'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  51 
             , X =  63 
             , Y =  'Croatia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  52 
             , X =  64 
             , Y =  'Cuba'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  53 
             , X =  65 
             , Y =  'Cyprus'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  54 
             , X =  66 
             , Y =  'Czech Republic'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  55 
             , X =  67 
             , Y =  'Denmark'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  56 
             , X =  69 
             , Y =  'Djibouti'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  57 
             , X =  70 
             , Y =  'Dominica'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  58 
             , X =  71 
             , Y =  'Dominican Republic'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  207 
             , X =  72 
             , Y =  'Timor-Leste'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2110 
             , X =  73 
             , Y =  'EASTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2310 
             , X =  74 
             , Y =  'EASTERN ASIA  (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2410 
             , X =  75 
             , Y =  'EASTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  59 
             , X =  77 
             , Y =  'Ecuador'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  60 
             , X =  78 
             , Y =  'Egypt'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  61 
             , X =  79 
             , Y =  'El Salvador'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  62 
             , X =  81 
             , Y =  'Equatorial Guinea'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  63 
             , X =  82 
             , Y =  'Eritrea'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  64 
             , X =  83 
             , Y =  'Estonia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  65 
             , X =  84 
             , Y =  'Ethiopia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  1003 
             , X =  85 
             , Y =  'EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  66 
             , X =  86 
             , Y =  'Faeroe Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  67 
             , X =  87 
             , Y =  'Falkland Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  68 
             , X =  88 
             , Y =  'Fiji'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  69 
             , X =  89 
             , Y =  'Finland'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  70 
             , X =  90 
             , Y =  'France'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  71 
             , X =  91 
             , Y =  'French Guiana'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  72 
             , X =  92 
             , Y =  'French Polynesia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  73 
             , X =  93 
             , Y =  'Gabon'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  74 
             , X =  94 
             , Y =  'Gambia, The'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  75 
             , X =  96 
             , Y =  'Georgia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  76 
             , X =  97 
             , Y =  'Germany'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  77 
             , X =  98 
             , Y =  'Ghana'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  78 
             , X =  99 
             , Y =  'Gibraltar'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  79 
             , X =  100 
             , Y =  'Greece'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  80 
             , X =  101 
             , Y =  'Greenland'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  81 
             , X =  102 
             , Y =  'Grenada'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  179 
             , X =  103 
             , Y =  'Grenadines/St. Vincent and the Grenadines'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  82 
             , X =  104 
             , Y =  'Guadeloupe'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  83 
             , X =  105 
             , Y =  'Guam'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  84 
             , X =  106 
             , Y =  'Guatemala'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  85 
             , X =  108 
             , Y =  'Guinea'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  86 
             , X =  109 
             , Y =  'Guinea-Bissau'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  87 
             , X =  110 
             , Y =  'Guyana'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  88 
             , X =  111 
             , Y =  'Haiti'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  89 
             , X =  112 
             , Y =  'Holy See/Vatican City'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  90 
             , X =  113 
             , Y =  'Honduras'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  91 
             , X =  114 
             , Y =  'Hong Kong'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  92 
             , X =  115 
             , Y =  'Hungary'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  93 
             , X =  116 
             , Y =  'Iceland'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  94 
             , X =  117 
             , Y =  'India'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  95 
             , X =  118 
             , Y =  'Indonesia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  96 
             , X =  119 
             , Y =  'Iran'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  97 
             , X =  120 
             , Y =  'Iraq'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  98 
             , X =  121 
             , Y =  'Ireland'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  99 
             , X =  122 
             , Y =  'Isle of Man'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  100 
             , X =  123 
             , Y =  'Israel'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  101 
             , X =  125 
             , Y =  'Italy'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  102 
             , X =  126 
             , Y =  'Jamaica'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  103 
             , X =  127 
             , Y =  'Japan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  104 
             , X =  129 
             , Y =  'Jordan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  105 
             , X =  130 
             , Y =  'Kazakhstan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  106 
             , X =  131 
             , Y =  'Kenya'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  107 
             , X =  132 
             , Y =  'Kiribati'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  801 
             , X =  133 
             , Y =  'Korea'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  154 
             , X =  134 
             , Y =  'Korea, North'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  194 
             , X =  135 
             , Y =  'Korea, South'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  108 
             , X =  136 
             , Y =  'Kosovo'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  109 
             , X =  137 
             , Y =  'Kuwait'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  110 
             , X =  138 
             , Y =  'Kyrgyzstan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  111 
             , X =  139 
             , Y =  'Laos'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2210 
             , X =  140 
             , Y =  'LATIN AMERICA AND THE CARIBBEAN (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  112 
             , X =  141 
             , Y =  'Latvia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  113 
             , X =  142 
             , Y =  'Lebanon'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  114 
             , X =  143 
             , Y =  'Lesotho'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  115 
             , X =  144 
             , Y =  'Liberia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  116 
             , X =  145 
             , Y =  'Libya'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  117 
             , X =  146 
             , Y =  'Liechtenstein'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  118 
             , X =  147 
             , Y =  'Lithuania'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  119 
             , X =  148 
             , Y =  'Luxembourg'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  120 
             , X =  149 
             , Y =  'Macau'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  121 
             , X =  150 
             , Y =  'Macedonia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  122 
             , X =  151 
             , Y =  'Madagascar'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  123 
             , X =  152 
             , Y =  'Malawi'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  124 
             , X =  153 
             , Y =  'Malaysia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  125 
             , X =  154 
             , Y =  'Maldives'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  126 
             , X =  155 
             , Y =  'Mali'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  127 
             , X =  156 
             , Y =  'Malta'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  128 
             , X =  157 
             , Y =  'Marshall Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  129 
             , X =  158 
             , Y =  'Martinique'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  130 
             , X =  159 
             , Y =  'Mauritania'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  131 
             , X =  160 
             , Y =  'Mauritius'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  132 
             , X =  161 
             , Y =  'Mayotte'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  8001 
             , X =  162 
             , Y =  'MIDDLE EAST'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  133 
             , X =  163 
             , Y =  'Mexico'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  134 
             , X =  164 
             , Y =  'Micronesia, Federated States'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2120 
             , X =  165 
             , Y =  'MIDDLE AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  135 
             , X =  166 
             , Y =  'Moldova'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  136 
             , X =  167 
             , Y =  'Monaco'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  137 
             , X =  168 
             , Y =  'Mongolia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  138 
             , X =  169 
             , Y =  'Montenegro'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  139 
             , X =  170 
             , Y =  'Montserrat'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  140 
             , X =  171 
             , Y =  'Morocco'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  141 
             , X =  172 
             , Y =  'Mozambique'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  143 
             , X =  174 
             , Y =  'Namibia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  144 
             , X =  175 
             , Y =  'Nauru'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  145 
             , X =  176 
             , Y =  'Nepal'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  146 
             , X =  177 
             , Y =  'Netherlands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  805 
             , X =  178 
             , Y =  'Netherlands Antilles'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  148 
             , X =  179 
             , Y =  'New Caledonia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  149 
             , X =  180 
             , Y =  'New Zealand'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  150 
             , X =  181 
             , Y =  'Nicaragua'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  151 
             , X =  182 
             , Y =  'Niger'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  152 
             , X =  183 
             , Y =  'Nigeria'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  153 
             , X =  184 
             , Y =  'Niue'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  1001 
             , X =  186 
             , Y =  'NORTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2130 
             , X =  187 
             , Y =  'NORTHERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2420 
             , X =  190 
             , Y =  'NORTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  155 
             , X =  192 
             , Y =  'Northern Mariana Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  156 
             , X =  193 
             , Y =  'Norway'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2500 
             , X =  194 
             , Y =  'OCEANIA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  157 
             , X =  195 
             , Y =  'Oman'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  158 
             , X =  196 
             , Y =  'Pakistan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  159 
             , X =  197 
             , Y =  'Palau'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  160 
             , X =  198 
             , Y =  'Palestine/Palestinian Territories'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  161 
             , X =  199 
             , Y =  'Panama'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  162 
             , X =  200 
             , Y =  'Papua New Guinea'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  163 
             , X =  201 
             , Y =  'Paraguay'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  164 
             , X =  202 
             , Y =  'Peru'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  165 
             , X =  203 
             , Y =  'Philippines'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  631 
             , X =  204 
             , Y =  'Pitcairn Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  167 
             , X =  205 
             , Y =  'Poland'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  168 
             , X =  207 
             , Y =  'Portugal'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  169 
             , X =  208 
             , Y =  'Puerto Rico'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  170 
             , X =  209 
             , Y =  'Qatar'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  171 
             , X =  210 
             , Y =  'Reunion'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  172 
             , X =  211 
             , Y =  'Romania'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  173 
             , X =  212 
             , Y =  'Russia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  174 
             , X =  213 
             , Y =  'Rwanda'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  175 
             , X =  214 
             , Y =  'Saint Helena'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  176 
             , X =  215 
             , Y =  'Saint Kitts and Nevis'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  177 
             , X =  216 
             , Y =  'Saint Lucia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  178 
             , X =  217 
             , Y =  'Saint Pierre and Miquelon'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  180 
             , X =  218 
             , Y =  'Samoa'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  181 
             , X =  219 
             , Y =  'San Marino'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  182 
             , X =  220 
             , Y =  'Sao Tome and Principe'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  183 
             , X =  221 
             , Y =  'Saudi Arabia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  184 
             , X =  223 
             , Y =  'Senegal'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  185 
             , X =  224 
             , Y =  'Serbia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  804 
             , X =  225 
             , Y =  'Serbia and Montenegro'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  186 
             , X =  226 
             , Y =  'Seychelles'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  187 
             , X =  227 
             , Y =  'Sierra Leone'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  188 
             , X =  228 
             , Y =  'Singapore'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  189 
             , X =  229 
             , Y =  'Slovakia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  190 
             , X =  230 
             , Y =  'Slovenia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  191 
             , X =  231 
             , Y =  'Solomon Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  192 
             , X =  232 
             , Y =  'Somalia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  193 
             , X =  234 
             , Y =  'South Africa'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2213 
             , X =  235 
             , Y =  'SOUTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2320 
             , X =  236 
             , Y =  'SOUTH-CENTRAL ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2330 
             , X =  237 
             , Y =  'SOUTH-EASTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2140 
             , X =  238 
             , Y =  'Southern Africa'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2430 
             , X =  239 
             , Y =  'SOUTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  237 
             , X =  240 
             , Y =  'South Sudan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  195 
             , X =  241 
             , Y =  'Spain'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  196 
             , X =  243 
             , Y =  'Sri Lanka'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  1005 
             , X =  244 
             , Y =  'SUB-SAHARAN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  197 
             , X =  245 
             , Y =  'Sudan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  198 
             , X =  246 
             , Y =  'Suriname'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  199 
             , X =  248 
             , Y =  'Swaziland'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  200 
             , X =  249 
             , Y =  'Sweden'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  201 
             , X =  250 
             , Y =  'Switzerland'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  202 
             , X =  251 
             , Y =  'Syria'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  203 
             , X =  252 
             , Y =  'Taiwan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  204 
             , X =  253 
             , Y =  'Tajikistan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  205 
             , X =  254 
             , Y =  'Tanzania'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  206 
             , X =  255 
             , Y =  'Thailand'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  632 
             , X =  256 
             , Y =  'Tibet'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  208 
             , X =  257 
             , Y =  'Togo'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  209 
             , X =  258 
             , Y =  'Tokelau'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  210 
             , X =  259 
             , Y =  'Tonga'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  211 
             , X =  260 
             , Y =  'Trinidad and Tobago'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  212 
             , X =  261 
             , Y =  'Tunisia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  213 
             , X =  262 
             , Y =  'Turkey'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  214 
             , X =  263 
             , Y =  'Turkmenistan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  215 
             , X =  264 
             , Y =  'Turks and Caicos Islands'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  216 
             , X =  265 
             , Y =  'Tuvalu'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  217 
             , X =  266 
             , Y =  'Uganda'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  218 
             , X =  267 
             , Y =  'Ukraine'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  219 
             , X =  268 
             , Y =  'United Arab Emirates'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  220 
             , X =  269 
             , Y =  'United Kingdom'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  221 
             , X =  270 
             , Y =  'United States'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  223 
             , X =  271 
             , Y =  'Uruguay'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  224 
             , X =  272 
             , Y =  'Uzbekistan'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  225 
             , X =  273 
             , Y =  'Vanuatu'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  226 
             , X =  274 
             , Y =  'Venezuela'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  227 
             , X =  275 
             , Y =  'Vietnam'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  222 
             , X =  276 
             , Y =  'Virgin Islands (U.S.)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  228 
             , X =  278 
             , Y =  'Wallis and Futuna'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2150 
             , X =  280 
             , Y =  'WESTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2340 
             , X =  281 
             , Y =  'WESTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  2440 
             , X =  282 
             , Y =  'WESTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  229 
             , X =  284 
             , Y =  'Western Sahara'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  230 
             , X =  285 
             , Y =  'Yemen'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  231 
             , X =  287 
             , Y =  'Zambia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  232 
             , X =  288 
             , Y =  'Zimbabwe'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  802 
             , X =  500 
             , Y =  'USSR'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  803 
             , X =  501 
             , Y =  'Yugoslavia'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  9998 
             , X =  597 
             , Y =  'Other/Unclear/Undetermined'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  705 
             , X =  598 
             , Y =  'Born Outside U.S. - Dont Know Where'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  706 
             , X =  599 
             , Y =  'Born Outside U.S. - Refused to Say Where'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  9997 
             , X =  888 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS14all_father_birthcountry'
             , V =  9999 
             , X =  999 
             , Y =  'Dont know/Refused to say where born'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  1 
             , X =  1 
             , Y =  'Afghanistan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2100 
             , X =  2 
             , Y =  'AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2 
             , X =  4 
             , Y =  'Albania'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  3 
             , X =  5 
             , Y =  'Algeria'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  4 
             , X =  6 
             , Y =  'American Samoa'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  5 
             , X =  7 
             , Y =  'Andorra'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  6 
             , X =  8 
             , Y =  'Angola'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  7 
             , X =  9 
             , Y =  'Anguilla'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  8002 
             , X =  10 
             , Y =  'Antarctica'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  8 
             , X =  11 
             , Y =  'Antigua and Barbuda'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  9 
             , X =  12 
             , Y =  'Argentina'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  10 
             , X =  13 
             , Y =  'Armenia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  11 
             , X =  14 
             , Y =  'Aruba'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2300 
             , X =  15 
             , Y =  'ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  12 
             , X =  16 
             , Y =  'Australia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  13 
             , X =  17 
             , Y =  'Austria'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  14 
             , X =  18 
             , Y =  'Azerbaijan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  15 
             , X =  19 
             , Y =  'Bahamas'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  16 
             , X =  20 
             , Y =  'Bahrain'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  17 
             , X =  21 
             , Y =  'Bangladesh'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  18 
             , X =  22 
             , Y =  'Barbados'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  19 
             , X =  23 
             , Y =  'Belarus'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  20 
             , X =  24 
             , Y =  'Belgium'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  21 
             , X =  25 
             , Y =  'Belize'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  22 
             , X =  26 
             , Y =  'Benin'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  23 
             , X =  27 
             , Y =  'Bermuda'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  24 
             , X =  28 
             , Y =  'Bhutan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  25 
             , X =  29 
             , Y =  'Bolivia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  26 
             , X =  30 
             , Y =  'Bosnia and Herzegovina'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  27 
             , X =  31 
             , Y =  'Botswana'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  28 
             , X =  33 
             , Y =  'Brazil'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  29 
             , X =  36 
             , Y =  'British Virgin Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  30 
             , X =  37 
             , Y =  'Brunei'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  31 
             , X =  38 
             , Y =  'Bulgaria'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  32 
             , X =  39 
             , Y =  'Burkina Faso'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  142 
             , X =  40 
             , Y =  'Burma (Myanmar)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  33 
             , X =  41 
             , Y =  'Burundi'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  34 
             , X =  42 
             , Y =  'Cambodia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  35 
             , X =  43 
             , Y =  'Cameroon'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  36 
             , X =  44 
             , Y =  'Canada'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  37 
             , X =  45 
             , Y =  'Cape Verde'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2211 
             , X =  46 
             , Y =  'Caribbean'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  38 
             , X =  47 
             , Y =  'Cayman Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  39 
             , X =  48 
             , Y =  'Central African Rep'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2212 
             , X =  49 
             , Y =  'CENTRAL AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  40 
             , X =  50 
             , Y =  'Chad'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  41 
             , X =  51 
             , Y =  'Channel Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  42 
             , X =  52 
             , Y =  'Chile'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  43 
             , X =  53 
             , Y =  'China'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  628 
             , X =  54 
             , Y =  'Christmas Island'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  629 
             , X =  55 
             , Y =  'Cocos (Keeling) Island'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  44 
             , X =  56 
             , Y =  'Colombia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  45 
             , X =  57 
             , Y =  'Comoros'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  47 
             , X =  58 
             , Y =  'Congo, Democratic Republic of the'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  46 
             , X =  59 
             , Y =  'Congo, Republic of the'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  48 
             , X =  60 
             , Y =  'Cook Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  49 
             , X =  61 
             , Y =  'Costa Rica'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  50 
             , X =  62 
             , Y =  'Cote dIvoire'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  51 
             , X =  63 
             , Y =  'Croatia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  52 
             , X =  64 
             , Y =  'Cuba'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  53 
             , X =  65 
             , Y =  'Cyprus'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  54 
             , X =  66 
             , Y =  'Czech Republic'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  55 
             , X =  67 
             , Y =  'Denmark'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  56 
             , X =  69 
             , Y =  'Djibouti'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  57 
             , X =  70 
             , Y =  'Dominica'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  58 
             , X =  71 
             , Y =  'Dominican Republic'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  207 
             , X =  72 
             , Y =  'Timor-Leste'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2110 
             , X =  73 
             , Y =  'EASTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2310 
             , X =  74 
             , Y =  'EASTERN ASIA  (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2410 
             , X =  75 
             , Y =  'EASTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  59 
             , X =  77 
             , Y =  'Ecuador'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  60 
             , X =  78 
             , Y =  'Egypt'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  61 
             , X =  79 
             , Y =  'El Salvador'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  62 
             , X =  81 
             , Y =  'Equatorial Guinea'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  63 
             , X =  82 
             , Y =  'Eritrea'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  64 
             , X =  83 
             , Y =  'Estonia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  65 
             , X =  84 
             , Y =  'Ethiopia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  1003 
             , X =  85 
             , Y =  'EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  66 
             , X =  86 
             , Y =  'Faeroe Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  67 
             , X =  87 
             , Y =  'Falkland Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  68 
             , X =  88 
             , Y =  'Fiji'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  69 
             , X =  89 
             , Y =  'Finland'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  70 
             , X =  90 
             , Y =  'France'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  71 
             , X =  91 
             , Y =  'French Guiana'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  72 
             , X =  92 
             , Y =  'French Polynesia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  73 
             , X =  93 
             , Y =  'Gabon'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  74 
             , X =  94 
             , Y =  'Gambia, The'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  75 
             , X =  96 
             , Y =  'Georgia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  76 
             , X =  97 
             , Y =  'Germany'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  77 
             , X =  98 
             , Y =  'Ghana'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  78 
             , X =  99 
             , Y =  'Gibraltar'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  79 
             , X =  100 
             , Y =  'Greece'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  80 
             , X =  101 
             , Y =  'Greenland'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  81 
             , X =  102 
             , Y =  'Grenada'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  179 
             , X =  103 
             , Y =  'Grenadines/St. Vincent and the Grenadines'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  82 
             , X =  104 
             , Y =  'Guadeloupe'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  83 
             , X =  105 
             , Y =  'Guam'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  84 
             , X =  106 
             , Y =  'Guatemala'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  85 
             , X =  108 
             , Y =  'Guinea'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  86 
             , X =  109 
             , Y =  'Guinea-Bissau'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  87 
             , X =  110 
             , Y =  'Guyana'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  88 
             , X =  111 
             , Y =  'Haiti'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  89 
             , X =  112 
             , Y =  'Holy See/Vatican City'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  90 
             , X =  113 
             , Y =  'Honduras'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  91 
             , X =  114 
             , Y =  'Hong Kong'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  92 
             , X =  115 
             , Y =  'Hungary'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  93 
             , X =  116 
             , Y =  'Iceland'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  94 
             , X =  117 
             , Y =  'India'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  95 
             , X =  118 
             , Y =  'Indonesia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  96 
             , X =  119 
             , Y =  'Iran'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  97 
             , X =  120 
             , Y =  'Iraq'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  98 
             , X =  121 
             , Y =  'Ireland'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  99 
             , X =  122 
             , Y =  'Isle of Man'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  100 
             , X =  123 
             , Y =  'Israel'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  101 
             , X =  125 
             , Y =  'Italy'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  102 
             , X =  126 
             , Y =  'Jamaica'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  103 
             , X =  127 
             , Y =  'Japan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  104 
             , X =  129 
             , Y =  'Jordan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  105 
             , X =  130 
             , Y =  'Kazakhstan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  106 
             , X =  131 
             , Y =  'Kenya'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  107 
             , X =  132 
             , Y =  'Kiribati'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  801 
             , X =  133 
             , Y =  'Korea'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  154 
             , X =  134 
             , Y =  'Korea, North'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  194 
             , X =  135 
             , Y =  'Korea, South'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  108 
             , X =  136 
             , Y =  'Kosovo'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  109 
             , X =  137 
             , Y =  'Kuwait'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  110 
             , X =  138 
             , Y =  'Kyrgyzstan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  111 
             , X =  139 
             , Y =  'Laos'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2210 
             , X =  140 
             , Y =  'LATIN AMERICA AND THE CARIBBEAN (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  112 
             , X =  141 
             , Y =  'Latvia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  113 
             , X =  142 
             , Y =  'Lebanon'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  114 
             , X =  143 
             , Y =  'Lesotho'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  115 
             , X =  144 
             , Y =  'Liberia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  116 
             , X =  145 
             , Y =  'Libya'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  117 
             , X =  146 
             , Y =  'Liechtenstein'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  118 
             , X =  147 
             , Y =  'Lithuania'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  119 
             , X =  148 
             , Y =  'Luxembourg'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  120 
             , X =  149 
             , Y =  'Macau'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  121 
             , X =  150 
             , Y =  'Macedonia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  122 
             , X =  151 
             , Y =  'Madagascar'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  123 
             , X =  152 
             , Y =  'Malawi'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  124 
             , X =  153 
             , Y =  'Malaysia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  125 
             , X =  154 
             , Y =  'Maldives'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  126 
             , X =  155 
             , Y =  'Mali'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  127 
             , X =  156 
             , Y =  'Malta'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  128 
             , X =  157 
             , Y =  'Marshall Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  129 
             , X =  158 
             , Y =  'Martinique'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  130 
             , X =  159 
             , Y =  'Mauritania'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  131 
             , X =  160 
             , Y =  'Mauritius'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  132 
             , X =  161 
             , Y =  'Mayotte'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  8001 
             , X =  162 
             , Y =  'MIDDLE EAST'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  133 
             , X =  163 
             , Y =  'Mexico'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  134 
             , X =  164 
             , Y =  'Micronesia, Federated States'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2120 
             , X =  165 
             , Y =  'MIDDLE AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  135 
             , X =  166 
             , Y =  'Moldova'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  136 
             , X =  167 
             , Y =  'Monaco'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  137 
             , X =  168 
             , Y =  'Mongolia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  138 
             , X =  169 
             , Y =  'Montenegro'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  139 
             , X =  170 
             , Y =  'Montserrat'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  140 
             , X =  171 
             , Y =  'Morocco'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  141 
             , X =  172 
             , Y =  'Mozambique'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  143 
             , X =  174 
             , Y =  'Namibia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  144 
             , X =  175 
             , Y =  'Nauru'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  145 
             , X =  176 
             , Y =  'Nepal'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  146 
             , X =  177 
             , Y =  'Netherlands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  805 
             , X =  178 
             , Y =  'Netherlands Antilles'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  148 
             , X =  179 
             , Y =  'New Caledonia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  149 
             , X =  180 
             , Y =  'New Zealand'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  150 
             , X =  181 
             , Y =  'Nicaragua'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  151 
             , X =  182 
             , Y =  'Niger'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  152 
             , X =  183 
             , Y =  'Nigeria'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  153 
             , X =  184 
             , Y =  'Niue'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  1001 
             , X =  186 
             , Y =  'NORTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2130 
             , X =  187 
             , Y =  'NORTHERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2420 
             , X =  190 
             , Y =  'NORTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  155 
             , X =  192 
             , Y =  'Northern Mariana Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  156 
             , X =  193 
             , Y =  'Norway'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2500 
             , X =  194 
             , Y =  'OCEANIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  157 
             , X =  195 
             , Y =  'Oman'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  158 
             , X =  196 
             , Y =  'Pakistan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  159 
             , X =  197 
             , Y =  'Palau'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  160 
             , X =  198 
             , Y =  'Palestine/Palestinian Territories'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  161 
             , X =  199 
             , Y =  'Panama'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  162 
             , X =  200 
             , Y =  'Papua New Guinea'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  163 
             , X =  201 
             , Y =  'Paraguay'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  164 
             , X =  202 
             , Y =  'Peru'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  165 
             , X =  203 
             , Y =  'Philippines'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  631 
             , X =  204 
             , Y =  'Pitcairn Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  167 
             , X =  205 
             , Y =  'Poland'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  168 
             , X =  207 
             , Y =  'Portugal'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  169 
             , X =  208 
             , Y =  'Puerto Rico'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  170 
             , X =  209 
             , Y =  'Qatar'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  171 
             , X =  210 
             , Y =  'Reunion'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  172 
             , X =  211 
             , Y =  'Romania'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  173 
             , X =  212 
             , Y =  'Russia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  174 
             , X =  213 
             , Y =  'Rwanda'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  175 
             , X =  214 
             , Y =  'Saint Helena'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  176 
             , X =  215 
             , Y =  'Saint Kitts and Nevis'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  177 
             , X =  216 
             , Y =  'Saint Lucia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  178 
             , X =  217 
             , Y =  'Saint Pierre and Miquelon'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  180 
             , X =  218 
             , Y =  'Samoa'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  181 
             , X =  219 
             , Y =  'San Marino'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  182 
             , X =  220 
             , Y =  'Sao Tome and Principe'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  183 
             , X =  221 
             , Y =  'Saudi Arabia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  184 
             , X =  223 
             , Y =  'Senegal'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  185 
             , X =  224 
             , Y =  'Serbia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  804 
             , X =  225 
             , Y =  'Serbia and Montenegro'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  186 
             , X =  226 
             , Y =  'Seychelles'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  187 
             , X =  227 
             , Y =  'Sierra Leone'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  188 
             , X =  228 
             , Y =  'Singapore'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  189 
             , X =  229 
             , Y =  'Slovakia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  190 
             , X =  230 
             , Y =  'Slovenia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  191 
             , X =  231 
             , Y =  'Solomon Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  192 
             , X =  232 
             , Y =  'Somalia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  193 
             , X =  234 
             , Y =  'South Africa'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2213 
             , X =  235 
             , Y =  'SOUTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2320 
             , X =  236 
             , Y =  'SOUTH-CENTRAL ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2330 
             , X =  237 
             , Y =  'SOUTH-EASTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2140 
             , X =  238 
             , Y =  'Southern Africa'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2430 
             , X =  239 
             , Y =  'SOUTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  237 
             , X =  240 
             , Y =  'South Sudan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  195 
             , X =  241 
             , Y =  'Spain'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  196 
             , X =  243 
             , Y =  'Sri Lanka'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  1005 
             , X =  244 
             , Y =  'SUB-SAHARAN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  197 
             , X =  245 
             , Y =  'Sudan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  198 
             , X =  246 
             , Y =  'Suriname'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  199 
             , X =  248 
             , Y =  'Swaziland'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  200 
             , X =  249 
             , Y =  'Sweden'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  201 
             , X =  250 
             , Y =  'Switzerland'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  202 
             , X =  251 
             , Y =  'Syria'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  203 
             , X =  252 
             , Y =  'Taiwan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  204 
             , X =  253 
             , Y =  'Tajikistan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  205 
             , X =  254 
             , Y =  'Tanzania'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  206 
             , X =  255 
             , Y =  'Thailand'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  632 
             , X =  256 
             , Y =  'Tibet'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  208 
             , X =  257 
             , Y =  'Togo'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  209 
             , X =  258 
             , Y =  'Tokelau'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  210 
             , X =  259 
             , Y =  'Tonga'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  211 
             , X =  260 
             , Y =  'Trinidad and Tobago'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  212 
             , X =  261 
             , Y =  'Tunisia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  213 
             , X =  262 
             , Y =  'Turkey'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  214 
             , X =  263 
             , Y =  'Turkmenistan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  215 
             , X =  264 
             , Y =  'Turks and Caicos Islands'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  216 
             , X =  265 
             , Y =  'Tuvalu'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  217 
             , X =  266 
             , Y =  'Uganda'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  218 
             , X =  267 
             , Y =  'Ukraine'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  219 
             , X =  268 
             , Y =  'United Arab Emirates'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  220 
             , X =  269 
             , Y =  'United Kingdom'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  221 
             , X =  270 
             , Y =  'United States'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  223 
             , X =  271 
             , Y =  'Uruguay'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  224 
             , X =  272 
             , Y =  'Uzbekistan'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  225 
             , X =  273 
             , Y =  'Vanuatu'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  226 
             , X =  274 
             , Y =  'Venezuela'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  227 
             , X =  275 
             , Y =  'Vietnam'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  222 
             , X =  276 
             , Y =  'Virgin Islands (U.S.)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  228 
             , X =  278 
             , Y =  'Wallis and Futuna'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2150 
             , X =  280 
             , Y =  'WESTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2340 
             , X =  281 
             , Y =  'WESTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  2440 
             , X =  282 
             , Y =  'WESTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  229 
             , X =  284 
             , Y =  'Western Sahara'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  230 
             , X =  285 
             , Y =  'Yemen'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  231 
             , X =  287 
             , Y =  'Zambia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  232 
             , X =  288 
             , Y =  'Zimbabwe'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  802 
             , X =  500 
             , Y =  'USSR'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  803 
             , X =  501 
             , Y =  'Yugoslavia'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  9998 
             , X =  597 
             , Y =  'Other/Unclear/Undetermined'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  705 
             , X =  598 
             , Y =  'Born Outside U.S. - Dont Know Where'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  706 
             , X =  599 
             , Y =  'Born Outside U.S. - Refused to Say Where'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  9997 
             , X =  888 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS07cUS_mother_birthcountry'
             , V =  9999 
             , X =  999 
             , Y =  'Dont know/Refused to say where born'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  1 
             , X =  1 
             , Y =  'Afghanistan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2100 
             , X =  2 
             , Y =  'AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2 
             , X =  4 
             , Y =  'Albania'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  3 
             , X =  5 
             , Y =  'Algeria'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  4 
             , X =  6 
             , Y =  'American Samoa'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  5 
             , X =  7 
             , Y =  'Andorra'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  6 
             , X =  8 
             , Y =  'Angola'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  7 
             , X =  9 
             , Y =  'Anguilla'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  8002 
             , X =  10 
             , Y =  'Antarctica'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  8 
             , X =  11 
             , Y =  'Antigua and Barbuda'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  9 
             , X =  12 
             , Y =  'Argentina'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  10 
             , X =  13 
             , Y =  'Armenia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  11 
             , X =  14 
             , Y =  'Aruba'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2300 
             , X =  15 
             , Y =  'ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  12 
             , X =  16 
             , Y =  'Australia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  13 
             , X =  17 
             , Y =  'Austria'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  14 
             , X =  18 
             , Y =  'Azerbaijan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  15 
             , X =  19 
             , Y =  'Bahamas'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  16 
             , X =  20 
             , Y =  'Bahrain'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  17 
             , X =  21 
             , Y =  'Bangladesh'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  18 
             , X =  22 
             , Y =  'Barbados'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  19 
             , X =  23 
             , Y =  'Belarus'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  20 
             , X =  24 
             , Y =  'Belgium'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  21 
             , X =  25 
             , Y =  'Belize'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  22 
             , X =  26 
             , Y =  'Benin'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  23 
             , X =  27 
             , Y =  'Bermuda'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  24 
             , X =  28 
             , Y =  'Bhutan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  25 
             , X =  29 
             , Y =  'Bolivia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  26 
             , X =  30 
             , Y =  'Bosnia and Herzegovina'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  27 
             , X =  31 
             , Y =  'Botswana'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  28 
             , X =  33 
             , Y =  'Brazil'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  29 
             , X =  36 
             , Y =  'British Virgin Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  30 
             , X =  37 
             , Y =  'Brunei'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  31 
             , X =  38 
             , Y =  'Bulgaria'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  32 
             , X =  39 
             , Y =  'Burkina Faso'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  142 
             , X =  40 
             , Y =  'Burma (Myanmar)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  33 
             , X =  41 
             , Y =  'Burundi'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  34 
             , X =  42 
             , Y =  'Cambodia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  35 
             , X =  43 
             , Y =  'Cameroon'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  36 
             , X =  44 
             , Y =  'Canada'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  37 
             , X =  45 
             , Y =  'Cape Verde'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2211 
             , X =  46 
             , Y =  'Caribbean'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  38 
             , X =  47 
             , Y =  'Cayman Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  39 
             , X =  48 
             , Y =  'Central African Rep'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2212 
             , X =  49 
             , Y =  'CENTRAL AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  40 
             , X =  50 
             , Y =  'Chad'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  41 
             , X =  51 
             , Y =  'Channel Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  42 
             , X =  52 
             , Y =  'Chile'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  43 
             , X =  53 
             , Y =  'China'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  628 
             , X =  54 
             , Y =  'Christmas Island'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  629 
             , X =  55 
             , Y =  'Cocos (Keeling) Island'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  44 
             , X =  56 
             , Y =  'Colombia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  45 
             , X =  57 
             , Y =  'Comoros'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  47 
             , X =  58 
             , Y =  'Congo, Democratic Republic of the'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  46 
             , X =  59 
             , Y =  'Congo, Republic of the'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  48 
             , X =  60 
             , Y =  'Cook Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  49 
             , X =  61 
             , Y =  'Costa Rica'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  50 
             , X =  62 
             , Y =  'Cote dIvoire'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  51 
             , X =  63 
             , Y =  'Croatia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  52 
             , X =  64 
             , Y =  'Cuba'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  53 
             , X =  65 
             , Y =  'Cyprus'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  54 
             , X =  66 
             , Y =  'Czech Republic'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  55 
             , X =  67 
             , Y =  'Denmark'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  56 
             , X =  69 
             , Y =  'Djibouti'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  57 
             , X =  70 
             , Y =  'Dominica'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  58 
             , X =  71 
             , Y =  'Dominican Republic'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  207 
             , X =  72 
             , Y =  'Timor-Leste'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2110 
             , X =  73 
             , Y =  'EASTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2310 
             , X =  74 
             , Y =  'EASTERN ASIA  (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2410 
             , X =  75 
             , Y =  'EASTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  59 
             , X =  77 
             , Y =  'Ecuador'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  60 
             , X =  78 
             , Y =  'Egypt'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  61 
             , X =  79 
             , Y =  'El Salvador'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  62 
             , X =  81 
             , Y =  'Equatorial Guinea'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  63 
             , X =  82 
             , Y =  'Eritrea'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  64 
             , X =  83 
             , Y =  'Estonia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  65 
             , X =  84 
             , Y =  'Ethiopia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  1003 
             , X =  85 
             , Y =  'EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  66 
             , X =  86 
             , Y =  'Faeroe Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  67 
             , X =  87 
             , Y =  'Falkland Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  68 
             , X =  88 
             , Y =  'Fiji'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  69 
             , X =  89 
             , Y =  'Finland'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  70 
             , X =  90 
             , Y =  'France'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  71 
             , X =  91 
             , Y =  'French Guiana'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  72 
             , X =  92 
             , Y =  'French Polynesia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  73 
             , X =  93 
             , Y =  'Gabon'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  74 
             , X =  94 
             , Y =  'Gambia, The'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  75 
             , X =  96 
             , Y =  'Georgia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  76 
             , X =  97 
             , Y =  'Germany'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  77 
             , X =  98 
             , Y =  'Ghana'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  78 
             , X =  99 
             , Y =  'Gibraltar'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  79 
             , X =  100 
             , Y =  'Greece'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  80 
             , X =  101 
             , Y =  'Greenland'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  81 
             , X =  102 
             , Y =  'Grenada'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  179 
             , X =  103 
             , Y =  'Grenadines/St. Vincent and the Grenadines'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  82 
             , X =  104 
             , Y =  'Guadeloupe'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  83 
             , X =  105 
             , Y =  'Guam'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  84 
             , X =  106 
             , Y =  'Guatemala'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  85 
             , X =  108 
             , Y =  'Guinea'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  86 
             , X =  109 
             , Y =  'Guinea-Bissau'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  87 
             , X =  110 
             , Y =  'Guyana'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  88 
             , X =  111 
             , Y =  'Haiti'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  89 
             , X =  112 
             , Y =  'Holy See/Vatican City'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  90 
             , X =  113 
             , Y =  'Honduras'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  91 
             , X =  114 
             , Y =  'Hong Kong'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  92 
             , X =  115 
             , Y =  'Hungary'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  93 
             , X =  116 
             , Y =  'Iceland'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  94 
             , X =  117 
             , Y =  'India'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  95 
             , X =  118 
             , Y =  'Indonesia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  96 
             , X =  119 
             , Y =  'Iran'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  97 
             , X =  120 
             , Y =  'Iraq'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  98 
             , X =  121 
             , Y =  'Ireland'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  99 
             , X =  122 
             , Y =  'Isle of Man'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  100 
             , X =  123 
             , Y =  'Israel'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  101 
             , X =  125 
             , Y =  'Italy'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  102 
             , X =  126 
             , Y =  'Jamaica'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  103 
             , X =  127 
             , Y =  'Japan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  104 
             , X =  129 
             , Y =  'Jordan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  105 
             , X =  130 
             , Y =  'Kazakhstan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  106 
             , X =  131 
             , Y =  'Kenya'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  107 
             , X =  132 
             , Y =  'Kiribati'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  801 
             , X =  133 
             , Y =  'Korea'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  154 
             , X =  134 
             , Y =  'Korea, North'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  194 
             , X =  135 
             , Y =  'Korea, South'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  108 
             , X =  136 
             , Y =  'Kosovo'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  109 
             , X =  137 
             , Y =  'Kuwait'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  110 
             , X =  138 
             , Y =  'Kyrgyzstan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  111 
             , X =  139 
             , Y =  'Laos'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2210 
             , X =  140 
             , Y =  'LATIN AMERICA AND THE CARIBBEAN (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  112 
             , X =  141 
             , Y =  'Latvia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  113 
             , X =  142 
             , Y =  'Lebanon'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  114 
             , X =  143 
             , Y =  'Lesotho'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  115 
             , X =  144 
             , Y =  'Liberia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  116 
             , X =  145 
             , Y =  'Libya'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  117 
             , X =  146 
             , Y =  'Liechtenstein'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  118 
             , X =  147 
             , Y =  'Lithuania'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  119 
             , X =  148 
             , Y =  'Luxembourg'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  120 
             , X =  149 
             , Y =  'Macau'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  121 
             , X =  150 
             , Y =  'Macedonia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  122 
             , X =  151 
             , Y =  'Madagascar'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  123 
             , X =  152 
             , Y =  'Malawi'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  124 
             , X =  153 
             , Y =  'Malaysia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  125 
             , X =  154 
             , Y =  'Maldives'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  126 
             , X =  155 
             , Y =  'Mali'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  127 
             , X =  156 
             , Y =  'Malta'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  128 
             , X =  157 
             , Y =  'Marshall Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  129 
             , X =  158 
             , Y =  'Martinique'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  130 
             , X =  159 
             , Y =  'Mauritania'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  131 
             , X =  160 
             , Y =  'Mauritius'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  132 
             , X =  161 
             , Y =  'Mayotte'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  8001 
             , X =  162 
             , Y =  'MIDDLE EAST'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  133 
             , X =  163 
             , Y =  'Mexico'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  134 
             , X =  164 
             , Y =  'Micronesia, Federated States'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2120 
             , X =  165 
             , Y =  'MIDDLE AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  135 
             , X =  166 
             , Y =  'Moldova'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  136 
             , X =  167 
             , Y =  'Monaco'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  137 
             , X =  168 
             , Y =  'Mongolia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  138 
             , X =  169 
             , Y =  'Montenegro'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  139 
             , X =  170 
             , Y =  'Montserrat'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  140 
             , X =  171 
             , Y =  'Morocco'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  141 
             , X =  172 
             , Y =  'Mozambique'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  143 
             , X =  174 
             , Y =  'Namibia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  144 
             , X =  175 
             , Y =  'Nauru'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  145 
             , X =  176 
             , Y =  'Nepal'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  146 
             , X =  177 
             , Y =  'Netherlands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  805 
             , X =  178 
             , Y =  'Netherlands Antilles'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  148 
             , X =  179 
             , Y =  'New Caledonia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  149 
             , X =  180 
             , Y =  'New Zealand'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  150 
             , X =  181 
             , Y =  'Nicaragua'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  151 
             , X =  182 
             , Y =  'Niger'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  152 
             , X =  183 
             , Y =  'Nigeria'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  153 
             , X =  184 
             , Y =  'Niue'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  1001 
             , X =  186 
             , Y =  'NORTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2130 
             , X =  187 
             , Y =  'NORTHERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2420 
             , X =  190 
             , Y =  'NORTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  155 
             , X =  192 
             , Y =  'Northern Mariana Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  156 
             , X =  193 
             , Y =  'Norway'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2500 
             , X =  194 
             , Y =  'OCEANIA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  157 
             , X =  195 
             , Y =  'Oman'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  158 
             , X =  196 
             , Y =  'Pakistan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  159 
             , X =  197 
             , Y =  'Palau'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  160 
             , X =  198 
             , Y =  'Palestine/Palestinian Territories'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  161 
             , X =  199 
             , Y =  'Panama'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  162 
             , X =  200 
             , Y =  'Papua New Guinea'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  163 
             , X =  201 
             , Y =  'Paraguay'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  164 
             , X =  202 
             , Y =  'Peru'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  165 
             , X =  203 
             , Y =  'Philippines'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  631 
             , X =  204 
             , Y =  'Pitcairn Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  167 
             , X =  205 
             , Y =  'Poland'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  168 
             , X =  207 
             , Y =  'Portugal'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  169 
             , X =  208 
             , Y =  'Puerto Rico'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  170 
             , X =  209 
             , Y =  'Qatar'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  171 
             , X =  210 
             , Y =  'Reunion'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  172 
             , X =  211 
             , Y =  'Romania'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  173 
             , X =  212 
             , Y =  'Russia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  174 
             , X =  213 
             , Y =  'Rwanda'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  175 
             , X =  214 
             , Y =  'Saint Helena'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  176 
             , X =  215 
             , Y =  'Saint Kitts and Nevis'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  177 
             , X =  216 
             , Y =  'Saint Lucia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  178 
             , X =  217 
             , Y =  'Saint Pierre and Miquelon'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  180 
             , X =  218 
             , Y =  'Samoa'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  181 
             , X =  219 
             , Y =  'San Marino'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  182 
             , X =  220 
             , Y =  'Sao Tome and Principe'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  183 
             , X =  221 
             , Y =  'Saudi Arabia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  184 
             , X =  223 
             , Y =  'Senegal'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  185 
             , X =  224 
             , Y =  'Serbia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  804 
             , X =  225 
             , Y =  'Serbia and Montenegro'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  186 
             , X =  226 
             , Y =  'Seychelles'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  187 
             , X =  227 
             , Y =  'Sierra Leone'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  188 
             , X =  228 
             , Y =  'Singapore'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  189 
             , X =  229 
             , Y =  'Slovakia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  190 
             , X =  230 
             , Y =  'Slovenia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  191 
             , X =  231 
             , Y =  'Solomon Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  192 
             , X =  232 
             , Y =  'Somalia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  193 
             , X =  234 
             , Y =  'South Africa'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2213 
             , X =  235 
             , Y =  'SOUTH AMERICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2320 
             , X =  236 
             , Y =  'SOUTH-CENTRAL ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2330 
             , X =  237 
             , Y =  'SOUTH-EASTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2140 
             , X =  238 
             , Y =  'Southern Africa'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2430 
             , X =  239 
             , Y =  'SOUTHERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  237 
             , X =  240 
             , Y =  'South Sudan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  195 
             , X =  241 
             , Y =  'Spain'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  196 
             , X =  243 
             , Y =  'Sri Lanka'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  1005 
             , X =  244 
             , Y =  'SUB-SAHARAN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  197 
             , X =  245 
             , Y =  'Sudan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  198 
             , X =  246 
             , Y =  'Suriname'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  199 
             , X =  248 
             , Y =  'Swaziland'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  200 
             , X =  249 
             , Y =  'Sweden'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  201 
             , X =  250 
             , Y =  'Switzerland'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  202 
             , X =  251 
             , Y =  'Syria'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  203 
             , X =  252 
             , Y =  'Taiwan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  204 
             , X =  253 
             , Y =  'Tajikistan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  205 
             , X =  254 
             , Y =  'Tanzania'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  206 
             , X =  255 
             , Y =  'Thailand'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  632 
             , X =  256 
             , Y =  'Tibet'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  208 
             , X =  257 
             , Y =  'Togo'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  209 
             , X =  258 
             , Y =  'Tokelau'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  210 
             , X =  259 
             , Y =  'Tonga'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  211 
             , X =  260 
             , Y =  'Trinidad and Tobago'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  212 
             , X =  261 
             , Y =  'Tunisia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  213 
             , X =  262 
             , Y =  'Turkey'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  214 
             , X =  263 
             , Y =  'Turkmenistan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  215 
             , X =  264 
             , Y =  'Turks and Caicos Islands'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  216 
             , X =  265 
             , Y =  'Tuvalu'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  217 
             , X =  266 
             , Y =  'Uganda'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  218 
             , X =  267 
             , Y =  'Ukraine'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  219 
             , X =  268 
             , Y =  'United Arab Emirates'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  220 
             , X =  269 
             , Y =  'United Kingdom'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  221 
             , X =  270 
             , Y =  'United States'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  223 
             , X =  271 
             , Y =  'Uruguay'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  224 
             , X =  272 
             , Y =  'Uzbekistan'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  225 
             , X =  273 
             , Y =  'Vanuatu'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  226 
             , X =  274 
             , Y =  'Venezuela'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  227 
             , X =  275 
             , Y =  'Vietnam'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  222 
             , X =  276 
             , Y =  'Virgin Islands (U.S.)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  228 
             , X =  278 
             , Y =  'Wallis and Futuna'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2150 
             , X =  280 
             , Y =  'WESTERN AFRICA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2340 
             , X =  281 
             , Y =  'WESTERN ASIA (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  2440 
             , X =  282 
             , Y =  'WESTERN EUROPE (specify country)'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  229 
             , X =  284 
             , Y =  'Western Sahara'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  230 
             , X =  285 
             , Y =  'Yemen'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  231 
             , X =  287 
             , Y =  'Zambia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  232 
             , X =  288 
             , Y =  'Zimbabwe'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  802 
             , X =  500 
             , Y =  'USSR'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  803 
             , X =  501 
             , Y =  'Yugoslavia'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  9998 
             , X =  597 
             , Y =  'Other/Unclear/Undetermined'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  705 
             , X =  598 
             , Y =  'Born Outside U.S. - Dont Know Where'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  706 
             , X =  599 
             , Y =  'Born Outside U.S. - Refused to Say Where'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  9997 
             , X =  888 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS14all_mother_birthcountry'
             , V =  9999 
             , X =  999 
             , Y =  'Dont know/Refused to say where born'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  701 
             , X =  1 
             , Y =  'U.S. (native born)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  702 
             , X =  2 
             , Y =  'Americas (excluding U.S.)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  1006 
             , X =  3 
             , Y =  'Asia/Pacific'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  1003 
             , X =  4 
             , Y =  'Europe'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  1004 
             , X =  5 
             , Y =  'MENA (Middle East/North Africa)'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  1005 
             , X =  6 
             , Y =  'Sub-Saharan Africa'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  704 
             , X =  10 
             , Y =  'Other/Undetermined - Outside U.S.'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  9997 
             , X =  11 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS07cUS_respondent_birthregion'
             , V =  9999 
             , X =  99 
             , Y =  'Don''t know/refused'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  701 
             , X =  1 
             , Y =  'U.S. (native born)'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  702 
             , X =  2 
             , Y =  'Americas (excluding U.S.)'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  1006 
             , X =  3 
             , Y =  'Asia/Pacific'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  1003 
             , X =  4 
             , Y =  'Europe'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  1004 
             , X =  5 
             , Y =  'MENA (Middle East/North Africa)'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  1005 
             , X =  6 
             , Y =  'Sub-Saharan Africa'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  704 
             , X =  10 
             , Y =  'Other/Undetermined - Outside U.S.'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  9997 
             , X =  11 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS14all_respondent_birthregion'
             , V =  9999 
             , X =  99 
             , Y =  'Don''t know/refused'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  701 
             , X =  1 
             , Y =  'U.S. (native born)'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  702 
             , X =  2 
             , Y =  'Americas (excluding U.S.)'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  1006 
             , X =  3 
             , Y =  'Asia/Pacific'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  1003 
             , X =  4 
             , Y =  'Europe'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  1004 
             , X =  5 
             , Y =  'MENA (Middle East/North Africa)'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  1005 
             , X =  6 
             , Y =  'Sub-Saharan Africa'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  704 
             , X =  10 
             , Y =  'Other/Undetermined - Outside U.S.'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  9997 
             , X =  11 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS07cUS_father_birthregion'
             , V =  9999 
             , X =  99 
             , Y =  'Don''t know/refused'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  701 
             , X =  1 
             , Y =  'U.S. (native born)'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  702 
             , X =  2 
             , Y =  'Americas (excluding U.S.)'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  1006 
             , X =  3 
             , Y =  'Asia/Pacific'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  1003 
             , X =  4 
             , Y =  'Europe'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  1004 
             , X =  5 
             , Y =  'MENA (Middle East/North Africa)'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  1005 
             , X =  6 
             , Y =  'Sub-Saharan Africa'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  704 
             , X =  10 
             , Y =  'Other/Undetermined - Outside U.S.'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  9997 
             , X =  11 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS14all_father_birthregion'
             , V =  9999 
             , X =  99 
             , Y =  'Don''t know/refused'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  701 
             , X =  1 
             , Y =  'U.S. (native born)'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  702 
             , X =  2 
             , Y =  'Americas (excluding U.S.)'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  1006 
             , X =  3 
             , Y =  'Asia/Pacific'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  1003 
             , X =  4 
             , Y =  'Europe'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  1004 
             , X =  5 
             , Y =  'MENA (Middle East/North Africa)'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  1005 
             , X =  6 
             , Y =  'Sub-Saharan Africa'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  704 
             , X =  10 
             , Y =  'Other/Undetermined - Outside U.S.'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  9997 
             , X =  11 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS07cUS_mother_birthregion'
             , V =  9999 
             , X =  99 
             , Y =  'Don''t know/refused'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  701 
             , X =  1 
             , Y =  'U.S. (native born)'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  702 
             , X =  2 
             , Y =  'Americas (excluding U.S.)'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  1006 
             , X =  3 
             , Y =  'Asia/Pacific'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  1003 
             , X =  4 
             , Y =  'Europe'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  1004 
             , X =  5 
             , Y =  'MENA (Middle East/North Africa)'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  1005 
             , X =  6 
             , Y =  'Sub-Saharan Africa'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  704 
             , X =  10 
             , Y =  'Other/Undetermined - Outside U.S.'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  9997 
             , X =  11 
             , Y =  'Undesignated'


  UNION SELECT Q =  'RLS14all_mother_birthregion'
             , V =  9999 
             , X =  99 
             , Y =  'Don''t know/refused'
                                                                             ) /* <   Set of Values ends!                 */
-- testset                                                                     /*     alias for testing Set of Values     */
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO                                                                    /* insert statement                        */
               [Pew_Answer_NoStd]                                              /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* higher level select statement...        */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Answer_pk]          =   ROW_NUMBER()                                   /* number all rows                         */
                                OVER( ORDER BY [Qk], [X])                      /* sorted by Q_pk & NoStdAnsValue          */
                             + (SELECT     MAX([Answer_pk])                    /* add currently max pk                    */
                                  FROM         [Pew_Answer_NoStd])             /* from NoStdAnswers                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Answer_value_NoStd] =  [X]                                             /* value coded in original dataset         */
      ,[Answer_Wording]     =  [Y]                                             /* wording exactly as original ValueLabel  */
      ,[Answer_Std_fk]      =  [SAk]                                           /* fk as StdAns_pk, pulled...              */
      ,[Question_fk]        =  [Qk]                                            /* fk as NoStdQ_pk, pulled...              */
/*------------------------------------------------------------------------------------------------------------------------*/
FROM   (                                                                       /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
         SELECT                                                                /* sub-query select statement...           */
/*------------------------------------------------------------------------------------------------------------------------*/
                 [Qk]       = ( SELECT [Question_pk]                           /* identify available Q_pk (curr unique)   */
                                  FROM [Pew_Question]                          /* as presented in Std&NoStdQuestions view */
                                 WHERE [Question_abbreviation]       = [Q]   ) /* filter by corresponding Q_abbreviation  */
/*------------------------------------------------------------------------------------------------------------------------*/
               , [SAk]      = ( SELECT [Answer_Std_pk]                         /* identify corresponding A_pk             */
                                  FROM [Pew_Answer_Std]                        /* as stored in StdAnswers table           */
                                 WHERE [Answer_value_std]            = [V]     /* filter by already known StdValue...     */
                                 AND   [AnswerSet_number]            =         /* and by matching AnswerSetNum to...      */
                                     ( SELECT [AnswerSet_num]                  /*   identified available AnswerSetNum     */
                                         FROM [Pew_Question]                   /*   as presented in Std&NoStdQs view      */
                                        WHERE [Question_abbreviation]= [Q] ) ) /*   filter by corresponding Q_abbrev      */
/*------------------------------------------------------------------------------------------------------------------------*/
      , *                                                                      /* all other variables in CTE              */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdAnswers)      */
/*------------------------------------------------------------------------------------------------------------------------*/
                                                              )   AS NoStdAns  /* alias of sub-query                      */
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Answer_NoStd]                                               /* check results in modified table         */
/**************************************************************************************************************************/

