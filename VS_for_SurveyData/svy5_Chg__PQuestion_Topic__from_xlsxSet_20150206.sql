/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
	USE [x_LoadRLS1cUS]                                                        /* use wkDB - just delete for final script */
--	USE [forum]                                                                /* use final database                      */
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar(15)                                                 /* declare variable to store current date  */
  SET     @CrDt = (  REPLACE(
                     REPLACE(
                     REPLACE(
                     CONVERT(VARCHAR(19), GETDATE(), 120)
                                                         ,'-','' )
                                                         ,' ','_')
                                                         ,':','' )  )          /* store date in format YYYYMMDD_hhmmss    */
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Topic_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Topic]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Question_topic_pk]) AS [CMPK] /* select currently max pk                 */
                                       FROM     [Pew_Question_Topic] )    CM   /* from Questions by Topics                */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: QAb+StdVal+NoStdVal+AnsWd */
/*------------------------------------------------------------------------------------------------------------------------*/

SELECT
 L = 'If parent/guardian of one child: How old is this child?'
,T = '2'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'If parent/guardian of more than one child: How old is the oldest of these children?'
,T = '2'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'If parent/guardian of more than one child: How old is the youngest of these children?'
,T = '2'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Were you raised as a ''born-again'' or as an evangelical Christian, or not?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'What is the highest level of school you have completed or the highest degree you have received?'
,T = '20'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How many children have you ever had? Please count all your biological children who were born alive at any time in your life.'
,T = '8'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How many people, including yourself, live in your household?'
,T = '14'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How many, including yourself (from those living in your household), are adults, age 18 and older?'
,T = '14'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'If last year (2013) your total family income from all sources, before taxes exceeds $150,000: what was your total family income?'
,T = '7'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you personally think of yourself as ONE, [IF SEXASK=1: gay; FOR ALL OTHERS: gay or lesbian,] TWO, Straight, that is, not gay or THREE, bisexual?'
,T = '49'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Generally, how would you say things are these days in your life - would you say that you are very happy, pretty happy, or not too happy?'
,T = '50'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'And are you satisfied or dissatisfied with Your health. REQUIRED PROBE: Would you say you are VERY (dis)satisfied or SOMEWHAT (dis)satisfied?'
,T = '50'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How about a growing population of immigrants? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,T = '58'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How about More women in the workforce? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,T = '48'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How about More people having children without getting married? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,T = '51'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you strongly favor, favor, oppose or strongly oppose allowing gays and lesbians to marry legally?'
,T = '49'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which statement comes closer to your own views —even if neither is exactly right: (1) Government aid to the poor does more harm than good, by making people too dependent on government assistance  OR  (2) Government aid to the poor does more good than harm, because people can’t get out of poverty until their basic needs are met'
,T = '73'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which statement comes closer to your own views —even if neither is exactly right: (1) There are clear and absolute standards for what is right and wrong  OR  (2) Whether something is right or wrong often depends on the situation'
,T = '52'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'And do you think that  (1) Humans and other living things have evolved due to natural processes such as natural selection,  OR  (2) A supreme being guided the evolution of living things for the purpose of creating humans and other life in the form it exists today?'
,T = '55'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you personally a member of a local [synagogue/mosque/temple/church] or other house of worship, or not?'
,T = '41'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Thinking specifically about just the past week, that is the past seven days - did you yourself happen to do any volunteer work in the last seven days, or not?'
,T = '58'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'If R did any volunteer work in the last seven days: And was that mainly through a church or other religious organization, or not? [INTERVIEWER INSTRUCTION: IF R SAYS THEY ONLY VOLUNTEERED THROUGH CHURCH/OTHER RELIGIOUS ORGANIZATION, RECORD AS CODE 1]'
,T = '58'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How often do you... feel a strong sense of gratitude or thankfulness?'
,T = '40'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How often do you... think about the meaning and purpose of life?'
,T = '40'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As I read a list, please tell me if you do any of the following things: Do you and [your child/any of your children] do volunteer work together?'
,T = '58'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: "Churches and other religious organizations... Focus too much on rules?"'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: "Churches and other religious organizations… Are too concerned with money and power"'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: "Churches and other religious organizations... Are too involved with politics"'
,T = '73'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: "Churches and other religious organizations... Protect and strengthen morality in society"'
,T = '52'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: "Churches and other religious organizations... Bring people together and strengthen community bonds"'
,T = '58'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: "Churches and other religious organizations… Play an important role in helping the poor and needy"'
,T = '54'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'In what year did you come to live in the U.S?'
,T = '58'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you personally know anyone who is gay or lesbian, or not?'
,T = '49'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Does anyone in your household have a working cell phone?'
,T = '11'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'religious commitment - 3 categories'
,T = '36'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Is your spouse/partner of Hispanic, Latino, or Spanish origin, such as Mexican, Puerto Rican or Cuban?-Includes SPRACE backcodes'
,T = '9'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'What is your age?'
,T = '2'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you the parent or a guardian of any children under 18 now living in your household? (IF YES: And may I ask how many?)'
,T = '8'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you think of yourself as a Christian or not?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'region'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'density (quintiles)'
,T = '14'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'What is the last grade or class that you completed in school? [DO NOT READ]'
,T = '20'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'categories from ''DENOM'' grouped into denominational families by religious tradition'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'split'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you, yourself, of Hispanic origin or descent, such as Mexican, Puerto Rican, Cuban, or some other Spanish background?'
,T = '9'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'In general, would you describe your political views as… [READ]?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Last year, that is in 2006, what was your total family income from all sources, before taxes? Just stop me when I get to the right category. (READ IN ORDER)'
,T = '7'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Language of Interview'
,T = '9'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you currently married, living with a partner, divorced, separated, widowed, or have you never been married? (7-categories answer)'
,T = '29'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'In politics TODAY, do you consider yourself a Republican, Democrat, or Independent?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As of today do you lean more to the Republican Party or more to the Democratic Party?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'categories from ''FAMILY'' grouped into Protestant denominational families'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'In the 2004 presidential election between George W. Bush and John Kerry, did things come up that kept you from voting, or did you happen to vote?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Did you vote for Bush, Kerry or someone else?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now, as I read some statements on a few different topics, please tell me if you completely agree, mostly agree, mostly DISagree or completely disagree with each one: I often feel that my values are threatened by Hollywood and the entertainment industry'
,T = '52'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now, as I read some statements on a few different topics, please tell me if you completely agree, mostly agree, mostly DISagree or completely disagree with each one: Evolution is the best explanation for the origins of human life on earth'
,T = '46'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'When it comes to questions of right and wrong, which of the following do you look to most for guidance? Would you say (READ; RANDOMIZE)'
,T = '52'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'What is your present religion, if any? Are you Protestant, Roman Catholic, Mormon, Orthodox such as Greek or Russian Orthodox, Jewish, Muslim, Buddhist, Hindu, atheist, agnostic, something else, or nothing in particular?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'As far as your present religion, what denomination or church, if any, do you identify with most closely? Just stop me when I get to the right one. Are you (READ)'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Baptist churches, if any, do you identify with most closely? The Southern Baptist Convention, the American Baptist Churches in the U.S.A., an independent Baptist church, or some other Baptist church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Baptist churches, if any, do you identify with most closely? The National Baptist Convention, the Progressive Baptist Convention, or some other Baptist church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Methodist churches, if any, do you identify with most closely? The United Methodist Church, Free Methodist Church, or some other Methodist church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Methodist churches, if any, do you identify with most closely? The African Methodist Episcopal Church, the African Methodist Episcopal Church Zion, the Christian Methodist Episcopal Church, or some other Methodist church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following kinds of nondenominational churches, if any, do you identify with most closely? An evangelical church, fundamentalist church, charismatic church, Inter-denominational church, or some other kind of church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Lutheran churches, if any, do you identify with most closely? The Evangelical Lutheran Church in America, the Lutheran Church Missouri Synod or some other Lutheran church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Presbyterian churches, if any, do you identify with most closely? The Presbyterian Church U.S.A., Presbyterian Church in America, or some other Presbyterian church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Pentecostal churches, if any, do you identify with most closely? The Assemblies of God, Church of God Cleveland Tennessee, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Pentecostal churches, if any, do you identify with most closely? The Church of God in Christ, Church of God of the Apostolic Faith, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Episcopalian or Anglican Churches, if any, do you identify with most closely? The Episcopal (Church in the USA), the Anglican Church, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Christian churches, if any, do you identify with most closely? The Church of Christ, Disciples of Christ, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following congregational churches, if any, do you identify with most closely? The United Church of Christ, Conservative Congregational Christian, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Holiness churches, if any, do you identify with most closely? The Church of the Nazarene, the Wesleyan Church, the Free Methodist Church, or something else?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Reformed churches, if any, do you identify with most closely? The Reformed Church in America, the Christian Reformed Church, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Mormon churches, if any, do you identify with most closely? The Church of Jesus Christ of the Latter-day Saints, the Community of Christ, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Orthodox churches, if any, do you identify with most closely? The Greek Orthodox Church, Russian Orthodox, Orthodox Church in America, or some other church?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which Jewish group do you identify with most closely? Reform, Conservative, Orthodox, or something else?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Muslim groups, if any, do you identify with most closely? Sunni, Shia, or something else?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Buddhist groups, if any, do you identify with most closely? Theravada (such as Vipassana), Mahayana Buddhism (such as zen), Vajrayana Buddhism (such as Tibetan), or something else?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which of the following Hindu groups, if any, do you identify with most closely? Vaishnava Hinduism or Shaivite Hinduism, or is it something else?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'All in all, are you satisfied or dissatisfied with the way things are going in this country today? / Would you say that''s very satisfied/dissatisfied or just somewhat satisfied/dissatisfied?'
,T = '50'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'About how many people belong to the church or house of worship where you attend religious services most often? Just your best estimate will do. Would you say… (READ LIST IN ORDER)?'
,T = '41'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'participate in a choir or other musical program there…And still thinking about the church or house of worship where you attend religious services most often, please tell me how often, if ever, you do each of the following. How often do you [INSERT;'
,T = '33'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'do community volunteer work through your place of worship…And still thinking about the church or house of worship where you attend religious services most often, please tell me how often, if ever, you do each of the following. How often do you [INS'
,T = '58'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'work with children or youth there…And still thinking about the church or house of worship where you attend religious services most often, please tell me how often, if ever, you do each of the following. How often do you [INSERT; RANDOMIZE] - would'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'participate in social activities, such as meals, club meetings, or other gatherings there…And still thinking about the church or house of worship where you attend religious services most often, please tell me how often, if ever, you do each of the'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you or your family official members of a local church or house of worship?'
,T = '38'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'All in all, are you satisfied or dissatisfied with the way things are going in your personal life? / Would you say that''s very satisfied/dissatisfied or just somewhat satisfied/dissatisfied?'
,T = '50'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How certain are you about this belief [in God or a universal spirit]? Are you absolutely certain, fairly certain, not too certain, or not at all certain?'
,T = '31'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Which comes closest to your view of God? God is a person with whom people can have a relationship or God is an impersonal force?'
,T = '31'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you believe in life after death?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How certain are you about this belief [in life after death]? Are you absolutely certain, fairly certain, not too certain, or not at all certain?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you believe in nirvana, the ultimate state transcending pain and desire in which individual consciousness ends?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How certain are you about this belief [in nirvana, the ultimate state transcending pain and desire in which individual consciousness ends]? Are you absolutely certain, fairly certain, not too certain, or not at all certain?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you believe in nirvana, the ultimate state transcending pain and desire in which individual consciousness ends? / How certain are you about this belief? Are you absolutely certain, fairly certain, not too certain, or not at all certain?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you believe in reincarnation, that people will be reborn in this world again and again?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'How certain are you about this belief [in reincarnation, that people will be reborn  in this world again and again]? Are you absolutely certain, fairly certain, not too certain, or not at all certain?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you believe in reincarnation, that people will be reborn in this world again and again? / How certain are you about this belief? Are you absolutely certain, fairly certain, not too certain, or not at all certain?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you believe in life after death? / How certain are you about this belief? Are you absolutely certain, fairly certain, not too certain, or not at all certain?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you think there is a heaven, where people who have led good lives are eternally rewarded?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you think there is a hell, where people who have led bad lives and die without being sorry are eternally punished?'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'And would you say that [READ, IN ORDER] [Holy book: If Christian or no religion insert “the Bible”; If Jewish, insert “the Torah”; If Muslim, insert, “the Koran”; If other non-Christian affiliations, insert “the Holy Scripture”; IF DK/REF IN RELIGION, insert “the Bible”] is to be taken literally, word for word, OR Not everything in [Holy book] should be taken literally, word for word?'
,T = '39'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Miracles still occur today as in ancient times…Here are a few statements. For each one, please tell me if you completely agree with it, mostly agree with it, mostly disagree with it, or completely disagree with it'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Angels and demons are active in the world…Here are a few statements. For each one, please tell me if you completely agree with it, mostly agree with it, mostly disagree with it, or completely disagree with it'
,T = '32'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Religion causes more problems in society than it solves…Here are a few statements. For each one, please tell me if you completely agree with it, mostly agree with it, mostly disagree with it, or completely disagree with it'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Your standard of living - what you can buy or do…Next, please tell me how satisfied you are with the following things. How satisfied are you with… [INSERT; RANDOMIZE]?'
,T = '50'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Your family life…Next, please tell me how satisfied you are with the following things. How satisfied are you with… [INSERT; RANDOMIZE]?'
,T = '50'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'The way the political system is working in this country…Next, please tell me how satisfied you are with the following things. How satisfied are you with… [INSERT; RANDOMIZE]?'
,T = '72'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Your personal safety from things like crime and terrorism…Next, please tell me how satisfied you are with the following things. How satisfied are you with… [INSERT; RANDOMIZE]?'
,T = '47'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Thinking about your religion, which of the following statements comes CLOSEST to your view? My church or denomination should [READ IN ORDER] preserve its traditional beliefs and practices OR adjust traditional beliefs and practices in light of new circumstances OR adopt modern beliefs and practices.'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Please tell me how often you do each of the following. How often do you meditate - would you say at least once a week, once or twice a month, several times a year, seldom, or never?'
,T = '37'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Please tell me how often you do each of the following. How often do you pray at a shrine or religious symbol in your home - would you say at least once a week, once or twice a month, several times a year, seldom, or never?'
,T = '37'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Please tell me how often you do each of the following. How often do you share your views on God and religion with religious people - would you say at least once a week, once or twice a month, several times a year, seldom, or never?'
,T = '38'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'feel a deep sense of spiritual peace and well-being…Now, thinking about some different kinds of experiences, how often do you [INSERT; RANDOMIZE] – would you say at least once a week, once or twice a month, several times a year, seldom, or never?'
,T = '40'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'feel a deep sense of wonder about the universe…Now, thinking about some different kinds of experiences, how often do you [INSERT; RANDOMIZE] – would you say at least once a week, once or twice a month, several times a year, seldom, or never?'
,T = '40'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'receive a definite answer to a specific prayer request…Now, thinking about some different kinds of experiences, how often do you [INSERT; RANDOMIZE] – would you say at least once a week, once or twice a month, several times a year, seldom, or never?'
,T = '37'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Do you think there is a natural conflict between being a non-religious person and living in a society where most people are religious, or don’t you think so?'
,T = '59'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'And was that a Christian religion, or not?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Childhood Protestant affiliation'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'And is that a Christian religion, or not?'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Spouse/partner Protestant affiliation'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Pray or read the Scripture with your child/any of your children…As I read a list, please tell me if you do any of the following things with (your child/your children). Do you… (READ IN ORDER)?'
,T = '33'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Send your child/any of your children to Sunday school or another religious education program…As I read a list, please tell me if you do any of the following things with (your child/your children). Do you… (READ IN ORDER)?'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Home school or send your child/any of your children to a religious school instead of a public school…As I read a list, please tell me if you do any of the following things with (your child/your children). Do you… (READ IN ORDER)?'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now I’m going to read you a few pairs of statements. For each pair, tell me whether the FIRST statement or the SECOND statement comes closer to your own views — even if neither is exactly right. The government should do more to protect morality in society OR I worry the government is getting too involved in the issue of morality?'
,T = '52'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now I’m going to read you a few pairs of statements. For each pair, tell me whether the FIRST statement or the SECOND statement comes closer to your own views — even if neither is exactly right. Homosexuality is a way of life that should be accepted by society OR Homosexuality is a way of life that should be discouraged by society?'
,T = '49'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now I’m going to read you a few pairs of statements. For each pair, tell me whether the FIRST statement or the SECOND statement comes closer to your own views — even if neither is exactly right. Most people who want to get ahead can make it if they''re willing to work hard OR Hard work and determination are no guarantee of success for most people?'
,T = '54'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now I’m going to read you a few pairs of statements. For each pair, tell me whether the FIRST statement or the SECOND statement comes closer to your own views — even if neither is exactly right. The government should do more to help needy Americans, even if it means going deeper into debt OR The government today can’t afford to do much more to help the needy?'
,T = '54'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now I’m going to read you a few pairs of statements. For each pair, tell me whether the FIRST statement or the SECOND statement comes closer to your own views — even if neither is exactly right. Stricter environmental laws and regulations cost too many jobs and hurt the economy OR Stricter environmental laws and regulations are worth the cost?'
,T = '54'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now I’m going to read you a few pairs of statements. For each pair, tell me whether the FIRST statement or the SECOND statement comes closer to your own views — even if neither is exactly right. The best way to ensure peace is through military strength OR Good diplomacy is the best way to ensure peace?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Now I’m going to read you a few pairs of statements. For each pair, tell me whether the FIRST statement or the SECOND statement comes closer to your own views — even if neither is exactly right. It’s best for the future of our country to be active in world affairs OR We should pay less attention to problems overseas and concentrate on problems here at home?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'If you had to choose, would you rather have a smaller government providing fewer services, or a bigger government providing more services?'
,T = '66'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Were you born in the United States, or in another country?'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you currently a citizen of the United States, or not?'
,T = '67'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Were either of your parents born outside the United States, or not?'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'On another subject, do you think abortion should be (READ: FORM A READ CATEGORIES IN ORDER, FORM B READ IN REVERSE ORDER) 1 Legal in all cases; 2 Legal in most cases; 3 Illegal in most cases; 4 Illegal in all cases?'
,T = '43'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Some people seem to follow what''s going on in government and public affairs most of the time, whether there''s an election or not. Others aren''t that interested. Would you say you follow what''s going on in government and public affairs…(READ) Most of the time; Some of the time; Only now and then, OR Hardly at all?'
,T = '73'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = '[IF DON’T FOLLOW POLITICS, INSERT: When you do think about; IF FOLLOW POLITICS, INSERT When you think about] government and public affairs, which of the following factors most influences your thinking?  Would you say it’s (READ LIST) your personal experience; the views of your friends and family; what you have seen or read in the media; your religious beliefs; your education; or something else?'
,T = '73'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'In your opinion, should churches and other houses of worship keep out of political matters - or should they express their views on day-to-day social and political questions?'
,T = '73'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'What is your race?  Are you white, black, Asian, or some other?'
,T = '9'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you absolutely certain that you are registered to vote, or is there a chance that your registration has lapsed because you moved or for some other reason?'
,T = '67'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you NOW registered to vote in your precinct or election district or haven''t you been able to register so far?'
,T = '67'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'categories from FAMILY grouped into religious traditions'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'State of residence of the respondent'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'of sample used'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'type - numeric'
,T = '42'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Standard RLS denominations - most specific religious affiliation'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Standard RLS denominational families by religious tradition (grouping Std denomination)'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Standard RLS religious traditions (grouping Std denominational families)'
,T = '10'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Country of birth of the respondent'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Country of birth of the respondent''s father'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Country of birth of the respondent''s mother'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Region of birth of the respondent'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Region of birth of the respondent''s father'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Region of birth of the respondent''s mother'
,T = '6'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Recoded Education Variable -- NOT directly comparable'
,T = '4'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Are you currently a citizen of the United States, or not? (Yes/No answers)'
,T = '67'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'Indicates whether R is absolutely certain registered to vote'
,T = '67'


