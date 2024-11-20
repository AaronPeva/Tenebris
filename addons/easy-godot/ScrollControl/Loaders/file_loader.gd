@tool
class_name AGFileLoader extends AGBaseLoader


## 资源文件
@export var files: Array[AGFileItem]

func size_of_items() -> int: 
	return files.size()


## items 是否有效?
func is_items_valid() -> bool:
	for item in files:
		if is_instance_of(item, AGFileItem):
			return true
	return false


func load_items(_size := size, _index := index) -> Array[AGResourceItem]:
	var items: Array[AGResourceItem] = []
	if _index + _size > files.size():
		return items
	for i in _size:
		var item = files[(_index + i)]
		if not item:
			continue
		item.set_direction_if_needed(direction)
		item.set_size_if_needed(scroll_size)
		item.set_auto_get_size_if_needed(auto_get_size)
		item.load_resource()
		items.append(item)
	index = _index + _size
	return items
