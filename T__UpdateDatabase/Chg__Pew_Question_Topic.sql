-- drop       ,[SubTopic_fk]

SELECT
         Question_topic_pk = ROW_NUMBER() OVER(ORDER BY Question_Std_fk, Topic_fk )
       , *

  INTO [forum].[dbo].[Pew_Question_Topic_NEW]

FROM
(
/**********************************************************************************************/
SELECT 
       DISTINCT
      -- [Question_topic_pk]
      --,[Question_fk]
      --,
       [Question_Std_fk]
      ,[Topic_fk]
      ,[Priority_order]
      --,[Topic_sorting]
      --,[SubTopic_Sorting]
      --,[Display]
      --,[Question_abbreviation_std]
      --,[Topic]
      --,[SubTopic]
      --,[Question_wording_std]
      --,[Question_short_wording_std]

  FROM [forum].[dbo].[Pew_Question_Topic]
     , [forum].[dbo].[Pew_Topic]
     , [forum].[dbo].[Pew_Question]
--   , [forum].[dbo].[Pew_Question_Std]

WHERE [Topic_fk]        = [Topic_pk]
  AND [Question_fk]     = [Question_pk]
--AND [Question_Std_fk] = [Question_Std_pk]

--ORDER BY
--		   [Topic_sorting]
--		  ,[SubTopic_Sorting]
--		  ,[Question_abbreviation_std]
/**********************************************************************************************/
) AS UNIQUES
--ORDER BY
--		   [Question_Std_fk]
--		  ,[Topic_fk]


-- COMPARE TABLLES BEFORE PROCCEDING!!!


/**********************************************************************************************/
-- drop old table
IF OBJECT_ID  (N'[forum].[dbo].[Pew_Question_Topic]', N'U') IS NOT NULL
DROP   TABLE     [forum].[dbo].[Pew_Question_Topic]
/**********************************************************************************************/


-- change ID field configuration as integer and non-nullable:
ALTER TABLE [forum].[dbo].[Pew_Question_Topic_NEW]
ALTER COLUMN Question_topic_pk INT NOT NULL
-- change ID field configuration as real pk:
ALTER TABLE [forum].[dbo].[Pew_Question_Topic_NEW]
ADD   CONSTRAINT  Question_topic_pk
      PRIMARY KEY(Question_topic_pk)

/**********************************************************************************************/

-- rename new table (step 1)
USE forum
GO

/**********************************************************************************************/
-- rename new table (step 2)

sp_RENAME 'Pew_Question_Topic_NEW', 'Pew_Question_Topic'


/**********************************************************************************************/


-- check all questions are working
-- complete all new questions