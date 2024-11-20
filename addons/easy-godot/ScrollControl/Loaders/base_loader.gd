## 请使用子类
@tool
class_name AGBaseLoader extends Resource

## 滚动方向
@export var direction := AGScrollManager.Direction.NONE

## 滚动的尺寸, 一般是节点的Size
@export_custom(PROPERTY_HINT_NONE, "suffix:px") \
var scroll_size := Vector2.ZERO

## 自动从资源文件获取尺寸, has_method("get_size")
@export var auto_get_size: bool = false

## load start index, 数组下标
@export var index: int = 0

## load size, 每次加载资源的个数
@export var size: int = 1

### 随机化抽取
#@export var randomly := false

## 能够加载的数量
func size_of_items() -> int: 
	return 0

## 无法再加载了
func no_more_items() -> bool:
	return index >= size_of_items()

## items 是否有效?
func is_items_valid() -> bool:
	return false

## 需要的话重置下标
func reset_index_if_needed() -> void:
	if no_more_items():
		index = 0

## 循环加载资源
func load_loop_items(_size := size, _index := index) -> Array[AGResourceItem]:
	var max_size = size_of_items()
	if max_size < 1:
		return []
	
	var items: Array[AGResourceItem] = []
	while items.size() < _size:
		if _index >= max_size:
			_index = 0
		
		var curSize = max_size - _index
		var lessSize = _size - items.size()
		if curSize > lessSize:
			curSize = lessSize
		
		var arr = load_items(curSize, _index)
		items.append_array(arr)
		_index += curSize
	
	return items


## 加载资源项
func load_items(_size := size, _index := index) -> Array[AGResourceItem]:
	return []


func _full_path(path: String, name: String) -> String:
	if not path.ends_with("/"):
		path += "/"
	return path + name
