extends Knight


export (float) var speed = 100
var _look_at = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var mouse_pos = get_viewport().get_mouse_position() * 4
	var origin = get_viewport().size / 2.0
	var dir = (origin - mouse_pos).normalized()

	body_dest_angle = dir.angle() + PI/2.0
	
	var mov_dir = Vector2(0, 0)

	
	if (Input.is_key_pressed(KEY_A)):
		mov_dir.x -= 1
	if (Input.is_key_pressed(KEY_D)):
		mov_dir.x += 1
	if (Input.is_key_pressed(KEY_W)):
		mov_dir.y -= 1
	if (Input.is_key_pressed(KEY_S)):
		mov_dir.y += 1
		
	position += mov_dir * speed * delta
		
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		attack()
		
func _input(event):
	
	if event is InputEventMouseButton:
		if (event.is_pressed() and event.button_index == BUTTON_LEFT):
			attack()

			
#func rotate_owner(delta):
#
#	var offset = ((owner._target.global_position - owner._look_at).normalized() * TURN_SPEED) * delta
#
#	owner._look_at += offset
#	owner.look_at(owner._look_at)
		

