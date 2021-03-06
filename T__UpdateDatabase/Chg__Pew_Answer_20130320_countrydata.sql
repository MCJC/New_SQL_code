/*********************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Answer_2013_03_20_country]
  FROM      [forum].[dbo].[Pew_Answer]
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Nation_Answer_2013_03_20_country]
  FROM      [forum].[dbo].[Pew_Nation_Answer]
/*********************************************************************************************************/
SELECT *
  INTO [juancarlos].[dbo].[Pew_Answer]
  FROM      [forum].[dbo].[Pew_Answer]
SELECT *
  INTO [juancarlos].[dbo].[Pew_Nation_Answer]
  FROM      [forum].[dbo].[Pew_Nation_Answer]
/*********************************************************************************************************/

-- Step 01
-- Correct wrong values
UPDATE
                [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
                [forum].[dbo].[Pew_Answer].[Answer_value]    = 1                              -- DB name
         ,      [forum].[dbo].[Pew_Answer].[Question_fk]     = 1080                           -- DB name
         ,      [forum].[dbo].[Pew_Answer].[Answer_wording]  = 'On Sept. 6, Seoul immigratio' -- DB name
          + 'n authorities, accompanied by local police, forced their way into the home of t'
          + 'wo Falun Gong practitioners of Chinese nationality, 26-year-old Mr. Jin and his'
          + ' wife Ms. Ma. They arrested the couple for lacking legal status after their app'
          + 'lications for asylum had been denied. [¦] It is a signatory of the UN Convent'
          + 'ion Against Torture, whose Article 3 says in part,    No State Party shall expe'
          + 'l, return (rrefouler) or extradite a person to another State where there ar'
          + 'e substantial grounds for believing that he would be in danger of being subject'
          + 'ed to torture. [¦] The Korean Falun Dafa Association (KFDA) has in the past s'
          + 'tated that the deportations from South Korea to China are due to their governme'
          + 'nt bending to pressure from the Chinese regime. A KDFA statement, released on J'
          + 'an. 24 and issued following the sudden deportation of three Falun Gong practiti'
          + 'oners to China, links the South Korean policy of deportation to visits by two C'
          + 'hinese officials. (HRWF 2011) [Immigrants are in the country, Chinese governmen'
          + 't is outside.] (Coder note)'
         ,      [forum].[dbo].[Pew_Answer].[answer_wording_std]  = 'Yes'                      -- DB name
WHERE
                [forum].[dbo].[Pew_Answer].[Answer_pk]    = 10438                             -- DB name
-- Delete corresponding numeric value from the Nation_Answer table
DELETE FROM 
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
--SELECT*FROM      [forum].[dbo].[Pew_Nation_Answer]
WHERE
                 [forum].[dbo].[Pew_Nation_Answer].[Answer_fk] = 10405                        -- DB name
AND
                 [forum].[dbo].[Pew_Nation_Answer].[Nation_fk] =   194                        -- DB name

/*********************************************************************************************************/

-- Step 02
-- drop text answers of 
--                      GRX_25_01_text
--                      SHX_27_01_text
--                                     because they are meaningless

DELETE FROM 
                 [forum].[dbo].[Pew_answer]                                                   -- DB name
WHERE
                 [forum].[dbo].[Pew_answer].[Question_fk] IN                                  -- DB name
                                                           (417, 497)

/*********************************************************************************************************/

-- Step 03
-- drop answer rows when they:
--                              1. have empty [answer_wording] and NULL [answer_wording_std]
--                              2. correspond to text variables questions abbreviation ending int "text"
--                              3. they correspond to answers in value 0 or are missing for answers in value 1

DELETE
                 [forum].[dbo].[Pew_Answer]                                                   -- DB name
FROM
--SELECT * FROM
                 [forum].[dbo].[Pew_Answer]                                                   -- DB name
LEFT OUTER JOIN
                 (
                      SELECT  
                               distinct
                               A.[Answer_pk]
                             , Q.[Question_abbreviation_std]
                        FROM [forum].[dbo].[Pew_Answer]            A
                            ,[forum].[dbo].[Pew_Question]          Q
                            ,[forum].[dbo].[Pew_Nation_Answer]     KN
                      WHERE Q.[Question_pk]                   =  A.[Question_fk]
                        AND A.[Answer_pk]                     = KN.[Answer_fk]
                        AND Q.[Question_abbreviation_std]     LIKE '%text'
                        AND Answer_wording                    =    ''
                        AND answer_wording_std                IS   NULL
                        AND A.Answer_pk                       IN   (
                                                                      3476
                                                                    , 3518
                                                                    , 3878
                                                                    , 3923
                                                                  )
                 )                                                                    A
ON
                 [forum].[dbo].[Pew_Answer].[Answer_pk]                                       -- DB name
          =                               A.[Answer_pk]
WHERE                                     A.[Answer_pk]   IS NOT NULL

/*********************************************************************************************************/

-- Step 04
-- drop 1K rows from nation-asnwer linking table where
-- answers have been deleted & links are not needed any more

DELETE
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
FROM
--SELECT distinct answer_fk FROM  -- 19 DISTINCT, 1000 ROWS
--SELECT *                  FROM  -- 19 DISTINCT, 1000 ROWS
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
LEFT OUTER JOIN
                 [forum].[dbo].[Pew_Answer]                 A                                 -- DB name
ON
                 [forum].[dbo].[Pew_Nation_Answer].[Answer_fk]
          =                                      A.[Answer_pk]
WHERE                                            A.[Answer_pk]   IS NULL

--> nation answer link should be consistent

/*********************************************************************************************************/

-- Step 05
-- attach answer values, standard wording, and question keys to corresponding answers (country level)
UPDATE
           [juancarlos].[dbo].[Pew_Answer]                                                    -- DB name
SET
           [juancarlos].[dbo].[Pew_Answer].[Answer_value]                                     -- DB name
       =                             toolT.[Answer_value]
     ,
           [juancarlos].[dbo].[Pew_Answer].[Answer_wording_std]                               -- DB name
       =                             toolT.[Answer_wording_std]
     ,
           [juancarlos].[dbo].[Pew_Answer].[Question_fk]                                      -- DB name
       =                             toolT.[Question_fk]
FROM
--select * from
           [juancarlos].[dbo].[Pew_Answer]   AS mydbt                                         -- DB name
 JOIN
       (
          SELECT 
                  Answer_pk                    = TT.[Answer_fk]
                , Answer_value                 = VV.[Answer_value]
                , Question_fk                  = VV.[Question_fk]
                , Answer_wording               = TT.[Answer_wording]
                , Answer_wording_std           = VV.[answer_wording_std]
          FROM
          /****************************************************************************************************/
          (
          SELECT 
                  level                      = 'Ctry'
                , Answer_fk                  = A.[Answer_pk]
                , Answer_value               = A.[Answer_value]
                , Answer_wording             = A.[Answer_wording]
                , answer_wording_std         = A.[answer_wording_std]
                , Question_fk                = Q.[Question_pk]
                , Question_abbreviation_std  = Q.[Question_abbreviation_std]
                , Question_abbreviation      = Q.[Question_abbreviation]
                , Question_wording           = Q.[Question_wording]
                , Data_source_fk             = Q.[Data_source_fk]
                , Question_Year              = Q.[Question_Year]
                , Short_wording              = Q.[Short_wording]
                , Notes                      = Q.[Notes]
                , Default_response           = Q.[Default_response]
                , Question_wording_std       = Q.[Question_wording_std]
                , Question_short_wording_std = Q.[Question_short_wording_std]
                , Nation_fk                  = KN.[Nation_fk]
                , link_fk                    = KN.[Nation_answer_pk]
            FROM [juancarlos].[dbo].[Pew_Answer]            A                                 -- DB name
                ,     [forum].[dbo].[Pew_Question]          Q                                 -- DB name
                ,[juancarlos].[dbo].[Pew_Nation_Answer]     KN                                -- DB name
          WHERE Q.[Question_pk] =  A.[Question_fk]
            AND A.[Answer_pk]   = KN.[Answer_fk]
            AND Q.[Question_abbreviation_std]     LIKE '%text'
          ) TT
          /****************************************************************************************************/
          join
          /****************************************************************************************************/
          (
          SELECT 
                  level                      = 'Ctry'
                , Answer_fk                  = A.[Answer_pk]
                , Answer_value               = A.[Answer_value]
                , Answer_wording             = A.[Answer_wording]
                , answer_wording_std         = A.[answer_wording_std]
                , Question_fk                = Q.[Question_pk]
                , Question_abbreviation_std  = Q.[Question_abbreviation_std]
                , Question_abbreviation      = Q.[Question_abbreviation]
                , Question_wording           = Q.[Question_wording]
                , Data_source_fk             = Q.[Data_source_fk]
                , Question_Year              = Q.[Question_Year]
                , Short_wording              = Q.[Short_wording]
                , Notes                      = Q.[Notes]
                , Default_response           = Q.[Default_response]
                , Question_wording_std       = Q.[Question_wording_std]
                , Question_short_wording_std = Q.[Question_short_wording_std]
                , Nation_fk                  = KN.[Nation_fk]
                , link_fk                    = KN.[Nation_answer_pk]
            FROM [juancarlos].[dbo].[Pew_Answer]            A                                 -- DB name
                ,     [forum].[dbo].[Pew_Question]          Q                                 -- DB name
                ,[juancarlos].[dbo].[Pew_Nation_Answer]     KN                                -- DB name
          WHERE Q.[Question_pk] =  A.[Question_fk]
            AND A.[Answer_pk]   = KN.[Answer_fk]
            AND Q.[Question_abbreviation_std] NOT LIKE '%text'
          ) VV
          /****************************************************************************************************/
          ON 
                  VV.Nation_fk
                = TT.Nation_fk
          AND
                  VV.Question_Year
                = TT.Question_Year
          AND
                            VV.Question_abbreviation_std
                = SUBSTRING(TT.Question_abbreviation_std,1, 9)
       ) AS toolT
ON
           mydbt.Answer_pk
       =   toolT.Answer_pk

/*********************************************************************************************************/

-- Step 06
-- drop text link to answers whose text has already been attached to the value

DELETE FROM 
            [juancarlos].[dbo].[Pew_Nation_Answer]                                            -- DB name
WHERE
            [juancarlos].[dbo].[Pew_Nation_Answer].[Nation_answer_pk] IN                      -- DB name
                                                           (
                                                             42095
                                                           , 42535
                                                           , 42887
                                                           , 42975
                                                           , 43239
                                                           , 44031
                                                           , 44383
                                                           , 45175
                                                           , 45527
                                                           , 45791
                                                           , 46055
                                                           , 46143
                                                           , 46847
                                                           , 47023
                                                           , 47111
                                                           , 47815
                                                           , 47991
                                                           , 48079
                                                           , 48871
                                                           , 49487
                                                           , 50191
                                                           , 50807
                                                           , 51775
                                                           , 52127
                                                           , 52391
                                                           , 52831
                                                           , 53095
                                                           , 53447
                                                           , 53623
                                                           , 54063
                                                           , 54503
                                                           , 55119
                                                           , 55823
                                                           , 56615
                                                           , 57671
                                                           , 58727
                                                           , 58991
                                                           , 59079
                                                           , 59167
                                                           , 41921
                                                           , 42097
                                                           , 42449
                                                           , 42537
                                                           , 42625
                                                           , 42977
                                                           , 43417
                                                           , 43505
                                                           , 44121
                                                           , 44297
                                                           , 44385
                                                           , 45353
                                                           , 45529
                                                           , 45617
                                                           , 45793
                                                           , 46057
                                                           , 46145
                                                           , 46321
                                                           , 46585
                                                           , 46761
                                                           , 46849
                                                           , 46937
                                                           , 47025
                                                           , 47113
                                                           , 47905
                                                           , 48873
                                                           , 49313
                                                           , 49489
                                                           , 49753
                                                           , 50105
                                                           , 50193
                                                           , 50721
                                                           , 50809
                                                           , 50897
                                                           , 52041
                                                           , 52129
                                                           , 52481
                                                           , 52657
                                                           , 52833
                                                           , 52921
                                                           , 53009
                                                           , 53097
                                                           , 53449
                                                           , 54505
                                                           , 55121
                                                           , 55737
                                                           , 56529
                                                           , 56617
                                                           , 57057
                                                           , 57321
                                                           , 57849
                                                           , 58377
                                                           , 58729
                                                           , 41964
                                                           , 42052
                                                           , 42140
                                                           , 43284
                                                           , 43812
                                                           , 44076
                                                           , 44780
                                                           , 45572
                                                           , 46188
                                                           , 46628
                                                           , 46716
                                                           , 46804
                                                           , 47068
                                                           , 47156
                                                           , 47684
                                                           , 47948
                                                           , 49884
                                                           , 50588
                                                           , 50676
                                                           , 51116
                                                           , 51820
                                                           , 52172
                                                           , 52436
                                                           , 52524
                                                           , 52876
                                                           , 52964
                                                           , 53140
                                                           , 53492
                                                           , 54548
                                                           , 54724
                                                           , 55164
                                                           , 55340
                                                           , 56660
                                                           , 57364
                                                           , 57628
                                                           , 57716
                                                           , 57892
                                                           , 59036
                                                           , 59124
                                                           , 59212
                                                           , 59300
                                                           , 41966
                                                           , 42142
                                                           , 42230
                                                           , 42494
                                                           , 42670
                                                           , 42846
                                                           , 43022
                                                           , 43110
                                                           , 43286
                                                           , 43638
                                                           , 44518
                                                           , 44782
                                                           , 44870
                                                           , 45398
                                                           , 45574
                                                           , 45662
                                                           , 45838
                                                           , 46190
                                                           , 46278
                                                           , 46630
                                                           , 46806
                                                           , 46894
                                                           , 46982
                                                           , 47070
                                                           , 47158
                                                           , 47598
                                                           , 47686
                                                           , 48918
                                                           , 49798
                                                           , 50062
                                                           , 50238
                                                           , 50766
                                                           , 50854
                                                           , 51030
                                                           , 51734
                                                           , 51822
                                                           , 52174
                                                           , 52262
                                                           , 52438
                                                           , 52526
                                                           , 53142
                                                           , 53494
                                                           , 53582
                                                           , 54462
                                                           , 54902
                                                           , 55518
                                                           , 55782
                                                           , 56574
                                                           , 56662
                                                           , 57102
                                                           , 57366
                                                           , 57718
                                                           , 57894
                                                           , 59038
                                                           , 59302
                                                           , 64116
                                                           , 64144
                                                           , 64460
                                                           , 64544
                                                           , 64639
                                                           , 65015
                                                           , 66559
                                                           , 66640
                                                           , 66695
                                                           , 67343
                                                           , 67402
                                                           , 67858
                                                           , 68074
                                                           , 68248
                                                           , 68274
                                                           , 69206
                                                           , 70435
                                                           , 70746
                                                           , 70936
                                                           , 70979
                                                           , 71636
                                                           , 71718
                                                           , 71883
                                                           , 71991
                                                           , 72059
                                                           , 72527
                                                           , 72599
                                                           , 72644
                                                           , 72867
                                                           , 72955
                                                           , 72994
                                                           , 73323
                                                           , 73473
                                                           , 73617
                                                           , 73639
                                                           , 73752
                                                           , 73833
                                                           , 74181
                                                           , 74721
                                                           , 74964
                                                           , 75693
                                                           , 76206
                                                           , 76525
                                                           , 77002
                                                           , 77156
                                                           , 77383
                                                           , 78938
                                                           , 79192
                                                           , 79291
                                                           , 79382
                                                           , 63507
                                                           , 63695
                                                           , 63740
                                                           , 64030
                                                           , 64117
                                                           , 64210
                                                           , 64461
                                                           , 64640
                                                           , 64775
                                                           , 64792
                                                           , 65016
                                                           , 65486
                                                           , 65693
                                                           , 66696
                                                           , 66840
                                                           , 67103
                                                           , 67344
                                                           , 67434
                                                           , 67587
                                                           , 68075
                                                           , 68154
                                                           , 68249
                                                           , 68275
                                                           , 69122
                                                           , 69207
                                                           , 70296
                                                           , 70747
                                                           , 70980
                                                           , 71172
                                                           , 71637
                                                           , 71719
                                                           , 72060
                                                           , 72528
                                                           , 72600
                                                           , 72868
                                                           , 72995
                                                           , 73324
                                                           , 73437
                                                           , 73618
                                                           , 73640
                                                           , 73753
                                                           , 73834
                                                           , 74079
                                                           , 74182
                                                           , 74641
                                                           , 74722
                                                           , 74965
                                                           , 75289
                                                           , 75375
                                                           , 75550
                                                           , 76056
                                                           , 76354
                                                           , 76526
                                                           , 76759
                                                           , 77542
                                                           , 78168
                                                           , 78939
                                                           , 79193
                                                           , 79292
                                                           , 79391
                                                           , 63696
                                                           , 63779
                                                           , 64211
                                                           , 68276
                                                           , 71173
                                                           , 71720
                                                           , 72061
                                                           , 79194
                                                           , 79392
                                                           , 63509
                                                           , 63697
                                                           , 64212
                                                           , 64547
                                                           , 65695
                                                           , 68077
                                                           , 70914
                                                           , 71994
                                                           , 72530
                                                           , 72870
                                                           , 73262
                                                           , 73439
                                                           , 73836
                                                           , 75291
                                                           , 75556
                                                           , 79195
                                                           , 79393
                                                           , 64464
                                                           , 64643
                                                           , 64795
                                                           , 65019
                                                           , 66563
                                                           , 66644
                                                           , 66699
                                                           , 66843
                                                           , 67347
                                                           , 67437
                                                           , 68078
                                                           , 68252
                                                           , 68278
                                                           , 69125
                                                           , 69210
                                                           , 70439
                                                           , 70915
                                                           , 70940
                                                           , 71175
                                                           , 72063
                                                           , 72648
                                                           , 72998
                                                           , 73440
                                                           , 73477
                                                           , 73621
                                                           , 73643
                                                           , 73756
                                                           , 73837
                                                           , 74082
                                                           , 74185
                                                           , 74968
                                                           , 75557
                                                           , 76210
                                                           , 77006
                                                           , 77430
                                                           , 78942
                                                           , 79295
                                                           , 79394
                                                           , 63744
                                                           , 64034
                                                           , 64121
                                                           , 64465
                                                           , 64796
                                                           , 64951
                                                           , 65697
                                                           , 66700
                                                           , 66844
                                                           , 67107
                                                           , 67438
                                                           , 67591
                                                           , 68158
                                                           , 69211
                                                           , 70300
                                                           , 70916
                                                           , 70941
                                                           , 71641
                                                           , 72064
                                                           , 72999
                                                           , 74186
                                                           , 74645
                                                           , 74969
                                                           , 76060
                                                           , 76358
                                                           , 76530
                                                           , 77471
                                                           , 78172
                                                           , 63512
                                                           , 63700
                                                           , 64035
                                                           , 64122
                                                           , 64215
                                                           , 64550
                                                           , 64797
                                                           , 67888
                                                           , 68080
                                                           , 71724
                                                           , 71889
                                                           , 71997
                                                           , 72065
                                                           , 72533
                                                           , 72605
                                                           , 72873
                                                           , 73265
                                                           , 73442
                                                           , 73758
                                                           , 73839
                                                           , 74727
                                                           , 75294
                                                           , 75380
                                                           , 75559
                                                           , 75699
                                                           , 77432
                                                           , 79198
                                                           , 79396
                                                           , 64467
                                                           , 65492
                                                           , 71643
                                                           , 71725
                                                           , 71868
                                                           , 73624
                                                           , 76360
                                                           , 76532
                                                           , 78945
                                                           , 63702
                                                           , 64468
                                                           , 71726
                                                           , 73002
                                                           , 73625
                                                           , 73647
                                                           , 77164
                                                           , 68257
                                                           , 70755
                                                           , 73648
                                                           , 73761
                                                           , 75562
                                                           , 79201
                                                           , 63727
                                                           , 64597
                                                           , 64907
                                                           , 67788
                                                           , 67949
                                                           , 70046
                                                           , 70958
                                                           , 71610
                                                           , 71837
                                                           , 71931
                                                           , 72843
                                                           , 73271
                                                           , 73654
                                                           , 74036
                                                           , 74280
                                                           , 74581
                                                           , 76489
                                                           , 79139
                                                           , 63465
                                                           , 63640
                                                           , 63670
                                                           , 63728
                                                           , 63794
                                                           , 63897
                                                           , 63978
                                                           , 64060
                                                           , 64157
                                                           , 64330
                                                           , 64337
                                                           , 64500
                                                           , 64503
                                                           , 64598
                                                           , 64741
                                                           , 64986
                                                           , 65134
                                                           , 65215
                                                           , 65288
                                                           , 65439
                                                           , 65542
                                                           , 65682
                                                           , 65951
                                                           , 66105
                                                           , 66189
                                                           , 66277
                                                           , 66342
                                                           , 66475
                                                           , 66617
                                                           , 66852
                                                           , 66914
                                                           , 67015
                                                           , 67059
                                                           , 67140
                                                           , 67317
                                                           , 67419
                                                           , 67464
                                                           , 67721
                                                           , 67789
                                                           , 67895
                                                           , 67950
                                                           , 68035
                                                           , 68193
                                                           , 68304
                                                           , 68359
                                                           , 68436
                                                           , 68517
                                                           , 68598
                                                           , 68680
                                                           , 68760
                                                           , 68855
                                                           , 68894
                                                           , 69023
                                                           , 69091
                                                           , 69165
                                                           , 69246
                                                           , 69570
                                                           , 69894
                                                           , 69994
                                                           , 70159
                                                           , 70218
                                                           , 70316
                                                           , 70352
                                                           , 70386
                                                           , 70542
                                                           , 70706
                                                           , 70758
                                                           , 70866
                                                           , 70959
                                                           , 71054
                                                           , 71140
                                                           , 71211
                                                           , 71352
                                                           , 71433
                                                           , 71533
                                                           , 71611
                                                           , 71687
                                                           , 71797
                                                           , 71932
                                                           , 72018
                                                           , 72162
                                                           , 72243
                                                           , 72486
                                                           , 72574
                                                           , 72745
                                                           , 72914
                                                           , 73015
                                                           , 73080
                                                           , 73159
                                                           , 73305
                                                           , 73384
                                                           , 73655
                                                           , 73737
                                                           , 73792
                                                           , 73883
                                                           , 74037
                                                           , 74118
                                                           , 74197
                                                           , 74281
                                                           , 74343
                                                           , 74437
                                                           , 74490
                                                           , 74582
                                                           , 74698
                                                           , 74761
                                                           , 74923
                                                           , 75006
                                                           , 75085
                                                           , 75185
                                                           , 75328
                                                           , 75436
                                                           , 75490
                                                           , 75609
                                                           , 75733
                                                           , 75826
                                                           , 75902
                                                           , 76069
                                                           , 76166
                                                           , 76263
                                                           , 76320
                                                           , 76398
                                                           , 76490
                                                           , 76565
                                                           , 76978
                                                           , 77018
                                                           , 77284
                                                           , 77365
                                                           , 77620
                                                           , 77682
                                                           , 77763
                                                           , 77844
                                                           , 77967
                                                           , 78021
                                                           , 78099
                                                           , 78236
                                                           , 78330
                                                           , 78411
                                                           , 78573
                                                           , 78742
                                                           , 78816
                                                           , 78978
                                                           , 79031
                                                           , 79140
                                                           , 79268
                                                           , 79427
                                                           , 64600
                                                           , 64910
                                                           , 67319
                                                           , 70868
                                                           , 70961
                                                           , 71435
                                                           , 71613
                                                           , 73017
                                                           , 73274
                                                           , 73657
                                                           , 76322
                                                           , 79142
                                                           , 63549
                                                           , 63643
                                                           , 63731
                                                           , 63981
                                                           , 64333
                                                           , 64340
                                                           , 64506
                                                           , 64601
                                                           , 64744
                                                           , 64989
                                                           , 65137
                                                           , 65442
                                                           , 65523
                                                           , 65685
                                                           , 65873
                                                           , 66108
                                                           , 66511
                                                           , 66738
                                                           , 66855
                                                           , 66917
                                                           , 67062
                                                           , 67224
                                                           , 67422
                                                           , 67467
                                                           , 67898
                                                           , 68038
                                                           , 68196
                                                           , 68439
                                                           , 68763
                                                           , 69094
                                                           , 69168
                                                           , 69654
                                                           , 69897
                                                           , 70355
                                                           , 70545
                                                           , 70962
                                                           , 71057
                                                           , 71274
                                                           , 71355
                                                           , 71614
                                                           , 71690
                                                           , 72489
                                                           , 72577
                                                           , 72661
                                                           , 72917
                                                           , 73162
                                                           , 73387
                                                           , 73557
                                                           , 73658
                                                           , 73740
                                                           , 74040
                                                           , 74284
                                                           , 74440
                                                           , 74493
                                                           , 74701
                                                           , 76169
                                                           , 76266
                                                           , 76323
                                                           , 76493
                                                           , 76981
                                                           , 77534
                                                           , 77623
                                                           , 77847
                                                           , 77970
                                                           , 78102
                                                           , 78745
                                                           , 78901
                                                           , 78981
                                                           , 79271
                                                           , 63633
                                                           , 63808
                                                           , 64048
                                                           , 64228
                                                           , 64487
                                                           , 64658
                                                           , 65337
                                                           , 65504
                                                           , 65809
                                                           , 65930
                                                           , 66163
                                                           , 66256
                                                           , 66993
                                                           , 67452
                                                           , 67768
                                                           , 67865
                                                           , 68010
                                                           , 68093
                                                           , 68226
                                                           , 68343
                                                           , 69966
                                                           , 70459
                                                           , 70769
                                                           , 71034
                                                           , 71574
                                                           , 72682
                                                           , 73334
                                                           , 73589
                                                           , 73852
                                                           , 74365
                                                           , 74578
                                                           , 75874
                                                           , 76372
                                                           , 77344
                                                           , 79231
                                                           , 79486
                                                           , 63526
                                                           , 63634
                                                           , 63809
                                                           , 63958
                                                           , 64229
                                                           , 64488
                                                           , 64659
                                                           , 65043
                                                           , 65753
                                                           , 65810
                                                           , 65931
                                                           , 66164
                                                           , 66257
                                                           , 66878
                                                           , 66994
                                                           , 67453
                                                           , 67769
                                                           , 67866
                                                           , 67930
                                                           , 68094
                                                           , 68227
                                                           , 68344
                                                           , 68835
                                                           , 69064
                                                           , 69967
                                                           , 70068
                                                           , 70366
                                                           , 70460
                                                           , 70770
                                                           , 71035
                                                           , 71191
                                                           , 71656
                                                           , 73335
                                                           , 73512
                                                           , 73590
                                                           , 73772
                                                           , 73853
                                                           , 74098
                                                           , 74366
                                                           , 74579
                                                           , 75308
                                                           , 75426
                                                           , 75573
                                                           , 75875
                                                           , 76124
                                                           , 76373
                                                           , 76545
                                                           , 76944
                                                           , 77081
                                                           , 77345
                                                           , 77585
                                                           , 77662
                                                           , 78001
                                                           , 78138
                                                           , 79232
                                                           , 79410
                                                           , 63635
                                                           , 64249
                                                           , 64812
                                                           , 66895
                                                           , 68345
                                                           , 70771
                                                           , 71192
                                                           , 74099
                                                           , 76374
                                                           , 79233
                                                           , 79411
                                                           , 63528
                                                           , 63636
                                                           , 63811
                                                           , 64250
                                                           , 64813
                                                           , 65755
                                                           , 65933
                                                           , 66166
                                                           , 66259
                                                           , 66966
                                                           , 67771
                                                           , 67868
                                                           , 68096
                                                           , 68346
                                                           , 70368
                                                           , 70772
                                                           , 71037
                                                           , 71193
                                                           , 71577
                                                           , 71740
                                                           , 73337
                                                           , 73514
                                                           , 73592
                                                           , 73774
                                                           , 73855
                                                           , 74100
                                                           , 74368
                                                           , 74609
                                                           , 75310
                                                           , 75575
                                                           , 75877
                                                           , 77083
                                                           , 79234
                                                           , 79412
                                                           , 63812
                                                           , 63961
                                                           , 64491
                                                           , 64662
                                                           , 64814
                                                           , 65508
                                                           , 65813
                                                           , 67869
                                                           , 68347
                                                           , 71038
                                                           , 71194
                                                           , 73593
                                                           , 73856
                                                           , 74101
                                                           , 74369
                                                           , 76376
                                                           , 79235
                                                           , 79490
                                                           , 63813
                                                           , 64492
                                                           , 64815
                                                           , 65047
                                                           , 67457
                                                           , 67934
                                                           , 68284
                                                           , 68839
                                                           , 69068
                                                           , 69971
                                                           , 70072
                                                           , 70464
                                                           , 71039
                                                           , 71660
                                                           , 75879
                                                           , 76128
                                                           , 76377
                                                           , 76549
                                                           , 76948
                                                           , 77589
                                                           , 77666
                                                           , 78005
                                                           , 78142
                                                           , 63531
                                                           , 63617
                                                           , 63814
                                                           , 64253
                                                           , 64816
                                                           , 65343
                                                           , 65510
                                                           , 65936
                                                           , 66169
                                                           , 66969
                                                           , 67774
                                                           , 67871
                                                           , 68099
                                                           , 68285
                                                           , 68840
                                                           , 70371
                                                           , 70775
                                                           , 71743
                                                           , 73340
                                                           , 73595
                                                           , 73777
                                                           , 73858
                                                           , 74103
                                                           , 74371
                                                           , 74612
                                                           , 75578
                                                           , 75880
                                                           , 77086
                                                           , 77350
                                                           , 79237
                                                           , 79383
                                                           , 65511
                                                           , 66900
                                                           , 63816
                                                           , 64015
                                                           , 65345
                                                           , 67460
                                                           , 68018
                                                           , 68101
                                                           , 68234
                                                           , 69071
                                                           , 69974
                                                           , 70467
                                                           , 71042
                                                           , 71582
                                                           , 71745
                                                           , 72654
                                                           , 73597
                                                           , 73860
                                                           , 79494
                                                           , 64256
                                                           , 65818
                                                           , 66972
                                                           , 68019
                                                           , 75478
                                                           , 76132
                                                           )

/*********************************************************************************************************/

-- Step 07
-- drop answers not linked to any value

suspect they are, but check

V_Answer_fk		V_Answer_fk
NO 3475		3475   
NO 3517		3517
NO 3877		3877
NO 3922		3922
10354		
10406		
10469		
10480		
10499		
10539		
10569		
10599		
10610		
10619		
10629		
10649		
10798		
10812		
13816		
13854		
13912		
13925		
13961		
13981		
14006		
14039		
14043		
14062		





DELETE FROM 
            [juancarlos].[dbo].[Pew_Nation_Answer]                                            -- DB name
WHERE
            [juancarlos].[dbo].[Pew_Nation_Answer].[Nation_answer_pk] IN                      -- DB name
                                                           (
                                                             42095


                                                               8854




                                                 SELECT  
                                                           A.[Answer_pk]
                                                         , Q.[Question_abbreviation_std]
                                                   FROM [forum].[dbo].[Pew_Answer]            A
                                                       ,[forum].[dbo].[Pew_Question]          Q
                                                       ,[forum].[dbo].[Pew_Nation_Answer]     KN
                                                 WHERE Q.[Question_pk]                   =  A.[Question_fk]
                                                   AND A.[Answer_pk]                     = KN.[Answer_fk]
                                                   AND Q.[Question_abbreviation_std]     LIKE '%text'
                                                   and Answer_wording                    =    ''
                                                   AND answer_wording_std                IS   NULL

SELECT  
          A.[Answer_pk]
        , Q.[Question_abbreviation_std]
  FROM [forum].[dbo].[Pew_Answer]            A
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Nation_Answer]     KN
WHERE Q.[Question_pk]                   =  A.[Question_fk]
  AND A.[Answer_pk]                     = KN.[Answer_fk]
  AND Q.[Question_abbreviation_std]     LIKE '%text'
  and Answer_wording                    =    ''
  AND answer_wording_std                IS   NULL







 T_Answer_fk	V_Answer_fk	T_Answer_value	V_Answer_value
	10405		0


       [Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
      

select 
        Answer_pk                    = TT.[Answer_fk]
      , Answer_value                 = VV.[Answer_value]
      , Question_fk                  = VV.[Question_fk]
      , Answer_wording               = TT.[Answer_wording]
      , V_answer_wording_std         = VV.[answer_wording_std]
      , T_answer_wording_std         = TT.[answer_wording_std]
      , T_Question_fk                = TT.[Question_fk]
      , T_Question_abbreviation_std  = TT.[Question_abbreviation_std]
      , T_Question_abbreviation      = TT.[Question_abbreviation]
      , T_Question_wording           = TT.[Question_wording]
      , T_Data_source_fk             = TT.[Data_source_fk]
      , T_Question_Year              = TT.[Question_Year]
      , T_Short_wording              = TT.[Short_wording]
      , T_Notes                      = TT.[Notes]
      , T_Default_response           = TT.[Default_response]
      , T_Question_wording_std       = TT.[Question_wording_std]
      , T_Question_short_wording_std = TT.[Question_short_wording_std]
      , T_Nation_fk                  = TT.[Nation_fk]
      , T_link_fk                    = TT.[link_fk]
      , V_Answer_fk                  = VV.[Answer_fk]
      , V_Answer_wording             = VV.[Answer_wording]
      , V_Question_abbreviation_std  = VV.[Question_abbreviation_std]
      , V_Question_abbreviation      = VV.[Question_abbreviation]
      , V_Question_wording           = VV.[Question_wording]
      , V_Data_source_fk             = VV.[Data_source_fk]
      , V_Question_Year              = VV.[Question_Year]
      , V_Short_wording              = VV.[Short_wording]
      , V_Notes                      = VV.[Notes]
      , V_Default_response           = VV.[Default_response]
      , V_Question_wording_std       = VV.[Question_wording_std]
      , V_Question_short_wording_std = VV.[Question_short_wording_std]
      , V_Nation_fk                  = VV.[Nation_fk]
      , V_link_fk                    = VV.[link_fk]
FROM
/****************************************************************************************************/
(
SELECT 
        level                      = 'Ctry'
      , Answer_fk                  = A.[Answer_pk]
      , Answer_value               = A.[Answer_value]
      , Answer_wording             = A.[Answer_wording]
      , answer_wording_std         = A.[answer_wording_std]
      , Question_fk                = Q.[Question_pk]
      , Question_abbreviation_std  = Q.[Question_abbreviation_std]
      , Question_abbreviation      = Q.[Question_abbreviation]
      , Question_wording           = Q.[Question_wording]
      , Data_source_fk             = Q.[Data_source_fk]
      , Question_Year              = Q.[Question_Year]
      , Short_wording              = Q.[Short_wording]
      , Notes                      = Q.[Notes]
      , Default_response           = Q.[Default_response]
      , Question_wording_std       = Q.[Question_wording_std]
      , Question_short_wording_std = Q.[Question_short_wording_std]
      , Nation_fk                  = KN.[Nation_fk]
      , link_fk                    = KN.[Nation_answer_pk]
  FROM [forum].[dbo].[Pew_Answer]            A
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Nation_Answer]     KN
WHERE Q.[Question_pk] =  A.[Question_fk]
  AND A.[Answer_pk]   = KN.[Answer_fk]
  AND Q.[Question_abbreviation_std]     LIKE '%text'
  --AND Q.[Question_abbreviation_std] NOT LIKE '%text'
) TT
/****************************************************************************************************/
join
/****************************************************************************************************/
(
SELECT 
        level                      = 'Ctry'
      , Answer_fk                  = A.[Answer_pk]
      , Answer_value               = A.[Answer_value]
      , Answer_wording             = A.[Answer_wording]
      , answer_wording_std         = A.[answer_wording_std]
      , Question_fk                = Q.[Question_pk]
      , Question_abbreviation_std  = Q.[Question_abbreviation_std]
      , Question_abbreviation      = Q.[Question_abbreviation]
      , Question_wording           = Q.[Question_wording]
      , Data_source_fk             = Q.[Data_source_fk]
      , Question_Year              = Q.[Question_Year]
      , Short_wording              = Q.[Short_wording]
      , Notes                      = Q.[Notes]
      , Default_response           = Q.[Default_response]
      , Question_wording_std       = Q.[Question_wording_std]
      , Question_short_wording_std = Q.[Question_short_wording_std]
      , Nation_fk                  = KN.[Nation_fk]
      , link_fk                    = KN.[Nation_answer_pk]
  FROM [forum].[dbo].[Pew_Answer]            A
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Nation_Answer]     KN
WHERE Q.[Question_pk] =  A.[Question_fk]
  AND A.[Answer_pk]   = KN.[Answer_fk]
  --AND Q.[Question_abbreviation_std]     LIKE '%text'
  AND Q.[Question_abbreviation_std] NOT LIKE '%text'
) VV
/****************************************************************************************************/
ON 
        VV.Nation_fk
      = TT.Nation_fk
