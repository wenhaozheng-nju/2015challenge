
2014/12/26
1.词表中出现2次的词，已经占了整个词表的一半，而且里面有一些重要的词，比如网址之类的，所以只把那些长度小于10且出现2次的词删掉
2.以tmp1开头的文件是删去词表中出现次数较少的词
3.以tmp2开头的文件是把title和body一同训练的文件

2014/12/27
1.708,094样本中，view1中方差为0(去除answer数为1的question)的计数：[8546,17842,16933,12649,8954,8576,8576,35101,48651,47589,55766,35524,35201,35202,10156,16524,16250,4294,122513,124078,123897,126456,122859,122756,122762,99999]
2.708,094样本中，view1中方差为0(去除answer数为1的question)的计数：[1302,1866,1740,6605,1302,1302,1299,4550,6738,6344,49549,4553,4547,4545,1122,1362]
3.706,278样本中，tmp1的view1中方差为0(去除answer数为1的question)的计数：[8478,17817,16914,12623,8886,8504,8504,34988,48585,47518,55754,35407,35091,35090,10023,16424,16149,4433,122544,124139,123955,126575,122892,122788,122791,100049]
4.706,278样本中，tmp1的view2中方差为0(去除answer数为1的question)的计数：[1289,1858,1734,6649,1289,1289,1286,4554,6731,6343,49582,4558,4551,4549,1121,1361]
5.706,272样本中，tmp2的view1中方差为0(去除answer数为1的question)的计数：[5365,14184,13310,8623,5794,5390,10023,16424,16149,4433,122544,124139,123955,126575,122892,122788,122791,100049]
6.706,272样本中，tmp2的view2中方差为0(去除answer数为1的question)的计数：[1143,1616,1512,4934,1147,1141,1144,1121,1361]

2014/12/28
1.Predicting Web Searcher Satisfaction with Existing Community-based Answers
1.1 Query clarity features
1.2 Query-question match features 
1.2.1 KL-divergence language model
1.2.2  Jaccard coesocient and length ratios
1.2.3  co-occurrence statistics
1.3 Answer quality features

2014/12/29
1.在交叉检验的时候，在view1中取ground truth的时候，取成训练集了，重大失误！
2.twitter 数据一般集中在词汇处理，然后直接用1-gram当特征，再用特征选择（互信息、频度、）来筛选特征
3.SemEval-2014 Task 9: Sentiment Analysis in Twitter
3.1  word and character n-grams, word shapes, and lemmata
3.2  MPQA，SentiWord-Net，NRC lexicon
4.Building the state-ofthe-art in sentiment analysis of tweets.
4.1. 拿Twitter中的每个词同正例中的词算一个距离，和负例中的词算一个，然后加起来当得分。正例和负例都是人工标注的

2014/12/30
1.应该有关于网址的特征，以url的长度为特征值
2.一共有1356553条记录，有129583条answer有url

2015/1/2
1.Predicting Web Searcher Satisfaction with Existing Community-based Answers
1.1 满意度是人工标注的
1.2 predicting searcher satisfaction with existing CQA answers
1.3 high varience in the preceived question and answer quality
1.4 只考虑了best answer
1.5 很多都是asker的特征，要了没什么用
1.6 需要用到click entropy
1.6.1 判断一个query是不是模糊的，把query放到搜索引擎里面查找，看在结果的连接中，点击每个连接的人数来计算信息熵
2.在写入额外信息的时候，由于我把label数据和unlabel的数据都写在同一个文件中，因而无法和label数据找到一一对应的关系
3.Similarity Measures for short segments of Text
3.1 说是query-query的检索，实际上，利用query在搜索引擎中检索的结果，抽取重要的词汇来扩展query

2015/1/4
1.LDA（Latent Dirichlet Allocation），把question body和answer body 规约到10个topic，这样相当于降维了
2.LDA（Linear Discriminant Analysis），是有label的PCA，那question body怎么变换，难道是把answer body进行变换之后，然后再把这个变换应用到question body中？
3.LSA（Latent Semantic analysis），潜在语义分析

2015/1/5
1.使用LDA的时候，无论n_component设成多少，都降成一维，而且LDA是有标记的，test集合的数据怎么处理