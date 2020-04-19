extends Knight

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_input():

	direction = Vector2(0, 0)
	
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1

	direction = direction.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()

	var screen_scale = (get_viewport().size / get_viewport_rect().size)
	var mouse_pos = get_viewport().get_mouse_position() * screen_scale
	var scaled_pos = get_global_transform_with_canvas().origin * screen_scale
	var dir = (scaled_pos - mouse_pos).normalized()

	body_dest_angle = dir.angle() + PI/2.0
	
	rotate_head(0.3)
	rotate_body(0.4)

		
func _input(event):
	
	if event is InputEventMouseButton:
		if (event.is_pressed() and event.button_index == BUTTON_LEFT):
			attack()

			

