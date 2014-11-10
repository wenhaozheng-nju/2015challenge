challenge
============

## 数据集总览
#### 所提供的数据其实是stack overflow整个网站的后台的数据库，每一个在网站上能够观察到的细节均可在提供的数据里查找到。

## 数据构成
#### 是以数据库的方式进行组织数据的，每一个压缩包代表了一张表，压缩包里只有一个xml文件，是把表中的每一条记录以xml的方式进行呈现，主要有以下几张表：

1. Badges.xml 类似成就系统
2. Comments.xml 评论表
3. Posts.xml 每个问题或是解答都是一个Post，甚至关于标签的说明也是一个Post
4. PostHistory.xml stack overflow把很多信息都看成是一个Post，每次Post的更改都会在PostHistory表上有所记录，其PostHistoryTypeId和VoteTypeId有关系
5. Postlinks.xml 
6. users.xml 用户表
7. votes.xml 投票记录表

## 有价值的表项
>Badges.xml
>>UserId:标识了某用户获得了该成就

>Comments.xml
>>Score:得分，标识了一条评论的分数，体现该评论的价值，但是不知道这个分数是怎么计算的，找不到给评论投票的地方啊……

>Posts.xml
>>Score:UpMod和DownMod数目之差
>>viewscount:浏览次数
>>Tags:标签，一般只有问题才有
>>LastEditor* :一个Post是可以多人协同编辑，所以需要这个表项
>>*count:一些计量指标，表明该Post的热门程度

>PostHistory.xml
>>PostHistoryTypeId

>users.xml
>>Reputation

>Votes.xml
>>voteTypeId

## 可以挖掘的信息？
1. 筛选最具价值的post（根据题主的reputation，badges，scores，answers的分数等等。。。）
2. 类似推荐系统，挖掘不同post的相关性
3. 预测一个问题由哪些用户回答最合适,类似quora那样
4. 补全标签…………

## 数据预处理
1. 首先使用perl把大于1G的xml文件进行切割，因为Python解析xml语言所使用的模块无法承受大于4G的文件，需要把其加载到内存进行处理。
2. 然后针对不同的xml文件提取有价值的表项，整理成txt的格式，这样方便读取。
3. 最难提取的是post的正文，要把代码和描述进行区分。（嵌在描述里的代码虽然加了code标签，但是还是把其算作描述，否则提取的文本句式不连贯，代码也无法辨认）
4. 


## 相关论文
>[Predict Closed Questions on Stack Overflow](https://www.kaggle.com/c/predict-closed-questions-on-stack-overflow/details/prizes)

## 问题
>no.1 Tags.xml 里的ExcerptPostId和WikiPostId是什么
>>这里面把tag的解释写成了post的形式，ExcerptPostId就是显示的简略说明，WikiPostId是关于tag的详细解释

>no.2 Votes.xml 里的voteTypeId没看懂什么意思
>>大致就是投的票是以什么形式投的，有可能是版主自己投的，也有可能是喜欢，或是赞成票，反对票之类的。

|  *voteType*  |  *count*  |
| ------------ | ---------- | 
| AcceptedByOriginator | 4778553 |
| UpMod  | 48877802 |
| DownMod  | 5245532 |
| Offensive | 1084 | 
| Favorite | 4785944 |
| Close | 1259999 |
| Reopen | 5517 |
| BountyStart | 92298 |
| BountyClose | 91710 |
| Deletion | 2747587 |
| Undeletion | 174346 |
| Spam | 6442 |
| ModeratorReview | 447819 |
| ApproveEditSuggestion |  1249217 | 


>no.3 数据集太大，大约20多G，不过有一个[网站](http://data.stackexchange.com/stackoverflow/query/edit/242001#resultSets "stackexchange")可以在线查询相应的信息
>>可以用sql语句在线查询，或是编程采用json的方式
>>>api的[文档](https://api.stackexchange.com/docs)

>no.4 xml文件超过4GB，不好处理
>>使用Python3.x看是否能够处理，或是用shell脚本对文件进行切割

>no.5 缺失PostTags表，Tag信息无法利用
>>在Posts表里有一个Tags表项，存储的是所有Tag的信息，看错了当时




