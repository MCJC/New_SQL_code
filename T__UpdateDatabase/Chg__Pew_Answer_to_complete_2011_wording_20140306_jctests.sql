/***********************************************************************************************************************/
/*****                                          run step by step script                                            *****/
/***********************************************************************************************************************/
/***********************************************************************************************************************/
/***                                                 *******************************************************************/
/***  run step 02 >>  remove/replace weird characts  *******************************************************************/
/***                                                 *******************************************************************/
/***********************************************************************************************************************/
USE 
            [juancarlos]
GO
/***********************************************************************************************************************/

UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , CHAR(9),' ')
WHERE 
                          [expltext] LIKE                                      '%'+CHAR(9)+'%'
GO
/*--------------------------------------------------------------------------------------------------------------- tab -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(13)+char(10), ' ')
WHERE 
                          [expltext] LIKE                                      '%'+char(13)+char(10)+'%'
GO
/*----------------------------------------------------------------------------------------------------- CR & new line -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , CHAR(10),' ')
WHERE 
                          [expltext] LIKE                                      '%'+CHAR(10)+'%'
GO
/*---------------------------------------------------------------------------------------------------------- new line -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , CHAR(13),' ')
WHERE 
                          [expltext] LIKE                                      '%'+CHAR(13)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------- CR -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(226)
                                                                                  +char(128)
                                                                                  +char(159),     char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(226)
                                                                                  +char(128)
                                                                                  +char(159)
                                                                                  +
                                                                               '%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(226)
                                                                                  +char(130)
                                                                                  +char(172),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(226)
                                                                                  +char(130)
                                                                                  +char(172)
                                                                                  +
                                                                               '%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/






UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(34)+char(153), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(34)+char(153)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(152), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(152)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(153), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(153)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(156), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(156)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(34)+char(162), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(34)+char(162)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(147), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(147)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(148), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(148)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(149), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(149)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(171), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(171)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(187), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(187)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(163), '')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(163)+'%'
GO
/*-------------------------------------------------------------------------------------------------------- [currency] -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(167), '')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(167)+'%'
GO
/*------------------------------------------------------------------------------------------------------------ [item] -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(176), 'o.')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(176)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------- o. -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(186), 'o.')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(186)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------- o. -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(137), 'E')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(137)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(141), 'I')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(141)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(147), 'O')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(147)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(150), 'O')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(150)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(160), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(160)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(161), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(161)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(162), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(162)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(163), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(163)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(164), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(164)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(165), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(165)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(167), 'c')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(167)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(168), 'e')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(168)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(169), 'e')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(169)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(170), 'e')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(170)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(173), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(173)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(174), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(174)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(175), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(175)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(177), 'n')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(177)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(179), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(179)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(180), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(180)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(181), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(181)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(182), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(182)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(186), 'u')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(186)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(187), 'u')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(187)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(188), 'u')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(188)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(135), 'c')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(135)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(141), 'c')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(141)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(159), 'g')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(159)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(176), 'I')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(176)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(177), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(177)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(130), 'l')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(130)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(159), 's')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(159)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(160), 'S')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(160)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(161), 's')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(161)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(35),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(35)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(42),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(42)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(128),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(128)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(130),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(130)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(166),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(166)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195), 'A')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(226),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(226)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(156),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(156)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(157),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(157)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(162),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(162)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(146), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(146)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(147), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(147)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(148), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(148)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(149), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(149)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(150), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(150)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(152), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(152)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(153), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(153)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/









UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , CHAR(39),'')
WHERE 
                          [expltext] LIKE                                      '%'+CHAR(39)+'%'
GO
/*-----------------------------------------------------------------------------------------------------------------  apostrophe for test */
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( [expltext] , CHAR(34),'')
WHERE 
                          [expltext] LIKE                '%'+CHAR(34)+'%'
GO
/*-----------------------------------------------------------------------------------------------------------------  quotation marks     */
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( [expltext] , CHAR(46),'')
WHERE 
                          [expltext] LIKE                '%'+CHAR(46)+'%'
GO
/*-----------------------------------------------------------------------------------------------------------------  dots               */
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( [expltext] , CHAR(124),'')
WHERE 
                          [expltext] LIKE                '%'+CHAR(124)+'%'
GO
/*-----------------------------------------------------------------------------------------------------------------  bar                */
UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( [expltext] , CHAR(63),'')
WHERE 
                          [expltext] LIKE                '%'+CHAR(63)+'%'
GO
/*-----------------------------------------------------------------------------------------------------------------  interrogation mark */

UPDATE
                          [MYT]
SET
                          [expltext] = REPLACE( [expltext] , CHAR(32),'')
WHERE 
                          [expltext] LIKE                '%'+CHAR(32)+'%'
GO
/*-----------------------------------------------------------------------------------------------------------------  interrogation mark */