/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = 'race/ethnicity'
,T = '9'

/*------------------------------------------------------------------------------------------------------------------------*/
                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	INSERT INTO                                                                /* insert statement                        */
	               [Pew_Question_Topic]                                        /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* higher level select statement...        */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_topic_pk]        = CASE WHEN [Question_topic_pk] IS NULL
                                         THEN  ROW_NUMBER()                    /* number all rows                         */
                                               OVER( ORDER BY                  /* sorted by                               */
                                                     [Question_topic_pk]       /* current Q_topic_pk                      */
                                                   , [Question_Std_pk] )       /* and by StdQ_pk                          */
                                             + (SELECT                         /* adding...                               */
                                                   MAX([Question_topic_pk])    /* currently max pk                        */
                                                  FROM [Pew_Question_Topic] )  /* from NoStdAnswers                       */
                                         ELSE [Question_topic_pk]
                                     END
      ,[Question_Std_fk]          = CASE WHEN [Question_Std_fk] IS NULL
                                         THEN [Question_Std_pk]
                                         ELSE [Question_Std_fk]
                                     END
      ,[Topic_fk]                 = CASE WHEN [Topic_fk] IS NULL
                                          AND [Tp_fk]    IS NULL
                                         THEN [T]
                                         WHEN [Topic_fk] IS NULL
                                         THEN [Tp_fk]
                                         ELSE [Topic_fk]
                                     END
      ,[Topic_Priority_order]     = CASE WHEN [Topic_Priority_order] IS NULL
                                         THEN  99
                                         ELSE [Topic_Priority_order]
                                     END
      ,[SubTopic_Priority_order]  = CASE WHEN [SubTopic_Priority_order] IS NULL
                                         THEN  9
                                         ELSE [SubTopic_Priority_order]
                                     END
  FROM
       [Pew_Question_Topic]
  FULL
  JOIN
      (SELECT * FROM 
       [Pew_Question_Std]
       WHERE 
       [Question_abbreviation_std]  like 'SVY%' )            AllSvy
    ON
       [Question_Std_fk]
      =[Question_Std_pk]
  LEFT
  JOIN
      (SELECT
             [QS_fk] = [Question_Std_fk]
            ,[Tp_fk] = [Topic_fk]
       FROM
       (SELECT
               *
              ,[X]=ROW_NUMBER ()
                   OVER
                  (PARTITION BY [Question_Std_fk]
                   ORDER BY [Topic_fk]           )
        FROM 
        [_bk_forum]..[Pew_Question_Topic_2013_02_04] ) L1
       WHERE [X] = 1                                       ) OldQT
    ON
       [Question_Std_Pk]
      =[QS_fk]
  LEFT
  JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
       NSV                                                   NewVal            /* CTE (New Set of NoStdAnswers) as NewVal */
