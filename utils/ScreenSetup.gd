extends Node

# don't forget to use stretch mode 'viewport' and aspect 'ignore'
onready var viewport = get_viewport()

func _ready():
	get_tree().connect("screen_resized", self, "_screen_resized")
	OS.set_window_size(Vector2(256*4, 144*4))
	#OS.set_window_size(Vector2(64 * 3, 128 * 3))
	_screen_resized()

func _screen_resized():
	var window_size = OS.get_window_size()
	
	# Work out the relationship between window size 
	# and resolution
	var scale_x = window_size.x / viewport.size.x

	# use the smaller scale with 1x minimum scale
	# find the coordinate we will use to center the viewport inside the window
	var diff = window_size - (viewport.size * scale_x)
	viewport.size.y += diff.y / scale_x
	
	if int(viewport.size.x) % 2 != 0:
		viewport.size.x += 1
	if int(viewport.size.y) % 2 != 0:
		viewport.size.y += 1
	
	var view_rect = Rect2(0, 0, viewport.size.x * scale_x, viewport.size.y * scale_x)
	
	# attach the viewport to the rect we calculated
	viewport.set_attach_to_screen_rect(view_rect)
