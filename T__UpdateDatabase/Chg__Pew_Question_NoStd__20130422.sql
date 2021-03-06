/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_NoStd_2013_04_22]
  FROM     [forum].[dbo].[Pew_Question_NoStd]
/*********************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Notes]
         =  'Interviews with Muslims in Thailand conducted in the five southern provinces only. In Russia, '
          + 'Muslims were asked if they favor or oppose making sharia the law of the land in the country''s'
          + ' ethnic Muslim republics.'
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]           = 918
     AND      
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] = 'GSI_79a79b'
---------------------------------------------------------------------------------------------------------
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Notes]
         =  'Interviews with Muslims in Thailand conducted in the five southern provinces only. In Russia, '
          + 'Muslims were asked if both Muslims and non-Muslims should be subject to sharia in the ethnic M'
          + 'uslim republics of the country.'
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]           = 921
     AND      
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] = 'GSI_81'
/*********************************************************************************************************/
-- check results
SELECT 
       [Notes]
      ,[Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
FROM
           [forum].[dbo].[Pew_Question_NoStd]
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]           = 918
     OR
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] = 'GSI_79a79b'
     OR
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]           = 921
     OR
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] = 'GSI_81'
/*********************************************************************************************************/

