/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_Std_2013_04_19]
  FROM     [forum].[dbo].[Pew_Question_Std]
/*********************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
SET
           [forum].[dbo].[Pew_Question_Std].[Question_wording_std]
         =  'How concerned, if at all, are you about extremist religious groups in our country these days? '
          + 'Are you very concerned, somewhat concerned, not too concerned or not at all concerned about ex'
          + 'tremist religious groups? And are you mostly concerned about Muslim extremist groups or Christ'
          + 'ian extremist groups?'  
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]           = 279
     AND      
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] = 'SVYc_0003'
---------------------------------------------------------------------------------------------------------
UPDATE
           [forum].[dbo].[Pew_Question_Std]
SET
           [forum].[dbo].[Pew_Question_Std].[Question_wording_std]
         =  '2012 wording: [ASK IF MUSLIM:] On average, how often do you attend the mosque for salah and Ju'
          + 'm''ah prayer? More than once a week, once a week for Jum''ah prayer, once or twice a month, a '
          + 'few times a year, especially for the Eid, seldom or never? [ASK IF NOT MUSLIM:] Aside from wed'
          + 'dings and funerals how often do you attend religious services? More than once a week, once a w'
          + 'eek, once or twice a month, a few times a year, seldom, or never? 2010 wording: [ASK IF MUSLIM'
          + ':] On average, how often do you attend the mosque or Islamic Center for salah and Jum''ah pray'
          + 'er? [ASK IF NOT MUSLIM:] Aside from weddings and funerals how often do you attend religious se'
          + 'rvices? More than once a week, once a week, once or twice a month, a few times a year, seldom,'
          + ' or never?'
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]           = 340
     AND      
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] = 'SVYc_0064'
---------------------------------------------------------------------------------------------------------
UPDATE
           [forum].[dbo].[Pew_Question_Std]
SET
           [forum].[dbo].[Pew_Question_Std].[Question_wording_std]
         =  'Do you favor or oppose making sharia law, or Islamic law, the official law of the land in our '
          + 'country? Should both Muslims and non-Muslims in our country be subject to the sharia, or shoul'
          + 'd the sharia only be applied to Muslims?'
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]           = 498
     AND      
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] = 'SVYu_0184'
/*********************************************************************************************************/
-- check results
SELECT 
       [Question_Std_pk]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
FROM
           [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]           = 279
     OR
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] = 'SVYc_0003'
     OR
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]           = 340
     OR
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] = 'SVYc_0064'
     OR
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]           = 498
     OR
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] = 'SVYu_0184'
/*********************************************************************************************************/

