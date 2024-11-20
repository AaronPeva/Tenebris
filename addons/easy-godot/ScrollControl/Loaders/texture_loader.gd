@tool
class_name AGTextureLoader extends AGBaseLoader


## 纹理资源
@export var textures: Array[AGTextureItem]

func size_of_items() -> int: 
	return textures.size()

## items 是否有效?
func is_items_valid() -> bool:
	for item in textures:
		if is_instance_of(item, AGTextureItem):
			return true
	return false

func load_items(_size := size, _index := index) -> Array[AGResourceItem]:
	var items: Array[AGResourceItem] = []
	if _index + _size > textures.size():
		return []
	
	for i in _size:
		var item = textures[(_index + i)]
		if not item:
			continue
		item.set_direction_if_needed(direction)
		item.set_size_if_needed(scroll_size)
		item.set_auto_get_size_if_needed(auto_get_size)
		items.append(item)
	index = _index + _size
	return items
