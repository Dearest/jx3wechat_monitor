# README
监控剑网3微信公众号的消息推送，第一时间得到标题有【内藏福利】即包含九霄环佩，夜幕星河等激活码的文章。提取出这些激活码供按键精灵脚本写入游戏。    
##### 配置要求
ruby 2.3.0  
rails 5.0.0  
redis  
mysql 5.6及以上 
##### 使用步骤
1. rails agent:xici
2. rails monitor:jx3
3. 运行按键小精灵   

其中1.2步可以修改config/schedule.rb 用whenever定时执行