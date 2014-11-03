challenge
============

## 数据集
#### 主要还是overflow上的，所谓的多信息是针对一条问题上具有的多重属性，例如票数、代码等等，这些信息必然是相关联的。


## 问题
1. Tags.xml 里的ExcerptPostId和WikiPostId是什么
2. Votes.xml 里的voteTypeId没看懂什么意思
>大致就是投的票是以什么形式投的，有可能是版主自己投的，也有可能是喜欢，或是赞成票，反对票之类的。

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

3. 数据集太大，大约20多G，不过有一个 [网站]("http://data.stackexchange.com/stackoverflow/query/edit/242001#resultSets" "stackexchange") 可以用来查询
> 可以用sql语句在线查询，或是编程采用json的方式
>> api的 [文档]("https://api.stackexchange.com/docs")