/*------------------------------------------------------------------------------------------------------------------------*/
    ON
       [Question_wording_std]
      =[L]

WHERE
       [Question_topic_pk] IS NULL
/**************************************************************************************************************************/
GO

/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT                                                                         /* check results in modified table         */
         [Question_topic_pk]
        ,[Question_Std_fk]
        ,[Topic_fk]
        ,[Topic_Priority_order]
        ,[SubTopic_Priority_order]
    FROM [Pew_Question_Topic]
       , [#CMPK]
   WHERE [Question_topic_pk]
       > [CMPK]
ORDER BY [Question_Std_fk]
        ,[Topic_fk]
/**************************************************************************************************************************/
          SELECT Q.[Question_abbreviation]
               , S.[Question_abbreviation_std]
               , S.[Question_wording_std]                                      /*   identified available AnswerSetNum     */
               , S.[Question_Std_pk]
               , T.[Question_Std_fk]
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE [Question_abbreviation] LIKE 'RLS%'                           /*   filter by corresponding Q_abbrev      */
        ORDER BY T.[Question_Std_fk]
               , S.[Question_Std_pk]
/**************************************************************************************************************************/
SELECT   [c] =
           COUNT(
        DISTINCT Q.[Question_abbreviation]       )
        ,[K] =      'All_Qs'
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE   [Question_abbreviation] LIKE 'RLS%'                         /*   filter by corresponding Q_abbrev      */
UNION
  ALL
SELECT   [c] =
           COUNT(
        DISTINCT Q.[Question_abbreviation]       )
        ,[K] =      'Matched_Qs'
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE   [Question_abbreviation] LIKE 'RLS%'                         /*   filter by corresponding Q_abbrev      */
             AND T.[Question_Std_fk] IS NOT NULL
UNION
  ALL
SELECT   [c] =
           COUNT(
        DISTINCT Q.[Question_abbreviation]       )
        ,[K] =      'UnMatched_Qs'
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE   [Question_abbreviation] LIKE 'RLS%'                         /*   filter by corresponding Q_abbrev      */
             AND T.[Question_Std_fk] IS     NULL
/**************************************************************************************************************************/
GO




----------/**************************************************************************************************************************/
----------/*****                                                    STEP 002                                                    *****/
----------/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
----------/**************************************************************************************************************************/
----------WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
----------(                                                                              /*> Set of Vals: QAb+StdVal+NoStdVal+AnsWd */
----------        SELECT Q =  ' -- NoStdQuestionAbbrev' --  p  (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------             , V =  1 -- StdAnswerValue       --   q (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------             , X =  0 -- NoStdAnswerValue     -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------             , Y =  ' -- NoStdAnswerWording'  -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------                                                                             ) /* <   Set of Values ends!                 */
----------/*   testset                                                                   --     alias for testing Set of Values     */
----------/**************************************************************************************************************************/
----------/*****                                                    STEP 002                                                    *****/
----------/*****                                   SECTION B: Use the Common Table Expression                                   *****/
----------/**************************************************************************************************************************/
----------/*------------------------------------------------------------------------------------------------------------------------*/
------------	INSERT INTO                                                                /* insert statement                        */
------------	               [Pew_Answer_NoStd]                                          /* target table in current database        */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------SELECT                                                                         /* higher level select statement...        */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------       [Answer_pk]          =   ROW_NUMBER()                                   /* number all rows                         */
----------                                OVER( ORDER BY [Qk], [X])                      /* sorted by Q_pk & NoStdAnsValue          */
----------                             + (SELECT     MAX([Answer_pk])                    /* add currently max pk                    */
----------                                  FROM         [Pew_Answer_NoStd])             /* from NoStdAnswers                       */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------      ,[Answer_value_NoStd] =  [X]                                             /* value coded in original dataset         */
----------      ,[Answer_Wording]     =  [Y]                                             /* wording exactly as original ValueLabel  */
----------      ,[Answer_Std_fk]      =  [SAk]                                           /* fk as StdAns_pk, pulled...              */
----------      ,[Question_fk]        =  [Qk]                                            /* fk as NoStdQ_pk, pulled...              */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------FROM   (                                                                       /*                                         */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------         SELECT                                                                /* sub-query select statement...           */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------                 [Qk]       = ( SELECT [Question_pk]                           /* identify available Q_pk (curr unique)   */
----------                                  FROM [Pew_Question_NoStd]                    /* as presented in Std&NoStdQuestions view */
----------                                 WHERE [Question_abbreviation]       = [Q]   ) /* filter by corresponding Q_abbreviation  */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------               , [SAk]      = ( SELECT [Answer_Std_pk]                         /* identify corresponding A_pk             */
----------                                  FROM [Pew_Answer_Std]                        /* as stored in StdAnswers table           */
----------                                 WHERE [Answer_value_std]            = [V]     /* filter by already known StdValue...     */
----------                                 AND   [AnswerSet_number]            =         /* and by matching AnswerSetNum to...      */
----------                                     ( SELECT [AnswerSet_num]                  /*   identified available AnswerSetNum     */
----------                                         FROM [Pew_Question_NoStd]             /*   as presented in NoStdQs ...           */
----------                                         JOIN [Pew_Question_Std]               /*   joined to StdQs ...                   */
----------                                           ON [Question_Std_fk]                /*   matching the StqQ fk                  */
----------                                            = [Question_Std_pk]                /*   to the StqQ pk                        */
----------                                        WHERE [Question_abbreviation]= [Q] ) ) /*   filter by corresponding Q_abbrev      */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------      , *                                                                      /* all other variables in CTE              */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------  FROM [NSV]                                                                   /* from CTE (New Set of NoStdAnswers)      */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------                                                              )   AS NoStdAns  /* alias of sub-query                      */
