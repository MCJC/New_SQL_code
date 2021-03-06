/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_Std]'               )
/**************************************************************************************************************************/
DELETE FROM               [forum].[dbo].[Pew_Answer_Std]
WHERE                     [AnswerSet_number] IN (239)   --- years

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
--     [x_LoadRLS1cUS].[dbo].[Pew_Answer_Std]
               [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
----------------------------------------------------------------------------------------------------------------------------
       [Answer_Std_pk]          =      (ROW_NUMBER () 
                                              OVER (ORDER BY [C] ))
                                   +   (SELECT MAX([Answer_Std_pk])
                                          FROM     [Pew_Answer_Std]
                                         WHERE     [Answer_Std_pk] < 999990)
----------------------------------------------------------------------------------------------------------------------------
      ,[AnswerSet_number]       =      ( 1 )
                                   +   (SELECT MAX([AnswerSet_number])
                                          FROM     [Pew_Answer_Std]
                                         WHERE     [AnswerSet_number] < 999990)
----------------------------------------------------------------------------------------------------------------------------
      ,[Answer_value_std]       =   [C]
      ,[Answer_Wording_std]     =   [D]
      ,[Full_set_of_Answers]    =   'Years 1900 - 2055'
      ,[NA_by_set_of_Answers]   =    157
----------------------------------------------------------------------------------------------------------------------------
  FROM
----------------------------------------------------------------------------------------------------------------------------
(
              SELECT C = 1900 , D = 'Year 1900'
        UNION SELECT C = 1901 , D = 'Year 1901'
        UNION SELECT C = 1902 , D = 'Year 1902'
        UNION SELECT C = 1903 , D = 'Year 1903'
        UNION SELECT C = 1904 , D = 'Year 1904'
        UNION SELECT C = 1905 , D = 'Year 1905'
        UNION SELECT C = 1906 , D = 'Year 1906'
        UNION SELECT C = 1907 , D = 'Year 1907'
        UNION SELECT C = 1908 , D = 'Year 1908'
        UNION SELECT C = 1909 , D = 'Year 1909'
        UNION SELECT C = 1910 , D = 'Year 1910'
        UNION SELECT C = 1911 , D = 'Year 1911'
        UNION SELECT C = 1912 , D = 'Year 1912'
        UNION SELECT C = 1913 , D = 'Year 1913'
        UNION SELECT C = 1914 , D = 'Year 1914'
        UNION SELECT C = 1915 , D = 'Year 1915'
        UNION SELECT C = 1916 , D = 'Year 1916'
        UNION SELECT C = 1917 , D = 'Year 1917'
        UNION SELECT C = 1918 , D = 'Year 1918'
        UNION SELECT C = 1919 , D = 'Year 1919'
        UNION SELECT C = 1920 , D = 'Year 1920'
        UNION SELECT C = 1921 , D = 'Year 1921'
        UNION SELECT C = 1922 , D = 'Year 1922'
        UNION SELECT C = 1923 , D = 'Year 1923'
        UNION SELECT C = 1924 , D = 'Year 1924'
        UNION SELECT C = 1925 , D = 'Year 1925'
        UNION SELECT C = 1926 , D = 'Year 1926'
        UNION SELECT C = 1927 , D = 'Year 1927'
        UNION SELECT C = 1928 , D = 'Year 1928'
        UNION SELECT C = 1929 , D = 'Year 1929'
        UNION SELECT C = 1930 , D = 'Year 1930'
        UNION SELECT C = 1931 , D = 'Year 1931'
        UNION SELECT C = 1932 , D = 'Year 1932'
        UNION SELECT C = 1933 , D = 'Year 1933'
        UNION SELECT C = 1934 , D = 'Year 1934'
        UNION SELECT C = 1935 , D = 'Year 1935'
        UNION SELECT C = 1936 , D = 'Year 1936'
        UNION SELECT C = 1937 , D = 'Year 1937'
        UNION SELECT C = 1938 , D = 'Year 1938'
        UNION SELECT C = 1939 , D = 'Year 1939'
        UNION SELECT C = 1940 , D = 'Year 1940'
        UNION SELECT C = 1941 , D = 'Year 1941'
        UNION SELECT C = 1942 , D = 'Year 1942'
        UNION SELECT C = 1943 , D = 'Year 1943'
        UNION SELECT C = 1944 , D = 'Year 1944'
        UNION SELECT C = 1945 , D = 'Year 1945'
        UNION SELECT C = 1946 , D = 'Year 1946'
        UNION SELECT C = 1947 , D = 'Year 1947'
        UNION SELECT C = 1948 , D = 'Year 1948'
        UNION SELECT C = 1949 , D = 'Year 1949'
        UNION SELECT C = 1950 , D = 'Year 1950'
        UNION SELECT C = 1951 , D = 'Year 1951'
        UNION SELECT C = 1952 , D = 'Year 1952'
        UNION SELECT C = 1953 , D = 'Year 1953'
        UNION SELECT C = 1954 , D = 'Year 1954'
        UNION SELECT C = 1955 , D = 'Year 1955'
        UNION SELECT C = 1956 , D = 'Year 1956'
        UNION SELECT C = 1957 , D = 'Year 1957'
        UNION SELECT C = 1958 , D = 'Year 1958'
        UNION SELECT C = 1959 , D = 'Year 1959'
        UNION SELECT C = 1960 , D = 'Year 1960'
        UNION SELECT C = 1961 , D = 'Year 1961'
        UNION SELECT C = 1962 , D = 'Year 1962'
        UNION SELECT C = 1963 , D = 'Year 1963'
        UNION SELECT C = 1964 , D = 'Year 1964'
        UNION SELECT C = 1965 , D = 'Year 1965'
        UNION SELECT C = 1966 , D = 'Year 1966'
        UNION SELECT C = 1967 , D = 'Year 1967'
        UNION SELECT C = 1968 , D = 'Year 1968'
        UNION SELECT C = 1969 , D = 'Year 1969'
        UNION SELECT C = 1970 , D = 'Year 1970'
        UNION SELECT C = 1971 , D = 'Year 1971'
        UNION SELECT C = 1972 , D = 'Year 1972'
        UNION SELECT C = 1973 , D = 'Year 1973'
        UNION SELECT C = 1974 , D = 'Year 1974'
        UNION SELECT C = 1975 , D = 'Year 1975'
        UNION SELECT C = 1976 , D = 'Year 1976'
        UNION SELECT C = 1977 , D = 'Year 1977'
        UNION SELECT C = 1978 , D = 'Year 1978'
        UNION SELECT C = 1979 , D = 'Year 1979'
        UNION SELECT C = 1980 , D = 'Year 1980'
        UNION SELECT C = 1981 , D = 'Year 1981'
        UNION SELECT C = 1982 , D = 'Year 1982'
        UNION SELECT C = 1983 , D = 'Year 1983'
        UNION SELECT C = 1984 , D = 'Year 1984'
        UNION SELECT C = 1985 , D = 'Year 1985'
        UNION SELECT C = 1986 , D = 'Year 1986'
        UNION SELECT C = 1987 , D = 'Year 1987'
        UNION SELECT C = 1988 , D = 'Year 1988'
        UNION SELECT C = 1989 , D = 'Year 1989'
        UNION SELECT C = 1990 , D = 'Year 1990'
        UNION SELECT C = 1991 , D = 'Year 1991'
        UNION SELECT C = 1992 , D = 'Year 1992'
        UNION SELECT C = 1993 , D = 'Year 1993'
        UNION SELECT C = 1994 , D = 'Year 1994'
        UNION SELECT C = 1995 , D = 'Year 1995'
        UNION SELECT C = 1996 , D = 'Year 1996'
        UNION SELECT C = 1997 , D = 'Year 1997'
        UNION SELECT C = 1998 , D = 'Year 1998'
        UNION SELECT C = 1999 , D = 'Year 1999'
        UNION SELECT C = 2000 , D = 'Year 2000'
        UNION SELECT C = 2001 , D = 'Year 2001'
        UNION SELECT C = 2002 , D = 'Year 2002'
        UNION SELECT C = 2003 , D = 'Year 2003'
        UNION SELECT C = 2004 , D = 'Year 2004'
        UNION SELECT C = 2005 , D = 'Year 2005'
        UNION SELECT C = 2006 , D = 'Year 2006'
        UNION SELECT C = 2007 , D = 'Year 2007'
        UNION SELECT C = 2008 , D = 'Year 2008'
        UNION SELECT C = 2009 , D = 'Year 2009'
        UNION SELECT C = 2010 , D = 'Year 2010'
        UNION SELECT C = 2011 , D = 'Year 2011'
        UNION SELECT C = 2012 , D = 'Year 2012'
        UNION SELECT C = 2013 , D = 'Year 2013'
        UNION SELECT C = 2014 , D = 'Year 2014'
        UNION SELECT C = 2015 , D = 'Year 2015'
        UNION SELECT C = 2016 , D = 'Year 2016'
        UNION SELECT C = 2017 , D = 'Year 2017'
        UNION SELECT C = 2018 , D = 'Year 2018'
        UNION SELECT C = 2019 , D = 'Year 2019'
        UNION SELECT C = 2020 , D = 'Year 2020'
        UNION SELECT C = 2021 , D = 'Year 2021'
        UNION SELECT C = 2022 , D = 'Year 2022'
        UNION SELECT C = 2023 , D = 'Year 2023'
        UNION SELECT C = 2024 , D = 'Year 2024'
        UNION SELECT C = 2025 , D = 'Year 2025'
        UNION SELECT C = 2026 , D = 'Year 2026'
        UNION SELECT C = 2027 , D = 'Year 2027'
        UNION SELECT C = 2028 , D = 'Year 2028'
        UNION SELECT C = 2029 , D = 'Year 2029'
        UNION SELECT C = 2030 , D = 'Year 2030'
        UNION SELECT C = 2031 , D = 'Year 2031'
        UNION SELECT C = 2032 , D = 'Year 2032'
        UNION SELECT C = 2033 , D = 'Year 2033'
        UNION SELECT C = 2034 , D = 'Year 2034'
        UNION SELECT C = 2035 , D = 'Year 2035'
        UNION SELECT C = 2036 , D = 'Year 2036'
        UNION SELECT C = 2037 , D = 'Year 2037'
        UNION SELECT C = 2038 , D = 'Year 2038'
        UNION SELECT C = 2039 , D = 'Year 2039'
        UNION SELECT C = 2040 , D = 'Year 2040'
        UNION SELECT C = 2041 , D = 'Year 2041'
        UNION SELECT C = 2042 , D = 'Year 2042'
        UNION SELECT C = 2043 , D = 'Year 2043'
        UNION SELECT C = 2044 , D = 'Year 2044'
        UNION SELECT C = 2045 , D = 'Year 2045'
        UNION SELECT C = 2046 , D = 'Year 2046'
        UNION SELECT C = 2047 , D = 'Year 2047'
        UNION SELECT C = 2048 , D = 'Year 2048'
        UNION SELECT C = 2049 , D = 'Year 2049'
        UNION SELECT C = 2050 , D = 'Year 2050'
        UNION SELECT C = 2051 , D = 'Year 2051'
        UNION SELECT C = 2052 , D = 'Year 2052'
        UNION SELECT C = 2053 , D = 'Year 2053'
        UNION SELECT C = 2054 , D = 'Year 2054'
        UNION SELECT C = 2055 , D = 'Year 2055'
        UNION SELECT C = 9999 , D = 'DK/Ref. (vol.)'
)   XXX 
----------------------------------------------------------------------------------------------------------------------------
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************/
