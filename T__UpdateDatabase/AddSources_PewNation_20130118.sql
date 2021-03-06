/***********************************************************************************************************/
--ALTER TABLE [forum].[dbo].[Pew_Nation]
--DROP COLUMN MainSources

/***********************************************************************************************************/
-- First, add field and make default value to string
ALTER TABLE [forum].[dbo].[Pew_Nation]
ADD MainSources VARCHAR(80) NULL

/***********************************************************************************************************/
-- After previous command is performed, run this
UPDATE      [forum].[dbo].[Pew_Nation]
   SET      [forum].[dbo].[Pew_Nation].[MainSources]                  =  'United Nations, '
                                                                       + 'World Religion Database'

/***********************************************************************************************************/
-- After previous command is performed, run this
UPDATE      [forum].[dbo].[Pew_Nation]
   SET      [forum].[dbo].[Pew_Nation].[MainSources]                  =  'United Nations, '
                                                                       + 'World Religion Database, '
                                                                       + 'Encyclopedia Britannica'
 WHERE      [forum].[dbo].[Pew_Nation].[Source_Adult_Literacy_Pct] like  '%Britanni%'

/***********************************************************************************************************/



SELECT *
  FROM [forum].[dbo].[Pew_Nation]