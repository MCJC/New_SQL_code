/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_NoStd_2013_04_25]
  FROM     [forum].[dbo].[Pew_Question_NoStd]
/*********************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk]
         =  55
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]   IN (
                                                                    877   -- code as: 55
                                                                  , 614   -- code as: 55
                                                                  , 618   -- code as: 55
                                                                  , 848   -- code as: 55
                                                                                          )
---------------------------------------------------------------------------------------------------------
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk]
         =  56
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_pk]   IN (
                                                                    932   -- code as: 56
                                                                  , 942   -- code as: 56
                                                                  , 940   -- code as: 56
                                                                  , 943   -- code as: 56
                                                                  , 941   -- code as: 56
                                                                  , 828   -- code as: 56
                                                                  , 925   -- code as: 56
                                                                  , 918   -- code as: 56
                                                                  , 826   -- code as: 56
                                                                  , 822   -- code as: 56
                                                                  , 823   -- code as: 56
                                                                  , 935   -- code as: 56
                                                                  , 934   -- code as: 56
                                                                  , 933   -- code as: 56
                                                                  , 831   -- code as: 56
                                                                  , 926   -- code as: 56
                                                                  , 921   -- code as: 56
                                                                  , 906   -- code as: 56
                                                                  , 893   -- code as: 56
                                                                  , 923   -- code as: 56
                                                                  , 627   -- code as: 56
                                                                  , 629   -- code as: 56
                                                                  , 626   -- code as: 56
                                                                  , 638   -- code as: 56
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
                                                                    932   -- code as: 56
                                                                  , 942   -- code as: 56
                                                                  , 940   -- code as: 56
                                                                  , 943   -- code as: 56
                                                                  , 941   -- code as: 56
                                                                  , 828   -- code as: 56
                                                                  , 925   -- code as: 56
                                                                  , 918   -- code as: 56
                                                                  , 826   -- code as: 56
                                                                  , 822   -- code as: 56
                                                                  , 823   -- code as: 56
                                                                  , 935   -- code as: 56
                                                                  , 934   -- code as: 56
                                                                  , 933   -- code as: 56
                                                                  , 831   -- code as: 56
                                                                  , 926   -- code as: 56
                                                                  , 921   -- code as: 56
                                                                  , 906   -- code as: 56
                                                                  , 893   -- code as: 56
                                                                  , 923   -- code as: 56
                                                                  , 627   -- code as: 56
                                                                  , 629   -- code as: 56
                                                                  , 626   -- code as: 56
                                                                  , 638   -- code as: 56
                                                                  , 877   -- code as: 55
                                                                  , 614   -- code as: 55
                                                                  , 618   -- code as: 55
                                                                  , 848   -- code as: 55
                                                                                         )
/*********************************************************************************************************/