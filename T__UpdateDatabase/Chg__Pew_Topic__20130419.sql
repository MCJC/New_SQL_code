/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Topic_2013_04_19]
  FROM     [forum].[dbo].[Pew_Topic]
/*********************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Topic]
SET
           [forum].[dbo].[Pew_Topic].[Display] = 0
WHERE
           [forum].[dbo].[Pew_Topic].[Topic_pk] IN
                                                  (   
                                                     30   -- Beliefs & Practices | Belief in Afterlife
                                                   , 32   -- Beliefs & Practices | Belief in Supernatural
                                                   , 33   -- Beliefs & Practices | Ceremonies/Rituals
                                                   , 34   -- Beliefs & Practices | Conversion/Switching
                                                   , 35   -- Beliefs & Practices | End Times
                                                   , 38   -- Beliefs & Practices | Proselytizing/Sharing Faith
                                                   , 39   -- Beliefs & Practices | Religious Texts & Other Media
                                                   , 40   -- Beliefs & Practices | Spiritual Experiences
                                                   , 42   -- Beliefs & Practices | Other Beliefs & Practices
                                                   , 43   -- Culture & Society  | Abortion
                                                   , 44   -- Culture & Society  | Contraception
                                                   , 46   -- Culture & Society  | Evolution
                                                   , 49   -- Culture & Society  | Homosexuality
                                                   , 50   -- Culture & Society  | Life Satisfaction
                                                   , 54   -- Culture & Society  | Poverty & Economics
                                                   , 57   -- Culture & Society  | Youth/Children
                                                   , 58   -- Culture & Society  | Other Culture & Society
                                                   , 59   -- Interfaith Relations | Interfaith Tensions
                                                   , 62   -- Interfaith Relations | Religious Knowledge
                                                   , 63   -- Interfaith Relations | Views of Other Faiths
                                                   , 73   -- Politics & Government | Other Politics & Government
                                                   , 66   -- Politics & Government | Political Ideology
                                                   , 65   -- Politics & Government | Political Leaders
                                                   , 67   -- Politics & Government | Religion in Elections
                                                   , 68   -- Politics & Government | Religious Dress
                                                   , 69   -- Politics & Government | Religious Education
                                                   , 71   -- Politics & Government | Religious Leaders
                                                        )


/*********************************************************************************************************/
-- check results
SELECT *
FROM
           [forum].[dbo].[Pew_Topic]
WHERE
           [forum].[dbo].[Pew_Topic].[Topic_pk] IN
                                                  (   
                                                     30   -- Beliefs & Practices | Belief in Afterlife
                                                   , 32   -- Beliefs & Practices | Belief in Supernatural
                                                   , 33   -- Beliefs & Practices | Ceremonies/Rituals
                                                   , 34   -- Beliefs & Practices | Conversion/Switching
                                                   , 35   -- Beliefs & Practices | End Times
                                                   , 38   -- Beliefs & Practices | Proselytizing/Sharing Faith
                                                   , 39   -- Beliefs & Practices | Religious Texts & Other Media
                                                   , 40   -- Beliefs & Practices | Spiritual Experiences
                                                   , 42   -- Beliefs & Practices | Other Beliefs & Practices
                                                   , 43   -- Culture & Society  | Abortion
                                                   , 44   -- Culture & Society  | Contraception
                                                   , 46   -- Culture & Society  | Evolution
                                                   , 49   -- Culture & Society  | Homosexuality
                                                   , 50   -- Culture & Society  | Life Satisfaction
                                                   , 54   -- Culture & Society  | Poverty & Economics
                                                   , 57   -- Culture & Society  | Youth/Children
                                                   , 58   -- Culture & Society  | Other Culture & Society
                                                   , 59   -- Interfaith Relations | Interfaith Tensions
                                                   , 62   -- Interfaith Relations | Religious Knowledge
                                                   , 63   -- Interfaith Relations | Views of Other Faiths
                                                   , 73   -- Politics & Government | Other Politics & Government
                                                   , 66   -- Politics & Government | Political Ideology
                                                   , 65   -- Politics & Government | Political Leaders
                                                   , 67   -- Politics & Government | Religion in Elections
                                                   , 68   -- Politics & Government | Religious Dress
                                                   , 69   -- Politics & Government | Religious Education
                                                   , 71   -- Politics & Government | Religious Leaders
                                                        )
/*********************************************************************************************************/

