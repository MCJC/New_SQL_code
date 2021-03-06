-----------------------------------------------------------------------------
IF OBJECT_ID
         (N'[Stacy].[dbo].[Question_Topic__longer_and_editable]', N'U') IS NOT NULL
DROP TABLE
            [Stacy].[dbo].[Question_Topic__longer_and_editable]
GO
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
SELECT 
       [row]                             = ROW_NUMBER()OVER(ORDER BY
                                                                       [Topic_sorting]
                                                                     , [SubTopic_Sorting]
                                                                     , [SubTopic_Priority_order]
                                                                     , [Question_topic_pk]
                                                                                                  )
      ,[main_fk]                         = [Question_topic_pk]
      ,[Topic]
      ,[SubTopic]
      ,[Question_short_wording_std]
      ,[Topic_Priority_order]            = 0
      ,[SubTopic_Priority_order]
      ,[Topic_sorting_provisional]       = RANK()OVER (PARTITION BY [Topic]
                                                           ORDER BY [Topic_sorting]
                                                                     , [SubTopic_Sorting]
                                                                  , [SubTopic_Priority_order]
                                                                  , [Question_topic_pk]    )
      ,[Topic_sorting]
      ,[SubTopic_Sorting]
      ,[Display]
-----------------------------------------------------------------------------
INTO
       [Stacy].[dbo].[Question_Topic__longer_and_editable]
-----------------------------------------------------------------------------
  FROM
       [forum].[dbo].[Pew_Question_Topic]
JOIN
       [forum].[dbo].[Pew_Question_Std]  
ON
       [Question_Std_fk]
      =[Question_Std_pk]
JOIN
       [forum].[dbo].[Pew_Topic]
ON
       [Topic_fk]
      =[Topic_pk]
JOIN
    (
       SELECT 
             [MT]  =  [Topic]
            ,[ST]  =  [SubTopic]
            ,[QAS] =  [Question_abbreviation_std]
        FROM [forum].[dbo].[vi_Topic&Question_Displayable]
                                                            ) CRR
ON           [MT]  =  [Topic]
AND          [ST]  =  [SubTopic]
AND          [QAS] =  [Question_abbreviation_std]