AND
        VV.Question_Year
      = TT.Question_Year
AND
                  VV.Question_abbreviation_std
      = SUBSTRING(TT.Question_abbreviation_std,1, 9)










USE [forum]
GO
/*****************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************************************************************/
   
ALTER VIEW    
                   [dbo].[temp_text_view]
AS
/*****************************************************************************************************************************************************/
select 
        tt.level
      , T_Answer_fk                  = TT.[Answer_fk]
      , T_Answer_value               = TT.[Answer_value]
      , T_Answer_wording             = TT.[Answer_wording]
      , T_answer_wording_std         = TT.[answer_wording_std]
      , T_Question_fk                = TT.[Question_fk]
      , T_Question_abbreviation_std  = TT.[Question_abbreviation_std]
      , T_Question_abbreviation      = TT.[Question_abbreviation]
      , T_Question_wording           = TT.[Question_wording]
      , T_Data_source_fk             = TT.[Data_source_fk]
      , T_Question_Year              = TT.[Question_Year]
      , T_Short_wording              = TT.[Short_wording]
      , T_Notes                      = TT.[Notes]
      , T_Default_response           = TT.[Default_response]
      , T_Question_wording_std       = TT.[Question_wording_std]
      , T_Question_short_wording_std = TT.[Question_short_wording_std]
      , T_Nation_fk                  = TT.[Nation_fk]
      , T_link_fk                    = TT.[link_fk]
      , V_Answer_fk                  = VV.[Answer_fk]
      , V_Answer_value               = VV.[Answer_value]
      , V_Answer_wording             = VV.[Answer_wording]
      , V_answer_wording_std         = VV.[answer_wording_std]
      , V_Question_fk                = VV.[Question_fk]
      , V_Question_abbreviation_std  = VV.[Question_abbreviation_std]
      , V_Question_abbreviation      = VV.[Question_abbreviation]
      , V_Question_wording           = VV.[Question_wording]
      , V_Data_source_fk             = VV.[Data_source_fk]
      , V_Question_Year              = VV.[Question_Year]
      , V_Short_wording              = VV.[Short_wording]
      , V_Notes                      = VV.[Notes]
      , V_Default_response           = VV.[Default_response]
      , V_Question_wording_std       = VV.[Question_wording_std]
      , V_Question_short_wording_std = VV.[Question_short_wording_std]
      , V_Nation_fk                  = VV.[Nation_fk]
      , V_link_fk                    = VV.[link_fk]
