/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Notes]         =   'EXCLUDE from site: recoded after merging to RLS 2014'
/*------------------------------------------------------------------------------------------------------------------------*/
--select distinct mydbt.[Question_pk],ftool.[Question_abbreviation_std],mydbt.[Question_abbreviation],mydbt.[Question_wording]
FROM
           [forum].[dbo].[Pew_Question_NoStd]        AS mydbt
 JOIN
           [forum].[dbo].[Pew_Q&A]                   AS ftool
ON
           mydbt.[Question_pk]
       =   ftool.[Question_fk]
WHERE
           ftool.[Question_abbreviation]     LIKE 'RLS07cUS_%'
  AND
           ftool.[Question_abbreviation_std]   IN (  'SVYc_0068'
                                                   , 'SVYp_0264'
                                                   , 'SVYp_0351'
                                                   , 'SVYp_0354'
                                                   , 'SVYp_0345'
                                                   , 'SVYp_0352' )
/**************************************************************************************************************************/
-- check results
SELECT *
FROM
           [forum].[dbo].[Pew_Question_NoStd]
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] LIKE 'RLS07cUS_%'
  AND
           [forum].[dbo].[Pew_Question_NoStd].[Notes]                   !=   ''
/**************************************************************************************************************************/
