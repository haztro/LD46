extends Knight

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
	var mouse_pos = get_viewport().get_mouse_position() * 4
	var origin = get_viewport().size / 2.0
	var dir = (origin - mouse_pos).normalized()

	body_dest_angle = dir.angle() + PI/2.0
		
func _input(event):
	
	if event is InputEventMouseButton:
		if (event.is_pressed() and event.button_index == BUTTON_LEFT):
			attack()

			