FROM
/****************************************************************************************************/
(
SELECT 
        level                      = 'Ctry'
      , Answer_fk                  = A.[Answer_pk]
      , Answer_value               = A.[Answer_value]
      , Answer_wording             = A.[Answer_wording]
      , answer_wording_std         = A.[answer_wording_std]
      , Question_fk                = Q.[Question_pk]
      , Question_abbreviation_std  = Q.[Question_abbreviation_std]
      , Question_abbreviation      = Q.[Question_abbreviation]
      , Question_wording           = Q.[Question_wording]
      , Data_source_fk             = Q.[Data_source_fk]
      , Question_Year              = Q.[Question_Year]
      , Short_wording              = Q.[Short_wording]
      , Notes                      = Q.[Notes]
      , Default_response           = Q.[Default_response]
      , Question_wording_std       = Q.[Question_wording_std]
      , Question_short_wording_std = Q.[Question_short_wording_std]
      , Nation_fk                  = KN.[Nation_fk]
      , link_fk                    = KN.[Nation_answer_pk]
  FROM [forum].[dbo].[Pew_Answer]            A
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Nation_Answer]     KN
WHERE Q.[Question_pk] =  A.[Question_fk]
  AND A.[Answer_pk]   = KN.[Answer_fk]
  AND Q.[Question_abbreviation_std]     LIKE '%text'
  --AND Q.[Question_abbreviation_std] NOT LIKE '%text'
) TT
/****************************************************************************************************/
join
/****************************************************************************************************/
(
SELECT 
        level                      = 'Ctry'
      , Answer_fk                  = A.[Answer_pk]
      , Answer_value               = A.[Answer_value]
      , Answer_wording             = A.[Answer_wording]
      , answer_wording_std         = A.[answer_wording_std]
      , Question_fk                = Q.[Question_pk]
      , Question_abbreviation_std  = Q.[Question_abbreviation_std]
      , Question_abbreviation      = Q.[Question_abbreviation]
      , Question_wording           = Q.[Question_wording]
      , Data_source_fk             = Q.[Data_source_fk]
      , Question_Year              = Q.[Question_Year]
      , Short_wording              = Q.[Short_wording]
      , Notes                      = Q.[Notes]
      , Default_response           = Q.[Default_response]
      , Question_wording_std       = Q.[Question_wording_std]
      , Question_short_wording_std = Q.[Question_short_wording_std]
      , Nation_fk                  = KN.[Nation_fk]
      , link_fk                    = KN.[Nation_answer_pk]
  FROM [forum].[dbo].[Pew_Answer]            A
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Nation_Answer]     KN
WHERE Q.[Question_pk] =  A.[Question_fk]
  AND A.[Answer_pk]   = KN.[Answer_fk]
  --AND Q.[Question_abbreviation_std]     LIKE '%text'
  AND Q.[Question_abbreviation_std] NOT LIKE '%text'
) VV
/****************************************************************************************************/
ON 
        VV.Nation_fk
      = TT.Nation_fk
