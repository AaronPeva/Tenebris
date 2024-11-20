## 滚动项
class_name AGScrollItem extends Node2D


## 窗口的size, 当res_item 的size 为 ZERO 时, 使用!
var screen_size: Vector2

## 滚动的尺寸, 一般是节点的Size
var size: Vector2:
	get():
		if res_item.size.is_equal_approx(Vector2.ZERO):
			return screen_size
		return res_item.size
	set(val):
		res_item.size = size

## 资源 item
var res_item: AGResourceItem

## 滚动的节点
var node: CanvasItem

## 是否需要复用? true 用完后会添加到下次使用!
var need_to_reuse: bool = false

## 是否要添加到父节点?
var need_add_to_parent := false


func _init(res: AGResourceItem, size: Vector2) -> void:
	res_item = res
	screen_size = size
	add_child_if_needed()


func _ready() -> void:
	add_child_if_needed()


func add_to_if_needed(node: Node) -> void:
	if need_add_to_parent:
		if not get_parent():
			node.add_child(self)
		need_add_to_parent = false


func add_child_if_needed(res := res_item) -> Node2D:
	if res == null or node != null:
		return
	
	var resource = res_item.load_resource()
	if resource == null:
		return
	
	# 移除旧的
	for child in get_children():
		remove_child(child)
	
	# 添加新的
	if is_instance_of(resource, Texture2D):
		var sprite = Sprite2D.new()
		sprite.centered = false
		sprite.texture = resource
		add_child(sprite)
		node = sprite
		
		# 自动加载尺寸
		if res.size.is_equal_approx(Vector2.ZERO) \
		and res.auto_get_size:
			res.size = sprite.texture.get_size()
		
	else:
		var scene = resource.instantiate()
		add_child(scene)
		node = scene
		
		# 自动加载尺寸
		if res.size.is_equal_approx(Vector2.ZERO) \
		and res.auto_get_size:
			if node.has_method("get_size"):
				res.size = node.get_size()
	
	return node
