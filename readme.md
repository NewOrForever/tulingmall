### 模块说明
tulingmall-admin 后台管理程序  
tulingmall-authcenter 认证中心程序   
tulingmall-cart 购物车程序  
tulingmall-common 通用模块，被其他程序以jar包形式使用 
tulingmall-core 四期遗留模块，主要包含model的声明，被其他程序以jar包形式使用 
tulingmall-gateway 网关程序  
tulingmall-member 用户管理程序  
tulingmall-order-curr 订单程序  
tulingmall-order-history 历史订单处理程序
tulingmall-portal 商城首页入口程序  
tulingmall-product 商品管理程序  
tulingmall-promotion 促销管理程序
tulingmall-redis-comm 缓存模块，被其他程序以jar包形式使用
tulingmall-redis-multi 多源缓存模块，被其他程序以jar包形式使用
tulingmall-search 商品搜索程序  
tulingmall-security 安全模块，被其他程序以jar包形式使用  
tulingmall-sk-cart 秒杀确认单处理
tulingmall-sk-order 秒杀订单处理
tulingmall-unqid 分布式ID生成程序  
### 关键服务建议启动顺序
tulingmall-unqid、tulingmall-member、tulingmall-product、tulingmall-cart
tulingmall-promotion、tulingmall-authcenter
tulingmall-order-curr、tulingmall-portal、tulingmall-gateway
### doc目录说明
htmljss 秒杀静态网页、JS文件、CSS文件等
nginx 秒杀nginx配置、Lua脚本、第三方Lua库
### 本地运行
商城在本地运行需要本地存在MySQL、Nacos、等基础服务
秒杀系统牵涉较复杂，暂不提供本地完整运行版本
