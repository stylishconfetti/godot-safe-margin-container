extends MarginContainer

export(bool) var safe_margins = true
onready var last_size = get_viewport_rect().size
var initial_margins


func _enter_tree():
	initial_margins = [margin_top, margin_left, margin_bottom, margin_right]
	apply_margins()


func _process(delta):
	var current_size = get_viewport_rect().size
	if last_size.x - current_size.x != 0:
		last_size = current_size
		apply_margins()


func apply_margins():
	if safe_margins:
		var device_safe_area = OS.get_window_safe_area()
		var window_size = OS.window_size
		var viewport_size = get_viewport_rect().size
		
		var margin_x = round((device_safe_area.position.x / window_size.x) * viewport_size.x)
		var margin_y = round((device_safe_area.position.y / window_size.y) * viewport_size.y)
		var margin_width = round(viewport_size.x - margin_x - ((device_safe_area.size.x / window_size.x) * viewport_size.x))
		var margin_height = round(viewport_size.y - margin_y - ((device_safe_area.size.y / window_size.y) * viewport_size.y))
	
		margin_top = initial_margins[0] + margin_y
		margin_left = initial_margins[1] + margin_x
		margin_bottom = initial_margins[2] - margin_height
		margin_right = initial_margins[3] - margin_width