AND
        VV.Question_Year
      = TT.Question_Year
AND
                  VV.Question_abbreviation_std
      = SUBSTRING(TT.Question_abbreviation_std,1, 9)



/*********************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Answer_2013_03_19_province]
  FROM      [forum].[dbo].[Pew_Answer]
/*********************************************************************************************************/
SELECT *
  INTO [juancarlos].[dbo].[Pew_Answer]
  FROM      [forum].[dbo].[Pew_Answer]
/*********************************************************************************************************/

-- Step 01
-- drop text answers when their value has been previouly dropped
DELETE FROM 
            [juancarlos].[dbo].[Pew_answer]                                                   -- DB name
WHERE
            [juancarlos].[dbo].[Pew_answer].[Answer_pk] IN                                    -- DB name
                                                           (9522, 9150, 9537, 9459, 9359)
-- Step 02
-- attach text answers to corresponding values (province level)
UPDATE
           [juancarlos].[dbo].[Pew_Answer]                                                    -- DB name
SET
           [juancarlos].[dbo].[Pew_Answer].[Answer_Wording]                                   -- DB name
       =                             toolT.[Answer_Wording]
FROM
           [juancarlos].[dbo].[Pew_Answer]   AS mydbt                                         -- DB name
 JOIN
       (
SELECT 
         VV.Answer_fk
       , VV.Answer_value
--       , DD.Answer_fk
       , DD.Answer_wording
FROM
(
SELECT
        level                      = 'Prov'
      , Answer_fk                  = A.[Answer_pk]
      , Answer_value               = A.[Answer_value]
      , Answer_wording             = A.[Answer_wording]
      , answer_wording_std         = A.[answer_wording_std]
      , Question_fk                = Q.[Question_pk]
      , Locality_fk                = KL.[Locality_fk]
      , Question_abbreviation_std  = Q.[Question_abbreviation_std]
  FROM
  [juancarlos].[dbo].[Pew_Answer]            A                                                -- DB name
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Locality_Answer]   KL
WHERE Q.[Question_pk]               =         A.[Question_fk]
  AND A.[Answer_pk]                 =        KL.[Answer_fk]
  AND Q.[Question_Year]             =        2011
  --AND Q.[Question_abbreviation_std]     LIKE '%text'
  AND Q.[Question_abbreviation_std] NOT LIKE '%text'
  --AND A.[Answer_value]              IS NULL
  AND A.[Answer_wording]            IS NULL
) VV
JOIN
(
SELECT
        level                      = 'Prov'
      , Answer_fk                  = A.[Answer_pk]
      , Answer_value               = A.[Answer_value]
      , Answer_wording             = A.[Answer_wording]
      , answer_wording_std         = A.[answer_wording_std]
      , Question_fk                = Q.[Question_pk]
      , Locality_fk                = KL.[Locality_fk]
      , Question_abbreviation_std  = Q.[Question_abbreviation_std]
  FROM
  [juancarlos].[dbo].[Pew_Answer]            A                                                -- DB name
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Locality_Answer]   KL
WHERE Q.[Question_pk]               =         A.[Question_fk]
  AND A.[Answer_pk]                 =        KL.[Answer_fk]
  AND Q.[Question_Year]             =        2011
  AND Q.[Question_abbreviation_std]     LIKE '%text'
  --AND Q.[Question_abbreviation_std] NOT LIKE '%text'
  AND A.[Answer_value]              IS NULL
  --AND A.[Answer_wording]            IS NULL
) DD
ON
        VV.Locality_fk                = DD.Locality_fk
