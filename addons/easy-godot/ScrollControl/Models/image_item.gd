@tool
class_name AGTextureItem extends AGResourceItem


## 纹理文件
@export var texture: Texture2D

func load_resource() -> Resource:
	return texture
