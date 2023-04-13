## GeeCache
1、用go实现的分布式缓存，支持特性有：
- 单机缓存和基于 HTTP 的分布式缓存
- 最近最少访问(Least Recently Used, LRU) 缓存策略
- 合并访问请求以防止缓存击穿
- 使用一致性哈希选择节点，实现负载均衡
- 使用 protobuf 优化节点间二进制通信

2、代码结构
```shell
    |--geecache/
        |--lru/
            |--lru.go  // lru 缓存淘汰策略
        |--byteview.go // 缓存值的抽象与封装
        |--cache.go    // 并发控制
        |--geecache.go // 负责与外部交互，控制缓存存储和获取的主流程
        |--http.go     // 提供被其他节点访问的能力(基于http)
        |--peers.go    // 选择节点和获取节点的接口
        |--consistenthash
            |--consistenthash.go  // 一致性哈希算法实现负载均衡
        |singleflight
            |--singleflight.go  // singleflight机制防止缓存击穿
        |geecachepb
            |--geecachepb.proto // 自定义proto通信消息类型
    |--main.go  // api服务器和cache服务器启动入口
    
```