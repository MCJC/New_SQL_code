/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Topic_2013_02_13]
  FROM     [forum].[dbo].[Pew_Topic]
/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_Topic_2013_02_13]
  FROM     [forum].[dbo].[Pew_Question_Topic]
/*********************************************************************************************************/
-- 1)	Rows 430/431
--      These questions are really similar, if we cannot make them the same question,
--      I think we need to hide one from showing.
--      Can the survey folks confirm this is ok and select which one they’d rather show?


/*********************************************************************************************************/
-- 2)	How does the featured question at the top of each page get selected? None of them are pulling from the right subtopics and the heading “Featured Religious Relations Survey Question” doesn’t change and isn’t accurate for any of the subtopics. Maybe we should just do away with that?

-- 3)	Some of our survey questions use terms people might not be familiar with (e.g., Hadith, Sunna, salah, jinn). I suppose we can just include a footnote on the resulting Explorer page that points people to the relevant glossary in the report for a definition?

-- 4)	“Other Culture & Society” appears twice on http://dev1.pewresearch.org/questions/ 


/*********************************************************************************************************/
-- 5)	“Interfaith Tolerance” should not be a subtopic anymore.
--      Because “Interfaith Tensions” and “Interfaith Tolerance” are opposite sides of the same coin,
--      the same exact questions would appear in both. For now, we’ll use “Interfaith Tensions” for all those questions.
--      Coincidentally, the three questions that were coded as “Interfaith Tolerance” fit more in “Other Interfaith Relations” anyway,
--      so I’ve indicated that in the spreadsheet.


DELETE FROM [forum].[dbo].[Pew_Topic]
WHERE
            [forum].[dbo].[Pew_Topic].[Topic_pk] = 60

DELETE FROM [forum].[dbo].[Pew_Question_Topic]
WHERE
            [forum].[dbo].[Pew_Question_Topic].[Topic_fk] = 60


select *  FROM [forum].[dbo].[Pew_Question_Topic]
WHERE
            [forum].[dbo].[Pew_Question_Topic].[Topic_fk] = 60


Topic_pk	Topic_sorting	SubTopic_Sorting	Topic	SubTopic	Display
60	4	2	Interfaith Relations	Interfaith Tolerance	1



-- Update from Stacy's table:
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
           [forum].[dbo].[Pew_Data_Source].[Source_Display_Name]
       =                             clone.[Source_Display_Name]
     --,
     --      [forum].[dbo].[Pew_Footnote].[About_the_Data_link]
     --  =                          clone.[About_the_Data_link]
FROM
          [forum].[dbo].[Pew_Data_Source]   AS mydbt
 JOIN
        [Stacy's].[dbo].[Pew_Data_Source]   AS clone

ON
           mydbt.[Data_source_pk]
       =   clone.[Data_source_pk]

/*********************************************************************************************************/
-- check results
SELECT * FROM    [forum].[dbo].[Pew_Data_Source]
SELECT * FROM  [Stacy's].[dbo].[Pew_Data_Source]
/*********************************************************************************************************/

