class_name AGScrollPool extends RefCounted


## 加载资源工具类
var loaders: Array[AGBaseLoader]

## 缓存中的 items
var caches: Array[AGResourceItem] = []

## 当前使用的loader 下标
var index: int = 0


## 预加载items
func pre_load_items(size: int = 3, randomly := false) -> void:
	if caches.is_empty():
		var arr = load_items(size, randomly)
		caches.append_array(arr)


## 弹出一个 item
func pop_item(randomly := false) -> AGResourceItem:
	var items = pop_items(1, randomly)
	if items.is_empty():
		return
	return items.front()


## 弹出items
func pop_items(size: int = 1, randomly := false) -> Array[AGResourceItem]:
	var items: Array[AGResourceItem] = []
	if not is_loaders_valid():
		return items
	
	if caches.is_empty():
		var arr = load_items(size, randomly)
		caches.append_array(arr)
	
	var pop_idx = 0
	for i in range(size * 10):
		if items.size() >= size:
			break
		
		if randomly and caches.size() > 1:
			pop_idx = randi_range(0, caches.size()-1)
		
		var item = caches.pop_at(pop_idx)
		items.append(item)
		
		if caches.is_empty():
			var arr = load_items(1, randomly)
			caches.append_array(arr)
		
		pop_idx += 1
		if pop_idx >= caches.size():
			pop_idx = 0
	
	return items


## 加载items
func load_items(size: int = 1, randomly := false) -> Array[AGResourceItem]:
	var items: Array[AGResourceItem] = []
	if not is_loaders_valid():
		return items
	
	for i in range(size * 10):
		if items.size() >= size:
			break
		
		# 随机?
		if randomly and loaders.size() > 1:
			index = randi_range(0, loaders.size()-1)
		# 数据!
		var loader = loaders[index]
		if not loader:
			index += 1
			reset_index_if_needed()
			continue
		
		var curSize = size
		if curSize > loader.size_of_items():
			curSize = loader.size_of_items()
		var arr = loader.load_items(curSize)
		items.append_array(arr)
		if loader.no_more_items():
			loader.reset_index_if_needed()
			index += 1
			reset_index_if_needed()
	return items


func clear_caches() -> void:
	caches.clear()
	index = 0


## loaders 是否有效?
func is_loaders_valid() -> bool:
	for loader in loaders:
		if loader and loader.is_items_valid():
			return true
	return false


func reset_index_if_needed() -> void:
	if index >= loaders.size():
		index = 0
