-- this works as a STEP BY STEP procedure


IF OBJECT_ID  (N'[forum].[dbo].[Pew_Question_Std]', N'U') IS NOT NULL
DROP   TABLE     [forum].[dbo].[Pew_Question_Std]
/********************************************************************************************************/
-- remove null short wording std:
UPDATE
            [forum].[dbo].[Pew_Question]
SET
            [forum].[dbo].[Pew_Question].[Question_short_wording_std]
          = [forum].[dbo].[Pew_Question].[Question_wording_std]
WHERE       [forum].[dbo].[Pew_Question].[Question_short_wording_std] IS NULL
/********************************************************************************************************/
SELECT 
          Question_Std_pk = ROW_NUMBER() OVER(ORDER BY Question_abbreviation_std )
       , *
INTO       [forum].[dbo].[Pew_Question_Std]
FROM
  (
	SELECT distinct
		   [Question_abbreviation_std]
		  ,[Question_wording_std]
		  ,[Question_short_wording_std]
	  FROM [forum].[dbo].[Pew_Question]
  )
	AS uniques

/********************************************************************************************************/
-- change ID field configuration as integer and non-nullable:
ALTER TABLE [forum].[dbo].[Pew_Question_Std]
ALTER COLUMN Question_Std_pk INT NOT NULL
-- change ID field configuration as real pk:
ALTER TABLE [forum].[dbo].[Pew_Question_Std]
ADD   CONSTRAINT Question_Std_pk PRIMARY KEY(Question_Std_pk)
/***************************************************************************************  IDs as PKs  ***/


ALTER TABLE [forum].[dbo].[Pew_Question]
ADD 
            Question_Std_fk int


UPDATE
            [forum].[dbo].[Pew_Question]
SET
            [forum].[dbo].[Pew_Question].[Question_Std_fk]
          = [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]
FROM
            [forum].[dbo].[Pew_Question]
INNER JOIN
            [forum].[dbo].[Pew_Question_Std]
        ON
            [forum].[dbo].[Pew_Question].[Question_abbreviation_std]
          = [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]
       AND  [forum].[dbo].[Pew_Question].[Question_wording_std]
          = [forum].[dbo].[Pew_Question_Std].[Question_wording_std]
       AND  [forum].[dbo].[Pew_Question].[Question_short_wording_std]
          = [forum].[dbo].[Pew_Question_Std].[Question_short_wording_std]


/********************************************************************************************************/
/********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_Std_2013_02_11]
  FROM     [forum].[dbo].[Pew_Question_Std]
/**********************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_2013_02_11]
  FROM     [forum].[dbo].[Pew_Question]
/********************************************************************************************************/
SELECT *
  FROM     [forum].[dbo].[Pew_Question]        QU

SELECT *
  FROM     [forum].[dbo].[Pew_Question]        QU
      ,    [forum].[dbo].[Pew_Question_Std]    QS
WHERE      qu.Question_Std_fk = qs.Question_Std_pk
/********************************************************************************************************/
/********************************************************************************************************/
-- drop standard columns:
ALTER TABLE [forum].[dbo].[Pew_Question]
DROP COLUMN [Question_abbreviation_std]

ALTER TABLE [forum].[dbo].[Pew_Question]
DROP COLUMN [Question_wording_std]

ALTER TABLE [forum].[dbo].[Pew_Question]
DROP COLUMN [Question_short_wording_std]
/********************************************************************************************************/
--USE forum
--GO

--sp_RENAME 'Pew_Question', 'Pew_Question_NoStd'
--GO

/*** Message: Caution: Changing any part of an object name could break scripts and stored procedures. ***/
/********************************************************************************************************/


/********************************************************************************************************/
-- add question wording for indexes
INSERT INTO [forum].[dbo].[Pew_Question_Std] ( 
                                                Question_Std_pk
                                              , Question_abbreviation_std
                                              , Question_wording_std
                                              , Question_short_wording_std
                                             )
          SELECT   529
                 , 'GRI'
                 , 'Calculated Year Value of the Government Restrictions Index'
                 , 'Government Restrictions Index'
UNION ALL
          SELECT   530
                 , 'SHI'
                 , 'Calculated Year Value of the Social Hostilities Index'
                 , 'Social Hostilities Index'
UNION ALL
          SELECT   531
                 , 'GFI'
                 , 'Calculated Year Value of the Government Favoritism Index'
                 , 'Government Favoritism Index'
/********************************************************************************************************/


