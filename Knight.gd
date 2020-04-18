extends KinematicBody2D
class_name Knight

var weapon 

var body_dest_angle = 0
var body_current_angle = 0

var head_current_angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func attack():
	$right_hand/MeleeWeapon.attack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	rotation = lerp_angle(body_current_angle, body_dest_angle, 0.5)
	body_current_angle = rotation

	$head.rotation = lerp_angle(head_current_angle, body_dest_angle-rotation, 0.4)
	head_current_angle = $head.rotation

