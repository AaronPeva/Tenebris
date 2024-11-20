@tool
extends EditorPlugin

func _enter_tree():
	var script = preload("ScrollControl/infinite_scroll_2d.gd")
	var icon = preload("ScrollControl/class_icon.png")
	add_custom_type("AGInfiniteScroll2D", "Control", script, icon)

func _exit_tree():
	remove_custom_type("AGInfiniteScroll2D")
