tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("SafeMarginContainer", "MarginContainer", preload("res://addons/safe_margin_container/safe_margin_container.gd"), preload("res://addons/safe_margin_container/SafeMarginContainer.svg"))


func _exit_tree():
	remove_custom_type("SafeMarginContainer")	
