@tool
class_name AGResourceItem extends Resource


## 滚动方向
@export var direction := AGScrollManager.Direction.NONE

## 滚动的尺寸, 一般是节点的Size
@export_custom(PROPERTY_HINT_NONE, "suffix:px") \
var size := Vector2.ZERO

## 自动从资源文件获取尺寸, has_method("get_size")
@export var auto_get_size: bool = false

func load_resource() -> Resource:
	return

func set_size_if_needed(_size: Vector2) -> void:
	if size.is_equal_approx(Vector2.ZERO):
		size = _size


func set_direction_if_needed(_direction: AGScrollManager.Direction) -> void:
	if is_none_direction():
		direction = _direction


func set_auto_get_size_if_needed(auto: bool) -> void:
	if not auto_get_size:
		auto_get_size = auto


## 未设置方向?
func is_none_direction() -> bool:
	return direction == AGScrollManager.Direction.NONE