AND
        VV.Question_abbreviation_std  = SUBSTRING(DD.Question_abbreviation_std,1, 8)
       ) AS toolT
ON
           mydbt.Answer_pk
       =   toolT.Answer_fk

-- Step 03
-- drop text answers whose text has already been attached to the value
DELETE FROM 
            [juancarlos].[dbo].[Pew_answer]                                                   -- DB name
WHERE
            [juancarlos].[dbo].[Pew_answer].[Answer_pk] IN                                    -- DB name
                                                           (
                                                               8854
                                                             , 8855
                                                             , 8856
                                                             , 8857
                                                             , 8858
                                                             , 8859
                                                             , 8860
                                                             , 8861
                                                             , 8862
                                                             , 8863
                                                             , 8864
                                                             , 8865
                                                             , 8866
                                                             , 8867
                                                             , 8868
                                                             , 8869
                                                             , 8870
                                                             , 8871
                                                             , 8872
                                                             , 8873
                                                             , 8874
                                                             , 8875
                                                             , 8876
                                                             , 8877
                                                             , 8878
                                                             , 8879
                                                             , 8880
                                                             , 8881
                                                             , 8882
                                                             , 8883
                                                             , 8884
                                                             , 8885
                                                             , 8886
                                                             , 8887
                                                             , 8888
                                                             , 8889
                                                             , 8890
                                                             , 8891
                                                             , 8892
                                                             , 8893
                                                             , 8894
                                                             , 8895
                                                             , 8896
                                                             , 8897
                                                             , 8898
                                                             , 8899
                                                             , 8900
                                                             , 8901
                                                             , 8902
                                                             , 8903
                                                             , 8904
                                                             , 8905
                                                             , 8906
                                                             , 8907
                                                             , 8908
                                                             , 8909
                                                             , 8910
                                                             , 8911
                                                             , 8912
                                                             , 8913
                                                             , 8914
                                                             , 8915
                                                             , 8916
                                                             , 8917
                                                             , 8918
                                                             , 8919
                                                             , 8920
                                                             , 8921
                                                             , 8922
                                                             , 8923
                                                             , 8924
                                                             , 8925
                                                             , 8926
                                                             , 8927
                                                             , 8928
                                                             , 8929
                                                             , 8930
                                                             , 8931
                                                             , 8932
                                                             , 8933
                                                             , 9115
                                                             , 9116
                                                             , 9117
                                                             , 9118
                                                             , 9119
                                                             , 9120
                                                             , 9121
                                                             , 9122
                                                             , 9123
                                                             , 9124
                                                             , 9125
                                                             , 9126
                                                             , 9127
                                                             , 9128
                                                             , 9129
                                                             , 9130
                                                             , 9131
                                                             , 9132
                                                             , 9133
                                                             , 9134
                                                             , 9135
                                                             , 9136
                                                             , 9137
                                                             , 9138
                                                             , 9139
                                                             , 9140
                                                             , 9141
                                                             , 9142
                                                             , 9143
                                                             , 9144
                                                             , 9145
                                                             , 9146
                                                             , 9147
                                                             , 9148
                                                             , 9149
                                                             , 9151
                                                             , 9152
                                                             , 9153
                                                             , 9154
                                                             , 9155
                                                             , 9156
                                                             , 9157
                                                             , 9158
                                                             , 9159
                                                             , 9160
                                                             , 9161
                                                             , 9162
                                                             , 9163
                                                             , 9164
                                                             , 9165
                                                             , 9166
                                                             , 9167
                                                             , 9168
                                                             , 9169
                                                             , 9170
                                                             , 9171
                                                             , 9172
                                                             , 9173
                                                             , 9174
                                                             , 9175
                                                             , 9176
                                                             , 9177
                                                             , 9178
                                                             , 9179
                                                             , 9180
                                                             , 9181
                                                             , 9182
                                                             , 9183
                                                             , 9184
                                                             , 9185
                                                             , 9186
                                                             , 9187
                                                             , 9188
                                                             , 9189
                                                             , 9190
                                                             , 9191
                                                             , 9192
                                                             , 9193
                                                             , 9194
                                                             , 9195
                                                             , 9196
                                                             , 9197
                                                             , 9198
                                                             , 9199
                                                             , 9200
                                                             , 9201
                                                             , 9202
                                                             , 9203
                                                             , 9204
                                                             , 9205
                                                             , 9206
                                                             , 9207
                                                             , 9208
                                                             , 9209
                                                             , 9210
                                                             , 9211
                                                             , 9212
                                                             , 9213
                                                             , 9214
                                                             , 9215
                                                             , 9216
                                                             , 9217
                                                             , 9218
                                                             , 9219
                                                             , 9220
                                                             , 9221
                                                             , 9222
                                                             , 9223
                                                             , 9224
                                                             , 9225
                                                             , 9226
                                                             , 9227
                                                             , 9228
                                                             , 9229
                                                             , 9230
                                                             , 9231
                                                             , 9232
                                                             , 9233
                                                             , 9234
                                                             , 9235
                                                             , 9236
                                                             , 9237
                                                             , 9238
                                                             , 9239
                                                             , 9240
                                                             , 9241
                                                             , 9242
                                                             , 9243
                                                             , 9244
                                                             , 9245
                                                             , 9246
                                                             , 9247
                                                             , 9248
                                                             , 9249
                                                             , 9250
                                                             , 9251
                                                             , 9252
                                                             , 9253
                                                             , 9254
                                                             , 9255
                                                             , 9256
                                                             , 9257
                                                             , 9258
                                                             , 9259
                                                             , 9260
                                                             , 9261
                                                             , 9262
                                                             , 9263
                                                             , 9264
                                                             , 9265
                                                             , 9266
                                                             , 9267
                                                             , 9268
                                                             , 9269
                                                             , 9270
                                                             , 9271
                                                             , 9272
                                                             , 9273
                                                             , 9274
                                                             , 9275
                                                             , 9276
                                                             , 9277
                                                             , 9278
                                                             , 9279
                                                             , 9280
                                                             , 9281
                                                             , 9282
                                                             , 9283
                                                             , 9284
                                                             , 9285
                                                             , 9286
                                                             , 9287
                                                             , 9288
                                                             , 9289
                                                             , 9290
                                                             , 9291
                                                             , 9292
                                                             , 9293
                                                             , 9294
                                                             , 9295
                                                             , 9328
                                                             , 9329
                                                             , 9330
                                                             , 9331
                                                             , 9332
                                                             , 9333
                                                             , 9334
                                                             , 9335
                                                             , 9336
                                                             , 9337
                                                             , 9338
                                                             , 9339
                                                             , 9340
                                                             , 9341
                                                             , 9342
                                                             , 9343
                                                             , 9344
                                                             , 9345
                                                             , 9346
                                                             , 9347
                                                             , 9348
                                                             , 9349
                                                             , 9350
                                                             , 9351
                                                             , 9352
                                                             , 9353
                                                             , 9354
                                                             , 9355
                                                             , 9356
                                                             , 9357
                                                             , 9358
                                                             , 9415
                                                             , 9416
                                                             , 9417
                                                             , 9418
                                                             , 9419
                                                             , 9420
                                                             , 9421
                                                             , 9422
                                                             , 9423
                                                             , 9424
                                                             , 9425
                                                             , 9426
                                                             , 9427
                                                             , 9428
                                                             , 9429
                                                             , 9430
                                                             , 9431
                                                             , 9432
                                                             , 9433
                                                             , 9434
                                                             , 9435
                                                             , 9436
                                                             , 9437
                                                             , 9438
                                                             , 9439
                                                             , 9440
                                                             , 9441
                                                             , 9442
                                                             , 9443
                                                             , 9444
                                                             , 9445
                                                             , 9446
                                                             , 9447
                                                             , 9448
                                                             , 9449
                                                             , 9450
                                                             , 9451
                                                             , 9452
                                                             , 9453
                                                             , 9454
                                                             , 9455
                                                             , 9456
                                                             , 9457
                                                             , 9458
                                                             , 9460
                                                             , 9461
                                                             , 9462
                                                             , 9463
                                                             , 9464
                                                             , 9465
                                                             , 9466
                                                             , 9467
                                                             , 9468
                                                             , 9469
                                                             , 9515
                                                             , 9516
                                                             , 9517
                                                             , 9518
                                                             , 9519
                                                             , 9520
                                                             , 9521
                                                             , 9523
                                                             , 9524
                                                             , 9525
                                                             , 9526
                                                             , 9527
                                                             , 9528
                                                             , 9529
                                                             , 9530
                                                             , 9531
                                                             , 9532
                                                             , 9533
                                                             , 9534
                                                             , 9535
                                                             , 9536
                                                             , 9538
                                                             , 9539
                                                             , 9540
                                                             , 9541
                                                             , 9542
                                                             , 9543
                                                             , 9544
                                                             , 9545
                                                             , 9546
                                                             , 9547
                                                             , 9548
                                                             , 9549
                                                             , 9550
                                                             , 9551
                                                             , 9552
                                                             , 9553
                                                             , 9554
                                                             , 9555
                                                             , 9556
                                                             , 9557
                                                             , 9558
                                                             , 9559
                                                             , 11175
                                                             , 11176
                                                             , 11177
                                                             , 11178
                                                             , 11179
                                                             , 11180
                                                             , 11181
                                                             , 11182
                                                             , 11183
                                                             , 11184
                                                             , 11185
                                                             , 11186
                                                             , 11187
                                                             , 11188
                                                             , 11189
                                                             , 11190
                                                             , 11191
                                                             , 11192
                                                             , 11193
                                                             , 11194
                                                             , 11195
                                                             , 11196
                                                             , 11197
                                                             , 11198
                                                             , 11199
                                                             , 11200
                                                             , 11201
                                                             , 11202
                                                             , 11203
                                                             , 11204
                                                             , 11205
                                                             , 11206
                                                             , 11207
                                                             , 11208
                                                             , 11209
                                                             , 11210
                                                             , 11211
                                                             , 11212
                                                             , 11213
                                                             , 11214
                                                             , 11215
                                                             , 11216
                                                             , 11217
                                                             , 11218
                                                             , 11219
                                                             , 11220
                                                             , 11221
                                                             , 11222
                                                             , 11223
                                                             , 11224
                                                             , 11225
                                                             , 11226
                                                             , 11227
                                                             , 11228
                                                             , 11229
                                                             , 11230
                                                             , 11231
                                                             , 11232
                                                             , 11233
                                                             , 11234
                                                             , 11235
                                                             , 11236
                                                             , 11237
                                                             , 11238
                                                             , 11239
                                                             , 11240
                                                             , 11241
                                                             , 11242
                                                             , 11243
                                                             , 11244
                                                             , 11245
                                                             , 11246
                                                             , 11247
                                                             , 11248
                                                             , 11249
                                                             , 11250
                                                             , 11251
                                                             , 11252
                                                             , 11253
                                                             , 11254
                                                             , 11255
                                                             , 11256
                                                             , 11257
                                                             , 11258
                                                             , 11259
                                                             , 11260
                                                             , 11261
                                                             , 11262
                                                             , 11263
                                                             , 11264
                                                             , 11265
                                                             , 11266
                                                             , 11267
                                                             , 11268
                                                             , 11269
                                                             , 11270
                                                             , 11271
                                                             , 11272
                                                             , 11273
                                                             , 11274
                                                             , 11275
                                                             , 11276
                                                             , 11277
                                                             , 11278
                                                             , 11279
                                                             , 11280
                                                             , 11281
                                                             , 11282
                                                             , 11283
                                                             , 11284
                                                             , 11285
                                                             , 11286
                                                             , 11287
                                                             , 11288
                                                             , 11289
                                                             , 11290
                                                             , 11291
                                                             , 11292
                                                             , 11293
                                                             , 11294
                                                             , 11295
                                                             , 11296
                                                             , 11297
                                                             , 11298
                                                             , 11299
                                                             , 11300
                                                             , 11301
                                                             , 11302
                                                             , 11303
                                                             , 11304
                                                             , 11305
                                                             , 11306
                                                             , 11307
                                                             , 11308
                                                             , 11309
                                                             , 11310
                                                             , 11311
                                                             , 11312
                                                             , 11313
                                                             , 11314
                                                             , 11330
                                                             , 11331
                                                             , 11332
                                                             , 11333
                                                             , 11334
                                                             , 11335
                                                             , 11336
                                                             , 11337
                                                             , 11338
                                                             , 11339
                                                             , 11340
                                                             , 11341
                                                             , 11342
                                                             , 11343
                                                             , 11344
                                                             , 11361
                                                             , 11362
                                                             , 11363
                                                             , 11364
                                                             , 11365
                                                             , 11366
                                                             , 11367
                                                             , 11368
                                                             , 11369
                                                             , 11370
                                                             , 11371
                                                             , 11372
                                                             , 11373
                                                             , 11374
                                                             , 11375
                                                             , 11376
                                                             , 11495
                                                             , 11496
                                                             , 11497
                                                             , 11498
                                                             , 11499
                                                             , 11500
                                                             , 11501
                                                             , 11502
                                                             , 11503
                                                             , 11504
                                                             , 11505
                                                             , 11506
                                                             , 11507
                                                             , 11508
                                                             , 11509
                                                             , 11510
                                                             , 11511
                                                             , 11512
                                                             , 11513
                                                             , 11514
                                                             , 11515
                                                             , 11516
                                                             , 11517
                                                             , 11518
                                                             , 11519
                                                             , 11520
                                                             , 11521
                                                             , 11522
                                                             , 11523
                                                             , 11524
                                                             , 11525
                                                             , 11526
                                                             , 11527
                                                             , 11528
                                                             , 11529
                                                             , 11530
                                                             , 11531
                                                             , 11532
                                                             , 11533
                                                             , 11534
                                                             , 11535
                                                             , 11536
                                                             , 11537
                                                             , 11538
                                                             , 11539
                                                             , 11540
                                                             , 11541
                                                             , 11542
                                                             , 11543
                                                             , 11544
                                                             , 11545
                                                             , 11546
                                                             , 11547
                                                             , 11548
                                                             , 11549
                                                             , 11550
                                                             , 11551
                                                             , 11552
                                                             , 11553
                                                             , 11554
                                                             , 11555
                                                             , 11556
                                                             , 11557
                                                             , 11558
                                                             , 11559
                                                             , 11560
                                                             , 11561
                                                             , 11562
                                                             , 11563
                                                             , 11564
                                                             , 11565
                                                             , 11566
                                                             , 11567
                                                             , 11568
                                                             , 11569
                                                             , 11570
                                                             , 11571
                                                             , 11572
                                                             , 11573
                                                             , 11574
                                                             , 11575
                                                             , 11576
                                                             , 11577
                                                             , 11578
                                                             , 11579
                                                             , 11580
                                                             , 11581
                                                             , 11582
                                                             , 11583
                                                             , 11584
                                                             , 11585
                                                             , 11586
                                                             , 11587
                                                             , 11588
                                                             , 11589
                                                             , 11590
                                                             , 11591
                                                             , 11592
                                                             , 11593
                                                             , 11594
                                                             , 11595
                                                             , 11596
                                                             , 11597
                                                             , 11598
                                                             , 11599
                                                             , 11600
                                                             , 11601
                                                             , 11602
                                                             , 11603
                                                             , 11604
                                                             , 11605
                                                             , 11606
                                                             , 11607
                                                             , 11608
                                                             , 11609
                                                             , 11610
                                                             , 11611
                                                             , 11612
                                                             , 11683
                                                             , 11684
                                                             , 11685
                                                             , 11686
                                                             , 11687
                                                             , 11688
                                                             , 11689
                                                             , 11690
                                                             , 11691
                                                             , 11692
                                                             , 11693
                                                             , 11694
                                                             , 11695
                                                             , 11696
                                                             , 11697
                                                             , 11698
                                                             , 11699
                                                             , 11700
                                                             , 11701
                                                             , 11702
                                                             , 11703
                                                             , 11704
                                                             , 11705
                                                             , 11706
                                                             , 11707
                                                             , 11708
                                                             , 11709
                                                             , 11710
                                                             , 11711
                                                             , 11712
                                                             , 11713
                                                             , 11714
                                                             , 11715
                                                             , 11716
                                                             , 11717
                                                             , 11718
                                                             , 11719
                                                             , 11720
                                                             , 11721
                                                             , 11722
                                                             , 11723
                                                             , 11724
                                                             , 11725
                                                             , 11726
                                                             , 11727
                                                             , 11728
                                                             , 11729
                                                             , 11730
                                                             , 11731
                                                             , 11732
                                                             , 11733
                                                             , 11734
                                                             , 11735
                                                             , 11736
                                                             , 11737
                                                             , 11738
                                                             , 11739
                                                             , 11740
                                                             , 11741
                                                             , 11742
                                                             , 11743
                                                             , 11744
                                                             , 11745
                                                             , 11746
                                                             , 11747
                                                             , 11748
                                                             , 11749
                                                             , 11750
                                                             , 11751
                                                             , 11752
                                                             , 12002
                                                             , 12003
                                                             , 12004
                                                             , 12005
                                                             , 12006
                                                             , 12007
                                                             , 12008
                                                             , 12009
                                                             , 12010
                                                             , 12011
                                                             , 12012
                                                             , 12013
                                                             , 12014
                                                             , 12015
                                                             , 12017
                                                             , 12018
                                                             , 12019
                                                             , 12020
                                                             , 12021
                                                             , 12022
                                                             , 12023
                                                             , 12024
                                                             , 12025
                                                             , 12026
                                                             , 12027
                                                             , 12028
                                                             , 12029
                                                             , 12030
                                                             , 12031
                                                             , 12032
                                                             , 12033
                                                             , 12034
                                                             , 12035
                                                             , 12036
                                                             , 12037
                                                             , 12038
                                                             , 12039
                                                             , 12040
                                                             , 12041
                                                             , 12042
                                                             , 12043
                                                             , 12044
                                                             , 12045
                                                             , 12046
                                                             , 12047
                                                             , 12048
                                                             , 12049
                                                             , 12050
                                                             , 12051
                                                             , 12052
                                                             , 12053
                                                             , 12054
                                                             , 12055
                                                             , 12056
                                                             , 12057
                                                             , 12058
                                                             , 12059
                                                             , 12060
                                                             , 12061
                                                             , 12062
                                                             , 12063
                                                             , 12064
                                                             , 12065
                                                             , 12066
                                                             , 12067
                                                             , 12068
                                                             , 12069
                                                             , 12070
                                                             , 12071
                                                             , 12072
                                                             , 12073
                                                             , 12074
                                                             , 12075
                                                             , 12076
                                                             , 12077
                                                             , 12078
                                                             , 12079
                                                             , 12080
                                                             , 12081
                                                             , 12082
                                                             , 12083
                                                             , 12084
                                                             , 12085
                                                             , 12086
                                                             , 12087
                                                             , 12088
                                                             , 12089
                                                             , 12090
                                                             , 12091
                                                             , 12092
                                                             , 12093
                                                             , 12094
                                                             , 12095
                                                             , 12096
                                                             , 12097
                                                             , 12098
                                                             , 12099
                                                             , 12100
                                                             , 12101
                                                             , 12102
                                                             , 12103
                                                             , 12104
                                                             , 12105
                                                             , 12107
                                                             , 12108
                                                             , 12109
                                                             , 12110
                                                             , 12111
                                                             , 12112
                                                             , 12113
                                                             , 12114
                                                             , 12115
                                                             , 12116
                                                             , 12117
                                                             , 12118
                                                             , 12119
                                                             , 12120
                                                             , 12121
                                                             , 12122
                                                             , 12123
                                                             , 12124
                                                             , 12125
                                                             , 12126
                                                             , 12127
                                                             , 12128
                                                             , 12129
                                                             , 12130
                                                             , 12223
                                                             , 12224
                                                             , 12225
                                                             , 12226
                                                             , 12227
                                                             , 12228
                                                             , 12229
                                                             , 12230
                                                             , 12231
                                                             , 12232
                                                             , 12233
                                                             , 12234
                                                             , 12235
                                                             , 12236
                                                             , 12237
                                                             , 12238
                                                             , 12239
                                                             , 12240
                                                             , 12241
                                                             , 12242
                                                             , 12243
                                                             , 12244
                                                             , 12245
                                                             , 12246
                                                             , 12247
                                                             , 12248
                                                             , 12249
                                                             , 12250
                                                             , 12251
                                                             , 12252
                                                             , 12253
                                                             , 12254
                                                             , 12255
                                                             , 12256
                                                             , 12257
                                                             , 12258
                                                             , 12259
                                                             , 12260
                                                             , 12261
                                                             , 12262
                                                             , 12263
                                                             , 12264
                                                             , 12265
                                                             , 12266
                                                             , 12267
                                                             , 12268
                                                             , 12269
                                                             , 12270
                                                             , 12271
                                                             , 12272
                                                             , 12273
                                                             , 12274
                                                             , 12275
                                                             , 12276
                                                             , 12277
                                                             , 12278
                                                             , 12279
                                                             , 12280
                                                             , 12281
                                                             , 12282
                                                             , 12283
                                                             , 12284
                                                             , 12285
                                                             , 12286
                                                             , 12287
                                                             , 12288
                                                             , 12289
                                                             , 12290
                                                             , 12291
                                                             , 12292
                                                             , 12293
                                                             , 12294
                                                             , 12295
                                                             , 12296
                                                             , 12297
                                                             , 12298
                                                             , 12299
                                                             , 12300
                                                             , 12301
                                                             , 12302
                                                             , 12303
                                                             , 12304
                                                             , 12305
                                                             , 12306
                                                             , 12307
                                                             , 12308
                                                             , 12309
                                                             , 12310
                                                             , 12311
                                                             , 12312
                                                             , 12313
                                                             , 12314
                                                             , 12319
                                                             , 12320
                                                             , 12321
                                                             , 12322
                                                             , 12547
                                                             , 12549
                                                             , 12550
                                                             , 12551
                                                             , 12552
                                                             , 12553
                                                             , 12554
                                                             , 12555
                                                             , 12556
                                                             , 12557
                                                             , 12558
                                                             , 12559
                                                             , 12560
                                                             , 12561
                                                             , 12562
                                                             , 12563
                                                             , 12564
                                                             , 12566
                                                             , 12567
                                                             , 12568
                                                             , 12569
                                                             , 12570
                                                             , 12571
                                                             , 12572
                                                             , 12573
                                                             , 12574
                                                             , 12575
                                                             , 12576
                                                             , 12577
                                                             , 12578
                                                             , 12579
                                                             , 12580
                                                             , 12581
                                                             , 12582
                                                             , 12583
                                                             , 12584
                                                             , 12585
                                                             , 12586
                                                             , 12587
                                                             , 12588
                                                             , 12589
                                                             , 12590
                                                             , 12591
                                                             , 12592
                                                             , 12593
                                                             , 12594
                                                             , 12595
                                                             , 12596
                                                             , 12597
                                                             , 12598
                                                             , 12599
                                                             , 12600
                                                             , 12601
                                                             , 12602
                                                             , 12603
                                                             , 12604
                                                             , 12605
                                                             , 12606
                                                             , 12607
                                                             , 12608
                                                             , 12609
                                                             , 12610
                                                             , 12611
                                                             , 12612
                                                             , 12614
                                                             , 12615
                                                             , 12616
                                                             , 12617
                                                             , 12618
                                                             , 12619
                                                             , 12620
                                                             , 12621
                                                             , 12622
                                                             , 12623
                                                             , 12624
                                                             , 12625
                                                             , 12626
                                                             , 12627
                                                             , 12628
                                                             , 12629
                                                             , 12630
                                                             , 12631
                                                             , 12632
                                                             , 12633
                                                             , 12634
                                                             , 12635
                                                             , 12636
                                                             , 12637
                                                             , 12638
                                                             , 12639
                                                             , 12640
                                                             , 12641
                                                             , 12642
                                                             , 12643
                                                             , 12644
                                                             , 12645
                                                             , 12646
                                                             , 12647
                                                             , 12648
                                                             , 12649
                                                             , 12650
                                                             , 12651
                                                             , 12652
                                                             , 12653
                                                             , 12654
                                                             , 12655
                                                             , 12656
                                                             , 12657
                                                             , 12659
                                                             , 12660
                                                             , 12661
                                                             , 12662
                                                             , 12663
                                                             , 12664
                                                             , 12665
                                                             , 12666
                                                             , 12667
                                                             , 12668
                                                             , 12669
                                                             , 12670
                                                             , 12671
                                                             , 12672
                                                             , 12673
                                                             , 12674
                                                             , 12675
                                                             , 12676
                                                             , 12677
                                                             , 12678
                                                             , 12679
                                                             , 12680
                                                             , 12681
                                                             , 12682
                                                             , 12683
                                                             , 12684
                                                             , 12685
                                                             , 12686
                                                             , 12687
                                                             , 12688
                                                             , 12689
                                                             , 12690
                                                             , 12691
                                                             , 12692
                                                             , 12693
                                                             , 12694
                                                             , 12695
                                                             , 12696
                                                             , 12697
                                                             , 12698
                                                             , 12699
                                                             , 12700
                                                             , 12701
                                                             , 12702
                                                             , 12862
                                                             , 12863
                                                             , 12864
                                                             , 12865
                                                             , 12866
                                                             , 12867
                                                             , 12868
                                                             , 12869
                                                             , 12870
                                                             , 12871
                                                             , 12872
                                                             , 12873
                                                             , 12874
                                                             , 12875
                                                             , 12876
                                                             , 12877
                                                             , 12878
                                                             , 12879
                                                             , 12880
                                                             , 12881
                                                             , 12882
                                                             , 12883
                                                             , 12884
                                                             , 12885
                                                             , 12886
                                                             , 12887
                                                             , 12888
                                                             , 12889
                                                             , 12890
                                                             , 12891
                                                             , 12892
                                                             , 12893
                                                             , 12894
                                                             , 12895
                                                             , 12896
                                                             , 12897
                                                             , 12898
                                                             , 12899
                                                             , 12900
                                                             , 12901
                                                             , 12902
                                                             , 12903
                                                             , 12904
                                                             , 12905
                                                             , 12906
                                                             , 12907
                                                             , 12908
                                                             , 12909
                                                             , 12910
                                                             , 12911
                                                             , 12912
                                                             , 12913
                                                             , 12914
                                                             , 12915
                                                             , 12916
                                                             , 12917
                                                             , 12918
                                                             , 12919
                                                             , 12920
                                                             , 12921
                                                             , 12922
                                                             , 12923
                                                             , 12924
                                                             , 12925
                                                             , 12926
                                                             , 12927
                                                             , 12928
                                                             , 12929
                                                             , 12930
                                                             , 12931
                                                             , 12932
                                                             , 12933
                                                             , 12934
                                                             , 12935
                                                             , 12936
                                                             , 12937
                                                             , 12938
                                                             , 12939
                                                             , 12940
                                                             , 12941
                                                             , 12942
                                                             , 12943
                                                             , 12944
                                                             , 12945
                                                             , 12946
                                                             , 12947
                                                             , 12948
                                                             , 12949
                                                             , 12950
                                                             , 12951
                                                             , 12952
                                                             , 12953
                                                             , 12954
                                                             , 12955
                                                             , 12956
                                                             , 12957
                                                             , 12958
                                                             , 12959
                                                             , 12960
                                                             , 12961
                                                             , 12962
                                                             , 12963
                                                             , 12964
                                                             , 12965
                                                             , 12966
                                                             , 12967
                                                             , 12968
                                                             , 12969
                                                             , 12970
                                                             , 12971
                                                             , 12972
                                                             , 12973
                                                             , 12974
                                                             , 12975
                                                             , 12976
                                                             , 12977
                                                             , 12978
                                                             , 12979
                                                             , 12980
                                                             , 12981
                                                             , 12982
                                                             , 12983
                                                             , 12984
                                                             , 12985
                                                             , 12986
                                                             , 12987
                                                             , 12988
                                                             , 12989
                                                             , 12990
                                                             , 12991
                                                             , 12992
                                                             , 12993
                                                             , 12994
                                                             , 12995
                                                             , 12996
                                                             , 12997
                                                             , 12998
                                                             , 12999
                                                             , 13000
                                                             , 13001
                                                             , 13002
                                                             , 13003
                                                             , 13004
                                                             , 13005
                                                             , 13006
                                                             , 13007
                                                             , 13008
                                                             , 13009
                                                             , 13010
                                                             , 13011
                                                             , 13012
                                                             , 13013
                                                             , 13014
                                                             , 13015
                                                             , 13016
                                                             , 13017
                                                             , 13018
                                                             , 13019
                                                             , 13020
                                                             , 13092
                                                             , 13093
                                                             , 13094
                                                             , 13101
                                                             , 13102
                                                             , 13103
                                                             , 13104
                                                             , 13105
                                                             , 13106
                                                             , 13128
                                                             , 13129
                                                             , 13130
                                                             , 13131
                                                             , 13132
                                                             , 13133
                                                             , 13134
                                                             , 13135
                                                             , 13136
                                                             , 13137
                                                             , 13138
                                                             , 13139
                                                             , 13140
                                                             , 13141
                                                             , 13142
                                                             , 13143
                                                             , 13144
                                                             , 13145
                                                             , 13146
                                                             , 13147
                                                             , 13148
                                                             , 13156
                                                             , 13157
                                                             , 13158
                                                             , 13159
                                                             , 13160
                                                             , 13161
                                                             , 13162
                                                             , 13184
                                                             , 13185
                                                             , 13186
                                                             , 13187
                                                             , 13188
                                                             , 13189
                                                             , 13190
                                                             , 13191
                                                             , 13192
                                                             , 13193
                                                             , 13194
                                                             , 13195
                                                             , 13196
                                                             , 13197
                                                             , 13198
                                                             , 13199
                                                             , 13200
                                                             , 13201
                                                             , 13202
                                                             , 13203
                                                             , 13204
                                                                       )

























                                                           
                                                           
                                                           
                                                           
                                                           
                                                           

