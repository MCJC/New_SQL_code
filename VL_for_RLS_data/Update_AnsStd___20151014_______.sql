USE [RLS]
GO
/****************************************************************************************************************************************/
/*****                                                     BackUp current Table                                                     *****/
/****************************************************************************************************************************************/
/****************************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)                                                 /* declare variable to store current date                */
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))                          /* store date in format YYYYMMDD                         */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
EXEC                                                                           /* exec statement to run string s script                 */
     ( ' SELECT * INTO [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + 'RLS]'    /* select into backup                                    */
         + '      FROM                   [Pew_Answer_Std]'               )     /* select into backup from current table                 */
/****************************************************************************************************************************************/



/****************************************************************************************************************************************/
/*****                                                          +    A D D                                                          *****/
/*****                                     notice:  this adds answers to a set previously added                                     *****/
/****************************************************************************************************************************************/
WITH NSV AS                                                                                  /* New Vals -common table expression       */
(                                                                                            /* > Sub-Set of Values begins...           */
        SELECT V =  2.00 , W = 'Baltimore Metro Area'                                        /* - answer value & wording...             */
  UNION SELECT V = 14.00 , W = 'Pittsburgh Metro Area'
  UNION SELECT V = 15.00 , W = 'Providence Metro Area'
  UNION SELECT V = 20.00 , W = 'St. Louis Metro Area'
  UNION SELECT V = 21.00 , W = 'Tampa Metro Area'                             )              /* <   Set of Values ends!                 */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO                                                                                  /* insert statement                        */
               [Pew_Answer_Std]                                                              /* table in working database               */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                                       /* select statement...                     */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
       [Answer_Std_pk]          =   (ROW_NUMBER ()                                           /* number all rows                         */
                                           OVER (ORDER BY [V] ))                             /* sorted by answer value                  */
                                  + (SELECT MAX([Answer_Std_pk])                             /* add currently max pk                    */
                                       FROM     [Pew_Answer_Std]                             /* from Std Answers                        */
                                      WHERE     [Answer_Std_pk] < 999990)                    /* excluding Un-Coded Numeric/Count vals   */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
      ,[AnswerSet_number]       =   51                                                       /* conventional answer set number          */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
      ,[Answer_value_std]       =   [V]                                                      /* conventional answer standard value      */
      ,[Answer_Wording_std]     =   [W]                                                      /* conventional answer standard wording    */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
      ,[Full_set_of_Answers]    =   ''                                                       /* pending set of values & wordings        */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
      ,[NA_by_set_of_Answers]   =    0                                                       /* pending count of values by answer set n */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
FROM    [NSV]                                                     AS SetVs                   /* main reference to CTE (New Set of Vals) */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
/****************************************************************************************************************************************/

/****************************************************************************************************************************************/
SELECT * FROM [Pew_Answer_Std] WHERE [AnswerSet_number] = 51                                 /* check results in modified table         */
/****************************************************************************************************************************************/


