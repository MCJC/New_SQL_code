/**************************************************************************************************************************/
-- Dec 31, 2014: several steps, one by one
----------------------------------------------------------------------------------------------------------------------------
USE              [forum]
GO
/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Religion_Group_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Religion_Group]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****   02: New temporary table, with extra rows                                                                     *****/
/**************************************************************************************************************************/
SELECT [Religion_group_pk]
      ,[Pew_religion]
      ,[Pew_religion_lev00]
      ,[Pew_religion_lev01]
      ,[Pew_religion_lev01_5]
      ,[Pew_RelL02_Display]
      ,[Pew_religion_lev02]
      ,[Pew_RelL02_5_Display]
      ,[Pew_religion_lev02_5]
      ,[Pew_religion_lev03]
      ,[Pew_religion_lev04]
      ,[Pew_religion_lev05]
      ,[Pew_rel_forGRandSH]
      ,[Pew_rel_forGvFavor]
      ,[RLS_web_R_denominations] = [a]
      ,[RLS_web_R_families]      = [b]
      ,[RLS_web_R_traditions]    = [c]
      ,[Wrd_religion_code]
      ,[wrd_religion_1]
      ,[wrd_religion_2]
      ,[wrd_religion_3]
      ,[R_sorter]
/*------------------------------------------------------------------------------------------------------------------------*/
                INTO                       #_Religion_Group
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [Pew_Religion_Group]              CT
LEFT
JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
(
          select X='RelAffili', a='RelAffili  -  final (recoded)', b='RelFamily  -  final (recoded)', c='RelTradit  -  final (recoded)'
Union all select X='American Buddhism', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Buddhist ambiguous affiliation', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Buddhist not further specified (just a Buddhist)', a='Buddhist, not further specified', b='Buddhist', c='Buddhist'
Union all select X='Jodo Shinshu', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Liberal interfaith Buddhism', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Mahamaya', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Mahayana (Zen) Buddhism', a='Mahayana (Zen) Buddhism', b='Buddhist', c='Buddhist'
Union all select X='Manjushri (Japanese) Buddhism', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Nichiren Buddhism, Soka Gakki (SGI)', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Shaman Buddhist', a='Other Buddhist groups', b='Buddhist', c='Buddhist'
Union all select X='Theravada (Vipassana) Buddhism', a='Theravada (Vipassana) Buddhism', b='Buddhist', c='Buddhist'
Union all select X='Vajrayana (Tibetan) Buddhism', a='Vajrayana (Tibetan) Buddhism', b='Buddhist', c='Buddhist'
Union all select X='Catholic', a='Catholic', b='Catholic', c='Catholic'
Union all select X='Don''t know/refused (no information on religious affiliation)', a='Don''t Know', b='Don''t Know', c='Don''t Know'
Union all select X='Advent Christian', a='Other Adventist group in the Evangelical Tradition', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God General Conference', a='Other Adventist group in the Evangelical Tradition', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God in Abrahamic Faith', a='Other Adventist group in the Evangelical Tradition', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God of the 7th Day', a='Other Adventist group in the Evangelical Tradition', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Philadelphia Church of God', a='Other Adventist group in the Evangelical Tradition', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Sacred Name Churches (e.g., Yahweh Assembly, Yahwists)', a='Other Adventist group in the Evangelical Tradition', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Seventh-Day Adventist', a='Seventh-Day Adventist', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Worldwide Church of God', a='Other Adventist group in the Evangelical Tradition', b='Adventist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Amish', a='Anabaptist in the Evangelical Tradition', b='Anabaptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Apostolic Christian Church', a='Anabaptist in the Evangelical Tradition', b='Anabaptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Brethren (not further specified) in the Evangelical Tradition', a='Anabaptist in the Evangelical Tradition', b='Anabaptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Brethren in Christ', a='Anabaptist in the Evangelical Tradition', b='Anabaptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Mennonite (not further specified)', a='Anabaptist in the Evangelical Tradition', b='Anabaptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Mennonite Brethren', a='Anabaptist in the Evangelical Tradition', b='Anabaptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='United Brethren in Christ/United Brethren', a='Anabaptist in the Evangelical Tradition', b='Anabaptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Anglican - Ambiguous affiliation in the Evangelical Tradition', a='Anglican/Episcopal in the Evangelical Tradition', b='Anglican/Episcopal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Anglican not further specified (just an Episcopalian) in the Evangelical Tradition', a='Anglican/Episcopal in the Evangelical Tradition', b='Anglican/Episcopal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Anglican Orthodox Church', a='Anglican/Episcopal in the Evangelical Tradition', b='Anglican/Episcopal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Conservative Anglican', a='Anglican/Episcopal in the Evangelical Tradition', b='Anglican/Episcopal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Reformed Episcopal Church', a='Anglican/Episcopal in the Evangelical Tradition', b='Anglican/Episcopal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='American Baptist Association', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Baptist - Ambiguous affiliation in the Evangelical Tradition', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Baptist Bible Fellowship', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Baptist General Conference; Swedish Baptist', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Baptist General Convention of Texas', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Baptist Missionary Association', a='Baptist Missionary Association', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Baptist not further specified (just a Baptist) in the Evangelical Tradition', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Conservative Baptist Association of America', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Electronic ministries - in Baptist in the Evangelical Tradition family', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Baptist', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Free Baptist', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Free Will Baptist', a='Free Will Baptist', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Full Gospel Baptist Association', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Fundamentalist Baptist', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='General Association of Regular Baptists', a='General Association of Regular Baptists', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Independent Baptist in the Evangelical Tradition', a='Independent Baptist in the Evangelical Tradition', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Missionary Baptist in the Evangelical Tradition- not Baptist Missionary Association', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='North American Baptist', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Other Baptist denomination in the Evangelical Tradition', a='Other Baptist denomination in the Evangelical Tradition', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Primitive Baptist', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Reformed Baptist (Calvinist)', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Seventh-Day Baptist', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Slavic Evangelical Baptist Church', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Southern Baptist Convention', a='Southern Baptist Convention', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='United Baptist Church', a='Baptist in the Evangelical Tradition, not further specified', b='Baptist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Congregationalist - Ambiguous affiliation in the Evangelical Tradition', a='Other Congregationalist denomination in the Evangelical Trad.', b='Congregationalist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Congregationalist not further specified (just a Congregationalist) in Evang. Tradition', a='Congregationalist in the Evangelical Trad., not further specified', b='Congregationalist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Conservative Congregational Christian', a='Conservative Congregational Christian', b='Congregationalist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Congregational', a='Other Congregationalist denomination in the Evangelical Trad.', b='Congregationalist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Independent Congregational Church', a='Other Congregationalist denomination in the Evangelical Trad.', b='Congregationalist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='National Association of Congregational Christian Churches', a='Other Congregationalist denomination in the Evangelical Trad.', b='Congregationalist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Christian and Missionary Alliance/Alliance', a='Christian and Missionary Alliance', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God (Anderson, Indiana)', a='Church of God (Anderson, Indiana)', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God of Findlay, OH', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God of Michigan', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of the Nazarene', a='Church of the Nazarene', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Free Holiness', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Free Methodist Church', a='Free Methodist Church', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Holiness - Ambiguous affiliation in the Evangelical Tradition', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Holiness not further specified (just Holiness) in the Evangelical Tradition', a='Holiness in the Evangelical Tradition, not further specified', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Pilgrim Holiness Church', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Salvation Army', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Wesleyan Church', a='Wesleyan Church', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Wesleyan Methodist Church', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='World Gospel Mission/Holiness Missionary', a='Other Holiness denomination in the Evangelical Tradition', b='Holiness in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Apostolic Lutheran Church in America', a='Other Lutheran denomination in the Evangelical Tradition', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of the Lutheran Confession', a='Other Lutheran denomination in the Evangelical Tradition', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Free Lutheran', a='Other Lutheran denomination in the Evangelical Tradition', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Lutheran - Ambiguous affiliation in the Evangelical Tradition', a='Other Lutheran denomination in the Evangelical Tradition', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Lutheran Brethren', a='Other Lutheran denomination in the Evangelical Tradition', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Lutheran Church, Missouri Synod', a='Lutheran Church, Missouri Synod', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Lutheran Church, Wisconsin Synod', a='Lutheran Church, Wisconsin Synod', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Lutheran Congregations in Mission for Christ', a='Other Lutheran denomination in the Evangelical Tradition', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Lutheran not further specified (just a Lutheran) in the Evangelical Tradition', a='Lutheran in the Evangelical Tradition, not further specified', b='Lutheran in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Congregational Methodist', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Methodist', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Independent Methodist', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Methodist - Ambiguous Affiliation in the Evangelical Tradition', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Methodist not further specified (just a Methodist) in the Evangelical Tradition', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Missionary Methodist', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Primitive Methodist', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Traditional Methodist', a='Methodist in the Evangelical Tradition', b='Methodist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Association of Bridge Churches', a='Other nondenominational group in the Evangelical Tradition', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Community Church in the Evangelical Tradition', a='Community Church in the Evangelical Tradition', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Federated or union church in the Evangelical Tradition', a='Other nondenominational group in the Evangelical Tradition', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Interdenominational in the Evangelical Tradition', a='Interdenominational in the Evangelical Tradition', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational - Ambiguous affiliation in the Evangelical Tradition', a='Other nondenominational group in the Evangelical Tradition', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational charismatic', a='Nondenominational charismatic', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational Christian', a='Nondenominational Christian', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational electronic ministries', a='Other nondenominational group in the Evangelical Tradition', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational evangelical', a='Nondenominational evangelical', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational fundamentalist', a='Nondenominational fundamentalist', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational not further specified (just Nondenominational) in Evang. Tradition', a='Nondenominational in the Evang. Trad., not further specified', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational Protestant', a='Other nondenominational group in the Evangelical Tradition', b='Nondenominational in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Bible/Gospel/Missionary churches', a='Other Evangelical/Fundamentalist', b='Other Evangelical/Fundamentalist', c='Evangelical Protestant Churches'
Union all select X='Born again/Bible Believer', a='Other Evangelical/Fundamentalist', b='Other Evangelical/Fundamentalist', c='Evangelical Protestant Churches'
Union all select X='Charismatic/Spirit-filled', a='Other Evangelical/Fundamentalist', b='Other Evangelical/Fundamentalist', c='Evangelical Protestant Churches'
Union all select X='Electronic ministries - in Other Evangelical/Fundamentalist family', a='Other Evangelical/Fundamentalist', b='Other Evangelical/Fundamentalist', c='Evangelical Protestant Churches'
Union all select X='Evangelical (not further specified)', a='Other Evangelical/Fundamentalist', b='Other Evangelical/Fundamentalist', c='Evangelical Protestant Churches'
Union all select X='Evangelical Bible Church', a='Other Evangelical/Fundamentalist', b='Other Evangelical/Fundamentalist', c='Evangelical Protestant Churches'
Union all select X='Fundamentalist (not further specified)', a='Other Evangelical/Fundamentalist', b='Other Evangelical/Fundamentalist', c='Evangelical Protestant Churches'
Union all select X='Apostolic Pentecostal in the Evangelical Tradition', a='Apostolic Pentecostal in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Assemblies of God', a='Assemblies of God', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Assembly of Christian Churches', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Calvary Chapel', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God Cleveland, Tennessee', a='Church of God Cleveland Tennessee', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God not further specified', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God of Kentucky', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God of Prophecy', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God of the Apostolic Faith', a='Church of God of the Apostolic Faith', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God of the Midwest', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Elim Fellowship', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Pentecostal', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Four Square Gospel', a='Four Square Gospel', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Full Gospel in the Evangelical Tradition', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Hispanic Pentecostal in the Evangelical Tradition', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='International Pentecostal Church of Christ', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Missionary church', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Nondenominational, Independent Pentecostal in the Evangelical Tradition', a='Nondenominational, Independent Pentecostal', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Open Bible Standard Churches', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Pentecostal- Ambiguous affiliation in the Evangelical Tradition', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Pentecostal Church of God', a='Pentecostal Church of God', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Pentecostal Electronic ministries', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Pentecostal Holiness Church', a='Pentecostal Holiness Church', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Pentecostal not further specified (just a Pentecostal) in the Evangelical Tradition', a='Pentecostal in the Evangelical Tradition, not further specified', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Vineyard Fellowship', a='Other Pentecostal denomination in the Evangelical Tradition', b='Pentecostal in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of God Winebrenner Fellowship', a='Pietist in the Evangelical Tradition', b='Pietist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Covenant Church', a='Pietist in the Evangelical Tradition', b='Pietist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Free Church', a='Pietist in the Evangelical Tradition', b='Pietist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Free Mission Church', a='Pietist in the Evangelical Tradition', b='Pietist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Pietist', a='Pietist in the Evangelical Tradition', b='Pietist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Associate Reformed Presbyterian', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Bible Presbyterian Church', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Community Presbyterian Church in America', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Congregational Presbyterian', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Conservative Presbyterian Church', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Cumberland Presbyterian Church', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Presbyterian', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Independent Presbyterian', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Orthodox Presbyterian', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Presbyterian - Ambiguous affiliation in the Evangelical Tradition', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Presbyterian Church in America', a='Presbyterian Church in America', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Presbyterian not further specified (just a Presbyterian) in the Evangelical Tradition', a='Presbyterian in the Evangelical Tradition, not further specified', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Reformed Presbyterian', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='World Presbyterian Board', a='Other Presbyterian denomination in the Evangelical Tradition', b='Presbyterian in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Protestant non-specific in the Evangelical Tradition', a='Protestant nonspecific in the Evangelical Tradition', b='Protestant nonspecific in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Christian Reformed Church', a='Christian Reformed Church', b='Reformed in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Association of Reformed and Congregational Churches', a='Other Reformed denomination in the Evangelical Tradition', b='Reformed in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Evangelical Reformed', a='Other Reformed denomination in the Evangelical Tradition', b='Reformed in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Reformed - Ambiguous affiliation in the Evangelical Tradition', a='Other Reformed denomination in the Evangelical Tradition', b='Reformed in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Reformed not further specified (just Reformed) in the Evangelical Tradition', a='Reformed in the Evangelical Tradition, not further specified', b='Reformed in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Sovereign Grace', a='Other Reformed denomination in the Evangelical Tradition', b='Reformed in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='United Reformed Churches of North America', a='Other Reformed denomination in the Evangelical Tradition', b='Reformed in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Christian Churches and Churches of Christ', a='Christian Churches and Churches of Christ', b='Restorationist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Church of Christ', a='Church of Christ', b='Restorationist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Restorationist - Ambiguous affiliation in the Evangelical Tradition', a='Restorationist in the Evangelical Trad., not further specified', b='Restorationist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='Restorationist not further specified in the Evangelical Tradition', a='Restorationist in the Evangelical Trad., not further specified', b='Restorationist in the Evangelical Tradition', c='Evangelical Protestant Churches'
Union all select X='BAPS', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Brahmin', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Cultural Hindu', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Hari Krishna', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Hindu - Multiple traditions', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Hindu ambiguous affiliation', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Hindu not further specified (just a Hindu)', a='Hindu, not further specified', b='Hindu', c='Hindu'
Union all select X='Jainism', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Kali', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Kshatriya', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Liberal Hinduism', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Shaivite Hinduism', a='Shaivite Hinduism', b='Hindu', c='Hindu'
Union all select X='Shaktism Hinduism', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Sindhi', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Vaishnava Hinduism', a='Vaishnava Hinduism', b='Hindu', c='Hindu'
Union all select X='Vedanta', a='Other Hindu groups', b='Hindu', c='Hindu'
Union all select X='Baptist - Ambiguous Affiliation in the Historically Black Protestant Tradition', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Baptist Bible Church in the Historically Black Protestant Tradition', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Baptist not further specified (just a Baptist) in the Historically Black Protestant Tradition', a='Baptist in the Historically Black Tradition, not further specified', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Black Baptist', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Christian Baptist Church of God', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Evangelical Baptist in the Historically Black Protestant Tradition', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Full Gospel Baptist in the Historically Black Protestant Tradition', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Fundamentalist Baptist in the Historically Black Protestant Tradition', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Independent Baptist in the Historically Black Protestant Tradition', a='Independent Baptist in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='International Baptist', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Missionary Baptist in the Historically Black Protestant Tradition', a='Missionary Baptist', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='National Baptist Convention', a='National Baptist Convention', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='National/Progressive Baptist Convention', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Primitive Baptist in the Historically Black Protestant Tradition', a='Other Baptist denomination in the Historically Black Tradition', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Progressive Baptist Convention', a='Progressive Baptist Convention', b='Baptist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Apostolic Holiness Church', a='Holiness in the Historically Black Tradition', b='Holiness in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Holiness - Ambiguous affiliation in the Historically Black Protestant Tradition', a='Holiness in the Historically Black Tradition', b='Holiness in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Holiness Baptist', a='Holiness in the Historically Black Tradition', b='Holiness in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Holiness not further specified (just Holiness) in the Historically Black Prot. Tradition', a='Holiness in the Historically Black Tradition', b='Holiness in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Independent Holiness in the Historically Black Protestant Tradition', a='Holiness in the Historically Black Tradition', b='Holiness in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='African Methodist Episcopal', a='African Methodist Episcopal', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='African Methodist Episcopal Zion', a='African Methodist Episcopal Zion', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Black Methodist', a='Other Methodist denomination in the Historically Black Trad.', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Christian Methodist Episcopal Church', a='Christian Methodist Episcopal Church', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Methodist - Ambiguous Affiliation in the Historically Black Protestant Tradition', a='Other Methodist denomination in the Historically Black Trad.', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Methodist not further specified (just a Methodist) in the Hist. Black Protestant Tradition', a='Methodist in the Historically Black Trad., not further specified', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Missionary Methodist in the Historically Black Protestant Tradition', a='Other Methodist denomination in the Historically Black Trad.', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Reformed Methodist', a='Other Methodist denomination in the Historically Black Trad.', b='Methodist in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Nondenominational not further specified (just Nondenom.) in Hist. Black Prot. Tradition', a='Nondenominational in the Historically Black Tradition', b='Nondenominational in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Nondenominational Protestant - Ambiguous Affiliation in Hist. Black Prot. Tradition', a='Nondenominational in the Historically Black Tradition', b='Nondenominational in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Apostolic Pentecostal in the Historically Black Protestant Tradition', a='Apostolic Pentecostal in the Historically Black Tradition', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Church of God in Christ', a='Church of God in Christ', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Church of God in Christ Holiness', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Full Gospel in the Historically Black Protestant Tradition', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Hispanic Pentecostal in the Historically Black Protestant Tradition', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='New Testament Church of God', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Nondenominational, Independent Pentecostal in the Hist. Black Protestant Tradition', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Pentecostal- Ambiguous affiliation in the Historically Black Protestant Tradition', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Pentecostal not further specified (just a Pentecostal) in the Hist. Black Prot. Tradition', a='Pentecostal in the Historically Black Trad., not further specified', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='United House of Prayer for All People', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='United Pentecostal Church International', a='United Pentecostal Church International', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='World Gospel Mission', a='Other Pentecostal denomination in the Historically Black Trad.', b='Pentecostal in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='Protestant non-specific in the Historically Black Protestant Tradition', a='Protestant nonspecific in the Historically Black Tradition', b='Protestant nonspecific in the Historically Black Tradition', c='Historically Black Churches'
Union all select X='International Bible Students', a='Jehovah''s Witness', b='Jehovah''s Witness', c='Jehovah''s Witness'
Union all select X='Jehovah''s Witness', a='Jehovah''s Witness', b='Jehovah''s Witness', c='Jehovah''s Witness'
Union all select X='Conservative Jewish', a='Conservative', b='Jewish', c='Jewish'
Union all select X='Culturally Jewish', a='Other Jewish groups', b='Jewish', c='Jewish'
Union all select X='Jewish - ambiguous affiliation', a='Other Jewish groups', b='Jewish', c='Jewish'
Union all select X='Jewish - Mulitple traditions', a='Other Jewish groups', b='Jewish', c='Jewish'
Union all select X='Jewish not further specified (just jewish)', a='Jewish, not further specified', b='Jewish', c='Jewish'
Union all select X='Jewish Renewal', a='Other Jewish groups', b='Jewish', c='Jewish'
Union all select X='Orthodox Jewish', a='Orthodox', b='Jewish', c='Jewish'
Union all select X='Post Denominational Jewish', a='Other Jewish groups', b='Jewish', c='Jewish'
Union all select X='Reconstructionist Jewish', a='Other Jewish groups', b='Jewish', c='Jewish'
Union all select X='Reform Jewish', a='Reform', b='Jewish', c='Jewish'
Union all select X='Traditional Jewish', a='Other Jewish groups', b='Jewish', c='Jewish'
Union all select X='Brethren (not further specified) in the Mainline Tradition', a='Anabaptist in the Mainline Tradition', b='Anabaptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Church of the Brethren', a='Anabaptist in the Mainline Tradition', b='Anabaptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Moravian Church', a='Anabaptist in the Mainline Tradition', b='Anabaptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Anglican - Ambiguous affiliation in the Mainline Tradition', a='Other Anglican/Episcopal denomination in the Mainline Trad.', b='Anglican/Episcopal in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Anglican Church (Church of England)', a='Anglican Church (Church of England)', b='Anglican/Episcopal in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Anglican not further specified (just an Episcopalian) in the Mainline Tradition', a='Anglican/Episcopal in the Mainline Trad., not further specified', b='Anglican/Episcopal in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Church of Ireland', a='Other Anglican/Episcopal denomination in the Mainline Trad.', b='Anglican/Episcopal in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Episcopal Church in the USA', a='Episcopal Church in the USA', b='Anglican/Episcopal in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='American Baptist Churches in the USA', a='American Baptist Churches in USA', b='Baptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Baptist - Ambiguous affiliation in the Mainline Tradition', a='Other Baptist denomination in the Mainline Tradition', b='Baptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Baptist not further specified (just a Baptist) in the Mainline Tradition', a='Baptist in the Mainline Tradition, not further specified', b='Baptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Cooperative Baptist Fellowship; Baptist Alliance', a='Other Baptist denomination in the Mainline Tradition', b='Baptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Liberal/Progressive Baptist', a='Other Baptist denomination in the Mainline Tradition', b='Baptist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Congregationalist - Ambiguous affiliation in the Mainline Tradition', a='Congregationalist in the Mainline Trad., not further specified', b='Congregationalist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Congregationalist not further specified (just a Congregationalist) in Mainline Tradition', a='Congregationalist in the Mainline Trad., not further specified', b='Congregationalist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='United Church of Christ', a='United Church of Christ', b='Congregationalist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Friends, Quaker (not further specified)', a='Friends in the Mainline Tradition', b='Friends in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Society of Friends', a='Friends in the Mainline Tradition', b='Friends in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='American Lutheran Church', a='Other Lutheran denomination in the Mainline Tradition', b='Lutheran in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Evangelical Lutheran Church in America (ELCA)', a='Evangelical Lutheran Church in America (ELCA)', b='Lutheran in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Latvian Evangelical Lutheran Church in America', a='Other Lutheran denomination in the Mainline Tradition', b='Lutheran in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Lutheran - Ambiguous affiliation in the Mainline Tradition', a='Other Lutheran denomination in the Mainline Tradition', b='Lutheran in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Lutheran not further specified (just a Lutheran) in the Mainline Tradition', a='Lutheran in the Mainline Tradition, not further specified', b='Lutheran in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Evangelical United Brethren', a='Other Methodist denomination in the Mainline Tradition', b='Methodist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Methodist - Ambiguous Affiliation in the Mainline Tradition', a='Other Methodist denomination in the Mainline Tradition', b='Methodist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Methodist not further specified (just a Methodist) in the Mainline Tradition', a='Methodist in the Mainline Tradition, not further specified', b='Methodist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='United Methodist Church', a='United Methodist Church', b='Methodist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Community church in the Mainline Tradition', a='Other nondenominational group in the Mainline Tradition', b='Nondenominational in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Emergent church', a='Other nondenominational group in the Mainline Tradition', b='Nondenominational in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Federated or union church in the Mainline Tradition', a='Other nondenominational group in the Mainline Tradition', b='Nondenominational in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Interdenominational in the Mainline Tradition', a='Interdenominational in the Mainline Tradition', b='Nondenominational in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Liberal Nondenominational', a='Other nondenominational group in the Mainline Tradition', b='Nondenominational in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Nondenominational - Ambiguous affiliation in the mainline Tradition', a='Other nondenominational group in the Mainline Tradition', b='Nondenominational in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Nondenominational not further specified (just Nondenominational) in Mainline Tradition', a='Nondenominational in the Mainline Trad., not further specified', b='Nondenominational in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Liberal Presbyterian', a='Other Presbyterian denomination in the Mainline Tradition', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Mainline Presbyterian - Ambiguous affiliation in the Mainline Tradition', a='Other Presbyterian denomination in the Mainline Tradition', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Other Presbyterian in the Mainline Tradition', a='Other Presbyterian denomination in the Mainline Tradition', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Presbyterian Church of Canada', a='Other Presbyterian denomination in the Mainline Tradition', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Presbyterian Church USA', a='Presbyterian Church USA', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Presbyterian not further specified (just a Presbyterian) in the Mainline Tradition', a='Presbyterian in the Mainline Tradition, not further specified', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Scotch Presbyterian', a='Other Presbyterian denomination in the Mainline Tradition', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='United Presbyterian', a='Other Presbyterian denomination in the Mainline Tradition', b='Presbyterian in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Metropolitan Community Church', a='Other/Protestant nonspecifi c in the Mainline Tradition', b='Other/Protestant nonspecifi c in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Protestant non-specific/other in the Mainline Tradition', a='Other/Protestant nonspecifi c in the Mainline Tradition', b='Other/Protestant nonspecifi c in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Congregational Union of Scotland', a='Other Reformed denomination in the Mainline Tradition', b='Reformed in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Free Hungarian Reformed Church', a='Other Reformed denomination in the Mainline Tradition', b='Reformed in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Reformed - Ambiguous affiliation in the Mainline Tradition', a='Other Reformed denomination in the Mainline Tradition', b='Reformed in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Reformed Church in America', a='Reformed Church in America', b='Reformed in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Reformed not further specified (just Reformed) in the Mainline Tradition', a='Reformed in the Mainline Tradition, not further specified', b='Reformed in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Disciples of Christ', a='Disciples of Christ', b='Restorationist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Restorationist - Ambiguous affiliation in the Mainline Tradition', a='Restorationist in the Mainline Tradition, not further specified', b='Restorationist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Restorationist not further specified in the Mainline Tradition', a='Restorationist in the Mainline Tradition, not further specified', b='Restorationist in the Mainline Tradition', c='Mainline Protestant Churches'
Union all select X='Church of Jesus Christ of Latter Day Saints', a='Church of Jesus Christ of Latter Day Saints', b='Mormon', c='Mormon'
Union all select X='Community of Christ', a='Community of Christ', b='Mormon', c='Mormon'
Union all select X='Mormon - ambiguous affiliation', a='Mormon, not further specified', b='Mormon', c='Mormon'
Union all select X='Mormon not further specified', a='Mormon, not further specified', b='Mormon', c='Mormon'
Union all select X='Al-Islam', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='Moor', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='Moorish Science Temple of America', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='Muslim - ambiguous affiliation', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='Muslim not further specified (just a Muslim)', a='Muslim, not further specified', b='Muslim', c='Muslim'
Union all select X='Nation of Islam/Black Muslim', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='Orthodox Muslim', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='Shia', a='Shia', b='Muslim', c='Muslim'
Union all select X='Sunni', a='Sunni', b='Muslim', c='Muslim'
Union all select X='Wahhabism', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='World Islamic League', a='Other Muslim groups', b='Muslim', c='Muslim'
Union all select X='Albanian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Antiochian Orthodox Church', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Armenian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Coptic/Egyptian Orthodox Church', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Eastern Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Ethiopian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Greek Orthodox', a='Greek Orthodox', b='Orthodox', c='Orthodox'
Union all select X='Macedonian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Orthodox ambiguous affiliation', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Orthodox Church in America', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Orthodox not further specified (just Orthodox)', a='Orthodox, not further specified', b='Orthodox', c='Orthodox'
Union all select X='Rumanian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Russian Orthodox', a='Russian Orthodox', b='Orthodox', c='Orthodox'
Union all select X='Serbian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Syrian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Ukrainian Orthodox', a='Other Orthodox church', b='Orthodox', c='Orthodox'
Union all select X='Christian Science', a='Other Metaphysical', b='Metaphysical', c='Other Christian'
Union all select X='Metaphysical', a='Other Metaphysical', b='Metaphysical', c='Other Christian'
Union all select X='Religious science', a='Other Metaphysical', b='Metaphysical', c='Other Christian'
Union all select X='Spiritualist', a='Spiritualist', b='Metaphysical', c='Other Christian'
Union all select X='Unity/Unity Church/Christ Church Unity', a='Unity; Unity Church; Christ Church Unity', b='Metaphysical', c='Other Christian'
Union all select X='Hebrew Israelite/African Hebrew Israelite', a='Other', b='Other', c='Other Christian'
Union all select X='Indian Shaker Church', a='Other', b='Other', c='Other Christian'
Union all select X='Messianic Jew', a='Other', b='Other', c='Other Christian'
Union all select X='Mixed Christians (e.g., Catholic AND Protestant affiliation)', a='Other', b='Other', c='Other Christian'
Union all select X='Mixed Christians and non-Christians (e.g., Protestant AND Buddhist)', a='Other', b='Other', c='Other Christian'
Union all select X='New Apostolic Church', a='Other', b='Other', c='Other Christian'
Union all select X='Orthodox Lutheran Church (Lutheran Church/Catholic Rite)', a='Other', b='Other', c='Other Christian'
Union all select X='Unification Church', a='Other', b='Other', c='Other Christian'
Union all select X='Native American Religions', a='Native American Religions', b='Native American Religions', c='Other Faiths'
Union all select X='Asatru', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Druid', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Eckankar', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='New Age', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='New Thought', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Pagan', a='Pagan', b='New Age', c='Other Faiths'
Union all select X='Pantheist', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Satanism', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Scientology', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Theosophy', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Transcendental meditation/Meditation', a='Other New Age groups', b='New Age', c='Other Faiths'
Union all select X='Wica (Wiccan)', a='Wica (Wiccan)', b='New Age', c='Other Faiths'
Union all select X='Deist', a='Other liberal faith groups', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Eclectic/Bit of everything/Own beliefs', a='Eclectic, "a bit of everything," own beliefs', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Humanist', a='Other liberal faith groups', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Liberal faith', a='Liberal faith', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Nihilist', a='Other liberal faith groups', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Self realization', a='Other liberal faith groups', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Spiritual but not religious', a='Spiritual but not religious', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Unitarian (Universalist)', a='Unitarian (Universalist)', b='Unitarians and other Liberal Faiths', c='Other Faiths'
Union all select X='Animism', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Bahai', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Mixed non-Christians', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Rastafarian', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Shamanism (non-Western)', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Shinto', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Siddhayoga', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Sikh', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Tao', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Zoroastrianism', a='Other World Religions', b='Other World Religions', c='Other World Religions'
Union all select X='Agnostic', a='Agnostic', b='Agnostic', c='Unaffiliated'
Union all select X='Atheist', a='Atheist', b='Atheist', c='Unaffiliated'
Union all select X='Nothing in particular', a='Nothing in particular', b='Nothing in particular', c='Unaffiliated'
)  RLSCateg