-- drop meaningless answers


            [juancarlos].[dbo].[Pew_answer].[Question_wording_std] = 'GRX_25_01_text'
       OR
            





-- Update from other table:
SELECT *
FROM
(
SELECT [Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
      ,[Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Data_source_fk]
      ,[Question_Year]
      ,[Short_wording]
      ,[Notes]
      ,[Default_response]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
  FROM [juancarlos].[dbo].[Pew_answer]
           ,[forum].[dbo].[Pew_Question]
where  Question_fk = Question_pk
and    Question_abbreviation_std 
       IN (
            , 



 NOT LIKE 'SVY%'
) AS C1
,
(
SELECT [Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
      ,[Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Data_source_fk]
      ,[Question_Year]
      ,[Short_wording]
      ,[Notes]
      ,[Default_response]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
  FROM [juancarlos].[dbo].[Pew_answer]
           ,[forum].[dbo].[Pew_Question]
where  Question_fk = Question_pk
and    Question_abbreviation_std NOT LIKE 'SVY%'
) AS W2


WHERE SUBSTRING ( expression ,start , length )





UPDATE
           [juancarlos].[dbo].[Pew_Answer]
SET
           [juancarlos].[dbo].[Pew_Answer].[Answer_Wording]
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




USE juancarlos ;
GO

IF OBJECT_ID ('Pew_AQ', 'V') IS NOT NULL
  DROP VIEW    Pew_AQ;
GO
   
CREATE VIEW    Pew_AQ
AS


SELECT [Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
      ,[Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Data_source_fk]
      ,[Question_Year]
      ,[Short_wording]
      ,[Notes]
      ,[Default_response]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
  FROM [forum].[dbo].[Pew_answer]
      ,[forum].[dbo].[Pew_Question]
where  Question_fk = Question_pk
and    Question_abbreviation_std NOT LIKE 'SVY%'




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