/****************************************************************************************************************************************/
/*****                                                        -> U P D A T E                                                        *****/
/*****                                        notice:  this UPDATED answers previously added                                        *****/
/****************************************************************************************************************************************/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  1, [Answer_Wording_std] = 'Atlanta Metro Area'              WHERE [Answer_Std_pk] = 10224 AND [Answer_Wording_std] = 'Atlanta'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  3, [Answer_Wording_std] = 'Boston Metro Area'               WHERE [Answer_Std_pk] = 10225 AND [Answer_Wording_std] = 'Boston'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  4, [Answer_Wording_std] = 'Chicago Metro Area'              WHERE [Answer_Std_pk] = 10226 AND [Answer_Wording_std] = 'Chicago'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  5, [Answer_Wording_std] = 'Dallas/Fort Worth Metro Area'    WHERE [Answer_Std_pk] = 10228 AND [Answer_Wording_std] = 'Dallas'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  6, [Answer_Wording_std] = 'Detroit Metro Area'              WHERE [Answer_Std_pk] = 10229 AND [Answer_Wording_std] = 'Detroit'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  7, [Answer_Wording_std] = 'Houston Metro Area'              WHERE [Answer_Std_pk] = 10230 AND [Answer_Wording_std] = 'Houston'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  8, [Answer_Wording_std] = 'Los Angeles Metro Area'          WHERE [Answer_Std_pk] = 10231 AND [Answer_Wording_std] = 'Los Angeles'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] =  9, [Answer_Wording_std] = 'Miami Metro Area'                WHERE [Answer_Std_pk] = 10232 AND [Answer_Wording_std] = 'Miami'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 10, [Answer_Wording_std] = 'Minneapolis/St. Paul Metro Area' WHERE [Answer_Std_pk] = 10233 AND [Answer_Wording_std] = 'Minneapolis'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 11, [Answer_Wording_std] = 'New York City Metro Area'        WHERE [Answer_Std_pk] = 10234 AND [Answer_Wording_std] = 'New York City'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 12, [Answer_Wording_std] = 'Philadelphia Metro Area'         WHERE [Answer_Std_pk] = 10235 AND [Answer_Wording_std] = 'Philadelphia'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 13, [Answer_Wording_std] = 'Phoenix Metro Area'              WHERE [Answer_Std_pk] = 10236 AND [Answer_Wording_std] = 'Phoenix'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 16, [Answer_Wording_std] = 'Riverside, CA Metro Area'        WHERE [Answer_Std_pk] = 10237 AND [Answer_Wording_std] = 'Riverside'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 17, [Answer_Wording_std] = 'San Diego Metro Area'            WHERE [Answer_Std_pk] = 10238 AND [Answer_Wording_std] = 'San Diego'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 18, [Answer_Wording_std] = 'San Francisco Metro Area'        WHERE [Answer_Std_pk] = 10239 AND [Answer_Wording_std] = 'San Francisco'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 19, [Answer_Wording_std] = 'Seattle Metro Area'              WHERE [Answer_Std_pk] = 10240 AND [Answer_Wording_std] = 'Seattle'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [Pew_Answer_Std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SET [Answer_value_std] = 22, [Answer_Wording_std] = 'Washington, DC Metro Area'       WHERE [Answer_Std_pk] = 10227 AND [Answer_Wording_std] = 'DC'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/****************************************************************************************************************************************/
SELECT * FROM [Pew_Answer_Std] WHERE [AnswerSet_number] = 51 ORDER BY [Answer_value_std]     /* check results in modified table         */
/****************************************************************************************************************************************/



SET    [Answer_value_std] = , [Answer_Wording_std] = WHERE [Answer_Std_pk] = AND [Answer_Wording_std] = 
10224	51	1.00	Atlanta
1.00	Atlantaforum].[dbo].[Pew_Answer_Std].[Answer_Wording_std]            = 'Other/DK/Ref. (vol.)'
--select * from [forum]..[Pew_Answer_Std]
WHERE
           [forum].[dbo].[Pew_Answer_Std].[Answer_Wording_std]            = 'Other/DK/Ref. (vol)'
/*------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET  
           [forum].[dbo].[Pew_Answer_Std].[Full_set_of_Answers]           =
 '1.00: Yes: Absolutely certain   ||   2.00: Yes: Fairly certain   ||   3.00: Yes: Not too certain   '
+'||   4.00: Yes: Not at all certain   ||   5.00: Yes: DK/Ref. (vol.) how certain   ||   6.00: No: Don''t believe   '
+'||   7.00: Other/DK/Ref. (vol.)'
--select * from [forum]..[Pew_Answer_Std]
WHERE
           [forum].[dbo].[Pew_Answer_Std].[Full_set_of_Answers]           =
 '1.00: Yes: Absolutely certain   ||   2.00: Yes: Fairly certain   ||   3.00: Yes: Not too certain   '
+'||   4.00: Yes: Not at all certain   ||   5.00: Yes: DK/Ref. (vol.) how certain   ||   6.00: No: Don''t believe   '
+'||   7.00: Other/DK/Ref. (vol)'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/




/****************************************************************************************************************************************/



Answer_Std_pk	AnswerSet_number	Answer_value_std	Answer_Wording_std
10224	51	1.00	Atlanta
10225	51	2.00	Boston
10226	51	3.00	Chicago
10227	51	4.00	DC
10228	51	5.00	Dallas
10229	51	6.00	Detroit
10230	51	7.00	Houston
10231	51	8.00	Los Angeles
10232	51	9.00	Miami
10233	51	10.00	Minneapolis
10234	51	11.00	New York City



/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Answer_Std]                                                 /* check results in modified table         */
/**************************************************************************************************************************/