on [Pew_religion] = X
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****   03: New table, with updated structure (reorganized fields)                                         (re-create) ***/
/**************************************************************************************************************************/
USE              [forum]
GO
/*------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID           (N'[forum].[dbo].[Pew_Religion_Group]', N'U') IS NOT NULL
DROP   TABLE              [forum].[dbo].[Pew_Religion_Group]
GO
/**************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [dbo].[Pew_Religion_Group](
										[Religion_group_pk]        [int]       NOT NULL,
										[Pew_religion]             [nvarchar](255) NULL,
										[Pew_religion_lev00]       [varchar]  (50) NULL,
										[Pew_religion_lev01]       [varchar]  (50) NULL,
										[Pew_religion_lev01_5]     [varchar]  (50) NULL,
										[Pew_RelL02_Display]       [varchar]  (50) NULL,
										[Pew_religion_lev02]       [varchar]  (50) NULL,
										[Pew_RelL02_5_Display]     [varchar]  (50) NULL,
										[Pew_religion_lev02_5]     [varchar]  (50) NULL,
										[Pew_religion_lev03]       [varchar]  (50) NULL,
										[Pew_religion_lev04]       [varchar]  (50) NULL,
										[Pew_religion_lev05]       [varchar]  (50) NULL,
										[Pew_rel_forGRandSH]       [varchar]  (50) NULL,
										[Pew_rel_forGvFavor]       [varchar]  (50) NULL,
										[RLS_web_R_denominations]  [varchar] (255) NULL,
										[RLS_web_R_families]       [varchar] (255) NULL,
										[RLS_web_R_traditions]     [varchar] (255) NULL,
										[Wrd_religion_code]        [nvarchar]  (5) NULL,
										[wrd_religion_1]           [varchar]   (5) NULL,
										[wrd_religion_2]           [varchar]   (5) NULL,
										[wrd_religion_3]           [varchar]   (5) NULL,
										[R_sorter]                 [varchar]  (25) NULL,
							 CONSTRAINT [PK_Pew_Religion_group] PRIMARY KEY CLUSTERED 
										(
											[Religion_group_pk] ASC
																   )WITH (PAD_INDEX               = OFF,
																          STATISTICS_NORECOMPUTE  = OFF,
																          IGNORE_DUP_KEY          = OFF,
																          ALLOW_ROW_LOCKS         = ON ,
																          ALLOW_PAGE_LOCKS        = ON  ) ON [PRIMARY]
																										) ON [PRIMARY]
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
SET ANSI_PADDING OFF
GO
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****   04: Load updated data into new table                                                                         *****/
/**************************************************************************************************************************/
INSERT 
INTO    [Pew_Religion_Group]
SELECT   *
FROM   #_Religion_Group
GO
/**************************************************************************************************************************/

