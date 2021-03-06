-- New row pk=55 in Pew_Data_Source table was not necessary
-- Questions should be linked rows pk=33 after such a row has been normalized to match format

/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_NoStd_2013_04_29]
  FROM     [forum].[dbo].[Pew_Question_NoStd]
/*********************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk]
         =  33
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]   IN (
                                                                    877   -- code as: 33
                                                                  , 614   -- code as: 33
                                                                  , 618   -- code as: 33
                                                                  , 848   -- code as: 33
                                                                                          )
/*********************************************************************************************************/
-- check results
SELECT 
       [Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Data_source_fk]
FROM
           [forum].[dbo].[Pew_Question_NoStd]
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]   IN (
                                                                    877   -- code as: 33
                                                                  , 614   -- code as: 33
                                                                  , 618   -- code as: 33
                                                                  , 848   -- code as: 33
                                                                                         )
/*********************************************************************************************************/