@tool
class_name AGTextureIndexLoader extends AGBaseLoader


## 路径 [example: res://Games/Tappyplane/Levels/]
## uri = path + (file_name % index)
@export_dir var path: String

## 文件名 [example: level_1.png, level_%d.png]
## uri = path + (file_name % index)
@export var file_name: String

## 加载的文件数量!! 
@export var max_size: int

func size_of_items() -> int: 
	return max_size

## items 是否有效?
func is_items_valid() -> bool:
	return max_size > 0

func load_items(_size := size, _index := index) -> Array[AGResourceItem]:
	var items: Array[AGResourceItem] = []
	if _index + _size > max_size:
		return items
	
	for i in _size:
		var name = file_name % (_index + i)
		var image = Image.load_from_file(_full_path(path, name))
		var texture = ImageTexture.create_from_image(image)
		var item = AGTextureItem.new()
		item.texture = texture
		item.direction = direction
		item.size = scroll_size
		item.auto_get_size = auto_get_size
		items.append(item)
	index = _index + _size
	return items
