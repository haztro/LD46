extends KinematicBody2D
class_name Knight

var direction = Vector2(0, 0)
var ACCEL = 15
var MAX_SPEED = 100
var motion = Vector2(0, 0)
var velocity = Vector2(0, 0)

var weapon 

var body_dest_angle = 0
var body_current_angle = 0

var head_current_angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if direction == Vector2(0, 0):
		apply_friction(ACCEL)
	else:
		apply_movement(direction * ACCEL)
	motion = move_and_slide(motion)

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2(0, 0)

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)

func attack():
	$right_hand/MeleeWeapon.attack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$head.rotation = lerp_angle(head_current_angle, body_dest_angle-rotation, 0.4)
	head_current_angle = $head.rotation
	
	rotation = lerp_angle(body_current_angle, body_dest_angle, 0.5)
	body_current_angle = rotation