/*****                                                  number and sets of answers                                                  *****/
/****************************************************************************************************************************************/
/****************************************************************************************************************************************/
/*--------------------------------------------------------------------------------------------------------------------------------------*/
/*--- PEND: DESCRIBE  tab-of-ans (ToA) needs to be sorted by STD vals => PewAnsStd-Sorted ----------------------------------------------*/
--WITH PASS                                        ctre didnt work             /* Define the CTE common-table-expression name           */
--AS (                                                                         /* Define the CTE query                                  */
        SELECT  [r] = ROW_NUMBER ( )                                           /*                                                       */
                            OVER (                                             /*                                                       */
                        ORDER BY  [AnswerSet_number]                           /*                                                       */
                                , [Answer_value_std] )                         /*                                                       */
              , [Answer_value_std]                                             /*                                                       */
              , [Answer_Wording_std]                                           /*                                                       */
              , [AnswerSet_number]                                             /*                                                       */
         INTO   [#PASS]                                                        /* TEMP table sorting PewStdAns                          */
         FROM                                                                  /*                                                       */
                [Pew_Answer_Std]                                               /*                                                       */
--                                                                          )  /* End CTE - then, outer query referencing CTE name.     */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [RLS].[dbo].[Pew_Answer_Std]
SET
           [RLS].[dbo].[Pew_Answer_Std].[NA_by_set_of_Answers]
       =                            aNW.[X]
     ,     [RLS].[dbo].[Pew_Answer_Std].[Full_set_of_Answers]
       =                            aNW.[A]
/*--------------------------------------------------------------------------------------------------------------------------------------*/
--select *                                                                     /* test statement                                        */
FROM                                                                           /* to incl;ude two joined elements                       */
           [Pew_Answer_Std]                                             AS myt /* current tabble to be modified                         */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
 JOIN
/*--------------------------------------------------------------------------------------------------------------------------------------*/
      ( SELECT                                                                 /* sub-query for nested/aggreg N-of-answers+concat-wrdgs */
               [AnswerSet_number]                                              /* answer set number to join subquery to main query      */
              ,[X] = COUNT(*)                                                  /* aggregate number of answers by counting rows          */
              ,[A] = STUFF(                                                    /* begin stuffing procedure...                           */
                           ( SELECT '   ||'                                    /* begin selection into XML nested cell(s)               */
                                  + STR(S2.[Answer_value_std], 7,2 )           /* add value as string...                                */
                                  + ': '                                       /* concatenate using colon...                            */
                                  +        [Answer_Wording_std]                /* to the corresponding wording                          */
                              FROM         [Pew_Answer_Std]                  S2        /* secondary reference to TEMP Sorted ToA in sub-query   */
                             WHERE                                             /* condition of correspondence...                        */
                                        S1.[AnswerSet_number]                  /* matching set number from main ToA reference...        */
                                      = S2.[AnswerSet_number]                  /* to secondary reference of ToA in sub-query            */
                          ORDER BY      S1.[AnswerSet_number]                  /* q results sorting order by answer set number          */
                          FOR XML PATH('') )                                   /* nest in one XML string cell                           */
                                            , 1, 7, '')                        /* end stuffing proced. by dropping some initial chars   */
          FROM [Pew_Answer_Std]                                               S1         /* main reference to TEMP Sorted ToA in sub-qu          */
       GROUP BY [AnswerSet_number]                                             /* aggregate values by id of set odf answers             */
                                                                      ) AS aNW /* alias of sub-query of aggr N-of-answers+concat-wrdgs  */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
ON                                                                             /* joint by answer set number, matching...               */
             myt.[AnswerSet_number]                                            /* AN in current tabble                                  */
       =     aNW.[AnswerSet_number]                                            /* to AN as resulted from sub-query                      */
/*--------------------------------------------------------------------------------------------------------------------------------------*/
	WHERE    myt.[AnswerSet_number] = 51                                     /* EXCLUDING SOME values from the aggregation...         */

/*--------------------------------------------------------------------------------------------------------------------------------------*/
GO
/*--------------------------------------------------------------------------------------------------------------------------------------*/
/****************************************************************************************************************************************/
/****************************************************************************************************************************************/



/****************************************************************************************************************************************/
SELECT * FROM [Pew_Answer_Std] WHERE [AnswerSet_number] = 51 ORDER BY [Answer_value_std]     /* check results in modified table         */
/****************************************************************************************************************************************/
