@tool
class_name AGFileItem extends AGResourceItem


## 场景文件位置
@export_file("*.tscn") var file: String

var _tscn: Resource

func load_resource() -> Resource:
	if _tscn == null:
		_tscn = load(file)
	return _tscn
