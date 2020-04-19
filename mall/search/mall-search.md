
## elasticsearch电商搜索

elastic search 官方手册    
https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html
https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations.html

参考文章：
* 多种搜索方式   
ElasticSearch最佳入门实践（六）
案例实战之电商网站商品管理：多种搜索方式   
https://blog.csdn.net/qq_33746789/article/details/83583237

* 嵌套聚合，下钻分析，聚合分析    
ElasticSearch最佳入门实践（七）
案例实战之电商网站商品管理：嵌套聚合，下钻分析，聚合分析
https://blog.csdn.net/qq_33746789/article/details/83585898

* 条件过滤  
Elasticsearch仿京东、淘宝APP客户端的商品侧边栏筛选条件过滤和分页列表查询的实现案例 
https://blog.csdn.net/qq_28538247/article/details/104059207   
参考源代码：  
https://gitee.com/wangsai1109/springboot-es.git


关于商品搜索是调用2个API：
1. /search/esProduct/search 查询商品返回商品列表，支持分页
2. /search/esProduct/search/relate  查询商品再次过滤，根据查询结果返回过滤条件
2个方法分开异步调用，前者用于商品查询，后者用于商品再次过滤
