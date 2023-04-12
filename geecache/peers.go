package geecache

type PeerPicker interface {
	// 根据key选择相应的节点PeerGetter
	PickPeer(key string) (peer PeerGetter, ok bool)
}

type PeerGetter interface {
	// 用于从对应的group中查找相应的缓存值
	Get(group, key string) ([]byte, error)
}
