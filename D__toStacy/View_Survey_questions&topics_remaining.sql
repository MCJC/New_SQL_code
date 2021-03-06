USE [Stacy's]
GO
/*****************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************************************************************/
IF OBJECT_ID ('MissingSubTopics', 'V') IS NOT NULL
  DROP VIEW    MissingSubTopics;
GO
CREATE VIEW    MissingSubTopics
AS
/*****************************************************************************************************************************************************/
SELECT
       ROW_NUMBER() OVER(ORDER BY   
                                  [Topic_fk]
                                 ,[Topic]
                                 ,[SubTopic]
                                 ,[Display]
                                              ) AS RowID
      ,[Topic_fk] = CASE WHEN [Topic_fk] = 99999 THEN NULL
                         ELSE [Topic_fk]
                         END
      ,[Topic_pk]
      ,[Question_Std_fk]
      ,[Topic]
      ,[SubTopic]
      ,[Topic_sorting]
      ,[SubTopic_Sorting]
      ,[Priority_order]
      ,[Display]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
FROM
(
SELECT
       [Topic_fk] = CASE WHEN [Topic_fk] IS NULL THEN 99999
                         ELSE [Topic_fk]
                         END
      ,[Topic_pk]
      ,[Question_Std_fk]
      ,[Topic]
      ,[SubTopic]
      ,[Topic_sorting]
      ,[Priority_order]
      ,[SubTopic_Sorting]
      ,[Display]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
FROM
(
SELECT *
  FROM
         [forum].[dbo].[Pew_Question_Std]
       , [forum].[dbo].[Pew_Question_Topic]
WHERE
         [Question_Std_fk]
       = [Question_Std_pk]
  AND
         [Question_abbreviation_std]
                     IN (   
                            'SVYc_0029'   --  How important is religion in your life | Beliefs and practices
                          , 'SVYc_0033'   --  How often do you pray | Beliefs and practices
                          , 'SVYc_0064'   --  How often do you attend religious services | Beliefs and practices
                          , 'SVYc_0011'   --  Do you believe in one god, Allah and his Prophet Muhammad | Beliefs and practices
                          , 'SVYc_0040'   --  Moral acceptability of divorce | Culture and society
                          , 'SVYu_0168'   --  Moral acceptability of family planning | Culture and society
                          , 'SVYc_0043'   --  Moral acceptability of homosexuality | Culture and society
                          , 'SVYc_0044'   --  Belief in God and morality | Culture and society
                          , 'SVYu_0189'   --  Veiling | Culture and society
                          , 'SVYu_0198'   --  Inheritence rights  | Culture and society
                          , 'SVYc_0019'   --  Like western pop culture | Culture and society
                          , 'SVYc_0024'   --  Western pop culture hurts morality | Culture and society
                          , 'SVYu_0032'   --  Evolution | Culture and society
                          , 'SVYu_0004'   --  Shia-Sunni tensions | Inter-faith relations
                          , 'SVYu_0003'   --  Tensions between more devout and less devout Muslims | Inter-faith relations
                          , 'SVYc_0061'   --  How free are people of other faiths | Inter-faith relations
                          , 'SVYc_0062'   --  How free are people of other faiths/good thing, bad thing | Inter-faith relations
                          , 'SVYc_0054'   --  Sharia/Bible as law of the land | Politics and government
                          , 'SVYu_0185'   --  Ways to interpret sharia | Politics and government
                          , 'SVYu_0184'   --  Sharia apply to both Muslims and non-Muslims | Politics and government
                          , 'SVYu_0181'   --  Biblical law apply to both Christians and non-Christians | Politics and government
                          , 'SVYc_0015'   --  Cutting hands | Politics and government
                          , 'SVYc_0017'   --  Stoning | Politics and government
                          , 'SVYc_0018'   --  Death penalty for apostates | Politics and government
                          , 'SVYc_0016'   --  Religious judges | Politics and government
                          , 'SVYc_0059'   --  Democracy | Politics and government
                          , 'SVYu_0002'   --  Suicide bombing | Politics and government
                          , 'SVYc_0027'   --  Concern about extremism | Politics and government
                          , 'SVYc_0003'   --  Concerned about Muslim or Christian groups | Politics and government
                                        )
)  q1         
RIGHT JOIN

         [forum].[dbo].[Pew_Topic]
   q2
    ON
         [Topic_fk]
       = [Topic_pk]
WHERE
         [Topic] != 'Restrictions on Religion'
  and
         [Topic] != 'Population Characteristics'
) T1
