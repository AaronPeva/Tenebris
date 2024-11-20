class_name AGScrollManager extends RefCounted


enum Direction {
	NONE,   ## 未使用!!
	UP, 	## 向上滚动
	RIGHT, 	## 向右滚动
	DOWN, 	## 向下滚动
	LEFT 	## 向左滚动
}

## 滚动方向
var direction := Direction.LEFT

## 滚动的Items数组
var items : Array[AGScrollItem] = []

## 待操作的 items数组, 这里用来移除或添加到节点
var opt_items : Array[AGScrollItem] = []

## 滚动的偏移量
var _offset := Vector2.ZERO


## 如果需要, 移除首节点
func pop_front_if_needed() -> AGScrollItem:
	var item = items.front() as AGScrollItem
	if is_out_size(item.size):
		items.pop_front()
		return item
	return null


## 当前滚动的方向
func current_direction() -> Direction:
	if items.is_empty():
		return direction
	var item = items.front() as AGScrollItem
	
	return direction if item.res_item.is_none_direction() \
	else item.res_item.direction


## 更新滚动的方向?
func update_direction_if_needed(_direction: Direction) -> void:
	if not items.is_empty():
		var item = items.front() as AGScrollItem
		direction = item.res_item.direction
	if direction == Direction.NONE:
		direction = _direction


## 是否超出size范围
func is_out_size(size: Vector2) -> bool:
	if is_horizontal():
		return not _between(_offset.x, -size.x, size.x)
	return not _between(_offset.y, -size.y, size.y)


## Scrolling on Horizontal? Vertical?
func is_horizontal() -> bool:
	return is_left() or is_right()


## Scrolling to Down or Right
func is_down_or_right() -> bool:
	return is_down() or is_right()


func is_down() -> bool:
	return direction == Direction.DOWN
func is_right() -> bool:
	return direction == Direction.RIGHT
func is_left() -> bool:
	return direction == Direction.LEFT
func is_up() -> bool:
	return direction == Direction.UP


## 调整偏移
func adjust_offset_if_needed(size: Vector2) -> void:
	if not is_out_size(size):
		return
	
	if is_horizontal():
		_offset.x = -size.x if is_left() else size.x
	else:
		_offset.y = -size.y if is_up() else size.y


## 重置偏移
func reset_offset() -> void:
	_offset = Vector2.ZERO


## 获取偏移
func update_offset(distance: float) -> void:
	match direction:
		Direction.UP: _offset.y -= distance
		Direction.RIGHT: _offset.x += distance
		Direction.DOWN: _offset.y += distance 
		Direction.LEFT: _offset.x -= distance


## 更新所有节点位置
func update_postions(distance: float, offset := Vector2.ZERO) -> void:
	# 更新偏移 并矫正
	update_offset(distance)
	adjust_offset_if_needed(items.front().size)
	offset += _offset
	
	# Nodes Scrolling
	var preSize = Vector2.ZERO
	for i in range(items.size()):
		var item = items[i]
		if i != 0:
			if is_left():
				offset.x += preSize.x
			elif is_right():
				offset.x -= item.size.x
			elif is_up():
				offset.y += preSize.y
			else: # down
				offset.y -= item.size.y
		# 更新位置
		item.position = offset
		preSize = item.size


## 方便计算, 把数字归一
func _number_normalized(number) -> int:
	if number == 0: return 0
	return 1 if number > 0 else -1


## val > min_val and val < max_val
func _between(val, min_val, max_val) -> bool:
	return val > min_val and val < max_val
